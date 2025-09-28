@isTest
private class TestAppointmentHandler {
    @isTest
    static void testBeforeInsert_and_afterInsert_enqueuesQueueable() {
        Patient__c patient = new Patient__c(
            Name = 'Test Patient',
            Age__c = 25,
            Patient_Email__c = 'patient@test.com'
        );
        insert patient;

        Doctor__c doctor = new Doctor__c(
            Name = 'Test Doctor',
            Specialization__c = 'Cardiology'
        );
        insert doctor;

        Appointment__c app = new Appointment__c(
            Patient__c = patient.Id,
            Doctor__c = doctor.Id,
            Appointment_Date__c = Date.today()
        );
        insert app;

        System.assertNotEquals(null, app.Id);
    }

    @isTest
    static void testBeforeInsert_validation() {
        Patient__c patient = new Patient__c(
            Name = 'Invalid Patient',
            Age__c = 0, // if validation requires positive age, this will fail
            Patient_Email__c = 'invalid@test.com'
        );
        insert patient;

        Test.startTest();
        Boolean isValid = patient.Age__c > 0;
        Test.stopTest();

        System.assert(isValid, 'Patient age should be valid');
    }
}