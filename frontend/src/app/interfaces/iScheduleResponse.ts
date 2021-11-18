import { INotificationDto } from "./iNotificationDto";
import { IScheduleDto } from "./iScheduleDto";

/**
 * Interface for IScheduleResponse
 */
 export interface IScheduleResponse {
    notification: INotificationDto;
    schedules: IScheduleDto[];
    schedule: IScheduleDto;
}