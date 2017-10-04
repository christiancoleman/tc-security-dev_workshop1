public with sharing class CaseViewController {
	public List<Case> cases {get; set;}
	public String contactNumber = '';

	public CaseViewController() {
		// Get Parameter from URL
		contactNumber = ApexPages.currentPage().getParameters().get('cn');

		// Query for cases that match
		cases = Database.query('select ID from Case where CaseNumber = :contactNumber');
		
	}
}