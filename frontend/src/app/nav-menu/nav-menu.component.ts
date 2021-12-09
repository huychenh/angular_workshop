import { Component } from "@angular/core";
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
    public user: any;

    constructor(private authService: AuthService) { }

    ngOnInit() {
        this.getUserLogin();
    }

    private async getUserLogin() {
        this.isLoggedIn = <boolean>await this.authService.isLoggedIn();
        if (this.isLoggedIn) {
            this.user = await this.authService.getUserAsync();
        }
    }

    public collapse(): void {
        this.isExpanded = false;
    }

    public toggle(): void {
        this.isExpanded = !this.isExpanded;
    }
}