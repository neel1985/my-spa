import { TestBed, inject } from '@angular/core/testing';
import { Http , Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import { AirlineService } from './airline.service';

describe('AirlineService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AirlineService]
    });
  });

  it('should be created', inject([AirlineService], (service: AirlineService) => {
    expect(service).toBeTruthy();
  }));
});
