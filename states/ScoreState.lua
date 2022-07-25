--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

-- initialise new images for medals
function ScoreState:init()
    self.bronze = love.graphics.newImage('bronzemedal.png')
    self.width = self.bronze:getWidth()
    self.height = self.bronze:getHeight()

    self.silver = love.graphics.newImage('silvermedal.png')
    self.width = self.silver:getWidth()
    self.height = self.silver:getHeight()

    self.gold = love.graphics.newImage('goldmedal.png')
    self.width = self.gold:getWidth()
    self.height = self.gold:getHeight()
end


function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oops! Try again!', 0, 50, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 90, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')

    -- determine which medal to present based on score
    if self.score >= 10 then
        love.graphics.draw(self.gold, VIRTUAL_WIDTH / 2 - 25, VIRTUAL_HEIGHT / 2 - 25, center)
    elseif self.score >= 5 then
        love.graphics.draw(self.silver, VIRTUAL_WIDTH / 2 - 25, VIRTUAL_HEIGHT / 2 - 25, center)
    else
    love.graphics.draw(self.bronze, VIRTUAL_WIDTH / 2 - 25, VIRTUAL_HEIGHT / 2 - 25, center)
    end
end