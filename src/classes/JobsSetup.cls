/*******************************************************************************
 * JobsSetup
 *
 * Description: 
 * 
 * Helper class to setup some data to try out the package 
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
public class JobsSetup {
    public static void SetupData()
    {
        SetupSkills();
        SetupJobs();
    }

    public static void SetupSkills()
    {
        List<Skill__c> currentSkills=[select id from Skill__c];
        delete currentSkills;
        
        List<Skill__c> newSkills=new List<Skill__c>();
        newSkills.add(new Skill__c(Name='Apex'));
        newSkills.add(new Skill__c(Name='Visualforce'));
        newSkills.add(new Skill__c(Name='JavaScript'));
        newSkills.add(new Skill__c(Name='.Net'));
        newSkills.add(new Skill__c(Name='Java'));
        newSkills.add(new Skill__c(Name='HTML'));
        newSkills.add(new Skill__c(Name='Scrum'));
        newSkills.add(new Skill__c(Name='Prince2'));
        newSkills.add(new Skill__c(Name='Integration'));
        newSkills.add(new Skill__c(Name='CSS'));
        
        insert newSkills;
    }
    
    public static void SetupJobs()
    {
        List<Job_Posting__c> currentJobs=[select id from Job_Posting__c];
        delete currentJobs;
        
        Map<String, Job_Posting__c> newJobMap=new Map<String, Job_Posting__c>();
        newJobMap.put('Graduate Consultant',
             new Job_Posting__c(
                 Name='Graduate Consultant',
                 Description__c='BrightGen are seeking top quality graduates from a Computer Science/Software ' + 
                                'Engineering background with a desire to forge a career in software development ' +
                                'and consultancy. You will have studied object oriented programming such as Java, C#, ' + 
                                '.NET or similar as these provide the transferable skills required to learn Apex, ' + 
                                'the main language used in salesforce.com and force.com developments.<br/><br/>' +
								'You will have stand-out ability and enthusiasm together with a passion for technology, ' + 
                 				'excellent interpersonal skills and a good degree. Our graduate training programme is ' + 
                 			    'focused on enabling you to become a first rate developer and consultant, introducing ' + 
                 				'you to a wide variety of interesting projects and enabling you to take on positions ' + 
                 				'of responsibility early in your career.',
                 Start_Date__c=System.today().addDays(-1),
                 End_Date__c=System.today().addYears(5),
                 Location__c='Witham, ESSEX')
            );

        newJobMap.put('Project Manager',
             new Job_Posting__c(
                 Name='Project Manager',
                 Description__c='BrightGen are looking to hire experienced Project Managers to join our Delivery Team. ' +
                 				'The position can be based in Witham, Essex or our central London office. <br/><br/>' + 
                 				'We offer bespoke Fullforce solutions to our customers across a variety of sectors.<br/><br/>' + 
								'The Project Manager will be responsible, on a project by project basis, for planning, '  +
                 				'leading and delivering services to our customers. The role reports to the Head of Delivery.<br/><br/>' +
								'Ideally for this position you will have the following experience:- <br/><br/> ' + 
								'<ul><li>5+ years of experience in implementing enterprise applications such as CRM, ERP or HRMS, ' + 
                 				'with a solid track record of success.</li>' + 
								'<li>3+ years of experience in consulting and project management.</li>' + 
								'<li>Previous experience running multiple projects of business system improvements.</li>' +
								'<li>Strong analytical and structured problem solving skills.</li>' +
								'<li>Ability to work independently and play multiple roles.</li></ul>' +
								'<br/>Desirable:-<br/><br/>' +
								'<ul><li>Previous Salesforce experience or an understanding.</li> ' +
								'<li>Project Management certifications / methodology recognition.</li></ul>',
                 Start_Date__c=System.today().addDays(-1),
                 End_Date__c=System.today().addYears(5),
                 Location__c='Witham, ESSEX / London')
            );
     
        newJobMap.put('Senior Developer',
             new Job_Posting__c(
                 Name='Senior Developer',
                 Description__c='BrightGen are looking for Senior Developers to join our team, to be based in our central ' + 
                 				'London or Witham, Essex office. <br/>' + 
                 				'As part of the BrightGen team, you will have the opportunity to work with some of the best ' + 
                 				'technical minds in the industry.<br/><br/>' + 
								'Duties and responsibilities include:- <br/><br/>'  +
								'<ul><li>Provide technical expertise and best practice guidance to the wider project/service team</li>' +
								'<li>Review solution summaries</li>' +
								'<li>Mentor junior team members and work well in the wider team to share new ideas and best practice</li>' +
								'<li>Prepare and present knowledge shares to upskill other staff</li>' +
								'<li>Ensure work is completed on time and in budget, with any issues immediately flagged to the Service/Technical Lead</li>' +
								'<li>Review code developed by colleagues to ensure it is performant and meets required standards</li></ul>' +
								'<br/>Ideally for this position you will have the following:- <br/><br/>'  +
								'<ul><li>Minimum 5+ years of development experience, including minimum of 2 years’ Salesforce experience</li>' +
								'<li>Strong Apex (triggers, batch, web services) and Visualforce development skills</li>' +
								'<li>Mentor junior team members and work well in the wider team to share new ideas and best practice</li>' +
								'<li>Experience of JavaScript/Lightning components</li>' +
								'<li>Good understanding of Apex sharing and security models</li>' +
								'<li>Experience of requirements gathering, solution design and estimating development effort for medium to large projects</li>' +
								'<li>Administrator, App Builder, Sales Cloud, Service Cloud certifications (or equivalent experience)</li></ul>',
                 Start_Date__c=System.today().addDays(-1),
                 End_Date__c=System.today().addYears(5),
                 Location__c='Witham, ESSEX / London')
            );
     
        newJobMap.put('Technical Lead',
             new Job_Posting__c(
                 Name='Technical Lead',
                 Description__c='BrightGen are looking to hire Technical Leads to join our team, to be based in our central ' + 
                 				'London or Witham, Essex office. <br/><br/>' + 
                 				'Within the role you will contribute to the design and successful delivery of our Salesforce and Fullforce solutions.<br/><br/>' + 
								'Duties and responsibilities include:- <br/><br/>'  +
								'<ul><li>Taking full ownership of architecture and solution design across multiple projects and clients</li>' +
								'<li>Customer facing with clients to include steering committees also workshops</li>' +
								'<li>Providing technical expertise and best practice guidance to the wider project/service team</li>' +
								'<li>Contributing to the BrightGen Technical Lead Academy also prepare and present knowledge shares to upskill other members of the technical team.</li>' +
								'<br/>Ideally for this position you will have the following:- <br/><br/>'  +
								'<ul><li>Minimum of 7 years’ development experience</li>' +
								'<li>Minimum of 3 years’ Salesforce experience, including 1 year as a Senior Developer</li>' +
								'<li>Expert Apex (triggers, batch, web services) and Visualforce development skills</li>' +
								'<li>Understanding of multiple integration scenarios, including middleware, large scale data migration and JavaScript/Lightning components</li>' +
								'<li>Certifications to include Sales Cloud, Service Cloud, Platform Developer I and II</li></ul>',
                 Start_Date__c=System.today().addDays(-1),
                 End_Date__c=System.today().addYears(5),
                 Location__c='Witham, ESSEX / London')
            );

        insert newJobMap.values();

		// get the skills
        List<Skill__c> skills=[select id, Name from Skill__c];
        Map<String, Skill__c> skillsByName=new Map<String, Skill__c>();
        for (Skill__c skill : skills)
        {
            skillsByName.put(skill.Name, skill);
        }
		
        List<Job_Skill__c> jobSkills=new List<Job_Skill__c>();
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Technical Lead').id, Skill__c=skillsByName.get('Java').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Technical Lead').id, Skill__c=skillsByName.get('.Net').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Technical Lead').id, Skill__c=skillsByName.get('Visualforce').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Technical Lead').id, Skill__c=skillsByName.get('Apex').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Technical Lead').id, Skill__c=skillsByName.get('JavaScript').id));

        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Senior Developer').id, Skill__c=skillsByName.get('Visualforce').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Senior Developer').id, Skill__c=skillsByName.get('Apex').id));
        
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Project Manager').id, Skill__c=skillsByName.get('Prince2').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Project Manager').id, Skill__c=skillsByName.get('Scrum').id));
        
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Graduate Consultant').id, Skill__c=skillsByName.get('Java').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Graduate Consultant').id, Skill__c=skillsByName.get('.Net').id));
        jobSkills.add(new Job_Skill__c(Job_Posting__c=newJobMap.get('Graduate Consultant').id, Skill__c=skillsByName.get('HTML').id));
        
        insert jobSkills;

    }
}