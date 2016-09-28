({
    doInit : function(cmp, ev) {
        var type=cmp.get('v.type');
        if (!$A.util.isUndefined(type)) {
            $A.get("e.c:InitialiseJasmineReporterEvt").fire();
        }
    },
    jasmineReporterInitialised : function(cmp, ev) {
        this.doTest(cmp, ev);
    },
    doTest : function(component) {
        // get the child components to run their tests
        component.set('v.completed', 0);
        $A.get("e.c:RunTestsEvent").fire();
    },
    processTestResult : function(component, event) {
        var completed=component.get('v.completed');
        completed++;
        console.log('Completed = ' + completed);
        component.set('v.completed', completed);
        if (2==completed) {
            this.executeJasmine(component);
        }
    },
    executeJasmine : function(component) {
        var env = jasmine.getEnv();        
        env.execute();
        component.set('v.run', true);
    },
    reloadApp : function(component, type) {
        window.location.assign('JobsTestApp.app?type=' + type);
    }
})