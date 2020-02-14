function OnTemplate()
	UI.ShowCornerNotification("Mod teleporttoy ok")
	
    -- Register a listener to add a button to open ui in the
    -- main pause menu when the main pause menu is created. 
    self.RegisterListener(Messager.StartGameUI,createcanvas)
end

function createcanvas()
	self.RegisterGlobalFunction("fnnccOpenUIteleport", OpenUI)
    -- Creates a new UI Canvas to hold our UI.
    -- The true value means the game will free the mouse when this canvas is active.
    myCanvas = UI.CreateCanvas(true)
    -- Creates a main panel in our new canvas.
    mainPanel = UI.CreatePanel(myCanvas).SetAnchors(0.15, 0.85, 0.1, 0.95)
    -- Adds an image to the main panel.
--	UI.CreateImage(mainPanel,1,1,1,0.8);
	newImage = UI.CreateImage(mainPanel,1,1,1,1)
	newImage.sprite = UI.GetSprite("mapscreenshot")
    -- Creates a new title panel in the main panel.
--    titlePanel = UI.CreatePanel(mainPanel).SetAnchors(0.1,0.9,0.80,0.95)
    -- Adds a text to the title panel.
--    titleText = UI.CreateTextMesh(titlePanel, "Title",76,0,0.7,1,1,"center","titletext").SetFont("TitleShadow")
    -- Creates a panel to hold our buttons
    buttonsPanel = UI.CreatePanel(mainPanel).SetAnchors(0,1,0,1)

	locationteleport = {"home", "downtown", "bruce", "robert", "thorne", "kieran", "penny", "beltran", "captain conrad", "frank", "john stone", "mayor", "mccoy", "mr jones", "mr mooney", "poppy", "wanderer", "penguins", "event", "wheat"}
	
--	locationteleport = {"home", "abby", "alberto", "assistant", "beltran", "boris", "bruce", "captain", "charlie", "clovis", "daniel", "davis", "elizabeth", "emily", "event", "frank", "hash", "james", "jenna", "john stone", "kieran", "kristina", "malu", "mayor", "mccoy", "miller", "mrjones", "mrmooney", "poppy", "penguins", "robert", "roman", "rudy", "sadie", "sammy", "sierra", "steven", "thiago", "wanderer"}

    for i,v in ipairs(locationteleport) do
		newButton = UI.AddBlueButton(buttonsPanel, v, v, fn_mb_goToPlace, v)		
		if (v == "home") then newButton.rectTransform.SetAnchors(0.33,0.38,0.37,0.42)
		elseif (v == "bruce") then newButton.rectTransform.SetAnchors(0.13,0.16,0.75,0.78)
		elseif (v == "robert") then newButton.rectTransform.SetAnchors(0.375,0.405,0.73,0.76)
		elseif (v == "thorne") then newButton.rectTransform.SetAnchors(0.49,0.52,0.67,0.70)
		elseif (v == "kieran") then newButton.rectTransform.SetAnchors(0.725,0.755,0.505,0.535)
		elseif (v == "penny") then newButton.rectTransform.SetAnchors(0.18,0.21,0.245,0.275)
		elseif (v == "beltran") then newButton.rectTransform.SetAnchors(0.095,0.125,0.105,0.135)
		elseif (v == "downtown") then newButton.rectTransform.SetAnchors(0.07,0.12,0.14,0.19)
		elseif (v == "mayor") then newButton.rectTransform.SetAnchors(0.05,0.08,0.115,0.145)
		elseif (v == "mr jones") then newButton.rectTransform.SetAnchors(0.165,0.195,0.05,0.08)
		elseif (v == "mr mooney") then newButton.rectTransform.SetAnchors(0.23,0.26,0.13,0.16)
		elseif (v == "poppy") then newButton.rectTransform.SetAnchors(0.20,0.23,0.09,0.12)
		elseif (v == "captain conrad") then newButton.rectTransform.SetAnchors(0.02,0.05,0.21,0.24)
		elseif (v == "john stone") then newButton.rectTransform.SetAnchors(0.09,0.12,0.205,0.235)
		elseif (v == "wanderer") then newButton.rectTransform.SetAnchors(0.16,0.19,0.115,0.145)
		elseif (v == "frank") then newButton.rectTransform.SetAnchors(0.06,0.09,0.22,0.25)
		elseif (v == "mccoy") then newButton.rectTransform.SetAnchors(0.03,0.06,0.28,0.31)
		elseif (v == "wheat") then newButton.rectTransform.SetAnchors(0.66,0.69,0.62,0.65)
		elseif (v == "event") then newButton.rectTransform.SetAnchors(0.02,0.05,0.17,0.20)
		elseif (v == "penguins") then newButton.rectTransform.SetAnchors(0.28,0.31,0.94,0.97) end
					
