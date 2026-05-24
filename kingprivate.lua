local player = game.Players.LocalPlayer;
local PlayerGui = player:WaitForChild("PlayerGui");
local loadGui = Instance.new("ScreenGui");
loadGui.Name = "LoadingScreen";
loadGui.ResetOnSpawn = false;
loadGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
loadGui.Parent = PlayerGui;
local background = Instance.new("Frame");
background.Size = UDim2.new(1, 0, 1, 0);
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
background.BorderSizePixel = 0;
background.Parent = loadGui;
local frame = Instance.new("Frame");
frame.Size = UDim2.new(0, 380, 0, 220);
frame.Position = UDim2.new(0.5, -190, 0.5, -110);
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12);
frame.BorderSizePixel = 2;
frame.BorderColor3 = Color3.fromRGB(220, 0, 0);
frame.Parent = loadGui;
local corner = Instance.new("UICorner");
corner.CornerRadius = UDim.new(0, 16);
corner.Parent = frame;
local titleLabel = Instance.new("TextLabel");
titleLabel.Size = UDim2.new(1, 0, 0, 50);
titleLabel.Position = UDim2.new(0, 0, 0, 20);
titleLabel.BackgroundTransparency = 1;
titleLabel.Text = "KING PRIVATE";
titleLabel.TextColor3 = Color3.fromRGB(255, 50, 50);
titleLabel.TextSize = 32;
titleLabel.Font = Enum.Font.GothamBlack;
titleLabel.TextScaled = true;
titleLabel.Parent = frame;
local subLabel = Instance.new("TextLabel");
subLabel.Size = UDim2.new(1, 0, 0, 40);
subLabel.Position = UDim2.new(0, 0, 0, 65);
subLabel.BackgroundTransparency = 1;
subLabel.Text = "THE SCRIPT USERS ARE TOPS 🔥";
subLabel.TextColor3 = Color3.fromRGB(255, 200, 50);
subLabel.TextSize = 18;
subLabel.Font = Enum.Font.GothamBold;
subLabel.Parent = frame;
local barBg = Instance.new("Frame");
barBg.Size = UDim2.new(0.85, 0, 0, 12);
barBg.Position = UDim2.new(0.075, 0, 0, 130);
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
barBg.BorderSizePixel = 0;
barBg.Parent = frame;
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 6);
local barFill = Instance.new("Frame");
barFill.Size = UDim2.new(0, 0, 1, 0);
barFill.BackgroundColor3 = Color3.fromRGB(220, 0, 0);
barFill.BorderSizePixel = 0;
barFill.Parent = barBg;
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 6);
local percentLabel = Instance.new("TextLabel");
percentLabel.Size = UDim2.new(1, 0, 0, 30);
percentLabel.Position = UDim2.new(0, 0, 0, 150);
percentLabel.BackgroundTransparency = 1;
percentLabel.Text = "0%";
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
percentLabel.TextSize = 20;
percentLabel.Font = Enum.Font.GothamBold;
percentLabel.Parent = frame;
local creditLabel = Instance.new("TextLabel");
creditLabel.Size = UDim2.new(1, 0, 0, 20);
creditLabel.Position = UDim2.new(0, 0, 0, 188);
creditLabel.BackgroundTransparency = 1;
creditLabel.Text = "CREATED BY KING | KING ON TOP";
creditLabel.TextColor3 = Color3.fromRGB(150, 150, 150);
creditLabel.TextSize = 11;
creditLabel.Font = Enum.Font.Gotham;
creditLabel.Parent = frame;
for percent = 0, 100 do
    barFill.Size = UDim2.new(percent / 100 * 0.85, 0, 1, 0);
    percentLabel.Text = percent .. "%";
    if percent == 100 then
        percentLabel.TextColor3 = Color3.fromRGB(0, 255, 100);
        barFill.BackgroundColor3 = Color3.fromRGB(0, 200, 80);
        frame.BorderColor3 = Color3.fromRGB(0, 200, 80); 
    end;
    task.wait(0.03); 
end;
task.wait(0.5);
for i = 0, 1, 0.05 do
    background.BackgroundTransparency = i;
    frame.BackgroundTransparency = i;
    titleLabel.TextTransparency = i;
    subLabel.TextTransparency = i;
    barBg.BackgroundTransparency = i;
    barFill.BackgroundTransparency = i;
    percentLabel.TextTransparency = i;
    creditLabel.TextTransparency = i;
    task.wait(0.03); 
end;
loadGui:Destroy();
local player = game.Players.LocalPlayer;
print("KING PRIVATE - WELCOME " .. player.Name);
print("KING PRIVATE SCRIPT CREATED BY KING");
print("KING ON TOP");
print("I HOPE YOU LIKE THE SCRIPT");
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PAPIKING-CODER/VKN/refs/heads/main/KING-LIBRARY-UI.lua"))();
local function isUserWhitelisted()
    local whitelistUrl = "https://raw.githubusercontent.com/PAPIKING-CODER/VKN/refs/heads/main/KINGPRIVATEWHITELIST.json";
    local success, response = pcall(function()
        return game:HttpGet(whitelistUrl); 
    end);
    if not success then
        return false; 
    end;
    local decodedData = game:GetService("HttpService"):JSONDecode(response);
    if not decodedData or not decodedData.whitelist then
        return false; 
    end;
    for _, allowedName in ipairs(decodedData.whitelist) do
        if string.lower(player.Name) == string.lower(allowedName) then
            return true; 
        end; 
    end;
    return false; 
end;
if not isUserWhitelisted() then
    local gui = Instance.new("ScreenGui");
    gui.Name = "WhitelistBlock";
    gui.Parent = player.PlayerGui;
    local frame = Instance.new("Frame");
    frame.Size = UDim2.new(0.4, 0, 0.25, 0);
    frame.Position = UDim2.new(0.3, 0, 0.375, 0);
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    frame.BorderSizePixel = 2;
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0);
    frame.Parent = gui;
    local title = Instance.new("TextLabel");
    title.Size = UDim2.new(1, 0, 0.3, 0);
    title.BackgroundTransparency = 1;
    title.Text = "ACCESS DENIED";
    title.TextColor3 = Color3.fromRGB(255, 0, 0);
    title.TextScaled = true;
    title.Font = Enum.Font.GothamBold;
    title.Parent = frame;
    local msg = Instance.new("TextLabel");
    msg.Size = UDim2.new(1, 0, 0.5, 0);
    msg.Position = UDim2.new(0, 0, 0.35, 0);
    msg.BackgroundTransparency = 1;
    msg.Text = "You are not authorized to use KING PRIVATE SCRIPT.\n\nContact KING for access.";
    msg.TextColor3 = Color3.fromRGB(255, 255, 255);
    msg.TextScaled = true;
    msg.Font = Enum.Font.Gotham;
    msg.Parent = frame;
    local btn = Instance.new("TextButton");
    btn.Size = UDim2.new(0.3, 0, 0.2, 0);
    btn.Position = UDim2.new(0.35, 0, 0.85, 0);
    btn.Text = "Close";
    btn.BackgroundColor3 = Color3.fromRGB(139, 0, 0);
    btn.TextColor3 = Color3.fromRGB(255, 255, 255);
    btn.Parent = frame;
    btn.MouseButton1Click:Connect(function()
        gui:Destroy();
        game:Shutdown(); 
    end);
    error("Unauthorized user: " .. player.Name);
    return; 
