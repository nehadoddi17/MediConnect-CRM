public class AppointmentProcessingQueueable implements Queueable {
    private List<Id> appointmentIds;
    
    public AppointmentProcessingQueueable(List<Id> ids){
        appointmentIds = ids;
    }

    public void execute(QueueableContext qc){
        // Bulk-safe query
        List<Appointment__c> listA = [SELECT Id FROM Appointment__c WHERE Id IN :appointmentIds];
        System.debug('Processing appointments: ' + appointmentIds);
        // TODO: Add your background processing logic here
    }
}