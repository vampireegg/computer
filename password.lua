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
local index
local showName
local speed1 = 8
local speed2 = 55
local backgroundMusic
local backgroundMusicChannel

local passwordField




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
		background.txt6.text = "Great Job!"
	else
		background.txt6.text = "Sorry, Wrong Password!"
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
	local sceneGroup = self.view
	index = 1
	showName = true

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	

	--local myText = display.newText( options )
	background = display.newRect(sceneGroup, totalWidth/2, totalHeight/2, totalWidth, totalHeight)
	background:setFillColor(0.2, 0.1, 0.3, 1)
		
	
	passwordField = native.newTextField( totalWidth/2, totalHeight/2 - 30, 350, 40 )
	passwordField.inputType = "default"
	passwordField.isSecure = true
	
	background.txt = display.newText(sceneGroup,"Password:", passwordField.x - 125 , passwordField.y - 50,  "calibri.ttf", 24 )
	
	background.txt2 = display.newText(sceneGroup,"Vampireegg", passwordField.x - 100 , passwordField.y - 130,  "calibri.ttf", 32 )
	
	background.txt3 = display.newText(sceneGroup,"Locked", passwordField.x - 150 , passwordField.y - 100,  "calibri.ttf", 16 )
	
	background.txt4 = display.newText(sceneGroup,"Password Hint?", passwordField.x - 120 , passwordField.y + 50,  "calibri.ttf", 16 )
	
	background.txt5 = display.newText(sceneGroup,"", passwordField.x , passwordField.y + 200,  "calibri.ttf", 24 )
	
	background.txt6 = display.newText(sceneGroup,"", passwordField.x , passwordField.y + 100,  "calibri.ttf", 24 )
	
	background.txt4:addEventListener( "tap", showHint )
	
	background.txt:setFillColor(1, 0.9, 0.6, 1)
	background.txt2:setFillColor(1, 0.9, 0.6, 1)
	background.txt3:setFillColor(1, 0.9, 0.6, 1)
	background.txt5:setFillColor(1, 0.9, 0.75, 1)
	
	background.avatarfield = display.newRect(sceneGroup, totalWidth/2 - 350, totalHeight/2 - 80, 200, 230)
	background.avatarfield:setFillColor(0.1, 0.1, 0.2, 1)
	-- background.avatarfield.strokeWidth = 3
	-- background.avatarfield:setStrokeColor( 1, 0.9, 0.6 )
	
	background.submitfield = display.newRect(sceneGroup, passwordField.x + passwordField.width / 2 + 90, passwordField.y, 100, passwordField.height)
	background.submitfield:setFillColor(0.3, 0.5, 0.2, 1)
	background.submitfield.strokeWidth = 2
	background.submitfield:setStrokeColor( 1, 1, 1 )
	
	background.submitfield:addEventListener( "tap", checkPassword )
	
	background.txt4 = display.newText(sceneGroup,"Submit", background.submitfield.x , background.submitfield.y,  "calibri.ttf", 18 )
	
	background.img = display.newImageRect( sceneGroup, "hooded.png", 1920, 1040 )
	background.img:scale(0.16, 0.16)
	background.img.x = background.avatarfield.x
	background.img.y = background.avatarfield.y
	
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