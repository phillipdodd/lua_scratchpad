Button = {}
function Button:new(isActive)
    local newButton = {
        isActive = isActive or false
    }
    setmetatable(newButton, self)
    self.__index = self
    return newButton
end

function Button:registerClickHandler(fn)
    self.clickHandler = function() fn() end
end

function Button:onClick()
    if self.clickHandler then 
        self.clickHandler() 
    else
        error('No handler assigned!')
    end
end

A = Button:new()
A.isActive = true

B = Button:new()

A:registerClickHandler(function()
    print('A was clicked')
    if A.isActive then
        print('A is Active')
    else
        print('A is NOT Active')
    end
end)

B:registerClickHandler(function()
    print('B was clicked')
    if B.isActive then
        print('B is Active')
    else
        print('B is NOT Active')
    end
end)

function SoulBind(a, b)
    a:registerClickHandler(function()
        b.isActive = a.isActive
        a.isActive = not a.isActive
    end)

    b:registerClickHandler(function()
        a.isActive = b.isActive
        b.isActive = not b.isActive
    end)
end

SoulBind(A, B)

A:onClick()
print(A.isActive)
print(B.isActive)
B:onClick()
print(A.isActive)
print(B.isActive)
A:onClick()
print(A.isActive)
print(B.isActive)

-- false
-- true
-- true
-- false
-- false
-- true