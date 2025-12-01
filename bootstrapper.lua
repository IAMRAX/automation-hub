local HttpService = game:GetService("HttpService")

-- Table of GameIds mapped to their script links
local gameScripts = {
    [87945156990419] = "https://raw.githubusercontent.com/IAMRAX/automation-hub/refs/heads/main/scripts/Start%20Your%20Business.lua",
}

local currentGameId = game.GameId
local scriptLink = gameScripts[currentGameId]

if scriptLink then
    local success, result = pcall(function()
        local code = HttpService:GetAsync(scriptLink)
        return loadstring(code)()
    end)

    if not success then
        warn("Failed to load script for GameId:", currentGameId, result)
    end
end