({
    doShowResults : function(cmp, ev) {
        console.log('Finished tests');
        console.log('Results = ' + JSON.stringify(this.myReporter.suites, null, 4));
        cmp.set('v.result', this.myReporter);
    }
})