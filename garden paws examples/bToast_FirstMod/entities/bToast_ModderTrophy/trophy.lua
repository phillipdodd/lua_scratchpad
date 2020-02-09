function OnTemplate()
    self.AddModel('bToast_ModderTrophy')
    self.CreateSphereCollisions()
    self.MakeBuildable()
    self.RegisterListener(Messager.OnEnable,Enabled)
end

function Enabled()
    Console.Log("Enabled")
end