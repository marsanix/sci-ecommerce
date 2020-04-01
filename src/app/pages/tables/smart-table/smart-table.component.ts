import { Component, OnInit } from '@angular/core';
import { LocalDataSource } from 'ng2-smart-table';
import { HttpClient, HttpParams } from '@angular/common/http';

import { SmartTableData } from '../../../@core/data/smart-table';
import { finalize } from 'rxjs/operators';
import { NbDialogService } from '@nebular/theme';
import { PartDetailComponent } from './parts-detail/parts-detail.component';

@Component({
    selector: 'ngx-smart-table',
    templateUrl: './smart-table.component.html',
    styleUrls: ['./smart-table.component.scss'],
})
export class SmartTableComponent implements OnInit {

    settings = {
        add: {
            addButtonContent: '<i class="nb-plus"></i>',
            createButtonContent: '<i class="nb-checkmark"></i>',
            cancelButtonContent: '<i class="nb-close"></i>',
        },
        edit: {
            editButtonContent: '<i class="nb-edit"></i>',
            saveButtonContent: '<i class="nb-checkmark"></i>',
            cancelButtonContent: '<i class="nb-close"></i>',
        },
        delete: {
            deleteButtonContent: '<i class="nb-trash"></i>',
            confirmDelete: true,
        },
        columns: {
            itemId: {
                title: 'Item ID',
                type: 'number',
            },
            partNum: {
                title: 'Part Number',
                type: 'string',
            },
            manufacturer: {
                title: 'Manufacturer',
                type: 'string',
            },
            desc: {
                title: 'Description',
                type: 'string',
            }
        },
    };

    data: any = {};
    partNum: any = [];
    partNumLink = 'assets/data/partnum.json';

    loading = true;

    source: LocalDataSource = new LocalDataSource();

    constructor(private service: SmartTableData, private http: HttpClient, private dialogService: NbDialogService) {
        // const data = this.service.getData();
        // this.source.load(data);

    }

    ngOnInit() {
        this.loadPartNum().then((res) => {
            this.loadParts(res);
        });

    }

    loadPartNum() {
        console.log('Start loading partnum...');
        return this.http.get(this.partNumLink).pipe(
            finalize(() => console.log('End loading partnum...'))
        ).toPromise();
    }

    loadParts(partNum) {
        console.log('Start loading parts...');

        // const url = 'http://localhost:8890/api/parts/search';
        const url = 'https://sci-ecommerce.kekajian.com/api/parts/search';
        const params = new HttpParams().set('parts', JSON.stringify(partNum));
        return this.http.get(url, { params: params }).pipe(
            finalize(() => console.log('End loading parts...'))
        ).subscribe((res: any) => {


            const data = [];
            const results = res.itemserviceresult.data[0].resultList;
            results.find((val) => {
                let row = {};
                if (val.PartList.length > 0) {
                    row = {
                        itemId: val.PartList[0].itemId,
                        partNum: val.requestedPartNum,
                        manufacturer: val.PartList[0].manufacturer.mfrName,
                        desc: val.PartList[0].desc,
                        val: val
                    };
                } else {
                    row = {
                        itemId: '',
                        partNum: val.requestedPartNum,
                        manufacturer: '',
                        desc: '',
                        val: val
                    };
                }
                data.push(row);
            });

            console.log('res', res);
            console.log('data', data);
            this.source.load(data);

        });

    }

    onUserRowSelect(event): void {
        // console.log('event', event);
        this.dialogService.open(PartDetailComponent, {
            context: {
                title: 'Part Detail',
                data: event.data
            },
        });
    }

    onDeleteConfirm(event): void {
        if (window.confirm('Are you sure you want to delete?')) {
            event.confirm.resolve();
        } else {
            event.confirm.reject();
        }
    }
}
