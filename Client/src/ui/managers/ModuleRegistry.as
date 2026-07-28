package ui.managers
{
    import ui.modules.Module;
    
    public class ModuleRegistry
    {
        
        private static var modules:Object = {};
        
        public function ModuleRegistry()
        {
            super();
        }
        
        public static function register(name:String, moduleClass:Class) : void
        {
            modules[name] = moduleClass;
        }
        
        public static function create(name:String) : Module
        {
            var moduleClass:Class = modules[name];
            if(moduleClass == null)
            {
                return null;
            }
            return new moduleClass();
        }
        
        public static function exists(name:String) : Boolean
        {
            return modules[name] != null;
        }
    }
}

