import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-login-callback-component',
  templateUrl: './login-callback.component.html',
  providers: [AuthService]
})

export class LoginCallBackComponent implements OnInit {

  private authService: AuthService;
  private router: Router;

  constructor(service: AuthService, route: Router) {
    this.authService = service;
    this.router = route;
  }

  ngOnInit() {
    this.loginComplete();
  }

  private async loginComplete(): Promise<void> {    
    await this.authService.loginComplete(window.location.href);    

    this.router.navigate(['/'], {
      queryParams: { isLoggedIn: true }
    });

    //this.router.navigate(['/']);
  }


}
