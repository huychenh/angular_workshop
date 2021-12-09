import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { UserComponent } from './user/user.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { LoginComponent } from './authentication/login.component';
import { LoginCallBackComponent } from './authentication/login-callback.component';
import { LogoutComponent } from './authentication/logout.component';
import { LogoutCallBackComponent } from './authentication/logout-callback.component';
import { AuthGuardService } from './authentication/auth-guard.service';


const routes: Routes = [
  { path: '', component: HomeComponent, pathMatch: 'full' },
  {
    path: 'user', component: UserComponent, canActivate: [AuthGuardService]
  },
  {
    path: 'schedule', component: ScheduleComponent, canActivate: [AuthGuardService]
  },
  { path: 'login', component: LoginComponent },
  { path: 'login-callback', component: LoginCallBackComponent },
  { path: 'logout', component: LogoutComponent },
  { path: 'logout-callback', component: LogoutCallBackComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
