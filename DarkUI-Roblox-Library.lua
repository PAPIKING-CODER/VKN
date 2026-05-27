--[[
    KING LIBRARY
    Premium UI Framework for Roblox
    Style: Dark Futuristic / Neon Blue
    Logo ID: 74448503684960
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- ==============================
-- THEME (Neverlose-inspired)
-- ==============================
local Theme = {
    Background = Color3.fromRGB(18, 20, 25),
    Secondary = Color3.fromRGB(26, 28, 35),
    Tertiary = Color3.fromRGB(35, 38, 47),
    Accent = Color3.fromRGB(0, 160, 255),
    AccentDark = Color3.fromRGB(0, 120, 200),
    Text = Color3.fromRGB(220, 220, 230),
    TextSecondary = Color3.fromRGB(140, 145, 155),
    TextDisabled = Color3.fromRGB(80, 85, 95),
    Border = Color3.fromRGB(45, 50, 60),
    Glow = Color3.fromRGB(0, 100, 200),
    Danger = Color3.fromRGB(220, 50, 50),
    Warning = Color3.fromRGB(220, 160, 50),
    Success = Color3.fromRGB(50, 180, 100),
    GradientTop = Color3.fromRGB(28, 32, 40),
    GradientBottom = Color3.fromRGB(20, 22, 30),
}

-- Tween presets
local TweenInfoPresets = {
    Quick = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Normal = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Smooth = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    Elastic = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
}

-- ==============================
-- UTILITIES
-- ==============================
local function createRipple(button, mousePos)
    local ripple = Instance.new("Frame")
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0, mousePos.X - button.AbsolutePosition.X, 0, mousePos.Y - button.AbsolutePosition.Y)
    ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.8
    ripple.ZIndex = button.ZIndex + 1
    ripple.BorderSizePixel = 0
    ripple.ClipsDescendants = true
    ripple.Parent = button

    local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2
    TweenService:Create(ripple, TweenInfoPresets.Normal, {
        Size = UDim2.new(0, size, 0, size),
        Position = UDim2.new(0, mousePos.X - button.AbsolutePosition.X - size/2, 0, mousePos.Y - button.AbsolutePosition.Y - size/2),
        BackgroundTransparency = 1
    }):Play()
    game:GetService("Debris"):AddItem(ripple, 0.5)
end

local function createGradient(frame, topColor, bottomColor, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, topColor),
        ColorSequenceKeypoint.new(1, bottomColor)
    })
    gradient.Rotation = rotation or 90
    gradient.Parent = frame
    return gradient
end

local function createShadow(frame)
    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.7
    shadow.BorderSizePixel = 0
    shadow.ZIndex = frame.ZIndex - 1
    shadow.Size = UDim2.new(1, 15, 1, 15)
    shadow.Position = UDim2.new(0, -7, 0, -7)
    shadow.Parent = frame
    return shadow
end

local function makeDraggable(frame, dragHandle)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = Vector2.new(input.Position.X, input.Position.Y)
            startPos = frame.Position
        end
    end)
    dragHandle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- ==============================
-- MAIN KING MODULE
-- ==============================
local KING = {
    Flags = {},
    Objects = {},
    Notifications = {},
    Configs = {},
    _windows = {},
}

-- Window class
local Window = {}
Window.__index = Window

function Window.new(title, size, configFolder, toggleKey)
    local self = setmetatable({}, Window)
    self.Title = title or "KING"
    self.Size = size or UDim2.new(0, 900, 0, 600)
    self.ConfigFolder = configFolder or "KING_Configs"
    self.ToggleKey = toggleKey or Enum.KeyCode.Insert
    self.Tabs = {}
    self.CurrentTab = nil
    self.IsOpen = true
    self.IsMinimized = false
    self.TabButtons = {}
    self.TabContents = {}

    self:CreateMainFrame()
    self:SetupKeybind()
    table.insert(KING._windows, self)
    return self
end

