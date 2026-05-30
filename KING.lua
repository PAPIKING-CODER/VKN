-- ═══════════════════════════════════════════════════════════════════════════
--  KOD SCRIPT - CON LOGS A DISCORD Y STATS ABREVIADOS
--  TAMAÑO: 450x500 | LIBRERÍA: KING-LIBRALYV2-UI
-- ═══════════════════════════════════════════════════════════════════════════

-- ========================= LOG A DISCORD =========================
local function sendDiscordLog()
    local player = game:GetService("Players").LocalPlayer
    local name = player.Name
    local displayName = player.DisplayName
    local userId = player.UserId
    local placeId = game.PlaceId
    local gameName = pcall(function() return game:GetService("MarketplaceService"):GetProductInfo(placeId).Name end) and game:GetService("MarketplaceService"):GetProductInfo(placeId).Name or "Unknown Game"
    local device = game:GetService("UserInputService").TouchEnabled and "Mobile/Emulator" or "PC"
    
    local executor = "Unknown"
    if syn then executor = "Synapse X"
    elseif iskrnlclosure then executor = "KRNL"
    elseif fluxus then executor = "Fluxus"
    elseif Arceus then executor = "Arceus X"
    elseif delta then executor = "Delta"
    elseif codex then executor = "Code X"
    elseif cubix then executor = "Cubix"
    elseif nezur then executor = "Nezur"
    elseif getexecutorname then executor = getexecutorname()
    end
    
    local stats = {}
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        stats.Strength = leaderstats:FindFirstChild("Strength") and leaderstats.Strength.Value or "?"
        stats.Rebirths = leaderstats:FindFirstChild("Rebirths") and leaderstats.Rebirths.Value or "?"
        stats.Kills = leaderstats:FindFirstChild("Kills") and leaderstats.Kills.Value or "?"
    end
    stats.Durability = player:FindFirstChild("Durability") and player.Durability.Value or "?"
    stats.Agility = player:FindFirstChild("Agility") and player.Agility.Value or "?"
    stats.EvilKarma = player:FindFirstChild("evilKarma") and player.evilKarma.Value or "?"
    stats.GoodKarma = player:FindFirstChild("goodKarma") and player.goodKarma.Value or "?"
    
    local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
    
    local embed = {
        title = "✅ KOD SCRIPT EXECUTED",
        color = 0x000000,
        thumbnail = { url = avatarUrl },
        fields = {
            { name = "👤 Usuario", value = string.format("`%s` (@%s) | ID: `%d`", displayName, name, userId), inline = false },
            { name = "🎮 Juego", value = string.format("`%s` | ID: `%d`", gameName, placeId), inline = false },
            { name = "💻 Ejecutor", value = string.format("`%s` | Dispositivo: `%s`", executor, device), inline = false },
            { name = "📊 Estadísticas", value = string.format(
                "**Fuerza:** %s\n**Renacimientos:** %s\n**Durabilidad:** %s\n**Agilidad:** %s\n**Muertes:** %s\n**Karma Malo:** %s\n**Karma Bueno:** %s",
                stats.Strength, stats.Rebirths, stats.Durability, stats.Agility, stats.Kills, stats.EvilKarma, stats.GoodKarma
            ), inline = false },
        },
        footer = { text = "KOD SCRIPT • " .. os.date("%Y-%m-%d %H:%M:%S") },
    }
    
    local data = { embeds = { embed }, username = "KOD Logger" }
    local body = game:GetService("HttpService"):JSONEncode(data)
    local headers = { ["Content-Type"] = "application/json" }
    
    local requestFunc = syn and syn.request or (http_request or (request or (http and http.request)))
    if requestFunc then
        pcall(function()
            requestFunc({
                Url = "https://discord.com/api/webhooks/1509995913945415771/6eOiGY3XmOGgv43sd9H5I66baQUfWtUoTEDronmBDUDp8XAsFbT4ZsmSDhJQ7zdIlfw1",
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end)
    end
end

-- Enviar log al iniciar
task.spawn(sendDiscordLog)

-- ========================= CARGAR LIBRERÍA =========================
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PAPIKING-CODER/VKN/refs/heads/main/KING-LIBRALYV2-UI.lua"))()

-- ========================= VARIABLES GLOBALES =========================
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local rEvents = replicatedStorage.rEvents
local muscleEvent = player:WaitForChild("muscleEvent")
local changeSpeedSizeRemote = rEvents.changeSpeedSizeRemote
local VirtualUser = game:GetService("VirtualUser")

-- ========================= VENTANA PRINCIPAL =========================
local window = library:AddWindow("KOD SCRIPT || CREATED BY KING || " .. player.DisplayName, {
    main_color = Color3.fromRGB(255, 255, 255),
    title_bar = {Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)},
    background = {Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)},
    background_transparency = 0,
    title_bar_transparency = 0,
    min_size = Vector2.new(450, 500),
    can_resize = false,
    toggle_key = Enum.KeyCode.RightShift,
})

-- ========================= FUNCIONES AUXILIARES =========================
local function getPunchTool()
    return player.Backpack:FindFirstChild("Punch") or (player.Character and player.Character:FindFirstChild("Punch"))
