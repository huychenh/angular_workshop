import { Component } from '@angular/core';

@Component({
  selector: 'app-schedule-component',
  templateUrl: './schedule.component.html'
})

export class ScheduleComponent {
  public currentCount = 0;

  public incrementCounter() {
    this.currentCount++;
  }
}
