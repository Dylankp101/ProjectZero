@isTest
private class ProjecttZeroClassTest {
    //Test-Negative Example
    //Checks If a record with no customer attached will delete
    @isTest static void testVehicleDeleteProtection1(){
        Vehicle__c V = new Vehicle__c(Brand__c = 'Ford', Model__c = 'Mustang', Name = 'Test Vehicle', Engine__c = 'Test');
        insert V;
        try{
            Delete v;
        }catch (exception e){
            System.debug(e.getMessage());
        }
    }
    
        @isTest static void testVehicleDeleteProtection2(){
        Customer__c C = new Customer__c(Name = 'Test Dummy', Last_Name__c  = 'Test', Email__c ='dhdh@icloud.com',
                                        Shipping_State__c = 'CA', Shipping_Zip_Code__c = 12345, Shipping_Address__c = '123 dfgsdfg',
                                        Billing_State__c = null, Billing_Postal_Code__c = null, Billing_Address__c = null);
        insert C;
        Vehicle__c V = new Vehicle__c(Brand__c = 'Ford', Model__c = 'Mustang', Name = 'Test Vehicle', Customer__c = C.Id, Engine__c = 'Test');
        insert V;
            
        try{
            Delete v;
        }catch (exception error){
            System.debug(error.getMessage());
            System.assert(error.getMessage().contains('Cannot Delete Vehicle with a customer attached.'));

        }
    }
    
    
        @isTest static void testServiceDoneProtection1(){
        Customer__c C = new Customer__c(Name = 'Test Dummy', Last_Name__c  = 'Test', Email__c ='dhdh@icloud.com',
                                        Shipping_State__c = 'CA', Shipping_Zip_Code__c = 12345, Shipping_Address__c = '123 dfgsdfg',
                                        Billing_State__c = null, Billing_Postal_Code__c = null, Billing_Address__c = null);
        insert C;
        Vehicle__c  V = new Vehicle__c(Brand__c = 'Ford', Model__c = 'Mustang', Name = 'Test Vehicle', Customer__r = C, Engine__c = 'Test');
        insert V;
        Service__c S = new Service__c(Vehicle__c = v.Id , Vehicle_Satus__c  = 'Waiting for Service');
        insert S;
        try{
            Delete S;
        }catch (exception e){
            System.debug(e.getMessage());
        }
    }
    
    @isTest static void testVehicleFinishedRaise(){
        Customer__c C = new Customer__c(Name = 'Test Dummy', Last_Name__c  = 'Test', Email__c ='dhdh@icloud.com',
                                        Shipping_State__c = 'CA', Shipping_Zip_Code__c = 12345, Shipping_Address__c = '123 dfgsdfg',
                                        Billing_State__c = null, Billing_Postal_Code__c = null, Billing_Address__c = null);
        insert C;
        Employee__c E = new Employee__c(Name = 'test', Last_Name__c = 'test', Phone_Number__c = '1231231234', Email__c = 'sdfsdfg@sdfsd.com' , Wage__c = 29.90, Position__c = 'Mechanic');
        insert E;
        Vehicle__c  V = new Vehicle__c(Brand__c = 'Ford', Model__c = 'Mustang', Name = 'Test Vehicle', Customer__r = C, Engine__c = 'Test');
        insert V;
        Service__c S = new Service__c(Done__c = false, Vehicle__c = v.Id, Vehicle_Satus__c  = 'Waiting for Service' );
        insert S;
        try{
           s.Done__c= true;       
            Update S;
           E.Wage__c = 30.00;
            update E;
        }catch (exception ex){
            System.debug(ex.getMessage());
            System.assertEquals(30.00, E.Wage__c);
        }
      }
        @isTest static void testVehicleFinishedRaise2(){
        Employee__c ET = new Employee__c(Name = 'Test', Last_Name__c = 'Phone Home', Phone_Number__c = '1231231234', Email__c = 'sdfsdfg@sdfsd.com' , Wage__c = 30.00);
		insert ET;
            try{
           ET.Wage__c = 30.00;       
            Update ET;
        }catch (exception ext){
            System.debug(ext.getMessage());
        }
        }  
}