function Window:CreateMainFrame()
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "KING_Main"
    self.MainFrame.Size = self.Size
    self.MainFrame.Position = UDim2.new(0.5, -self.Size.X.Offset/2, 0.5, -self.Size.Y.Offset/2)
    self.MainFrame.BackgroundColor3 = Theme.Background
    self.MainFrame.BackgroundTransparency = 0.05
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.ClipsDescendants = true
    self.MainFrame.Parent = CoreGui

    local blur = Instance.new("BlurEffect")
    blur.Size = 12
    blur.Parent = self.MainFrame

    createShadow(self.MainFrame)
    createGradient(self.MainFrame, Theme.GradientTop, Theme.GradientBottom, 90)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = self.MainFrame

    local outline = Instance.new("UIStroke")
    outline.Color = Theme.Border
    outline.Thickness = 1
    outline.Transparency = 0.5
    outline.Parent = self.MainFrame

    -- Title bar
    self.TitleBar = Instance.new("Frame")
    self.TitleBar.Size = UDim2.new(1, 0, 0, 45)
    self.TitleBar.BackgroundColor3 = Theme.Secondary
    self.TitleBar.BackgroundTransparency = 0.3
    self.TitleBar.BorderSizePixel = 0
    self.TitleBar.Parent = self.MainFrame
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = self.TitleBar

    -- Logo (custom ID)
    self.Logo = Instance.new("ImageLabel")
    self.Logo.Size = UDim2.new(0, 32, 0, 32)
    self.Logo.Position = UDim2.new(0, 12, 0, 6)
    self.Logo.BackgroundTransparency = 1
    self.Logo.Image = "rbxassetid://74448503684960"
    self.Logo.Parent = self.TitleBar

    -- Logo glow
    self.LogoGlow = Instance.new("ImageLabel")
    self.LogoGlow.Size = UDim2.new(0, 40, 0, 40)
    self.LogoGlow.Position = UDim2.new(0, 8, 0, 2)
    self.LogoGlow.BackgroundTransparency = 1
    self.LogoGlow.Image = "rbxassetid://74448503684960"
    self.LogoGlow.ImageColor3 = Theme.Accent
    self.LogoGlow.ImageTransparency = 0.5
    self.LogoGlow.ZIndex = self.Logo.ZIndex - 1
    self.LogoGlow.Parent = self.TitleBar

    self.TitleText = Instance.new("TextLabel")
    self.TitleText.Size = UDim2.new(0, 150, 1, 0)
    self.TitleText.Position = UDim2.new(0, 52, 0, 0)
    self.TitleText.BackgroundTransparency = 1
    self.TitleText.Text = self.Title
    self.TitleText.TextColor3 = Theme.Text
    self.TitleText.TextSize = 18
    self.TitleText.TextXAlignment = Enum.TextXAlignment.Left
    self.TitleText.Font = Enum.Font.GothamSemibold
    self.TitleText.Parent = self.TitleBar

    -- Window controls
    local function createTitleButton(pos, text)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 28, 0, 28)
        btn.Position = pos
        btn.BackgroundColor3 = Color3.fromRGB(45, 50, 60)
        btn.BackgroundTransparency = 0.7
        btn.Text = text
        btn.TextColor3 = Theme.TextSecondary
        btn.TextSize = 14
        btn.Font = Enum.Font.Gotham
        btn.BorderSizePixel = 0
        btn.Parent = self.TitleBar
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfoPresets.Quick, {BackgroundTransparency = 0.3}):Play()
            TweenService:Create(btn, TweenInfoPresets.Quick, {TextColor3 = Theme.Text}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfoPresets.Quick, {BackgroundTransparency = 0.7}):Play()
            TweenService:Create(btn, TweenInfoPresets.Quick, {TextColor3 = Theme.TextSecondary}):Play()
        end)
        return btn
    end

    self.MinimizeBtn = createTitleButton(UDim2.new(1, -85, 0, 8), "—")
    self.MinimizeBtn.MouseButton1Click:Connect(function() self:ToggleMinimize() end)

    self.CloseBtn = createTitleButton(UDim2.new(1, -45, 0, 8), "✕")
    self.CloseBtn.MouseButton1Click:Connect(function() self:Close() end)

    self.SearchBtn = createTitleButton(UDim2.new(1, -125, 0, 8), "🔍")
    self.SearchBtn.MouseButton1Click:Connect(function() self:ToggleSearch() end)

    self.ProfileBtn = createTitleButton(UDim2.new(1, -165, 0, 8), "👤")
    self.ProfileBtn.MouseButton1Click:Connect(function() self:ToggleProfileMenu() end)

    -- Content frames
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Size = UDim2.new(1, 0, 1, -45)
    self.ContentFrame.Position = UDim2.new(0, 0, 0, 45)
    self.ContentFrame.BackgroundTransparency = 1
    self.ContentFrame.Parent = self.MainFrame

    self.Sidebar = Instance.new("Frame")
    self.Sidebar.Size = UDim2.new(0, 220, 1, 0)
    self.Sidebar.BackgroundColor3 = Theme.Secondary
    self.Sidebar.BackgroundTransparency = 0.2
    self.Sidebar.BorderSizePixel = 0
    self.Sidebar.Parent = self.ContentFrame
    local sidebarCorner = Instance.new("UICorner")
    sidebarCorner.CornerRadius = UDim.new(0, 0)
    sidebarCorner.Parent = self.Sidebar

    self.SidebarLayout = Instance.new("UIListLayout")
    self.SidebarLayout.Padding = UDim.new(0, 8)
    self.SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    self.SidebarLayout.Parent = self.Sidebar

    local sidebarPadding = Instance.new("UIPadding")
    sidebarPadding.PaddingTop = UDim.new(0, 20)
    sidebarPadding.PaddingLeft = UDim.new(0, 16)
    sidebarPadding.PaddingRight = UDim.new(0, 16)
    sidebarPadding.Parent = self.Sidebar

    self.MainContent = Instance.new("Frame")
    self.MainContent.Size = UDim2.new(1, -220, 1, 0)
    self.MainContent.Position = UDim2.new(0, 220, 0, 0)
    self.MainContent.BackgroundTransparency = 1
    self.MainContent.Parent = self.ContentFrame

    makeDraggable(self.MainFrame, self.TitleBar)
