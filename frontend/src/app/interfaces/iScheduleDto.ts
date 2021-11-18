/**
 * Interface for schedule
 */
 export interface IScheduleDto {
    id: number;    
    title: string;
    creator: string; 
    description: string;
    location: string;
    timeStart: string;
    timeEnd: string;
    wsUserId: number;
    
    createdDate: string;
    createdBy: string;
    modifiedDate: string;
    modifiedBy: string;
    isActive: boolean;
    isDeleted: boolean;
 } 