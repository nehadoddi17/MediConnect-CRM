public with sharing class AppointmentHandler {
    private static Boolean beforeInsertRan = false;

    public static void beforeInsert(List<Appointment__c> newList){
        if (beforeInsertRan) return;
        beforeInsertRan = true;
        for (Appointment__c a : newList) {
            if (a.Patient__c == null) {
                a.addError('Patient is required');
            }
        }
    }

    public static void afterInsert(List<Appointment__c> newList){
        List<Id> ids = new List<Id>();
        for (Appointment__c a : newList) ids.add(a.Id);
        if (!ids.isEmpty()) System.enqueueJob(new AppointmentProcessingQueueable(ids));
    }
}