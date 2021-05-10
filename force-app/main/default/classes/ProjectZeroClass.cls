public class ProjectZeroClass {
    public static void vehicleDeleteProtection(List<Vehicle__c> vehicle){
        for(Vehicle__c V: vehicle){
            if(v.Customer__c != null){
                v.addError('Cannot Delete Vehicle with a customer attached.');
            }        
        }
    }
    public static void updateBillingWithShipping (List<Customer__c> customer){
        for(Customer__c x: customer){
            if(x.Shipping_Address__c != null && x.billing_address__c == null){
                x.billing_address__c = x.shipping_address__c;
                x.Billing_State__c = x.Shipping_State__c;
                x.Billing_Postal_Code__c = x.Shipping_Zip_Code__c;
            }
        }
	} 
    public static void vehicleFinishedRaise(){
        List<Service__c> services = [SELECT Id FROM Service__c WHERE Done__c = true LIMIT 1];
        List<Employee__c> employee = [SELECT Id, Wage__c FROM Employee__c WHERE Position__c = 'Mechanic'];
        for(Service__c s : services){
            for(Employee__c e : employee){
                  if(e.Wage__c < 30){
                 e.Wage__c = e.Wage__c + 0.10;                 
                }                                                
            }
        }
        upsert employee;    
    }
    public static void serviceIsDoneProtection(List<Service__C> S){
        for(Service__c V: S){
            if(v.Done__c == true || v.Done__c == false){
                v.addError(
                    'Services records cannot be deleted. ');
            }        
        }
	}
}