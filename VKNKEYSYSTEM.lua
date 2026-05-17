--[[
    VKN KEYSYSTEM - HARDCORE EDITION
    Key: VKNONTOP
    Discord: https://discord.gg/YV2uZTHxPh
]]
-- ========================================
-- SERVICES & INITIALIZATION
-- ========================================

local Services = {
    Players = game:GetService("Players"),
    TweenService = game:GetService("TweenService"),
    UserInputService = game:GetService("UserInputService"),
    RunService = game:GetService("RunService")
}

local Player = Services.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ========================================
-- CONFIGURATION
-- ========================================

local Config = {
    MaxKeyLength = 50,
    AnimationSpeed = 0.3, -- Más rápido
    ParticleCount = 80, -- Más partículas
    ParticleSpeed = 75,
    ValidKey = "VKNONTOP" -- LA KEY CORRECTA
}

-- ========================================
-- COLOR SCHEME - HARDCORE EDITION
-- ========================================

local Colors = {
    Background = Color3.fromRGB(8, 8, 12), -- Más oscuro
    Surface = Color3.fromRGB(15, 15, 22),
    Primary = Color3.fromRGB(180, 30, 50), -- Rojo intenso
    Secondary = Color3.fromRGB(25, 25, 35),
    Border = Color3.fromRGB(220, 40, 60), -- Borde rojo
    TextPrimary = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(180, 180, 200),
    Success = Color3.fromRGB(0, 255, 100), -- Verde neón
    Error = Color3.fromRGB(255, 30, 30), -- Rojo brillante
    Warning = Color3.fromRGB(255, 100, 0),
    Discord = Color3.fromRGB(88, 101, 242),
    GetKey = Color3.fromRGB(255, 50, 80), -- Rojo neón
    HoverPrimary = Color3.fromRGB(220, 40, 70),
    HoverDiscord = Color3.fromRGB(114, 127, 255),
    HoverGetKey = Color3.fromRGB(255, 70, 100),
    NeonRed = Color3.fromRGB(255, 0, 50),
    NeonPulse = Color3.fromRGB(255, 20, 70)
}

-- ========================================
-- STATE MANAGEMENT
-- ========================================

local State = {
    IsLoading = false,
    Particles = {},
    Animations = {},
    IsDestroyed = false,
    MousePosition = {X = 0, Y = 0},
    FocusStates = {
        InputFocused = false,
        ButtonHovered = {},
        AnimationsActive = true
    }
}

local UI = {}

-- ========================================
-- UI CREATION FUNCTIONS
-- ========================================

local function CreateMainGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "VKNKeySystem"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    screenGui.Parent = PlayerGui
    
    UI.ScreenGui = screenGui
    return screenGui
end

local function CreateBackdrop(parent)
    local backdrop = Instance.new("Frame")
    backdrop.Name = "Backdrop"
    backdrop.Size = UDim2.new(1, 0, 1, 0)
    backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    backdrop.BackgroundTransparency = 0.15
    backdrop.BorderSizePixel = 0
    backdrop.ZIndex = 100
    backdrop.Parent = parent
    
    UI.Backdrop = backdrop
    return backdrop
end

local function CreateContainer(parent)
    local container = Instance.new("Frame")
    container.Name = "MainContainer"
    container.Size = UDim2.new(0, 450, 0, 620)
    container.Position = UDim2.new(0.5, -225, 0.5, -310)
    container.BackgroundColor3 = Colors.Background
    container.BorderSizePixel = 0
    container.ZIndex = 110
    container.Selectable = false
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = container
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.NeonRed
    stroke.Thickness = 2
    stroke.Transparency = 0.2
    stroke.Parent = container
    
    UI.Container = container
    return container
end

local function CreateAnimatedBorder(parent)
    local border = Instance.new("Frame")
    border.Name = "AnimatedBorder"
    border.Size = UDim2.new(1, 8, 1, 8)
    border.Position = UDim2.new(0, -4, 0, -4)
    border.BackgroundTransparency = 1
    border.ZIndex = 109
    border.Selectable = false
    border.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = border
    
    local stroke = Instance.new("UIStroke")  
    stroke.Color = Colors.NeonRed
    stroke.Thickness = 3
    stroke.Transparency = 0.1
    stroke.Parent = border
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Colors.NeonRed),
        ColorSequenceKeypoint.new(0.3, Colors.NeonPulse),
        ColorSequenceKeypoint.new(0.7, Colors.NeonRed),
        ColorSequenceKeypoint.new(1, Colors.NeonPulse)
    }
    gradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(0.2, 0.05),
        NumberSequenceKeypoint.new(0.8, 0.05),
        NumberSequenceKeypoint.new(1, 0.7)
    }
    gradient.Parent = stroke
    
    UI.AnimatedBorder = {Frame = border, Gradient = gradient, Stroke = stroke}
    return border
