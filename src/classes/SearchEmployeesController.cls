public without sharing class SearchEmployeesController{

    public String queryInput {get; set;}
    public List<Employee__c> employeeResults {get; set;}

    public SearchEmployeesController(){
        queryInput = ApexPages.currentPage().getParameters().get('q');
        query();
    }

    public void query() {
        String qryString = 
            'SELECT Id, Name, Address__c, City__c, First_Name__c, '
                + 'Last_Name__c, Phone__c, Salary__c, Email_Address__c, ' 
                + 'Social_Security_Number__c, State__c ' 
            + 'FROM Employee__c '
            + 'WHERE (IsDeleted = false and First_Name__c LIKE \'%' + queryInput + '%\')';

        employeeResults = Database.query(qryString);
    }

}