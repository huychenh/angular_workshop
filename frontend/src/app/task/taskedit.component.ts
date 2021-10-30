import { Component, EventEmitter, Input, Output, OnInit } from "@angular/core";
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { ITaskDto } from "../interfaces/iTaskDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { ITaskResponse } from "../interfaces/iTaskResponse";
import { ITaskEvent } from "../interfaces/iTaskEvent";
import { ITaskDelete } from "../interfaces/iTaskDelete";

@Component({
    selector: 'app-taskedit',    
    templateUrl: './taskedit.component.html',
    styleUrls: ['./taskedit.component.css']
})

export class TaskEditComponent implements OnInit{   

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

    //taskId from HomeParent
    @Input() taskId: string = "0";
    
    //Using Output to send message to Parent Component
    @Output() eventToEmit = new EventEmitter<ITaskEvent>();
    
    constructor(http: HttpClient) {
        this.httpProtocol = http;
        this.errors = [];
        this.enableErrorNotification = false;        
    }

    ngOnInit() {        
        //Get the task detail        
        this.details(parseInt(this.taskId));
    }

    /**
     * 
     * @param action 
     */
    public back(action: string): void {
        var taskEvent: ITaskEvent = {
            taskId : 0,
            actionMode : action
        };

        this.eventToEmit.emit(taskEvent);        
    }

    /**
     * Save task
     * @param taskDto : ITaskDto
     */
    public save(taskDto: ITaskDto): void {
        taskDto.createdDate = "";
        taskDto.modifiedDate = "";
        
        this.httpProtocol.put<ITaskResponse>(`${this.apiBaseUrl}task/edit`, taskDto, this.httpOptions).subscribe(result => {
          //var res = result;
          this.notification = result.notification;
    
          if (this.notification.notificationCode == 200) {
    
            //Sucess
            this.infoMessage = this.notification.infoMessage;
            this.errors = [];
            this.enableErrorNotification = false;    
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
     * Delete Task
     * @param taskDto : ITaskDto
     */
    public delete(taskDto: ITaskDto): void {

        if(!confirm("Are you sure you want to delete this task?")) {
            return;
        }

        var model = this.taskDeleteObject();
        model.id = taskDto.id;
        model.modifiedBy = "System";

        this.httpProtocol.put<ITaskResponse>(`${this.apiBaseUrl}task/delete`, model, this.httpOptions).subscribe(result => {
          //var res = result;
          this.notification = result.notification;
    
          if (this.notification.notificationCode == 200) {
    
            //Sucess
            this.infoMessage = this.notification.infoMessage;            
            this.errors = [];
            this.enableErrorNotification = false;    

            //Auto call back function
            setTimeout(() => {
                this.back('mode_list');
            }, 3000);

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
     * Get the task details by id.
     */
    public details(id: number): void {
        this.httpProtocol.get<ITaskResponse>(`${this.apiBaseUrl}task/details/${id}`).subscribe(result => {
        this.taskDto = result.task;

        }, errorResponse => {
            //handle errors
            if (errorResponse.status >= 400) {
                var arrays = errorResponse.error.errors;
                this.errors = this.setErrors(arrays);
            }        
        });
    }

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
     * Re-constructor the object.
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
     * Task Delete Object
     * @returns : ITaskDelete
     */
    private taskDeleteObject(): ITaskDelete {
        var obj: ITaskDelete = {
            id: -1,            
            modifiedBy: ""            
        };
        return obj;
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
}