end

-- ========================================
-- HEADER SECTION - HARDCORE
-- ========================================

local function CreateHeader(parent)
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 110)
    header.BackgroundTransparency = 1
    header.ZIndex = 11
    header.Selectable = false
    header.Parent = parent
    
    local titleFrame = Instance.new("Frame")
    titleFrame.Size = UDim2.new(1, 0, 0, 60)
    titleFrame.Position = UDim2.new(0, 0, 0, 25)
    titleFrame.BackgroundTransparency = 1
    titleFrame.ZIndex = 12
    titleFrame.Parent = header
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = "VKN KEYSYSTEM"
    title.TextColor3 = Colors.TextPrimary
    title.TextSize = 34
    title.Font = Enum.Font.GothamBlack
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.TextScaled = true
    title.ZIndex = 13
    title.Parent = titleFrame
    
    -- Efecto de sombra para el título
    local titleShadow = Instance.new("TextLabel")
    titleShadow.Size = UDim2.new(1, 0, 1, 0)
    titleShadow.Position = UDim2.new(0, 2, 0, 2)
    titleShadow.BackgroundTransparency = 1
    titleShadow.Text = "VKN KEYSYSTEM"
    titleShadow.TextColor3 = Colors.NeonRed
    titleShadow.TextSize = 34
    titleShadow.Font = Enum.Font.GothamBlack
    titleShadow.TextXAlignment = Enum.TextXAlignment.Center
    titleShadow.TextScaled = true
    titleShadow.ZIndex = 12
    titleShadow.Parent = titleFrame
    
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 25)
    subtitle.Position = UDim2.new(0, 0, 0, 85)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "ENTER ACCESS KEY TO CONTINUE"
    subtitle.TextColor3 = Colors.TextSecondary
    subtitle.TextSize = 12
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextXAlignment = Enum.TextXAlignment.Center
    subtitle.ZIndex = 13
    subtitle.Parent = header
    
    UI.Header = {Container = header, Title = title, TitleShadow = titleShadow}
    return header
end

-- ========================================
-- CONTENT SECTION
-- ========================================

local function CreateContent(parent)
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -64, 0, 440)
    content.Position = UDim2.new(0, 32, 0, 130)
    content.BackgroundTransparency = 1
    content.ZIndex = 11
    content.Selectable = false
    content.Parent = parent
    
    UI.Content = content
    return content
end

-- ========================================
-- INPUT SECTION
-- ========================================

