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


import { UserComponent } from './user/user.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { LoginComponent } from './login/login.component';

import { UserInfoComponent } from './user/userInfo.component';


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
    LoginComponent,
    UserInfoComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),    
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
