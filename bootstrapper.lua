local HttpService = game:GetService("HttpService")

-- Table of GameIds mapped to their script links
local gameScripts = {
    [8975568157] = "https://raw.githubusercontent.com/IAMRAX/automation-hub/refs/heads/main/scripts/Start%20Your%20Business.lua"
}

local currentGameId = game.GameId
local scriptLink = gameScripts[currentGameId]

if scriptLink then
    local success, result = pcall(function()
        local code = HttpService:GetAsync(scriptLink)
        print("Fetched code:", code) -- Debug: see what was returned
        return loadstring(code)()
    end)

    if not success then
        warn("❌ Failed to load script for GameId:", currentGameId)
        warn("Error:", result)
    else
        print("✅ Script loaded successfully for GameId:", currentGameId)
    end
else
    print("ℹ️ No script link found for GameId:", currentGameId)
end
