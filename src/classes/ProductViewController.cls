public without sharing class ProductViewController{

	public Product__c product 						{get; set;}
	public String comment 							{get; set;}
	public List<Product_Comment__c> commentList 	{get; set;}
	public Boolean hasComments						{get; set;}

	public ProductViewController(){
		String productId = ApexPages.currentPage().getParameters().get('Id');

		product = [
			SELECT Id, Name, Price__c
			FROM Product__c
			WHERE Id = :productId
		];

		commentList = [
			SELECT Id, Product__c, Customer__c, Customer__r.Username__c, Content__c
			FROM Product_Comment__c
			WHERE Product__c = :product.Id
		];

		if(commentList.isEmpty()){
			hasComments = false;
		} else {
			hasComments = true;
		}
	}

	public PageReference saveComment(){
		Product_Comment__c newComment = new Product_Comment__c();
		newComment.Product__c = product.Id;
		newComment.Content__c = comment;
		insert newComment;

		PageReference ref = new PageReference('/ProductView?Id=' + product.Id);
		ref.setRedirect(true);
		return ref;
	}

}