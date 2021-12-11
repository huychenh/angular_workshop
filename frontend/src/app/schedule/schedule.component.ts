import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { IScheduleDto } from '../interfaces/iScheduleDto';
import { IScheduleCreate } from '../interfaces/IScheduleCreate';
import { IScheduleDelete } from '../interfaces/IScheduleDelete';
import { ScheduleService } from './schedule.service';
import { AuthService } from '../authentication/auth.service';
import { UserService } from '../user/user.service';
import { IWsUserDto } from '../interfaces/iWsUserDto';

@Component({
  selector: 'app-schedule-component',
  templateUrl: './schedule.component.html',
  providers: [ScheduleService, UserService]
})

export class ScheduleComponent {

  //Declare variables.
  public schedules: IScheduleDto[] = [];
  public wsUsers: IWsUserDto[] = [];
  public datePickerFormat = 'yyyy-MM-dd HH:mm';

  public dCreateTimeStart = new Date();
  public dCreateTimeEnd = new Date();
  public dTimeStart = new Date();
  public dTimeEnd = new Date();

  public errors: string[] = [];
  public infoMessage: string = "";
  public modalErrors: string[] = [];

  public isLoading: boolean = false;
  public scheduleDto: IScheduleDto = this.scheduleObject();
  public userId: number = 0;
  private user: any;

  constructor(private scheduleService: ScheduleService,
    private activeRouter: ActivatedRoute,
    private authService: AuthService,
    private userService: UserService) {
  }

  ngOnInit() {

    this.activeRouter.queryParams.subscribe((params): void => {
      this.userId = params['userId'];
    });

    //Get the list by userId
    this.getAll();

    this.getUserLogin();
  }

  private async getUserLogin(): Promise<void> {
    this.user = await this.authService.getUserAsync();
  }


  /**
    * Get the list
    */
  public getAll(): void {
    this.isLoading = true;

    this.scheduleService.getListByUser(this.userId != undefined ? this.userId : 0).subscribe(result => {
      this.callbackHandler("LISTBYUSER", result);
    }, (errorResponse): void => {
      this.callbackHandler("LISTBYUSER", null, errorResponse);
    });

  }

  /**
    * Get the list of WsUser
    */
  public getAllWsUser(): void {
    this.isLoading = true;

    this.userService.getAll().subscribe(result => {
      this.callbackHandler("LISTUSER", result);
    }, (errorResponse): void => {
      this.callbackHandler("LISTUSER", null, errorResponse);
    });

  }

  /**
     * Get details by id.
     */
  public details(id: number): void {

    this.scheduleService.details(id).subscribe(result => {
      this.callbackHandler("DETAILS", result);
    }, (errorResponse): void => {
      this.callbackHandler("DETAILS", null, errorResponse);
    });
  }

