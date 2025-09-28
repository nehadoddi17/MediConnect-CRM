import { LightningElement, api, wire } from 'lwc';
import getPatientInfo from '@salesforce/apex/PatientService.getPatientInfo';

export default class PatientInfoCard extends LightningElement {
    @api recordId; // Appointment record ID (passed from page)
    patient;

    @wire(getPatientInfo, { patientId: '$recordId' })
    wiredPatient({ error, data }) {
        if (data) {
            this.patient = data;
        } else if (error) {
            console.error('Error fetching patient:', error);
        }
    }
}