local function CreateInputSection(parent)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, 0, 0, 100)
    section.Position = UDim2.new(0, 0, 0, 60)
    section.BackgroundTransparency = 1
    section.ZIndex = 12
    section.Selectable = false
    section.Parent = parent
    
    local inputContainer = Instance.new("Frame")
    inputContainer.Size = UDim2.new(1, 0, 0, 52)
    inputContainer.BackgroundColor3 = Colors.Surface
    inputContainer.BorderSizePixel = 0
    inputContainer.ZIndex = 13
    inputContainer.Selectable = false
    inputContainer.Parent = section
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = inputContainer
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.Border
    stroke.Thickness = 1.5
    stroke.Transparency = 0.3
    stroke.Parent = inputContainer
    
    local inputGlow = Instance.new("Frame")
    inputGlow.Size = UDim2.new(1, 10, 1, 10)
    inputGlow.Position = UDim2.new(0, -5, 0, -5)
    inputGlow.BackgroundTransparency = 1
    inputGlow.ZIndex = inputContainer.ZIndex - 1
    inputGlow.Visible = false
    inputGlow.Selectable = false
    inputGlow.Parent = inputContainer
    
    local glowCorner = Instance.new("UICorner")
    glowCorner.CornerRadius = UDim.new(0, 15)
    glowCorner.Parent = inputGlow
    
    local glowStroke = Instance.new("UIStroke")
    glowStroke.Color = Colors.NeonRed
    glowStroke.Thickness = 2
    glowStroke.Transparency = 0.3
    glowStroke.Parent = inputGlow
    
    local glowGradient = Instance.new("UIGradient")
    glowGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Colors.NeonRed),
        ColorSequenceKeypoint.new(0.5, Colors.NeonPulse),
        ColorSequenceKeypoint.new(1, Colors.NeonRed)
    }
    glowGradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.2, 0.05),
        NumberSequenceKeypoint.new(0.8, 0.05),
        NumberSequenceKeypoint.new(1, 0.8)
    }
    glowGradient.Parent = glowStroke
    
    local textInput = Instance.new("TextBox")
    textInput.Size = UDim2.new(1, -24, 1, 0)
    textInput.Position = UDim2.new(0, 12, 0, 0)
    textInput.BackgroundTransparency = 1
    textInput.Text = ""
    textInput.PlaceholderText = "ENTER KEY HERE"
    textInput.TextColor3 = Colors.TextPrimary
    textInput.PlaceholderColor3 = Colors.TextSecondary
    textInput.TextSize = 16
    textInput.Font = Enum.Font.GothamBold
    textInput.TextXAlignment = Enum.TextXAlignment.Left
    textInput.ClearTextOnFocus = false
    textInput.ZIndex = 14
    textInput.Selectable = true
    textInput.Parent = inputContainer
    
    local charCounter = Instance.new("TextLabel")
    charCounter.Size = UDim2.new(0, 80, 0, 20)
    charCounter.Position = UDim2.new(1, -85, 0, 60)
    charCounter.BackgroundTransparency = 1
    charCounter.Text = "0/" .. Config.MaxKeyLength
    charCounter.TextColor3 = Colors.TextSecondary
    charCounter.TextSize = 11
    charCounter.Font = Enum.Font.Gotham
    charCounter.TextXAlignment = Enum.TextXAlignment.Right
    charCounter.ZIndex = 13
    charCounter.Parent = section
    
    UI.Input = {
        Container = inputContainer,
        TextBox = textInput,
        Counter = charCounter,
        Stroke = stroke,
        Glow = {Frame = inputGlow, Stroke = glowStroke, Gradient = glowGradient}
    }
    
    return section
end

-- ========================================
-- BUTTON SECTION - HARDCORE
-- ========================================

local function CreateButtons(parent)
    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(1, 0, 0, 52)
    submitButton.Position = UDim2.new(0, 0, 0, 180)
    submitButton.BackgroundColor3 = Colors.Primary
    submitButton.BorderSizePixel = 0
    submitButton.Text = "VERIFY ACCESS KEY"
    submitButton.TextColor3 = Colors.TextPrimary
    submitButton.TextSize = 16
    submitButton.Font = Enum.Font.GothamBold
    submitButton.AutoButtonColor = false
    submitButton.ZIndex = 13
    submitButton.Selectable = true
    submitButton.Parent = parent
    
    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 10)
    submitCorner.Parent = submitButton
    
    local loadingContainer = Instance.new("Frame")
    loadingContainer.Size = UDim2.new(0, 24, 0, 24)
    loadingContainer.Position = UDim2.new(0.5, -12, 0, 14)
    loadingContainer.BackgroundTransparency = 1
    loadingContainer.Visible = false
    loadingContainer.ZIndex = 14
    loadingContainer.Selectable = false
    loadingContainer.Parent = submitButton
    
    local spinner = Instance.new("Frame")
    spinner.Size = UDim2.new(1, 0, 1, 0)
    spinner.BackgroundColor3 = Colors.TextPrimary
    spinner.BorderSizePixel = 0
    spinner.ZIndex = 15
    spinner.Selectable = false
    spinner.Parent = loadingContainer
    
    local spinnerCorner = Instance.new("UICorner")
    spinnerCorner.CornerRadius = UDim.new(1, 0)
    spinnerCorner.Parent = spinner
    
    local spinnerGradient = Instance.new("UIGradient")
    spinnerGradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.8, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    }
    spinnerGradient.Parent = spinner
    
    local buttonsContainer = Instance.new("Frame")
    buttonsContainer.Size = UDim2.new(1, 0, 0, 52)
    buttonsContainer.Position = UDim2.new(0, 0, 0, 245)
    buttonsContainer.BackgroundTransparency = 1
    buttonsContainer.ZIndex = 12
    buttonsContainer.Selectable = false
    buttonsContainer.Parent = parent
    
    local discordButton = Instance.new("TextButton")
    discordButton.Size = UDim2.new(1, 0, 1, 0)
    discordButton.BackgroundColor3 = Colors.Discord
    discordButton.BorderSizePixel = 0
    discordButton.Text = "JOIN DISCORD"
    discordButton.TextColor3 = Colors.TextPrimary
    discordButton.TextSize = 15
    discordButton.Font = Enum.Font.GothamBold
    discordButton.AutoButtonColor = false
    discordButton.ZIndex = 13
    discordButton.Selectable = true
    discordButton.Parent = buttonsContainer
    
    local discordCorner = Instance.new("UICorner")
    discordCorner.CornerRadius = UDim.new(0, 10)
    discordCorner.Parent = discordButton
    
    UI.Buttons = {
        Submit = submitButton,
        Discord = discordButton,
        Loading = {Container = loadingContainer, Spinner = spinner}
    }
    
    return {submitButton, discordButton}
