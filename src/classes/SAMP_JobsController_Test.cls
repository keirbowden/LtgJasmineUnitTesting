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
private class SAMP_JobsController_Test 
{
	@isTest 
	static void TestController() 
	{
		SAMP_JobsSetup.SetupData();
		SAMP_JobsController.GetRecentJobs();
		List<Skill__c> skills=SAMP_JobsController.GetSkills();
		SAMP_JobsController.SearchJobs('test', 'test');
	}
}