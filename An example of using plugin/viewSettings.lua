local scene = composer.newScene()

function scene:create(event)
	local sceneGroup = self.view
	
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	local function onSwitch( event )
		local switch = event.target
		if (switch.id == "cBoxShowCaption") then
			if (switch.isOn == true) then 
				stShowCaption = false
	
			else
				stShowCaption = true
			end
		elseif (switch.id == "cBoxShowLegend") then
			if (switch.isOn == true) then 
				stShowLegend = false
	
			else
				stShowLegend = true
			end
		elseif (switch.id == "cBoxShowGrid") then
			if (switch.isOn == true) then 
				stShowGrid = false
			else
				stShowGrid = true
			end
		elseif (switch.id == "cBoxShowAxes") then
			if (switch.isOn == true) then 
				stShowAxes = false
			else
				stShowAxes = true
			end	
		end
	end
	
	-- Show caption 
	local labelShowCaption = display.newText( "Show caption", display.contentCenterX-display.contentWidth/2+65, 65, native.systemFont, 16)
    labelShowCaption:setFillColor( 0 )
	caption = native.newTextField( display.contentCenterX-display.contentWidth/2+350, 65, display.contentWidth/2-50, 30 )
	caption.font = native.newFont( native.systemFont, 16 )
	caption.text = "Chart title"
	caption.isEditable = true
	local cBoxShowCaption = widget.newSwitch(
		{
			left = display.contentCenterX+155,
			top = 50,
			style = "onOff",
			id = "cBoxShowCaption",
			onPress = onSwitch
		}
	)
	cBoxShowCaption:setState({isOn=true})
	stShowCaption = true
	
	-- Show legend
	local labelShowLegend = display.newText( "Show legend", display.contentCenterX-display.contentWidth/2+65, 105, native.systemFont, 16)
    labelShowLegend:setFillColor( 0 )
	local cBoxShowLegend = widget.newSwitch(
		{
			left = display.contentCenterX+155,
			top = 90,
			style = "onOff",
			id = "cBoxShowLegend",
			onPress = onSwitch
		}
	)
	cBoxShowLegend:setState({isOn=true})
	stShowLegend = true
	
	-- Show grid
	local labelShowGrid = display.newText( "Show grid", display.contentCenterX-display.contentWidth/2+55, 145, native.systemFont, 16)
    labelShowGrid:setFillColor( 0 )
	local cBoxShowGrid = widget.newSwitch(
		{
			left = display.contentCenterX+155,
			top = 130,
			style = "onOff",
			id = "cBoxShowGrid",
			onPress = onSwitch
		}
	)
	cBoxShowGrid:setState({isOn=true})
	stShowGrid = true
	
	-- Show axes
	local labelShowAxes = display.newText( "Show axes", display.contentCenterX-display.contentWidth/2+55, 185, native.systemFont, 16)
    labelShowAxes:setFillColor( 0 )
	local cBoxShowAxes = widget.newSwitch(
		{
			left = display.contentCenterX+155,
			top = 170,
			style = "onOff",
			id = "cBoxShowAxes",
			onPress = onSwitch
		}
	)
	cBoxShowAxes:setState({isOn=true})
	stShowAxes = true
		
	local dataset1Label = display.newText( "DataSet №1", display.contentCenterX-display.contentWidth/2+55, display.contentCenterY, native.systemFont, 16)
    dataset1Label:setFillColor( 0 )
    
	local dataset2Label = display.newText("DataSet №2", display.contentCenterX-display.contentWidth/2+55, display.contentCenterY+50, native.systemFont, 16)
    dataset2Label:setFillColor( 0 )
	
	local dataset3Label = display.newText("DataSet №3", display.contentCenterX-display.contentWidth/2+55, display.contentCenterY+100, native.systemFont, 16)
    dataset3Label:setFillColor( 0 )
	
	dataset1 = native.newTextField( display.contentCenterX-10, display.contentCenterY, display.contentWidth/2, 30 )
	dataset1.font = native.newFont( native.systemFont, 16 )
	dataset1.text = "5, 2, 3, 4, 5, 6, 7, 8, 9, 10,  9, 8, 7, 6, 5"
	dataset1.isEditable = true
	dataset1ColorRect = display.newRect( display.contentCenterX+250, display.contentCenterY, 30, 30 )
	dataset1Color = {1,0,0,0.5}
	dataset1ColorRect:setFillColor( unpack(dataset1Color) )	
	
	dataset2 = native.newTextField( display.contentCenterX-10, display.contentCenterY+50, display.contentWidth/2, 30 )
	dataset2.font = native.newFont( native.systemFont, 16 )
	dataset2.text = "3, 4, 7, 9, 12, 1, 1, 5, 5, 3, 9, 8, 7, 6, 5"
	dataset2.isEditable = true
	dataset2ColorRect = display.newRect( display.contentCenterX+250, display.contentCenterY+50, 30, 30 )
	dataset2Color = {0,1,0,0.5}
	dataset2ColorRect:setFillColor( unpack(dataset2Color) )
	
	dataset3 = native.newTextField( display.contentCenterX-10, display.contentCenterY+100, display.contentWidth/2, 30 )
	dataset3.font = native.newFont( native.systemFont, 16 )
	dataset3.text = "9, 8, 7, 6, 5, 4, 3, 4, 5, 6, 7, 8, 9, 10, 11"
	dataset3.isEditable = true
	dataset3ColorRect = display.newRect( display.contentCenterX+250, display.contentCenterY+100, 30, 30 )
	dataset3Color = {0,0,1,0.5}
	dataset3ColorRect:setFillColor( unpack(dataset3Color) )	
	
	btnNext = widget.newButton {
	shape = 'roundedRect', -- форма кнопки
	raidus = 5, -- радиус скругления уголков
	width = (display.contentWidth-50)/2, 
	height = 25, -- размеры кнопки
	left = display.contentCenterX + 5, 
	top = display.contentHeight - 100, 
	fontSize = 18, -- размер шрифта
	fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
	labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
	label = ">>", -- текст на кнопке
	-- нажатие на кнопку
	onPress =  function(event)
		composer.showOverlay("viewGraph", {
			isModal = false,
			effect = "fade",
			time = 0
			})
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
		composer.hideOverlay()
		composer.gotoScene( "viewMain" )
	end
	}
	sceneGroup:insert( background)
	sceneGroup:insert( labelShowCaption )
	sceneGroup:insert( caption )
	sceneGroup:insert( cBoxShowCaption )
	sceneGroup:insert( labelShowLegend )
	sceneGroup:insert( cBoxShowLegend )
	sceneGroup:insert( labelShowGrid )
	sceneGroup:insert( cBoxShowGrid )
	sceneGroup:insert( labelShowAxes )
	sceneGroup:insert( cBoxShowAxes )
	
	sceneGroup:insert(dataset1Label)
	sceneGroup:insert(dataset2Label)
	sceneGroup:insert(dataset3Label)
	sceneGroup:insert(dataset1)
	sceneGroup:insert(dataset2)
	sceneGroup:insert(dataset3)
	sceneGroup:insert(dataset1ColorRect)
	sceneGroup:insert(dataset2ColorRect)
	sceneGroup:insert(dataset3ColorRect)
	sceneGroup:insert(btnNext)
	sceneGroup:insert(btnBack)
end

scene:addEventListener("create", scene)

return scene