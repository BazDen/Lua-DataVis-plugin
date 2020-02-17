local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )background:setFillColor( 1 )	-- white
	sceneGroup:insert( background )
	
	btnShowVBar = widget.newButton {
		shape = 'roundedRect', -- форма кнопки
		raidus = 5, -- радиус скругления уголков
		width = display.contentWidth/2, 
		height = 25, -- размеры кнопки
		left = display.contentCenterX-(display.contentWidth/2)+25, 
		top = 50, 
		fontSize = 16, -- размер шрифта
		fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
		labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
		label = "Bar graph (vertical)", -- текст на кнопке
		
		-- нажатие на кнопку
		onPress =  function(event)
			graphType = "barV"
			composer.showOverlay("viewSettings", {
			isModal = false,
			effect = "fade",
			time = 100
			})
		end
		}
	local logo = display.newImage("barV.png", display.contentCenterX+120, 50)	
		
	sceneGroup:insert(logo)
	sceneGroup:insert( btnShowVBar )
	
	
    -- bar horizontal
	btnShowHBar = widget.newButton {
		shape = 'roundedRect', -- форма кнопки
		raidus = 5, -- радиус скругления уголков
		width = display.contentWidth/2, 
		height = 25, -- размеры кнопки
		left = display.contentCenterX-(display.contentWidth/2-25), 
		top = 120, 
		fontSize = 16, -- размер шрифта
		fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
		labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
		label = "Bar graph (horizontal)", -- текст на кнопке
		-- нажатие на кнопку
		onPress =  function(event)
			graphType = "barH"
			composer.showOverlay("viewSettings", {
			isModal = false,
			effect = "fade",
			time = 100
			})
		end
		}
	local logo = display.newImage("barH.png", display.contentCenterX+120, 120)	
	sceneGroup:insert(logo)	
	sceneGroup:insert( btnShowHBar )
	-- line graph
	btnShowLine = widget.newButton {
		shape = 'roundedRect', -- форма кнопки
		raidus = 5, -- радиус скругления уголков
		width = display.contentWidth/2, 
		height = 25, -- размеры кнопки
		left = display.contentCenterX-(display.contentWidth/2-25), 
		top = 200, 
		fontSize = 16, -- размер шрифта
		fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
		labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
		label = "Line graph", -- текст на кнопке
		-- нажатие на кнопку
		onPress =  function(event)
			graphType = "Line"
			composer.showOverlay("viewSettings", {
			isModal = false,
			effect = "fade",
			time = 100
			})
		end
		}
	local logo = display.newImage("line.png", display.contentCenterX+120, 200)	
	sceneGroup:insert(logo)	
	sceneGroup:insert( btnShowLine )
	-- point graph
	btnShowPoint = widget.newButton {
		shape = 'roundedRect', -- форма кнопки
		raidus = 5, -- радиус скругления уголков
		width = display.contentWidth/2, 
		height = 25, -- размеры кнопки
		left = display.contentCenterX-(display.contentWidth/2-25), 
		top = 270, 
		fontSize = 16, -- размер шрифта
		fillColor = { default={ 4/255, 12/255, 98/255 }, over={ 128/255, 128/255, 128/255 } }, -- цвет кнопки
		labelColor = { default={ 1 }, over={ 0 } }, -- цвет текста
		label = "Point graph", -- текст на кнопке
		-- нажатие на кнопку
		onPress =  function(event)
			graphType = "Point"
			composer.showOverlay("viewSettings", {
			isModal = false,
			effect = "fade",
			time = 100
			})
		end
		}
	local logo = display.newImage("point.png", display.contentCenterX+120, 270)	
	sceneGroup:insert(logo)
	sceneGroup:insert( btnShowPoint )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene