public without sharing class OrderHistoryController {
	
	public Boolean hasOrders 		{get; set;}
	public List<Order__c> orders 	{get; set;}

	public OrderHistoryController() {

		String customerID = ApexPages.currentPage().getParameters().get('customerId');

		orders = new List<Order__c>();

		String queryString = 'SELECT Name, Customer__r.Name, ' + 
								'Order_Date__c, Product_Purchased__r.Name ' +
								'FROM Order__c WHERE Customer__c = \'' + 
								customerId + '\'';

		System.debug('~~~~~~~~queryString = ' + queryString);

		orders = Database.query(queryString);

		if(orders.isEmpty()){
			hasOrders = false;
		} else {
			hasOrders = true;
		}
	}
}