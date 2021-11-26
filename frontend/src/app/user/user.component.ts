import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';

import { GlobalComponent } from "../global.component";
import { IWsUserDto } from "../interfaces/iWsUserDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { IWsUserResponse } from "../interfaces/iWsUserResponse";
import { IWsUserCreate } from '../interfaces/iWsUserCreate';
import { IWsUserDelete } from '../interfaces/iWsUserDelete';
import { UserService } from './user.service';

@Component({
  selector: 'app-user-component',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css'],
  providers: [UserService]
})

export class UserComponent {

  //Declare variables.
  public wsUsers: IWsUserDto[] = [];
  public groupUsers: IWsUserDto[][] = [];
  public errors: string[] = [];
  public infoMessage: string = "";
  public isLoading: boolean = false;

  public actionMode: string = "mode_list";
  public wsUserDto: IWsUserDto = this.wsUserObject();
  public enableErrorNotification: boolean = false;
  public editId: number = 0;
  private router: Router;


  private userService: UserService;

  constructor(service: UserService, route: Router) {
    this.userService = service;
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

    this.userService.getAll().subscribe(result => {
      this.callbackHandler("LIST", result);
    }, (errorResponse): void => {
      this.callbackHandler("LIST", null, errorResponse);
    });
  }

  public groupArray<T>(data: Array<T>, n: number): Array<T[]> {
    let group = new Array<T[]>();

    for (let i = 0, j = 0; i < data.length; i++) {
      if (i >= n && i % n === 0)
        j++;
      group[j] = group[j] || [];
      group[j].push(data[i])
    }

    return group;
  }


  public isEvenIndex(index: number): boolean {
    if (index % 2 == 0) {
      return true;
    }
    return false;
  }



  //Add
  public add(): void {

    this.actionMode = "mode_add";
    this.wsUserDto = this.wsUserObject();

    //Find an item ID = -1
    var objTemp = this.wsUsers.find(k => k.id == -1);
    if (objTemp != null) {
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
    this.userService.edit(wsUserDto).subscribe(result => {
      this.callbackHandler("EDIT", result);
    }, (errorResponse): void => {
      this.callbackHandler("EDIT", null, errorResponse);
    });
  };


  /**
     * Save user
     * @param userDto : IWsUserDto
     */
  public create(wsUserDto: IWsUserDto): void {

    let model: IWsUserCreate = {
      fullName: wsUserDto.fullName,
      jobRole: wsUserDto.jobRole
    };

    this.userService.create(model).subscribe(result => {
      this.callbackHandler("CREATE", result);
    }, (errorResponse): void => {
      this.callbackHandler("CREATE", null, errorResponse);
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

    if (this.actionMode == "mode_add") {
      this.wsUsers.splice(0, 1);
      this.wsUsers = this.sortData(this.wsUsers);

      //Process to display list  
      this.groupUsers = this.groupArray(this.wsUsers, 4);
    }

    this.actionMode = "mode_list";

    //Close all notifications
    this.closeNotify(false);
    this.closeNotify(true);
  }

  /**
    * Close error notification
    */
  public closeNotify(isErrorNotify: boolean = false): void {
    if (isErrorNotify) {
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
    
    //Close all notifications
    this.closeNotify(false);
    this.closeNotify(true);

    this.userService.details(id).subscribe(result => {
      this.callbackHandler("DETAILS", result);
    }, (errorResponse): void => {
      this.callbackHandler("DETAILS", null, errorResponse);
    });

  }

  /**
     * Delete User
     * @param wsUserDto : IWsUserDto
     */
  public delete(wsUserDto: IWsUserDto): void {

    if (!confirm(`Are you sure you want to remove ${wsUserDto.fullName}?`)) {
      return;
    }

    var model: IWsUserDelete = {
      id: wsUserDto.id,
      modifiedBy: "System"
    };

    this.userService.delete(model).subscribe(result => {
      this.callbackHandler("DELETE", result);
    }, (errorResponse): void => {
      this.callbackHandler("DELETE", null, errorResponse);
    });
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
     * 
     * @param action : string - CREATE | EDIT | DELETE | DETAILS | LIST
     * @param result : any
     * @param errorResponse : any
     */
  private callbackHandler(action: string, result: any = null, errorResponse: any = null): void {

    switch (action) {

      case "CREATE":
      case "EDIT":
      case "DELETE":

        if (result != null && result != undefined) {
          let notification = result.notification;
          if (notification.notificationCode == 200) {

            //Sucess
            this.infoMessage = notification.infoMessage;
            this.errors = [];

            //Reload list
            this.getAll();
          }
        }

        break;

      case "LIST":

        if (result != null && result != undefined) {
          this.wsUsers = this.sortData(result.wsUsers);

          //Process to display list  
          this.groupUsers = this.groupArray(this.wsUsers, 4);
        }
        break;

      default: //case "DETAILS"
        if (result != null && result != undefined) {
          this.wsUserDto = result.wsUser;
        }
        break;
    }

    //errorResponse
    if (errorResponse != null && errorResponse != undefined) {
      if (errorResponse.status >= 400) {
        var arrays = errorResponse.error.errors;
        this.errors = this.setErrors(arrays);
        this.infoMessage = "";
      }
    }
    this.isLoading = false;
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

}
