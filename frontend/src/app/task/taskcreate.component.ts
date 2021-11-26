import { Component, EventEmitter, Output } from "@angular/core";

import { ITaskDto } from "../interfaces/iTaskDto";
import { ITaskCreate } from "../interfaces/iTaskCreate";
import { ITaskEvent } from "../interfaces/iTaskEvent";
import { TaskService } from "./task.service";

@Component({
    selector: 'app-taskcreate',
    templateUrl: './taskcreate.component.html',
    styleUrls: ['./taskcreate.component.css'],
    providers: [TaskService]
})

export class TaskCreateComponent {

    //Declare variables.
    private taskService: TaskService;
    public taskDto: ITaskDto = this.taskObject();

    public errors: string[] = [];
    public infoMessage: string = "";

    //Using Output to send message to Parent Component
    @Output() eventToEmit = new EventEmitter<ITaskEvent>();

    constructor(service: TaskService) {
        this.taskService = service;
    }

    /**
     * Back function
     * @param action : string
     */
    public back(action: string): void {
        var taskEvent: ITaskEvent = {
            taskId: 0,
            actionMode: action
        };
        this.eventToEmit.emit(taskEvent);
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
     * Save task
     * @param taskDto : ITaskDto
     */
    public save(taskDto: ITaskDto) {
        var model: ITaskCreate = {
            title: taskDto.title,
            description: taskDto.description,
            status: taskDto.status !== '' ? taskDto.status : "New"
        };

        this.taskService.create(model).subscribe(result => {

            this.callbackHandler("CREATE", result);
        }, (errorResponse): void => {

            this.callbackHandler("CREATE", null, errorResponse);
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
        if (isErrorNotify) {
            this.errors = [];
        } else {
            this.infoMessage = "";
        }
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