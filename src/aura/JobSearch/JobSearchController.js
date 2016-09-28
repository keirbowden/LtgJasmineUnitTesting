({
	doInit: function(component, event, helper) {
        try
        {
            helper.initialise(component);
        }
        catch (exc)
        {
            console.log('Exception ' + exc);
            console.log(helper.getStackTrace());
        }
    },
    doSearch: function(component, event, helper) {
        helper.doSearch(component);
    },
    clearSearch: function(component, event, helper) {
        helper.clearSearch(component);
    },
    doTest: function(component, event, helper) {
        helper.doTest(component);
    },
    runTests: function(component, event, helper)
    {
//        helper.runTests(component, event);
    }
})