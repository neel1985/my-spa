export interface ITicket {
    icon: string,
	terminal:string,
	header1: string,
	header2: string,
	footer: string,
	color: string,
	type:string
 }

 export class ServiceComponent implements ITicket{
    constructor(public icon: string, public terminal:string, public header1: string, public header2: string, 
				public footer: string, public color: string, public type:string){}
 }