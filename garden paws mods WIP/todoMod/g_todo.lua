function OnTemplate()
    -- self.RegisterListener(Messager.StartGameUI,MakeUIOpenButton)
    MakeUIOpenButton()
end

function MakeUIOpenButton()
    local list = TodoList:new()
    UI.AddMenuButton("Minesweeper",function() list:makeUI() end)
end

TodoList = {}
function TodoList:new(todolist)
    todolist = todolist or {}
    setmetatable(todolist, self)
    self.__index = self
    return todolist
end

function TodoList:makeUI()
    self.canvas = UI.CreateCanvas(true)
    local mainPanel = UI.CreatePanel(self.canvas).SetAnchors(0.2, 0.7, 0.1, 0.9)
    UI.CreateImage(mainPanel,1,1,1,0.8)
    local titlePanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.90,0.95)
    UI.CreateTextMesh(
        titlePanel,
        "My Todo List",
        76,
        0, 0.6, 0.9, 1,
        "center",
        "titletext"
    ).SetFont("TitleShadow")
    
    local inputs= {}
    local firstItemAnchors = {0.1,0.9,0.75,0.8}
    for i = 1, 10 do
        table.insert(inputs, 1, {})
        inputs[i].panel = UI.CreatePanel(mainPanel).SetAnchors(firstItemAnchors[1],firstItemAnchors[2],firstItemAnchors[3] - (i - 0.5),firstItemAnchors[4] - (i - 0.5))
       
        inputs[i].input = UI.CreateInputField(inputs[i].panel)
        inputs[i].input.placeholderText = "Type your sign title here"

    end
    table.insert(inputs, {})
    -- inputs[1] = {}
    --(
        -- higher = right lower = left (left bound),
        -- ?
        -- higher = up, lower = down (bottom bound),
        -- higher = up, lower = down (top bound)
    -- )
    -- inputs[1].panel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.75,0.8)
    inputs[1].input = UI.CreateInputField(inputs[1].panel)
    inputs[1].input.placeholderText = "Type your sign title here"

    inputs[2] = {}
    inputs[2].panel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.65,0.7)
    inputs[2].input = UI.CreateInputField(inputs[2].panel)
    inputs[2].input.placeholderText = "Type your sign title here"

    -- local inputPanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.75,0.8)
    -- inputHolder[1] = UI.CreateInputField(inputPanel)
    -- inputHolder[1].placeholderText = "Type your sign title here"
    
    -- inputHolder[2] = UI.CreateInputField(inputPanel)
    -- inputHolder[2].placeholderText = "Type your sign title here"
    local buttonsPanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.05,0.12)
    local saveButton = UI.AddBlueButton(buttonsPanel,"Save Sign", "buttons")
    saveButton.rectTransform.SetAnchors(0,1,0,1)

    local closeButton = UI.AddCloseButton(mainPanel, "closeButton", function() self.canvas.gameObject.SetActive(false) end)
    closeButton.rectTransform.SetAnchors(0.9,1,0.9,1)

end


