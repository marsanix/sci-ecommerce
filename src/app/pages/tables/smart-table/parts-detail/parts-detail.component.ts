import { Component, Input, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
    selector: 'ngx-parts-detail',
    templateUrl: 'parts-detail.component.html',
    styleUrls: ['parts-detail.component.scss'],
})
export class PartDetailComponent implements OnInit {

    @Input() title: string;
    @Input() data: any;

    constructor(protected ref: NbDialogRef<PartDetailComponent>) { }

    ngOnInit() {

        console.log('title', this.title);
        console.log('data', this.data);

    }

    dismiss() {
        this.ref.close();
    }
}
