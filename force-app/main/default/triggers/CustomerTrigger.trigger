trigger CustomerTrigger on Customer__c (before insert) {
	ProjectZeroClass.updateBillingWithShipping(Trigger.new);
}