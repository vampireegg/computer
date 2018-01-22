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


local title = 
[[
 ██████╗ ██████╗ ██████╗ ███████╗████████╗██████╗ ██╗   ██╗███╗   ███╗                                                     
██╔════╝██╔═══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██║   ██║████╗ ████║██╗                                                  
██║     ██║   ██║██████╔╝█████╗     ██║   ██████╔╝██║   ██║██╔████╔██║╚═╝                                                  
██║     ██║   ██║██╔═══╝ ██╔══╝     ██║   ██╔══██╗██║   ██║██║╚██╔╝██║██╗                                                  
╚██████╗╚██████╔╝██║     ███████╗   ██║   ██║  ██║╚██████╔╝██║ ╚═╝ ██║╚═╝                                                  
 ╚═════╝ ╚═════╝ ╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝                                                     
                                                                                                                           
                                                                                                                           
                                                                                                                           
████████╗██╗  ██╗███████╗    ██╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗      ██████╗  █████╗ ███╗   ███╗███████╗
╚══██╔══╝██║  ██║██╔════╝    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝     ██╔════╝ ██╔══██╗████╗ ████║██╔════╝
   ██║   ███████║█████╗      ███████║███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗    ██║  ███╗███████║██╔████╔██║█████╗  
   ██║   ██╔══██║██╔══╝      ██╔══██║██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  
   ██║   ██║  ██║███████╗    ██║  ██║██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝	
]]

local vampireeg =
[[
                                                                                                                                                               
                                                                                                                                                               
                                                                         *@@@     @@@%.                                                                        
                                                .                        @@@@@@@@@@@@@%                       ,                                                
                                                @@@%,                    @@@@@@@@@@@@@                    .%@@@                                                
                                                @@@@@@@&                ,@@&&&% /&&&@@#                %@@@@@@@(                                               
                                               &@@@@@@@@@@@*            @@@@#%   &%@@@@            *@@@@@@@@@@@@                                               
                                              @@@@@    &@@&&@@@&*      %@@@%        @@@@      *%@@@@@@@@    @@@@@                                              
                                             %@@@&        &&@@@@@@&@@@#@&             &&(@@@@@@@@@@&@        &@@@@                                             
                                            %@@@@              &@@@@@@@@@&@&&@@@@@@@@@@@@@@@@@@@              &@@@%                                            
                                           &@@@@              @@@@    %&@@@&@@@&@@@@@@@@%    @@@@              &@@@@                                           
                                          (@@@@              @@@@&      @@@         @@@(     %@@@@              &@@@&                                          
                                          @@@@              @@@@       @@@@         @@@@       @@@@              &@@@(                                         
                                         @@@@              @@@@@      #@@@&         %@@@&       @@@@              @@@@                                         
                                        *@@@%(#@@@@@@%    @@@@%       @@@@           @@@@        &@@@    #&@@@@@%(%@@@%                                        
                                        @@@@&@@@&&@@&@@& @@@@&       @@@@             &@@@       %@@@@ (@@@&@@&@@@@@@@@                                        
                                         &&@&&%     @@@&@@@@%       %@@@&             %@@@@        @@@@@@@@     %&&@@&                                         
                                                    %@@@@@@####(    @@@@               @@@@    *####@@@@@@@                                                    
                                                     @@@@@@@@@@&@&%%@@@%                @@@@(@@@@@@&@@@@@@%                                                    
                                                    @@@@@@&&%%%&&@@@@@@                 @@@@@@@@%%%%&&@&@@@                                                    
                                                      &&        &@@@@@@@@&@,       .@@@@@@@@@@&        %@&                                                     
                                                                 @&@&@@@@@@@&@   &@@@&@@@&@&&@                                                                 
                                                                 @@@@     &@@&@@@@@@&     &@@@                                                                 
                                                                             &@@@&                                                                             
                                                                              &&&                                                                              
                                                                                                                                                               
                                                                                                                                                               
                                                                    #%%          %%%%.   %%%%%/  #%%%%(   #%%      %%                                          
                                     %%    %%%   #%%%     %%%%%%%  *%%%%#   %#   %% %%* %%%      %%%     %%       %%(                                          
                                      %%/ %%%   %%%%%(    %%#%%%%  (%%%%   ,%%   %%%%%  *%%%%%   %%%%%% (%%  %%%  %%/ %%%                                      
                                       %%%%/   %%%  %%*   %#   %%  %%      /%%   %%%%    %%      %%(     #%%%%%   %%* %%(                                      
                                       (%#     %     %%   &    #%           %#   # (%(   %%%%%#  %%%%%*    #%%#   /%%%%/                                       
                                                                                                                                                         
]]

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
		local str = string.sub(title, 1 , index * 15)
		background.txt.text = str
	else
		local str = string.sub(vampireeg, 1 , index * 30)
		background.txt2.text = str
	end
	index = index + 1
	if(index * 15 > #title and showName == true) then
		showName = false
		index = 1
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
	
	local options = 
	{
		text = "",     
		x = totalWidth/2 - 100,
		y = totalHeight/2 - 100,
		font = "cour.ttf",   
		fontSize = 16,
		align = "left"  -- Alignment parameter
	}
	
	local options2 = 
	{
		text = "",     
		x = totalWidth - 100,
		y = totalHeight - 100,
		font = "cour.ttf",   
		fontSize = 2,
		align = "right"  -- Alignment parameter
	}
	 
	--local myText = display.newText( options )
	background = display.newRect(sceneGroup, totalWidth/2, totalHeight/2, totalWidth, totalHeight)
	background:setFillColor(0.2, 0.1, 0.05, 1)
	
	background.txt = display.newText(options )
	background.txt2 = display.newText(options2)
			
	background.txt:setFillColor( 1, 1, 0.7, 1)
	background.txt2:setFillColor( 1, 1, 0.7, 1)
	
	-- create/position logo/title image on upper-half of the screen

	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label="",
		labelColor = { default={255}, over={128} },
		default="button.png",
		over="button-over.png",
		width=154, height=40,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentCenterX
	playBtn.y = display.contentHeight - 125
	
	-- all display objects must be inserted into group
	sceneGroup:insert( playBtn )
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