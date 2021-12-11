import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { ITaskResponse } from '../interfaces/iTaskResponse';
import { GlobalComponent } from '../global.component';
import { Observable } from 'rxjs';

@Injectable()
export class TaskService {

    //Default headers for http.
    private httpOptions = {
        headers: new HttpHeaders({
            "Content-Type": "application/json"
        })
    };

    //API URL
    private apiBaseUrl: string = GlobalComponent.apiBaseUrl;

    constructor(private httpProtocol: HttpClient) {        
    }

    /**
     * create
     * @param model 
     * @returns 
     */
    public create(model: any): Observable<any> {
        return this.httpProtocol.post<ITaskResponse>(`${this.apiBaseUrl}task/create`, model, this.httpOptions);
    }

    /**
     * edit
     * @param model 
     * @returns 
     */
    public edit(model: any): Observable<any> {
        return this.httpProtocol.put<ITaskResponse>(`${this.apiBaseUrl}task/edit`, model, this.httpOptions);
    }

    /**
     * edit
     * @param model 
     * @returns 
     */
     public delete(model: any): Observable<any> {
        return this.httpProtocol.put<ITaskResponse>(`${this.apiBaseUrl}task/delete`, model, this.httpOptions);
    }

    /**
     * detail
     * @param id : number
     * @returns 
     */
    public details(id: number): Observable<any> {
        return this.httpProtocol.get<ITaskResponse>(`${this.apiBaseUrl}task/details/${id}`);
    }

    /**
     * getListByStatus
     * @param status : string
     * @returns 
     */
    public getListByStatus(status: string): Observable<any> {        
        return this.httpProtocol.get<ITaskResponse>(`${this.apiBaseUrl}task/listByStatus/${status}`);
    }
}