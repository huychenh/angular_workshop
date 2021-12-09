import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable()
export class AuthGuardService implements CanActivate {

    constructor(private router: Router, private authService: AuthService) { }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean> | UrlTree {        
        return this.isLoggedIn();
    }

    private async isLoggedIn(): Promise<boolean> {
        let isLoggedIn = await this.authService.isLoggedIn();
        if (!isLoggedIn) {
            if (confirm("Unauthorized Request. Do you want to navigate to the login page?")) {
                this.router.navigate(['/login']);
            }
            return false;
        }
        return true;
    }
}