end

function Window:SetupKeybind()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == self.ToggleKey then
            if self.IsOpen then self:Close() else self:Open() end
        end
    end)
end

function Window:Open()
    if self.IsOpen then return end
    self.IsOpen = true
    TweenService:Create(self.MainFrame, TweenInfoPresets.Smooth, {Size = self.Size}):Play()
    TweenService:Create(self.ContentFrame, TweenInfoPresets.Smooth, {Size = UDim2.new(1, 0, 1, -45)}):Play()
end

function Window:Close()
    if not self.IsOpen then return end
    self.IsOpen = false
    TweenService:Create(self.MainFrame, TweenInfoPresets.Smooth, {Size = UDim2.new(0, 300, 0, 45)}):Play()
    TweenService:Create(self.ContentFrame, TweenInfoPresets.Smooth, {Size = UDim2.new(1, 0, 0, 0)}):Play()
end

function Window:ToggleMinimize()
    self.IsMinimized = not self.IsMinimized
    local targetHeight = self.IsMinimized and 45 or self.Size.Y.Offset
    TweenService:Create(self.MainFrame, TweenInfoPresets.Smooth, {Size = UDim2.new(self.Size.X.Scale, self.Size.X.Offset, self.Size.Y.Scale, targetHeight)}):Play()
    TweenService:Create(self.ContentFrame, TweenInfoPresets.Smooth, {Size = UDim2.new(1, 0, 1, self.IsMinimized and 0 or -45)}):Play()
end

function Window:ToggleSearch()
    -- Simple search overlay (can be expanded)
    if self.SearchFrame and self.SearchFrame.Parent then
        TweenService:Create(self.SearchFrame, TweenInfoPresets.Quick, {BackgroundTransparency = 1}):Play()
        task.wait(0.2)
        self.SearchFrame:Destroy()
        self.SearchFrame = nil
        return
    end
    self.SearchFrame = Instance.new("Frame")
    self.SearchFrame.Size = UDim2.new(1, 0, 1, 0)
    self.SearchFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    self.SearchFrame.BackgroundTransparency = 0.5
    self.SearchFrame.BorderSizePixel = 0
    self.SearchFrame.Parent = self.MainFrame
    local searchBox = Instance.new("TextBox")
    searchBox.Size = UDim2.new(0, 300, 0, 40)
    searchBox.Position = UDim2.new(0.5, -150, 0.2, 0)
    searchBox.PlaceholderText = "Search settings..."
    searchBox.Text = ""
    searchBox.BackgroundColor3 = Theme.Tertiary
    searchBox.TextColor3 = Theme.Text
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 14
    searchBox.Parent = self.SearchFrame
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 8)
    boxCorner.Parent = searchBox
    TweenService:Create(self.SearchFrame, TweenInfoPresets.Quick, {BackgroundTransparency = 0.5}):Play()
end

function Window:ToggleProfileMenu()
    -- Placeholder for config/profile dropdown
    KING:Notify("Profile menu", "Config system coming soon", 3)
end

