import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
})
export class AppComponent {
  titleHello:string;

  constructor(){}

  ngOnInit(): void {
   let message = 'Hola mundo'
   this.titleHello = message
  }
}