end;
local window = Library:AddWindow("KING PRIVATE - WELCOME " .. player.Name, {
    main_color = Color3.fromRGB(255, 0, 0),
    title_bar = {
        Color3.fromRGB(200, 0, 0),
        Color3.fromRGB(80, 0, 0)
    },
    title_bar_transparency = 0,
    background = {
        Color3.fromRGB(0, 0, 0)
    },
    background_transparency = 0,
    min_size = Vector2.new(450, 500),
    can_resize = false,
    toggle_key = Enum.KeyCode.RightShift
});
local function startAntiAFK()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PAPIKING-CODER/VKN/refs/heads/main/VKNANTIAFK.lua"))(); 
end;
local function formatNumber(num)
    if not num then
        return "0"; 
    end;
    num = tonumber(num) or 0;
    if num >= 1e15 then
        return string.format("%.2fQa", num / 1e15);
    elseif num >= 1e12 then
        return string.format("%.2fT", num / 1e12);
    elseif num >= 1e9 then
        return string.format("%.2fB", num / 1e9);
    elseif num >= 1e6 then
        return string.format("%.2fM", num / 1e6);
    elseif num >= 1e3 then
        return string.format("%.2fK", num / 1e3);
    else
        return tostring(math.floor(num)); 
    end; 
end;
local function formatNumberShort(num)
    if not num then
        return "0"; 
    end;
    num = tonumber(num) or 0;
    if num >= 1e15 then
        return string.format("%.1fQa", num / 1e15);
    elseif num >= 1e12 then
        return string.format("%.1fT", num / 1e12);
    elseif num >= 1e9 then
        return string.format("%.1fB", num / 1e9);
    elseif num >= 1e6 then
        return string.format("%.1fM", num / 1e6);
    elseif num >= 1e3 then
        return string.format("%.1fK", num / 1e3);
    else
        return tostring(math.floor(num)); 
    end; 
end;
local function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3
    }); 
