public class JobWrapper
{
    @AuraEnabled
    public Job_Posting__c job {get; set;}
    @AuraEnabled
    public Job_Application__c application {get; set;}
    @AuraEnabled
    public List<Skill__c> skills {get; set;}
        
    public JobWrapper(Job_Posting__c job)
    {
        this.job=job;
    }
}