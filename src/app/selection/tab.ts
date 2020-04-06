export interface ITab {
	id:string,
	icon:string,
    header:string,
    line1:string,
    line2:string,
    line3:string,
    line4:string
 }

 export class ServiceComponent implements ITab{
    constructor(public id:string,
	public icon:string,
    public header:string,
    public line1:string,
    public line2:string,
    public line3:string,
    public line4:string){}
 }