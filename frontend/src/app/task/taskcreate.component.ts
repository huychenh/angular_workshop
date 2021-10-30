import { Component, EventEmitter, Output } from "@angular/core";
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { ITaskDto } from "../interfaces/iTaskDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { ITaskResponse } from "../interfaces/iTaskResponse";
import { ITaskCreate } from "../interfaces/iTaskCreate";
import { ITaskEvent } from "../interfaces/iTaskEvent";

@Component({
    selector: 'app-taskcreate',    
    templateUrl: './taskcreate.component.html',
    styleUrls: ['./taskcreate.component.css']
})

export class TaskCreateComponent {   

    //Declare variables.
    private httpProtocol: HttpClient;
    public taskDto: ITaskDto = this.taskObject();

    public notification: INotificationDto = {
        id: 0,
        notificationCode: 0,
        infoMessage: "",
        errorMessage: "",
        detailErrorMessage: []
    };
    
    public errors: string[] = [];
    public enableErrorNotification: boolean = false;
    public infoMessage: string = "";    
    public apiBaseUrl: string = GlobalComponent.apiBaseUrl;

    //Default headers for http.
    private httpOptions = {
        headers: new HttpHeaders({
            "Content-Type": "application/json"
        })
    };

    //Using Output to send message to Parent Component
    @Output() eventToEmit = new EventEmitter<ITaskEvent>();

    constructor(http: HttpClient) {
        this.httpProtocol = http;
        this.errors = [];
        this.enableErrorNotification = false;
    }

    /**
     * Back function
     * @param action : string
     */
    public back(action: string): void {
        var taskEvent: ITaskEvent = {
            taskId : 0,
            actionMode : action
        };
        this.eventToEmit.emit(taskEvent);        
    }

    /**
     * Re-constructor the create task.
     */
    private taskCreateObject(): any {
        var obj: ITaskCreate = {
            title: "",
            description: "",
            status: "New"      
        };
        return obj;
    };

    /**
     * Re-constructor the task object.
     */
    private taskObject(): ITaskDto {

        var obj: ITaskDto = {
            id: -1,
            title: "",
            description: "",
            status: "",
            createdDate: "",
            createdBy: "",
            modifiedDate: "",
            modifiedBy: "",
            isActive: false,
            isDeleted: false      
        };

        return obj;
    };

    /**
     * Save task
     * @param taskDto : ITaskDto
     */
    public save(taskDto: ITaskDto): void {        
        var model = this.taskCreateObject();
        model.title = taskDto.title;
        model.description = taskDto.description;
        model.status = taskDto.status !== '' ? taskDto.status : "New";
        model.createdBy = "System";
        model.modifiedBy = "System";

        this.httpProtocol.post<ITaskResponse>(`${this.apiBaseUrl}task/create`, model, this.httpOptions).subscribe(result => {
          
          this.notification = result.notification;    
          if (this.notification.notificationCode == 200) {
    
            //Sucess
            this.infoMessage = this.notification.infoMessage;
            this.errors = [];
            this.enableErrorNotification = false;
    
            //Re-constructor
            this.taskDto = this.taskObject();
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
     * Process radio status changed.
     * @param value: status value
     */
    public statusChanged(value: string): void {
        this.taskDto.status = value;
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
}