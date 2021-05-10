trigger ServiceIsDoneTrigger on Service__c (before delete) {
	ProjectZeroClass.serviceIsDoneProtection(Trigger.old);
}