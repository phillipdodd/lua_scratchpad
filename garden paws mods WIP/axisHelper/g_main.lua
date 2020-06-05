Console.DebuggingMods(true)
DEBUG = true
if DEBUG then Console.Log('SUCCESS: AxisHelper loaded') end

--* Config
--? The increment by which the handlers will add or subtract
AdjustmentIncrement = 0.5

imageArgA = 1
imageArgB = 1
imageArgC = 1
imageArgD = 0.8

ChangablePanel = {}
function ChangablePanel:new(parent, xMin, xMax, yMin, yMax)
    if DEBUG then Console.Log('INFO: ChangablePanel constructor beginning') end
    local newPanel = {
        parent = parent,
        panel = UI.CreatePanel(parent).SetAnchors(xMin, xMax, yMin, yMax),
        xMin = xMin,
        yMin = yMin,
        xMax = xMax,
        yMax = yMax
    }
    if DEBUG then Console.Log('SUCCESS: ChangablePanel:new() - newPanel created') end
    
    newPanel.textMesh = UI.CreateTextMesh(
        newPanel.panel,
        tostring(newPanel.xMin) .. ' , ' .. tostring(newPanel.yMin) .. ' , ' .. tostring(newPanel.xMax) .. ' , ' .. tostring(newPanel.yMax),
        76,0,0.7,1,1,
        "center",
        "titletext"
    )

    if DEBUG then Console.Log('SUCCESS: ChangablePanel:new() - newPanel.textMesh created') end

    newPanel.image = UI.CreateImage(newPanel.panel, imageArgA, imageArgB, imageArgC, imageArgD)
    -- UI.CreateImage(newPanel.panel, imageArgA, imageArgB, imageArgC, imageArgD)
    self.__index = self
    setmetatable(newPanel, self)
    if DEBUG then Console.Log('INFO: ChangablePanel constructor ending') end
    return newPanel
end

function ChangablePanel:setKey(key, value)
    self[key] = value
    if  tostring(key) == 'xMin' or
        tostring(key) == 'yMin' or
        tostring(key) == 'xMax' or
        tostring(key) == 'yMax'
    then
        self:redraw()
    end
    if DEBUG then Console.Log('SUCCESS: ChangeablePanel[' .. key .. '] set to ' .. value) end
end

function ChangablePanel:redraw()
    self.panel.SetAnchors(self.xMin, self.yMin, self.xMax, self.yMax)
    self.textMesh.text = tostring(self.xMin) .. ' , ' .. tostring(self.yMin) .. ' , ' .. tostring(self.xMax) .. ' , ' .. tostring(self.yMax)
    self.image = UI.CreateImage(self.image, imageArgA, imageArgB, imageArgC, imageArgD)
    if DEBUG then Console.Log('SUCCESS: ChangeablePanel redrawn') end
end

--? Making global to be accessable from ApplyUsable()
MainPanel = nil

function OnTemplate()
    if DEBUG then Console.Log('INFO: onTemplate started') end

    local canvas = UI.CreateCanvas(false)
    MainPanel = ChangablePanel:new(canvas, 0.2, 0.7, 0.1, 0.9)

    if DEBUG then Console.Log('SUCCESS: onTemplate() creaed new ChangeablePanel') end

    local playerPosition = World.GetPlayerPosition()
    
    if DEBUG then Console.Log("SUCCESS: onTemplate() dropped items") end
    
    self.RegisterListener(Messager.UsableStarted, ApplyUsable)
    self.RegisterListener(Messager.UsableEnded, UsableEnded)
    self.RegisterListener(Messager.FiveSecondsIntoDay, function()
        Game.PlayerReceiveItem("xMin", 1)
        Game.PlayerReceiveItem("xMax", 1)
        Game.PlayerReceiveItem("yMin", 1)
        Game.PlayerReceiveItem("yMax", 1)
    end)

    if DEBUG then Console.Log("SUCCESS: onTemplate() applied listeners") end

    if DEBUG then Console.Log('INFO: onTemplate completed') end
end

function ApplyUsable(itemID)
    self.RegisterListener(Messager.UsableMouseClick, MakeHandler(itemID, 0.05))
    if DEBUG then Console.Log('SUCCESS: ApplyUsable() registered MakeHandler listener') end
end

function UsableEnded()
    self.UnregisterListener(Messager.UsableMouseClick)
end

--[[
    * @description - returns a function that will subtract from the given variable's
    *   value on LEFT click, and add to the value on RIGHT click
    * @param {string} v - name of variable
    * @param {float} v - float by which affect the variable

    todo add memoization
]]--
function MakeHandler(k, v)
    return function ()
        if Input.MouseButtonDown(0) then
            MainPanel:setKey(k, MainPanel[tostring(k)] - v)
        elseif Input.MouseButtonDown(2) then
            MainPanel:setKey(k, MainPanel[tostring(k)] + v)
        end
    end
end

-- function xStick()
--     Console.Log('doing the thing')

-- incline
for i = 0, 10, 0.5 do 
    makeOrb(-2, i, i + 1)
    makeOrb(-1, i, i + 1)
    makeOrb(0, i, i + 1)
    makeOrb(1, i, i + 1)
    makeOrb(2, i, i + 1)
end

-- vertical
for i = 0, 5, 1 do 
    makeOrb(-2, i, 1)
    makeOrb(-1, i, 1)
    makeOrb(0, i, 1)
    makeOrb(1, i, 1)
    makeOrb(2, i, 1)
end

-- horizontal
for i = 0, 10, 0.5 do 
    makeOrb(-2, -0.1, i)
    makeOrb(-1, -0.1, i)
    makeOrb(0, -0.1, i)
    makeOrb(1, -0.1, i)
    makeOrb(2, -0.1, i)
end
    
orbs = {}
function makeOrb(x, y, z)
    local newHittable = Hittable.MakeHittable()
    newHittable.AddDebugSphere(0.05)
    newHittable.CreateSphereCollisions()
    newHittable.RegisterCallback(function(hittable) hittable.gameObject.Destroy() end, newHittable);
    newHittable.transform.setParent(Player.transform)
    newHittable.transform.localPosition = Vector3.New(x, y, z)
    newHittable.transform.SetParent(nil)
    newHittable.gameObject.AddInventory()
    table.insert(orbs, newHittable)
end

-- vertical
for i = 0, 5, 1 do 
    makeOrb(-2, i, 1)
    makeOrb(-1, i, 1)
    makeOrb(0, i, 1)
    makeOrb(1, i, 1)
    makeOrb(2, i, 1)
end

-- function MapTable(t, fn)
--     local i = 0
--     local function createIterator(t)
--         return function()
--             i = i + 1
--             -- into callback is passed: table itself, current value, current index
--             return t[i] and fn(t, t[i], i)
--         end
--     end

--     local result = {}
--     local iter = createIterator(t)
--     for val in iter do
--         if (val) then 
--             table.insert(result, val)
--         end
--     end

--     return result
-- end