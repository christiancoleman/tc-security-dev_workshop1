public without sharing class MainPortalViewController {

	//public String testing123 {get; set;}

	public String customerId {get; set;}

	public String username 		{get; set;}
	public String searchTerm 	{get; set;}

	public Boolean isCustomer 	{get; set;}
	public Boolean isEmployee 	{get; set;}
	public Boolean isAdmin 		{get; set;}
	
	public MainPortalViewController() {
		//testing123 = 'example.html';

		isCustomer = 	false;
		isEmployee = 	false;
		isAdmin = 		false;
		
		Cookie isCustomerCookie = ApexPages.currentPage().getCookies().get('isCustomer');
		Cookie isEmployeeCookie = ApexPages.currentPage().getCookies().get('isEmployee');
		Cookie isAdminCookie = ApexPages.currentPage().getCookies().get('isAdmin');

		Cookie usernameCookie = ApexPages.currentPage().getCookies().get('username');
		
		System.debug('~~~~~~cust: ' + isCustomerCookie);
		System.debug('~~~~~~empl: ' + isEmployeeCookie);
		System.debug('~~~~~~admi: ' + isAdminCookie);

		if(isAdminCookie != null){
			isAdmin = true;
		}

		if(isCustomerCookie != null){
			isCustomer = true;
		}

		if(isEmployeeCookie != null){
			isEmployee = true;
		}

		if(isCustomer || isEmployee || isAdmin){
			if(usernameCookie != null){
				System.debug('~~~~~~~username cookie = ' + usernameCookie);
				username = usernameCookie.getValue();
			}
		}

		if(!String.isEmpty(username)){
			customerId = [
				SELECT Id, Address__c, City__c, Email_Address__c, First_Name__c, IP_Address__c, Last_Name__c, Password__c, Phone__c, State__c, Username__c
				FROM Customer__c
				WHERE Username__c = :username
				LIMIT 1
			].Id;
			System.debug('~~~~~~~customerId = ' + customerId);
		}
	}

	public PageReference searchProductByName(){
		PageReference ref = new PageReference('/SearchProducts?searchTerm=' + searchTerm);
		return ref;
		//return null;
	}

}