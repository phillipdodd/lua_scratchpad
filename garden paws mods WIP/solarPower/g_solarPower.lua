function OnTemplate()
    self.RegisterListener(Messager.Update, Move)
end

function Move()
    -- World.SetPlayerPosition(
    --     Vector3.Add(
    --         World.GetPlayerPosition(),
    --         Vector3.New(1,0,1)
    --     )
    -- )
end


b = { 1, 2, 3}

b = {}
b[1] = 1
b[2] = 2
b[3] = 3