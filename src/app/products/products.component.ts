import { Component, OnInit } from '@angular/core';
import { IProduct } from './products';
import { ProductService } from './products.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css'],
  providers: [ProductService]
})

export class ProductsComponent implements OnInit {

  iproducts: IProduct[];
  constructor(private _product: ProductService) {
    console.log('Inside the constructor' + JSON.stringify(_product));
  }
  
  ngOnInit() : void {
     this._product.getproducts()
     .subscribe(iproducts => this.iproducts = iproducts);
  }
  
  toNext(selectedProduct){
	  console.log(selectedProduct);
  }

}
