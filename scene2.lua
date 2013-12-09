---------------------------------------------------------------------------------
--
-- scene2.lua
--
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require('stringCollection')

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, text4, memTimer, randStringA, randStringB, randStringC


firstStoryPointFile = system.pathForFile("firstStoryPoint")
secondStoryPointFile = system.pathForFile("secondStoryPoint")
thirdStoryPointFile = system.pathForFile("thirdStoryPoint")

local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "scene3", "crossFade", 800  )
		
		return true
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	
	image = display.newImageRect( "images/paperBG4.png", display.contentWidth*1.2, display.contentHeight*1.2)
	image:setReferencePoint( display.CenterReferencePoint )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	screenGroup:insert( image )
	
	image.touch = onSceneTouch
	text1 = display.newText( getRandomLineFromFile(firstStoryPointFile), 10, 30, display.contentWidth * 0.9, display.contentHeight, "Brankovic", 35 )
	text1:setTextColor( 0 )
	text1:setReferencePoint( display.CenterReferencePoint )
--	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )
	
	text2 = display.newText( getRandomLineFromFile(secondStoryPointFile), 10, 150, display.contentWidth * 0.9, display.contentHeight, "Brankovic", 35 )
	text2:setTextColor( 0 )
	text2:setReferencePoint( display.CenterReferencePoint )
--	text2.x, text2.y = display.contentWidth * 0.5, 150
	screenGroup:insert( text2 )
	
	text3 = display.newText( getRandomLineFromFile(thirdStoryPointFile), 10, 280, display.contentWidth * 0.9, display.contentHeight, "Brankovic", 35 )
	text3:setTextColor( 0 )
	text3:setReferencePoint( display.CenterReferencePoint )
--	text3.x, text3.y = display.contentWidth * 0.5, 250
	screenGroup:insert( text3 )
	
	text4 = display.newText( "Touch for another story", 0, 0, "Brankovic", 18 )
	text4:setTextColor( 0 ); text4.isVisible = false
	text4:setReferencePoint( display.CenterReferencePoint )
	text4.x, text4.y = display.contentWidth * 0.5, display.contentHeight - 50
	screenGroup:insert( text4 )
	
--	print( "\n2: createScene event" )
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
--	print( "2: enterScene event" )
	
	-- remove previous scene's view
	storyboard.purgeScene( "scene1" )
	
	-- Update Lua memory text display
	local showMem = function()
		image:addEventListener( "touch", image )
		text4.isVisible = true
	end
	memTimer = timer.performWithDelay( 1000, showMem, 1 )
end


-- Called when scene is about to move offscreen:
function scene:exitScene(event)
	
--	print( "2: exitScene event" )
	
	-- remove touch listener for image
	image:removeEventListener( "touch", image )
	
	-- cancel timer
	timer.cancel( memTimer ); memTimer = nil;
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	
--	print( "((destroying scene 2's view))" )
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