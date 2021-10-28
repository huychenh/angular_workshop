export interface INotificationDto {
    id: number;
    notificationCode: number;
    infoMessage: string;
    errorMessage: string;
    detailErrorMessage: string[];
}