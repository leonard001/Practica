import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
})
export class NavigationComponent implements OnInit {
  folders:any[]=[]
  constructor() { }

  ngOnInit() {
    this.folders = [
      {
        name:'Inicio',
        url:'home'
      },
      {
        name:'Servicios',
        url:'services'
      },
      {
        name:'Medicamentos',
        url:'medical'
      },
    ]
  }
showInfo(link){
  console.log(link);
}

}
