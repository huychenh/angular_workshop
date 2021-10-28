import { Component } from "@angular/core";
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { ITaskDto } from "../interfaces/iTaskDto";
import { INotificationDto } from "../interfaces/iNotificationDto";
import { ITaskResponse } from "../interfaces/iTaskResponse";

@Component({
    selector: 'app-taskdonelist',    
    templateUrl: './taskdonelist.component.html',
    styleUrls: ['./taskdonelist.component.css']
})

export class TaskDoneListComponent {   

    isShown: boolean = false ; // hidden by default
    
    //Declare variables.
    private httpProtocol: HttpClient;    
    public tasks: ITaskDto[] = [];
    public task: ITaskDto = {
        id: 0,
        title: "",
        description: "",
        createdDate: "",
        createdBy: "",
        modifiedDate: "",
        modifiedBy: "",
        isActive: false,
        isDeleted: false
    };

    public notification: INotificationDto = {
        id: 0,
        notificationCode: 0,
        infoMessage: "",
        errorMessage: "",
        detailErrorMessage: []
    };
    
    public listLength: number = 0;
    public taskStatus: string = "Done";
    public errors: string[] = [];
    public infoMessage: string = "";
    public isLoading: boolean = false;
    public apiBaseUrl: string = "https://localhost:44363/api/";

    //Default headers for http.
    private httpOptions = {
        headers: new HttpHeaders({
        "Content-Type": "application/json"
        })
    };


    constructor(http: HttpClient) {
        this.httpProtocol = http;
    
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

    public toggleShow() {
        this.isShown = !this.isShown;
    }

    /**
     * Get the task by id
     * @param id 
     */
    public detail(id: number) {
        this.isShown = true;
        this.isLoading = true;

        this.httpProtocol.get<ITaskResponse>(this.apiBaseUrl + 'task/details/' + id).subscribe(result => {
            this.isLoading = false;
            this.task = result.task;        
        }, errorResponse => {
            //handle errors
            if (errorResponse.status >= 400) {
                var arrays = errorResponse.error.errors;
                this.errors = this.setErrors(arrays);
            }
            this.isLoading = false;
        });
    }

}