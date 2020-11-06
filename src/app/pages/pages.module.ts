import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomepageComponent } from './homepage/homepage.component';
import { LoginComponent } from './login/login.component';
import { MaterialModule } from '../material/material.module';
import { AppRoutingModule } from '../app-routing.module';
import { MedicalServicesComponent } from './medical-services/medical-services.component';



@NgModule({
  declarations: [HomepageComponent, LoginComponent, MedicalServicesComponent],
  imports: [
    CommonModule,
    MaterialModule,
    AppRoutingModule
  ]
})
export class PagesModule { }