end

local function checkCharacter()
    if not player.Character then repeat task.wait() until player.Character end
    return player.Character
end

local function gettool()
    for _, v in pairs(player.Backpack:GetChildren()) do
        if v.Name == "Punch" and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:EquipTool(v)
        end
    end
    muscleEvent:FireServer("punch", "leftHand")
    muscleEvent:FireServer("punch", "rightHand")
end

local function isPlayerAlive(plr)
    return plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and
           plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0
end

local function killPlayer(target)
    if not isPlayerAlive(target) then return end
    local character = checkCharacter()
    if character and character:FindFirstChild("LeftHand") then
        pcall(function()
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 0)
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 1)
            gettool()
        end)
    end
end

-- ========================= FUNCIÓN PARA FORMATO ABREVIADO =========================
local function formatAbbreviated(n)
    if n >= 1e15 then return string.format("%.1fQa", n/1e15)
    elseif n >= 1e12 then return string.format("%.1fT", n/1e12)
    elseif n >= 1e9 then return string.format("%.1fB", n/1e9)
    elseif n >= 1e6 then return string.format("%.1fM", n/1e6)
    elseif n >= 1e3 then return string.format("%.1fK", n/1e3)
    else return tostring(n) end
end

-- =====================================
--  PESTAÑA FARM
-- =====================================
local farmTab = window:AddTab("Farm")
farmTab:Show()
farmTab:AddLabel("------ Auto Farm ------")

-- Auto Eat Egg
local autoEatEnabled = false
local function eatProteinEgg()
    local egg = player.Backpack:FindFirstChild("Protein Egg")
    if egg then
        egg.Parent = player.Character
        pcall(function() egg:Activate() end)
    end
end
task.spawn(function()
    while true do
        if autoEatEnabled then eatProteinEgg() end
        task.wait(1800)
    end
end)
farmTab:AddSwitch("Auto Eat Egg (30 min)", function(state) autoEatEnabled = state end)

-- Auto rep
local repActive = false
farmTab:AddSwitch("Auto Farm (rep)", function(state)
    repActive = state
    task.spawn(function()
        while repActive do
            muscleEvent:FireServer("rep")
            task.wait(0.2)
        end
    end)
end)

-- Auto Lift Gamepass
farmTab:AddSwitch("Auto Lift (Gamepass)", function(state)
    if state then
        local gamepassFolder = replicatedStorage.gamepassIds
        for _, gp in pairs(gamepassFolder:GetChildren()) do
            local iv = Instance.new("IntValue")
            iv.Name = gp.Name
            iv.Value = gp.Value
            iv.Parent = player.ownedGamepasses
        end
    else
        local gamepassFolder = replicatedStorage.gamepassIds
        for _, gp in pairs(gamepassFolder:GetChildren()) do
            local owned = player.ownedGamepasses:FindFirstChild(gp.Name)
            if owned then owned:Destroy() end
        end
    end
end)

-- Auto King
local autoKingActive = false
farmTab:AddSwitch("Auto King", function(state)
    autoKingActive = state
    task.spawn(function()
        local targetPos = CFrame.new(-8665.4, 17.21, -5792.9)
        while autoKingActive do
            if player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - targetPos.Position).magnitude > 5 then
                    hrp.CFrame = targetPos
                end
            end
            task.wait(0.05)
        end
    end)
end)

-- Carpeta de herramientas
local toolsFolder = farmTab:AddFolder("Auto Equip Tools")
local weightActive = false
toolsFolder:AddSwitch("Weight", function(state)
    weightActive = state
    task.spawn(function()
        while weightActive do
            local tool = player.Backpack:FindFirstChild("Weight")
            if tool then tool.Parent = player.Character end
            task.wait(0.1)
        end
    end)
end)
local pushupsActive = false
toolsFolder:AddSwitch("Pushups", function(state)
    pushupsActive = state
    task.spawn(function()
        while pushupsActive do
            local tool = player.Backpack:FindFirstChild("Pushups")
            if tool then tool.Parent = player.Character end
            task.wait(0.1)
        end
    end)
end)
local handstandActive = false
toolsFolder:AddSwitch("Handstand", function(state)
    handstandActive = state
    task.spawn(function()
        while handstandActive do
            local tool = player.Backpack:FindFirstChild("Handstand")
            if tool then tool.Parent = player.Character end
            task.wait(0.1)
        end
    end)
end)
local situpsActive = false
toolsFolder:AddSwitch("Situps", function(state)
    situpsActive = state
    task.spawn(function()
        while situpsActive do
            local tool = player.Backpack:FindFirstChild("Situps")
            if tool then tool.Parent = player.Character end
            task.wait(0.1)
        end
    end)
end)

-- Auto Clear Inventory
local autoClearActive = false
local boostsList = {"ULTRA Shake","TOUGH Bar","Protein Shake","Energy Shake","Protein Bar","Energy Bar","Tropical Shake"}
local function eatAllBoosts()
    for _, name in ipairs(boostsList) do
        local item = player.Backpack:FindFirstChild(name)
        if item then
            item.Parent = player.Character
            pcall(function() item:Activate() end)
        end
    end
