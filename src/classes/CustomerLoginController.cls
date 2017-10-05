public without sharing class CustomerLoginController {

	public String username {get; set;}
	public String password {get; set;}
	public List<Customer__c> customerList {get; set;}
	public Customer__c customer {get; set;}

	public CustomerLoginController() {
		// empty
	}

	public PageReference login(){

		customerList = [
			SELECT Id, Address__c, City__c, Email_Address__c, First_Name__c, IP_Address__c, Last_Name__c,
				Password__c, Phone__c, State__c, Username__c
			FROM Customer__c
		];

		for(Customer__c c : customerList){
			if(username.equals(c.Username__c)){
				customer = c;
			}
		}

		System.debug('~~~~~~~~~~Entered username: ' + username);
		System.debug('~~~~~~~~~~Entered password: ' + password);
		System.debug('~~~~~~~~~~Actual username: ' + customer.Username__c);
		System.debug('~~~~~~~~~~Actual password: ' + customer.Password__c);

		if(password.equals(customer.Password__c)){
			System.debug('~~~~~~~~~~Password CORRECT');
			
			Cookie isCustomerCookie = new Cookie('isCustomer', 'true', null, -1, false);
			Cookie usernameCookie = new Cookie('username', username, null, -1, false);
			Cookie passwordCookie = new Cookie('password', password, null, -1, false);
			
			ApexPages.currentPage().setCookies(new Cookie[]{
				  isCustomerCookie
				, usernameCookie
				, passwordCookie
			});
			
			PageReference ref = new PageReference('/MainPortalViewController');
			return ref;
		} else {
			System.debug('~~~~~~~~~~Password WRONG');
			return null;
		}
	}

}