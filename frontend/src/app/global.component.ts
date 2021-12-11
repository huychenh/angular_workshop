/**
 * Global component
 */
export class GlobalComponent {

    /** 
     * API base url: https://localhost:44363/api/
    */
    public static apiBaseUrl: string = "https://localhost:44363/api/";    

    /**
     * Authenticaion Setting
     */
    public static authenticationSetting = {
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


}