  /**
  * Close error notification
  */
  public closeNotify(isErrorNotify: boolean = false): void {
    if (isErrorNotify) {
      this.errors = [];
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
    this.modalErrors = [];
    this.infoMessage = "";
    this.isLoading = false;

    //constructor categoryDto
    this.scheduleDto = this.scheduleObject();

    this.dCreateTimeStart = new Date();
    this.dCreateTimeEnd = new Date();

    this.getAllWsUser();
  };

  /**
     * Save schedule
     * @param scheduleDto : IScheduleDto
     */
  public create(scheduleDto: IScheduleDto): void {

    let createdBy: string = "System";
    if (this.user != undefined && this.user != null) {
      createdBy = this.user.profile.name;
    }

    var model: IScheduleCreate = {
      title: scheduleDto.title,
      creator: scheduleDto.creator,
      description: scheduleDto.description,
      location: scheduleDto.location,
      timeStart: "",
      timeEnd: "",
      wsUserId: this.scheduleDto.wsUser.id,
      createdBy: createdBy
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

    this.scheduleService.create(model).subscribe(result => {
      this.callbackHandler("CREATE", result);
    }, (errorResponse): void => {
      this.callbackHandler("CREATE", null, errorResponse);
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
  public editConfirm(id: number): void {

    //Default
    this.errors = [];
    this.infoMessage = "";

    //Load list wsUsers
    this.getAllWsUser();

    this.scheduleService.details(id).subscribe(result => {
      this.callbackHandler("DETAILS", result);
    }, (errorResponse): void => {
      this.callbackHandler("DETAILS", null, errorResponse);
    });


  };

  /**
   * Edit
   */
  public edit(scheduleDto: IScheduleDto): void {
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

    let modifiedBy: string = "System";
    if (this.user != undefined && this.user != null) {
      modifiedBy = this.user.profile.name;
    }

    scheduleDto.wsUserId = scheduleDto.wsUser.id;
    scheduleDto.modifiedBy = modifiedBy;

    this.scheduleService.edit(scheduleDto).subscribe(result => {
      this.callbackHandler("EDIT", result);
    }, (errorResponse): void => {
      this.callbackHandler("EDIT", null, errorResponse);
    });

  };

  /**
   * Delete - Open confirm delete form.
   */
  public deleteConfirm(id: number) {

    //Default
    this.errors = [];
    this.infoMessage = "";

    this.scheduleService.details(id).subscribe(result => {
      this.callbackHandler("DETAILS", result);
    }, (errorResponse): void => {
      this.callbackHandler("DETAILS", null, errorResponse);
    });

  };

  /**
   * Delete
   */
  public delete(scheduleDto: IScheduleDto) {

    let modifiedBy: string = "System";
    if (this.user != undefined && this.user != null) {
      modifiedBy = this.user.profile.name;
    }
    var model: IScheduleDelete = {
      id: scheduleDto.id,
      modifiedBy: modifiedBy
    };

    this.scheduleService.delete(model).subscribe(result => {
      this.callbackHandler("DELETE", result);
    }, (errorResponse): void => {
      this.callbackHandler("DELETE", null, errorResponse);
    });

  };

  /**
     * Re-constructor the object.
     */
  private scheduleObject(): IScheduleDto {

    var model: IScheduleDto = {
      id: -1,
      title: "",
      creator: "",
      description: "",
      location: "",
      timeStart: "",
      timeEnd: "",
      wsUserId: -1,
      wsUser: {
        id: 0,
        fullName: "",
        jobRole: "",
        createdDate: "",
        createdBy: "",
        modifiedDate: "",
        modifiedBy: "",
        isActive: false,
        isDeleted: false
      },
      createdDate: "",
      createdBy: "",
      modifiedDate: "",
      modifiedBy: "",
      isActive: false,
      isDeleted: false
    };

    return model;
  };

  /**
   * closeModal event
   * @param buttonId : ButtonCreateClose| ButtonDetailClose | ButtonEditClose | ButtonDeleteClose
   */
  private closeModal(buttonId: string): void {
    var buttonClose = document.getElementById(buttonId);
    if (buttonClose != null) {
      buttonClose.click();
    }
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

        this.errors = [];

        if (result != null && result != undefined) {
          let notification = result.notification;
          if (notification.notificationCode == 200) {

            //Sucess
            this.infoMessage = notification.infoMessage;
            this.modalErrors = [];

            //Reload list
            this.getAll();
            this.closeModal("ButtonCreateClose");
          }
          else {

            //Error
            var arrays = notification.detailErrorMessage;
            this.modalErrors = this.setErrors(arrays);
            this.infoMessage = "";
          }
        }

        break;

      case "EDIT":

        if (result != null && result != undefined) {
          let notification = result.notification;
          if (notification.notificationCode == 200) {

            //Sucess
            this.infoMessage = notification.infoMessage;
            this.errors = [];

            //Reload list
            this.getAll();
            this.closeModal("ButtonEditClose");
          }
        }

        break;

      case "DELETE":

        if (result != null && result != undefined) {
          let notification = result.notification;
          if (notification.notificationCode == 200) {

            //Sucess
            this.infoMessage = notification.infoMessage;
            this.errors = [];

            //Reload list
            this.getAll();
            this.closeModal("ButtonDeleteClose");
          }
        }

        break;

      case "LISTBYUSER":

        if (result != null && result != undefined) {
          this.schedules = result.schedules;
        }
        break;

      case "LISTUSER":

        if (result != null && result != undefined) {
          this.wsUsers = result.wsUsers;
          this.scheduleDto.wsUser = {
            id: this.wsUsers[0].id,
            fullName: this.wsUsers[0].fullName,
            jobRole: "",
            createdDate: "",
            createdBy: "",
            modifiedDate: "",
            modifiedBy: "",
            isActive: false,
            isDeleted: false
          };
        }
        break;

      default: //case "DETAILS"

        if (result != null && result != undefined) {
          this.scheduleDto = result.schedule;
          this.dTimeStart = new Date(this.scheduleDto.timeStart);
          this.dTimeEnd = new Date(this.scheduleDto.timeEnd);
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

    if (errorArr.hasOwnProperty("Title")) {
      var nameErrors = errorArr["Title"];
      for (var item in nameErrors) {
        result.push(nameErrors[item]);
      }
    }

    if (errorArr.hasOwnProperty("Creator")) {
      var nameErrors = errorArr["Creator"];
      for (var item in nameErrors) {
        result.push(nameErrors[item]);
      }
    }

    if (errorArr.hasOwnProperty("Location")) {
      var nameErrors = errorArr["Location"];
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
