import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { IWsUserDto } from "../interfaces/iWsUserDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { IWsUserResponse } from "../interfaces/iWsUserResponse";

@Component({
  selector: 'app-user-component',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})

export class UserComponent {
  
  //Declare variables.
  private httpProtocol: HttpClient;    
  public wsUsers: IWsUserDto[] = [];

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
    * Get the user list
    */
  public getAll(): void {
    this.isLoading = true;
    this.httpProtocol.get<IWsUserResponse>(`${this.apiBaseUrl}WsUser/list`).subscribe(result => {        
    this.wsUsers = result.wsUsers;
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


  public isEvenIndex(index: number): boolean {
    if(index % 2 == 0) {
      return true;
    }
    return false;
  }

  /**
    * Set errors for the error array.
    */
  private setErrors(errorArr: any): any[] {
    var result = [];

    if (errorArr.hasOwnProperty("Fullname")) {
    var nameErrors = errorArr["Fullname"];
    for (var item in nameErrors) {
        result.push(nameErrors[item]);
    }
    }

    if (result.length == 0) {
    result.push("Something went wrong! " + errorArr.InternalError);
    }
    return result;
  }

  public add(): void {  
  }
}
