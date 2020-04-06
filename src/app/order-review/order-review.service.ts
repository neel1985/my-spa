import { Injectable } from '@angular/core';
import { Http , Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import { OTab } from './oTab';
import { RouterModule, Routes } from '@angular/router';

@Injectable()
   export class OrderService {
	private _orderDetailsURL="assets/order.json";
    constructor(private _http: Http){}
	
	getOrders(): Observable<OTab[]> {
		  return this._http.get(this._orderDetailsURL)
		  .map((response: Response) => <OTab[]> response.json())
		  .do(data => console.log(JSON.stringify(data)));
	   }
   }