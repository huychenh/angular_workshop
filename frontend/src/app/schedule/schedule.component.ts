import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { INotificationDto } from "../interfaces/iNotificationDto";

import { IScheduleDto } from '../interfaces/iScheduleDto';
import { IScheduleResponse } from '../interfaces/iScheduleResponse';

@Component({
  selector: 'app-schedule-component',
  templateUrl: './schedule.component.html'
})

export class ScheduleComponent {
  
  //Declare variables.
  private httpProtocol: HttpClient;    
  public schedules: IScheduleDto[] = [];
  
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
  public editId: number = 0;
  
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
