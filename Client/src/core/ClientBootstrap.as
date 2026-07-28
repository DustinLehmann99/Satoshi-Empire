package core
{
    import ui.managers.ModelManager;
    import ui.managers.ModuleRegistry;
    import ui.modules.DashboardModule;
    import ui.modules.MiningModule;
    
    public final class ClientBootstrap
    {
        
        public function ClientBootstrap()
        {
            super();
        }
        
        public static function initialize() : void
        {
            ModelManager.initialize();
            ModuleRegistry.register("Dashboard",DashboardModule);
            ModuleRegistry.register("Mining",MiningModule);
        }
    }
}