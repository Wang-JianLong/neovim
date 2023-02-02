require('basic')
require('maps')

local is_linux_env = os.getenv('SHELL') ~= nil;
require('extends').env(is_linux_env)
