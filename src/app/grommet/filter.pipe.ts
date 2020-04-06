import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {
    
  transform(myAirline: any, term: any): any {
    if(term==null){return myAirline;}
     /* if(myAirline===undefined){
          term='a';
          return myAirline.filter(function(airline){
              return airline.Airline.toLowerCase().includes(term.toLowerCase());
          })
        }*/
    else{
    return myAirline.filter(function(airline){
        return airline.Airline.toLowerCase().includes(term.toLowerCase());
    })
  }
    }

}
