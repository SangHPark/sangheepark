({
    doInit: function(component, event, helper) {
        var action = component.get("c.getItems");
//        alert ("in doInit");      
        action.setCallback(this, function(response) {
//			alert ("in setCallback"); 
            var state = response.getState();
            if (state = "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
            else {
                console.log("Failed with State: " + state);
            }
        });
        $A.enqueueAction(action);
    }
    ,
    handleAddItem: function(component, event, helper) {
		alert('handleAddItem');
        var newItem = event.getParam("item");
                
        helper.createItem(component, newItem);
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