import { Injectable } from '@angular/core';
import { Http , Response } from '@angular/http';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import { IAirline } from "./grommet/airline";



@Injectable()
export class AirlineService {	
    private airlineURL= 'assets/airline.json';
	private bookingURL= 'assets/booking.json';
	private usbankJSON= 'assets/usbank.json';
	quote: BehaviorSubject<any> = new BehaviorSubject([]);
    currentQuote$ = this.quote.asObservable();

    constructor(private _http: Http) {}
	
	setArray(updatedArray){
        this.quote.next(updatedArray);
        console.log("service>>>>>>"+ this.quote.value);
    }

    getairline(): Observable<IAirline[]> {
       return this._http.get(this.airlineURL)
       .map((response: Response) => <IAirline[]> response.json())
       .do(data => console.log(JSON.stringify(data)));
    }
	getJSON() {
       return this._http.get(this.usbankJSON)
       .map((response: Response) => response.json())
       .do(data => console.log(JSON.stringify(data)));
    }
	
}
