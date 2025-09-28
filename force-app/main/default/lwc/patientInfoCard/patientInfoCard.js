import { LightningElement, track } from 'lwc';

export default class PatientInfoCard extends LightningElement {
    @track name = 'John Doe';
    @track age = 32;
    @track condition = 'Fever';
}
