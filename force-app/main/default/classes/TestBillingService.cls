@isTest
private class TestBillingService {

    @isTest static void testGenerateBilling() {
        // Create related patient and appointment
        Patient__c p = new Patient__c(Name='Billing Patient', Patient_Email__c='test@example.com');
        insert p;

        Appointment__c a = new Appointment__c(Patient__c = p.Id);
        insert a;

        Test.startTest();
        BillingService.generateBilling(a);
        Test.stopTest();

        // Verify a Billing__c record was created
        List<Billing__c> bills = [SELECT Id, Appointment__c, Patient__c, Amount__c 
                                  FROM Billing__c WHERE Appointment__c = :a.Id];
        System.assertEquals(1, bills.size());
        System.assertEquals(a.Id, bills[0].Appointment__c);
        System.assertEquals(p.Id, bills[0].Patient__c);
    }

    @isTest static void testGetBillsForPatient() {
        Patient__c p = new Patient__c(Name='Patient 2', Patient_Email__c='p2@example.com');
        insert p;

        Appointment__c a1 = new Appointment__c(Patient__c = p.Id);
        insert a1;

        Appointment__c a2 = new Appointment__c(Patient__c = p.Id);
        insert a2;

        Billing__c b1 = new Billing__c(Appointment__c = a1.Id, Patient__c = p.Id, Amount__c = 100);
        Billing__c b2 = new Billing__c(Appointment__c = a2.Id, Patient__c = p.Id, Amount__c = 200);
        insert new List<Billing__c>{b1, b2};

        List<Billing__c> bills = BillingService.getBillsForPatient(p.Id);
        System.assertEquals(2, bills.size());
    }
}