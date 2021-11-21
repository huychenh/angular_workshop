import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { INotificationDto } from "../interfaces/iNotificationDto";

import { IScheduleDto } from '../interfaces/iScheduleDto';
import { IScheduleResponse } from '../interfaces/iScheduleResponse';



/**
 * Declare js functions.
 */
 declare function mappingDateTimeForObject(arrJSON: IScheduleDto[]): IScheduleDto[];
 declare function convertJsonToDateTime(datetimeValue: string, format: string): string;

@Component({
  selector: 'app-schedule-component',
  templateUrl: './schedule.component.html'
})

export class ScheduleComponent {
  
  //Declare variables.
  private httpProtocol: HttpClient;    
  public schedules: IScheduleDto[] = [];
  public datePickerFormat = 'yyyy-MM-dd HH:mm';
  public dTimeStart = new Date();
  public dTimeEnd = new Date();
  
  public notification: INotificationDto = {
      id: 0,
      notificationCode: 0,
      infoMessage: "",
      errorMessage: "",
      detailErrorMessage: []
  };
  
  public errors: string[] = [];
  public infoMessage: string = "";
  public isLoading: boolean = false;
  public apiBaseUrl: string = GlobalComponent.apiBaseUrl;

  public actionMode: string = "mode_list";
  public sheduleDto: IScheduleDto = this.scheduleObject();  
  public enableErrorNotification: boolean = false;  
  public scheduleDto: IScheduleDto = this.scheduleObject();
  private defaultFormatDateTime: string = "yyyy-mm-dd HH:MM:ss";
  
  
  //Default headers for http.
  private httpOptions = {
      headers: new HttpHeaders({
      "Content-Type": "application/json"
      })
  };

  constructor(http: HttpClient) {
    this.httpProtocol = http;
  }

  ngOnInit() {
    //Get the list.
    this.getAll();
  }



  /**
    * Get the list
    */
  public getAll(): void {      
      this.isLoading = true;
      this.httpProtocol.get<IScheduleResponse>(`${this.apiBaseUrl}schedule/list`).subscribe(result => {              
      this.schedules = mappingDateTimeForObject(result.schedules);
      
      this.isLoading = false;
      }, errorResponse => {
      //handle errors
      if (errorResponse.status >= 400) {
          var arrays = errorResponse.error.errors;
          this.errors = this.setErrors(arrays);
      }

      this.isLoading = false;
    });
  }

  /**
     * Get details by id.
     */
   public details(id: number): void {
    
    this.httpProtocol.get<IScheduleResponse>(`${this.apiBaseUrl}schedule/details/${id}`).subscribe(result => {
    this.scheduleDto = result.schedule;

    this.scheduleDto.createdDate = convertJsonToDateTime(this.scheduleDto.createdDate, this.defaultFormatDateTime);
    this.scheduleDto.modifiedDate = convertJsonToDateTime(this.scheduleDto.modifiedDate, this.defaultFormatDateTime);

    this.scheduleDto.timeStart = convertJsonToDateTime(this.scheduleDto.timeStart, this.datePickerFormat);
    this.scheduleDto.timeEnd = convertJsonToDateTime(this.scheduleDto.timeEnd, "yyyy-mm-dd HH:MM");

    }, errorResponse => {
        //handle errors
        if (errorResponse.status >= 400) {
            var arrays = errorResponse.error.errors;
            this.errors = this.setErrors(arrays);
        }        
    });
  }

  /**
   * The active checkbox event changed.
   * @param isChecked
   */
   public activeChanged(isChecked: boolean) {
    this.scheduleDto.isActive = isChecked;
  }

  /**
   * The deleted checkbox event changed.
   * @param isChecked
   */
  public deletedChanged(isChecked: boolean) {
    this.scheduleDto.isDeleted = isChecked;
  }

  /**
   * Edit - Open edit form.
   */
   public editConfirm(id: number) {
    var buttonDetailClose = document.getElementById("ButtonDetailClose");
    if (buttonDetailClose != null) {
      buttonDetailClose.click();
    }

    //Default
    this.errors = [];
    this.infoMessage = "";

    //Get data from servers.
    this.httpProtocol.get<IScheduleResponse>(this.apiBaseUrl + 'schedule/details/' + id).subscribe(result => {

      //The category object.
      this.scheduleDto = result.schedule;
      this.scheduleDto.createdDate = convertJsonToDateTime(this.scheduleDto.createdDate, this.defaultFormatDateTime);
      this.scheduleDto.modifiedDate = convertJsonToDateTime(this.scheduleDto.modifiedDate, this.defaultFormatDateTime);
      this.dTimeStart = new Date(this.scheduleDto.timeStart);
      this.dTimeEnd = new Date(this.scheduleDto.timeEnd);

    }, errorResponse => {
      //handle errors
      if (errorResponse.status >= 400) {
        var arrays = errorResponse.error.errors;
        this.errors = this.setErrors(arrays);
      }
      this.isLoading = false;
    });
  };

