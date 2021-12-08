import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';

import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';

import { TaskCreateComponent } from './task/taskcreate.component';
import { TaskDoneListComponent } from './task/taskdonelist.component';
import { TaskEditComponent } from './task/taskedit.component';
import { TaskNewListComponent } from './task/tasknewlist.component';
import { TaskProgressListComponent } from './task/taskprogresslist.component';

import { UserInfoComponent } from './user/userInfo.component';
import { OwlDateTimeModule, OwlNativeDateTimeModule } from 'ng-pick-datetime';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { DateFilterPipe } from './date-filter.pipe';
import { DatePipe } from '@angular/common';

import { UserComponent } from './user/user.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { LoginComponent } from './authentication/login.component';
import { LoginCallBackComponent } from './authentication/login-callback.component';
import { LogoutCallBackComponent } from './authentication/logout-callback.component';
import { LogoutComponent } from './authentication/logout.component';
import { AuthService } from './authentication/auth.service';
import { AuthGuardService } from './authentication/auth-guard.service';



@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    TaskCreateComponent,
    TaskDoneListComponent,
    TaskEditComponent,
    TaskNewListComponent,
    TaskProgressListComponent,
    UserComponent,
    ScheduleComponent,    
    UserInfoComponent,
    DateFilterPipe,
    LoginComponent,
    LoginCallBackComponent,
    LogoutCallBackComponent,
    LogoutComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),    
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    OwlDateTimeModule, 
    OwlNativeDateTimeModule,
    BrowserAnimationsModule
  ],
  providers: [DatePipe, AuthService, AuthGuardService],
  bootstrap: [AppComponent]
})
export class AppModule {}
