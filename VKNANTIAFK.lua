--[[
VKN ANTI AFK
Botón minimizar = "-"
Minimizar a botón redondo con imagen
ON/OFF funcional
]]

-- Limpiar instancia anterior
if game.CoreGui:FindFirstChild("VKN_ANTI_AFK") then
    game.CoreGui.VKN_ANTI_AFK:Destroy()
end

-- Variables globales
getgenv().VKNAntiAfk = true
getgenv().VKNMinimized = false

-- Esperar a que cargue
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Servicios
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- ========== FUNCIÓN ANTI-AFK ==========
local afkConnection
local function startAntiAfk()
    if afkConnection then
        afkConnection:Disconnect()
    end
    afkConnection = LocalPlayer.Idled:Connect(function()
        if getgenv().VKNAntiAfk then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end)
end

local function stopAntiAfk()
    if afkConnection then
        afkConnection:Disconnect()
        afkConnection = nil
    end
end

startAntiAfk()

-- ========== CREAR GUI PRINCIPAL ==========
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VKN_ANTI_AFK"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

-- Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 280, 0, 210)
mainFrame.Position = UDim2.new(0.5, -140, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true
mainFrame.Parent = screenGui

-- Bordes redondeados
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = mainFrame

-- Degradado rojo/negro
local gradient = Instance.new("UIGradient")
gradient.Rotation = 45
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))
})
gradient.Parent = mainFrame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 35)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔴 VKN ANTI AFK 🔴"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- ========== BOTÓN MINIMIZAR (CON TEXTO "-") ==========
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 28)
minimizeBtn.Position = UDim2.new(1, -62, 0, 4)
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextSize = 22
minimizeBtn.TextScaled = true
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = mainFrame

-- Botón cerrar (X)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 28)
closeBtn.Position = UDim2.new(1, -32, 0, 4)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

closeBtn.MouseButton1Click:Connect(function()
    getgenv().VKNAntiAfk = false
    stopAntiAfk()
    screenGui:Destroy()
end)

-- Línea separadora
local line = Instance.new("Frame")
line.Size = UDim2.new(0.94, 0, 0, 2)
line.Position = UDim2.new(0.03, 0, 0.19, 0)
line.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
line.Parent = mainFrame

-- ========== IMAGEN GRANDE (CON TU ID) ==========
local bigImage = Instance.new("ImageButton")
bigImage.Size = UDim2.new(0, 55, 0, 55)
bigImage.Position = UDim2.new(0.05, 0, 0.27, 0)
bigImage.BackgroundTransparency = 1
bigImage.Image = "rbxassetid://72470414601846"
bigImage.Parent = mainFrame

-- ========== TEXTOS ==========
-- Ping
local pingText = Instance.new("TextLabel")
pingText.Size = UDim2.new(0, 50, 0, 22)
pingText.Position = UDim2.new(0.32, 0, 0.32, 0)
pingText.BackgroundTransparency = 1
pingText.Text = "Ping:"
pingText.TextColor3 = Color3.fromRGB(200, 200, 200)
pingText.TextSize = 13
pingText.Font = Enum.Font.Gotham
pingText.TextXAlignment = Enum.TextXAlignment.Right
pingText.Parent = mainFrame

local pingValue = Instance.new("TextLabel")
pingValue.Size = UDim2.new(0, 60, 0, 22)
pingValue.Position = UDim2.new(0.52, 0, 0.32, 0)
pingValue.BackgroundTransparency = 1
pingValue.Text = "0 ms"
pingValue.TextColor3 = Color3.fromRGB(255, 255, 255)
pingValue.TextSize = 13
pingValue.Font = Enum.Font.Gotham
pingValue.TextXAlignment = Enum.TextXAlignment.Left
pingValue.Parent = mainFrame

-- FPS
local fpsText = Instance.new("TextLabel")
fpsText.Size = UDim2.new(0, 45, 0, 22)
fpsText.Position = UDim2.new(0.32, 0, 0.48, 0)
fpsText.BackgroundTransparency = 1
fpsText.Text = "FPS:"
fpsText.TextColor3 = Color3.fromRGB(200, 200, 200)
fpsText.TextSize = 13
fpsText.Font = Enum.Font.Gotham
fpsText.TextXAlignment = Enum.TextXAlignment.Right
fpsText.Parent = mainFrame

local fpsValue = Instance.new("TextLabel")
fpsValue.Size = UDim2.new(0, 60, 0, 22)
fpsValue.Position = UDim2.new(0.52, 0, 0.48, 0)
fpsValue.BackgroundTransparency = 1
fpsValue.Text = "60"
fpsValue.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsValue.TextSize = 13
fpsValue.Font = Enum.Font.Gotham
fpsValue.TextXAlignment = Enum.TextXAlignment.Left
fpsValue.Parent = mainFrame

-- Tiempo
local timeText = Instance.new("TextLabel")
timeText.Size = UDim2.new(0, 55, 0, 22)
timeText.Position = UDim2.new(0.32, 0, 0.64, 0)
timeText.BackgroundTransparency = 1
timeText.Text = "Tiempo:"
timeText.TextColor3 = Color3.fromRGB(200, 200, 200)
timeText.TextSize = 13
timeText.Font = Enum.Font.Gotham
timeText.TextXAlignment = Enum.TextXAlignment.Right
timeText.Parent = mainFrame

