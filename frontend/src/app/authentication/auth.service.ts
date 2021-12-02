import { Injectable } from '@angular/core';
//import { Observable } from 'rxjs';
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

    public async getUser(): Promise<User | null> {
        return await this.userManager.getUser();
    }


    public login(): Promise<void> {
        return this.userManager.signinRedirect();
    }

    public async loginCompleteAsync(url: string): Promise<User> {
        return await this.userManager.signinCallback(url);
    }

    public logout(): Promise<void> {
        return this.userManager.signoutRedirect();
    }

    public async logoutCompleteAsync(url: string): Promise<void> {
        await this.userManager.signoutCallback(url);
    }

    public isLoggedIn(): boolean {

        this.getUser().then(user => {
            return user != null && user != undefined && !user.expired;
        });

        return false;
    }

    // public getClaims(): any {
    //     return this.user.profile;
    // }

    // public getAuthorizationHeaderValue(): string {
    //     return `${this.user.token_type} ${this.user.access_token}`;
    // }

    // public startAuthentication(): Promise<void> {
    //     return this.userManager.signinRedirect();
    // }

    // public async completeAuthentication(): Promise<void> {
    //     // const user = await this.userManager.signinRedirectCallback();
    //     // this.user = user;

    //     this.userManager.signinRedirectCallback();        
    // }
}
