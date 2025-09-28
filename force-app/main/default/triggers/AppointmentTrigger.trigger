trigger AppointmentTrigger on Appointment__c (before insert, after insert) {
    try {
        if (Trigger.isBefore && Trigger.isInsert) {
            System.debug('Before Insert logic here...');
            // put your validation/business logic
        }
    } catch (Exception ex) {
        // Use your logger
        ErrorLogger.logError(ex, 'AppointmentTrigger', null);
    }
}