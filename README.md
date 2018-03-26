# ![logo](icons/logo.png) Corona HTML5 Font Loader Plugin

__Custom web font injector plugin for Corona HTML5 projects.__

## Usage

Download the [Font Loader Plugin](https://github.com/develephant/corona-html5-fontloader-plugin/archive/master.zip).

Move the __plugin/fontloader_js.js__ and __plugin/fontloader.lua__ files to your ___root___ project directory.

Require the plugin early in your project:

```lua
-- main.lua
local fontloader = require("fontloader")
```

## API

### load

```lua
fontloader.load(fonts)
```

## Events

___

&copy;2018 C. Byerley ([develephant](https://develephant.com))
