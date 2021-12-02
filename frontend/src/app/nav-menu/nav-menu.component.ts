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
    public claims: any;
    private authService: AuthService;

    constructor(service: AuthService) {
        this.authService = service;
    }

    ngOnInit() {
        this.authService.getUser().then(async user => {
            this.claims = user?.access_token;
        });        
    }

    public collapse(): void {
        this.isExpanded = false;
    }

    public toggle(): void {
        this.isExpanded = !this.isExpanded;
    }
}