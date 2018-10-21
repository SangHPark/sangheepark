public class UpdateContactPageLayout {
    public Metadata.Layout addLayoutItem () {
        List <Metadata.Metadata> layoutsList = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, new List<String> {'Contact-Contact Layout'});
        Metadata.Layout layoutMetadata = (Metadata.Layout) layoutsList.get(0);
        
        Metadata.LayoutSection contactLayoutSection = NULL;
        
        List<Metadata.LayoutSection> ListcontactLayoutSection = layoutMetadata.layoutSections;
        for (Metadata.LayoutSection section : ListcontactLayoutSection) {
            if (section.label == 'Additional Information') {
                contactLayoutSection = section;
                break;
            }
        }
        system.debug('Section Label : ' + contactLayoutSection.label);

        List <Metadata.LayoutColumn> contactColumns = contactLayoutSection.layoutColumns;
        for (Metadata.LayoutColumn col : contactColumns) {
            System.debug('contactColumns :' + col.layoutItems);
        }
        
        List <Metadata.LayoutItem> contactLayoutItems =  contactColumns.get(0).layoutItems;
        for (Metadata.LayoutItem item : contactLayoutItems) {
            System.debug('contactLayoutItems :' + item);
        }
        
      
        Metadata.LayoutItem newField = new Metadata.LayoutItem();
        newField.behavior = Metadata.UiBehavior.Edit;
//        newField.field = 'AMAPI__Apex_MD_API_Twitter_name__c';
        newField.field = 'HasOptedOutOfFax';

        contactLayoutItems.add(newField);
        
        for (Metadata.LayoutItem item : contactLayoutItems) {
            System.debug('after added contactLayoutItems :' + item);
        }
            
        return layoutMetadata;
    }
}