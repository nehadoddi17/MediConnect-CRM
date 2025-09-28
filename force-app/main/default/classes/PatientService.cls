public with sharing class PatientService {

    // Update patient's email
    public static void updatePatientEmail(Id patientId, String newEmail) {
        try {
            Patient__c p = [SELECT Id, Patient_Email__c FROM Patient__c WHERE Id = :patientId];
            p.Patient_Email__c = newEmail;
            update p;
        } catch (Exception ex) {
            ErrorLogger.log(ex, 'updatePatientEmail', patientId);
        }
    }

    // Validate a patient (by Id)
    public static Boolean validatePatient(Id patientId) {
        try {
            Patient__c p = [SELECT Id, Age__c, Patient_Email__c FROM Patient__c WHERE Id = :patientId];
            if (p.Age__c != null && p.Age__c > 0 && p.Patient_Email__c != null) {
                return true;
            }
            return false;
        } catch (Exception ex) {
            ErrorLogger.log(ex, 'validatePatient', patientId);
            return false;
        }
    }
}