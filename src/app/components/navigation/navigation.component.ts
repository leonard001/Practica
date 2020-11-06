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
      },
      {
        name:'Servicios',
      },
      {
        name:'Medicamentos',
      },
    ]
  }
showInfo(link){
  console.log(link);
}

}
