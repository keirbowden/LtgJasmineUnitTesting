({
    myReporter : {
        content : '',
        suites : [],
        totalSuccesses:0,
        totalFailures:0,
        totalTests:0,
        output : function(message) {
            console.log(message);
            this.content+=message;
        },
        clear: function() {
            this.content='';
            this.suites=[];
            this.totalSuccesses=0;
            this.totalFailures=0;
            this.totalTests=0;
        },
        getCurrentSuite: function() {
            return this.suites[this.suites.length-1];
        },
        getCurrentSpec : function() {
            return this.getCurrentSuite().specs[this.getCurrentSuite().specs.length - 1];
        },
        jasmineStarted: function(suiteInfo) {
            this.output('Running suite with ' + suiteInfo.totalSpecsDefined + ' specs');
        },
        suiteStarted: function(result) {
            this.output('Suite started: ' + result.description + ' whose full description is: ' + result.fullName);
            this.suites.push({name : result.fullName,
                              specs : []}); 
        },
        specStarted: function(result) {
            this.output('Spec started: ' + result.description + ' whose full description is: ' + result.fullName);
            this.getCurrentSuite().specs.push({name: result.description,
                                               failures: [],
                                               failureCount: 0,
                                               successes: 0});
        },
        specDone: function(result) {
            console.log('Spec done result = ' + JSON.stringify(result));
            this.output('Spec: ' + result.description + ' complete status was ' + result.status);
            this.output(result.failedExpectations.length + ' failures');
            for(var i = 0; i < result.failedExpectations.length; i++) {
                var failure=result.failedExpectations[i];
                this.output('Failure: ' + failure.message);
                this.output(failure.stack);
                this.getCurrentSpec().failures.push({message: failure.message,
                                                     stack : failure.stack});
                this.getCurrentSpec().failureCount++;
                this.totalFailures++;
            }
            this.output(result.passedExpectations.length + ' successes');
            this.getCurrentSpec().successes+=result.passedExpectations.length;
            this.totalSuccesses+=result.passedExpectations.length;
        },
        suiteDone: function(result) {
            this.output('Suite: ' + result.description + ' was ' + result.status);
            for(var i = 0; i < result.failedExpectations.length; i++) {
                this.output('AfterAll ' + result.failedExpectations[i].message);
                this.output(result.failedExpectations[i].stack);
            }
        },
        jasmineDone: function() {
            this.output('Finished suite');
            this.totalTests=this.totalSuccesses+this.totalFailures;
        }
    },
    initialiseJasmineReporter : function(component, event) {
        console.log('Initialising jasmine reporter');
        this.myReporter.clear();
        var env = jasmine.getEnv();        
        jasmine.getEnv().addReporter(this.myReporter);
      	$A.get("e.c:JasmineReporterInitialisedEvt").fire();
    },
    showResults : function(cmp, ev) {
        this.doShowResults(cmp, ev);
    },
    /* sub-components should override this */
    doShowResults : function(cmp, ev) {
        console.log('Finished tests');
        console.log('Content : ');
        alert(JSON.stringify(this.myReporter.suites, null, 4));
    }
})