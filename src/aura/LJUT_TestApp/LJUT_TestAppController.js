({
    doInit : function(component, event, helper) {
        helper.doInit(component, event);
    },
	doTest : function(component, event, helper) {
        helper.doTest(component);
	},
    jasmineReporterInitialised : function(component, event, helper) {
        helper.jasmineReporterInitialised(component, event);
    },
    processTestResult : function(component, event, helper) {
        helper.processTestResult(component, event);
    },
    sldsTable : function(component, event, helper) {
        helper.reloadApp(component, 'sldsTable');
    },
    chatter : function(component, event, helper) {
        helper.reloadApp(component, 'chatter');
    }
})