local timeValue = Instance.new("TextLabel")
timeValue.Size = UDim2.new(0, 70, 0, 22)
timeValue.Position = UDim2.new(0.52, 0, 0.64, 0)
timeValue.BackgroundTransparency = 1
timeValue.Text = "0:00:00"
timeValue.TextColor3 = Color3.fromRGB(255, 255, 255)
timeValue.TextSize = 13
timeValue.Font = Enum.Font.Gotham
timeValue.TextXAlignment = Enum.TextXAlignment.Left
timeValue.Parent = mainFrame

-- ========== BOTÓN ON/OFF ==========
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 110, 0, 32)
toggleBtn.Position = UDim2.new(0.55, 0, 0.82, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
toggleBtn.Text = "ON ✅"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 14
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = mainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleBtn

-- Estado label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 100, 0, 32)
statusLabel.Position = UDim2.new(0.05, 0, 0.82, 0)
statusLabel.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
statusLabel.BackgroundTransparency = 0.3
statusLabel.Text = "ACTIVADO"
statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
statusLabel.TextSize = 12
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Parent = mainFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 6)
statusCorner.Parent = statusLabel

-- ========== BOTÓN MINIMIZADO (REDONDO CON IMAGEN) ==========
local miniButton = Instance.new("ImageButton")
miniButton.Name = "VKN_MINI_BUTTON"
miniButton.Size = UDim2.new(0, 55, 0, 55)
miniButton.Position = UDim2.new(0.8, 0, 0.7, 0)
miniButton.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
miniButton.BackgroundTransparency = 0.1
miniButton.Image = "rbxassetid://72470414601846"
miniButton.Visible = false
miniButton.Active = true
miniButton.Draggable = true
miniButton.Parent = screenGui

-- Borde redondo
local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(1, 0)
miniCorner.Parent = miniButton

-- Borde rojo
local miniBorder = Instance.new("Frame")
miniBorder.Size = UDim2.new(1, 0, 1, 0)
miniBorder.BackgroundTransparency = 1
miniBorder.BorderSizePixel = 3
miniBorder.BorderColor3 = Color3.fromRGB(180, 0, 0)
miniBorder.Parent = miniButton

local miniBorderCorner = Instance.new("UICorner")
miniBorderCorner.CornerRadius = UDim.new(1, 0)
miniBorderCorner.Parent = miniBorder

-- Sombra
local miniShadow = Instance.new("UIShadow")
miniShadow.Parent = miniButton

-- ========== FUNCIONES MINIMIZAR/MAXIMIZAR ==========
local function minimize()
    getgenv().VKNMinimized = true
    mainFrame.Visible = false
    miniButton.Visible = true
    
    -- Animación
    miniButton.ImageTransparency = 1
    TweenService:Create(miniButton, TweenInfo.new(0.2), {ImageTransparency = 0}):Play()
    TweenService:Create(miniButton, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
end

local function maximize()
    getgenv().VKNMinimized = false
    miniButton.Visible = false
    mainFrame.Visible = true
    mainFrame.BackgroundTransparency = 0.5
    TweenService:Create(mainFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
end

-- Evento minimizar (botón "-")
minimizeBtn.MouseButton1Click:Connect(function()
    minimize()
end)

-- Evento maximizar (click en botón redondo)
miniButton.MouseButton1Click:Connect(function()
    maximize()
end)

-- ========== ON/OFF TOGGLE ==========
local toggleState = true

toggleBtn.MouseButton1Click:Connect(function()
    toggleState = not toggleState
    if toggleState then
        toggleBtn.Text = "ON ✅"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        statusLabel.Text = "ACTIVADO"
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        statusLabel.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        getgenv().VKNAntiAfk = true
        startAntiAfk()
    else
        toggleBtn.Text = "OFF ❌"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        statusLabel.Text = "DESACTIVADO"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        statusLabel.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        getgenv().VKNAntiAfk = false
        stopAntiAfk()
    end
end)

-- ========== FPS COUNTER ==========
local RunService = game:GetService("RunService")
local frameCount = 0
local lastTime = tick()

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        fpsValue.Text = tostring(frameCount)
        frameCount = 0
        lastTime = currentTime
    end
end)

-- ========== PING COUNTER ==========
task.spawn(function()
    while screenGui and screenGui.Parent do
        task.wait(1)
        local stats = game:GetService("Stats"):FindFirstChild("PerformanceStats")
        if stats and stats.Ping then
            local ping = math.floor(stats.Ping:GetValue())
            pingValue.Text = tostring(ping) .. " ms"
            
            if ping < 60 then
                pingValue.TextColor3 = Color3.fromRGB(0, 255, 0)
            elseif ping < 120 then
                pingValue.TextColor3 = Color3.fromRGB(255, 200, 0)
            else
                pingValue.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

-- ========== TIMER ==========
local seconds = 0
local minutes = 0
local hours = 0

task.spawn(function()
    while screenGui and screenGui.Parent do
        task.wait(1)
        if getgenv().VKNAntiAfk then
            seconds = seconds + 1
            if seconds >= 60 then
                seconds = 0
                minutes = minutes + 1
            end
            if minutes >= 60 then
                minutes = 0
                hours = hours + 1
            end
            timeValue.Text = string.format("%d:%02d:%02d", hours, minutes, seconds)
        end
    end
end)

print("✅ VKN ANTI AFK CARGADO")
print("📷 Imagen ID: 72470414601846")
print("➖ Botón minimizar: '-'")
