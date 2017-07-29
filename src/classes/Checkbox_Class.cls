public class Checkbox_Class 
{
	public PageReference save()
	{
		//update a;
		system.debug('***GetSelectedAccounts***'+ GetSelectedAccounts());
		if(GetSelectedAccounts() != NULL)
		{
			List<Test9199__Project__c> lsau = GetSelectedAccounts();
			for(Test9199__Project__c sa :lsau)
			{
				sa.Test9199__Status__c = 'Green';
			}
			update lsau;
		}
		return null;
	}

	public PageReference cancel()
	{
		return null;
	}
	List<accountwrapper> accountList = new List<accountwrapper>();
	List<Test9199__Project__c> selectedAccounts = new List<Test9199__Project__c>();
	List<Test9199__Project__c> a = new List<Test9199__Project__c>();

	public List<accountwrapper> getAccounts()
	{
		accountList = new List<accountwrapper>(); 
		for(Test9199__Project__c a : [SELECT Test9199__Project_Name__c, Test9199__Status__c FROM Test9199__Project__c
		limit 10])
			accountList.add(new accountwrapper(a));
		return accountList;
	}

	public PageReference getSelected()
	{
		selectedAccounts.clear();
		for(accountwrapper accwrapper : accountList)
			if(accwrapper.selected == true)
				selectedAccounts.add(accwrapper.acc);
		return null;
	}

	public List<Test9199__Project__c> GetSelectedAccounts()
	{
		if(selectedAccounts.size()>0)
			return selectedAccounts;
		else
			return null;

	}

	public class accountwrapper
	{
		public Test9199__Project__c acc{get; set;}
		public Boolean selected {get; set;}
		public accountwrapper(Test9199__Project__c a)
		{
			acc = a;
			selected = false;
		}
	}
}