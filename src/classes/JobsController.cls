/*******************************************************************************
 * JobsController
 *
 * Description: 
 * 
 * Custom controller for the Jobs demo application created for the Dreamforce 
 * 16 talk on Unit Testing Lightning Components with Jasmine 
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
 public class JobsController
{
    @AuraEnabled
    public static List<JobWrapper> GetRecentJobs()
    {
        List<Job_Posting__c> jobs=[select id, Name, Description__c, Start_Date__c, End_Date__c,
                                    (select Skill__r.Name from Job_Skills__r)
                                   from Job_Posting__c
                                   order by CreatedDate desc
                                   limit 5];
        return wrapJobs(jobs);
    }

    private static List<JobWrapper> wrapJobs(List<Job_Posting__c> jobs)
    {
        Map<Id, Job_Application__c> applicationsByJobId=new Map<Id, Job_Application__c>();
        List<Job_Application__c> applications=[select id, Name, CreatedDate, Job_Posting__c
                                               from Job_Application__c
                                               where Job_Posting__c in :jobs];
        for (Job_Application__c app : applications)
        {
            applicationsByJobId.put(app.Job_Posting__c, app);
        }

        List<JobWrapper> wrappers=new List<JobWrapper>();
        for (Job_Posting__c job : jobs)
        {
            JobWrapper jw=new JobWrapper(new Job_Posting__c(id=job.id,
                                                            Name=job.Name,
                                                            Description__c=job.Description__c,
                                                            Start_Date__c=job.Start_Date__c,
                                                            End_Date__c=job.End_Date__c));

            Job_Application__c application=applicationsByJobId.get(job.id);
            if (null!=application)
            {
                jw.application=application;
            }

            jw.skills=new List<Skill__c>();
            for (Job_Skill__c jSkill : job.Job_Skills__r)
            {
                jw.skills.add(new Skill__c(Name=jSkill.Skill__r.Name));
            }
            wrappers.add(jw);
        }

        System.debug('Returning wrappers : ' + wrappers);
        return wrappers;
    }

    @AuraEnabled
    public static List<Skill__c> GetSkills()
    {
        List<Skill__c> skills=[select id, Name
                                   from Skill__c];

        return skills;
    }

    @AuraEnabled
    public static List<JobWrapper> SearchJobs(String searchStr, String skillsStr)
    {
        List<String> skills=null;
        if (!String.IsBlank(skillsStr))
        {
	        skills=skillsStr.split(',');
	        System.debug('### Skills = ' + skills);
    	    System.debug('### SkillsStr = ' + skillsStr);
        }
        return SearchJobs(searchStr, skills);
    }

    private static List<JobWrapper> SearchJobs(String searchStr, List<String> skills)
    {
        List<Job_Posting__c> jps;
        if ( (!String.isBlank(searchStr)) && (searchStr.length()>=2) )
        {
            List<List<Job_Posting__c>> allObjs=[find :searchStr IN ALL FIELDS returning Job_Posting__c(id) limit 5];
            jps=allObjs[0];
            System.debug('### jobs matching ' + searchStr + ' are ' + jps);
        }

        System.debug('### skills = ' + skills);
        Set<Id> jobIds=new Set<Id>();
        if ( (null!=skills) && (!skills.IsEmpty()) )
        {
            System.debug('Adding ' + skills.size() + ' skills');
            String queryStr=' select id, Job_Posting__c ' +
                            ' from Job_Skill__c ' +
                            ' where Skill__r.Name in :skills ';
            if (jps!=null)
            {
                queryStr+=' and Job_Posting__c in :jps';
            }

            List<Job_Skill__c> jSkills=Database.query(queryStr);

            for (Job_Skill__c jSkill : jSkills)
            {
                jobIds.add(jSkill.Job_Posting__c);
            }
        }
        else
        {
            System.debug('No skills, just pulling jobs');
            for (Job_Posting__c job : jps)
            {
                jobids.add(job.Id);
            }
        }

        List<Job_Posting__c> jobs=[select id, Name, Description__c, Start_Date__c, End_Date__c,
                                    (select Skill__r.Name from Job_Skills__r)
                                   from Job_Posting__c
                                   where id in :jobIds];
        return wrapJobs(jobs);
    }
}