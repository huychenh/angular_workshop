import { Component } from "@angular/core";

@Component({
    selector: 'app-home',    
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']    
})

export class HomeComponent {

    isModeList: boolean = false;
    isModeAdd: boolean = false;
    isModeEdit: boolean = false;

    actionMode: string = "";


    constructor() {
        this.isModeList = true;
        this.isModeAdd = false;
        this.isModeEdit = false;
    }

    getModeMessage(message: string) {
        this.actionMode = message;

        switch(this.actionMode) {
            case "mode_add": 
                this.isModeList = false;
                this.isModeAdd = true;
                this.isModeEdit = false;
            break;

            case "mode_edit": 
                this.isModeList = false;
                this.isModeAdd = false;
                this.isModeEdit = true;
            break;

            default:
                this.isModeList = true;
                this.isModeAdd = false;
                this.isModeEdit = false;
            break;
        }
    }
}