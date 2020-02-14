function OnTemplate()
    self.RegisterListener(Messager.UsableStarted,CheckForRightUsable)
end

function CheckForRightUsable(itemID)
    Console.Log(itemID .. " Started")
    -- The item ids are all lower case when they're in the game.
    -- So I have to compare to a all lower case version of it.
    if itemID == "ncc_teleporttoy" then
        self.RegisterListener(Messager.UsableUpdate,Update)
        self.RegisterListener(Messager.UsableInteract,PressedInteract)
        self.RegisterListener(Messager.UsableMouseClick,PressedMouseClick)
        self.RegisterListener(Messager.UsableEnded,Ended)
    end
end

function Update()
    --UI.ShowCornerNotification("Usable Update");
end

function PressedInteract()
    --UI.ShowCornerNotification("Pressed Interact");
end

function PressedMouseClick(ncc_teleporttoy)
    --UI.ShowCornerNotification("Pressed Mouse Click");
	self.ConsumeUsable()
	consumable = "yes"
	objecttocredit = "ncc_teleporttoy"
	varobjettocredit = consumable .. ";" .. objecttocredit
	--Game.CallGlobalFunction("fnmbtransporter", varobjettocredit) --g_dialog_mb_transporter.lua
	Game.CallGlobalFunction("fnnccOpenUIteleport", varobjettocredit) --g_gloabl_script_canvas.lua
end

function Ended()
    --UI.ShowCornerNotification("Ended Usable");
    self.UnregisterListener(Messager.UsableUpdate)
    self.UnregisterListener(Messager.UsableInteract)
    self.UnregisterListener(Messager.UsableMouseClick)
    self.UnregisterListener(Messager.UsableEnded)
end