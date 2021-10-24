import { Component } from "@angular/core";

@Component({
    selector: 'app-homedone',    
    templateUrl: './homedone.component.html',
    styleUrls: ['./homedone.component.css']
})

export class HomeDoneComponent {   

    isShown: boolean = true ; // hidden by default
    
    constructor() {}

    toggleShow() {
        this.isShown = !this.isShown;
    }

    detail() {
        this.isShown = true;
    }

}