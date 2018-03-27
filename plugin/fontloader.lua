--#############################################################################
--# Corona HTML5 Custom Font Loader Plugin
--# (c)2018 C. Byerley (develephant)
--#############################################################################
local lib

local platform = system.getInfo("platform")

if platform == 'html5' then
	lib = require("fontloader_js")
else
	local CoronaLibrary = require "CoronaLibrary"
	lib = CoronaLibrary:new{ name='fontloader', publisherId='com.develephant' }

	local function defaultFunction()
		print( "WARNING: The '" .. lib.name .. "' library is not available on this platform." )
	end

  lib.load = defaultFunction
  lib.addEventListener = defaultFunction
end

return lib