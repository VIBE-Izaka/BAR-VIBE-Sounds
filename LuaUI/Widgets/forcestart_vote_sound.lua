function widget:GetInfo()
    return {
        name = "ForceStart Vote Sound",
        desc = "Play sound when forcestart vote begins",
        author = "VIBE",
        version = "1.0",
        layer = 0,
        enabled = true
    }
end

local SOUND_PATH = "LuaUI/Sounds/forcestarto.wav"

function widget:Initialize()
    Spring.Echo("[ForceStart] Loaded")
end

local function check(msg)
    local m = string.lower(msg)
    local volume = Spring.GetConfigFloat("snd_notifications_volume", 1.0)
    if string.find(m, "called a vote") and string.find(m, "forcestart") then
        Spring.PlaySoundFile("LuaUI/Sounds/forcestarto.wav", volume, "ui")
    end
end

function widget:PlayerChat(msg, playerID)
    check(msg)
end

function widget:AddConsoleLine(msg)
    check(msg)
end
