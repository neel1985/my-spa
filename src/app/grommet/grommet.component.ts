import { Component, OnInit, OnDestroy } from '@angular/core';
import { Http , Response } from '@angular/http';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs/Subscription';

import { IWeather } from './weather';
import { IAirline } from './airline';
import { IProduct } from './products';

import { WeatherService } from './weather.service';
import { AirlineService } from '../airline.service';
import { ProductService } from './products.service';

//import { FilterAirlinePipe } from './filter-airline.pipe';

@Component({
    selector: 'grommet-app',
    templateUrl: './grommet.component.html',
    styleUrls: ['./grommet.component.css'],
   // pipes: [FilterAirlinePipe],
	providers: [ WeatherService, ProductService ]
	
})
export class GrommetComponent implements OnInit, OnDestroy{    
  today = new Date();
  curWeather: IWeather[];
  myAirline : IAirline[];
  iproducts: IProduct[];
  usbankArray: any;
  commonArray: any;
  subscription: Subscription;
  
  constructor(private _weather: WeatherService, private _airline: AirlineService
  , private _product: ProductService, private _motherService: AirlineService, private router: Router ) {
    console.log('Inside the constructor' + JSON.stringify(_weather));
    //console.log('Inside the constructor' + JSON.stringify(_airline));
  }

  ngOnInit(): void {
	this._motherService.getJSON().subscribe(usbankArray => this.usbankArray = usbankArray);
	console.log(this.usbankArray);
	
     this._weather.getWeather()
     .subscribe(curWeather => this.curWeather = curWeather);
     
     this._airline.getairline()
     .subscribe(myAirline => this.myAirline = myAirline);
	 
	  this._product.getproducts()
     .subscribe(iproducts => this.iproducts = iproducts);

     this._motherService.currentQuote$.subscribe(commonArray => this.commonArray = commonArray);
  }
  
  toNext(selectedProduct){
    console.log(selectedProduct);
    console.log(this.commonArray);
	//this._motherService.setArray(JSON.stringify(selectedProduct));
	this._motherService.setArray(selectedProduct);
	this.router.navigateByUrl('/Selection');
  }

  ngOnDestroy() {
    //this.subscription.unsubscribe();  // a must
  }
}