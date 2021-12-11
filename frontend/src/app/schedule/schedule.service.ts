import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

import { GlobalComponent } from '../global.component';
import { IScheduleResponse } from '../interfaces/iScheduleResponse';

@Injectable()
export class ScheduleService {

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
        return this.httpProtocol.post<IScheduleResponse>(`${this.apiBaseUrl}schedule/create`, model, this.httpOptions);
    }

    /**
     * edit
     * @param model 
     * @returns 
     */
    public edit(model: any): Observable<any> {
        return this.httpProtocol.put<IScheduleResponse>(`${this.apiBaseUrl}schedule/edit`, model, this.httpOptions);
    }

    /**
     * edit
     * @param model 
     * @returns 
     */
    public delete(model: any): Observable<any> {
        return this.httpProtocol.put<IScheduleResponse>(`${this.apiBaseUrl}schedule/delete`, model, this.httpOptions);
    }

    /**
     * detail
     * @param id : number
     * @returns 
     */
    public details(id: number): Observable<any> {
        return this.httpProtocol.get<IScheduleResponse>(`${this.apiBaseUrl}schedule/details/${id}`);
    }

    /**
     * getAll
     * @returns 
     */
    public getListByUser(userId: number = 0): Observable<any> {
        return this.httpProtocol.get<IScheduleResponse>(`${this.apiBaseUrl}schedule/listByUser/${userId}`);
    }
}