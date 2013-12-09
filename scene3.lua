---------------------------------------------------------------------------------
--
-- scene3.lua
--
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local memTimer

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	
	image = display.newImageRect( "images/paperBG4.png", display.contentWidth*1.2, display.contentHeight*1.2)
	image:setReferencePoint( display.CenterReferencePoint )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	screenGroup:insert( image )
	
--	print( "\n3: createScene event" )
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
--	print( "3: enterScene event" )
	
	-- remove previous scene's view
	storyboard.purgeScene( "scene2" )
	
	-- Update Lua memory text display
	local showMem = function()
			storyboard.gotoScene( "scene2", "crossFade", 0  )	
	end
	memTimer = timer.performWithDelay( 10, showMem, 1 )
end


-- Called when scene is about to move offscreen:
function scene:exitScene(event)
	
--	print( "3: exitScene event" )
	
	-- cancel timer
	timer.cancel( memTimer ); memTimer = nil;
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	
--	print( "((destroying scene 3's view))" )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene