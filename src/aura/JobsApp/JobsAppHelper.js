({
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
        var ConsoleReporter = jasmineRequire.ConsoleReporter();
        var options = {
            timer: new jasmine.Timer, 
            print: function () {
                console.log.apply(console,arguments)
            }};
        //            var consoleReporter = new ConsoleReporter(options); // initialize ConsoleReporter
        //            jasmine.getEnv().addReporter(consoleReporter);
//        console.log('My reporter = ' + myReporter);
//        myReporter.clear();
//        jasmine.getEnv().addReporter(this.myReporter);
        env.execute();
        component.set('v.run', true);
    }
})