/**
 * Interface for CompanyUser
 */
 export interface IWsUserDto {
    id: number;    
    fullname: string;
    jobRole: string; 
    
    createdDate: string;
    createdBy: string;
    modifiedDate: string;
    modifiedBy: string;
    isActive: boolean;
    isDeleted: boolean;
 }