import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, MatSort } from '@angular/material';
import { MatTableDataSource } from '@angular/material/table';
export interface UserData {
  id: string;
  name: string;
  lastname: string;
}


@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
})
export class HomepageComponent implements OnInit {
  displayedColumns: string[] = ['id', 'name','lastname'];
  dataSource: MatTableDataSource<UserData>;

  @ViewChild(MatPaginator,{static:true}) paginator: MatPaginator;
  @ViewChild(MatSort,{static:true}) sort: MatSort;
  constructor() {
    // Create 100 users

    // Assign the data to the data source for the table to render
    this.dataSource = new MatTableDataSource();
   }
   ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  ngOnInit() {
    this.dataSource.data=[
      {
        id:'0',
        name:'pedro',
        lastname:"test"
      },
      {
        id:'1',
        name:'pedro',
        lastname:"test"
      },
      {
        id:'2',
        name:'pedro',
        lastname:"test"
      },
      {
        id:'3',
        name:'pedro',
        lastname:"test"
      },

    ]
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}
