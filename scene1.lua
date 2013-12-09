---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer

-- Touch event listener for background image
local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "scene2", "crossFade", 1000  )
		
		return true
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	
	image = display.newImageRect( "images/paperBG5.png", display.contentWidth * 1.2, display.contentHeight * 1.2)
	image:setReferencePoint( display.CenterReferencePoint )
	image.x = display.contentCenterX
	image.y = display.contentCenterY

	screenGroup:insert( image )
	
	image.touch = onSceneTouch
	
	text1 = display.newText( "Would you like a story?", display.contentWidth * 0.05, display.contentHeight * 0.2, display.contentWidth, display.contentHeight, "Brankovic", 30 )
	text1:setTextColor( 0 )
	text1:setReferencePoint( display.LeftReferencePoint )
--	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.5
	screenGroup:insert( text1 )
	
	text3 = display.newText( "Yes Please!", 0, 0, "Brankovic", 18 )
	text3:setTextColor( 0 ); text3.isVisible = false
	text3:setReferencePoint( display.CenterReferencePoint )
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight - 100
	screenGroup:insert( text3 )
	
--	print( "\n1: createScene event")
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
--	print( "1: enterScene event" )
	
	-- remove previous scene's view
	storyboard.purgeScene( "scene4" )
	
	-- Update Lua memory text display
	local showMem = function()
		image:addEventListener( "touch", image )
		text3.isVisible = true
	end
	memTimer = timer.performWithDelay( 1000, showMem, 1 )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	
--	print( "1: exitScene event" )
	
	-- remove touch listener for image
	image:removeEventListener( "touch", image )
	
	-- cancel timer
	timer.cancel( memTimer ); memTimer = nil;
	storyboard.purgeScene( "scene2" )
	-- reset label text
--	text2.text = "MemUsage: "
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	
--	print( "((destroying scene 1's view))" )
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