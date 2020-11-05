import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomepageComponent } from './homepage/homepage.component';
import { LoginComponent } from './login/login.component';
import { MaterialModule } from '../material/material.module';



@NgModule({
  declarations: [HomepageComponent, LoginComponent],
  imports: [
    CommonModule,
    MaterialModule
  ]
})
export class PagesModule { }
