--- This contains a list of all files that will be loaded and the order they are loaded in;
-- to stop a file from loading add "--" in front of it, remove the "--" to have the file be loaded;
-- config files should be loaded after all modules are loaded;
-- core files should be required by modules and not be present in this list;
-- @config File-Loader
return {
    --'example.file_not_loaded',
    'modules.commands.roles',
    'modules.commands.debug',
    'modules.commands.interface',
    
    --Mini-games
    'modules.mini-games.greefer-start',
    'modules.mini-games.admin_overide',
    'modules.mini-games.Race',

    -- Config Files
    'config.expcore-commands.auth_admin', -- commands tagged with admin_only are blocked for non admins
    'config.expcore-commands.auth_roles', -- commands must be allowed via the role config
    'config.expcore-commands.auth_runtime_disable', -- allows commands to be enabled and disabled during runtime
    'config.permission_groups', -- loads some predefined permission groups
    'config.roles', -- loads some predefined roles
}