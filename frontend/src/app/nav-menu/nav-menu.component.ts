import { Component } from "@angular/core";
import { User } from "oidc-client";
import { AuthService } from "../authentication/auth.service";

@Component({
    selector: 'app-nav-menu',
    templateUrl: './nav-menu.component.html',
    styleUrls: ['./nav-menu.component.css'],
    providers: [AuthService]
})

export class NavMenuComponent {
    isExpanded = false;
    public isLoggedIn: boolean = false;
    public email: any = "HuyChenh@gmail.com";

    constructor(private authService: AuthService) { }

    ngOnInit() {        
        // this.authService.getUser().then(user => {
        //     this.token = user?.access_token;
        // });
        this.getLogin();
    }

    private async getLogin() {
        this.isLoggedIn = <boolean> await this.authService.isLoggedIn();
    }

    public collapse(): void {
        this.isExpanded = false;
    }

    public toggle(): void {
        this.isExpanded = !this.isExpanded;
    }
}