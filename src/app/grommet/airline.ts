export interface IAirline {
    Destination: string,
    Airline: string,
    ImageAline : string,
    FlightNo: string,
    Time: string,
    Status: string,
    Gate: string
}

export class AppComponent implements IAirline {
    constructor(public Destination: string, public  Airline: string, public ImageAline : string, 
                public FlightNo: string, public Time: string, public  Status: string, public   Gate: string) {}
}
