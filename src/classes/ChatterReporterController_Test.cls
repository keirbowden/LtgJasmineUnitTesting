/** *****************************************************************************
 * ChatterReporterController_Test
 *
 * Description: 
 * 
 * Test class for the ChatterReporterController 
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
private class ChatterReporterController_Test 
{
	@isTest
	static void TestController() 
	{
		ChatterReporterController.PostResultsToChatter('Unit Test', 'http://www.brightgen.com');
	}
}