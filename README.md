# Lua-DataVis-plugin
plugin for drawing 2D charts in Lua (Corona)
-----------------------------------------------------------------------------------

The plugin supports 4 types of charts:
1) Bar chart (vertical)
2) Bar chart (horizontal)
3) Line chart
4) Point chart

The plugin is connected via the command:
DataVis = require("plugin.DataVis")

Sample code on Lua, to work with the plugin:

local sceneGroup = self.view
graphOptions = {
		left = 10, -- left of your chart
		top = 100, -- top of your chart
		width = display.contentWidth, -- width of your chart
		height = 350, -- height of your chart
		dataset = {dataset1.text, dataset2.text, dataset3.text }, -- dataset's (each value is a line where numbers are indicated, separated by commas, for example, "1,2,3,4,5")
		datasetColors = {dataset1Color, dataset2Color, dataset3Color}, -- (colors of each dataset)
		showCaption = stShowCaption, -- show caption ?
		showLegend = stShowLegend, -- show legend ?
		showGrid = stShowGrid, -- show grid ?
		showAxes = stShowAxes, -- show axes ?
		caption = caption.text -- caption of chart
	}
	if (graphType== "barV") then 
		g = DataVis.barV(display, graphOptions)
	elseif (graphType== "barH") then 	
		g = DataVis.barH(display, graphOptions)
	elseif (graphType== "Line") then 	
		g = DataVis.line(display, graphOptions)	
	elseif (graphType== "Point") then 	
		g = DataVis.point(display, graphOptions)		
	end	
  sceneGroup:insert( g ) 
