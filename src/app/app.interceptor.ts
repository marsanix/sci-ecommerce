import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class AppInterceptor implements HttpInterceptor {
    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        // const modifiedRequest = req.clone();
        const modifiedRequest = req.clone({
            setHeaders: {
                'Content-Type': 'text/plain',
            }
        });
        // console.log('Intercepted request: ' + req.url);


        // modifiedRequest.headers.append('Authorization', 'myCustomToken123123')
        // modifiedRequest.headers.set('Content-Type', 'application/json')
        // modifiedRequest.headers.set('Test', '123')
        // modifiedRequest.headers.append('Test123', '123')
        // modifiedRequest.headers.set('Access-Control-Allow-Origin', '*')
        return next.handle(modifiedRequest);
    }
}