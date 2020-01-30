-- @see https://www.gardenpawsgame.com/modding/classes/Save/

function OnTemplate()
    -- Keep in mind that it's on my plans to change RegisterListener soon to avoid using so many strings for better performance. Soon you'll be passing the function directly and Registering with a global reference to the listener.
    self.RegisterListener("StartGameUI","StartedGameUI");
end 

function StartedGameUI()
    UI.AddPauseButton("Test Saving","TestSaving");
    UI.AddPauseButton("Test Loading","TestLoading");
    UI.AddPauseButton("Save","Save");
end

function TestSaving()
    stuff = {}
    stuff["Test"] = "Hello World"
    Save.SaveJSON("stuff", json.serialize(stuff))
end

function TestLoading()
    stuff = {}
    -- Adding some default value so when I retrieve I can still check for it.
    stuff["Test"] = "Save not found"
    newStuff = json.deserialize(Save.LoadJSON("stuff", json.serialize(stuff)))
    Console.Log(newStuff["Test"])
end

function Save()
    Save.SaveGame()
end