end;
local farmV1 = window:AddTab("FarmV1");
farmV1:Show();
local statsFolder = farmV1:AddFolder("📊 STATS IN REAL TIME");
local sessionStart = tick();
local timerLabel = statsFolder:AddLabel("Session Time: 0d 0h 0m 0s");
local initialStrength = player.leaderstats.Strength.Value;
local initialDurability = player.Durability.Value;
local initialRebirths = player.leaderstats.Rebirths.Value;
local totalGainLabel = statsFolder:AddLabel("Total Gains: Str: 0 | Dur: 0 | Rebs: 0");
local strengthRateLabel = statsFolder:AddLabel("Strength Rate: 0/h | 0/d | 0/w | 0/m | 0/y");
local durabilityRateLabel = statsFolder:AddLabel("Durability Rate: 0/h | 0/d | 0/w | 0/m | 0/y");
local rebirthRateLabel = statsFolder:AddLabel("Rebirths Rate: 0/h | 0/d | 0/w | 0/m | 0/y");
task.spawn(function()
    while true do
        local now = tick();
        local elapsed = now - sessionStart;
        local days = math.floor(elapsed / 86400);
        local hours = math.floor((elapsed % 86400) / 3600);
        local minutes = math.floor((elapsed % 3600) / 60);
        local seconds = math.floor(elapsed % 60);
        timerLabel.Text = string.format("Session Time: %dd %dh %dm %ds", days, hours, minutes, seconds);
        local curStrength = player.leaderstats.Strength.Value;
        local curDurability = player.Durability.Value;
        local curRebirths = player.leaderstats.Rebirths.Value;
        local gainStr = curStrength - initialStrength;
        local gainDur = curDurability - initialDurability;
        local gainReb = curRebirths - initialRebirths;
        totalGainLabel.Text = string.format("Total Gains: Str: %s | Dur: %s | Rebs: %s", formatNumber(gainStr), formatNumber(gainDur), formatNumber(gainReb));
        if elapsed > 0 then
            local strPerSec = gainStr / elapsed;
            local durPerSec = gainDur / elapsed;
            local rebPerSec = gainReb / elapsed;
            strengthRateLabel.Text = string.format("Strength Rate: %s/h | %s/d | %s/w | %s/m | %s/y", formatNumberShort(strPerSec * 3600), formatNumberShort(strPerSec * 86400), formatNumberShort(strPerSec * 604800), formatNumberShort(strPerSec * 2592000), formatNumberShort(strPerSec * 31536000));
            durabilityRateLabel.Text = string.format("Durability Rate: %s/h | %s/d | %s/w | %s/m | %s/y", formatNumberShort(durPerSec * 3600), formatNumberShort(durPerSec * 86400), formatNumberShort(durPerSec * 604800), formatNumberShort(durPerSec * 2592000), formatNumberShort(durPerSec * 31536000));
            rebirthRateLabel.Text = string.format("Rebirths Rate: %s/h | %s/d | %s/w | %s/m | %s/y", formatNumberShort(rebPerSec * 3600), formatNumberShort(rebPerSec * 86400), formatNumberShort(rebPerSec * 604800), formatNumberShort(rebPerSec * 2592000), formatNumberShort(rebPerSec * 31536000)); 
        end;
        task.wait(1); 
    end; 
end);
local funcFolder = farmV1:AddFolder("⚙️ FUNCTIONS");
funcFolder:AddSwitch("Fast Rebirth", function(state)
    fastRebirth = state;
    if fastRebirth then
        spawn(function()
            local v_u_4 = game:GetService("ReplicatedStorage");
            local v_u_5 = game:GetService("Players").LocalPlayer;
            local function v_u_15(_)
                local v6 = v_u_5.petsFolder;
                local v7, v8, v9 = pairs(v6:GetChildren());
                while true do
                    local v10;
                    v9, v10 = v7(v8, v9);
                    if v9 == nil then
                        break; 
                    end;
                    if v10:IsA("Folder") then
                        local v11, v12, v13 = pairs(v10:GetChildren());
                        while true do
                            local v14;
                            v13, v14 = v11(v12, v13);
                            if v13 == nil then
                                break; 
                            end;
                            v_u_4.rEvents.equipPetEvent:FireServer("unequipPet", v14); 
                        end; 
                    end; 
                end;
                task.wait(0.1); 
            end;
            local function v21(p16)
                v_u_15();
                task.wait(0.01);
                local v17, v18, v19 = pairs(v_u_5.petsFolder.Unique:GetChildren());
                while true do
                    local v20;
                    v19, v20 = v17(v18, v19);
                    if v19 == nil then
                        break; 
                    end;
                    if v20.Name == p16 then
                        v_u_4.rEvents.equipPetEvent:FireServer("equipPet", v20); 
                    end; 
                end; 
            end;
            local v22 = v_u_15;
            local function v29(p23)
                local v24 = workspace.machinesFolder:FindFirstChild(p23);
                if not v24 then
                    local v25, v26, v27 = pairs(workspace:GetChildren());
                    while true do
                        local v28;
                        v27, v28 = v25(v26, v27);
                        if v27 == nil then
                            break; 
                        end;
                        if v28:IsA("Folder") and v28.Name:find("machines") then
                            v24 = v28:FindFirstChild(p23);
                            if v24 then
                                break; 
                            end; 
                        end; 
                    end; 
                end;
                return v24; 
            end;
            local function v31()
                local v30 = game:GetService("VirtualInputManager");
                v30:SendKeyEvent(true, "E", false, game);
                task.wait(0.1);
                v30:SendKeyEvent(false, "E", false, game); 
            end;
            while fastRebirth do
                local v32 = 10000 + 5000 * v_u_5.leaderstats.Rebirths.Value;
                if v_u_5.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                    local v33 = v_u_5.ultimatesFolder["Golden Rebirth"].Value;
                    v32 = math.floor(v32 * ((1 - v33 * 0.1))); 
                end;
                v22();
                task.wait(0.1);
                v21("Swift Samurai");
                while v_u_5.leaderstats.Strength.Value < v32 do
                    for _ = 1, 10 do
                        v_u_5.muscleEvent:FireServer("rep"); 
                    end;
                    task.wait(); 
                end;
                v22();
                task.wait(0.1);
                v21("Tribal Overlord");
                local v34 = v29("Jungle Bar Lift");
                if v34 and v34:FindFirstChild("interactSeat") then
                    v_u_5.Character.HumanoidRootPart.CFrame = v34.interactSeat.CFrame * CFrame.new(0, 3, 0);
                    repeat
                        task.wait(0.1);
                        v31();
                    until v_u_5.Character.Humanoid.Sit; 
                end;
                local v35 = v_u_5.leaderstats.Rebirths.Value;
                repeat
                    v_u_4.rEvents.rebirthRemote:InvokeServer("rebirthRequest");
                    task.wait(0.1);
                until v35 < v_u_5.leaderstats.Rebirths.Value;
                task.wait(); 
            end; 
        end); 
    end; 
end);
funcFolder:AddSwitch("Lock Position (Enable After Fast Rebirth)", function(state)
    lockPosition = state;
    local v37 = game.Players.LocalPlayer;
    local v38 = v37.Character or v37.CharacterAdded:Wait();
    local v39 = v38:FindFirstChild("Humanoid");
    local hrp = v38:FindFirstChild("HumanoidRootPart");
    if state and ((v39 and hrp)) then
        savedPosition = hrp.Position;
        v39.WalkSpeed = 0;
        task.spawn(function()
            while lockPosition do
                if ((hrp.Position - savedPosition)).magnitude > 0.1 then
                    hrp.CFrame = CFrame.new(savedPosition); 
                end;
                task.wait(0.05); 
            end; 
        end);
    elseif v39 then
        v39.WalkSpeed = 16; 
    end; 
end);
funcFolder:AddSwitch("Fast Strength", function(state)
    getgenv().isGrinding = state;
    if state then
        for _ = 1, 30 do
            task.spawn(function()
                while getgenv().isGrinding do
                    player.muscleEvent:FireServer("rep");
                    task.wait(0.01); 
                end; 
            end); 
        end; 
    end; 
end);
funcFolder:AddSwitch("Ultimate Fast Strength", function(state)
    getgenv().isGrinding = state;
    if state then
        task.spawn(function()
            while getgenv().isGrinding do
                for i = 1, 3000 do
                    if not getgenv().isGrinding then
                        break; 
                    end;
                    player.muscleEvent:FireServer("rep");
                    if i % 500 == 0 then
                        task.wait(0); 
                    end; 
                end;
                task.wait(0.05); 
            end; 
        end); 
    end; 
end);
funcFolder:AddSwitch("Hide Frame", function(state)
    local frames = {
        "strengthFrame",
        "durabilityFrame",
        "agilityFrame"
    };
    for _, name in ipairs(frames) do
        local frame = game:GetService("ReplicatedStorage"):FindFirstChild(name);
        if frame and frame:IsA("GuiObject") then
            frame.Visible = not state; 
        end; 
    end; 
end);
local toolsFolder = farmV1:AddFolder("🛠️ AUTO TOOLS");
toolsFolder:AddSwitch("Auto Punch", function(state)
    if state then
        local punch = player.Backpack:FindFirstChild("Punch") or workspace:FindFirstChild(player.Name):FindFirstChild("Punch");
        _G.punchanim = true;
        while _G.punchanim do
            if punch then
                if punch.Parent ~= workspace:FindFirstChild(player.Name) then
                    punch.Parent = workspace:FindFirstChild(player.Name); 
                end;
                punch:Activate();
                wait();
            else
                _G.punchanim = false; 
            end; 
        end;
    else
        _G.punchanim = false; 
    end; 
end):Set(false);
toolsFolder:AddSwitch("Fast Punch", function(state)
    local backpackPunch = player.Backpack:FindFirstChild("Punch");
    local charPunch = workspace:FindFirstChild(player.Name) and workspace:FindFirstChild(player.Name):FindFirstChild("Punch");
    local target = backpackPunch or charPunch;
    if target and target:FindFirstChild("attackTime") then
        target.attackTime.Value = state and 0 or 0.35; 
    end; 
end):Set(false);
toolsFolder:AddSwitch("Gain Strength", function(state)
    _G.autoStrength = state;
    while _G.autoStrength do
        wait(0.01);
        local weight = player.Backpack:FindFirstChild("Weight");
        if weight then
            player.Character.Humanoid:EquipTool(weight); 
        end;
        player.muscleEvent:FireServer("rep"); 
    end;
    if not _G.autoStrength then
        local equipped = player.Character:FindFirstChildOfClass("Tool");
        if equipped and equipped.Name == "Weight" then
            equipped.Parent = player.Backpack; 
        end; 
    end; 
end):Set(false);
toolsFolder:AddSwitch("Auto Pushups", function(state)
    _G.autoPushups = state;
    while _G.autoPushups do
        wait(0.01);
        local tool = player.Backpack:FindFirstChild("Pushups");
        if tool then
            player.Character.Humanoid:EquipTool(tool); 
        end;
        player.muscleEvent:FireServer("rep"); 
    end;
    if not _G.autoPushups then
        local equipped = player.Character:FindFirstChildOfClass("Tool");
        if equipped and equipped.Name == "Pushups" then
            equipped.Parent = player.Backpack; 
        end; 
    end; 
end):Set(false);
toolsFolder:AddSwitch("Auto Situps", function(state)
    _G.autoSitups = state;
    while _G.autoSitups do
        wait(0.01);
        local tool = player.Backpack:FindFirstChild("Situps");
        if tool then
            player.Character.Humanoid:EquipTool(tool); 
        end;
        player.muscleEvent:FireServer("rep"); 
    end;
    if not _G.autoSitups then
        local equipped = player.Character:FindFirstChildOfClass("Tool");
        if equipped and equipped.Name == "Situps" then
            equipped.Parent = player.Backpack; 
        end; 
    end; 
end):Set(false);
toolsFolder:AddSwitch("Auto Handstands", function(state)
    _G.autoHandstands = state;
    while _G.autoHandstands do
        wait(0.01);
        local tool = player.Backpack:FindFirstChild("Handstands");
        if tool then
            player.Character.Humanoid:EquipTool(tool); 
        end;
        player.muscleEvent:FireServer("rep"); 
    end;
    if not _G.autoHandstands then
        local equipped = player.Character:FindFirstChildOfClass("Tool");
        if equipped and equipped.Name == "Handstands" then
            equipped.Parent = player.Backpack; 
        end; 
    end; 
end):Set(false);
local extrasFolder = farmV1:AddFolder("✨ EXTRAS & OPTIMIZATION");
extrasFolder:AddButton("Equip 7-8 Swift Samurai", function()
    local petsFolder = player.petsFolder;
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("unequipPet", pet); 
            end; 
        end; 
    end;
    task.wait(0.2);
    local equipped = 0;
    for _, pet in pairs(petsFolder.Unique:GetChildren()) do
        if pet.Name == "Swift Samurai" and equipped < 8 then
            game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("equipPet", pet);
            equipped = equipped + 1;
            task.wait(0.05); 
        end; 
    end;
    notify("Auto Equip", "Equipped " .. equipped .. " Swift Samurai(s)", 3); 
end);
extrasFolder:AddButton("Teleport to Jungle Bar", function()
    local char = player.Character;
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(-8642.396484375, 6.7980651855, 2086.1030273);
        notify("Teleport", "Teleported to Jungle Bar", 2); 
    end; 
end);
extrasFolder:AddButton("Teleport to Jungle Squat", function()
    local char = player.Character;
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(-8371.43359375, 6.79806327, 2858.88525390);
        notify("Teleport", "Teleported to Jungle Squat", 2); 
    end; 
end);
extrasFolder:AddSwitch("Auto Spin Wheel", function(state)
    _G.autoSpinWheel = state;
    task.spawn(function()
        while _G.autoSpinWheel do
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"]); 
            end);
            task.wait(1); 
        end; 
    end); 
