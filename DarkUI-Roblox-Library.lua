--[[
    ADVANCED ROBLOX UI LIBRARY - NEVERLOSE STYLE
    Inspired by the reference image.
    Features: Draggable, resizable, modern dark theme with neon blue accents.
    Logo ID: 74448503684960 (custom)
    Includes: Tabs, Sections, Toggles, Buttons, Sliders, Dropdowns, ColorPickers, Keybinds, Textboxes, Notifications, Config saving.
    Optimized for performance, smooth animations, responsive.
    Compatible with most executors.
--]]

local Library = {}
Library.__index = Library

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Helper functions
local function create(className, properties)
    local inst = Instance.new(className)
    for prop, val in pairs(properties or {}) do
        inst[prop] = val
    end
    return inst
end

local function round(num, decimal)
    local mult = 10^(decimal or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Global settings
local UI_SETTINGS = {
    Theme = {
        Background = Color3.fromRGB(12, 12, 15),
        Secondary = Color3.fromRGB(20, 20, 25),
        Accent = Color3.fromRGB(0, 120, 215),
        AccentGlow = Color3.fromRGB(0, 150, 255),
        Text = Color3.fromRGB(230, 230, 240),
        TextDim = Color3.fromRGB(160, 160, 170),
        Border = Color3.fromRGB(40, 40, 45),
        Danger = Color3.fromRGB(220, 50, 50),
        Success = Color3.fromRGB(50, 200, 50),
    },
    Blur = true,  -- enable blur background
    Draggable = true,
    Resizable = true,
    Minimizable = true,
    LogoId = "74448503684960",
    Font = Enum.Font.Gotham,
    FontBold = Enum.Font.GothamBold,
    FontSizeSmall = 12,
    FontSizeNormal = 14,
    FontSizeLarge = 16,
}

-- Main class
function Library:CreateWindow(title, options)
    options = options or {}
    local window = {}
    setmetatable(window, self)

    window.Title = title or "UI Library"
    window.Options = options
    window.Tabs = {}
    window.Open = true
    window.CurrentTab = nil
    window.Size = options.Size or UDim2.new(0, 900, 0, 600)
    window.MinSize = options.MinSize or Vector2.new(600, 400)
    window.Position = options.Position or UDim2.new(0.5, -450, 0.5, -300)

    -- Create GUI holder
    local screenGui = create("ScreenGui", {
        Name = "NeverloseUI",
        Parent = (options.Parent or CoreGui),
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
    })

    -- Blur background if enabled
    if UI_SETTINGS.Blur then
        local blur = create("BlurEffect", {
            Name = "UIBackgroundBlur",
            Parent = Lighting,
            Size = 12,
            Enabled = true,
        })
        window.Blur = blur
        -- Disable blur when UI is closed? we handle later
    end

    -- Main frame
    local mainFrame = create("Frame", {
        Name = "MainFrame",
        Parent = screenGui,
        BackgroundTransparency = 0.05,
        BackgroundColor3 = UI_SETTINGS.Theme.Background,
        BorderSizePixel = 0,
        Position = window.Position,
        Size = window.Size,
        ClipsDescendants = true,
    })
    -- Round corners
    local corner = create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = mainFrame,
    })
    -- Shadow (using UIStroke + additional frame)
    local shadow = create("Frame", {
        Name = "Shadow",
        Parent = mainFrame,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -5, 0, -5),
        Size = UDim2.new(1, 10, 1, 10),
        ZIndex = 0,
    })
    local stroke = create("UIStroke", {
        Color = UI_SETTINGS.Theme.Border,
        Thickness = 1,
        Transparency = 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = mainFrame,
    })

    -- Title bar (draggable)
    local titleBar = create("Frame", {
        Name = "TitleBar",
        Parent = mainFrame,
        BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
        BackgroundTransparency = 0.3,
        Size = UDim2.new(1, 0, 0, 45),
        Position = UDim2.new(0, 0, 0, 0),
        ZIndex = 2,
    })
    create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = titleBar })
    -- Top corner rounding fix: we need to mask the top corners only. We'll just keep it.

    -- Logo
    local logoContainer = create("Frame", {
        Name = "LogoContainer",
        Parent = titleBar,
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 12, 0, 2.5),
        BackgroundTransparency = 1,
    })
    local logo = create("ImageLabel", {
        Name = "Logo",
        Parent = logoContainer,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Image = "rbxassetid://" .. UI_SETTINGS.LogoId,
        ScaleType = Enum.ScaleType.Fit,
    })
    local logoGlow = create("Frame", {
        Name = "LogoGlow",
        Parent = logoContainer,
        Size = UDim2.new(1, 10, 1, 10),
        Position = UDim2.new(0, -5, 0, -5),
        BackgroundTransparency = 1,
        BackgroundColor3 = UI_SETTINGS.Theme.AccentGlow,
        ZIndex = -1,
    })
    -- Rounded corners for logo container
    local logoCorner = create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = logoContainer })

    -- Title label
    local titleLabel = create("TextLabel", {
        Name = "TitleLabel",
        Parent = titleBar,
        BackgroundTransparency = 1,
        Text = window.Title,
        TextColor3 = UI_SETTINGS.Theme.Text,
        TextSize = UI_SETTINGS.FontSizeLarge,
        Font = UI_SETTINGS.FontBold,
        Position = UDim2.new(0, 60, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    -- Window buttons (minimize, close)
    local btnClose = create("TextButton", {
        Name = "CloseButton",
        Parent = titleBar,
        BackgroundColor3 = UI_SETTINGS.Theme.Danger,
        BackgroundTransparency = 0.8,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -40, 0, 7.5),
        Text = "✕",
        TextColor3 = UI_SETTINGS.Theme.Text,
        TextSize = 18,
        Font = UI_SETTINGS.Font,
        AutoButtonColor = false,
    })
    create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = btnClose })
    local btnMinimize = create("TextButton", {
        Name = "MinimizeButton",
        Parent = titleBar,
        BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
        BackgroundTransparency = 0.5,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -80, 0, 7.5),
        Text = "—",
        TextColor3 = UI_SETTINGS.Theme.Text,
        TextSize = 18,
        Font = UI_SETTINGS.Font,
        AutoButtonColor = false,
    })
    create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = btnMinimize })

    -- Sidebar panel
    local sidebar = create("Frame", {
        Name = "Sidebar",
        Parent = mainFrame,
        BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
        BackgroundTransparency = 0.1,
        Size = UDim2.new(0, 220, 1, -45),
        Position = UDim2.new(0, 0, 0, 45),
        BorderSizePixel = 0,
    })
    create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = sidebar })
    -- Tab buttons container
    local tabContainer = create("ScrollingFrame", {
        Name = "TabContainer",
        Parent = sidebar,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = UI_SETTINGS.Theme.Accent,
    })
    local tabLayout = create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = tabContainer,
    })
    local tabPadding = create("UIPadding", {
        PaddingTop = UDim.new(0, 12),
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        Parent = tabContainer,
    })

    -- Content panel
    local contentPanel = create("ScrollingFrame", {
        Name = "ContentPanel",
        Parent = mainFrame,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -230, 1, -55),
        Position = UDim2.new(0, 225, 0, 50),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 6,
        ScrollBarImageColor3 = UI_SETTINGS.Theme.Accent,
        BorderSizePixel = 0,
    })
    local contentLayout = create("UIListLayout", {
        Padding = UDim.new(0, 16),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = contentPanel,
    })
    local contentPadding = create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        Parent = contentPanel,
    })

    -- Drag logic
    local dragging = false
    local dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Resize logic (simple resize from bottom-right corner)
    local resizeEnabled = UI_SETTINGS.Resizable
    local resizeHandle = create("Frame", {
        Name = "ResizeHandle",
        Parent = mainFrame,
        BackgroundColor3 = UI_SETTINGS.Theme.Accent,
        BackgroundTransparency = 0.8,
        Size = UDim2.new(0, 10, 0, 10),
        Position = UDim2.new(1, -12, 1, -12),
        ZIndex = 10,
        Visible = resizeEnabled,
    })
    create("UICorner", { CornerRadius = UDim.new(0, 4), Parent = resizeHandle })
    local resizing = false
    local resizeStart, startSize
    resizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = true
            resizeStart = input.Position
            startSize = mainFrame.Size
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - resizeStart
            local newWidth = math.clamp(startSize.X.Offset + delta.X, window.MinSize.X, 2000)
            local newHeight = math.clamp(startSize.Y.Offset + delta.Y, window.MinSize.Y, 1200)
            mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
            -- update content size? content panel adjusts automatically because it's relative.
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = false
        end
    end)

    -- Minimize / Close
    local minimized = false
    local originalSize = window.Size
    btnMinimize.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            mainFrame:TweenSize(UDim2.new(0, 400, 0, 45), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3)
            sidebar.Visible = false
            contentPanel.Visible = false
            resizeHandle.Visible = false
        else
            mainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3)
            sidebar.Visible = true
            contentPanel.Visible = true
            resizeHandle.Visible = resizeEnabled
        end
    end)

    btnClose.MouseButton1Click:Connect(function()
        if window.Blur then window.Blur.Enabled = false end
        screenGui:Destroy()
    end)

    -- Tab creation
    function window:AddTab(name, iconId)
        local tab = {}
        tab.Name = name
        tab.Icon = iconId
        tab.Elements = {}
        tab.Container = create("Frame", {
            Name = "Tab_"..name,
            Parent = contentPanel,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Visible = false,
        })
        local tabButton = create("TextButton", {
            Name = "TabButton_"..name,
            Parent = tabContainer,
            BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
            BackgroundTransparency = 0.8,
            Size = UDim2.new(1, 0, 0, 40),
            Text = "  " .. name,
            TextColor3 = UI_SETTINGS.Theme.Text,
            TextSize = UI_SETTINGS.FontSizeNormal,
            Font = UI_SETTINGS.Font,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutoButtonColor = false,
        })
        create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = tabButton })
        -- Icon
        if iconId then
            local icon = create("ImageLabel", {
                Parent = tabButton,
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 10, 0.5, -10),
                BackgroundTransparency = 1,
                Image = "rbxassetid://" .. iconId,
            })
        end
        -- Hover
        local hoverTween
        tabButton.MouseEnter:Connect(function()
            hoverTween = TweenService:Create(tabButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.5})
            hoverTween:Play()
        end)
        tabButton.MouseLeave:Connect(function()
            hoverTween = TweenService:Create(tabButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.8})
            hoverTween:Play()
        end)
        tabButton.MouseButton1Click:Connect(function()
            for _, t in pairs(window.Tabs) do
                t.Container.Visible = false
                t.Button.BackgroundTransparency = 0.8
                t.Button.TextColor3 = UI_SETTINGS.Theme.Text
            end
            tab.Container.Visible = true
            tabButton.BackgroundTransparency = 0.3
            tabButton.TextColor3 = UI_SETTINGS.Theme.AccentGlow
        end)
        tab.Button = tabButton
        window.Tabs[#window.Tabs+1] = tab
        if #window.Tabs == 1 then
            tabButton.MouseButton1Click:Fire()
        end

        -- Section creation
        function tab:AddSection(title)
            local section = {}
            section.Title = title
            local sectionFrame = create("Frame", {
                Name = "Section_"..title,
                Parent = tab.Container,
                BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                BackgroundTransparency = 0.2,
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BorderSizePixel = 0,
            })
            create("UICorner", { CornerRadius = UDim.new(0, 10), Parent = sectionFrame })
            local sectionTitle = create("TextLabel", {
                Parent = sectionFrame,
                BackgroundTransparency = 1,
                Text = title,
                TextColor3 = UI_SETTINGS.Theme.AccentGlow,
                TextSize = UI_SETTINGS.FontSizeLarge,
                Font = UI_SETTINGS.FontBold,
                Position = UDim2.new(0, 12, 0, 8),
                Size = UDim2.new(1, -24, 0, 24),
                TextXAlignment = Enum.TextXAlignment.Left,
            })
            local line = create("Frame", {
                Parent = sectionFrame,
                BackgroundColor3 = UI_SETTINGS.Theme.Accent,
                Size = UDim2.new(1, -24, 0, 1),
                Position = UDim2.new(0, 12, 0, 36),
            })
            local contentHolder = create("Frame", {
                Parent = sectionFrame,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 0),
                Position = UDim2.new(0, 0, 0, 42),
                AutomaticSize = Enum.AutomaticSize.Y,
            })
            local elementsLayout = create("UIListLayout", {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = contentHolder,
            })
            local elementsPadding = create("UIPadding", {
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 12),
                Parent = contentHolder,
            })

            function section:AddToggle(label, default, callback)
                local toggle = {}
                local toggleFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                    AutomaticSize = Enum.AutomaticSize.None,
                })
                local labelText = create("TextLabel", {
                    Parent = toggleFrame,
                    BackgroundTransparency = 1,
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, -60, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local toggleBtn = create("TextButton", {
                    Parent = toggleFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    Size = UDim2.new(0, 44, 0, 22),
                    Position = UDim2.new(1, -50, 0.5, -11),
                    AutoButtonColor = false,
                })
                create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = toggleBtn })
                local knob = create("Frame", {
                    Parent = toggleBtn,
                    BackgroundColor3 = UI_SETTINGS.Theme.Text,
                    Size = UDim2.new(0, 18, 0, 18),
                    Position = UDim2.new(0, 2, 0.5, -9),
                })
                create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = knob })
                local state = default or false
                local function update()
                    if state then
                        toggleBtn.BackgroundColor3 = UI_SETTINGS.Theme.Accent
                        TweenService:Create(knob, TweenInfo.new(0.15), {Position = UDim2.new(1, -20, 0.5, -9)}):Play()
                    else
                        toggleBtn.BackgroundColor3 = UI_SETTINGS.Theme.Secondary
                        TweenService:Create(knob, TweenInfo.new(0.15), {Position = UDim2.new(0, 2, 0.5, -9)}):Play()
                    end
                    if callback then callback(state) end
                end
                toggleBtn.MouseButton1Click:Connect(function()
                    state = not state
                    update()
                end)
                update()
                toggle.Set = function(_, val) state = val; update() end
                toggle.Get = function() return state end
                return toggle
            end

            function section:AddButton(label, callback)
                local btnFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                })
                local btn = create("TextButton", {
                    Parent = btnFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    BackgroundTransparency = 0.8,
                    Size = UDim2.new(1, 0, 1, 0),
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    AutoButtonColor = false,
                })
                create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = btn })
                btn.MouseEnter:Connect(function()
                    TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.4}):Play()
                end)
                btn.MouseLeave:Connect(function()
                    TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.8}):Play()
                end)
                btn.MouseButton1Click:Connect(function()
                    if callback then callback() end
                end)
                return btn
            end

            function section:AddSlider(label, min, max, default, callback)
                local sliderFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 50),
                })
                local labelText = create("TextLabel", {
                    Parent = sliderFrame,
                    BackgroundTransparency = 1,
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, -100, 0, 20),
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local valueText = create("TextLabel", {
                    Parent = sliderFrame,
                    BackgroundTransparency = 1,
                    Text = tostring(default),
                    TextColor3 = UI_SETTINGS.Theme.AccentGlow,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.FontBold,
                    Position = UDim2.new(1, -80, 0, 0),
                    Size = UDim2.new(0, 80, 0, 20),
                })
                local sliderBg = create("Frame", {
                    Parent = sliderFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    Size = UDim2.new(1, 0, 0, 6),
                    Position = UDim2.new(0, 0, 0, 28),
                })
                create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = sliderBg })
                local sliderFill = create("Frame", {
                    Parent = sliderBg,
                    BackgroundColor3 = UI_SETTINGS.Theme.Accent,
                    Size = UDim2.new(0, 0, 1, 0),
                })
                create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = sliderFill })
                local dragging = false
                local value = default
                local function updateSlider(inputPos)
                    local rel = (inputPos.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X
                    rel = math.clamp(rel, 0, 1)
                    value = min + (max - min) * rel
                    value = round(value, 2)
                    valueText.Text = tostring(value)
                    sliderFill.Size = UDim2.new(rel, 0, 1, 0)
                    if callback then callback(value) end
                end
                sliderBg.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        updateSlider(input)
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSlider(input)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                updateSlider({Position = Vector2.new(sliderBg.AbsolutePosition.X + ((value-min)/(max-min)) * sliderBg.AbsoluteSize.X, 0)})
                return sliderFill
            end

            function section:AddDropdown(label, items, default, callback)
                local dropdownFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                })
                local labelText = create("TextLabel", {
                    Parent = dropdownFrame,
                    BackgroundTransparency = 1,
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, -120, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local btn = create("TextButton", {
                    Parent = dropdownFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    Size = UDim2.new(0, 120, 1, 0),
                    Position = UDim2.new(1, -120, 0, 0),
                    Text = default or items[1] or "",
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    AutoButtonColor = false,
                })
                create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = btn })
                local dropdownList = create("ScrollingFrame", {
                    Parent = dropdownFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    Size = UDim2.new(0, 120, 0, 0),
                    Position = UDim2.new(1, -120, 0, 32),
                    Visible = false,
                    ClipsDescendants = true,
                    ScrollBarThickness = 4,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                })
                create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = dropdownList })
                local listLayout = create("UIListLayout", {
                    Padding = UDim.new(0, 4),
                    Parent = dropdownList,
                })
                local function populate(list)
                    for _, child in pairs(dropdownList:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
                    for _, item in ipairs(list) do
                        local option = create("TextButton", {
                            Parent = dropdownList,
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0, 28),
                            Text = item,
                            TextColor3 = UI_SETTINGS.Theme.Text,
                            TextSize = UI_SETTINGS.FontSizeNormal,
                            Font = UI_SETTINGS.Font,
                            AutoButtonColor = false,
                        })
                        option.MouseButton1Click:Connect(function()
                            btn.Text = item
                            dropdownList.Visible = false
                            if callback then callback(item) end
                        end)
                    end
                    dropdownList.CanvasSize = UDim2.new(0,0,0, (#list)*28 + 8)
                end
                populate(items)
                btn.MouseButton1Click:Connect(function()
                    dropdownList.Visible = not dropdownList.Visible
                    if dropdownList.Visible then
                        dropdownList.Size = UDim2.new(0, 120, 0, math.min(#items*28 + 8, 200))
                    else
                        dropdownList.Size = UDim2.new(0, 120, 0, 0)
                    end
                end)
                return btn
            end

            function section:AddColorPicker(label, defaultColor, callback)
                local pickerFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                })
                local labelText = create("TextLabel", {
                    Parent = pickerFrame,
                    BackgroundTransparency = 1,
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, -60, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local colorDisplay = create("TextButton", {
                    Parent = pickerFrame,
                    BackgroundColor3 = defaultColor or Color3.fromRGB(255,255,255),
                    Size = UDim2.new(0, 40, 0, 24),
                    Position = UDim2.new(1, -50, 0.5, -12),
                    AutoButtonColor = false,
                })
                create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = colorDisplay })
                -- Simple color picker popup (just for demo, not full HSV)
                colorDisplay.MouseButton1Click:Connect(function()
                    -- In a real implementation, you'd open a color picker GUI.
                    -- For simplicity, we'll cycle through some colors.
                    local colors = {Color3.fromRGB(0,120,215), Color3.fromRGB(255,50,50), Color3.fromRGB(50,200,50), Color3.fromRGB(255,200,50)}
                    local idx = 1
                    local newColor = colors[idx % #colors + 1]
                    colorDisplay.BackgroundColor3 = newColor
                    if callback then callback(newColor) end
                end)
                return colorDisplay
            end

            function section:AddKeybind(label, defaultKey, callback)
                local keyFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                })
                local labelText = create("TextLabel", {
                    Parent = keyFrame,
                    BackgroundTransparency = 1,
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, -120, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local keyBtn = create("TextButton", {
                    Parent = keyFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    Size = UDim2.new(0, 120, 1, 0),
                    Position = UDim2.new(1, -120, 0, 0),
                    Text = tostring(defaultKey),
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    AutoButtonColor = false,
                })
                create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = keyBtn })
                local waiting = false
                keyBtn.MouseButton1Click:Connect(function()
                    waiting = true
                    keyBtn.Text = "..."
                    local connection
                    connection = UserInputService.InputBegan:Connect(function(input)
                        if waiting then
                            local key = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode or input.UserInputType
                            if key ~= Enum.KeyCode.Unknown then
                                keyBtn.Text = tostring(key):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", "")
                                waiting = false
                                if callback then callback(key) end
                                connection:Disconnect()
                            end
                        end
                    end)
                end)
                return keyBtn
            end

            function section:AddTextbox(label, placeholder, callback)
                local boxFrame = create("Frame", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 32),
                })
                local labelText = create("TextLabel", {
                    Parent = boxFrame,
                    BackgroundTransparency = 1,
                    Text = label,
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, -120, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local box = create("TextBox", {
                    Parent = boxFrame,
                    BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
                    Size = UDim2.new(0, 120, 1, 0),
                    Position = UDim2.new(1, -120, 0, 0),
                    PlaceholderText = placeholder or "",
                    Text = "",
                    TextColor3 = UI_SETTINGS.Theme.Text,
                    TextSize = UI_SETTINGS.FontSizeNormal,
                    Font = UI_SETTINGS.Font,
                    ClearTextOnFocus = false,
                })
                create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = box })
                box.FocusLost:Connect(function()
                    if callback then callback(box.Text) end
                end)
                return box
            end

            function section:AddLabel(text)
                local label = create("TextLabel", {
                    Parent = contentHolder,
                    BackgroundTransparency = 1,
                    Text = text,
                    TextColor3 = UI_SETTINGS.Theme.TextDim,
                    TextSize = UI_SETTINGS.FontSizeSmall,
                    Font = UI_SETTINGS.Font,
                    Size = UDim2.new(1, 0, 0, 20),
                })
                return label
            end

            return section
        end

        return tab
    end

    -- Notification system
    function window:Notify(title, desc, duration, type)
        type = type or "info"
        local notifHolder = screenGui:FindFirstChild("NotificationHolder")
        if not notifHolder then
            notifHolder = create("Frame", {
                Name = "NotificationHolder",
                Parent = screenGui,
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -310, 0, 20),
                Size = UDim2.new(0, 300, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
            })
            local notifLayout = create("UIListLayout", {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = notifHolder,
            })
        end
        local notif = create("Frame", {
            Parent = notifHolder,
            BackgroundColor3 = UI_SETTINGS.Theme.Secondary,
            BackgroundTransparency = 0.1,
            Size = UDim2.new(1, 0, 0, 60),
            AutomaticSize = Enum.AutomaticSize.Y,
        })
        create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = notif })
        create("UIStroke", { Color = UI_SETTINGS.Theme.Accent, Thickness = 1, Transparency = 0.5, Parent = notif })
        local titleLabel = create("TextLabel", {
            Parent = notif,
            BackgroundTransparency = 1,
            Text = title,
            TextColor3 = UI_SETTINGS.Theme.AccentGlow,
            TextSize = UI_SETTINGS.FontSizeNormal,
            Font = UI_SETTINGS.FontBold,
            Position = UDim2.new(0, 12, 0, 8),
            Size = UDim2.new(1, -24, 0, 20),
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        local descLabel = create("TextLabel", {
            Parent = notif,
            BackgroundTransparency = 1,
            Text = desc,
            TextColor3 = UI_SETTINGS.Theme.TextDim,
            TextSize = UI_SETTINGS.FontSizeSmall,
            Font = UI_SETTINGS.Font,
            Position = UDim2.new(0, 12, 0, 28),
            Size = UDim2.new(1, -24, 0, 20),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        })
        -- Animate in
        notif.Position = UDim2.new(1, 0, 0, 0)
        TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(1, -310, 0, 0)}):Play()
        task.delay(duration or 3, function()
            TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(1, 0, 0, 0)}):Play()
            task.delay(0.4, function() notif:Destroy() end)
        end)
    end

    -- Config saving (simple)
    function window:SaveConfig(name)
        local config = {}
        -- iterate all elements and collect state
        -- For demonstration, we'll just return placeholder
        local data = HttpService:JSONEncode(config)
        if writefile then
            writefile(name..".json", data)
        end
        return true
    end

    function window:LoadConfig(name)
        if readfile then
            local data = readfile(name..".json")
            if data then
                local config = HttpService:JSONDecode(data)
                -- apply
            end
        end
    end

    return window
end

-- Return library
return Library
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
