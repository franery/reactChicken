import {Http, Response} from '@angular/http';
import {Injectable, Component, Input} from '@angular/core';
import {ColumnComponent} from './column.component';
import { Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'datatable',
  template: `
            <input type="text" class="form-control" *ngIf=enableFilter [(ngModel)]=query 
              (keyup)=filter() placeholder="Filter" />
            <table class="table">
              <thead>
                <tr>
                  <th *ngFor="let column of columns">{{column.header}}</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let row of getData()">
                  <td *ngFor="let column of columns">{{row[column.value]}}</td>
                  <td>
                    <div class="btn-group">
                      <button type="button" class="btn btn-default btn" (click)="edit(row)"><i class="glyphicon glyphicon-pencil"></i></button>  
                      <button type="button" class="btn btn-default btn" (click)="delete(row.id)"><i class="glyphicon glyphicon-trash"></i></button> 
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
            `
})
export class DatatableComponent { 

  @Output() deleteId = new EventEmitter();
  @Output() modifyId = new EventEmitter();

  @Input() dataset;
  @Input() enableFilter = false;
  columns: ColumnComponent[] = [];
  query = "";
  filteredList;
 
  addColumn(column){
    this.columns.push(column);
  }

  getData(){
    if(this.query !== ""){
      return this.filteredList;
    }else{
      return this.dataset;  
    }
  }
 
  filter(){
    this.filteredList = this.dataset.filter(function(el){
      var result="";
        for(var key in el){
          result+= el[key];
        }
        return result.toLowerCase().indexOf(this.query.toLowerCase()) > -1;
    }.bind(this));
  }
  edit(row){
    this.modifyId.emit(row);
  }
  delete(id){
    this.deleteId.emit(id);
  }
}