end);
extrasFolder:AddSwitch("Auto Eat Egg (30 min)", function(state)
    _G.autoEat30 = state;
    task.spawn(function()
        while _G.autoEat30 do
            local egg = player.Backpack:FindFirstChild("Protein Egg");
            if egg then
                egg.Parent = player.Character;
                pcall(function()
                    egg:Activate(); 
                end); 
            end;
            task.wait(1800); 
        end; 
    end); 
end);
extrasFolder:AddSwitch("Auto Eat Egg (60 min)", function(state)
    _G.autoEat60 = state;
    task.spawn(function()
        while _G.autoEat60 do
            local egg = player.Backpack:FindFirstChild("Protein Egg");
            if egg then
                egg.Parent = player.Character;
                pcall(function()
                    egg:Activate(); 
                end); 
            end;
            task.wait(3600); 
        end; 
    end); 
end);
extrasFolder:AddSwitch("Full Automation (Max FPS)", function(state)
    if state then
        if not _G.originalSettingsFull then
            _G.originalSettingsFull = {
                GlobalShadows = game.Lighting.GlobalShadows,
                FogEnd = game.Lighting.FogEnd,
                Brightness = game.Lighting.Brightness,
                Ambient = game.Lighting.Ambient,
                OutdoorAmbient = game.Lighting.OutdoorAmbient,
                QualityLevel = settings().Rendering.QualityLevel,
                ClockTime = game.Lighting.ClockTime
            }; 
        end;
        game.Lighting.GlobalShadows = false;
        game.Lighting.FogEnd = 9e9;
        game.Lighting.Brightness = 0;
        game.Lighting.Ambient = Color3.fromRGB(0, 0, 0);
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0);
        game.Lighting.ClockTime = 0;
        settings().Rendering.QualityLevel = "Level01";
        for _, v in pairs(game.Lighting:GetChildren()) do
            if v:IsA("Sky") then
                v:Destroy(); 
            end; 
        end;
        local darkSky = Instance.new("Sky");
        darkSky.Name = "DarkSky";
        darkSky.SkyboxBk = "rbxassetid://0";
        darkSky.SkyboxDn = "rbxassetid://0";
        darkSky.SkyboxFt = "rbxassetid://0";
        darkSky.SkyboxLf = "rbxassetid://0";
        darkSky.SkyboxRt = "rbxassetid://0";
        darkSky.SkyboxUp = "rbxassetid://0";
        darkSky.Parent = game.Lighting;
        for _, obj in pairs(workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Trail") then
                    obj:Destroy();
                elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                    obj:Destroy();
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    obj.Transparency = 1;
                elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") then
                    obj.Material = Enum.Material.SmoothPlastic;
                    obj.Reflectance = 0; 
                end; 
            end); 
        end;
        for _, portal in pairs(game:GetDescendants()) do
            if portal.Name == "RobloxForwardPortals" then
                portal:Destroy(); 
            end; 
        end;
        if not _G.portalConnection then
            _G.portalConnection = game.DescendantAdded:Connect(function(desc)
                if desc.Name == "RobloxForwardPortals" then
                    desc:Destroy(); 
                end; 
            end); 
        end;
        notify("Full Automation", "Extreme optimization activated! Max FPS mode.", 3);
    else
        if _G.originalSettingsFull then
            game.Lighting.GlobalShadows = _G.originalSettingsFull.GlobalShadows;
            game.Lighting.FogEnd = _G.originalSettingsFull.FogEnd;
            game.Lighting.Brightness = _G.originalSettingsFull.Brightness;
            game.Lighting.Ambient = _G.originalSettingsFull.Ambient;
            game.Lighting.OutdoorAmbient = _G.originalSettingsFull.OutdoorAmbient;
            game.Lighting.ClockTime = _G.originalSettingsFull.ClockTime;
            settings().Rendering.QualityLevel = _G.originalSettingsFull.QualityLevel;
        else
            game.Lighting.GlobalShadows = true;
            game.Lighting.FogEnd = 100000;
            game.Lighting.Brightness = 2;
            game.Lighting.Ambient = Color3.fromRGB(127, 127, 127);
            game.Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127);
            game.Lighting.ClockTime = 12;
            settings().Rendering.QualityLevel = "Level21"; 
        end;
        notify("Full Automation", "Extreme optimization deactivated. Graphics restored (particles may remain removed).", 3); 
    end; 
end);
extrasFolder:AddSwitch("Anti Lag (Medium)", function(state)
    if state then
        if not _G.originalSettingsLight then
            _G.originalSettingsLight = {
                GlobalShadows = game.Lighting.GlobalShadows,
                FogEnd = game.Lighting.FogEnd,
                Brightness = game.Lighting.Brightness,
                QualityLevel = settings().Rendering.QualityLevel
            }; 
        end;
        game.Lighting.GlobalShadows = false;
        game.Lighting.FogEnd = 5000;
        game.Lighting.Brightness = 1;
        settings().Rendering.QualityLevel = "Level01";
        notify("Anti Lag", "Medium optimization activated. FPS boost.", 3);
    else
        if _G.originalSettingsLight then
            game.Lighting.GlobalShadows = _G.originalSettingsLight.GlobalShadows;
            game.Lighting.FogEnd = _G.originalSettingsLight.FogEnd;
            game.Lighting.Brightness = _G.originalSettingsLight.Brightness;
            settings().Rendering.QualityLevel = _G.originalSettingsLight.QualityLevel;
        else
            game.Lighting.GlobalShadows = true;
            game.Lighting.FogEnd = 100000;
            game.Lighting.Brightness = 2;
            settings().Rendering.QualityLevel = "Level21"; 
        end;
        notify("Anti Lag", "Medium optimization deactivated. Graphics restored.", 3); 
    end; 
end);
extrasFolder:AddButton("Anti AFK", startAntiAFK);
local killTab = window:AddTab("Killing");
killTab:Show();
local whitelist = {};
local blacklist = {};
local killMethod = "Everyone";
local autoKillActive = false;
local targetPlayerName = nil;
local spectateActive = false;
local function checkCharacter()
    if not player.Character then
        repeat
            task.wait();
        until player.Character; 
    end;
    return player.Character; 
end;
local function equipPunch()
    local punch = player.Backpack:FindFirstChild("Punch");
    if punch and player.Character then
        player.Character.Humanoid:EquipTool(punch); 
    end; 
end;
local function killTarget(target)
    if not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
        return; 
    end;
    local char = checkCharacter();
    if char and char:FindFirstChild("LeftHand") then
        pcall(function()
            firetouchinterest(target.Character.HumanoidRootPart, char.LeftHand, 0);
            firetouchinterest(target.Character.HumanoidRootPart, char.LeftHand, 1);
            equipPunch(); 
        end); 
    end; 
end;
local function killEveryone()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and not table.find(whitelist, p.Name) then
            killTarget(p); 
        end; 
    end; 
end;
local function killBlacklisted()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and table.find(blacklist, p.Name) then
            killTarget(p); 
        end; 
    end; 
end;
local function killSpecific(name)
    local target = game.Players:FindFirstChild(name);
    if target then
        killTarget(target); 
    end; 
