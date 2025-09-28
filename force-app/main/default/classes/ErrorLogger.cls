public with sharing class ErrorLogger {
    public static void log(Exception ex, String context, Id relatedId){
        try {
            Error_Log__c e = new Error_Log__c();
            e.Message__c = ex.getMessage();
            e.Stack_Trace__c = ex.getStackTraceString();
            e.Context__c = context;
            e.Related_Record_Id__c = relatedId != null ? String.valueOf(relatedId) : null;
            insert e;
        } catch (Exception nested) {
            System.debug('ErrorLogger failed: ' + nested.getMessage());
        }
    }
}