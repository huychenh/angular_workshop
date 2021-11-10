import { Component, EventEmitter, Output } from "@angular/core";
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { ITaskDto } from "../interfaces/iTaskDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { ITaskResponse } from "../interfaces/iTaskResponse";
import { ITaskEvent } from "../interfaces/iTaskEvent";

@Component({
    selector: 'app-tasknewlist',    
    templateUrl: './tasknewlist.component.html',
    styleUrls: ['./tasknewlist.component.css']
})

export class TaskNewListComponent {
   
    //Declare variables.
    private httpProtocol: HttpClient;    
    public tasks: ITaskDto[] = [];

    public notification: INotificationDto = {
        id: 0,
        notificationCode: 0,
        infoMessage: "",
        errorMessage: "",
        detailErrorMessage: []
    };
    
    public taskStatus: string = "New";
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

    //Using Output to send message to Parent Component
    @Output() eventToEmit = new EventEmitter<ITaskEvent>();
    
    constructor(http: HttpClient) {
        this.httpProtocol = http;
    }

    ngOnInit(): void {
        //Get the list.
        this.getAll(this.taskStatus);
    }

    /**
     * 
     * @param action: action Mode (mode_list | mode_add | mode_edit)
     * @param taskId: taskId 
     */
    public actionTask(action: string, taskId: number = 0): void {        
        var taskEvent: ITaskEvent = {
            taskId : taskId,
            actionMode : action
        };
        this.eventToEmit.emit(taskEvent);
    }

     /**
     * Get the task list by status = 'New'.
     */
    public getAll(status: string): void {
        this.isLoading = true;
        this.httpProtocol.get<ITaskResponse>(this.apiBaseUrl + 'task/listByStatus/' + status).subscribe(result => {        
        this.tasks = result.tasks;
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
}