end;
killTab:AddLabel("Select damage or durability pet");
local petDropdown = killTab:AddDropdown("Select Pet", function(petName)
    for _, folder in pairs(player.petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("unequipPet", pet); 
            end; 
        end; 
    end;
    task.wait(0.2);
    for _, pet in pairs(player.petsFolder.Unique:GetChildren()) do
        if pet.Name == petName then
            game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("equipPet", pet); 
        end; 
    end; 
end);
petDropdown:Add("Wild Wizard");
petDropdown:Add("Mighty Monster");
killTab:AddSwitch("Auto Good Karma", function(state)
    _G.autoGoodKarma = state;
    task.spawn(function()
        while _G.autoGoodKarma do
            local char = player.Character;
            local right = char and char:FindFirstChild("RightHand");
            local left = char and char:FindFirstChild("LeftHand");
            if right and left then
                for _, target in pairs(game.Players:GetPlayers()) do
                    if target ~= player then
                        local evil = target:FindFirstChild("evilKarma");
                        local good = target:FindFirstChild("goodKarma");
                        if evil and good and evil.Value > good.Value then
                            local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart");
                            if root then
                                firetouchinterest(right, root, 1);
                                firetouchinterest(left, root, 1);
                                firetouchinterest(right, root, 0);
                                firetouchinterest(left, root, 0); 
                            end; 
                        end; 
                    end; 
                end; 
            end;
            task.wait(0.1); 
        end; 
    end); 
end);
killTab:AddSwitch("Auto Bad Karma", function(state)
    _G.autoBadKarma = state;
    task.spawn(function()
        while _G.autoBadKarma do
            local char = player.Character;
            local right = char and char:FindFirstChild("RightHand");
            local left = char and char:FindFirstChild("LeftHand");
            if right and left then
                for _, target in pairs(game.Players:GetPlayers()) do
                    if target ~= player then
                        local evil = target:FindFirstChild("evilKarma");
                        local good = target:FindFirstChild("goodKarma");
                        if evil and good and good.Value > evil.Value then
                            local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart");
                            if root then
                                firetouchinterest(right, root, 1);
                                firetouchinterest(left, root, 1);
                                firetouchinterest(right, root, 0);
                                firetouchinterest(left, root, 0); 
                            end; 
                        end; 
                    end; 
                end; 
            end;
            task.wait(0.1); 
        end; 
    end); 
end);
killTab:AddLabel("---- Whitelist Management ----");
local whitelistAdd = killTab:AddDropdown("Add to Whitelist", function(selected)
    if not table.find(whitelist, selected) then
        table.insert(whitelist, selected); 
    end; 
end);
local whitelistRemove = killTab:AddDropdown("Remove from Whitelist", function(selected)
    for i, name in ipairs(whitelist) do
        if name == selected then
            table.remove(whitelist, i);
            break; 
        end; 
    end; 
end);
killTab:AddButton("Clear Whitelist", function()
    whitelist = {}; 
end);
killTab:AddLabel("---- Kill List (Blacklist) ----");
local blacklistAdd = killTab:AddDropdown("Add to Kill List", function(selected)
    if not table.find(blacklist, selected) then
        table.insert(blacklist, selected); 
    end; 
end);
local blacklistRemove = killTab:AddDropdown("Remove from Kill List", function(selected)
    for i, name in ipairs(blacklist) do
        if name == selected then
            table.remove(blacklist, i);
            break; 
        end; 
    end; 
end);
killTab:AddButton("Clear Kill List", function()
    blacklist = {}; 
end);
killTab:AddSwitch("Auto Whitelist Friends", function(state)
    if state then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and player:IsFriendsWith(p.UserId) and not table.find(whitelist, p.Name) then
                table.insert(whitelist, p.Name); 
            end; 
        end;
        game.Players.PlayerAdded:Connect(function(p)
            if state and p ~= player and player:IsFriendsWith(p.UserId) and not table.find(whitelist, p.Name) then
                table.insert(whitelist, p.Name); 
            end; 
        end); 
    end; 
end);
killTab:AddLabel("---- Auto Kill Modes ----");
local killModeDropdown = killTab:AddDropdown("Kill Mode", function(mode)
    killMethod = mode; 
end);
killModeDropdown:Add("Everyone (except whitelist)");
killModeDropdown:Add("Only Kill List");
killTab:AddSwitch("Auto Kill", function(state)
    autoKillActive = state;
    task.spawn(function()
        while autoKillActive do
            if killMethod == "Everyone (except whitelist)" then
                killEveryone();
            else
                killBlacklisted(); 
            end;
            task.wait(0.05); 
        end; 
    end); 
end);
killTab:AddLabel("---- Single Target Kill ----");
local targetDropdown = killTab:AddDropdown("Select Target", function(selected)
    targetPlayerName = selected; 
end);
killTab:AddSwitch("Kill Selected Target", function(state)
    _G.killTarget = state;
    task.spawn(function()
        while _G.killTarget and targetPlayerName do
            killSpecific(targetPlayerName);
            task.wait(0.1); 
        end; 
    end); 
end);
killTab:AddLabel("---- Kill Aura (Death Ring) ----");
killTab:AddTextBox("Range (1-140)", function(val)
    _G.deathRingRange = math.clamp(tonumber(val) or 20, 1, 140); 
end);
local ringActive = false;
local ringPart = nil;
killTab:AddSwitch("Death Ring", function(state)
    ringActive = state;
    task.spawn(function()
        while ringActive do
            local char = player.Character;
            local hrp = char and char:FindFirstChild("HumanoidRootPart");
            if hrp then
                if not ringPart then
                    ringPart = Instance.new("Part");
                    ringPart.Shape = Enum.PartType.Cylinder;
                    ringPart.Material = Enum.Material.Neon;
                    ringPart.Color = Color3.fromRGB(200, 0, 0);
                    ringPart.Transparency = 0.5;
                    ringPart.Anchored = true;
                    ringPart.CanCollide = false;
                    ringPart.Parent = workspace; 
                end;
                local diam = ((_G.deathRingRange or 20)) * 2;
                ringPart.Size = Vector3.new(0.2, diam, diam);
                ringPart.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(90));
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= player and not table.find(whitelist, p.Name) then
                        local tHrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart");
                        if tHrp and ((hrp.Position - tHrp.Position)).Magnitude <= ((_G.deathRingRange or 20)) then
                            killTarget(p); 
                        end; 
                    end; 
                end; 
            end;
            task.wait(0.05); 
        end;
        if ringPart then
            ringPart:Destroy();
            ringPart = nil; 
        end; 
    end); 
end);
killTab:AddSwitch("Show Ring", function(state)
    _G.showRing = state;
    if ringPart then
        ringPart.Transparency = state and 0.5 or 1; 
    end; 
end);
killTab:AddLabel("---- Spectate Player ----");
local spectateDropdown = killTab:AddDropdown("Select Player to Spectate", function(selected)
    targetPlayerName = selected; 
end);
killTab:AddSwitch("Spectate", function(state)
    spectateActive = state;
    task.spawn(function()
        while spectateActive and targetPlayerName do
            local target = game.Players:FindFirstChild(targetPlayerName);
            if target and target.Character then
                local hum = target.Character:FindFirstChild("Humanoid");
                if hum then
                    workspace.CurrentCamera.CameraSubject = hum; 
                end; 
            end;
            task.wait(0.1); 
        end;
        if not spectateActive then
            workspace.CurrentCamera.CameraSubject = player.Character and player.Character:FindFirstChild("Humanoid") or player; 
        end; 
    end); 
end);
killTab:AddLabel("---- Teleport/Follow Player ----");
local followDropdown = killTab:AddDropdown("Select Player to Follow", function(selected)
    _G.followTarget = selected; 
end);
killTab:AddSwitch("Follow Player (TP behind)", function(state)
    _G.followActive = state;
    task.spawn(function()
        while _G.followActive and _G.followTarget do
            local target = game.Players:FindFirstChild(_G.followTarget);
            if target and target.Character then
                local myChar = player.Character;
                local targetHRP = target.Character:FindFirstChild("HumanoidRootPart");
                if myChar and targetHRP then
                    myChar:SetPrimaryPartCFrame(targetHRP.CFrame * CFrame.new(0, 0, 3)); 
                end; 
            end;
            task.wait(0.1); 
        end; 
    end); 
end);
killTab:AddButton("Stop Following", function()
    _G.followActive = false; 
end);
killTab:AddLabel("---- Kill Settings ----");
killTab:AddButton("Remove Punch Animations", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XUnfm6KJ"))(); 
end);
killTab:AddButton("Recover Punch Animations", function()
    if player.Character then
        player.Character:BreakJoints(); 
    end; 
end);
killTab:AddSwitch("Anti-Knockback", function(state)
    if state then
        if not _G.antiKB then
            _G.antiKB = game:GetService("RunService").Heartbeat:Connect(function()
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
                if hrp then
                    local bv = hrp:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity");
                    bv.MaxForce = Vector3.new(100000, 0, 100000);
                    bv.Parent = hrp;
                    bv.Velocity = Vector3.new(0, 0, 0); 
                end; 
            end); 
        end;
    else
        if _G.antiKB then
            _G.antiKB:Disconnect();
            _G.antiKB = nil; 
        end;
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
        if hrp then
            local bv = hrp:FindFirstChild("BodyVelocity");
            if bv then
                bv:Destroy(); 
            end; 
        end; 
    end; 
end);
killTab:AddSwitch("Auto Equip Punch", function(state)
    _G.autoEquipPunch = state;
    task.spawn(function()
        while _G.autoEquipPunch do
            local punch = player.Backpack:FindFirstChild("Punch");
            if punch then
                punch.Parent = player.Character; 
            end;
            task.wait(0.2); 
        end; 
    end); 
end);
killTab:AddSwitch("Auto Punch [without animation]", function(state)
    _G.autoPunchNoAnim = state;
    task.spawn(function()
        while _G.autoPunchNoAnim do
            local punch = player.Character and player.Character:FindFirstChild("Punch");
            if punch then
                player.muscleEvent:FireServer("punch", "rightHand");
                player.muscleEvent:FireServer("punch", "leftHand"); 
            end;
            task.wait(0.01); 
        end; 
    end); 
end);
killTab:AddSwitch("Auto Punch (normal)", function(state)
    _G.autoPunch = state;
    task.spawn(function()
        while _G.autoPunch do
            local punch = player.Character and player.Character:FindFirstChild("Punch");
            if punch then
                punch:Activate(); 
            end;
            task.wait(0.1); 
        end; 
    end); 
end);
killTab:AddSwitch("Fast Punch", function(state)
    _G.fastPunch = state;
    task.spawn(function()
        while _G.fastPunch do
            local punch = player.Backpack:FindFirstChild("Punch");
            if punch then
                punch.Parent = player.Character;
                if punch:FindFirstChild("attackTime") then
                    punch.attackTime.Value = 0; 
                end; 
            end;
            player.muscleEvent:FireServer("punch", "rightHand");
            player.muscleEvent:FireServer("punch", "leftHand");
            task.wait(); 
        end; 
    end); 
end);
killTab:AddSwitch("God Mode (Brawl)", function(state)
    _G.godMode = state;
    task.spawn(function()
        while _G.godMode do
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl");
            task.wait(); 
        end; 
    end); 
end);
killTab:AddSwitch("Auto Slams", function(state)
    _G.autoSlams = state;
    task.spawn(function()
        while _G.autoSlams do
            local slam = player.Backpack:FindFirstChild("Ground Slam") or (player.Character and player.Character:FindFirstChild("Ground Slam"));
            if slam then
                if slam.Parent == player.Backpack then
                    slam.Parent = player.Character; 
                end;
                if slam:FindFirstChild("attackTime") then
                    slam.attackTime.Value = 0; 
                end;
                player.muscleEvent:FireServer("slam");
                slam:Activate(); 
            end;
            task.wait(0.2); 
        end; 
    end); 
end);
killTab:AddButton("NaN Size", function()
    game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 0 / 0); 
