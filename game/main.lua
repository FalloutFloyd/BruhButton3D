--3DS VERSION
--[[
magic numbers:
x from 85 to 235
y from 45 to 195
--]]

clicked = false

function love.load()
	love.graphics.set3D(true)
	
	love.graphics.setBackgroundColor(1,1,1)
	
	sound = love.audio.newSource("bruhEffect.ogg", "static")
	buttonUnpressed = love.graphics.newImage("bruh2.t3x")
	buttonPressed = love.graphics.newImage("bruh1.t3x")
	
	meme1 = love.graphics.newImage("meme1.t3x")
	meme2 = love.graphics.newImage("meme2.t3x")
	meme3 = love.graphics.newImage("meme3.t3x")
end

function love.update()
end

function love.touchpressed( id, x, y, dx, dy, pressure )
	--if touchscreen press if within bounds of button, play the sound effect
	if x >= 85 and x <= 235 and y >= 45 and y <= 195 then
		clicked = true
		sound:play()
	end
end

function love.touchreleased( id, x, y, dx, dy, pressure )
	clicked = false
end

function love.draw()
	--top screen
	love.graphics.setScreen("top")
	--set depth to 10 pixels "in to" the screen
	love.graphics.setDepth(10)
	love.graphics.draw(meme1, 400/2, 240/2, 0, 1, 1, meme1:getWidth()/2, meme1:getHeight()/2)
	--set depth to 5 pixels "out of" the screen
	love.graphics.setDepth(-5)
	love.graphics.draw(meme2, 0,0)
	--set depth to 6 pixels "out of" the screen
	love.graphics.setDepth(-6)
	love.graphics.draw(meme3, 0,0)
	
	--bottom screen
	love.graphics.setScreen("bottom")
	--draw button sprite based off of if clicked is true or not
	if clicked == true then
		love.graphics.draw(buttonUnpressed, 320/2, 240/2, 0, 1, 1, 150/2,150/2)
	else
		love.graphics.draw(buttonPressed, 320/2, 240/2, 0, 1, 1, 150/2,150/2)
	end
end
