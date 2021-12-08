import { Injectable } from '@angular/core';
import { User, UserManager } from 'oidc-client';

@Injectable()
export class AuthService {

    private userManager: UserManager;

    constructor() {

        const settings = {
            authority: 'https://localhost:44321/',
            client_id: 'angular_client',
            redirect_uri: 'http://localhost:4200/login-callback',
            monitorSession: false,
            post_logout_redirect_uri: 'http://localhost:4200/logout-callback',
            response_type: 'code', // for Auth Code flow
            scope: 'openid profile email phone',
            automaticSilentRenew: true,
            includeIdTokenInSilentRenew: true
        };
        this.userManager = new UserManager(settings);
    }

    public getUser(): Promise<User | null> {        
        return this.userManager.getUser();
    }

    public login(): Promise<void> {
        return this.userManager.signinRedirect();
    }

    public loginComplete(url: string): Promise<User> {
        return this.userManager.signinCallback(url);
    }

    public logout(): Promise<void> {
        return this.userManager.signoutRedirect();
    }

    public async logoutCompleteAsync(url: string): Promise<void> {
        await this.userManager.signoutCallback(url);
    }

    public async isLoggedIn(): Promise<boolean> {
        let user = await this.getUser();
        return user != null && user != undefined && !user.expired;

        // .then(user => {
        //     return user != null && user != undefined && !user.expired;
        // });
        // return false;
    }

    // public async getAccessToken(): Promise<string> {

    //     console.log("auth.service - getAccessToken - line 57");
    //     let token = "";
    //     await this.getUser().then(user => {
    //         console.log("auth.service - getAccessToken - line 60");
    //         if (user != null && user != undefined && !user.expired) {
    //             token = user.access_token;
    //         }
    //     });
    //     console.log("auth.service - getAccessToken - line 65");
    //     return token;
    // }

    // public async getAccessToken(): Promise<string> {
    //     let token = "";
    //     let obj = await this.getUser();
    //     if(obj != undefined) {
    //         token = obj?.access_token;
    //     }
    //     console.log("auth.service - getAccessToken - line 78");
    //     return token;        
    // }

    
}
