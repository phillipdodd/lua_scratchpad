TodoList = {}
function TodoList:new(todolist)
    todolist = todolist or {}
    setmetatable(todolist, self)
    self.__index = self
    return todolist
end

function TodoList:makeUI()
    self.canvas = UI.CreateCanvas(true)
    local mainPanel = UI.CreatePanel(self.canvas).SetAnchors(0.3, 0.7, 0.1, 0.9)
    local titlePanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.80,0.95)
    local titleText = UI.CreateTextMesh(titlePanel, "Sign",76,0,0.6,0.9,1,"center","titletext").SetFont("TitleShadow")

    local signTextPanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.15,0.7)
    local signTextInput = UI.CreateInputField(signTextPanel,true)
    signTextInput.placeholderText = "Type your sign message here"

    local buttonsPanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.05,0.12)
    local saveButton = UI.AddBlueButton(buttonsPanel,"Save Sign", "buttons")
    saveButton.rectTransform.SetAnchors(0,1,0,1)

    local closeButton = UI.AddCloseButton(mainPanel, "closeButton", function() Canvas.gameObject.SetActive(false) end)
    closeButton.rectTransform.SetAnchors(0.9,1,0.9,1)
    
    
end

N = TodoList:new()
N:makeUI()
print(N.ui.mainPanel)

TodoListItem = {}
function TodoListItem:new(todolistItem)
    todolistItem = todolistItem or {}
    setmetatable(self, todolistItem)
    self.__index = self
    return todolistItem
end

UIComponentSwapper = {}
function UIComponentSwapper:new(...)
    local UIComponentSwapper = {
        components = {}
    }
    setmetatable(UIComponentSwapper, self)
    self.__index = self

    --* Add Components as key and value both for easy removal later
    for k, _ in {...} do
        UIComponentSwapper[k] = k
    end



    return UIComponentSwapper
end

