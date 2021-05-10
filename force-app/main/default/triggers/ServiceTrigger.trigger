trigger ServiceTrigger on Service__c (after update) {
           ProjectZeroClass.vehicleFinishedRaise();
}