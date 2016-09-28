/*******************************************************************************
 * JobWrapper
 *
 * Description: 
 * 
 * Wrapper class for a job, the skills and any applications
 *
 * If you are the sort of person who enjoys reading code, you may be interested
 * in a career with BrightGen - check out http://www.brightgen.com or
 * email recruitment@brightgen.com
 *
 * Author Keir Bowden
 * Date Aug 2016
 *
 * Changes:
 ********************************************************************************/
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