end

-- ========================================
-- STATUS SECTION
-- ========================================

local function CreateStatus(parent)
    local statusContainer = Instance.new("Frame")
    statusContainer.Size = UDim2.new(1, 0, 0, 70)
    statusContainer.Position = UDim2.new(0, 0, 0, 315)
    statusContainer.BackgroundTransparency = 1
    statusContainer.ZIndex = 12
    statusContainer.Selectable = false
    statusContainer.Parent = parent
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 1, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.TextColor3 = Colors.Error
    statusLabel.TextSize = 13
    statusLabel.Font = Enum.Font.GothamBold
    statusLabel.TextXAlignment = Enum.TextXAlignment.Center
    statusLabel.TextWrapped = true
    statusLabel.ZIndex = 13
    statusLabel.Parent = statusContainer
    
    UI.Status = statusLabel
    return statusLabel
end

-- ========================================
-- PARTICLE SYSTEM (Más agresivo)
-- ========================================

local function CreateParticleContainer(parent)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.ZIndex = 105
    container.Selectable = false
    container.Parent = parent
    
    UI.ParticleContainer = container
    return container
end

local function CreateParticle()
    if not UI.ParticleContainer or not UI.ParticleContainer.Parent or State.IsDestroyed then
        return nil
    end
    
    local size = math.random(4, 20)
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random() * 1.4 - 0.2, 0, 1.2, 0)
    particle.BackgroundColor3 = Colors.NeonRed
    particle.BackgroundTransparency = math.random(60, 85) / 100
    particle.BorderSizePixel = 0
    particle.ZIndex = 106
    particle.Selectable = false
    particle.Parent = UI.ParticleContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    
    local particleData = {
        frame = particle,
        vx = (math.random() - 0.5) * 0.008,
        vy = -math.random(30, 70) / 10000,
        created = tick(),
        rotation = 0,
        rotationSpeed = (math.random() - 0.5) * 3,
        originalTransparency = particle.BackgroundTransparency,
        lifetime = math.random(40, 80),
        originalSize = size
    }
    
    table.insert(State.Particles, particleData)
    return particle
end

local function UpdateParticles()
    if State.IsDestroyed or not UI.ParticleContainer then return end
    
    for i = #State.Particles, 1, -1 do
        local p = State.Particles[i]
        
        if not p or not p.frame or not p.frame.Parent then
            table.remove(State.Particles, i)
        else
            local currentPos = p.frame.Position
            local age = tick() - p.created
            
            if currentPos.Y.Scale < -0.3 or age > p.lifetime then
                p.frame:Destroy()
                table.remove(State.Particles, i)
            else
                local newX = currentPos.X.Scale + p.vx
                local newY = currentPos.Y.Scale + p.vy
                
                if newX <= -0.2 then newX = 1.2
                elseif newX >= 1.2 then newX = -0.2 end
                
                p.rotation = p.rotation + p.rotationSpeed
                p.frame.Rotation = p.rotation
                
                local fadeOut = math.min(1, age / p.lifetime)
                p.frame.BackgroundTransparency = p.originalTransparency + (fadeOut * 0.5)
                
                p.frame.Position = UDim2.new(newX, 0, newY, 0)
            end
        end
    end
end

-- ========================================
-- VISUAL EFFECTS
-- ========================================

