# ![logo](icons/logo.png) Corona HTML5 Font Loader Plugin

__Custom web font injector plugin for Corona HTML5 projects.__

 ## Browser Tests

|![chrome](icons/chrome.png)|![ie](icons/ie.png)|![firefox](icons/firefox.png)|![safari](icons/safari.png)|![opera](icons/opera.png)|
|---------------------------|-------------------|-----------------------------|---------------------------|-------------------------|
|![pass](icons/pass.png)|![untested](icons/untested.png)|![pass](icons/untested.png)|![pass](icons/untested.png)|![untested](icons/pass.png)|

## Setup

Download the [Font Loader Plugin](https://github.com/develephant/corona-html5-fontloader-plugin/archive/master.zip).

Move the __plugin/fontloader_js.js__ and __plugin/fontloader.lua__ files to your ___root___ project directory.

Require the plugin early in your project:

```lua
-- main.lua
local fontloader = require("fontloader")
```

## API

### load

Load in the specified custom fonts for use.

```lua
fontloader.load(fonts)
```

The `fonts` argument is a table with the font family as the key, and the font source as the value.

__Make sure to include the font source(s) with your HTML5 build.__

__Example__

```lua
local fonts = {
  Roboto = "Roboto-Regular.ttf",
  IBMPlexMono = "IBMPlexMono-Regular.ttf"
}

fontloader.load(fonts)
```

## Events

You need to wait until your fonts are all loaded before you can use them. 

___You should load your fonts at the start of your project.___

To check that your fonts are all ready, set up an event listener:

```lua
local function displayText()
  local txtOne = display.newText( "Hello World", 150, 80, "IBMPlexMono", 48 )
  local txtTwo = display.newText( "Hello World", 150, 140, "Roboto", 48 )
end

local function onLoadFonts(evt)
  if evt.name == 'ready' then
    displayText()
  end
end

local fonts = {
  Roboto = "Roboto-Regular.ttf",
  IBMPlexMono = "IBMPlexMono-Regular.ttf"
}

fontloader.addEventListener(onLoadFonts)
fontloader.load(fonts)
```

### Other Events

Some other events on teh `name` key you can query are:

 - `loading`: Called when the font loading starts.

 - `failed`: Could not load any fonts. Big problem somewhere!

 - `loaded`: A font has loaded, the name will be in the `data.family` key.

 - `error`: A font could not load, the name will be in the `data.family` key.

__Example__

```lua
local function displayText()
  local txtOne = display.newText( "Hello World", 150, 80, "IBMPlexMono", 48 )
  local txtTwo = display.newText( "Hello World", 150, 140, "Roboto", 48 )
end

local function onLoadFonts(evt)
  if evt.name == 'loading' the
    print("Loading fonts...")
  elseif evt.name == 'failed' then
    print("Something bad happened")
  elseif evt.name == 'ready' then
    displayText()
  elseif evt.name == 'loaded' then
    print("Font "..evt.data.family.." loaded")
  elseif evt.name == 'error' then
    print("Font "..evt.data.family.." could not load")
  end
end

local fonts = {
  Roboto = "Roboto-Regular.ttf",
  IBMPlexMono = "IBMPlexMono-Regular.ttf"
}

fontloader.addEventListener(onLoadFonts)
fontloader.load(fonts)
```

___

&copy;2018 C. Byerley ([develephant](https://develephant.com))
