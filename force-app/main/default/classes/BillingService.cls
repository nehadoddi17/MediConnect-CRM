public with sharing class BillingService {

    // Generate billing record for an appointment
    public static void generateBilling(Appointment__c appointment) {
        try {
            Billing__c bill = new Billing__c();
            bill.Appointment__c = appointment.Id;
            bill.Patient__c = appointment.Patient__c;
            bill.Amount__c = 100; // Replace with actual calculation logic
            insert bill;
        } catch(Exception ex) {
            // Use ErrorLogger (make sure log method exists)
            ErrorLogger.log(ex, 'BillingService.generateBilling', appointment.Id);
        }
    }

    // Fetch bills for a patient
    public static List<Billing__c> getBillsForPatient(Id patientId) {
        return [SELECT Id, Appointment__c, Amount__c FROM Billing__c WHERE Patient__c = :patientId];
    }
}