import { Component } from '@angular/core';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-logout-component',
  templateUrl: './logout.component.html',
  providers: [AuthService]
})

export class LogoutComponent {

  private authService: AuthService;

  constructor(service: AuthService) {
    this.authService = service;
  }

  ngOnInit() {

    // let isLoggedIn = this.authService.isLoggedIn();

    // if (isLoggedIn) {
    //   this.authService.startAuthentication();
    // }

    this.authService.logout();
  }

}