  /**
   * Edit
   */
   public edit(scheduleDto: IScheduleDto) {
    this.isLoading = true;
    
    //timeStart
    var year = 0, month = 0, day = 0, hour = 0, minute = 0;
    year = this.dTimeStart.getFullYear();
    month = this.dTimeStart.getMonth() + 1;
    day = this.dTimeStart.getDate();
    hour = this.dTimeStart.getHours();
    minute = this.dTimeStart.getMinutes();    
    
    scheduleDto.timeStart = `${year}-${month}-${day} ${hour}:${minute}`;

    //timeEnd
    year = this.dTimeEnd.getFullYear();
    month = this.dTimeEnd.getMonth() + 1;
    day = this.dTimeEnd.getDate();
    hour = this.dTimeEnd.getHours();
    minute = this.dTimeEnd.getMinutes();    

    scheduleDto.timeEnd = `${year}-${month}-${day} ${hour}:${minute}`;
    
    this.httpProtocol.put<IScheduleResponse>(`${this.apiBaseUrl}schedule/edit`, scheduleDto, this.httpOptions).subscribe(result => {
      var res = result;
      this.notification = res.notification;

      if (this.notification.notificationCode == 200) {

        //Sucess
        this.infoMessage = this.notification.infoMessage;
        this.errors = [];

        this.getAll();
        var buttonEditClose = document.getElementById("ButtonEditClose");
        if (buttonEditClose != null) {
          buttonEditClose.click();
        }

        //constructor scheduleDto
        this.scheduleDto = this.scheduleObject();
      } else {

        //Error
        var arrays = this.notification.detailErrorMessage;
        this.errors = this.setErrors(arrays);
      }
      this.isLoading = false;
    }, errorResponse => {
      //handle errors
      if (errorResponse.status >= 400) {
        var arrays = errorResponse.error.errors;
        this.errors = this.setErrors(arrays);
      }
      this.isLoading = false;
    });

  };

  /**
   * Delete - Open confirm delete form.
   */
   public deleteConfirm(id: number) {

    var buttonDetailClose = document.getElementById("ButtonDetailClose");
    if (buttonDetailClose != null) {
      buttonDetailClose.click();
    }

    //Default
    this.errors = [];
    this.infoMessage = "";

    //Get data from servers.
    this.httpProtocol.get<IScheduleResponse>(this.apiBaseUrl + 'schedule/details/' + id).subscribe(result => {

      //The scheduleDto object.
      this.scheduleDto = result.schedule;
      this.scheduleDto.createdDate = convertJsonToDateTime(this.scheduleDto.createdDate, this.defaultFormatDateTime);
      this.scheduleDto.modifiedDate = convertJsonToDateTime(this.scheduleDto.modifiedDate, this.defaultFormatDateTime);

    }, errorResponse => {
      //handle errors
      if (errorResponse.status >= 400) {
        var arrays = errorResponse.error.errors;
        this.errors = this.setErrors(arrays);
      }
      this.isLoading = false;
    });
  };

  /**
   * Delete
   */
  public delete(scheduleDto: IScheduleDto) {
    scheduleDto.createdDate = "";
    scheduleDto.modifiedDate = "";

    this.httpProtocol.post<IScheduleResponse>(this.apiBaseUrl + 'schedule/delete/' + scheduleDto.id, this.httpOptions).subscribe(result => {
      var res = result;
      this.notification = res.notification;

      if (this.notification.notificationCode == 200) {

        //Sucess
        this.infoMessage = this.notification.infoMessage;
        this.errors = [];

        this.getAll();
        var buttonDeleteClose = document.getElementById("ButtonDeleteClose");
        if (buttonDeleteClose != null) {
          buttonDeleteClose.click();
        }
      } else {

        //Error
        var arrays = this.notification.detailErrorMessage;
        this.errors = this.setErrors(arrays);
      }

    }, errorResponse => {
      //handle errors
      if (errorResponse.status >= 400) {
        var arrays = errorResponse.error.errors;
        this.errors = this.setErrors(arrays);
      }

      this.isLoading = false;
    });
  };

  /**
    * Set errors for the error array.
    */
   private setErrors(errorArr: any): any[] {
    var result = [];

    if (errorArr.hasOwnProperty("Title")) {
    var nameErrors = errorArr["Title"];
    for (var item in nameErrors) {
        result.push(nameErrors[item]);
    }
    }

    if (result.length == 0) {
    result.push("Something went wrong! " + errorArr.InternalError);
    }
    return result;
  }


  /**
     * Re-constructor the object.
     */
   private scheduleObject(): IScheduleDto {

    var obj: IScheduleDto = {
        id: -1,
        title: "",
        creator: "",
        description: "",
        location: "",
        timeStart: "",
        timeEnd: "",
        wsUserId: -1,
        
        createdDate: new Date().toString(),
        createdBy: "",
        modifiedDate: new Date().toString(),
        modifiedBy: "",
        isActive: false,
        isDeleted: false      
    };

    return obj;
  };


}
