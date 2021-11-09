import { INotificationDto } from "./iNotificationDto";
import { ICompanyUserDto } from "./iUserDto";

/**
 * Interface for ICompanyUserResponse
 */
export interface ICompanyUserResponse {
    notification: INotificationDto;
    companyUsers: ICompanyUserDto[];
    companyUser: ICompanyUserDto;
}