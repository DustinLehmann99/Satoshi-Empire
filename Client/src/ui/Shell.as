package ui
{
    import core.UIColors;
    import core.UIConstants;
    import events.NavigationEvent;
    import flash.display.Sprite;
    import ui.layout.Desktop;
    import ui.layout.Header;
    import ui.layout.MenuBar;
    import ui.layout.StatusBar;
    
    public class Shell extends Sprite
    {
        
        private var header:Header;
        
        private var menu:MenuBar;
        
        private var desktop:Desktop;
        
        private var status:StatusBar;
        
        public function Shell()
        {
            super();
            this.drawBackground();
            this.build();
        }
        
        private function build() : void
        {
            this.header = new Header();
            addChild(this.header);
            this.menu = new MenuBar();
            this.menu.y = UIConstants.HEADER_HEIGHT;
            this.menu.addEventListener(NavigationEvent.SELECTED,this.navigation);
            addChild(this.menu);
            this.desktop = new Desktop();
            this.desktop.y = UIConstants.DESKTOP_Y;
            addChild(this.desktop);
            this.status = new StatusBar();
            this.status.y = UIConstants.HEIGHT - UIConstants.STATUS_HEIGHT;
            addChild(this.status);
        }
        
        private function drawBackground() : void
        {
            graphics.beginFill(UIColors.BACKGROUND);
            graphics.drawRect(0,0,UIConstants.WIDTH,UIConstants.HEIGHT);
            graphics.endFill();
        }
        
        private function navigation(event:NavigationEvent) : void
        {
            this.desktop.navigate(event.destination);
        }
    }
}

