({
	doInit : function(component, event, helper) {
		$A.get("e.c:JobInitEvent").fire();
	},
	doTest : function(component, event, helper) {
        helper.doTest(component);
	},
    processTestResult : function(component, event, helper) {
        helper.processTestResult(component, event);
    }
})