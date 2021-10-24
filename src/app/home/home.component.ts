import { Component } from "@angular/core";

@Component({
    selector: 'app-home',    
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']    
})

export class HomeComponent {
    isList: boolean = false;
    isAdd: boolean = false;
    isEdit: boolean = false;

    constructor() {
        this.isList = true;
        this.isAdd = false;
        this.isEdit = false;
    }
}