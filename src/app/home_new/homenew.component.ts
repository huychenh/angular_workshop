import { Component } from "@angular/core";

@Component({
    selector: 'app-homenew',    
    templateUrl: './homenew.component.html',
    styleUrls: ['./homenew.component.css']
})

export class HomeNewComponent {
   
    constructor() {}

    addTask() {
        //Send message to home.component to set mode = AddTask
    }
}