--Simple button program for the 3DS using Lovepotion

--[[
magic numbers:
x from 85 to 235
y from 45 to 195
--]]

--Variable to check if the button is currently pressed
clicked = false

function love.load()
	--turns on 3d functionality
	love.graphics.set3D(true)
	
	--set BG to white
	love.graphics.setBackgroundColor(1,1,1)
	
	--load bruh sound and button images. images must be in t3x format!
	sound = love.audio.newSource("bruhEffect.ogg", "static")
	buttonUnpressed = love.graphics.newImage("bruh2.t3x")
	buttonPressed = love.graphics.newImage("bruh1.t3x")
	
	--load in all 3 layers for top screen image
	meme1 = love.graphics.newImage("meme1.t3x")
	meme2 = love.graphics.newImage("meme2.t3x")
	meme3 = love.graphics.newImage("meme3.t3x")
end

--love.update isn't needed here but i quite honestly don't know if it works without it.
function love.update()
end

--checks if touchscreen touch is within the bounds of the button
function love.touchpressed( id, x, y, dx, dy, pressure )
	if x >= 85 and x <= 235 and y >= 45 and y <= 195 then
		--sets clicked to true, plays bruh sound effect #2
		clicked = true
		sound:play()
	end
end

--when touch releases, sets clicked to false
function love.touchreleased( id, x, y, dx, dy, pressure )
	clicked = false
end

function love.draw()
	--drawing on top screen
	love.graphics.setScreen("top")
	--sets 3d depth to background, shifting image by 5 pixels
	love.graphics.setDepth(-5)
	--draw the image
	love.graphics.draw(meme1, 400/2, 240/2, 0, 1, 1, meme1:getWidth()/2, meme1:getHeight()/2)
	--sets 3d depth to foreground, shifting by 6 pixels
	love.graphics.setDepth(6)
	--draw image
	love.graphics.draw(meme2, 0,0)
	--3d depth, shifting by 5 pixels (just so theres a small bit of variation between the layers)
	love.graphics.setDepth(5)
	love.graphics.draw(meme3, 0,0)
	
	--bottom screen
	love.graphics.setScreen("bottom")
	--changes image based off of if clicked is true. i botched unpressed and pressed but oh well
	if clicked == true then
		love.graphics.draw(buttonUnpressed, 320/2, 240/2, 0, 1, 1, 150/2,150/2)
	else
		love.graphics.draw(buttonPressed, 320/2, 240/2, 0, 1, 1, 150/2,150/2)
	end
end
