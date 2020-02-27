--* Config
--? Will randomly select day amount between these two numbers
Low, High = 5, 10

SpamMail = {"spamMailID1", "spamMailID2", "spamMailID3"}
SentSpamMail = {};

function OnTemplate()
    
end

function GetSpamMailTable()
    local t = Data.LoadLuaTable("spamMailTable")
end