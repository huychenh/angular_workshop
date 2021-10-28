import { INotificationDto } from "./iNotificationDto";
import { ITaskDto } from "./iTaskDto";

export interface ITaskResponse {
    notification: INotificationDto;
    tasks: ITaskDto[];
    task: ITaskDto;
}