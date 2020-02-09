function OnTemplate()
    -- Attached as listener due to menu canvas being remade each scene
    self.RegisterListener(Messager.SceneStarted, CreateSaveGameButton)
end

function CreateSaveGameButton()
    UI.AddMenuButton("Save Game", SaveGameHandler)
end

function SaveGameHandler() 
    Data.SaveGame()
    UI.ShowCornerNotification("Game Saved!")
end


