import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';

import { GlobalComponent } from "../global.component";
import { IWsUserDto } from "../interfaces/iWsUserDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { IWsUserResponse } from "../interfaces/iWsUserResponse";
import { IWsUserCreate } from '../interfaces/iWsUserCreate';
import { IWsUserDelete } from '../interfaces/iWsUserDelete';

@Component({
  selector: 'app-user-component',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})

export class UserComponent {
  
  //Declare variables.
  private httpProtocol: HttpClient;    
  public wsUsers: IWsUserDto[] = [];
  public groupUsers: IWsUserDto[][] = [];

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
  public wsUserDto: IWsUserDto = this.wsUserObject();
  public enableErrorNotification: boolean = false;
  public editId: number = 0;
  private router: Router;
  
  //Default headers for http.
  private httpOptions = {
      headers: new HttpHeaders({
      "Content-Type": "application/json"
      })
  };

  constructor(http: HttpClient, route: Router) {
    this.httpProtocol = http;
    this.router = route;
  }

  ngOnInit() {
    //Get the list.
    this.getAll();
  }


  /**
    * Get the user list
    */
  public getAll(): void {
      this.actionMode = "mode_list";
      this.isLoading = true;
      this.httpProtocol.get<IWsUserResponse>(`${this.apiBaseUrl}WsUser/list`).subscribe(result => {        
      this.wsUsers = this.sortData(result.wsUsers);
      
      //Process to display list  
      this.groupUsers = this.groupArray(this.wsUsers, 4);

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
  
  public groupArray<T>(data: Array<T>, n: number): Array<T[]> {
    let group = new Array<T[]>();
​
    for (let i = 0, j = 0; i < data.length; i++) {
        if (i >= n && i % n === 0)
            j++;
        group[j] = group[j] || [];
        group[j].push(data[i])
    }
​
    return group;
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

  //Add
  public add(): void {  
    
    this.actionMode = "mode_add";
    this.wsUserDto = this.wsUserObject();

    //Find an item ID = -1
    var objTemp = this.wsUsers.find(k => k.id == -1);
    if(objTemp != null) {
      this.wsUsers[0] = this.wsUserDto; //Replace
    } else {
      this.wsUsers.push(this.wsUserDto);
      this.wsUsers = this.sortData(this.wsUsers);
    }

    //Process to display list  
    this.groupUsers = this.groupArray(this.wsUsers, 4);

    //Close all notifications
    this.closeNotify(false);
    this.closeNotify(true);
  }

  /**
     * Update user
     * @param userDto : IWsUserDto
     */
   public update(wsUserDto: IWsUserDto): void {

    wsUserDto.createdDate = "";
        wsUserDto.modifiedDate = "";
        
        this.httpProtocol.put<IWsUserResponse>(`${this.apiBaseUrl}wsUser/edit`, wsUserDto, this.httpOptions).subscribe(result => {
          //var res = result;
          this.notification = result.notification;
    
          if (this.notification.notificationCode == 200) {
    
            //Sucess
            this.infoMessage = this.notification.infoMessage;
            this.errors = [];
            this.enableErrorNotification = false;    

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
     * Save user
     * @param userDto : IWsUserDto
     */
   public create(wsUserDto: IWsUserDto): void {

    var model = this.wsUserCreateObject();
      model.fullName = wsUserDto.fullName;
      model.jobRole = wsUserDto.jobRole;
      
      this.httpProtocol.post<IWsUserResponse>(`${this.apiBaseUrl}wsUser/create`, model, this.httpOptions).subscribe(result => {
        
        this.notification = result.notification;    
        if (this.notification.notificationCode == 200) {
  
          //Sucess
          this.infoMessage = this.notification.infoMessage;
          this.errors = [];
          this.enableErrorNotification = false;
  
          //Re-constructor
          this.wsUserDto = this.wsUserObject();
  
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
   * schedule
   * @param id : number
   */
  public schedule(id: number): void {
    this.router.navigate(['/schedule/'], {
      queryParams: { userId: id }
   });


  }


  //Cancel
  public cancel(): void {  
    
    this.actionMode = "mode_list";
    this.wsUsers.splice(0, 1);
    this.wsUsers = this.sortData(this.wsUsers);

    //Process to display list  
    this.groupUsers = this.groupArray(this.wsUsers, 4);
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
     * Get the user details by id.
     */
   public details(id: number): void {
    this.actionMode = "mode_edit";
    this.editId = id;

    this.httpProtocol.get<IWsUserResponse>(`${this.apiBaseUrl}wsUser/details/${id}`).subscribe(result => {
    this.wsUserDto = result.wsUser;

    }, errorResponse => {
        //handle errors
        if (errorResponse.status >= 400) {
            var arrays = errorResponse.error.errors;
            this.errors = this.setErrors(arrays);
        }        
    });
}

  /**
     * Delete User
     * @param wsUserDto : IWsUserDto
     */
   public delete(wsUserDto: IWsUserDto): void {

    if(!confirm(`Are you sure you want to remove ${wsUserDto.fullName}?`)) {
        return;
    }

    var model = this.wsUserDeleteObject();
    model.id = wsUserDto.id;
    model.modifiedBy = "System";

    this.httpProtocol.put<IWsUserResponse>(`${this.apiBaseUrl}wsUser/delete`, model, this.httpOptions).subscribe(result => {
      //var res = result;
      this.notification = result.notification;

      if (this.notification.notificationCode == 200) {

        //Sucess
        this.infoMessage = this.notification.infoMessage;            
        this.errors = [];
        this.enableErrorNotification = false;    

        //Re-constructor
        this.wsUserDto = this.wsUserObject();
  
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
   * wsUserDeleteObject
   * @returns IWsUserDelete
   */
   private wsUserDeleteObject(): IWsUserDelete {
    var obj: IWsUserDelete = {
        id: -1,            
        modifiedBy: ""            
    };
    return obj;
  };


  /**
     * Re-constructor the user object.
     */
   private wsUserObject(): IWsUserDto {

    var obj: IWsUserDto = {
        id: -1,
        fullName: "",
        jobRole: "",        
        createdDate: new Date().toString(),
        createdBy: "",
        modifiedDate: new Date().toString(),
        modifiedBy: "",
        isActive: false,
        isDeleted: false      
    };

    return obj;
  };

  /**
   * Sort array data descending by modifiedDate
   * @param array IWsUserDto[]
   * @returns IWsUserDto[]
   */
  private sortData(array: IWsUserDto[]): IWsUserDto[] {    
    return array.sort((a, b) => {
      return <any>new Date(b.modifiedDate) - <any>new Date(a.modifiedDate);
    });
  }

  /**
    * Re-constructor the user.
    */
   private wsUserCreateObject(): any {
    var obj: IWsUserCreate = {
        fullName: "",        
        jobRole: ""
    };
    return obj;
  };

}