end);
killTab:AddSwitch("Block Eating Eggs", function(state)
    if state then
        _G.blockEggs = hookfunction(game:GetService("ReplicatedStorage").rEvents.eatEvent.FireServer, function()
             
        end);
    else
        if _G.blockEggs then
            _G.blockEggs = nil; 
        end; 
    end; 
end);
killTab:AddSwitch("Freeze Water", function(state)
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") and part.Name:lower():find("water") then
            part.Anchored = state; 
        end; 
    end; 
end);
local timeDropdown = killTab:AddDropdown("Change Time", function(sel)
    local lighting = game:GetService("Lighting");
    if sel == "Night" then
        lighting.ClockTime = 0;
    elseif sel == "Day" then
        lighting.ClockTime = 12;
    elseif sel == "Midnight" then
        lighting.ClockTime = 6; 
    end; 
end);
timeDropdown:Add("Night");
timeDropdown:Add("Day");
timeDropdown:Add("Midnight");
local function addPlayerToAllDropdowns(playerName)
    whitelistAdd:Add(playerName);
    whitelistRemove:Add(playerName);
    blacklistAdd:Add(playerName);
    blacklistRemove:Add(playerName);
    targetDropdown:Add(playerName);
    spectateDropdown:Add(playerName);
    followDropdown:Add(playerName); 
end;
local function removePlayerFromAllDropdowns(playerName)
    whitelistAdd:Remove(playerName);
    whitelistRemove:Remove(playerName);
    blacklistAdd:Remove(playerName);
    blacklistRemove:Remove(playerName);
    targetDropdown:Remove(playerName);
    spectateDropdown:Remove(playerName);
    followDropdown:Remove(playerName); 
end;
for _, p in pairs(game.Players:GetPlayers()) do
    if p ~= player then
        addPlayerToAllDropdowns(p.Name); 
    end; 
end;
game.Players.PlayerAdded:Connect(function(p)
    if p ~= player then
        addPlayerToAllDropdowns(p.Name); 
    end; 
end);
game.Players.PlayerRemoving:Connect(function(p)
    if p ~= player then
        removePlayerFromAllDropdowns(p.Name); 
    end; 
end);
killTab:AddButton("Anti AFK", startAntiAFK);
local spectTab = window:AddTab("Spect");
spectTab:Show();
local selectedSpecPlayer = nil;
local specDropdown = spectTab:AddDropdown("Select Player", function(displayName)
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.DisplayName == displayName then
            selectedSpecPlayer = p;
            break; 
        end; 
    end; 
end);
local specNameLabel = spectTab:AddLabel("Name: -");
local specStrLabel = spectTab:AddLabel("Strength: -");
local specDurLabel = spectTab:AddLabel("Durability: -");
local specRebLabel = spectTab:AddLabel("Rebirths: -");
local specKillsLabel = spectTab:AddLabel("Kills: -");
local specAgilityLabel = spectTab:AddLabel("Agility: -");
local specGoodLabel = spectTab:AddLabel("Good Karma: -");
local specEvilLabel = spectTab:AddLabel("Evil Karma: -");
local specBrawlsLabel = spectTab:AddLabel("Brawls: -");
local function updateSpecs()
    if not selectedSpecPlayer then
        specNameLabel.Text = "Name: -";
        return; 
    end;
    specNameLabel.Text = "Name: " .. selectedSpecPlayer.Name .. " (" .. selectedSpecPlayer.DisplayName .. ")";
    local ls = selectedSpecPlayer:FindFirstChild("leaderstats");
    if ls then
        specStrLabel.Text = "Strength: " .. formatNumber(ls:FindFirstChild("Strength") and ls.Strength.Value or 0);
        specRebLabel.Text = "Rebirths: " .. formatNumber(ls:FindFirstChild("Rebirths") and ls.Rebirths.Value or 0);
        specKillsLabel.Text = "Kills: " .. formatNumber(ls:FindFirstChild("Kills") and ls.Kills.Value or 0);
        specBrawlsLabel.Text = "Brawls: " .. formatNumber(ls:FindFirstChild("Brawls") and ls.Brawls.Value or 0); 
    end;
    specDurLabel.Text = "Durability: " .. formatNumber(selectedSpecPlayer:FindFirstChild("Durability") and selectedSpecPlayer.Durability.Value or 0);
    specAgilityLabel.Text = "Agility: " .. formatNumber(selectedSpecPlayer:FindFirstChild("Agility") and selectedSpecPlayer.Agility.Value or 0);
    specGoodLabel.Text = "Good Karma: " .. formatNumber(selectedSpecPlayer:FindFirstChild("goodKarma") and selectedSpecPlayer.goodKarma.Value or 0);
    specEvilLabel.Text = "Evil Karma: " .. formatNumber(selectedSpecPlayer:FindFirstChild("evilKarma") and selectedSpecPlayer.evilKarma.Value or 0); 
end;
task.spawn(function()
    while true do
        updateSpecs();
        task.wait(1); 
    end; 
end);
for _, p in pairs(game.Players:GetPlayers()) do
    if p ~= player then
        specDropdown:Add(p.DisplayName); 
    end; 
