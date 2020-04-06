export interface IWeather {
    c: string,
    f: string,
    location: string
}

export class AppComponent implements IWeather {
    constructor(public c: string, public location: string, public f: string) {}
}
