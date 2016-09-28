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