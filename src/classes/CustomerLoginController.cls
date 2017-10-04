public without sharing class CustomerLoginController {

	public String username {get; set;}
	public String password {get; set;}
	public List<Customer__c> customerList {get; set;}

    public CustomerLoginController() {
    	customerList = [
    		SELECT Id 
    		FROM Customer__c];
    }

    public PageReference login(){
    	PageReference ref = new PageReference('/MainPortalViewController');
    	return ref;
    }

}