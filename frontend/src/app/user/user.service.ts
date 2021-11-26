import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

import { GlobalComponent } from '../global.component';
import { IWsUserResponse } from '../interfaces/iWsUserResponse';

@Injectable()
export class UserService {

    private httpProtocol: HttpClient;

    //Default headers for http.
    private httpOptions = {
        headers: new HttpHeaders({
            "Content-Type": "application/json"
        })
    };

    //API URL
    private apiBaseUrl: string = GlobalComponent.apiBaseUrl;

    constructor(http: HttpClient) {
        this.httpProtocol = http;
    }

    /**
     * create
     * @param model 
     * @returns 
     */
    public create(model: any): Observable<any> {
        return this.httpProtocol.post<IWsUserResponse>(`${this.apiBaseUrl}wsUser/create`, model, this.httpOptions);
    }

    /**
     * edit
     * @param model 
     * @returns 
     */
    public edit(model: any): Observable<any> {
        return this.httpProtocol.put<IWsUserResponse>(`${this.apiBaseUrl}wsUser/edit`, model, this.httpOptions);
    }

    /**
     * edit
     * @param model 
     * @returns 
     */
     public delete(model: any): Observable<any> {
        return this.httpProtocol.put<IWsUserResponse>(`${this.apiBaseUrl}wsUser/delete`, model, this.httpOptions);
    }

    /**
     * detail
     * @param id : number
     * @returns 
     */
    public details(id: number): Observable<any> {
        return this.httpProtocol.get<IWsUserResponse>(`${this.apiBaseUrl}wsUser/details/${id}`);
    }

    /**
     * getAll
     * @returns 
     */
    public getAll(): Observable<any> {        
        return this.httpProtocol.get<IWsUserResponse>(`${this.apiBaseUrl}WsUser/list`);
    }
}