import { Injectable } from '@angular/core';
import { Http , Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import { IWeather } from './weather';

@Injectable()
export class WeatherService {
    private weatherURL= 'assets/weather.json';
    constructor(private _http: Http) {}

    getWeather(): Observable<IWeather[]> {
       return this._http.get(this.weatherURL)
       .map((response: Response) => <IWeather[]> response.json())
       .do(data => console.log(JSON.stringify(data)));
    }
}
