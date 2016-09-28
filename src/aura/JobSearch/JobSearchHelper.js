({
    // displays the progress bar if the progress counter is > 0
    showProgress : function(component) {
        component.set('v.showWorking', true);
    },
    
    // hides the progress bar if the progress counter is 0
    hideProgress : function (component) {
        component.set('v.showWorking', false);
    },
    
    // sets up event handlers, skills checkboxes and recent jobs
    initialise : function (component) {
        var self=this;
        this.getSkills(component);
        this.getLatestJobs(component);
    },
    
    // clears the search terms and skills checkboxes and reverts the jobs list to the recent jobs view
    clearSearch : function(component) {
        var skillsEles=document.querySelectorAll('[id^="skillcb_"]:checked');
        
        for (var idx=0, len=skillsEles.length; idx<len; idx++) {
            skillsEles[idx].checked=false;
        };
        component.set('v.searchString', '');
        this.getLatestJobs(component);
    },
    
    // executes a search based on the entered terms and selected skill sets
    doSearch : function(component) {
        console.log('In doSearch');
        this.showProgress(component);
        var term=component.get('v.searchString');
        var skills=[];
        var skillsEles=document.querySelectorAll('[id^="skillcb_"]:checked');
        
        for (var idx=0, len=skillsEles.length; idx<len; idx++) {
            skills.push(skillsEles[idx].value);
        };
        var skillsStr=skills.join();
        console.log('Term = ' + term);
        console.log('SkillsStr = ' + skillsStr);
        this.getJobs(component, term, skillsStr);
    },
    getJobs : function(component, term, skillsStr) {
        var action = component.get("c.SearchJobs");
        action.setParams({
            "searchStr": term,
            "skillsStr":skillsStr
        });
        
        var self = this;
        action.setCallback(this, function(response) {
            self.actionResponseHandler(response, self.renderJobs, component);
        });
        $A.enqueueAction(action);
    },
    // get the latest jobs from the server
    getLatestJobs : function(component) {
        this.showProgress(component);
        var action = component.get("c.GetRecentJobs");
        var self = this;
        console.log('Getting latest jobs');
        action.setCallback(this, function(response) {
            self.actionResponseHandler(response, self.renderJobs, component);
        });
        $A.enqueueAction(action);
    },
    
    // get the skills from the server
    getSkills : function (component) {
        this.showProgress(component);
        var action = component.get("c.GetSkills");
        var self = this;
        action.setCallback(this, function(response) {
            self.actionResponseHandler(response, self.renderSkills, component);
        });
        $A.enqueueAction(action);
    },
    renderJobs : function(wrappers, component) {
        console.log('Sending job list event with wrappers ' + wrappers);
        $A.get("e.c:JobListEvent").
        setParams({jobWrappers: wrappers}).fire();
        
        if (0==wrappers.length)
        {
            var toastEvent = $A.get("e.force:showToast");
            if (null!=toastEvent) {
                toastEvent.setParams({
                    "type": "warning",
                    "title": "No Matches",
                    "message": "No matching jobs found."
                });
                toastEvent.fire();
            }
            else {
                alert('No matching jobs');
            }
        }
    },
    renderSkills : function(skills, component) {
        component.set("v.skills", skills);
    },
    actionResponseHandler : function (response, cb, component) {
        var state = response.getState();
        if (state === "SUCCESS")
        {
            var retVal=response.getReturnValue();
            console.log('Result = ' + JSON.stringify(retVal));
            cb(retVal, component);
        }
        else if (state === "ERROR")
        {
            var errors = response.getError();
            if (errors)
            {
                console.log("Errors", errors);
                if (errors[0] && errors[0].message)
                {
                    alert("Error message: " + errors[0].message);
                }
            }
            else
            {
                alert("Unknown error");
            }
        }
        this.hideProgress(component);
    },
    // stack trace function - simply execute console.log(getStackTrace()); or similar - tested in chrome
    getStackTrace : function() {
        var obj = {};
        if (typeof Error.captureStackTrace == 'function')
        {
            Error.captureStackTrace(obj, getStackTrace);
            return obj.stack;
        }
        else
        {
            return 'Stack trace not supported';
        }
    },
    //
    // Test methods
    //
    doTest : function(component, event) {
        console.log('Running JobSearch tests');
        
        this.testDoSearch(component, event);
        this.testInitialise(component, event);
        this.testClearSearch(component, event);
        
        // notify that tests are added to Jasmine
        $A.get("e.c:TestResultEvent")
        	.setParams({name: "JobSearch"})
	        .fire();
    },
    testDoSearch: function(component, event) {
        var self=this;
        describe('Run Search', function() {
            
            beforeEach(function() {
                component.set('v.searchString', 'unit test');
                spyOn(self, 'getJobs');
            });
            
            it('runs a search', function() {
                self.doSearch(component);
                expect(self.getJobs).toHaveBeenCalledTimes(1);
            });   
            
            it('shows the progress spinner', function() {
                spyOn(self, 'showProgress');
                self.doSearch(component);
                expect(self.showProgress).toHaveBeenCalledTimes(1);
            });   
        });
    },
    testInitialise: function(component, event)
    {
        var self=this;
        describe('Initialise', function() {
            beforeEach(function() {
                spyOn(self, 'getLatestJobs');
            });
            it('gets the skills', function() {
                spyOn(self, 'getSkills');
                self.initialise(component)
                expect(self.getSkills).toHaveBeenCalledTimes(1);
            });   
            it('gets the latest jobs', function() {
                self.initialise(component)
                expect(self.getLatestJobs).toHaveBeenCalledTimes(1);
            });   
        });
    },
    testClearSearch: function(component, event) {
        console.log('Running tests');
        var self=this;
        describe('Clear Search', function() {
            // stub the methods that will be invoked
            it('clears the search string', function() {
                component.set('v.searchString', 'unit test');
                self.clearSearch(component);
                expect(component.get('v.searchString')).toEqual('');
            });   
            it('gets the latest jobs', function() {
                console.log('Component = ' + component);
                spyOn(self, 'getLatestJobs');
                self.clearSearch(component);
                expect(self.getLatestJobs).toHaveBeenCalledTimes(1);
            });   
        });
    }
})