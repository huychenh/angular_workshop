import { Component } from "@angular/core";

import { ITaskDto } from "../interfaces/iTaskDto";
import { TaskService } from "./task.service";

@Component({
    selector: 'app-taskdonelist',
    templateUrl: './taskdonelist.component.html',
    styleUrls: ['./taskdonelist.component.css'],
    providers: [TaskService]
})

export class TaskDoneListComponent {

    isShown: boolean = false; // hidden by default

    //Declare variables.
    public tasks: ITaskDto[] = [];
    public taskDto: ITaskDto = this.taskObject();

    public taskStatus: string = "Done";
    public errors: string[] = [];
    public infoMessage: string = "";
    public isLoading: boolean = false;

    public isActiveTaskItem: boolean = false;
    public idActiveTaskItem: number = 0;


    private taskService: TaskService;

    constructor(service: TaskService) {
        this.taskService = service;
    }

    ngOnInit() {
        //Get the list.
        this.getAll(this.taskStatus);
    }

    /**
     * Get the task list by status = 'Progress'.
     */
    public getAll(status: string): void {

        this.taskService.getListByStatus(status).subscribe(result => {        
            this.callbackHandler("LISTBYSTATUS", result);
        }, (errorResponse): void => {        
            this.callbackHandler("LISTBYSTATUS", null, errorResponse);
        });
    }

    /**
     * Re-constructor the task object.
     */
    private taskObject(): ITaskDto {

        var model: ITaskDto = {
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

        return model;
    };

    /**
     * toggleShow function
     */
    public toggleShow(): void {
        this.isShown = !this.isShown;
        this.isActiveTaskItem = this.isShown;
        this.idActiveTaskItem = 0;
    }

    /**
     * Get the task by id
     * @param id 
     */
    public detail(id: number) {
        this.idActiveTaskItem = id;
        this.isActiveTaskItem = true;
        this.isShown = true;
        this.isLoading = true;

        this.taskService.details(id).subscribe(result => {
            this.callbackHandler("DETAILS", result);
        }, (errorResponse): void => {
            this.callbackHandler("DETAILS", null, errorResponse);       
        });
    }

    /**
     * Process active task item
     * @param id : TaskId
     * @returns 
     */
    public isActiveItem(id: number) {
        return (id == this.idActiveTaskItem && this.isActiveTaskItem);
    }



    /**
     * 
     * @param action : string - CREATE | EDIT | DELETE | DETAILS
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
                    }
                }

                break;

            case "LISTBYSTATUS":

                if (result != null && result != undefined) {
                    this.tasks = result.tasks;               
                }
                break;

            default: //case "DETAILS"
                if (result != null && result != undefined) {
                    this.taskDto = result.task;
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

        if (result.length == 0) {
            result.push("Something went wrong! " + errorArr.InternalError);
        }
        return result;
    }

}