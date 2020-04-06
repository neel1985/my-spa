import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';
import { BsModalModule } from 'ng2-bs3-modal';
import { Pipe, PipeTransform } from '@angular/core';

import { AppComponent } from './app.component';
import { GrommetComponent } from './grommet/grommet.component';
import { ProductsComponent } from './grommet/products.component';
import { ConnectivityComponent } from './connectivity/connectivity.component';
import { OrderReviewComponent } from './order-review/order-review.component';
import { SelectionComponent } from './selection/selection.component';
import { LoginComponent } from './login/login.component';

import { AirlineService } from './airline.service';
import { FilterPipe } from './grommet/filter.pipe';

const appRoutes: Routes = [
    {path: '',redirectTo: "/Home",pathMatch: 'full'},
  { path: 'Home', component: GrommetComponent },
  { path: 'Connectivity', component: ConnectivityComponent },
  { path: 'Order_Review', component: OrderReviewComponent },
  { path: 'Selection', component: SelectionComponent },
   { path: 'Login/Register', component: LoginComponent },
];


@NgModule({
  declarations: [
    AppComponent,
    GrommetComponent,
    ProductsComponent,
	ConnectivityComponent,
    OrderReviewComponent,
    LoginComponent,
    SelectionComponent,
    FilterPipe
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
	BsModalModule,
    RouterModule.forRoot(appRoutes)//,
	//InMemoryWebApiModule.forRoot(SelectionComponent)
  ],
  providers: [AirlineService],
  bootstrap: [AppComponent]
})
export class AppModule { }




