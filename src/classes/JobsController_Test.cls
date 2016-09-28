/** *****************************************************************************
 * JobsController_Test
 *
 * Description: 
 * 
 * Test class for the JobsController 
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
@isTest
private class JobsController_Test 
{
	@isTest
	static void TestController() 
	{
		JobsSetup.SetupData();
		JobsController.GetRecentJobs();
		List<Skill__c> skills=JobsController.GetSkills();
		JobsController.SearchJobs('test', 'test');
	}
}