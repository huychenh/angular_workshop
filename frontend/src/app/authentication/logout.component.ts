import { Component } from '@angular/core';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-logout-component',
  templateUrl: './logout.component.html',
  providers: [AuthService]
})

export class LogoutComponent {

  constructor(private authService: AuthService) { }

  ngOnInit() {
    this.authService.logout();
  }

}
