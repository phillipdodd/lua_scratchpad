DefaultSpamMailTable = self.Include('DefaultSpamMailTable')
function OnTemplate()
    DoOnceForEvent(Messager.Update, function()
        Console.Log(DefaultSpamMailTable)
        -- Console.Log(#DefaultSpamMailTable)
        -- Console.Log(type(#DefaultSpamMailTable))
        -- for k,v in ipairs(DefaultSpamMailTable) do print(k, v) end
    end)z
end

function DoOnceForEvent(event, fn)
    self.RegisterListener(event, function()
        fn()
        self.UnregisterListener(event)
    end)
end

