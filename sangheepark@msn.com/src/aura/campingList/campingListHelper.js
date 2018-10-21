({
    createItem: function(component, item) {
        alert("in helper");
        var action = component.get("c.saveItem");
        action.setParams ({
            "item" : item
        });
        action.setCallback(this, function(response) {
            alert("in createItem callback");
            var state = response.getState();
            if (state == "SUCCESS") {
                var theItems = component.get("v.items");
                theItems.push(JSON.parse(JSON.stringify(item)));
                
                component.set("v.items", theItems);
                component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                           'Price__c': 0,'Packed__c': false });	
            }
        })
        $A.enqueueAction(action);
    }
    ,
    saveItem: function(component, item, callback) {
        var action = component.get("c.saveItem");
        action.setParams({
            "item" : item
        });
        
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);        
    }
})