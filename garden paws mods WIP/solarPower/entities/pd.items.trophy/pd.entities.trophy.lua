function OnTemplate()
    self.AddModel('btoast.models.trophy')
    self.CreateSphereCollisions()
    self.MakeBuildable()
    -- self.AddTexture('btoast.textures.trophy')
end

function OnClone()
    self.RegisterListener(Messager.OnEnable, Enabled)
    self.RegisterEntityWithTag("solartrophy")
    actionLua = self.AddLuaTrigger("Test Trigger",4, true);
    actionLua.OverrideStartAction(StartedTrigger)
    actionLua.OverrideEndAction(EndedTrigger)
end

function Enabled()
    Console.Log(type(self))
    Console.Log(self.cloneID .. " < Enabled  Pos > " .. (self.Pos))
end

function StartedTrigger()
    Console.Log(self.cloneID .. " Did Trigger " .. Vector3.Vector3ToString(self.Pos))
    actionLua.StopTrigger()
end

function EndedTrigger()
    Console.Log("Did end Trigger")
end


