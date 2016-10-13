import {Http, Response} from '@angular/http';
import {Injectable, Component } from '@angular/core';

import './rxjs-operators';

@Component({
  selector: 'my-app',
  template: `
            <h1>Angular App</h1>
            <nav>
              <a routerLink="/home">home</a>
              <a routerLink="/depositos">depositos</a>
              <a routerLink="/usuarios">usuarios</a>
              <a routerLink="/gallineros">gallineros</a>
            </nav>
            <router-outlet></router-outlet>
            `
})
export class AppComponent { }