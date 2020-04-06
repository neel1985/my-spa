import { Component, OnInit} from '@angular/core';
import { Router } from '@angular/router';
import { AirlineService } from '../airline.service';
import { OrderService } from './order-review.service';

import { OTab } from './oTab';
import { FormControl, ReactiveFormsModule} from '@angular/forms';
import { Subscription } from 'rxjs/Subscription';
@Component({
  selector: 'app-order-review',
  templateUrl: './order-review.component.html',
  styleUrls: ['./order-review.component.css'],
  providers: [ OrderService ]
})
export class OrderReviewComponent implements  OnInit {
  commonArray: any;
  selectedTerminal;
  entryDate;
  entryTime;
  exitDate;
  exitTime;
  parkingType;
  vehicleType;
  pricePayable;
  orderdetails: OTab[];
  subscription: Subscription;
  
  constructor( private router: Router, private _motherService: AirlineService, private _orderService: OrderService) { }
	
  ngOnInit() {
	//this._motherService.currentQuote$.subscribe(commonArray => this.commonArray = commonArray);
	//console.log("===============>>>>" + JSON.stringify(LocalStorage.getItem("updatedArray")));
	this._orderService.getOrders()
     .subscribe(orderdetails => this.orderdetails = orderdetails);
	 
	/*this.selectedTerminal = this.commonArray.selectedTerminal;
	this.entryDate = this.commonArray.startDate;
	this.exitDate = this.commonArray.endDate;
	this.entryTime = this.commonArray.startTime;
	this.exitTime = this.commonArray.endTime;
	this.pricePayable = this.commonArray.discountedPrice;
	this.parkingType = this.commonArray.type;
	this.vehicleType = this.commonArray.imgType;*/	
  }
  
  removeOrder(){
	/* this.commonArray = [];
	this._motherService.setArray(this.commonArray);
	this.router.navigateByUrl('/Home'); */
	
  }
  
  loginFunc(){
	this.router.navigateByUrl('/Login/Register');
  }
	
}
