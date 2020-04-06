export interface OTab {
	terminal:string,
	parking:string,
    item:string,
    fromDate:string,
    toDate:string,
    time1:string,
    time2:string,
	price:string,
	discount:string,
	total: string
 }

 export class OrderComponent implements OTab{
    constructor(public terminal:string,
	public parking:string,
    public item:string,
    public fromDate:string,
    public toDate:string,
    public time1:string,
    public time2:string,
	public price:string,
	public discount:string,
	public total: string){}
 }