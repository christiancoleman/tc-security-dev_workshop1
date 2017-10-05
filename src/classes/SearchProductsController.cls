public without sharing class SearchProductsController {

	public String searchTerm {get; set;}
	public List<Product__c> productList {get; set;}
	public Boolean hasProducts {get; set;}

	public SearchProductsController(){
		searchTerm = ApexPages.currentPage().getParameters().get('searchTerm');
		
		System.debug('~~~~~~~' + searchTerm);

		searchTerm = '%' + searchTerm + '%';

		productList = [
			SELECT Id, Name, Price__c
			FROM Product__c
			WHERE Name LIKE :searchTerm
		];

		if(productList.isEmpty()){
			hasProducts = false;
		} else {
			hasProducts = true;
		}
	}

}