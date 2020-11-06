import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomepageComponent } from './pages/homepage/homepage.component';
import { LoginComponent } from './pages/login/login.component';
import { MedicalServicesComponent } from './pages/medical-services/medical-services.component';


const routes: Routes = [
  {
    path:'login',
    component:LoginComponent
  },
  {
    path:'home',
    component:HomepageComponent
  },
  {
    path:'medical-service',
    component:MedicalServicesComponent
  },
  {
    path:'**',
    redirectTo:'/login'
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