--		elseif (v == "abby") then newButton.rectTransform.SetAnchors(0.05,0.10,0.20,0.25)
--		elseif (v == "alberto") then newButton.rectTransform.SetAnchors(0.05,0.10,0.30,0.35)
--		elseif (v == "assistant") then newButton.rectTransform.SetAnchors(0.05,0.10,0.40,0.45)
--		elseif (v == "boris") then newButton.rectTransform.SetAnchors(0.05,0.10,0.60,0.65)
--		elseif (v == "charlie") then newButton.rectTransform.SetAnchors(0.05,0.10,0.90,0.95)
--		elseif (v == "clovis") then newButton.rectTransform.SetAnchors(0.20,0.25,0.85,0.90)
--		elseif (v == "daniel") then newButton.rectTransform.SetAnchors(0.30,0.35,0.75,0.80)
--		elseif (v == "davis") then newButton.rectTransform.SetAnchors(0.35,0.40,0.70,0.75)
--		elseif (v == "elizabeth") then newButton.rectTransform.SetAnchors(0.40,0.45,0.60,0.65)
--		elseif (v == "emily") then newButton.rectTransform.SetAnchors(0.40,0.45,0.50,0.55)
--		elseif (v == "hash") then newButton.rectTransform.SetAnchors(0.30,0.35,0.20,0.25)
--		elseif (v == "james") then newButton.rectTransform.SetAnchors(0.20,0.25,0.15,0.20)
--		elseif (v == "jenna") then newButton.rectTransform.SetAnchors(0.55,0.60,0.10,0.15)
--		elseif (v == "kristina") then newButton.rectTransform.SetAnchors(0.55,0.60,0.40,0.45)
--		elseif (v == "malu") then newButton.rectTransform.SetAnchors(0.55,0.60,0.50,0.55)
--		elseif (v == "miller") then newButton.rectTransform.SetAnchors(0.55,0.60,0.80,0.85)
--		elseif (v == "roman") then newButton.rectTransform.SetAnchors(0.85,0.90,0.50,0.55)
--		elseif (v == "rudy") then newButton.rectTransform.SetAnchors(0.85,0.90,0.60,0.65)
--		elseif (v == "sadie") then newButton.rectTransform.SetAnchors(0.85,0.90,0.70,0.75)
--		elseif (v == "sammy") then newButton.rectTransform.SetAnchors(0.85,0.90,0.80,0.85)
--		elseif (v == "sierra") then newButton.rectTransform.SetAnchors(0.85,0.90,0.90,0.95)
--		elseif (v == "steven") then newButton.rectTransform.SetAnchors(0.65,0.70,0.50,0.55)
--		elseif (v == "thiago") then newButton.rectTransform.SetAnchors(0.75,0.80,0.50,0.55) 
	end
		
