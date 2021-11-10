import { INotificationDto } from "./iNotificationDto";
import { IWsUserDto } from "./iWsUserDto";

/**
 * Interface for IWsUserResponse
 */
export interface IWsUserResponse {
    notification: INotificationDto;
    wsUsers: IWsUserDto[];
    wsUser: IWsUserDto;
}