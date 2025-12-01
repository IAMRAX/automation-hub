local gameScripts = {
    [807559471] = "https://github.com/richie0866/remote-spy/releases/latest/download/RemoteSpy.lua"
}

local scriptLink = gameScripts[game.GameId]

if scriptLink then
    local success, result = pcall(function()
        return loadstring(game:HttpGetAsync(scriptLink))()
    end)

    if not success then
        warn("Failed to load script:", result)
    end
end
