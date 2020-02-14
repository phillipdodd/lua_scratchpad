function OnTemplate()
    -- self.gameObject.AddDebugSphere()
    -- self.CreateSphereCollisions()
    -- self.AddTexture('btoast.textures.trophy')
end

function OnClone()
    -- self.gameObject.AddDebugSphere()
    -- self.RegisterListener(Messager.OnEnable, Enabled)
    -- self.RegisterEntityWithTag("thing")
    -- actionLua = self.AddLuaTrigger("Test Trigger",4, true);
    -- actionLua.OverrideStartAction(StartedTrigger)
    -- actionLua.OverrideEndAction(EndedTrigger)
end

function Enabled()
    Console.Log(type(self))
    Console.Log(self.cloneID .. " < Enabled  Pos > " .. (self.Pos))
end

function StartedTrigger()
    World.SpawnEntity(
    "thingy",
    Vector3.Add(
        World.GetPlayerPosition(),
        Vector3.New(0,0,5)
    )
)
self.Destroy()
end

function EndedTrigger()
    Console.Log("Did end Trigger")
end


