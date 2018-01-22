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
local speed1 = 10
local speed2 = 55
local backgroundMusic
local backgroundMusicChannel


local title = 
[[


 .d8888b.                             888                                                                                                      
d88P  Y88b                            888                                                                                                      
888    888                            888                                                                                                      
888         .d88b.  88888b.   .d88b.  888888 888d888 888  888 88888b.d88b.  d8b                                                                
888        d88""88b 888 "88b d8P  Y8b 888    888P"   888  888 888 "888 "88b Y8P                                                                
888    888 888  888 888  888 88888888 888    888     888  888 888  888  888                                                                    
Y88b  d88P Y88..88P 888 d88P Y8b.     Y88b.  888     Y88b 888 888  888  888 d8b                                                                
 "Y8888P"   "Y88P"  88888P"   "Y8888   "Y888 888      "Y88888 888  888  888 Y8P                                                                
                    888                                                                                                                        
                    888                                                                                                                        
                    888                                                                                                                        
                                                                                                                                                                                      
                                                                                                                                               
                                                                                                                                               
88888888888 888                    888    888                   888      d8b                         .d8888b.                                  
    888     888                    888    888                   888      Y8P                        d88P  Y88b                                 
    888     888                    888    888                   888                                 888    888                                 
    888     88888b.   .d88b.       8888888888  8888b.   .d8888b 888  888 888 88888b.   .d88b.       888         8888b.  88888b.d88b.   .d88b.  
    888     888 "88b d8P  Y8b      888    888     "88b d88P"    888 .88P 888 888 "88b d88P"88b      888  88888     "88b 888 "888 "88b d8P  Y8b 
    888     888  888 88888888      888    888 .d888888 888      888888K  888 888  888 888  888      888    888 .d888888 888  888  888 88888888 
    888     888  888 Y8b.          888    888 888  888 Y88b.    888 "88b 888 888  888 Y88b 888      Y88b  d88P 888  888 888  888  888 Y8b.     
    888     888  888  "Y8888       888    888 "Y888888  "Y8888P 888  888 888 888  888  "Y88888       "Y8888P88 "Y888888 888  888  888  "Y8888  
                                                                                           888                                                 
                                                                                      Y8b d88P                                                 
                                                                                       "Y88P"     
 
 
]]

local vampireegg =
[[
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                                                                                                               
                                                                         |███     ████|                                                                        
                                                |                        ██████████████                       |                                                
                                                ████|                    █████████████                    |████                                                
                                                ████████                |██████ |██████                ████████|                                               
                                               ████████████|            ██████   ██████            |████████████                                               
                                              █████    █████████|      █████        ████      |█████████    █████                                              
                                             █████        ███████████████             ██|████████████        █████                                             
                                            █████              █████████████████████████████████              █████                                            
                                           █████              ████    ███████████████████    ████              █████                                           
                                          |████              █████      ███         ███|     █████              █████                                          
                                          ████              ████       ████         ████       ████              ████|                                         
                                         ████              █████      █████         █████       ████              ████                                         
                                        |████|████████    █████       ████           ████        ████    ████████|█████                                        
                                        ████████████████ █████       ████             ████       █████ |███████████████                                        
                                         ██████     █████████       █████             █████        ████████     ██████                                         
                                                    ███████████|    ████               ████    |███████████                                                    
                                                     ███████████████████                ████|██████████████                                                    
                                                    ███████████████████                 ███████████████████                                                    
                                                      ██        ███████████|       |███████████        ███                                                     
                                                                 █████████████   █████████████                                                                 
                                                                 ████     ███████████     ████                                                                 
                                                                             █████                                                                             
                                                                              ███                                                                              
                                                                                                                                                               
                                                                                                                                                               
                                                                    ███          ████|   █████|  █████|   ███      ██                                          
                                     ██    ███   ████     ███████  |█████   ██   ██ ██| ███      ███     ██       ██|                                          
                                      ██| ███   █████|    ███████  |████   |██   █████  |█████   ██████ |██  ███  ██| ███                                      
                                       ████|   ███  ██|   ██   ██  ██      |██   ████    ██      ██|     ██████   ██| ██|                                      
                                       |██     █     ██   █    ██           ██   █ |█|   ██████  █████|    ████   |████|                                       
                                                                                                                                                               
                                                                                                                                                               
]]

	local options = 
	{
		text = "",     
		x = totalWidth/2 - 200,
		y = totalHeight/2 - 150,
		font = "cour.ttf",   
		fontSize = 12,
		align = "left"  -- Alignment parameter
	}
	
	local options2 = 
	{
		text = "",     
		x = totalWidth - 100,
		y = totalHeight - 150,
		font = "cour.ttf",   
		fontSize = 2,
		align = "right"  -- Alignment parameter
	}
	 

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
	if(showName == true) then
		local str = string.sub(title, 1 , index * speed1)
		background.txt.text = str
	else
		local str = string.sub(vampireegg, 1 , index * speed2)
		background.txt2.text = str
	end
	index = index + 1
	if(index * speed1 > #title and showName == true) then
		showName = false
		index = 1
		audio.pause( backgroundMusicChannel )
		timer.performWithDelay( 1000, function()
 
			audio.resume( backgroundMusicChannel )
		 
		end, 1 )
	end
	
	if(showName == false and index * speed2 >= #vampireegg) then
		audio.stop( backgroundMusicChannel )
	end
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
	background:setFillColor(0.1, 0.05, 0.15, 1)
	
	
	
	backgroundMusic = audio.loadStream( "typing.wav" )
	backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )
	audio.setVolume( 0.1, { channel=1 } )
	
	-- create/position logo/title image on upper-half of the screen

	
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
		background.txt = display.newText(options )
		background.txt2 = display.newText(options2)
				
		background.txt:setFillColor( 1, 1, 0.7, 1)
		background.txt2:setFillColor( 0.9, 0.9, 0.7, 1)
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