local function CreateButtonGlow(button, hoverColor, originalColor)
    local glowBorder = Instance.new("Frame")
    glowBorder.Size = UDim2.new(1, 10, 1, 10)
    glowBorder.Position = UDim2.new(0, -5, 0, -5)
    glowBorder.BackgroundTransparency = 1
    glowBorder.ZIndex = button.ZIndex - 1
    glowBorder.Visible = false
    glowBorder.Selectable = false
    glowBorder.Parent = button
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = glowBorder
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.NeonRed
    stroke.Thickness = 2
    stroke.Transparency = 0.3
    stroke.Parent = glowBorder
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Colors.NeonRed),
        ColorSequenceKeypoint.new(0.5, Colors.NeonPulse),
        ColorSequenceKeypoint.new(1, Colors.NeonRed)
    }
    gradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.2, 0.1),
        NumberSequenceKeypoint.new(0.8, 0.1),
        NumberSequenceKeypoint.new(1, 0.8)
    }
    gradient.Parent = stroke
    
    local currentTween = nil
    local buttonId = tostring(button)
    
    button.MouseEnter:Connect(function()
        State.FocusStates.ButtonHovered[buttonId] = true
        glowBorder.Visible = true
        
        Services.TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad), 
            {BackgroundColor3 = hoverColor}):Play()
        
        if currentTween then currentTween:Cancel() end
        currentTween = Services.TweenService:Create(gradient, 
            TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), 
            {Rotation = 360})
        currentTween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        State.FocusStates.ButtonHovered[buttonId] = false
        
        Services.TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad), 
            {BackgroundColor3 = originalColor}):Play()
        
        if currentTween then
            currentTween:Cancel()
            gradient.Rotation = 0
        end
        
        task.spawn(function()
            task.wait(0.3)
            if glowBorder and glowBorder.Parent then
                glowBorder.Visible = false
            end
        end)
    end)
    
    return {glowBorder, stroke, gradient}
end

-- ========================================
-- STATUS & FEEDBACK FUNCTIONS
-- ========================================

local function ShowStatus(message, isError, isSuccess)
    if not UI.Status then return end
    
    UI.Status.Text = message
    if isSuccess then
        UI.Status.TextColor3 = Colors.Success
    elseif isError then
        UI.Status.TextColor3 = Colors.Error
    else
        UI.Status.TextColor3 = Colors.Warning
    end
    
    UI.Status.TextTransparency = 1
    Services.TweenService:Create(UI.Status, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {TextTransparency = 0}):Play()
end

local function ClearStatus()
    if UI.Status then
        Services.TweenService:Create(UI.Status, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
            {TextTransparency = 1}):Play()
    end
end

local function SetLoading(isLoading)
    State.IsLoading = isLoading
    if not UI.Buttons then return end
    
    UI.Buttons.Loading.Container.Visible = isLoading
    UI.Buttons.Submit.Text = isLoading and "" or "VERIFY ACCESS KEY"
    
    if isLoading then
        local tween = Services.TweenService:Create(UI.Buttons.Loading.Spinner, 
            TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), 
            {Rotation = 360})
        tween:Play()
        State.Animations.SpinTween = tween
    else
        if State.Animations.SpinTween then
            State.Animations.SpinTween:Cancel()
            UI.Buttons.Loading.Spinner.Rotation = 0
        end
    end
end

-- ========================================
-- INPUT HANDLING
-- ========================================

local function UpdateCharCounter()
    if not UI.Input then return end
    
    local currentLength = string.len(UI.Input.TextBox.Text)
    UI.Input.Counter.Text = currentLength .. "/" .. Config.MaxKeyLength
    
    if currentLength >= Config.MaxKeyLength then
        UI.Input.Counter.TextColor3 = Colors.Error
    elseif currentLength >= Config.MaxKeyLength * 0.8 then
        UI.Input.Counter.TextColor3 = Colors.Warning
    else
        UI.Input.Counter.TextColor3 = Colors.TextSecondary
    end
end

-- ========================================
-- KEY VALIDATION (REAL)
-- ========================================

local function ValidateKey(key)
    return key == Config.ValidKey
end

-- ========================================
-- EVENT CONNECTIONS
-- ========================================