function Window:AddTab(name, icon)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, 0, 0, 38)
    tabButton.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    tabButton.BackgroundTransparency = 1
    tabButton.Text = "  " .. (icon or "●") .. "  " .. name
    tabButton.TextColor3 = Theme.TextSecondary
    tabButton.TextSize = 14
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    tabButton.Font = Enum.Font.Gotham
    tabButton.BorderSizePixel = 0
    tabButton.Parent = self.Sidebar

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton

    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Size = UDim2.new(1, -40, 1, -20)
    tabContent.Position = UDim2.new(0, 20, 0, 10)
    tabContent.BackgroundTransparency = 1
    tabContent.BorderSizePixel = 0
    tabContent.ScrollBarThickness = 4
    tabContent.ScrollBarImageColor3 = Theme.Accent
    tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContent.Visible = false
    tabContent.Parent = self.MainContent

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 12)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Parent = tabContent
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
    end)

    tabButton.MouseButton1Click:Connect(function()
        for _, btn in pairs(self.TabButtons) do
            TweenService:Create(btn, TweenInfoPresets.Quick, {BackgroundTransparency = 1, TextColor3 = Theme.TextSecondary}):Play()
        end
        for _, content in pairs(self.TabContents) do
            content.Visible = false
        end
        TweenService:Create(tabButton, TweenInfoPresets.Quick, {BackgroundTransparency = 0.3, TextColor3 = Theme.Accent}):Play()
        tabContent.Visible = true
        self.CurrentTab = name
    end)

    table.insert(self.TabButtons, tabButton)
    table.insert(self.TabContents, tabContent)

    if #self.TabButtons == 1 then
        tabButton.MouseButton1Click:Fire()
    end

    return tabContent
end

-- ==============================
-- UI ELEMENTS
-- ==============================
function Window:CreateToggle(parent, name, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundColor3 = Theme.Tertiary
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -70, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.Parent = frame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 24)
    toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 65, 75)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = frame
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleBtn

    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 20, 0, 20)
    handle.Position = UDim2.new(0, 2, 0.5, -10)
    handle.BackgroundColor3 = Color3.fromRGB(255,255,255)
    handle.BorderSizePixel = 0
    handle.Parent = toggleBtn
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(1, 0)
    handleCorner.Parent = handle

    local value = default or false
    local function updateToggle()
        local targetColor = value and Theme.Accent or Color3.fromRGB(60,65,75)
        local handlePos = value and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
        TweenService:Create(toggleBtn, TweenInfoPresets.Normal, {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(handle, TweenInfoPresets.Normal, {Position = handlePos}):Play()
        if callback then callback(value) end
    end
    updateToggle()

    toggleBtn.MouseButton1Click:Connect(function()
        value = not value
        updateToggle()
        createRipple(toggleBtn, Mouse)
    end)

    return {
        SetValue = function(v) value = v; updateToggle() end,
        GetValue = function() return value end,
        Object = frame,
    }
end

function Window:CreateSlider(parent, name, min, max, default, decimals, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 60)
    frame.BackgroundColor3 = Theme.Tertiary
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -100, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.Parent = frame

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 80, 0, 20)
    valueLabel.Position = UDim2.new(1, -90, 0, 8)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.TextColor3 = Theme.Accent
    valueLabel.TextSize = 13
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.Parent = frame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, -24, 0, 4)
    sliderBar.Position = UDim2.new(0, 12, 0, 40)
    sliderBar.BackgroundColor3 = Color3.fromRGB(50,55,65)
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = frame
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = sliderBar

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Theme.Accent
    fill.BorderSizePixel = 0
    fill.Parent = sliderBar
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill

    local value = math.clamp(default, min, max)
    local function updateSlider()
        local percent = (value - min) / (max - min)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        valueLabel.Text = decimals and string.format("%."..decimals.."f", value) or tostring(math.floor(value))
        if callback then callback(value) end
    end
    updateSlider()

    local dragging = false
    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local percent = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            value = min + (max - min) * percent
            updateSlider()
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percent = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            value = min + (max - min) * percent
            updateSlider()
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return {
        SetValue = function(v) value = math.clamp(v, min, max); updateSlider() end,
        GetValue = function() return value end,
    }
end

function Window:CreateButton(parent, name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 36)
    btn.BackgroundColor3 = Theme.Tertiary
    btn.BackgroundTransparency = 0.5
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.TextSize = 14
    btn.Font = Enum.Font.Gotham
    btn.BorderSizePixel = 0
    btn.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfoPresets.Quick, {BackgroundTransparency = 0.2, TextColor3 = Theme.Accent}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfoPresets.Quick, {BackgroundTransparency = 0.5, TextColor3 = Theme.Text}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        createRipple(btn, Mouse)
        if callback then callback() end
    end)
    return btn
end

