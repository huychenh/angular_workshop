import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-logout-callback-component',
  templateUrl: './logout-callback.component.html', 
  providers: [AuthService]
})

export class LogoutCallBackComponent implements OnInit {

  private router: Router;
  private authService: AuthService;

  constructor(route: Router, service: AuthService) {    
    this.router = route;
    this.authService = service;
  }
  
  ngOnInit() {
    this.authService.logoutCompleteAsync(window.location.href);
    this.router.navigate(['/']);
  }


}
