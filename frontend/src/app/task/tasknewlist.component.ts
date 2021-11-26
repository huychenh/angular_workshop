import { Component, EventEmitter, Output } from "@angular/core";

import { ITaskDto } from "../interfaces/iTaskDto";
import { ITaskEvent } from "../interfaces/iTaskEvent";
import { TaskService } from "./task.service";

@Component({
    selector: 'app-tasknewlist',
    templateUrl: './tasknewlist.component.html',
    styleUrls: ['./tasknewlist.component.css'],
    providers: [TaskService]
})

export class TaskNewListComponent {

    //Declare variables.
    public tasks: ITaskDto[] = [];
    public taskStatus: string = "New";
    public errors: string[] = [];
    public infoMessage: string = "";
    public isLoading: boolean = false;


    //Using Output to send message to Parent Component
    @Output() eventToEmit = new EventEmitter<ITaskEvent>();

    private taskService: TaskService;

    constructor(service: TaskService) {
        this.taskService = service;
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
            taskId: taskId,
            actionMode: action
        };
        this.eventToEmit.emit(taskEvent);
    }

    /**
    * Get the task list by status = 'New'.
    */
    public getAll(status: string): void {
        this.isLoading = true;

        this.taskService.getListByStatus(status).subscribe(result => {
            this.callbackHandler("LISTBYSTATUS", result);
        }, (errorResponse): void => {
            this.callbackHandler("LISTBYSTATUS", null, errorResponse);
        });
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