function Window:CreateDropdown(parent, name, options, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundColor3 = Theme.Tertiary
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 100, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Theme.Text
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.Parent = frame

    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Size = UDim2.new(0, 150, 0, 28)
    dropdownBtn.Position = UDim2.new(1, -160, 0.5, -14)
    dropdownBtn.BackgroundColor3 = Color3.fromRGB(40,43,52)
    dropdownBtn.Text = default or options[1]
    dropdownBtn.TextColor3 = Theme.Text
    dropdownBtn.TextSize = 13
    dropdownBtn.Font = Enum.Font.Gotham
    dropdownBtn.BorderSizePixel = 0
    dropdownBtn.Parent = frame
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = dropdownBtn

    local listFrame = Instance.new("Frame")
    listFrame.Size = UDim2.new(0, 150, 0, 0)
    listFrame.Position = UDim2.new(1, -160, 0, 40)
    listFrame.BackgroundColor3 = Color3.fromRGB(30,33,42)
    listFrame.BorderSizePixel = 0
    listFrame.Visible = false
    listFrame.ClipsDescendants = true
    listFrame.Parent = frame
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 6)
    listCorner.Parent = listFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 2)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = listFrame

    local selected = default or options[1]
    local function updateList()
        for _, child in ipairs(listFrame:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        for _, opt in ipairs(options) do
            local optBtn = Instance.new("TextButton")
            optBtn.Size = UDim2.new(1, 0, 0, 28)
            optBtn.BackgroundColor3 = Color3.fromRGB(40,43,52)
            optBtn.BackgroundTransparency = 0.5
            optBtn.Text = opt
            optBtn.TextColor3 = (opt == selected) and Theme.Accent or Theme.TextSecondary
            optBtn.TextSize = 13
            optBtn.Font = Enum.Font.Gotham
            optBtn.BorderSizePixel = 0
            optBtn.Parent = listFrame
            local optCorner = Instance.new("UICorner")
            optCorner.CornerRadius = UDim.new(0, 4)
            optCorner.Parent = optBtn
            optBtn.MouseButton1Click:Connect(function()
                selected = opt
                dropdownBtn.Text = opt
                updateList()
                if callback then callback(opt) end
                listFrame.Visible = false
            end)
        end
        listFrame.Size = UDim2.new(0, 150, 0, #options * 30)
    end
    updateList()

    dropdownBtn.MouseButton1Click:Connect(function()
        listFrame.Visible = not listFrame.Visible
        if listFrame.Visible then
            TweenService:Create(listFrame, TweenInfoPresets.Normal, {Size = UDim2.new(0, 150, 0, #options * 30)}):Play()
        else
            TweenService:Create(listFrame, TweenInfoPresets.Normal, {Size = UDim2.new(0, 150, 0, 0)}):Play()
        end
    end)

    return {
        SetValue = function(v) selected = v; dropdownBtn.Text = v; updateList(); if callback then callback(v) end end,
        GetValue = function() return selected end,
    }
end

-- ==============================
-- NOTIFICATION SYSTEM
-- ==============================
function KING:Notify(title, message, duration, type)
    type = type or "info"
    local color = (type == "success") and Theme.Success or (type == "error") and Theme.Danger or (type == "warning") and Theme.Warning or Theme.Accent
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 320, 0, 70)
    notification.Position = UDim2.new(1, 10, 1, -80)
    notification.BackgroundColor3 = Theme.Secondary
    notification.BackgroundTransparency = 0.1
    notification.BorderSizePixel = 0
    notification.Parent = CoreGui
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notification
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = notification

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 12, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = color
    titleLabel.TextSize = 15
    titleLabel.Font = Enum.Font.GothamSemibold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification

    local msgLabel = Instance.new("TextLabel")
    msgLabel.Size = UDim2.new(1, -20, 0, 30)
    msgLabel.Position = UDim2.new(0, 12, 0, 32)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = Theme.TextSecondary
    msgLabel.TextSize = 12
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.Parent = notification

    notification.Position = UDim2.new(1, 0, 1, -80)
    TweenService:Create(notification, TweenInfoPresets.Elastic, {Position = UDim2.new(1, -330, 1, -80)}):Play()
    task.wait(duration or 3)
    TweenService:Create(notification, TweenInfoPresets.Normal, {Position = UDim2.new(1, 0, 1, -80)}):Play()
    task.wait(0.3)
    notification:Destroy()
end

-- ==============================
-- EXPORTS
-- ==============================
function KING:NewWindow(title, size, configFolder, toggleKey)
    return Window.new(title, size, configFolder, toggleKey)
end

function KING:NotifySuccess(title, message, duration)
    self:Notify(title, message, duration, "success")
end

function KING:NotifyError(title, message, duration)
    self:Notify(title, message, duration, "error")
end

function KING:NotifyWarning(title, message, duration)
    self:Notify(title, message, duration, "warning")
end

return KING
