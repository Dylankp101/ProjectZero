trigger ServiceTrigger on Service__c (after update) {
    //Making changes to test
    ProjectZeroClass.vehicleFinishedRaise();
}