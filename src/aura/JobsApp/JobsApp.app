<aura:application >
    <ltng:require styles="/resource/SLDS0202/assets/styles/salesforce-lightning-design-system.css"
                  afterScriptsLoaded="{!c.doInit}"/>
    
    <aura:registerEvent name="JobInitEvent" type="c:JobInitEvent" />
    
    <div class="slds">
        
        <div class="slds-page-header" role="banner">
            <div class="slds-grid">
                <div class="slds-col slds-has-flexi-truncate">
                    <div class="slds-media">
                        <div class="slds-media__figure">
                            <c:SVG ariahidden="true" class="slds-icon slds-icon--large slds-icon-standard-news"
                                   xlinkHref="/resource/SLDS0202/assets/icons/standard-sprite/svg/symbols.svg#news" />
                        </div>
                        <div class="slds-media__body">
                            <p class="slds-page-header__title slds-truncate slds-align-middle" title="Blog Posts">Job Listings</p>
                            <p class="slds-text-body--small slds-max-x-small-hide slds-page-header__info">We're hiring • Join us</p>
                        </div>
                    </div>
                </div>
				<aura:if isTrue="false">
                <div class="slds-small-show slds-col slds-no-flex slds-align-bottom">
                    <button class="slds-button slds-button--neutral slds-not-selected" aria-live="assertive"
                            onclick="{!c.navigateToLinks}">
                        <span class="slds-text-not-selected">
                            <c:SVG ariahidden="true" class="slds-button__icon"
                                   xlinkHref="/resource/SLDS0202/assets/icons/utility-sprite/svg/symbols.svg#link" />
                            Links</span>
                    </button>
                </div>
                <div class="slds-x-small-show-only slds-col slds-no-flex slds-align-bottom">
                    <button class="slds-button slds-button--neutral slds-not-selected" aria-live="assertive">
                        <span class="slds-text-not-selected">
                            <c:SVG ariahidden="true" class="slds-button__icon"
                                   xlinkHref="/resource/SLDS0202/assets/icons/utility-sprite/svg/symbols.svg#link" />
                        </span>
                    </button>
                </div>
                </aura:if>
            </div>
        </div>
        
        
        <div class="slds-grid slds-wrap">
            <div class="slds-col slds-size--1-of-1 slds-medium-size--3-of-4">
                <c:JobList />
                <!--			 <aura:if isTrue="{!v.noPosts}"> -->
                <aura:if isTrue="{!false}">
                    <div class="slds-m-around--medium ">
                        You don't have any posts yet. Click the button below to create a couple of samples
                        <br/>
                        <button class="slds-button slds-button--brand slds-m-top--medium" onclick="{!c.createPosts}">Create</button>
                    </div>
                </aura:if>
            </div>
            <div class="slds-col slds-size-1-of-1 slds-medium-size--1-of-4">
                <c:JobSearch />
            </div>
        </div>
        <div class="opaque"/>
        
        <div id="progress" style="display:none">
            <div style="margin-bottom:0px" class="progress progress-striped active">
                <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                </div>
            </div>
        </div>
        <div id="progressold" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%; display:none">
            <span class="sr-only">45% Complete</span>
        </div>
        
    </div>
</aura:application>