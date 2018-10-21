public class DeployMetadata {
    public Metadata.DeployContainer constructDeploymentRequest() {
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        
        Metadata.Layout LayoutMetadata = new UpdateContactPageLayout().addLayoutItem();
        container.addMetadata(LayoutMetadata);
            
        return container;
    }
    
    public void deploy(Metadata.DeployContainer container) {
        PostInstallCallback callback = new PostInstallCallback();
        
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, callback);
    }
}