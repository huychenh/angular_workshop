import { Injectable } from '@angular/core';
import { User, UserManager } from 'oidc-client';
import { GlobalComponent } from '../global.component';

@Injectable()
export class AuthService {

    private userManager: UserManager;
    private settings: any = GlobalComponent.authenticationSetting;

    constructor() {
        this.userManager = new UserManager(this.settings);
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
