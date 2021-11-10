import { Component, EventEmitter, Output } from "@angular/core";
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { GlobalComponent } from "../global.component";
import { ITaskDto } from "../interfaces/iTaskDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { ITaskResponse } from "../interfaces/iTaskResponse";
import { ITaskEvent } from "../interfaces/iTaskEvent";

@Component({
    selector: 'app-taskprogresslist',    
    templateUrl: './taskprogresslist.component.html',
    styleUrls: ['./taskprogresslist.component.css']
})

export class TaskProgressListComponent {   

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
    
    public listLength: number = 0;
    public taskStatus: string = "Progress";
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

    ngOnInit() {
        //Get the list.
        this.getAll(this.taskStatus);
    } 

    /**
     * Get the task list by status = 'Progress'.
     */
     public getAll(status: string): void {
        this.isLoading = true;
        this.httpProtocol.get<ITaskResponse>(this.apiBaseUrl + 'task/listByStatus/' + status).subscribe(result => {        
        this.tasks = result.tasks;
        this.listLength = this.tasks.length;
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
     * Set errors for the error array.
     */
    private setErrors(errorArr: any) {
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