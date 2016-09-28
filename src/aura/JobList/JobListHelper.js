({
    // function to receive a list of jobs and set into the appropriate component
    // attribute
    receiveJobs : function(component, event) {
        var jobsList=event.getParam("jobWrappers");
        component.set("v.jobWrappers", jobsList);
    },
    //
    // Test functionality
    //
    doTests : function(component, event) {
        console.log('Running tests for JobList')
        this.testReceiveJobs(component);
        $A.get("e.c:TestResultEvent")
		        .setParams({name: "JobList"})
		        .fire();
    },
    //
    // Test the receive jobs functionality
    //
    testReceiveJobs : function(component)
    {
        try
        {
            var self=this;
            describe('Receive Jobs', function() {
                var testJobs =
                    [{
                        job : {
                            Name : 'Test',
                            Description__c : 'Desc'
                        },
                        skills : [
                            { Name : "Java" }
                        ]
                    }];
                
                var event={getParam:function(name){}};
                // stub the methods that will be invoked
                beforeEach(function() {
                    spyOn(event, 'getParam').and.returnValue(testJobs);
                });
                it('sets the jobs from the event into the component', function() {
                    self.receiveJobs(component, event);
                    
                    expect(event.getParam).toHaveBeenCalledTimes(1);
                    var wraps=component.get('v.jobWrappers');
                    expect(wraps.length).toBe(1);
                    expect(wraps[0].job.Name).toBe(testJobs[0].job.Name);
                });   
            });
        }
        catch (e)
        {
            console.log('Error ' + e);
        }
    }
})