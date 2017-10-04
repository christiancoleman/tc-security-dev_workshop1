public class EmployeeLoginController{

    public String username {get; set;}
    public String password {get; set;}
    public String cookies {get; set;}

    public EmployeeLoginController(){

    }

    public PageReference checkCredentials(){
        if(isValidUser()){
            PageReference ref = new PageReference('/apex/Admin');
            return ref;
        } else {
            return null;
        }
    }

    public boolean isValidUser(){
        if(isPasswordCorrect() && areCookiesValid()){
            return true;
        } else {
            return false;
        }
    }

    private boolean isPasswordCorrect(){
        return (checkPassword(password)) ? true : false;
    }

    // TODO: add salt, do something else
    private boolean checkPassword(String pw){
        return (pw == 'theRealPassword') ? true : false;
    }

    private boolean areCookiesValid(){
        return (checkCookies(cookies)) ? true : false; 
    }

    // TODO: do something else
    private boolean checkCookies(String cs){
        return true;
    }

}