--    newButtona = UI.AddBlueButton(buttonsPanel, "Home", "home", fn_mb_goToPlace, "home")
--	newButtona.rectTransform.SetAnchors(0.33,0.36,0.37,0.40)
--    newButtonb = UI.AddBlueButton(buttonsPanel,z "Abby", "abby", fn_mb_goToPlace)
--	newButtonb.rectTransform.SetAnchors(0.05,0.10,0.20,0.25)
--    newButtonc = UI.AddBlueButton(buttonsPanel,"Alberto", "alberto", fn_mb_goToPlace)
--	newButtonc.rectTransform.SetAnchors(0.05,0.10,0.30,0.35)
--    newButtond = UI.AddBlueButton(buttonsPanel,"Assistant", "assistant", fn_mb_goToPlace)
--	newButtond.rectTransform.SetAnchors(0.05,0.10,0.40,0.45)
--    newButtone = UI.AddBlueButton(buttonsPanel,"Beltran", "beltran", fn_mb_goToPlace)
--	newButtone.rectTransform.SetAnchors(0.05,0.10,0.50,0.55)
--    newButtonf = UI.AddBlueButton(buttonsPanel,"Boris", "boris", fn_mb_goToPlace)
--	newButtonf.rectTransform.SetAnchors(0.05,0.10,0.60,0.65)
--    newButtong = UI.AddBlueButton(buttonsPanel,"Bruce", "bruce", fn_mb_goToPlace)
--	newButtong.rectTransform.SetAnchors(0.05,0.10,0.70,0.75)
--    newButtonh = UI.AddBlueButton(buttonsPanel,"Captain", "captain", fn_mb_goToPlace)
--	newButtonh.rectTransform.SetAnchors(0.05,0.10,0.80,0.85)
--    newButtoni = UI.AddBlueButton(buttonsPanel,"Charlie", "Charlie", fn_mb_goToPlace)
--	newButtoni.rectTransform.SetAnchors(0.05,0.10,0.90,0.95)	
--    newButtonj = UI.AddBlueButton(buttonsPanel,"Clovis", "clovis", fn_mb_goToPlace)
--	newButtonj.rectTransform.SetAnchors(0.20,0.25,0.85,0.90)
--    newButtonk = UI.AddBlueButton(buttonsPanel,"Daniel", "daniel", fn_mb_goToPlace)
--	newButtonk.rectTransform.SetAnchors(0.30,0.35,0.75,0.80)
--    newButtonl = UI.AddBlueButton(buttonsPanel,"Davis", "davis", fn_mb_goToPlace)
--	newButtonl.rectTransform.SetAnchors(0.35,0.40,0.70,0.75)
--    newButtonm = UI.AddBlueButton(buttonsPanel,"Elizabeth", "elizabeth", fn_mb_goToPlace)
--	newButtonm.rectTransform.SetAnchors(0.40,0.45,0.60,0.65)
--    newButtonn = UI.AddBlueButton(buttonsPanel,"Emily", "emily", fn_mb_goToPlace)
--	newButtonn.rectTransform.SetAnchors(0.40,0.45,0.50,0.55)
--    newButtono = UI.AddBlueButton(buttonsPanel,"Event", "event", fn_mb_goToPlace)
--	newButtono.rectTransform.SetAnchors(0.40,0.45,0.40,0.45)
--    newButtonp = UI.AddBlueButton(buttonsPanel,"Frank", "frank", fn_mb_goToPlace)
--	newButtonp.rectTransform.SetAnchors(0.35,0.40,0.30,0.35)
--    newButtonq = UI.AddBlueButton(buttonsPanel,"Hash", "hash", fn_mb_goToPlace)
--	newButtonq.rectTransform.SetAnchors(0.30,0.35,0.20,0.25)
--    newButtonr = UI.AddBlueButton(buttonsPanel,"James", "james", fn_mb_goToPlace)
--	newButtonr.rectTransform.SetAnchors(0.20,0.25,0.15,0.20)	
--	
--    newButtonaa = UI.AddBlueButton(buttonsPanel,"Jenna", "jenna", fn_mb_goToPlace)
--	newButtonaa.rectTransform.SetAnchors(0.55,0.60,0.10,0.15)
--    newButtonbb = UI.AddBlueButton(buttonsPanel,"John Stone", "johnstone", fn_mb_goToPlace)
--	newButtonbb.rectTransform.SetAnchors(0.55,0.60,0.20,0.25)
--    newButtoncc = UI.AddBlueButton(buttonsPanel,"Kieran", "kieran", fn_mb_goToPlace)
--	newButtoncc.rectTransform.SetAnchors(0.55,0.60,0.30,0.35)
--    newButtondd = UI.AddBlueButton(buttonsPanel,"Kristina", "kristina", fn_mb_goToPlace)
--	newButtondd.rectTransform.SetAnchors(0.55,0.60,0.40,0.45)
--    newButtonee = UI.AddBlueButton(buttonsPanel,"Malu", "malu", fn_mb_goToPlace)
--	newButtonee.rectTransform.SetAnchors(0.55,0.60,0.50,0.55)
--    newButtonff = UI.AddBlueButton(buttonsPanel,"Mayor", "mayor", fn_mb_goToPlace)
--	newButtonff.rectTransform.SetAnchors(0.55,0.60,0.60,0.65)
--    newButtongg = UI.AddBlueButton(buttonsPanel,"Mccoy", "mccoy", fn_mb_goToPlace)
--	newButtongg.rectTransform.SetAnchors(0.55,0.60,0.70,0.75)
--    newButtonhh = UI.AddBlueButton(buttonsPanel,"Miller", "miller", fn_mb_goToPlace)
--	newButtonhh.rectTransform.SetAnchors(0.55,0.60,0.80,0.85)
--    newButtonii = UI.AddBlueButton(buttonsPanel,"Mr Jones", "mrjones", fn_mb_goToPlace)
--	newButtonii.rectTransform.SetAnchors(0.55,0.60,0.90,0.95)
--	
--    newButtonjj = UI.AddBlueButton(buttonsPanel,"Mr Mooney", "mrmooney", fn_mb_goToPlace)
--	newButtonjj.rectTransform.SetAnchors(0.85,0.90,0.10,0.15)
--    newButtonkk = UI.AddBlueButton(buttonsPanel,"Poppy", "poppy", fn_mb_goToPlace)
--	newButtonkk.rectTransform.SetAnchors(0.85,0.90,0.20,0.25)
--    newButtonll = UI.AddBlueButton(buttonsPanel,"Penguins", "penguins", fn_mb_goToPlace)
--	newButtonll.rectTransform.SetAnchors(0.85,0.90,0.30,0.35)
--    newButtonmm = UI.AddBlueButton(buttonsPanel,"Robert", "robert", fn_mb_goToPlace)
--	newButtonmm.rectTransform.SetAnchors(0.85,0.90,0.40,0.45)
--    newButtonnn = UI.AddBlueButton(buttonsPanel,"Roman", "roman", fn_mb_goToPlace)
--	newButtonnn.rectTransform.SetAnchors(0.85,0.90,0.50,0.55)
--    newButtonoo = UI.AddBlueButton(buttonsPanel,"Rudy", "rudy", fn_mb_goToPlace)
--	newButtonoo.rectTransform.SetAnchors(0.85,0.90,0.60,0.65)
--    newButtonpp = UI.AddBlueButton(buttonsPanel,"Sadie", "sadie", fn_mb_goToPlace)
--	newButtonpp.rectTransform.SetAnchors(0.85,0.90,0.70,0.75)
--    newButtonqq = UI.AddBlueButton(buttonsPanel,"Sammy", "sammy", fn_mb_goToPlace)
--	newButtonqq.rectTransform.SetAnchors(0.85,0.90,0.80,0.85)
--    newButtonrr = UI.AddBlueButton(buttonsPanel,"Sierra", "sierra", fn_mb_goToPlace)
--	newButtonrr.rectTransform.SetAnchors(0.85,0.90,0.90,0.95)
--		
--    newButtonss = UI.AddBlueButton(buttonsPanel,"Steven", "steven", fn_mb_goToPlace)
--	newButtonss.rectTransform.SetAnchors(0.65,0.70,0.50,0.55)
--    newButtontt = UI.AddBlueButton(buttonsPanel,"Thiago", "thiago", fn_mb_goToPlace)
--	newButtontt.rectTransform.SetAnchors(0.75,0.80,0.50,0.55)
--    newButtonuu = UI.AddBlueButton(buttonsPanel,"Wanderer", "wanderer", fn_mb_goToPlace)
--	newButtonuu.rectTransform.SetAnchors(0.65,0.70,0.90,0.95)
	
