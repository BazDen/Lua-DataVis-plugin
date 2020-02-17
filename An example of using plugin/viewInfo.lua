-----------------------------------------------------------------------------------------
--
-- viewInfo.lua
--
-----------------------------------------------------------------------------------------

local scene = composer.newScene()
local logo = display.newImage("github.png", display.contentCenterX, display.contentCenterY)

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	local function scrollListener( event )
		local phase = event.phase
		-- if ( phase == "began" ) then print( "Scroll view was touched" )
		-- elseif ( phase == "moved" ) then print( "Scroll view was moved" )
		-- elseif ( phase == "ended" ) then print( "Scroll view was released" )
		-- end
 
		-- -- In the event a scroll limit is reached...
		-- if ( event.limitReached ) then
			-- if ( event.direction == "up" ) then print( "Reached bottom limit" )
			-- elseif ( event.direction == "down" ) then print( "Reached top limit" )
			-- elseif ( event.direction == "left" ) then print( "Reached right limit" )
			-- elseif ( event.direction == "right" ) then print( "Reached left limit" )
			-- end
		-- end
		return true
	end
	
	local scrollView = widget.newScrollView
    {
        left = 0,
        top = 0,
        width = display.contentWidth-5,
        height = display.contentHeight,
        bottomPadding = 50,
        id = "onBottom",
        horizontalScrollDisabled = true,
        verticalScrollDisabled = false,
		scrollWidth = 20,
		scrollHeight = 20,
        listener = scrollListener,
		scrollBarOptions = {
            sheet = scrollBarSheet,
            topFrame = 1,
            middleFrame = 2,
            bottomFrame = 3,
        }
    }


    local titleText1 = display.newText("Designed by Denis Bazarnov", display.contentCenterX, display.contentCenterY - 70, native.systemFont, 12)
    titleText1:setFillColor( 0 )
    scrollView:insert( titleText1 )
	local titleText2 = display.newText("bazarnov.da@gmail.com", display.contentCenterX, display.contentCenterY - 50, native.systemFont, 12)
    titleText2:setFillColor( 0 )
    scrollView:insert( titleText2 )
	local titleText3 = display.newText("me on GitHub", display.contentCenterX, display.contentCenterY + 50, native.systemFont, 12)
    titleText3:setFillColor( 0 )
    scrollView:insert( titleText3 )
	
	scrollView:insert( logo )

	-- типа дохера текста
    -- local lotsOfText = "test 123111111111111111111111111"
	-- local lotsOfTextObject = display.newText( lotsOfText, display.contentCenterX, 0, 250, 0, "Helvetica", 14)
    -- lotsOfTextObject:setFillColor( 0 ) 
    -- lotsOfTextObject.anchorY = 0.0      -- Top
    -- lotsOfTextObject.y = titleText.y + titleText.contentHeight + 10
    -- scrollView:insert( lotsOfTextObject )

	-- all objects must be added to group (e.g. self.view)

	sceneGroup:insert( background )
	sceneGroup:insert( scrollView )


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
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

function selectLogo(event)
	system.openURL( "https://github.com/BazDen" )
end

---------------------------------------------------------------------------------


-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
logo:addEventListener("touch", selectLogo)

-----------------------------------------------------------------------------------------

return scene