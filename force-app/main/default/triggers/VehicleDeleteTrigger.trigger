trigger VehicleDeleteTrigger on Vehicle__c (before delete) {
	ProjectZeroClass.VehicleDeleteProtection(Trigger.old);    
}