local function ConnectEvents()
    Services.UserInputService.InputChanged:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            State.MousePosition.X = input.Position.X
            State.MousePosition.Y = input.Position.Y
        end
    end)
    
    UI.Input.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        local currentText = UI.Input.TextBox.Text
        
        if string.len(currentText) > Config.MaxKeyLength then
            UI.Input.TextBox.Text = string.sub(currentText, 1, Config.MaxKeyLength)
            ShowStatus("MAXIMUM CHARACTER LIMIT REACHED (" .. Config.MaxKeyLength .. ")", true)
        end
        
        UpdateCharCounter()
        ClearStatus()
    end)
    
    local inputGlowTween = nil
    
    UI.Input.TextBox.Focused:Connect(function()
        State.FocusStates.InputFocused = true
        UI.Input.Glow.Frame.Visible = true
        
        Services.TweenService:Create(UI.Input.Stroke, 
            TweenInfo.new(0.15, Enum.EasingStyle.Quad), 
            {Color = Colors.NeonRed, Transparency = 0.05}):Play()
        
        if inputGlowTween then inputGlowTween:Cancel() end
        inputGlowTween = Services.TweenService:Create(UI.Input.Glow.Gradient, 
            TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), 
            {Rotation = 360})
        inputGlowTween:Play()
        State.Animations.InputGlowTween = inputGlowTween
        ClearStatus()
    end)
    
    UI.Input.TextBox.FocusLost:Connect(function()
        State.FocusStates.InputFocused = false
        
        Services.TweenService:Create(UI.Input.Stroke, 
            TweenInfo.new(0.15, Enum.EasingStyle.Quad), 
            {Color = Colors.Border, Transparency = 0.3}):Play()
        
        if inputGlowTween then
            inputGlowTween:Cancel()
            UI.Input.Glow.Gradient.Rotation = 0
            State.Animations.InputGlowTween = nil
        end
        
        task.spawn(function()
            task.wait(0.3)
            if UI.Input.Glow.Frame and UI.Input.Glow.Frame.Parent then
                UI.Input.Glow.Frame.Visible = false
            end
        end)
    end)
    
    Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or State.IsDestroyed then return end
        
        if input.KeyCode == Enum.KeyCode.Return and UI.Input.TextBox:IsFocused() then
            local key = UI.Input.TextBox.Text
            if key == "" then
                ShowStatus("PLEASE ENTER AN ACCESS KEY", true)
                UI.Input.TextBox:CaptureFocus()
                return
            end
            
            SetLoading(true)
            ShowStatus("VALIDATING KEY...", false, false)
            
            task.spawn(function()
                task.wait(1.5)
                
                if ValidateKey(key) then
                    SetLoading(false)
                    ShowStatus("ACCESS GRANTED! WELCOME TO VKN", false, true)
                    
                    -- EFECTO DE ÉXITO
                    for i = 1, 20 do
                        CreateParticle()
                    end
                    
                    task.wait(1)
                    UI.ScreenGui:Destroy() -- Cierra el sistema de keys
                    -- Aquí puedes ejecutar tu script principal
                    -- loadstring(game:HttpGet("URL_DE_TU_SCRIPT"))()
                else
                    SetLoading(false)
                    ShowStatus("INVALID ACCESS KEY! TRY AGAIN", true)
                    UI.Input.TextBox.Text = ""
                    UI.Input.TextBox:CaptureFocus()
                    
                    -- EFECTO DE ERROR (sacudida)
                    local originalPos = UI.Container.Position
                    for i = 1, 3 do
                        UI.Container.Position = UDim2.new(0.5, -225 + math.random(-5, 5), 0.5, -310 + math.random(-3, 3))
                        task.wait(0.03)
                    end
                    UI.Container.Position = originalPos
                end
            end)
        end
    end)
    
    UI.Buttons.Submit.MouseButton1Click:Connect(function()
        if State.IsLoading then return end
        
        local key = UI.Input.TextBox.Text
        if key == "" then
            ShowStatus("PLEASE ENTER AN ACCESS KEY", true)
            UI.Input.TextBox:CaptureFocus()
            return
        end
        
        SetLoading(true)
        ShowStatus("VALIDATING KEY...", false, false)
        
        task.spawn(function()
            task.wait(1.5)
            
            if ValidateKey(key) then
                SetLoading(false)
                ShowStatus("ACCESS GRANTED! WELCOME TO VKN", false, true)
                
                for i = 1, 20 do
                    CreateParticle()
                end
                
                task.wait(1)
                UI.ScreenGui:Destroy()
                -- loadstring(game:HttpGet("URL_DE_TU_SCRIPT"))()
            else
                SetLoading(false)
                ShowStatus("INVALID ACCESS KEY! TRY AGAIN", true)
                UI.Input.TextBox.Text = ""
                UI.Input.TextBox:CaptureFocus()
                
                local originalPos = UI.Container.Position
                for i = 1, 3 do
                    UI.Container.Position = UDim2.new(0.5, -225 + math.random(-5, 5), 0.5, -310 + math.random(-3, 3))
                    task.wait(0.03)
                end
                UI.Container.Position = originalPos
            end
        end)
    end)
    
    UI.Buttons.Discord.MouseButton1Click:Connect(function()
        ShowStatus("OPENING DISCORD INVITE...", false, false)
        
        local success = pcall(function()
            if setclipboard then
                setclipboard("https://discord.gg/YV2uZTHxPh")
                ShowStatus("DISCORD LINK COPIED TO CLIPBOARD!", false, true)
            else
                ShowStatus("DISCORD: https://discord.gg/YV2uZTHxPh", false, true)
            end
        end)
        
        if not success then
            ShowStatus("DISCORD: https://discord.gg/YV2uZTHxPh", false, true)
        end
    end)
