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

local function checkPassword( event )
	if(passwordField.text == " ") then
		passwordField.text = "Great Job!"
		passwordField.isSecure = false
	else
		passwordField.text = "Sorry, Wrong Password!"
		passwordField.isSecure = false
	end
end

local function makeSecure( event )
	print("user inputting")
	
	 if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
		passwordField.text = ""
		event.text = ""
		event.oldText = ""
		event.newCharacters = ""
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        print( event.target.text )
		native.setKeyboardFocus( nil )
    elseif ( event.phase == "editing" ) then
		print("user inputting 1")
		event.oldText = ""
		passwordField.isSecure = true
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end

end

local function deleteText( event )
	if(event.phase == "began") then
		passwordField.text = ""
	elseif ( "ended" == event.phase ) then	

	end
end

local function showHint( event )
	background.txt5.text = 
	[[
	"It is a small gap.
	It is the gap between small and gap.
	You jump with it.
	It is infinite!"
	]]
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
	bgRect:setFillColor(0.1, 0.1, 0.2, 1)
	
	background = display.newImageRect( sceneGroup, "city3.png", totalWidth, totalHeight )
	background.x = totalWidth/2
	background.y = totalHeight/2
	--background:setFillColor(0.8, 0.1, 0.3, 1)
	
	
		
	
	
	
	-- create/position logo/title image on upper-half of the screen

	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		
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