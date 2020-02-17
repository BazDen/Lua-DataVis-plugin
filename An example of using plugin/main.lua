-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- include Corona's "widget" library
widget = require "widget"
composer = require "composer"

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

sceneViewBar = composer.newScene()

-- event listeners for tab buttons:
local function onViewMain( event )
	composer.gotoScene( "viewMain" )

end

local function onViewInfo( event )
	composer.gotoScene( "viewInfo" )

end

-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="", defaultFile="btnBar.png", overFile="btnBarBlue.png", width = 32, height = 32, onPress=onViewMain },
	{ label="", defaultFile="btnInfo.png", overFile="btnInfoBlue.png", width = 32, height = 32, onPress=onViewInfo }
}

-- create the actual tabBar widget
tabBar = widget.newTabBar{
	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}

-- scrollBar options
scrollBarOpt = {
		width = 20,
		height = 60,
		numFrames = 1,
	}
			
scrollBarSheet = graphics.newImageSheet( "scrollBar.png", scrollBarOpt )


onViewMain()	-- invoke first tab button's onPress event manually