end

-- ========================================
-- ANIMATION LOOPS
-- ========================================

local function StartAnimationLoops()
    State.Animations.BorderTween = nil
    State.FocusStates.AnimationsActive = true
    
    task.spawn(function()
        for i = 1, 30 do
            if State.IsDestroyed then break end
            CreateParticle()
            task.wait(math.random(15, 80) / 1000)
        end
        
        while not State.IsDestroyed and UI.ScreenGui.Parent do
            if #State.Particles < Config.ParticleCount then
                for i = 1, 2 do
                    CreateParticle()
                end
            end
            task.wait(math.random(300, 1000) / 1000)
        end
    end)
    
    task.spawn(function()
        while not State.IsDestroyed and UI.ScreenGui.Parent do
            pcall(UpdateParticles)
            task.wait(1/Config.ParticleSpeed)
        end
    end)
    
    task.spawn(function()
        while not State.IsDestroyed and UI.AnimatedBorder and UI.AnimatedBorder.Frame.Parent do
            if State.Animations.BorderTween then
                State.Animations.BorderTween:Cancel()
            end
            
            local startRotation = UI.AnimatedBorder.Gradient.Rotation
            local tween = Services.TweenService:Create(UI.AnimatedBorder.Gradient, 
                TweenInfo.new(3, Enum.EasingStyle.Linear), 
                {Rotation = startRotation + 360})

            State.Animations.BorderTween = tween
            tween:Play()

            local success = pcall(function()
                tween.Completed:Wait()
            end)
            
            if not success then
                task.wait(3)
            end
            
            if UI.AnimatedBorder and UI.AnimatedBorder.Gradient and UI.AnimatedBorder.Gradient.Parent then
                UI.AnimatedBorder.Gradient.Rotation = UI.AnimatedBorder.Gradient.Rotation % 360
            end
            
            task.wait(0.1)
        end
    end)
end

-- ========================================
-- ENTRANCE ANIMATION
-- ========================================

local function PlayEntranceAnimation()
    UI.Container.Size = UDim2.new(0, 0, 0, 0)
    UI.Container.BackgroundTransparency = 1
    UI.Backdrop.BackgroundTransparency = 1
    
    Services.TweenService:Create(UI.Backdrop, 
        TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
        {BackgroundTransparency = 0.15}):Play()
    
    task.wait(0.1)
    
    Services.TweenService:Create(UI.Container, 
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), 
        {Size = UDim2.new(0, 450, 0, 620), BackgroundTransparency = 0}):Play()
    
    task.wait(0.5)
    UI.Input.TextBox:CaptureFocus()
end

-- ========================================
-- MAIN INITIALIZATION
-- ========================================

local function Initialize()
    local screenGui = CreateMainGUI()
    local backdrop = CreateBackdrop(screenGui)
    CreateParticleContainer(backdrop)
    local container = CreateContainer(screenGui)
    CreateAnimatedBorder(container)
    CreateHeader(container)
    local content = CreateContent(container)
    CreateInputSection(content)
    CreateButtons(content)
    CreateStatus(content)
    
    CreateButtonGlow(UI.Buttons.Submit, Colors.HoverPrimary, Colors.Primary)
    CreateButtonGlow(UI.Buttons.Discord, Colors.HoverDiscord, Colors.Discord)
    
    UpdateCharCounter()
    ConnectEvents()
    StartAnimationLoops()
    PlayEntranceAnimation()
end

-- ========================================
-- START THE GUI
-- ========================================

Initialize()
