import { Component, OnInit, OnDestroy , ViewChild} from '@angular/core';
import { Router } from '@angular/router';
import { BsModalComponent } from 'ng2-bs3-modal';

import { SelectionService } from './selection.service';
import { AirlineService } from '../airline.service';
import { ITicket } from './selection';
import { ITab } from './tab';
import { FormControl, ReactiveFormsModule} from '@angular/forms';
import { Subscription } from 'rxjs/Subscription';


@Component({
  selector: 'app-selection',
  templateUrl: './selection.component.html',
  styleUrls: ['./selection.component.css'],
  providers: [ SelectionService ]
})
export class SelectionComponent implements OnInit, OnDestroy {

  ticketdetails: ITicket[];
  tabdetails: ITab[];
  commonArray: any;
  motherArray:Array<any> = [];
  parkingType = '';
  parkingItem = '';
  subscription: Subscription;

  constructor(private ticketDetails: SelectionService, private tabDetails: SelectionService, 
              private _motherService: AirlineService, private router: Router) { }
	
	@ViewChild('myModal')
    modal: BsModalComponent;
  
  ngOnInit(){
     this.ticketDetails.getTickets()
     .subscribe(ticketdetails => this.ticketdetails = ticketdetails);
	 
	 this.tabDetails.getTabs()
     .subscribe(tabdetails => this.tabdetails = tabdetails);

     this._motherService.currentQuote$.subscribe(commonArray => this.commonArray = commonArray);
	 console.log("selection" + this.commonArray);
	 
  }
  
  ngAfterViewInit() {
     if(this.commonArray.length != 0){
		this.parkingType = this.commonArray.type;
		this.parkingItem = this.commonArray.imgType;
		this.modal.open();
	 }
    }
  
  getQuoteHandler(){
	
    let selectedTerminal = document.getElementById("terminalSelect")["value"];
	let type = document.getElementById("parkingSelect")["value"];
	let imgType = document.getElementById("itemSelect")["value"];
    let startDate = document.getElementById("fromDate")["value"];
    let startTime = document.getElementById("time1")["value"];
    let endDate = document.getElementById("toDate")["value"];
    let endTime = document.getElementById("time2")["value"];
	//create date format          
	/*var timeStart = new Date(startTime.replace(/-/g,'/').replace('T',' '));
    var timeEnd = new Date(endTime.replace(/-/g,'/').replace('T',' '));
	var timeDiff = timeEnd - timeStart;
	var dateStart = new Date(startDate).getHours();
    var dateEnd = new Date(endDate).getHours();
	var dateDiff = dateStart - dateEnd;
	var finalMin = dateDiff*60 + timeDiff;*/
	 
	//let dateStart = new Date(startDate).getHours();
   // let dateEnd = new Date(endDate).getHours();
	
/*	
	let finalMin: number = diffInMins + this.diff(startTime, endTime);
	
	
	 
	 
		
	let finalprice :number =0;
	
	switch(imgType){
		case "Bus": finalprice= finalMin * 3;
			break;
		case "SUV": finalprice = finalMin * 3.5;
			break;
		case "Car": finalprice = finalMin * 5;
			break;
		case "Bike": finalprice = finalMin * 2;
			break;
		case "Human": finalprice = finalMin * 1;
			break;
	}
	switch(type){
		case "Short Stay Parking": finalprice = finalprice * 1;
			break;
		case "Meet and Greet Parking": finalprice = finalprice * 1.5;
			break;
		case "Pod Parking": finalprice = finalprice * 2;
			break;
		case "Valet Parking": finalprice = finalprice * 2.5;
			break;
		case "Long Stay Parking": finalprice = finalprice * 3;
			break;
		case "Business Parking": finalprice = finalprice * 3.5;
			break;	
	} 
			*/
	this.commonArray = {
		"type": type,
		"icon": this.commonArray.icon,
		"imgType": imgType,
		"interval": this.commonArray.interval,
		"originalPrice": this.commonArray.originalPrice,
		"discountedPrice": this.commonArray.discountedPrice,
		"totalTime" : this.commonArray.totalTime,
        "selectedTerminal": selectedTerminal,
        "startDate": startDate, 
        "endDate": endDate,
        "startTime": startTime,
		"endTime": endTime
    };
	this.motherArray.push(Object.assign({}, this.commonArray));
	this.commonArray = [];
	console.log(this.motherArray);
	console.log(this.commonArray);
	//LocalStorage.setItem("updatedArray", JSON.stringify(this.motherArray));
	//this._motherService.setArray(this.commonArray);
	this.router.navigateByUrl('/Order_Review');
  }
  inTab1(){
	this.modal.open();
  }

  ngOnDestroy() {
    //this.subscription.unsubscribe();  // a must
  }

}
