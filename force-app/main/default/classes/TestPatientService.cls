@isTest
private class TestPatientService {

    @isTest
    static void testUpdatePatientEmail() {
        // Create test Patient with required fields
        Patient__c patient = new Patient__c(
            Name = 'Patient One',
            Age__c = 40,
            Patient_Email__c = 'oldemail@test.com'
        );
        insert patient;

        Test.startTest();
        // Call service method to update email
        PatientService.updatePatientEmail(patient.Id, 'newemail@test.com');
        Test.stopTest();

        // Verify email is updated
        Patient__c updatedPatient = [SELECT Patient_Email__c FROM Patient__c WHERE Id = :patient.Id];
        System.assertEquals('newemail@test.com', updatedPatient.Patient_Email__c);
    }

    @isTest
    static void testValidatePatient() {
        // Create test Patient with valid data
        Patient__c patient = new Patient__c(
            Name = 'Valid Patient',
            Age__c = 50,
            Patient_Email__c = 'valid@test.com'
        );
        insert patient;

        Test.startTest();
        // Call service method to validate patient
        Boolean isValid = PatientService.validatePatient(patient.Id);
        Test.stopTest();

        // Assert patient is valid
        System.assert(isValid, 'Patient should be valid');
    }

    @isTest
    static void testValidatePatientInvalid() {
        // Create test Patient with missing age
        Patient__c patient = new Patient__c(
            Name = 'Invalid Patient',
            Age__c = null,
            Patient_Email__c = 'invalid@test.com'
        );
        insert patient;

        Test.startTest();
        Boolean isValid = PatientService.validatePatient(patient.Id);
        Test.stopTest();

        // Assert patient is invalid
        System.assert(!isValid, 'Patient with missing age should be invalid');
    }
}