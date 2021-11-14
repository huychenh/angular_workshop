import { Component, Input } from '@angular/core';
import { IWsUserDto } from '../interfaces/iWsUserDto';


@Component({
  selector: 'user-card',
  templateUrl: './userInfo.component.html'
})

export class UserInfoComponent {
  
  //Declare variables.
  @Input() actionMode: string = "mode_list";
  // @Input() wsUserDto: IWsUserDto = this.wsUserObject();
      
  constructor() {    
  }

  /**
   * Re-constructor the user object.
   */
  // private wsUserObject(): IWsUserDto {

  //   var obj: IWsUserDto = {
  //       id: -1,  
  //       fullname: "",
  //       jobRole: "",

  //       createdDate: "",
  //       createdBy: "",
  //       modifiedDate: "",
  //       modifiedBy: "",
  //       isActive: false,
  //       isDeleted: false      
  //   };

  //   return obj;
  // };

  public schedule() : void {

  }

}
