function OnTemplate()
    self.RegisterListener(Messager.StartGameUI,MakeUIOpenButton);
end

function MakeUIOpenButton()
    MakeMachineButton = UI.AddMenuButton("Make Machine",MakeCraftingMachine);
end

function MakeCraftingMachine()
    obj = self.gameObject;
    inventory = obj.AddInventory();
    iWV = inventory.AddWorldVisualizer(Vector3.New(-1,1,0),Vector3.New(1,1,0),1,true);
    obj.AddCraftingMachine("Craft","Oven",3,inventory);
end