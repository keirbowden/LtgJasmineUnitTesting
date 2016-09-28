<aura:application >
    <ltng:require styles="/resource/SLDS0202/assets/styles/salesforce-lightning-design-system.css" />
    <aura:attribute name="type" type="String" default="" />
    
    <div class="slds">
        <div class="slds-m-bottom--medium">
		    <button class="slds-button slds-button--brand slds-m-top--medium" onclick="{!c.sldsTable}">SLDS Table</button>
    		<button class="slds-button slds-button--brand slds-m-top--medium" onclick="{!c.chatter}">Chatter</button>
        </div>
	   	<c:JobsTest type="{!v.type}" />
    </div>
</aura:application>