end;
game.Players.PlayerAdded:Connect(function(p)
    if p ~= player then
        specDropdown:Add(p.DisplayName); 
    end; 
end);
game.Players.PlayerRemoving:Connect(function(p)
    if p ~= player then
        specDropdown:Remove(p.DisplayName); 
    end; 
end);
spectTab:AddButton("Anti AFK", startAntiAFK);
local rebTab = window:AddTab("Rebirth");
rebTab:Show();
rebTab:AddTextBox("Target Rebirths", function(val)
    _G.targetReb = tonumber(val) or 0; 
end);
rebTab:AddSwitch("Auto Rebirth (Target)", function(state)
    _G.autoRebTarget = state;
    task.spawn(function()
        while _G.autoRebTarget do
            local cur = player.leaderstats.Rebirths.Value;
            if cur >= _G.targetReb then
                _G.autoRebTarget = false;
                notify("Rebirths", "Target reached!", 3);
                break; 
            end;
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest");
            task.wait(0.1); 
        end; 
    end); 
end);
rebTab:AddSwitch("Auto Rebirth (Infinite)", function(state)
    _G.autoRebInf = state;
    task.spawn(function()
        while _G.autoRebInf do
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest");
            task.wait(0.1); 
        end; 
    end); 
end);
rebTab:AddSwitch("Auto Size 1", function(state)
    _G.autoSize1 = state;
    task.spawn(function()
        while _G.autoSize1 do
            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1);
            task.wait(0.01); 
        end; 
    end); 
