import { Injectable } from '@angular/core';
import { Http , Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import { ITicket } from './selection';
import { ITab } from './tab';
import { RouterModule, Routes } from '@angular/router';

@Injectable()
   export class SelectionService {
	private _ticketDetailsURL="assets/ticketDetails.json";
	private _tabDetailsURL="assets/tab.json";
    constructor(private _http: Http){}
	
	getTickets(): Observable<ITicket[]> {
		  return this._http.get(this._ticketDetailsURL)
		  .map((response: Response) => <ITicket[]> response.json())
		  .do(data => console.log(JSON.stringify(data)));
	   }
	   
	getTabs(): Observable<ITab[]> {
		  return this._http.get(this._tabDetailsURL)
		  .map((response: Response) => <ITab[]> response.json())
		  .do(data => console.log(JSON.stringify(data)));
	   }   
   }
 