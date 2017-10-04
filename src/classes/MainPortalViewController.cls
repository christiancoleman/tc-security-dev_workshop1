public without sharing class MainPortalViewController {
	public String Name {get; set;}
	
	public MainPortalViewController() {
		Name = UserInfo.getUserName();
	}

}