
-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )

-- require controller module
local storyboard = require "storyboard"
local widget = require "widget"

-- load first scene
storyboard.gotoScene( "scene1", "crossFade", 1000 )

--
-- Display objects added below will not respond to storyboard transitions
--
