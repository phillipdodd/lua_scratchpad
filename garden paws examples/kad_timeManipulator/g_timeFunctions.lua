--KAD (pinktrashcat) time manipulation mod 2/25/20
--interact button added by noircchack 2/25/20

toggleChecker = 0;
minuteDuration = 1;

function OnTemplate()
    self.RegisterListener(Messager.UsableStarted, selectHourglass)
    UI.ShowCornerNotification("Mod script loaded.");
end 


function selectHourglass(itemID)
    Console.Log("selectHourGlass() itemID is " .. itemID);
    if itemID == "timechanginghourglass" then
        self.RegisterListener(Messager.UsableUpdate, addOptions);
        self.RegisterListener(Messager.UsableInteract, PressedInteract);
        self.RegisterListener(Messager.UsableEnded, removeOptions);
		
        UI.AddInteractUI("Z","Toggle Clock (z)");
        UI.AddInteractUI("Q","Speed Up Clock (q)");
		UI.AddInteractUI("X","Slow Down Clock (x)");
        UI.AddInteractUI("P","Reset Clock Speed (p)");
    end
end

function addOptions()
     if Input.GetKey(KeyCode.Z) then 
        togglePauseTime();
    end
     if Input.GetKey(KeyCode.Q) then 
        fastTime();
    end
     if Input.GetKey(KeyCode.X) then 
        slowTime();
    end
     if Input.GetKey(KeyCode.P) then
        resetTime();
    end
end

function resetTime()
    Console.log("resetTime function loads");
    Clock.SetMinuteDuration(1);
    minuteDuration = 1;
end

function togglePauseTime()
    Console.log("togglePauseTime function loads");
    if toggleChecker == 0 then 
        -- this is where time was playing
        Clock.SetMinuteDuration(9999);
        toggleChecker = 1;
    elseif toggleChecker == 1 then
        -- this is where time was stopped
        Clock.SetMinuteDuration(1);
        toggleChecker = 0;
    end
end

function slowTime()
    Console.log("slowTime function loads");
    if toggleChecker == 1 then
        UI.ShowTopNotification("Cannot slow when time is stopped!");
    elseif minuteDuration >= 9000 and toggleChecker == 0 then
        UI.ShowTopNotification("Time cannot go slower than normal!");
    else
        Clock.SetMinuteDuration(minuteDuration + 1);
        minuteDuration = minuteDuration + 1;
    end
end

function fastTime()
    Console.log("fastTime function loads");
    if toggleChecker == 1 then
        UI.ShowTopNotification("Please first resume time.");
    elseif minuteDuration <= 1 and toggleChecker == 0 then
        UI.ShowTopNotification("Time cannot go faster!");
    else
        Clock.SetMinuteDuration(minuteDuration - 1);
        minuteDuration = minuteDuration - 1;
    end
end

function removeOptions() 
    Console.log("removeOptions function loads");
    self.UnregisterListener(Messager.UsableUpdate);
    self.UnregisterListener(Messager.UsableInteract);
    self.UnregisterListener(Messager.UsableEnded);
    UI.ClearInteractUIs();
end

function PressedInteract()
    --UI.ShowCornerNotification("Pressed Interact");
	-- When E is press
end
