export interface ITaskDto {
   id: number;
   title: string;
   description: string;  
   createdDate: string;
   createdBy: string;
   modifiedDate: string;
   modifiedBy: string;
   isActive: boolean;
   isDeleted: boolean;
}