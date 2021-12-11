import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-logout-callback-component',
  templateUrl: './logout-callback.component.html', 
  providers: [AuthService]
})

export class LogoutCallBackComponent implements OnInit {

  constructor(private router: Router, private authService: AuthService) {        
  }
  
  ngOnInit() {
    this.authService.logoutCompleteAsync(window.location.href);
    this.router.navigate(['/']);
  }
}
