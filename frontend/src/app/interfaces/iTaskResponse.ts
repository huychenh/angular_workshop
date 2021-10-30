import { INotificationDto } from "./iNotificationDto";
import { ITaskDto } from "./iTaskDto";

/**
 * Interface for TaskResponse
 */
export interface ITaskResponse {
    notification: INotificationDto;
    tasks: ITaskDto[];
    task: ITaskDto;
}