--	locationteleport = {"home", "abby", "alberto", "assistant", "beltran", "boris", "bruce", "captain", "charlie", "clovis", "daniel", "davis", "elizabeth", "emily", "event", "frank", "hash", "james", "jenna", "johnstone", "kieran", "kristina", "malu", "mayor", "mccoy", "miller", "mrjones", "mrmooney", "poppy", "penguins", "robert", "roman", "rudy", "sadie", "sammy", "sierra", "steven", "thiago", "wanderer"}
	
--    for i,v in ipairs(locationteleport) do
--      Game.DelayCall(wrappedAddBlueButton,0,buttonsPanel, v, v) 
--    end
	
	-- Adds a grid layout to our buttons panel that will automatically place
    -- any child of that panel in a grid form with 100 width and 26 height.
--    buttonsGrid = UI.CreateGridLayout(buttonsPanel,100,26,"bgrid")
    -- Creates a new button in the buttons panel that calls TestFunction when clicked.
--    newButton = UI.AddBlueButton(buttonsPanel,"Test Button", "buttons", TestFunction)

    -- Adds a close button to the main panel
    closeButton = UI.AddCloseButton(mainPanel, "closeButton", CloseUI)
    -- Sets the anchors of the close button's rect transform to the right corner.
    closeButton.rectTransform.SetAnchors(0.9,1,0.9,1)

    -- Hides our canvas.
    myCanvas.gameObject.SetActive(false)

end

--function wrappedAddBlueButton(parent, text, tag) 
--    local function handler() 
--       fn_mb_goToPlace(tag) 
--    end
	
--	newButton.rectTransform.SetAnchors(0.48,0.52,0.48,0.52)

--		 1
--
--  0         1	
--	
--		 0
--	
	--first number = left
	--second number = right
	--third number = bottom
	--four number = top

--end

