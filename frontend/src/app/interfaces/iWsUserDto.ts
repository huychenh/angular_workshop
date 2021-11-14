/**
 * Interface for WsUser
 */
 export interface IWsUserDto {
    id: number;    
    fullName: string;
    jobRole: string; 
    
    createdDate: string;
    createdBy: string;
    modifiedDate: string;
    modifiedBy: string;
    isActive: boolean;
    isDeleted: boolean;
 }