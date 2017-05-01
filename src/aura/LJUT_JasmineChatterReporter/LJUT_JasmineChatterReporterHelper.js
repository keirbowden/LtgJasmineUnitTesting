({
    doShowResults : function(component) {
        var message;
        if (0==this.myReporter.totalFailures) {
            message='All tests passed';
        }
        else {
            message=this.myReporter.totalFailures + ' test failures';
        }
        var link=window.location.protocol + '//' + window.location.hostname + window.location.pathname + '?type=sldsTable';
        component.set('v.link', link);
        var action = component.get("c.PostResultsToChatter");
        action.setParams({
            "message": message,
            "link":link
        });
        
        var self = this;
        action.setCallback(this, function(response) {
            self.actionResponseHandler(response, self.resultsPosted, component);
        });
        $A.enqueueAction(action);
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
                $A.logf("Errors", errors);
                if (errors[0] && errors[0].message)
                {
                    $A.error("Error message: " + errors[0].message);
                }
            }
            else
            {
                $A.error("Unknown error");
            }
        }
    },
    resultsPosted : function(result, component) {
        component.set('v.posted', true);
    }
})