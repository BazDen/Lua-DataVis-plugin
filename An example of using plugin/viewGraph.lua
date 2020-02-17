-- include DataVis plugin
DataVis = require("plugin.DataVis")

local scene = composer.newScene()

function scene:create(event)
	local sceneGroup = self.view

	
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
		
	graphOptions = {
		left = 10,
		top = 100,
		width = display.contentWidth,
		height = 350,
		dataset = {dataset1.text, dataset2.text, dataset3.text },
		datasetColors = {dataset1Color, dataset2Color, dataset3Color},
		showCaption = stShowCaption,
		showLegend = stShowLegend,
		showGrid = stShowGrid,
		showAxes = stShowAxes,
		caption = caption.text
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
	-- bar:setFillColor( 0 )

	
	btnHide = widget.newButton {
	shape = 'roundedRect', -- форма кнопки
	raidus = 5, -- радиус скругления уголков
	width = (display.contentWidth-50)/2, 
	height = 25, -- размеры кнопки
	left = display.contentCenterX+5, 
	top = display.contentHeight - 100, 
	fontSize = 16, -- размер шрифта
	fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
	labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
	label = "HIDE", -- текст на кнопке
	-- нажатие на кнопку
	onPress =  function(event)
		composer.hideOverlay()
		composer.gotoScene( "viewMain" )
	end
	}
	btnBack = widget.newButton {
	shape = 'roundedRect', -- форма кнопки
	raidus = 5, -- радиус скругления уголков
	width = (display.contentWidth-50)/2, 
	height = 25, -- размеры кнопки
	left = display.contentCenterX-(display.contentWidth/2-25), 
	top = display.contentHeight - 100, 
	fontSize = 18, -- размер шрифта
	fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
	labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
	label = "<<", -- текст на кнопке
	-- нажатие на кнопку
	onPress =  function(event)
		composer.showOverlay("viewSettings", {
			isModal = false,
			effect = "fade",
			time = 0
			})
	end
	}
	sceneGroup:insert( background)
	sceneGroup:insert( g )	
	sceneGroup:insert(btnHide)
	sceneGroup:insert(btnBack)
end

scene:addEventListener("create", scene)

return scene