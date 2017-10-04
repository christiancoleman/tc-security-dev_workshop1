public without sharing class OrderHistoryController {
	
	public List<Order__c> orders {public get; private set;}

	public OrderHistoryController() {

		String customerID = ApexPages.currentPage().getParameters().get('Customer__c');

		orders = new List<Order__c>();

		String queryString = 'SELECT Name, Customer__r.Name, ' + 
								'Order_Date__c, Product_Purchased__r.Name ' +
								'FROM Order__c WHERE Customer__c = \'';

		orders = Database.query(queryString + '' + '\'');
	}
}