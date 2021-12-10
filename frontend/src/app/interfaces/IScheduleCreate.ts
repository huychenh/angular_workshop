/**
 * Interface for ScheduleCreate. This item will map with ViewModel.
 */
 export interface IScheduleCreate {    
    title: string;
    creator: string; 
    description: string;
    location: string;
    timeStart: string;
    timeEnd: string;
    wsUserId: number;
    createdBy: string; 
}