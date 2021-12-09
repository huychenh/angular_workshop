import { Component, EventEmitter, Input, Output, OnInit } from "@angular/core";

import { ITaskDto } from "../interfaces/iTaskDto";
import { ITaskEvent } from "../interfaces/iTaskEvent";
import { ITaskDelete } from "../interfaces/iTaskDelete";
import { TaskService } from "./task.service";

@Component({
    selector: 'app-taskedit',
    templateUrl: './taskedit.component.html',
    styleUrls: ['./taskedit.component.css'],
    providers: [TaskService]
})

export class TaskEditComponent implements OnInit {

    //Declare variables.
    public taskDto: ITaskDto = this.taskObject();
    private taskService: TaskService;

    public errors: string[] = [];
    public infoMessage: string = "";

    //taskId from HomeParent
    @Input() taskId: string = "0";

    //Using Output to send message to Parent Component
    @Output() eventToEmit = new EventEmitter<ITaskEvent>();

    constructor(service: TaskService) {
        this.taskService = service;
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
            taskId: 0,
            actionMode: action
        };

        this.eventToEmit.emit(taskEvent);
    }

    /**
     * Save task
     * @param taskDto : ITaskDto
     */
    public save(taskDto: ITaskDto): void {
        this.taskService.edit(taskDto).subscribe(result => {
            this.callbackHandler("EDIT", result);
        }, (errorResponse): void => {
            this.callbackHandler("EDIT", null, errorResponse);
        });
    };

    /**
     * Delete Task
     * @param taskDto : ITaskDto
     */
    public delete(taskDto: ITaskDto): void {

        if (!confirm("Are you sure you want to delete this task?")) {
            return;
        }

        var model: ITaskDelete = {
            id: taskDto.id,
            modifiedBy: "System"
        };

        this.taskService.delete(model).subscribe(result => {
            this.callbackHandler("DELETE", result);

            //Auto call back function
            setTimeout(() => {
                this.back('mode_list');
            }, 3000);

        }, (errorResponse): void => {
            this.callbackHandler("DELETE", null, errorResponse);
        });
    };


    /**
     * Get the task details by id.
     */
    public details(id: number): void {

        this.taskService.details(id).subscribe(result => {

            this.callbackHandler("DETAILS", result);
        }, (errorResponse): void => {

            this.callbackHandler("DETAILS", null, errorResponse);
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
        if (isErrorNotify) {
            this.errors = [];
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
                    }  else {
                        let arrays = notification.detailErrorMessage;
                        this.errors = this.setErrors(arrays);
                        this.infoMessage = "";
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