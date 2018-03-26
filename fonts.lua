--#############################################################################
--# HTML5 Custom Fonts Plugin
--#############################################################################
local lib
local platform = system.getInfo("platform")
if platform == 'html5' then
	lib = require("fonts_js")
else
	local CoronaLibrary = require "CoronaLibrary"
	lib = CoronaLibrary:new{ name='fonts', publisherId='com.develephant' }

	local function defaultFunction()
		print( "WARNING: The '" .. lib.name .. "' library is not available on this platform." )
	end

  lib.load = defaultFunction
end

return lib