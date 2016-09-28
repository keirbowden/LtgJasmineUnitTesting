/*******************************************************************************
 * ChatterReporterController
 *
 * Description: 
 * 
 * Custom controller for the Jasmine Chatter Reporter - posts the results of 
 * a test run to chatter, along with a link to find out more details. 
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
public class ChatterReporterController {
	@AuraEnabled
    public static void PostResultsToChatter(String message, String link)
    {
		FeedItem item = new FeedItem();
		item.ParentId = UserInfo.getUserId();
		item.Title = 'Details';
		item.LinkURL = link;
		item.Body = message;
        
        insert item;
    }
}