function strSplit(delim,str)
    local t = {}

    for substr in string.gmatch(str, "[^".. delim.. "]*") do
        if substr ~= nil and string.len(substr) > 0 then
            table.insert(t,substr)
        end
    end

    return t
end

function MakeUIOpenButton()
    -- Adds a button to open our UI
    UI.AddMenuButton("Open UI",OpenUI)
end

function OpenUI(varobjettocredit)
	--UI.ShowCornerNotification("variable objecttocredit (aa): " .. varobjettocredit);
	varobjettocredit = strSplit(";",varobjettocredit)
	--UI.ShowCornerNotification("variable consumable (a): " .. varobjettocredit[1]);
	--UI.ShowCornerNotification("variable objecttocredit (a): " .. varobjettocredit[2]);
	consumable = varobjettocredit[1]
	objecttocredit = varobjettocredit[2]
    -- Unpauses the game so we don't have the pause menu on top of our new UI
    Game.UnpauseGame()
    -- Activates our canvas
    myCanvas.gameObject.SetActive(true)
	
end

function CloseUI()
    -- Deactivates our canvas
    myCanvas.gameObject.SetActive(false)
	
	-- recredit our object because he has not realy be used
	--UI.ShowCornerNotification("variable consumable (c): " .. consumable);
	--UI.ShowCornerNotification("variable objecttocredit (c): " .. objecttocredit);
	if consumable == "yes"
	then
		Game.PlayerReceiveItem(objecttocredit, 1)
	end
	
    -- Pauses the game so we can go back to the pause menu
    --Game.PauseGame()
end

function TestFunction(aa)
    -- Prints test to the console.
    UI.ShowCornerNotification(aa)
end

function fn_mb_goToPlace(mb_xyz)
    UI.ShowCornerNotification(mb_xyz)
    mb_xyz = string.lower(mb_xyz)

	if (mb_xyz == "home") then World.SetPlayerPosition(World.StringToVector3("303.5048,8.06808,373.3994"))
    elseif (mb_xyz == "downtown") then World.SetPlayerPosition( World.StringToVector3("88.234,8.287,181.45"))
    elseif (mb_xyz == "bruce") then World.SetPlayerPosition( World.StringToVector3("137.575,19.287,765.596"))
    elseif (mb_xyz == "robert") then World.SetPlayerPosition( World.StringToVector3("366.566,11.471,738.707"))
    elseif (mb_xyz == "thorne") then World.SetPlayerPosition( World.StringToVector3("461.270,7.306,695.601"))
    elseif (mb_xyz == "kieran") then World.SetPlayerPosition( World.StringToVector3("658.724,8.061,533.849"))
    elseif (mb_xyz == "penny") then World.SetPlayerPosition( World.StringToVector3("183.286,6.23,264.54"))
    elseif (mb_xyz == "beltran") then World.SetPlayerPosition( World.StringToVector3("123.532,8.486,125.463"))
    elseif (mb_xyz == "captain conrad") then World.SetPlayerPosition( World.StringToVector3("46.903,7.701,240.668"))
    elseif (mb_xyz == "frank") then World.SetPlayerPosition( World.StringToVector3("76.440,19.852,235.986"))
    elseif (mb_xyz == "john stone") then World.SetPlayerPosition( World.StringToVector3("99.382,37.996,229.877"))
    elseif (mb_xyz == "mayor") then World.SetPlayerPosition( World.StringToVector3("93.954,12.484,131.815"))
    elseif (mb_xyz == "mccoy") then World.SetPlayerPosition( World.StringToVector3("58.400,7.145,298.427"))
    elseif (mb_xyz == "mr jones") then World.SetPlayerPosition( World.StringToVector3("183.603,8.672,94.014"))
    elseif (mb_xyz == "mr mooney") then World.SetPlayerPosition( World.StringToVector3("239.341,7.774,160.155"))
    elseif (mb_xyz == "poppy") then World.SetPlayerPosition( World.StringToVector3("229.436,7.619,121.531"))
    elseif (mb_xyz == "wanderer") then World.SetPlayerPosition( World.StringToVector3("167.942,27.116,155.400"))
    elseif (mb_xyz == "penguins") then World.SetPlayerPosition( World.StringToVector3("264,6,948"))
    elseif (mb_xyz == "event") then World.SetPlayerPosition( World.StringToVector3("39.249,7.100,165.394"))
    elseif (mb_xyz == "wheat") then World.SetPlayerPosition( World.StringToVector3("599.152,7.663,642.648")) end
		
	myCanvas.gameObject.SetActive(false)
end