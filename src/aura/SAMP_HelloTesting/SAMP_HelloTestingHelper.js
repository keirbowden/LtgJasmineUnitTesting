({
	returnSomething : function() {
		return 'Hello Return';
    },
	setValueOnComponent: function(component) {
		component.set('v.value', 'Hello Component');
    },
	logWarning: function(component) {
		console.warn('Hello Log!');
    },
    
    //
    // Test functionality
    //
    doTests : function(component, event) {
        console.log('Running tests for SAMP_HelloTesting')
        this.testReturnSomething();
        this.testSetValueOnComponent(component);
        this.testLogWarning();
        $A.get("e.c:LJUT_TestResultEvent")
		        .setParams({name: "SAMP_HelloTesting"})
		        .fire();
    },
    testReturnSomething : function() {
        var self=this;
        describe('returnSomething', function() {
            it('returns "Hello Return"', function() {
                var result = self.returnSomething();
                expect(result).toEqual('Hello Return');
            });   
        });
    },
    testSetValueOnComponent : function(component) {
        var self=this;
        describe('setValueOnComponent', function() {
            it('sets value to "Hello Component"', function() {
            	self.setValueOnComponent(component);
                var result = component.get('v.value');
                expect(result).toEqual('Hello Component');
            });   
        });
    },
    testLogWarning : function() {
        var self=this;
        describe('logWarning', function() {
            it('is called once', function() {
            	// This spy replaces my function, so I can't test what it normally does or returns!!!!
                spyOn(self, 'logWarning');
                	
                self.logWarning();
                expect(self.logWarning).toHaveBeenCalledTimes(1);
            });   
        });
    }    
})