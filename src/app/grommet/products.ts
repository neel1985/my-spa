export interface IProduct {
    type: string,
	totalTime: string,
	imgType: string,
	interval: string,
	originalPrice: string,
	discountedPrice: string
 }

 export class ProductsComponent implements IProduct{
    constructor(public type: string, public totalTime: string, public imgType: string,
				public interval: string, public originalPrice: string, 
				public discountedPrice: string ){}
 }
 