import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { GlobalComponent } from "../global.component";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { IScheduleDto } from '../interfaces/iScheduleDto';
import { IScheduleResponse } from '../interfaces/iScheduleResponse';
import { IScheduleCreate } from '../interfaces/IScheduleCreate';
import { IScheduleDelete } from '../interfaces/IScheduleDelete';

@Component({
  selector: 'app-schedule-component',
  templateUrl: './schedule.component.html'
})

export class ScheduleComponent {
  
  //Declare variables.
  private httpProtocol: HttpClient;    
  public schedules: IScheduleDto[] = [];
  public datePickerFormat = 'yyyy-MM-dd HH:mm';

  public dCreateTimeStart = new Date();
  public dCreateTimeEnd = new Date();
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
  public scheduleDto: IScheduleDto = this.scheduleObject();  
  public enableErrorNotification: boolean = false;  
  
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
      this.schedules = result.schedules;
      
      this.isLoading = false;
      this.enableErrorNotification = false;
      this.infoMessage = "";

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

    }, errorResponse => {
        //handle errors
        if (errorResponse.status >= 400) {
            var arrays = errorResponse.error.errors;
            this.errors = this.setErrors(arrays);
        }        
    });
  }  

  /**
  * Close error notification
  */
  public closeNotify(isErrorNotify: boolean = false): void {
    if(isErrorNotify) {
        this.enableErrorNotification = false;
    } else {
        this.infoMessage = "";
    }
  }

  /**
   * Add forms
   */
   public add() {

    //Default
    this.errors = [];
    this.enableErrorNotification = false;
    this.infoMessage = "";
    this.isLoading = false;

    //constructor categoryDto
    this.scheduleDto = this.scheduleObject();

    this.dCreateTimeStart = new Date();
    this.dCreateTimeEnd = new Date();
  };

  /**
     * Save schedule
     * @param scheduleDto : IScheduleDto
     */
   public create(scheduleDto: IScheduleDto): void {   

    var model: IScheduleCreate = {
      title: scheduleDto.title,
      creator: scheduleDto.creator,
      description: scheduleDto.description,
      location: scheduleDto.location,
      timeStart: "",
      timeEnd: "",
      wsUserId: 1
    };

      //timeStart
      var year = 0, month = 0, day = 0, hour = 0, minute = 0;
      year = this.dCreateTimeStart.getFullYear();
      month = this.dCreateTimeStart.getMonth() + 1;
      day = this.dCreateTimeStart.getDate();
      hour = this.dCreateTimeStart.getHours();
      minute = this.dCreateTimeStart.getMinutes();    
      
      model.timeStart = `${year}-${month}-${day} ${hour}:${minute}`;

      //timeEnd
      year = this.dCreateTimeEnd.getFullYear();
      month = this.dCreateTimeEnd.getMonth() + 1;
      day = this.dCreateTimeEnd.getDate();
      hour = this.dCreateTimeEnd.getHours();
      minute = this.dCreateTimeEnd.getMinutes();

      model.timeEnd = `${year}-${month}-${day} ${hour}:${minute}`;

      
      this.httpProtocol.post<IScheduleResponse>(`${this.apiBaseUrl}schedule/create`, model, this.httpOptions).subscribe(result => {
        
        this.notification = result.notification;    
        if (this.notification.notificationCode == 200) {
  
          //Sucess
          this.infoMessage = this.notification.infoMessage;
          this.errors = [];
          this.enableErrorNotification = false;
  
          //Re-constructor
          this.scheduleDto = this.scheduleObject(); 

          //Reload list
          this.getAll();
          
        } else {
  
          //Error
          var arrays = this.notification.detailErrorMessage;
          this.errors = this.setErrors(arrays);
          this.enableErrorNotification = true;
          this.infoMessage = "";
        }
      }, errorResponse => {
        //handle errors
        if (errorResponse.status >= 400) {
          var arrays = errorResponse.error.errors;
          this.errors = this.setErrors(arrays);
          this.enableErrorNotification = true;
          this.infoMessage = "";
        }
      });
  };

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
      this.dTimeStart =  new Date(this.scheduleDto.timeStart);
      this.dTimeEnd =  new Date(this.scheduleDto.timeEnd);

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
        
    var model : IScheduleDelete = {
      id: scheduleDto.id,
      modifiedBy: "System"
    };

    this.httpProtocol.put<IScheduleResponse>(`${this.apiBaseUrl}schedule/delete`, model, this.httpOptions).subscribe(result => {
      //var res = result;
      this.notification = result.notification;

      if (this.notification.notificationCode == 200) {

        //Sucess
        this.infoMessage = this.notification.infoMessage;            
        this.errors = [];
        this.enableErrorNotification = false;    

        //Re-constructor
        this.scheduleDto = this.scheduleObject();

        //Reload list
        this.getAll();

      } else {

        //Error
        var arrays = this.notification.detailErrorMessage;
        this.errors = this.setErrors(arrays);
        this.enableErrorNotification = true;
        this.infoMessage = "";
      }
    }, errorResponse => {
      //handle errors
      if (errorResponse.status >= 400) {
        var arrays = errorResponse.error.errors;
        this.errors = this.setErrors(arrays);
        this.enableErrorNotification = true;
        this.infoMessage = "";
      }
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
        createdDate: "",
        createdBy: "",
        modifiedDate: "",
        modifiedBy: "",
        isActive: false,
        isDeleted: false      
    };

    return obj;
  };

}
