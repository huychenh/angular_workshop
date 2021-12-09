import { Injectable } from '@angular/core';
import { User, UserManager } from 'oidc-client';
import { Observable } from 'rxjs';

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
        let user = await this.userManager.getUser();
        return user != null && user != undefined && !user.expired;
    }

    public async getUserAsync(): Promise<User | null> {
        return await this.getUser();
    }


}
