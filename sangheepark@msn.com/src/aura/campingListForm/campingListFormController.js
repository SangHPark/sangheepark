({
    clickCreateItem: function(component, event, helper) {
        var validCampingList = component.find('campingItemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validCampingList){
            // Create the new expense
            var theNewItem = component.get("v.newItem");
            var theItems = component.get("v.items");
           
            //console.log("Create Item: " + JSON.stringify(theNewItem));
            helper.createItem(component, theNewItem);
        }
    }
})