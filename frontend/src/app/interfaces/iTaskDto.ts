/**
 * Interface for Task
 */
export interface ITaskDto {
   id: number;
   title: string;
   description: string;  
   status: string;  
   createdDate: string;
   createdBy: string;
   modifiedDate: string;
   modifiedBy: string;
   isActive: boolean;
   isDeleted: boolean;
}