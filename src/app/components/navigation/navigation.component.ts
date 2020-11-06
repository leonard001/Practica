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
        name:'Registro',
        url:'home'
      },
      {
        name:'Servicios',
        url:'Services'
      },
      {
        name:'Medicamentos',
        url:'medical-service'
      },
    ]
  }
showInfo(link){
  console.log(link);
}

}