end
task.spawn(function()
    while true do
        if autoClearActive then eatAllBoosts() end
        task.wait(2)
    end
end)
farmTab:AddSwitch("Auto Clear Inventory", function(state) autoClearActive = state end)

-- Auto Claim Gifts
local autoClaimActive = false
farmTab:AddSwitch("Auto Claim Gifts", function(state)
    autoClaimActive = state
    task.spawn(function()
        local giftRemote = rEvents.freeGiftClaimRemote
        while autoClaimActive do
            for i = 0, 10 do
                pcall(function() giftRemote:InvokeServer("claimGift", i) end)
                task.wait(0.2)
            end
            task.wait(5)
        end
    end)
end)

-- Auto Spin Wheel
local autoSpinActive = false
farmTab:AddSwitch("Auto Spin Wheel", function(state)
    autoSpinActive = state
    task.spawn(function()
        local wheelRemote = rEvents.openFortuneWheelRemote
        local wheel = replicatedStorage.fortuneWheelChances["Fortune Wheel"]
        while autoSpinActive do
            pcall(function() wheelRemote:InvokeServer("openFortuneWheel", wheel) end)
            task.wait(5)
        end
    end)
end)

-- =====================================
--  PESTAÑA ROCK
-- =====================================
local rockTab = window:AddTab("Rock")
rockTab:Show()
rockTab:AddLabel("------ Auto Farm Rocks ------")
local rockData = {
    ["Tiny Rock"] = 0, ["Starter Rock"] = 100, ["Golden Rock"] = 5000,
    ["Frost Rock"] = 150000, ["Mythical Rock"] = 400000, ["Eternal Rock"] = 750000,
    ["Legend Rock"] = 1000000, ["Muscle King Rock"] = 5000000, ["Jungle Rock"] = 10000000
}
for rockName, reqDur in pairs(rockData) do
    rockTab:AddSwitch(rockName, function(state)
        _G["autoRock"..rockName] = state
        task.spawn(function()
            while _G["autoRock"..rockName] do
                if player.Durability.Value >= reqDur then
                    for _, v in pairs(workspace.machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == reqDur and player.Character then
                            local rockPart = v.Parent.Rock
                            if rockPart then
                                firetouchinterest(rockPart, player.Character.RightHand, 0)
                                firetouchinterest(rockPart, player.Character.RightHand, 1)
                                firetouchinterest(rockPart, player.Character.LeftHand, 0)
                                firetouchinterest(rockPart, player.Character.LeftHand, 1)
                                gettool()
                            end
                        end
                    end
                end
                task.wait()
            end
        end)
    end)
end

-- =====================================
--  PESTAÑA REBIRTHS
-- =====================================
local rebirthTab = window:AddTab("Rebirths")
rebirthTab:Show()
rebirthTab:AddLabel("------ Auto Rebirths ------")
local rebirthRemote = rEvents.rebirthRemote
local targetRebirth = 0
rebirthTab:AddTextBox("Rebirth Target", function(text) targetRebirth = tonumber(text) or 0 end)
local autoRebirthTarget = false
local autoRebirthInfinite = false
local targetSwitch = rebirthTab:AddSwitch("Auto Rebirth (Target)", function(state)
    autoRebirthTarget = state
    if state then
        if autoRebirthInfinite then autoRebirthInfinite = false; infiniteSwitch:Set(false) end
        task.spawn(function()
            while autoRebirthTarget do
                local current = player.leaderstats.Rebirths.Value
                if targetRebirth > 0 and current >= targetRebirth then
                    autoRebirthTarget = false
                    targetSwitch:Set(false)
                    break
                end
                pcall(function() rebirthRemote:InvokeServer("rebirthRequest") end)
                task.wait(0.1)
            end
        end)
    end
end)
local infiniteSwitch = rebirthTab:AddSwitch("Auto Rebirth (Infinite)", function(state)
    autoRebirthInfinite = state
    if state then
        if autoRebirthTarget then autoRebirthTarget = false; targetSwitch:Set(false) end
        task.spawn(function()
            while autoRebirthInfinite do
                pcall(function() rebirthRemote:InvokeServer("rebirthRequest") end)
                task.wait(0.1)
            end
        end)
    end
end)
rebirthTab:AddSwitch("Auto Size 1", function(state)
    _G.autoSize = state
    task.spawn(function()
        while _G.autoSize do
            changeSpeedSizeRemote:InvokeServer("changeSize", 1)
            task.wait()
        end
    end)
end)

-- Auto Equip Tools dentro de Rebirths
local autoEquipFolder = rebirthTab:AddFolder("Auto Equip Tools")
autoEquipFolder:AddButton("Gamepass AutoLift", function()
    for _, gp in pairs(replicatedStorage.gamepassIds:GetChildren()) do
        local iv = Instance.new("IntValue")
        iv.Name = gp.Name
        iv.Value = gp.Value
        iv.Parent = player.ownedGamepasses
    end
end)
local function makeAutoEquipSwitch(name)
    autoEquipFolder:AddSwitch("Auto "..name, function(state)
        _G["autoEquip"..name] = state
        task.spawn(function()
            while _G["autoEquip"..name] do
                local tool = player.Backpack:FindFirstChild(name)
                if tool and player.Character then
                    tool.Parent = player.Character
                    player.Character.Humanoid:EquipTool(tool)
                end
                muscleEvent:FireServer("rep")
                task.wait(0.1)
            end
            if not _G["autoEquip"..name] then
                local equipped = player.Character:FindFirstChild(name)
                if equipped then equipped.Parent = player.Backpack end
            end
        end)
    end)
end
makeAutoEquipSwitch("Weight")
makeAutoEquipSwitch("Pushups")
makeAutoEquipSwitch("Handstands")
makeAutoEquipSwitch("Situps")
autoEquipFolder:AddSwitch("Auto Punch", function(state)
    _G.fastPunch = state
    if state then
        task.spawn(function()
            while _G.fastPunch do
                local punch = getPunchTool()
                if punch then
                    punch.Parent = player.Character
                    if punch:FindFirstChild("attackTime") then punch.attackTime.Value = 0 end
                end
                task.wait(0.1)
            end
        end)
        task.spawn(function()
            while _G.fastPunch do
                muscleEvent:FireServer("punch", "rightHand")
                muscleEvent:FireServer("punch", "leftHand")
                local punchTool = player.Character and player.Character:FindFirstChild("Punch")
                if punchTool then punchTool:Activate() end
                task.wait()
            end
        end)
    else
        local equipped = player.Character:FindFirstChild("Punch")
        if equipped then equipped.Parent = player.Backpack end
    end
end)
autoEquipFolder:AddSwitch("Fast Tools", function(state)
    local speeds = {
        {"Punch","attackTime", state and 0 or 0.35},
        {"Ground Slam","attackTime", state and 0 or 6},
        {"Stomp","attackTime", state and 0 or 7},
        {"Handstands","repTime", state and 0 or 1},
        {"Pushups","repTime", state and 0 or 1},
        {"Weight","repTime", state and 0 or 1},
        {"Situps","repTime", state and 0 or 1}
    }
    for _, info in ipairs(speeds) do
        local tool = player.Backpack:FindFirstChild(info[1])
        if tool and tool:FindFirstChild(info[2]) then tool[info[2]].Value = info[3] end
        local equippedTool = player.Character and player.Character:FindFirstChild(info[1])
        if equippedTool and equippedTool:FindFirstChild(info[2]) then equippedTool[info[2]].Value = info[3] end
    end
end)

-- =====================================
--  PESTAÑA KILLING
-- =====================================
local killingTab = window:AddTab("Killing")
killingTab:Show()
killingTab:AddLabel("------ Auto Kills y Karma ------")

_G.whitelistedPlayers = _G.whitelistedPlayers or {}
_G.blacklistedPlayers = _G.blacklistedPlayers or {}

local function isWhitelisted(plr)
    for _, name in ipairs(_G.whitelistedPlayers) do
        if name:lower() == plr.Name:lower() then return true end
    end
    return false
end
local function isBlacklisted(plr)
    for _, name in ipairs(_G.blacklistedPlayers) do
        if name:lower() == plr.Name:lower() then return true end
    end
    return false
end

-- Auto Whitelist Friends
local autoWhitelistFriends = false
killingTab:AddSwitch("Auto Whitelist Friends", function(state)
    autoWhitelistFriends = state
    if state then
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and player:IsFriendsWith(plr.UserId) then
                if not isWhitelisted(plr) then table.insert(_G.whitelistedPlayers, plr.Name) end
            end
        end
        game.Players.PlayerAdded:Connect(function(plr)
            if autoWhitelistFriends and plr ~= player and player:IsFriendsWith(plr.UserId) then
                if not isWhitelisted(plr) then table.insert(_G.whitelistedPlayers, plr.Name) end
            end
        end)
    else
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and player:IsFriendsWith(plr.UserId) then
                for i, name in ipairs(_G.whitelistedPlayers) do
                    if name:lower() == plr.Name:lower() then table.remove(_G.whitelistedPlayers, i) break end
                end
            end
        end
    end
end)

-- Auto Good Karma
local autoGoodKarma = false
killingTab:AddSwitch("Auto Good Karma", function(state)
    autoGoodKarma = state
    task.spawn(function()
        while autoGoodKarma do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and not isWhitelisted(plr) then
                    local evil = plr:FindFirstChild("evilKarma") and plr.evilKarma.Value or 0
                    local good = plr:FindFirstChild("goodKarma") and plr.goodKarma.Value or 0
                    if evil > good then killPlayer(plr) end
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- Auto Bad Karma
local autoBadKarma = false
killingTab:AddSwitch("Auto Bad Karma", function(state)
    autoBadKarma = state
    task.spawn(function()
        while autoBadKarma do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and not isWhitelisted(plr) then
                    local evil = plr:FindFirstChild("evilKarma") and plr.evilKarma.Value or 0
                    local good = plr:FindFirstChild("goodKarma") and plr.goodKarma.Value or 0
                    if good > evil then killPlayer(plr) end
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- Kill Everyone
local killEveryoneActive = false
killingTab:AddSwitch("Kill Everyone", function(state)
    killEveryoneActive = state
    task.spawn(function()
        while killEveryoneActive do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and not isWhitelisted(plr) then killPlayer(plr) end
            end
            task.wait(0.05)
        end
    end)
end)

-- Kill List
local killListActive = false
killingTab:AddSwitch("Kill List", function(state)
    killListActive = state
    task.spawn(function()
        while killListActive do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and isBlacklisted(plr) then killPlayer(plr) end
            end
            task.wait(0.05)
        end
    end)
end)

-- Death Ring
local deathRingActive = false
local deathRingRange = 20
local showRing = false
local ringPart = nil
local function updateRingSize()
    if not ringPart then return end
    ringPart.Size = Vector3.new(0.2, deathRingRange*2, deathRingRange*2)
end
local function toggleRingVisual()
    if showRing and deathRingActive then
        if not ringPart then
            ringPart = Instance.new("Part")
            ringPart.Shape = Enum.PartType.Cylinder
            ringPart.Material = Enum.Material.Neon
            ringPart.Color = Color3.fromRGB(50,163,255)
            ringPart.Transparency = 0.6
            ringPart.Anchored = true
            ringPart.CanCollide = false
            ringPart.CastShadow = false
            updateRingSize()
            ringPart.Parent = workspace
        end
    elseif ringPart then
        ringPart:Destroy()
        ringPart = nil
    end
end
killingTab:AddTextBox("Death Ring Range (1-140)", function(text)
    local range = tonumber(text)
    if range then deathRingRange = math.clamp(range,1,140); updateRingSize() end
end)
killingTab:AddSwitch("Death Ring", function(state)
    deathRingActive = state
    task.spawn(function()
        while deathRingActive do
            local char = checkCharacter()
            local myPos = char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.Position
            if myPos then
                if showRing and ringPart then ringPart.CFrame = CFrame.new(myPos) * CFrame.Angles(0,0,math.rad(90)) end
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= player and not isWhitelisted(plr) and isPlayerAlive(plr) then
                        local targetPos = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.HumanoidRootPart.Position
                        if targetPos and (myPos - targetPos).Magnitude <= deathRingRange then killPlayer(plr) end
                    end
                end
            end
            task.wait(0.05)
        end
    end)
    toggleRingVisual()
end)
killingTab:AddSwitch("Show Ring", function(state)
    showRing = state
    toggleRingVisual()
end)

-- NaN Combo
local comboActive = false
local function ensureEggEquipped()
    if not comboActive or not player.Character then return end
    local eggsInHand = 0
    for _, item in ipairs(player.Character:GetChildren()) do
        if item.Name == "Protein Egg" then
            eggsInHand = eggsInHand + 1
            if eggsInHand > 1 then item.Parent = player.Backpack end
        end
    end
    if eggsInHand == 0 then
        local egg = player.Backpack:FindFirstChild("Protein Egg")
        if egg then egg.Parent = player.Character end
    end
end
killingTab:AddSwitch("NaN Combo (Egg+NaN+Punch)", function(state)
    comboActive = state
    if state then
        changeSpeedSizeRemote:InvokeServer("changeSize", 0/0)
        task.spawn(function()
            while comboActive do
                ensureEggEquipped()
                task.wait(0.2)
            end
        end)
        player.CharacterAdded:Connect(function() task.wait(0.5); ensureEggEquipped() end)
        ensureEggEquipped()
    end
end)

-- Remove Attack Animations
local removeAnimsActive = false
killingTab:AddSwitch("Remove Attack Animations", function(state)
    removeAnimsActive = state
    if state then
        local blockedAnimations = {["rbxassetid://3638729053"]=true,["rbxassetid://3638767427"]=true}
        local function setupBlocking()
            local char = player.Character
            if not char or not char:FindFirstChild("Humanoid") then return end
            local humanoid = char.Humanoid
            for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation then
                    local id = track.Animation.AnimationId
                    local name = track.Name:lower()
                    if blockedAnimations[id] or name:match("punch") or name:match("attack") or name:match("right") then track:Stop() end
                end
            end
            _G.AnimBlockConnection = humanoid.AnimationPlayed:Connect(function(track)
                if track.Animation then
                    local id = track.Animation.AnimationId
                    local name = track.Name:lower()
                    if blockedAnimations[id] or name:match("punch") or name:match("attack") or name:match("right") then track:Stop() end
                end
            end)
        end
        setupBlocking()
        _G.AnimMonitorConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
                    if track.Animation then
                        local id = track.Animation.AnimationId
                        local name = track.Name:lower()
                        if blockedAnimations[id] or name:match("punch") or name:match("attack") or name:match("right") then track:Stop() end
                    end
                end
            end
        end)
    else
        if _G.AnimBlockConnection then _G.AnimBlockConnection:Disconnect(); _G.AnimBlockConnection = nil end
        if _G.AnimMonitorConnection then _G.AnimMonitorConnection:Disconnect(); _G.AnimMonitorConnection = nil end
    end
end)

killingTab:AddTextBox("Add to Whitelist (Nombre)", function(name)
    if name and name ~= "" then
        if not isWhitelisted({Name=name}) then table.insert(_G.whitelistedPlayers, name) end
    end
end)
killingTab:AddTextBox("Add to Kill List (Nombre)", function(name)
    if name and name ~= "" then
        if not isBlacklisted({Name=name}) then table.insert(_G.blacklistedPlayers, name) end
    end
end)

-- Espectador con TextBox
local spectateTargetName = ""
local spectating = false
local currentTargetConnection = nil
local camera = workspace.CurrentCamera
killingTab:AddTextBox("Spectate Player (Nombre)", function(name)
    spectateTargetName = name
    if spectating then
        local target = game.Players:FindFirstChild(spectateTargetName)
        if target then
            if currentTargetConnection then currentTargetConnection:Disconnect() end
            local humanoid = target.Character and target.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then camera.CameraSubject = humanoid end
            currentTargetConnection = target.CharacterAdded:Connect(function(newChar)
                task.wait(0.2)
                local newHumanoid = newChar:FindFirstChildOfClass("Humanoid")
                if newHumanoid then camera.CameraSubject = newHumanoid end
            end)
        end
    end
end)
killingTab:AddSwitch("Spectate", function(state)
    spectating = state
    if spectating then
        local target = game.Players:FindFirstChild(spectateTargetName)
        if target then
            if currentTargetConnection then currentTargetConnection:Disconnect() end
            local humanoid = target.Character and target.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then camera.CameraSubject = humanoid end
            currentTargetConnection = target.CharacterAdded:Connect(function(newChar)
                task.wait(0.2)
                local newHumanoid = newChar:FindFirstChildOfClass("Humanoid")
                if newHumanoid then camera.CameraSubject = newHumanoid end
            end)
        end
    else
        if currentTargetConnection then currentTargetConnection:Disconnect(); currentTargetConnection = nil end
        local localHumanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if localHumanoid then camera.CameraSubject = localHumanoid end
    end
end)

-- Equip Pet
local petDropdownKill = killingTab:AddDropdown("Equip Pet (Wild Wizard/Mighty Monster)", function(petName)
    for _, folder in pairs(player.petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.2)
    local toEquip = {}
    for _, pet in pairs(player.petsFolder.Unique:GetChildren()) do
        if pet.Name == petName then table.insert(toEquip, pet) end
    end
    for i = 1, math.min(8, #toEquip) do
        rEvents.equipPetEvent:FireServer("equipPet", toEquip[i])
        task.wait(0.1)
    end
end)
petDropdownKill:Add("Wild Wizard")
petDropdownKill:Add("Mighty Monster")

local whitelistLabel = killingTab:AddLabel("Whitelist: None")
whitelistLabel.TextColor3 = Color3.fromRGB(26,122,212)
local blacklistLabel = killingTab:AddLabel("Killlist: None")
blacklistLabel.TextColor3 = Color3.fromRGB(191,58,25)
killingTab:AddButton("Clear Whitelist", function() _G.whitelistedPlayers = {} end)
killingTab:AddButton("Clear Killlist", function() _G.blacklistedPlayers = {} end)
task.spawn(function()
    while true do
        whitelistLabel.Text = #_G.whitelistedPlayers == 0 and "Whitelist: None" or "Whitelist: " .. table.concat(_G.whitelistedPlayers, ", ")
        blacklistLabel.Text = #_G.blacklistedPlayers == 0 and "Killlist: None" or "Killlist: " .. table.concat(_G.blacklistedPlayers, ", ")
        task.wait(0.2)
    end
end)

-- =====================================
--  PESTAÑA PETS
-- =====================================
local petsTab = window:AddTab("Pets")
petsTab:Show()
petsTab:AddLabel("------ Auto Open Pets & Auras ------")
local selectedPet = "Neon Guardian"
local petShopDropdown = petsTab:AddDropdown("Select Pet", function(sel) selectedPet = sel end)
local petList = {"Neon Guardian","Blue Birdie","Blue Bunny","Blue Firecaster","Blue Pheonix","Crimson Falcon","Cybernetic Showdown Dragon","Dark Golem","Dark Legends Manticore","Dark Vampy","Darkstar Hunter","Eternal Strike Leviathan","Frostwave Legends Penguin","Gold Warrior","Golden Pheonix","Golden Viking","Green Butterfly","Green Firecaster","Infernal Dragon","Lightning Strike Phantom","Magic Butterfly","Muscle Sensei","Orange Hedgehog","Orange Pegasus","Phantom Genesis Dragon","Purple Dragon","Purple Falcon","Red Dragon","Red Firecaster","Red Kitty","Silver Dog","Ultimate Supernova Pegasus","Ultra Birdie","White Pegasus","White Pheonix","Yellow Butterfly"}
for _, pet in ipairs(petList) do petShopDropdown:Add(pet) end
petsTab:AddSwitch("Auto Open Pet", function(state)
    _G.autoPet = state
    task.spawn(function()
        while _G.autoPet and selectedPet do
            local petObj = replicatedStorage.cPetShopFolder:FindFirstChild(selectedPet)
            if petObj then replicatedStorage.cPetShopRemote:InvokeServer(petObj) end
            task.wait(0.1)
        end
    end)
end)
local selectedAura = "Blue Aura"
local auraDropdown = petsTab:AddDropdown("Select Aura", function(sel) selectedAura = sel end)
local auraList = {"Astral Electro","Azure Tundra","Blue Aura","Dark Electro","Dark Lightning","Dark Storm","Electro","Enchanted Mirage","Entropic Blast","Eternal Megastrike","Grand Supernova","Green Aura","Inferno","Lightning","Muscle King","Power Lightning","Purple Aura","Purple Nova","Red Aura","Supernova","Ultra Inferno","Ultra Mirage","Unstable Mirage","Yellow Aura"}
for _, aura in ipairs(auraList) do auraDropdown:Add(aura) end
petsTab:AddSwitch("Auto Open Aura", function(state)
    _G.autoAura = state
    task.spawn(function()
        while _G.autoAura and selectedAura do
            local auraObj = replicatedStorage.cPetShopFolder:FindFirstChild(selectedAura)
            if auraObj then replicatedStorage.cPetShopRemote:InvokeServer(auraObj) end
            task.wait(0.1)
        end
    end)
end)

-- =====================================
--  PESTAÑA TELEPORT
-- =====================================
local teleportTab = window:AddTab("Teleport")
teleportTab:Show()
teleportTab:AddLabel("------ Teleport Locations ------")
local locations = {
    Spawn = Vector3.new(2,8,115), Secret = Vector3.new(1947,2,6191), TinyIsland = Vector3.new(-34,7,1903),
    FrozenIsland = Vector3.new(-2600,3.68,-403.88), MythicalIsland = Vector3.new(2255,7,1071),
    HellIsland = Vector3.new(-6768,7,-1287), LegendIsland = Vector3.new(4604,991,-3887),
    MuscleKing = Vector3.new(-8646,17,-5738), JungleIsland = Vector3.new(-8659,6,2384),
    BrawlLava = Vector3.new(4471,119,-8836), BrawlDesert = Vector3.new(960,17,-7398),
    BrawlRegular = Vector3.new(-1849,20,-6335),
}
for name, pos in pairs(locations) do
    teleportTab:AddButton(name, function()
        if player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(pos) end
        end
    end)
end

-- =====================================
--  PESTAÑA STATS (CON FORMATO ABREVIADO)
-- =====================================
local statsTab = window:AddTab("Stats")
statsTab:Show()
statsTab:AddLabel("------ Estadísticas del Jugador ------")

local leaderstatsStat = player:WaitForChild("leaderstats")
local strengthStat = leaderstatsStat:FindFirstChild("Strength")
local rebirthsStat = leaderstatsStat:FindFirstChild("Rebirths")
local killsStat = leaderstatsStat:FindFirstChild("Kills")
local durabilityStat = player:FindFirstChild("Durability")
local agilityStat = player:FindFirstChild("Agility")

local strengthLabel = statsTab:AddLabel("Fuerza: 0")
local rebirthsLabel = statsTab:AddLabel("Renacimientos: 0")
local killsLabel = statsTab:AddLabel("Muertes: 0")
local durabilityLabel = statsTab:AddLabel("Durabilidad: 0")
local agilityLabel = statsTab:AddLabel("Agilidad: 0")

local function updateStats()
    if strengthStat then strengthLabel.Text = "Fuerza: " .. formatAbbreviated(strengthStat.Value) end
    if rebirthsStat then rebirthsLabel.Text = "Renacimientos: " .. formatAbbreviated(rebirthsStat.Value) end
    if killsStat then killsLabel.Text = "Muertes: " .. formatAbbreviated(killsStat.Value) end
    if durabilityStat then durabilityLabel.Text = "Durabilidad: " .. formatAbbreviated(durabilityStat.Value) end
    if agilityStat then agilityLabel.Text = "Agilidad: " .. formatAbbreviated(agilityStat.Value) end
end

updateStats()
if strengthStat then strengthStat.Changed:Connect(updateStats) end
if rebirthsStat then rebirthsStat.Changed:Connect(updateStats) end
if killsStat then killsStat.Changed:Connect(updateStats) end
if durabilityStat then durabilityStat.Changed:Connect(updateStats) end
if agilityStat then agilityStat.Changed:Connect(updateStats) end

-- =====================================
--  PESTAÑA MISC
-- =====================================
local miscTab = window:AddTab("Misc")
miscTab:Show()
miscTab:AddLabel("------ Walk Speed & Jump ------")
local targetSpeed = 16
local speedActive = false
miscTab:AddTextBox("Set WalkSpeed", function(text)
    local num = tonumber(text)
    if num and num >= 1 and num <= 500 then targetSpeed = num end
end)
miscTab:AddSwitch("Set Speed", function(state)
    speedActive = state
    task.spawn(function()
        while speedActive do
            if player.Character then player.Character.Humanoid.WalkSpeed = targetSpeed end
            task.wait(0.1)
        end
        if player.Character then player.Character.Humanoid.WalkSpeed = 16 end
    end)
end)
local targetJump = 50
miscTab:AddTextBox("Set JumpPower", function(text)
    local num = tonumber(text)
    if num then targetJump = num end
end)
miscTab:AddSwitch("Set JumpPower", function(state)
    if player.Character then
        local hum = player.Character.Humanoid
        hum.UseJumpPower = true
        hum.JumpPower = state and targetJump or 50
    end
end)

miscTab:AddLabel("------ Other Utilities ------")
local antiAfkActive = false
local antiAfkConn
miscTab:AddSwitch("Anti AFK", function(state)
    antiAfkActive = state
    if state then
        antiAfkConn = player.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    elseif antiAfkConn then
        antiAfkConn:Disconnect()
        antiAfkConn = nil
    end
end)
miscTab:AddSwitch("Hide Popups", function(state)
    local frames = {"strengthFrame","durabilityFrame","agilityFrame","evilKarmaFrame","goodKarmaFrame"}
    for _, name in ipairs(frames) do
        local f = replicatedStorage:FindFirstChild(name)
        if f and f:IsA("GuiObject") then f.Visible = not state end
    end
end)
miscTab:AddButton("Remove Portals", function()
    for _, obj in pairs(game:GetDescendants()) do
        if obj.Name == "RobloxForwardPortals" then obj:Destroy() end
    end
end)
miscTab:AddSwitch("Lock Position", function(state)
    if state then
        if player.Character then
            local pos = player.Character.HumanoidRootPart.CFrame
            _G.posLock = game:GetService("RunService").Heartbeat:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = pos
                end
            end)
        end
    elseif _G.posLock then
        _G.posLock:Disconnect()
        _G.posLock = nil
    end
end)
miscTab:AddSwitch("Anti Knockback", function(state)
    if state then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(100000, 0, 100000)
            bv.Velocity = Vector3.new(0,0,0)
            bv.P = 1250
            bv.Parent = root
            _G.antiKnockBV = bv
        end
    elseif _G.antiKnockBV then
        _G.antiKnockBV:Destroy()
        _G.antiKnockBV = nil
    end
end)
miscTab:AddSwitch("God Mode (Brawl)", function(state)
    _G.godMode = state
    task.spawn(function()
        while _G.godMode do
            rEvents.brawlEvent:FireServer("joinBrawl")
            task.wait()
        end
    end)
end)

local waterParts = {}
miscTab:AddSwitch("Walk on Water", function(state)
    if state then
        local size = 2048
        local start = Vector3.new(-2, -9.5, -2)
        local count = math.ceil(50000 / size)
        for i = 0, count-1 do
            for j = 0, count-1 do
                for _, offset in ipairs({Vector3.new(i*size,0,j*size), Vector3.new(-i*size,0,j*size), Vector3.new(-i*size,0,-j*size), Vector3.new(i*size,0,-j*size)}) do
                    local p = Instance.new("Part")
                    p.Size = Vector3.new(size,1,size)
                    p.Position = start + offset
                    p.Anchored = true
                    p.Transparency = 1
                    p.CanCollide = true
                    p.Parent = workspace
                    table.insert(waterParts, p)
                end
            end
        end
    else
        for _, p in pairs(waterParts) do p:Destroy() end
        waterParts = {}
    end
end)

local timeDropdown = miscTab:AddDropdown("Change Time", function(sel)
    local lighting = game:GetService("Lighting")
    if sel == "Night" then lighting.ClockTime = 0
    elseif sel == "Day" then lighting.ClockTime = 12
    elseif sel == "Midnight" then lighting.ClockTime = 6 end
end)
timeDropdown:Add("Night")
timeDropdown:Add("Day")
timeDropdown:Add("Midnight")

miscTab:AddSwitch("Auto Fortune Wheel", function(state)
    _G.autoWheel = state
    task.spawn(function()
        while _G.autoWheel do
            rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", replicatedStorage.fortuneWheelChances["Fortune Wheel"])
            task.wait(5)
        end
    end)
end)

-- =====================================
--  PESTAÑA CRÉDITOS
-- =====================================
local creditsTab = window:AddTab("CRÉDITOS")
creditsTab:Show()
creditsTab:AddLabel("⚫ KOD SCRIPT ⚫")
creditsTab:AddLabel("👑 CREATED BY : KING")
creditsTab:AddLabel("🩸 OWNER : JOHAN KING MONARCA")
creditsTab:AddLabel("🌐 PUBLIC RELEASE")
creditsTab:AddLabel("⚔️ KOD EMPIRE")
creditsTab:AddLabel("🔥 KOD ON TOP 🔥")
creditsTab:AddLabel("Discord: https://discord.gg/DE32rK8gp5")
creditsTab:AddButton("Infinite Yield", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Inf-yeild-New-Version-1836'))()
end)
creditsTab:AddButton("AutoLift Gamepass", function()
    for _, id in pairs(replicatedStorage.gamepassIds:GetChildren()) do
        local iv = Instance.new("IntValue")
        iv.Name = id.Name
        iv.Value = id.Value
        iv.Parent = player.ownedGamepasses
    end
end)

print("✅ KOD SCRIPT cargado correctamente. Logs enviados. Stats abreviados.")