end);
rebTab:AddSwitch("Auto Teleport to Muscle King", function(state)
    _G.tpKing = state;
    task.spawn(function()
        while _G.tpKing do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(-8646, 17, -5738); 
            end;
            task.wait(1); 
        end; 
    end); 
end);
rebTab:AddButton("Anti AFK", startAntiAFK);
local rockTab = window:AddTab("Rock");
rockTab:Show();
local rocks = {
    {
        name = "Tiny Island Rock",
        dur = 0
    },
    {
        name = "Starter Island Rock",
        dur = 100
    },
    {
        name = "Legend Beach Rock",
        dur = 5000
    },
    {
        name = "Frost Gym Rock",
        dur = 150000
    },
    {
        name = "Mythical Gym Rock",
        dur = 400000
    },
    {
        name = "Eternal Gym Rock",
        dur = 750000
    },
    {
        name = "Legend Gym Rock",
        dur = 1000000
    },
    {
        name = "Muscle King Gym Rock",
        dur = 5000000
    },
    {
        name = "Ancient Jungle Rock",
        dur = 10000000
    }
};
for _, r in ipairs(rocks) do
    rockTab:AddSwitch("Farm " .. r.name, function(state)
        _G["rock_" .. r.name] = state;
        task.spawn(function()
            while _G["rock_" .. r.name] do
                if player.Durability.Value >= r.dur then
                    for _, v in pairs(workspace.machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == r.dur then
                            local char = player.Character;
                            if char and char:FindFirstChild("LeftHand") and char:FindFirstChild("RightHand") then
                                pcall(function()
                                    firetouchinterest(v.Parent.Rock, char.RightHand, 0);
                                    firetouchinterest(v.Parent.Rock, char.RightHand, 1);
                                    firetouchinterest(v.Parent.Rock, char.LeftHand, 0);
                                    firetouchinterest(v.Parent.Rock, char.LeftHand, 1);
                                    local punch = player.Backpack:FindFirstChild("Punch");
                                    if punch then
                                        player.Character.Humanoid:EquipTool(punch); 
                                    end;
                                    player.muscleEvent:FireServer("punch", "rightHand");
                                    player.muscleEvent:FireServer("punch", "leftHand"); 
                                end); 
                            end; 
                        end; 
                    end; 
                end;
                task.wait(0.01); 
            end; 
        end); 
    end); 
end;
rockTab:AddButton("Anti AFK", startAntiAFK);
local calcTab = window:AddTab("Calculator");
calcTab:Show();
local damageFolder = calcTab:AddFolder("📊 PACK DAMAGE CALCULATOR");
damageFolder:AddLabel("Pack Damage Calculator");
local baseStrength = 0;
damageFolder:AddTextBox("Base Strength (ej: 1.27Qa, 500T)", function(text)
    local units = {
        QA = 1e15,
        T = 1e12,
        B = 1e9,
        M = 1e6,
        K = 1e3
    };
    text = text:upper();
    for u, m in pairs(units) do
        if text:find(u) then
            local num = tonumber(text:match("(%d+%.?%d*)"));
            if num then
                baseStrength = num * m;
                return; 
            end; 
        end; 
    end;
    baseStrength = tonumber(text:match("(%d+%.?%d*)")) or 0; 
end);
local damageResults = {};
for i = 1, 8 do
    damageResults[i] = damageFolder:AddLabel(string.format("%d pack(s): -", i)); 
end;
damageFolder:AddButton("Calculate Damage", function()
    if baseStrength <= 0 then
        for i = 1, 8 do
            damageResults[i].Text = string.format("%d pack(s): Enter a valid strength", i); 
        end;
        return; 
    end;
    local baseDmg = baseStrength * 0.10;
    local inc = 0.335;
    for pack = 1, 8 do
        damageResults[pack].Text = string.format("%d pack(s): %s", pack, formatNumber(baseDmg * ((1 + pack * inc)))); 
    end; 
end);
local durabilityFolder = calcTab:AddFolder("🛡️ PACK DURABILITY CALCULATOR");
durabilityFolder:AddLabel("Pack Durability Calculator");
local baseDura = 0;
durabilityFolder:AddTextBox("Base Durability (ej: 1.27Qa, 500T)", function(text)
    local units = {
        QA = 1e15,
        T = 1e12,
        B = 1e9,
        M = 1e6,
        K = 1e3
    };
    text = text:upper();
    for u, m in pairs(units) do
        if text:find(u) then
            local num = tonumber(text:match("(%d+%.?%d*)"));
            if num then
                baseDura = num * m;
                return; 
            end; 
        end; 
    end;
    baseDura = tonumber(text:match("(%d+%.?%d*)")) or 0; 
end);
local duraResults = {};
for i = 1, 8 do
    duraResults[i] = durabilityFolder:AddLabel(string.format("%d pack(s): -", i)); 
end;
durabilityFolder:AddButton("Calculate Durability", function()
    if baseDura <= 0 then
        for i = 1, 8 do
            duraResults[i].Text = string.format("%d pack(s): Enter a valid durability", i); 
        end;
        return; 
    end;
    local inc = 0.335;
    local bonus = 1.5;
    for pack = 1, 8 do
        duraResults[pack].Text = string.format("%d pack(s): %s", pack, formatNumber(baseDura * ((1 + pack * inc)) * bonus)); 
    end; 
end);
calcTab:AddButton("Anti AFK", startAntiAFK);
local giftTab = window:AddTab("Gifting");
giftTab:Show();
local eggCountLabel = giftTab:AddLabel("Protein Eggs: 0");
local shakeCountLabel = giftTab:AddLabel("Tropical Shakes: 0");
local function updateCounts()
    local eggs, shakes = 0, 0;
    if player:FindFirstChild("consumablesFolder") then
        for _, item in pairs(player.consumablesFolder:GetChildren()) do
            if item.Name == "Protein Egg" then
                eggs = eggs + 1;
            elseif item.Name == "Tropical Shake" then
                shakes = shakes + 1; 
            end; 
        end; 
    end;
    eggCountLabel.Text = "Protein Eggs: " .. eggs;
    shakeCountLabel.Text = "Tropical Shakes: " .. shakes; 
end;
task.spawn(function()
    while true do
        updateCounts();
        task.wait(5); 
    end; 
end);
local selectedEggTarget = nil;
local eggTargetDropdown = giftTab:AddDropdown("Gift Eggs To", function(displayName)
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.DisplayName == displayName then
            selectedEggTarget = p;
            break; 
        end; 
    end; 
end);
local eggAmount = 0;
giftTab:AddTextBox("Amount", function(val)
    eggAmount = tonumber(val) or 0; 
end);
giftTab:AddButton("Gift Protein Eggs", function()
    if selectedEggTarget and eggAmount > 0 then
        for i = 1, eggAmount do
            local egg = player:FindFirstChild("consumablesFolder") and player.consumablesFolder:FindFirstChild("Protein Egg");
            if egg then
                game:GetService("ReplicatedStorage").rEvents.giftRemote:InvokeServer("giftRequest", selectedEggTarget, egg);
                task.wait(0.2); 
            end; 
        end;
        notify("Gift", "Gifted " .. eggAmount .. " eggs to " .. selectedEggTarget.Name, 3); 
    end; 
end);
local selectedShakeTarget = nil;
local shakeTargetDropdown = giftTab:AddDropdown("Gift Shakes To", function(displayName)
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.DisplayName == displayName then
            selectedShakeTarget = p;
            break; 
        end; 
    end; 
end);
local shakeAmount = 0;
giftTab:AddTextBox("Amount", function(val)
    shakeAmount = tonumber(val) or 0; 
end);
giftTab:AddButton("Gift Tropical Shakes", function()
    if selectedShakeTarget and shakeAmount > 0 then
        for i = 1, shakeAmount do
            local shake = player:FindFirstChild("consumablesFolder") and player.consumablesFolder:FindFirstChild("Tropical Shake");
            if shake then
                game:GetService("ReplicatedStorage").rEvents.giftRemote:InvokeServer("giftRequest", selectedShakeTarget, shake);
                task.wait(0.2); 
            end; 
        end;
        notify("Gift", "Gifted " .. shakeAmount .. " shakes to " .. selectedShakeTarget.Name, 3); 
    end; 
end);
for _, p in pairs(game.Players:GetPlayers()) do
    if p ~= player then
        eggTargetDropdown:Add(p.DisplayName);
        shakeTargetDropdown:Add(p.DisplayName); 
    end; 
end;
game.Players.PlayerAdded:Connect(function(p)
    if p ~= player then
        eggTargetDropdown:Add(p.DisplayName);
        shakeTargetDropdown:Add(p.DisplayName); 
    end; 
end);
game.Players.PlayerRemoving:Connect(function(p)
    if p ~= player then
        eggTargetDropdown:Remove(p.DisplayName);
        shakeTargetDropdown:Remove(p.DisplayName); 
    end; 
end);
giftTab:AddButton("Anti AFK", startAntiAFK);
local tpTab = window:AddTab("Teleport");
tpTab:Show();
local teleports = {
    {
        "Spawn",
        CFrame.new(2, 8, 115)
    },
    {
        "Secret Area",
        CFrame.new(1947, 2, 6191)
    },
    {
        "Tiny Island",
        CFrame.new(-34, 7, 1903)
    },
    {
        "Frozen Island",
        CFrame.new(-2600.00244, 3.67686558, -403.884369)
    },
    {
        "Mythical Island",
        CFrame.new(2255, 7, 1071)
    },
    {
        "Inferno Island",
        CFrame.new(-6768, 7, -1287)
    },
    {
        "Legend Island",
        CFrame.new(4604, 991, -3887)
    },
    {
        "Muscle King Island",
        CFrame.new(-8646, 17, -5738)
    },
    {
        "Jungle Island",
        CFrame.new(-8659, 6, 2384)
    },
    {
        "Brawl Lava",
        CFrame.new(4471, 119, -8836)
    },
    {
        "Brawl Desert",
        CFrame.new(960, 17, -7398)
    },
    {
        "Brawl Regular",
        CFrame.new(-1849, 20, -6335)
    }
};
for _, tp in ipairs(teleports) do
    tpTab:AddButton(tp[1], function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = tp[2]; 
        end; 
    end); 
end;
tpTab:AddButton("Anti AFK", startAntiAFK);
local petBuyTab = window:AddTab("Pet Buy");
petBuyTab:Show();
local crystals = {
    "Blue Crystal",
    "Green Crystal",
    "Frost Crystal",
    "Mythical Crystal",
    "Inferno Crystal",
    "Legends Crystal",
    "Muscle Elite Crystal",
    "Galaxy Oracle Crystal",
    "Jungle Crystal"
};
local selectedCrystal = "Blue Crystal";
local crystalDropdownPB = petBuyTab:AddDropdown("Select Crystal", function(sel)
    selectedCrystal = sel; 
end);
for _, c in ipairs(crystals) do
    crystalDropdownPB:Add(c); 
end;
petBuyTab:AddSwitch("Auto Open Crystal", function(state)
    _G.autoCrystal = state;
    task.spawn(function()
        while _G.autoCrystal do
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", selectedCrystal);
            task.wait(0.5); 
        end; 
    end); 
end);
local petList = {
    "Blue Birdie",
    "Orange Hedgehog",
    "Red Kitty",
    "Blue Bunny",
    "Silver Dog",
    "Dark Vampy",
    "Dark Golem",
    "Green Butterfly",
    "Yellow Butterfly",
    "Crimson Falcon",
    "Purple Dragon",
    "Orange Pegasus",
    "Purple Falcon",
    "Red Dragon",
    "White Pegasus",
    "Frostwave Legends Penguin",
    "Phantom Genesis Dragon",
    "Eternal Strike Leviathan",
    "Blue Pheonix",
    "Blue Firecaster",
    "Golden Pheonix",
    "Red Firecaster",
    "Green Firecaster",
    "White Pheonix",
    "Dark Legends Manticore",
    "Ultimate Supernova Pegasus",
    "Lightning Strike Phantom",
    "Golden Viking",
    "Infernal Dragon",
    "Ultra Birdie",
    "Magic Butterfly",
    "Aether Spirit Bunny",
    "Cybernetic Showdown Dragon",
    "Darkstar Hunter",
    "Muscle Sensei",
    "Neon Guardian"
};
local selectedPet = "";
local petDropdownPB = petBuyTab:AddDropdown("Select Pet", function(sel)
    selectedPet = sel; 
end);
for _, pname in ipairs(petList) do
    petDropdownPB:Add(pname); 
end;
petBuyTab:AddSwitch("Auto Buy Pet", function(state)
    _G.autoBuyPet = state;
    task.spawn(function()
        while _G.autoBuyPet and selectedPet ~= "" do
            local pet = game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(selectedPet);
            if pet then
                game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(pet); 
            end;
            task.wait(0.1); 
        end; 
    end); 
end);
local auraList = {
    "Blue Aura",
    "Green Aura",
    "Purple Aura",
    "Red Aura",
    "Yellow Aura",
    "Ultra Inferno",
    "Azure Tundra",
    "Grand Supernova",
    "Muscle King",
    "Entropic Blast",
    "Eternal Megastrike"
};
local selectedAura = "";
local auraDropdownPB = petBuyTab:AddDropdown("Select Aura", function(sel)
    selectedAura = sel; 
end);
for _, aname in ipairs(auraList) do
    auraDropdownPB:Add(aname); 
end;
petBuyTab:AddSwitch("Auto Buy Aura", function(state)
    _G.autoBuyAura = state;
    task.spawn(function()
        while _G.autoBuyAura and selectedAura ~= "" do
            local aura = game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(selectedAura);
            if aura then
                game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(aura); 
            end;
            task.wait(0.1); 
        end; 
    end); 
end);
petBuyTab:AddButton("Anti AFK", startAntiAFK);
local creditsTab = window:AddTab("Credits");
creditsTab:AddLabel("KING PRIVATE SCRIPT");
creditsTab:AddLabel("CREATED BY KING");
creditsTab:AddLabel("KING ON TOP");
creditsTab:AddLabel("I HOPE YOU LIKE THE SCRIPT");
creditsTab:AddButton("Anti AFK", startAntiAFK);
window:Show();
notify("KING PRIVATE", "Script loaded successfully! Welcome " .. player.Name, 5);
