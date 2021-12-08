import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-login-component',
  templateUrl: './login.component.html',
  providers: [AuthService]
})

export class LoginComponent implements OnInit {

  public isLoggedIn: boolean = false;

  constructor(private authService: AuthService, private activatedRoute: ActivatedRoute, private router: Router) { }

  ngOnInit() {

    // this.activatedRoute.queryParamMap.subscribe(() => {
      
    //   if (!this.authService.isLoggedIn()) {
    //     this.authService.login();
    //   }
    // });

    this.getLogin();
  }

  private async getLogin() {
    this.isLoggedIn = <boolean>await this.authService.isLoggedIn();
    console.log("login component - this.isLoggedIn: " + this.isLoggedIn);
    if (!this.isLoggedIn) {
      this.authService.login();
    } else {
      this.router.navigate(['/']);
    }
  }

}

