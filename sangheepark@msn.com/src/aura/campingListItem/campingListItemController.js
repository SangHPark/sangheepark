({
	packItem : function(component, event, helper) {
		event.getSource().set('v.disabled',true);
        var a = component.get("v.item",true);
        a.Packed__c = true;
        component.set("v.item",a);
	}
})