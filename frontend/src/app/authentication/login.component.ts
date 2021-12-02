import { Component, OnInit } from '@angular/core';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-login-component',
  templateUrl: './login.component.html',
  providers: [AuthService]
})

export class LoginComponent implements OnInit {

  private authService: AuthService;

  constructor(service: AuthService) {
    this.authService = service;
  }

  ngOnInit() {

    let isLoggedIn = this.authService.isLoggedIn();

    if (!isLoggedIn) {
      this.authService.login();
    }

  }

}

