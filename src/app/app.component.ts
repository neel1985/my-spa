import { Component } from '@angular/core';

//import { appService } from './app.service';
import { Http , Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'First-SPA';
  pagenames = ['Home', 'Selection', 'Order_Review', 'Connectivity','Login/Register']; //'Contact Us',
  
  default(){
      
  }
}
