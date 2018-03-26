--#############################################################################
--# Corona HTML5 Custom Font Loader Demo
--# (c)2018 C. Byerley (develephant)
--#############################################################################
local fontloader = require("fontloader")

local function displayText()
  local txtOne = display.newText( "Hello World", 150, 80, "IBMPlexMono", 48 )
  local txtTwo = display.newText( "Hello World", 150, 140, "Roboto", 48 )
end

local function onLoadFonts(e)
  if e.name == 'ready' then
    displayText()
  end
end

fontloader.addEventListener(onLoadFonts)

local fonts = {
  Roboto = "Roboto-Regular.ttf",
  IBMPlexMono = "IBMPlexMono-Regular.ttf"
}

fontloader.load(fonts)
