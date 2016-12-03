local Initial = PlayState:addState('Initial')

function Initial:overlay()
    PlayState.overlay(self)

    Color.WHITE:use()
    love.graphics.setFont(self.instruction_font)
    love.graphics.printf("TOUCH AND DRAG",
      love.graphics.getWidth()/2 - 0.5*PlayArea.SIZE*self.scale,
      love.graphics.getHeight()/2 + 25*self.scale,
      PlayArea.SIZE*self.scale,
      "center")

    love.graphics.circle('fill', love.graphics.getWidth()/2,
      love.graphics.getHeight()/2 + self.scale*65,
      self.scale*10*(1 + 0.2*(math.sin(self.time))^2),
      32)

    if self.bestscore ~= nil then
      Color.WHITE:use()
      love.graphics.setFont(self.best_font)
      love.graphics.printf(string.format("BEST: %.1f", self.bestscore),
        love.graphics.getWidth()/2 - love.graphics.getWidth()/2,
        (love.graphics.getHeight()/2 - self.scale*PlayArea.SIZE/2)/2,
        love.graphics.getWidth(), "center")
    end
end

function Initial:touchpressed(id, x, y, dx, dy, pressure)
  PlayState.touchpressed(self, id, x, y, dx, dy, pressure)
  self:startGame()
end
function Initial:mousepressed(x, y, button, istouch)
  PlayState.touchpressed(self, id, x, y, dx, dy, pressure )
  self:startGame()
end
function Initial:mousemoved(x, y, dx, dy, istouch)
  GameState.touchmoved(self, id, x, y, dx, dy, pressure)
end
function Initial:touchmoved(id, x, y, dx, dy, pressure)
  GameState.touchmoved(self, id, x, y, dx, dy, pressure)
end
function Initial:update(dt)
  GameState.update(self, dt)
end
