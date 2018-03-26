
local fonts = require("fonts")

local function displayText()
  local txtOne = display.newText( "Hello World", 150, 80, "IBMPlexMono", 48 )
  local txtTwo = display.newText( "Hello World", 150, 140, "Roboto", 48 )
end

local function onLoadFonts(e)
  if e.name == 'ready' then
    displayText()
  end
end

fonts.addEventListener(onLoadFonts)

local font_tbl = {
  Roboto = "Roboto-Regular.ttf",
  IBMPlexMono = "IBMPlexMono-Regular.ttf"
}

fonts.load(font_tbl)
