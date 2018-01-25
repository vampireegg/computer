-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
local totalHeight = 1080
local totalWidth = 1920
local background
local bgRect
local index
local showName
local speed1 = 8
local speed2 = 55
local backgroundMusic
local backgroundMusicChannel

local passwordField
local sceneGroup



--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function on_frame( event )
	bgRect.r = bgRect.r + bgRect.rinc * 0.0005
	if(bgRect.r > 0.3 or bgRect.r <= 0) then
		bgRect.rinc = bgRect.rinc * -1
	end
	
	bgRect.g = bgRect.r + bgRect.rinc *0.007
	if(bgRect.g > 0.3 or bgRect.g <= 0) then
		bgRect.ginc = bgRect.ginc * -1
	end
	
	bgRect.b = bgRect.b + bgRect.binc * 0.0004
	if(bgRect.b > 0.3 or bgRect.b <= 0) then
		bgRect.binc = bgRect.binc * -1
	end
	
	bgRect:setFillColor(bgRect.r, bgRect.g, bgRect.b, 1)
end

function scene:create( event )
	sceneGroup = self.view
	index = 1
	showName = true

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	

	--local myText = display.newText( options )
	
	bgRect = display.newRect(sceneGroup, totalWidth/2, totalHeight/2, totalWidth, totalHeight)
	bgRect.r = 0.1
	bgRect.g = 0.1
	bgRect.b = 0.2
	bgRect.rinc = 1
	bgRect.ginc = 1
	bgRect.binc = -1
	bgRect:setFillColor(bgRect.r, bgRect.g, bgRect.b, 1)
	
	background = display.newImageRect( sceneGroup, "city3.png", totalWidth, totalHeight )
	background.x = totalWidth/2
	background.y = totalHeight/2
	--background:setFillColor(0.8, 0.1, 0.3, 1)
	
	local taskbarHeight = 50
	background.taskbar = display.newRect(sceneGroup, totalWidth/2, totalHeight - taskbarHeight / 2, totalWidth, taskbarHeight)
	background.taskbar:setFillColor(0.5,0.5,0.5,0.7)
	
	background.icons = {}
	background.icons[1] = display.newImageRect( sceneGroup, "pc.png", 512, 512 )
	background.icons[1].x = 120
	background.icons[1].y = 100
	background.icons[1]:scale(0.14,0.14)
	background.icons[1].txt = display.newText(sceneGroup,"This PC", background.icons[1].x , background.icons[1].y + 60,  "calibri.ttf", 20 )
	
	background.icons[2] = display.newImageRect( sceneGroup, "ghrome.png", 512, 512 )
	background.icons[2].x = 120
	background.icons[2].y = 250
	background.icons[2]:scale(0.14,0.14)
	background.icons[2].txt = display.newText(sceneGroup,"Coogle\nGhrome", background.icons[2].x , background.icons[2].y + 80,  "calibri.ttf", 20 )
	
	background.taskbar.icons = {}
	background.taskbar.icons[1] = display.newImageRect( sceneGroup, "door.png", 512, 512 )
	background.taskbar.icons[1].x = 25
	background.taskbar.icons[1].y = totalHeight	- 25
	background.taskbar.icons[1]:scale(0.08,0.08)
	
	
	
	-- create/position logo/title image on upper-half of the screen

	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		Runtime:addEventListener( "enterFrame", on_frame )
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
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene