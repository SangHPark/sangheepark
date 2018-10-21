public class UpdatePageLayout {
    public Metadata.Layout buildLayout() {
        List <Metadata.Metadata> layouts = 
            Metadata.Operations.retrieve(Metadata.MetadataType.Layout, new List<String> {'Account-Account Layout'});
        Metadata.Layout layoutMd = (Metadata.Layout) layouts.get(0);
 		Metadata.LayoutSection layoutSectionToEdit = null;
        
        return layoutMd;
    }
}