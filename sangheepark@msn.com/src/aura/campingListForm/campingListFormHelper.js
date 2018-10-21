({
    createItem : function(component, theNewItem) {
        var createEvent = component.getEvent("addItem");
        alert(theNewItem.Name);
         alert(createEvent);
        createEvent.setParams({"item" : theNewItem});
        createEvent.fire();
// reset camping item
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                    'Price__c': 0,'Packed__c': false });        
    }
})