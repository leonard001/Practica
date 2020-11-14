import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.sass']
})
export class LoginComponent implements OnInit {
  loginForm:FormGroup;

  constructor(private formBuilder: FormBuilder) {
    this.createLoginForm()
  }

  ngOnInit() {

  }
  // CREATE REACTIVE LOGIN FORM
  createLoginForm() {
    this.loginForm = this.formBuilder.group({ ///^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/   [a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$
      email: ['', [Validators.required, Validators.pattern('[a-zA-Z0-9._%+-]+[a-zA-Z0-9-]+@[a-z0-9.-]+\.[a-z]{2,3}$')]],
      password: ['', Validators.required],
    })
  }

  handleLogin(form){
    console.log("Initi login",form)
  }
}
