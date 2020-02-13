TodoList = {}
function TodoList:new(todolist)
    todolist = todolist or {}
    setmetatable(todolist, self)
    self.__index = self
    return todolist
end

function TodoList:makeUI(x)
    self.canvas = UI.CreateCanvas(true)
    local mainPanel = UI.CreatePanel(self.canvas).SetAnchors(0.3, 0.7, 0.1, 0.9)
    local titlePanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.80,0.95)
    local titleText = titleText = UI.CreateTextMesh(titlePanel, "Sign",76,0,0.6,0.9,1,"center","titletext").SetFont("TitleShadow")
    
    local signTitlePanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.75,0.8)
    local signTitleInput = UI.CreateInputField(signTitlePanel)
    signTitleInput.placeholderText = "Type your sign title here"

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
