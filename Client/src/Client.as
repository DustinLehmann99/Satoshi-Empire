package
{
    import core.ClientBootstrap;
    import core.HttpClient;
    import core.SyncManager;
    import flash.display.Sprite;
    import ui.Shell;
    
    public class Client extends Sprite
    {
        private var http:HttpClient;
        private var shell:Shell;
        private var sync:SyncManager;
        
        public function Client()
        {
            super();
            ClientBootstrap.initialize();
            this.shell = new Shell();
            addChild(this.shell);
            this.http = new HttpClient();
            this.http.connect("001");
            sync = new SyncManager(http, "001");
			sync.start();
        }
    }
}

