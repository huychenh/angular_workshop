import { Component } from "@angular/core";
import { AuthService } from "../authentication/auth.service";
import { ITaskEvent } from "../interfaces/iTaskEvent";

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']    
})

export class HomeComponent {

    public isModeList: boolean = false;
    public isModeAdd: boolean = false;
    public isModeEdit: boolean = false;

    private actionMode: string = "";

    //taskId to send to taskedit component
    public taskId: string = "";

    constructor() {
        this.isModeList = true;
        this.isModeAdd = false;
        this.isModeEdit = false;
    }   

    /**
     * Process action mode: mode_list | mode_add | mode_edit
     * @param taskEvent : ITaskEvent
     */
    public getEvent(taskEvent: ITaskEvent): void {
        this.actionMode = taskEvent.actionMode;

        switch (this.actionMode) {
            case "mode_add":
                this.isModeList = false;
                this.isModeAdd = true;
                this.isModeEdit = false;
                break;

            case "mode_edit":
                this.isModeList = false;
                this.isModeAdd = false;
                this.isModeEdit = true;
                this.taskId = taskEvent.taskId.toString();
                break;

            default:
                this.isModeList = true;
                this.isModeAdd = false;
                this.isModeEdit = false;
                break;
        }
    }

}