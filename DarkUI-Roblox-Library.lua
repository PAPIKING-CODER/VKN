-- MiLibreria.lua – Librería de UI para Roblox
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local Library = {}

local Theme = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}

local UIObjects = {}

local function ApplyTheme()
    for _, obj in ipairs(UIObjects) do
        if obj.ThemeKey and Theme[obj.ThemeKey] then
            obj.Object[obj.Property] = Theme[obj.ThemeKey]
        end
    end
end

local function RegisterThemeObject(object, themeKey, property)
    table.insert(UIObjects, { Object = object, ThemeKey = themeKey, Property = property or "BackgroundColor3" })
    if Theme[themeKey] then
        object[property or "BackgroundColor3"] = Theme[themeKey]
    end
end

function Library:New(title, assetId)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = title
    ScreenGui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 600, 0, 400)
    Main.Position = UDim2.new(0.5, -300, 0.5, -200)
    Main.BackgroundColor3 = Theme.Background
    Main.BorderSizePixel = 0
    Main.Parent = ScreenGui
    RegisterThemeObject(Main, "Background")

    -- arrastre
    local dragging, dragStart, startPos
    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    Main.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- barra superior
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Theme.Accent
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Main
    RegisterThemeObject(TopBar, "Accent")

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -60, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Theme.TextColor
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar
    RegisterThemeObject(TitleLabel, "TextColor", "TextColor3")

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.BackgroundColor3 = Theme.Accent
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Theme.TextColor
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextSize = 18
    CloseButton.Parent = TopBar
    CloseButton.MouseButton1Click:Connect(function() ScreenGui.Enabled = false end)
    RegisterThemeObject(CloseButton, "Accent")
    RegisterThemeObject(CloseButton, "TextColor", "TextColor3")

    -- pestañas
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(0, 100, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundColor3 = Theme.DarkContrast
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = Main
    RegisterThemeObject(TabContainer, "DarkContrast")
    Instance.new("UIListLayout", TabContainer).SortOrder = Enum.SortOrder.LayoutOrder

    -- páginas
    local PageContainer = Instance.new("Frame")
    PageContainer.Size = UDim2.new(1, -100, 1, -30)
    PageContainer.Position = UDim2.new(0, 100, 0, 30)
    PageContainer.BackgroundColor3 = Theme.LightContrast
    PageContainer.BorderSizePixel = 0
    PageContainer.Parent = Main
    RegisterThemeObject(PageContainer, "LightContrast")

    local Pages = {}
    local NotifHolder = Instance.new("Frame")
    NotifHolder.Size = UDim2.new(0, 300, 1, 0)
    NotifHolder.Position = UDim2.new(1, -310, 0, 10)
    NotifHolder.BackgroundTransparency = 1
    NotifHolder.Parent = ScreenGui
    Instance.new("UIListLayout", NotifHolder).Padding = UDim.new(0, 5)

    local Lib = {}
    Lib.ScreenGui = ScreenGui
    Lib.Pages = Pages

    function Lib:AddPage(name, assetId)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.BackgroundColor3 = Theme.DarkContrast
        TabButton.Text = name
        TabButton.TextColor3 = Theme.TextColor
        TabButton.Font = Enum.Font.SourceSans
        TabButton.TextSize = 14
        TabButton.Parent = TabContainer
        RegisterThemeObject(TabButton, "DarkContrast")
        RegisterThemeObject(TabButton, "TextColor", "TextColor3")

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 4
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Parent = PageContainer
        Page.Visible = (#Pages == 0)
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 5)

        table.insert(Pages, { Page = Page, Button = TabButton })
        TabButton.MouseButton1Click:Connect(function()
            for _, p in ipairs(Pages) do p.Page.Visible = false end
            Page.Visible = true
        end)

        local PageObj = {}
        PageObj.Page = Page

        function PageObj:AddSection(name)
            local Section = Instance.new("Frame")
            Section.Size = UDim2.new(1, -10, 0, 30)
            Section.Position = UDim2.new(0, 5, 0, 5)
            Section.BackgroundColor3 = Theme.DarkContrast
            Section.BorderSizePixel = 0
            Section.Parent = Page
            RegisterThemeObject(Section, "DarkContrast")

            local Title = Instance.new("TextLabel", Section)
            Title.Size = UDim2.new(1, 0, 0, 20)
            Title.BackgroundTransparency = 1
            Title.Text = name
            Title.TextColor3 = Theme.TextColor
            Title.Font = Enum.Font.SourceSansBold
            Title.TextSize = 14
            RegisterThemeObject(Title, "TextColor", "TextColor3")

            local Content = Instance.new("Frame", Section)
            Content.Size = UDim2.new(1, 0, 0, 0)
            Content.Position = UDim2.new(0, 0, 0, 22)
            Content.BackgroundTransparency = 1
            Instance.new("UIListLayout", Content).Padding = UDim.new(0, 3)

            local function resize()
                local h = 22
                for _, c in ipairs(Content:GetChildren()) do
                    if c:IsA("Frame") or c:IsA("TextButton") then h = h + c.AbsoluteSize.Y + 3 end
                end
                Section.Size = UDim2.new(1, -10, 0, h + 5)
                local canvasH = 0
                for _, s in ipairs(Page:GetChildren()) do
                    if s:IsA("Frame") and s ~= Content then canvasH = canvasH + s.Size.Y.Offset + 5 end
                end
                Page.CanvasSize = UDim2.new(0, 0, 0, canvasH)
            end

            local sec = {}
            sec.Section = Section
            sec.Content = Content

            function sec:AddToggle(text, default, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local lbl = Instance.new("TextLabel", frame)
                lbl.Size = UDim2.new(1, -40, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = text
                lbl.TextColor3 = Theme.TextColor
                lbl.Font = Enum.Font.SourceSans
                lbl.TextSize = 14
                RegisterThemeObject(lbl, "TextColor", "TextColor3")

                local ind = Instance.new("Frame", frame)
                ind.Size = UDim2.new(0, 20, 0, 20)
                ind.Position = UDim2.new(1, -25, 0.5, -10)
                ind.BackgroundColor3 = default and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                ind.BorderSizePixel = 0

                local state = default or false
                local function set(v)
                    state = v
                    ind.BackgroundColor3 = state and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                    if callback then callback(state) end
                end
                ind.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then set(not state) end end)
                lbl.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then set(not state) end end)
                resize()
            end

            function sec:AddButton(text, callback)
                local btn = Instance.new("TextButton", Content)
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.BackgroundColor3 = Theme.LightContrast
                btn.Text = text
                btn.TextColor3 = Theme.TextColor
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                RegisterThemeObject(btn, "LightContrast")
                RegisterThemeObject(btn, "TextColor", "TextColor3")
                btn.MouseButton1Click:Connect(function() if callback then callback() end end)
                resize()
            end

            function sec:AddTextbox(placeholder, default, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")
                local box = Instance.new("TextBox", frame)
                box.Size = UDim2.new(1, -10, 0, 25)
                box.Position = UDim2.new(0, 5, 0, 2)
                box.BackgroundColor3 = Theme.DarkContrast
                box.Text = default or ""
                box.PlaceholderText = placeholder or ""
                box.TextColor3 = Theme.TextColor
                box.Font = Enum.Font.SourceSans
                box.TextSize = 14
                RegisterThemeObject(box, "DarkContrast")
                RegisterThemeObject(box, "TextColor", "TextColor3")
                box.FocusLost:Connect(function(ep) if callback then callback(box.Text, true) end end)
                resize()
            end

            function sec:AddSlider(text, default, min, max, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 40)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local lbl = Instance.new("TextLabel", frame)
                lbl.Size = UDim2.new(1, 0, 0, 16)
                lbl.BackgroundTransparency = 1
                lbl.Text = text .. ": " .. tostring(default)
                lbl.TextColor3 = Theme.TextColor
                lbl.Font = Enum.Font.SourceSans
                lbl.TextSize = 12
                RegisterThemeObject(lbl, "TextColor", "TextColor3")

                local bar = Instance.new("Frame", frame)
                bar.Size = UDim2.new(1, -10, 0, 10)
                bar.Position = UDim2.new(0, 5, 0, 20)
                bar.BackgroundColor3 = Theme.DarkContrast
                bar.BorderSizePixel = 0
                RegisterThemeObject(bar, "DarkContrast")

                local fill = Instance.new("Frame", bar)
                fill.Size = UDim2.new(0, 0, 1, 0)
                fill.BackgroundColor3 = Color3.fromRGB(0,120,255)
                fill.BorderSizePixel = 0

                local knob = Instance.new("Frame", bar)
                knob.Size = UDim2.new(0, 14, 0, 14)
                knob.Position = UDim2.new(0, -7, 0.5, -7)
                knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
                knob.BorderSizePixel = 0

                local val = default or min
                local function setVal(v)
                    val = math.clamp(v, min, max)
                    local scale = (val - min) / (max - min)
                    fill.Size = UDim2.new(scale, 0, 1, 0)
                    knob.Position = UDim2.new(scale, -7, 0.5, -7)
                    lbl.Text = text .. ": " .. tostring(val)
                    if callback then callback(val) end
                end
                local drag = false
                knob.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                UserInputService.InputChanged:Connect(function(input)
                    if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local mp = UserInputService:GetMouseLocation()
                        local barAbs = bar.AbsolutePosition
                        local barSizeX = bar.AbsoluteSize.X
                        local x = math.clamp(mp.X - barAbs.X, 0, barSizeX)
                        setVal(min + (max - min) * (x / barSizeX))
                    end
                end)
                UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
                setVal(val)
                resize()
            end

            function sec:AddDropdown(text, list, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local btn = Instance.new("TextButton", frame)
                btn.Size = UDim2.new(1, -10, 0, 28)
                btn.Position = UDim2.new(0, 5, 0, 1)
                btn.BackgroundColor3 = Theme.DarkContrast
                btn.Text = text
                btn.TextColor3 = Theme.TextColor
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                RegisterThemeObject(btn, "DarkContrast")
                RegisterThemeObject(btn, "TextColor", "TextColor3")

                local expand = Instance.new("Frame", frame)
                expand.Size = UDim2.new(1, -10, 0, 0)
                expand.Position = UDim2.new(0, 5, 0, 30)
                expand.BackgroundColor3 = Theme.DarkContrast
                expand.BorderSizePixel = 0
                expand.Visible = false
                RegisterThemeObject(expand, "DarkContrast")
                Instance.new("UIListLayout", expand).SortOrder = Enum.SortOrder.LayoutOrder

                local expanded = false
                btn.MouseButton1Click:Connect(function()
                    expanded = not expanded
                    expand.Visible = expanded
                    expand.Size = expanded and UDim2.new(1, -10, 0, #list * 25) or UDim2.new(1, -10, 0, 0)
                    frame.Size = UDim2.new(1, -10, 0, 30 + (expanded and #list * 25 or 0))
                    resize()
                end)
                for _, option in ipairs(list) do
                    local optBtn = Instance.new("TextButton", expand)
                    optBtn.Size = UDim2.new(1, 0, 0, 25)
                    optBtn.BackgroundColor3 = Theme.LightContrast
                    optBtn.Text = tostring(option)
                    optBtn.TextColor3 = Theme.TextColor
                    optBtn.Font = Enum.Font.SourceSans
                    optBtn.TextSize = 12
                    RegisterThemeObject(optBtn, "LightContrast")
                    RegisterThemeObject(optBtn, "TextColor", "TextColor3")
                    optBtn.MouseButton1Click:Connect(function()
                        btn.Text = text .. ": " .. tostring(option)
                        if callback then callback(option) end
                        expanded = false
                        expand.Visible = false
                        expand.Size = UDim2.new(1, -10, 0, 0)
                        frame.Size = UDim2.new(1, -10, 0, 30)
                        resize()
                    end)
                end
                resize()
            end

            function sec:AddColorPicker(text, defaultColor, callback)
                local default = defaultColor or Color3.fromRGB(255,255,255)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local preview = Instance.new("Frame", frame)
                preview.Size = UDim2.new(0, 20, 0, 20)
                preview.Position = UDim2.new(0, 5, 0.5, -10)
                preview.BackgroundColor3 = default
                preview.BorderSizePixel = 0

                local lblBtn = Instance.new("TextButton", frame)
                lblBtn.Size = UDim2.new(1, -35, 0, 28)
                lblBtn.Position = UDim2.new(0, 30, 0, 1)
                lblBtn.BackgroundColor3 = Theme.DarkContrast
                lblBtn.Text = text
                lblBtn.TextColor3 = Theme.TextColor
                lblBtn.Font = Enum.Font.SourceSans
                lblBtn.TextSize = 14
                RegisterThemeObject(lblBtn, "DarkContrast")
                RegisterThemeObject(lblBtn, "TextColor", "TextColor3")

                local dialog = Instance.new("Frame", frame)
                dialog.Size = UDim2.new(0, 200, 0, 120)
                dialog.Position = UDim2.new(0, 0, 1, 5)
                dialog.BackgroundColor3 = Theme.Background
                dialog.BorderSizePixel = 0
                dialog.Visible = false
                RegisterThemeObject(dialog, "Background")

                local function createSlider(letter, colorPart, yPos)
                    local cont = Instance.new("Frame", dialog)
                    cont.Size = UDim2.new(1, -20, 0, 25)
                    cont.Position = UDim2.new(0, 10, 0, yPos)
                    cont.BackgroundTransparency = 1

                    local l = Instance.new("TextLabel", cont)
                    l.Size = UDim2.new(0, 20, 1, 0)
                    l.Text = letter
                    l.TextColor3 = Theme.TextColor
                    l.BackgroundTransparency = 1
                    RegisterThemeObject(l, "TextColor", "TextColor3")

                    local bar = Instance.new("Frame", cont)
                    bar.Size = UDim2.new(1, -30, 0, 10)
                    bar.Position = UDim2.new(0, 25, 0.5, -5)
                    bar.BackgroundColor3 = Theme.DarkContrast
                    RegisterThemeObject(bar, "DarkContrast")
                    local f = Instance.new("Frame", bar)
                    f.Size = UDim2.new(0, 0, 1, 0)
                    f.BackgroundColor3 = colorPart
                    local k = Instance.new("Frame", bar)
                    k.Size = UDim2.new(0, 10, 0, 10)
                    k.Position = UDim2.new(0, -5, 0.5, -5)
                    k.BackgroundColor3 = Color3.fromRGB(255,255,255)

                    local val = (letter=="R" and default.R*255) or (letter=="G" and default.G*255) or default.B*255
                    local function upd(v)
                        val = math.clamp(math.floor(v), 0, 255)
                        local scale = val/255
                        f.Size = UDim2.new(scale, 0, 1, 0)
                        k.Position = UDim2.new(scale, -5, 0.5, -5)
                        local newCol = Color3.fromRGB(
                            letter=="R" and val or preview.BackgroundColor3.R*255,
                            letter=="G" and val or preview.BackgroundColor3.G*255,
                            letter=="B" and val or preview.BackgroundColor3.B*255
                        )
                        preview.BackgroundColor3 = newCol
                        if callback then callback(newCol) end
                    end
                    local drag = false
                    k.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                    bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                    UserInputService.InputChanged:Connect(function(input)
                        if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
                            local mp = UserInputService:GetMouseLocation()
                            local x = math.clamp(mp.X - bar.AbsolutePosition.X, 0, bar.AbsoluteSize.X)
                            upd(x / bar.AbsoluteSize.X * 255)
                        end
                    end)
                    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
                    upd(val)
                end
                createSlider("R", Color3.fromRGB(255,0,0), 10)
                createSlider("G", Color3.fromRGB(0,255,0), 45)
                createSlider("B", Color3.fromRGB(0,0,255), 80)

                lblBtn.MouseButton1Click:Connect(function()
                    dialog.Visible = not dialog.Visible
                    frame.Size = UDim2.new(1, -10, 0, 30 + (dialog.Visible and 130 or 0))
                    resize()
                end)
                resize()
            end

            function sec:AddKeybind(text, defaultKey, callback, changedCallback)
                local currentKey = defaultKey or Enum.KeyCode.One
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local btn = Instance.new("TextButton", frame)
                btn.Size = UDim2.new(1, -10, 0, 28)
                btn.Position = UDim2.new(0, 5, 0, 1)
                btn.BackgroundColor3 = Theme.DarkContrast
                btn.Text = text .. " [" .. currentKey.Name .. "]"
                btn.TextColor3 = Theme.TextColor
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                RegisterThemeObject(btn, "DarkContrast")
                RegisterThemeObject(btn, "TextColor", "TextColor3")

                local listening = false
                btn.MouseButton1Click:Connect(function() listening = true; btn.Text = text .. " ..." end)
                UserInputService.InputBegan:Connect(function(input, gp)
                    if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                        currentKey = input.KeyCode
                        btn.Text = text .. " [" .. currentKey.Name .. "]"
                        listening = false
                        if changedCallback then changedCallback(currentKey) end
                    elseif not listening and input.KeyCode == currentKey then
                        if callback then callback() end
                    end
                end)
                resize()
            end

            return sec
        end

        return PageObj
    end

    function Lib:Notify(title, message)
        local notif = Instance.new("Frame")
        notif.Size = UDim2.new(0, 280, 0, 50)
        notif.BackgroundColor3 = Theme.Accent
        notif.BorderSizePixel = 0
        notif.Parent = NotifHolder
        RegisterThemeObject(notif, "Accent")

        local t = Instance.new("TextLabel", notif)
        t.Size = UDim2.new(1, -10, 0, 20)
        t.Position = UDim2.new(0, 5, 0, 2)
        t.BackgroundTransparency = 1
        t.Text = title
        t.TextColor3 = Theme.TextColor
        t.Font = Enum.Font.SourceSansBold
        t.TextSize = 14
        t.TextXAlignment = Enum.TextXAlignment.Left
        RegisterThemeObject(t, "TextColor", "TextColor3")

        local m = Instance.new("TextLabel", notif)
        m.Size = UDim2.new(1, -10, 0, 20)
        m.Position = UDim2.new(0, 5, 0, 22)
        m.BackgroundTransparency = 1
        m.Text = message
        m.TextColor3 = Theme.TextColor
        m.Font = Enum.Font.SourceSans
        m.TextSize = 12
        m.TextXAlignment = Enum.TextXAlignment.Left
        RegisterThemeObject(m, "TextColor", "TextColor3")

        notif.Position = UDim2.new(1, 0, 0, -60)
        TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0, 0)}):Play()
        delay(3, function()
            local tween = TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(1, 0, 0, 0)})
            tween:Play()
            tween.Completed:Wait()
            notif:Destroy()
        end)
    end

    function Lib:SetTheme(key, color)
        if Theme[key] then
            Theme[key] = color
            ApplyTheme()
        end
    end

    function Lib:Toggle()
        ScreenGui.Enabled = not ScreenGui.Enabled
    end

    function Lib:SelectPage(pageObj, noAnim)
        for _, p in ipairs(Pages) do p.Page.Visible = false end
        if type(pageObj) == "number" and Pages[pageObj] then
            Pages[pageObj].Page.Visible = true
        elseif pageObj and pageObj.Page then
            pageObj.Page.Visible = true
        end
    end

    return Lib
end

return Library        Parent = Sidebar
    })

    local Author = Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 40),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].author,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 11,
        Parent = Sidebar
    })

    -- Menú Items (Main y Settings)
    local function CreateSidebarItem(text, yPos, active)
        local Container = Create("Frame", {
            Size = UDim2.new(0, 160, 0, 30),
            Position = UDim2.new(0, 10, 0, yPos),
            BackgroundColor3 = active and COLORS.Highlight or Color3.new(0,0,0),
            BackgroundTransparency = active and 0 or 1,
            Parent = Sidebar
        })
        if active then Round(Container, 8) end
        
        local Label = Create("TextLabel", {
            Size = UDim2.new(1,0,1,0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = active and COLORS.TextMain or COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 14,
            Parent = Container
        })
        return Container
    end

    local MainItem = CreateSidebarItem("  " .. TRANSLATIONS[LANG].main, 80, true)
    local SettingsItem = CreateSidebarItem("  ⚙️ " .. TRANSLATIONS[LANG].settings, 120, false)

    -- =============== PANEL PRINCIPAL (DERECHA) ===============
    local Panel = Create("Frame", {
        Size = UDim2.new(0, 460, 1, 0),
        Position = UDim2.new(0, 180, 0, 0),
        BackgroundColor3 = COLORS.PanelBg,
        Parent = MainFrame
    })

    -- Título "Interactive Elements"
    local PanelTitle = Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 25),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].title,
        TextColor3 = COLORS.TextMain,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 16,
        Parent = Panel
    })

    -- Subtítulo
    local PanelSub = Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 20),
        Position = UDim2.new(0, 20, 0, 45),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].subtitle,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 12,
        Parent = Panel
    })

    -- CONTENEDOR DE CONTROLES DINÁMICOS
    local ControlsContainer = Create("Frame", {
        Size = UDim2.new(1, -30, 0, 300),
        Position = UDim2.new(0, 15, 0, 70),
        BackgroundTransparency = 1,
        Parent = Panel
    })

    -- ==========================================================
    -- MÉTODOS DE LA LIBRERÍA
    -- ==========================================================
    local Methods = {}
    local yOffset = 0
    local layoutItems = {}

    -- 🔧 TOGGLE (Estilo verde exacto de la imagen)
    function Methods:AddToggle(labelText, defaultValue, callback)
        local Container = Create("Frame", {
            Size = UDim2.new(0, 200, 0, 35),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundColor3 = COLORS.ButtonBg,
            Parent = ControlsContainer
        })
        Round(Container, 18) -- Bordes redondeados del contenedor

        local Label = Create("TextLabel", {
            Size = UDim2.new(0.6, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 13,
            Parent = Container
        })
        table.insert(layoutItems, {type = "toggle", label = labelText, obj = Label})

        -- Switch y dot
        local Switch = Create("Frame", {
            Size = UDim2.new(0, 36, 0, 18),
            Position = UDim2.new(0, 130, 0.5, -9),
            BackgroundColor3 = defaultValue and COLORS.ToggleOn or COLORS.ToggleOff,
            Parent = Container,
            Active = true
        })
        Round(Switch, 9)

        local Dot = Create("Frame", {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(0, defaultValue and 20 or 2, 0.5, -7),
            BackgroundColor3 = COLORS.ToggleKnob,
            Parent = Switch
        })
        Round(Dot, 7)

        -- Lógica
        local state = defaultValue
        Switch.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                state = not state
                Dot.Position = UDim2.new(0, state and 20 or 2, 0.5, -7)
                Switch.BackgroundColor3 = state and COLORS.ToggleOn or COLORS.ToggleOff
                if callback then callback(state) end
            end
        end)

        yOffset = yOffset + 45
        return Container
    end

    -- 🔧 SLIDER (Estilo azul exacto de la imagen)
    function Methods:AddSlider(labelText, defaultValue, iconL, iconR, callback)
        local Container = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 50),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundTransparency = 1,
            Parent = ControlsContainer
        })

        local Label = Create("TextLabel", {
            Size = UDim2.new(0.5, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSansSemibold,
            TextSize = 13,
            Parent = Container
        })
        table.insert(layoutItems, {type = "slider", label = labelText, obj = Label})

        -- Pista del slider
        local Track = Create("Frame", {
            Size = UDim2.new(1, -40, 0, 4),
            Position = UDim2.new(0, 20, 0, 30),
            BackgroundColor3 = COLORS.SliderTrack,
            Parent = Container,
            Active = true
        })

        local Fill = Create("Frame", {
            Size = UDim2.new(defaultValue/100, 0, 1, 0),
            BackgroundColor3 = COLORS.SliderFill,
            Parent = Track
        })

        local Knob = Create("Frame", {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(defaultValue/100, -7, 0.5, -7),
            BackgroundColor3 = COLORS.SliderKnob,
            Parent = Track,
            Active = true
        })
        Round(Knob, 7)

        -- Iconos (Luna / Sol / Altavoces)
        local LeftIcon = Create("TextLabel", {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, 0, 0, 27),
            BackgroundTransparency = 1,
            Text = iconL or "🌙",
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 15,
            Parent = Container
        })
        local RightIcon = Create("TextLabel", {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(1, -16, 0, 27),
            BackgroundTransparency = 1,
            Text = iconR or "☀️",
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.SourceSans,
            TextSize = 15,
            Parent = Container
        })

        -- Lógica de arrastre
        local value = defaultValue
        Track.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local mousePos = game:GetService("UserInputService"):GetMouseLocation()
                    local relX = mousePos.X - Track.AbsolutePosition.X
                    local pct = math.clamp(relX / Track.AbsoluteSize.X, 0, 1)
                    value = math.floor(pct * 100)
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                    Knob.Position = UDim2.new(pct, -7, 0.5, -7)
                    if callback then callback(value) end
                end)
                input.InputEnded:Connect(function()
                    if connection then connection:Disconnect() end
                end)
            end
        end)

        yOffset = yOffset + 60
        return Container
    end

    -- 🔧 BOTÓN (Estilo minimalista de la imagen)
    function Methods:AddButton(labelText, iconOrImageId, callback)
        local Container = Create("Frame", {
            Size = UDim2.new(0, 200, 0, 35),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundColor3 = COLORS.ButtonBg,
            Parent = ControlsContainer,
            Active = true
        })
        Round(Container, 18)

        -- Icono (Imagen o Texto)
        if tonumber(iconOrImageId) then
            local Img = Create("ImageLabel", {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 15, 0.5, -8),
                BackgroundTransparency = 1,
                Image = "rbxassetid://" .. tostring(iconOrImageId),
                Parent = Container
            })
        else
            local Icon = Create("TextLabel", {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 10, 0.5, -8),
                BackgroundTransparency = 1,
                Text = iconOrImageId or "📦",
                TextColor3 = COLORS.TextMain,
                Font = Enum.Font.SourceSans,
                TextSize = 15,
                Parent = Container
            })
        end

        -- Etiqueta del botón
        local Lbl = Create("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.SourceSans,
            TextSize = 13,
            Parent = Container
        })
        table.insert(layoutItems, {type = "button", label = labelText, obj = Lbl})

        Container.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if callback then callback() end
            end
        end)

        yOffset = yOffset + 45
        return Container
    end

    -- 🔧 IDIOMA (Actualización de textos)
    function Methods:SetLanguage(newLang)
        if TRANSLATIONS[newLang] then
            LANG = newLang
            Title.Text = TRANSLATIONS[LANG].theme
            Author.Text = TRANSLATIONS[LANG].author
            MainItem:FindFirstChildOfClass("TextLabel").Text = "  " .. TRANSLATIONS[LANG].main
            SettingsItem:FindFirstChildOfClass("TextLabel").Text = "  ⚙️ " .. TRANSLATIONS[LANG].settings
            PanelTitle.Text = TRANSLATIONS[LANG].title
            PanelSub.Text = TRANSLATIONS[LANG].subtitle
            
            -- Actualizar controles dinámicos
            for _, item in ipairs(layoutItems) do
                if item.type == "toggle" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                elseif item.type == "slider" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                elseif item.type == "button" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                end
            end
        end
    end

    -- 🔧 ELIMINAR GUI
    function Methods:Destroy()
        ScreenGui:Destroy()
    end

    return Methods
end

return DarkUI    -- barra superior
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Theme.Accent
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Main
    RegisterThemeObject(TopBar, "Accent")

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -60, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Theme.TextColor
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar
    RegisterThemeObject(TitleLabel, "TextColor", "TextColor3")

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.BackgroundColor3 = Theme.Accent
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Theme.TextColor
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextSize = 18
    CloseButton.Parent = TopBar
    CloseButton.MouseButton1Click:Connect(function() ScreenGui.Enabled = false end)
    RegisterThemeObject(CloseButton, "Accent")
    RegisterThemeObject(CloseButton, "TextColor", "TextColor3")

    -- pestañas
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(0, 100, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundColor3 = Theme.DarkContrast
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = Main
    RegisterThemeObject(TabContainer, "DarkContrast")
    Instance.new("UIListLayout", TabContainer).SortOrder = Enum.SortOrder.LayoutOrder

    -- páginas
    local PageContainer = Instance.new("Frame")
    PageContainer.Size = UDim2.new(1, -100, 1, -30)
    PageContainer.Position = UDim2.new(0, 100, 0, 30)
    PageContainer.BackgroundColor3 = Theme.LightContrast
    PageContainer.BorderSizePixel = 0
    PageContainer.Parent = Main
    RegisterThemeObject(PageContainer, "LightContrast")

    local Pages = {}
    local NotifHolder = Instance.new("Frame")
    NotifHolder.Size = UDim2.new(0, 300, 1, 0)
    NotifHolder.Position = UDim2.new(1, -310, 0, 10)
    NotifHolder.BackgroundTransparency = 1
    NotifHolder.Parent = ScreenGui
    Instance.new("UIListLayout", NotifHolder).Padding = UDim.new(0, 5)

    local Lib = {}
    Lib.ScreenGui = ScreenGui
    Lib.Pages = Pages

    function Lib:AddPage(name, assetId)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.BackgroundColor3 = Theme.DarkContrast
        TabButton.Text = name
        TabButton.TextColor3 = Theme.TextColor
        TabButton.Font = Enum.Font.SourceSans
        TabButton.TextSize = 14
        TabButton.Parent = TabContainer
        RegisterThemeObject(TabButton, "DarkContrast")
        RegisterThemeObject(TabButton, "TextColor", "TextColor3")

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 4
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Parent = PageContainer
        Page.Visible = (#Pages == 0)
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 5)

        table.insert(Pages, { Page = Page, Button = TabButton })
        TabButton.MouseButton1Click:Connect(function()
            for _, p in ipairs(Pages) do p.Page.Visible = false end
            Page.Visible = true
        end)

        local PageObj = {}
        PageObj.Page = Page

        function PageObj:AddSection(name)
            local Section = Instance.new("Frame")
            Section.Size = UDim2.new(1, -10, 0, 30)
            Section.Position = UDim2.new(0, 5, 0, 5)
            Section.BackgroundColor3 = Theme.DarkContrast
            Section.BorderSizePixel = 0
            Section.Parent = Page
            RegisterThemeObject(Section, "DarkContrast")

            local Title = Instance.new("TextLabel", Section)
            Title.Size = UDim2.new(1, 0, 0, 20)
            Title.BackgroundTransparency = 1
            Title.Text = name
            Title.TextColor3 = Theme.TextColor
            Title.Font = Enum.Font.SourceSansBold
            Title.TextSize = 14
            RegisterThemeObject(Title, "TextColor", "TextColor3")

            local Content = Instance.new("Frame", Section)
            Content.Size = UDim2.new(1, 0, 0, 0)
            Content.Position = UDim2.new(0, 0, 0, 22)
            Content.BackgroundTransparency = 1
            Instance.new("UIListLayout", Content).Padding = UDim.new(0, 3)

            local function resize()
                local h = 22
                for _, c in ipairs(Content:GetChildren()) do
                    if c:IsA("Frame") or c:IsA("TextButton") then h = h + c.AbsoluteSize.Y + 3 end
                end
                Section.Size = UDim2.new(1, -10, 0, h + 5)
                local canvasH = 0
                for _, s in ipairs(Page:GetChildren()) do
                    if s:IsA("Frame") and s ~= Content then canvasH = canvasH + s.Size.Y.Offset + 5 end
                end
                Page.CanvasSize = UDim2.new(0, 0, 0, canvasH)
            end

            local sec = {}
            sec.Section = Section
            sec.Content = Content

            function sec:AddToggle(text, default, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local lbl = Instance.new("TextLabel", frame)
                lbl.Size = UDim2.new(1, -40, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = text
                lbl.TextColor3 = Theme.TextColor
                lbl.Font = Enum.Font.SourceSans
                lbl.TextSize = 14
                RegisterThemeObject(lbl, "TextColor", "TextColor3")

                local ind = Instance.new("Frame", frame)
                ind.Size = UDim2.new(0, 20, 0, 20)
                ind.Position = UDim2.new(1, -25, 0.5, -10)
                ind.BackgroundColor3 = default and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                ind.BorderSizePixel = 0

                local state = default or false
                local function set(v)
                    state = v
                    ind.BackgroundColor3 = state and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                    if callback then callback(state) end
                end
                ind.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then set(not state) end end)
                lbl.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then set(not state) end end)
                resize()
            end

            function sec:AddButton(text, callback)
                local btn = Instance.new("TextButton", Content)
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.BackgroundColor3 = Theme.LightContrast
                btn.Text = text
                btn.TextColor3 = Theme.TextColor
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                RegisterThemeObject(btn, "LightContrast")
                RegisterThemeObject(btn, "TextColor", "TextColor3")
                btn.MouseButton1Click:Connect(function() if callback then callback() end end)
                resize()
            end

            function sec:AddTextbox(placeholder, default, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")
                local box = Instance.new("TextBox", frame)
                box.Size = UDim2.new(1, -10, 0, 25)
                box.Position = UDim2.new(0, 5, 0, 2)
                box.BackgroundColor3 = Theme.DarkContrast
                box.Text = default or ""
                box.PlaceholderText = placeholder or ""
                box.TextColor3 = Theme.TextColor
                box.Font = Enum.Font.SourceSans
                box.TextSize = 14
                RegisterThemeObject(box, "DarkContrast")
                RegisterThemeObject(box, "TextColor", "TextColor3")
                box.FocusLost:Connect(function(ep) if callback then callback(box.Text, true) end end)
                resize()
            end

            function sec:AddSlider(text, default, min, max, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 40)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local lbl = Instance.new("TextLabel", frame)
                lbl.Size = UDim2.new(1, 0, 0, 16)
                lbl.BackgroundTransparency = 1
                lbl.Text = text .. ": " .. tostring(default)
                lbl.TextColor3 = Theme.TextColor
                lbl.Font = Enum.Font.SourceSans
                lbl.TextSize = 12
                RegisterThemeObject(lbl, "TextColor", "TextColor3")

                local bar = Instance.new("Frame", frame)
                bar.Size = UDim2.new(1, -10, 0, 10)
                bar.Position = UDim2.new(0, 5, 0, 20)
                bar.BackgroundColor3 = Theme.DarkContrast
                bar.BorderSizePixel = 0
                RegisterThemeObject(bar, "DarkContrast")

                local fill = Instance.new("Frame", bar)
                fill.Size = UDim2.new(0, 0, 1, 0)
                fill.BackgroundColor3 = Color3.fromRGB(0,120,255)
                fill.BorderSizePixel = 0

                local knob = Instance.new("Frame", bar)
                knob.Size = UDim2.new(0, 14, 0, 14)
                knob.Position = UDim2.new(0, -7, 0.5, -7)
                knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
                knob.BorderSizePixel = 0

                local val = default or min
                local function setVal(v)
                    val = math.clamp(v, min, max)
                    local scale = (val - min) / (max - min)
                    fill.Size = UDim2.new(scale, 0, 1, 0)
                    knob.Position = UDim2.new(scale, -7, 0.5, -7)
                    lbl.Text = text .. ": " .. tostring(val)
                    if callback then callback(val) end
                end
                local drag = false
                knob.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                UserInputService.InputChanged:Connect(function(input)
                    if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local mp = UserInputService:GetMouseLocation()
                        local barAbs = bar.AbsolutePosition
                        local barSizeX = bar.AbsoluteSize.X
                        local x = math.clamp(mp.X - barAbs.X, 0, barSizeX)
                        setVal(min + (max - min) * (x / barSizeX))
                    end
                end)
                UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
                setVal(val)
                resize()
            end

            function sec:AddDropdown(text, list, callback)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local btn = Instance.new("TextButton", frame)
                btn.Size = UDim2.new(1, -10, 0, 28)
                btn.Position = UDim2.new(0, 5, 0, 1)
                btn.BackgroundColor3 = Theme.DarkContrast
                btn.Text = text
                btn.TextColor3 = Theme.TextColor
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                RegisterThemeObject(btn, "DarkContrast")
                RegisterThemeObject(btn, "TextColor", "TextColor3")

                local expand = Instance.new("Frame", frame)
                expand.Size = UDim2.new(1, -10, 0, 0)
                expand.Position = UDim2.new(0, 5, 0, 30)
                expand.BackgroundColor3 = Theme.DarkContrast
                expand.BorderSizePixel = 0
                expand.Visible = false
                RegisterThemeObject(expand, "DarkContrast")
                Instance.new("UIListLayout", expand).SortOrder = Enum.SortOrder.LayoutOrder

                local expanded = false
                btn.MouseButton1Click:Connect(function()
                    expanded = not expanded
                    expand.Visible = expanded
                    expand.Size = expanded and UDim2.new(1, -10, 0, #list * 25) or UDim2.new(1, -10, 0, 0)
                    frame.Size = UDim2.new(1, -10, 0, 30 + (expanded and #list * 25 or 0))
                    resize()
                end)
                for _, option in ipairs(list) do
                    local optBtn = Instance.new("TextButton", expand)
                    optBtn.Size = UDim2.new(1, 0, 0, 25)
                    optBtn.BackgroundColor3 = Theme.LightContrast
                    optBtn.Text = tostring(option)
                    optBtn.TextColor3 = Theme.TextColor
                    optBtn.Font = Enum.Font.SourceSans
                    optBtn.TextSize = 12
                    RegisterThemeObject(optBtn, "LightContrast")
                    RegisterThemeObject(optBtn, "TextColor", "TextColor3")
                    optBtn.MouseButton1Click:Connect(function()
                        btn.Text = text .. ": " .. tostring(option)
                        if callback then callback(option) end
                        expanded = false
                        expand.Visible = false
                        expand.Size = UDim2.new(1, -10, 0, 0)
                        frame.Size = UDim2.new(1, -10, 0, 30)
                        resize()
                    end)
                end
                resize()
            end

            function sec:AddColorPicker(text, defaultColor, callback)
                local default = defaultColor or Color3.fromRGB(255,255,255)
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local preview = Instance.new("Frame", frame)
                preview.Size = UDim2.new(0, 20, 0, 20)
                preview.Position = UDim2.new(0, 5, 0.5, -10)
                preview.BackgroundColor3 = default
                preview.BorderSizePixel = 0

                local lblBtn = Instance.new("TextButton", frame)
                lblBtn.Size = UDim2.new(1, -35, 0, 28)
                lblBtn.Position = UDim2.new(0, 30, 0, 1)
                lblBtn.BackgroundColor3 = Theme.DarkContrast
                lblBtn.Text = text
                lblBtn.TextColor3 = Theme.TextColor
                lblBtn.Font = Enum.Font.SourceSans
                lblBtn.TextSize = 14
                RegisterThemeObject(lblBtn, "DarkContrast")
                RegisterThemeObject(lblBtn, "TextColor", "TextColor3")

                local dialog = Instance.new("Frame", frame)
                dialog.Size = UDim2.new(0, 200, 0, 120)
                dialog.Position = UDim2.new(0, 0, 1, 5)
                dialog.BackgroundColor3 = Theme.Background
                dialog.BorderSizePixel = 0
                dialog.Visible = false
                RegisterThemeObject(dialog, "Background")

                local function createSlider(letter, colorPart, yPos)
                    local cont = Instance.new("Frame", dialog)
                    cont.Size = UDim2.new(1, -20, 0, 25)
                    cont.Position = UDim2.new(0, 10, 0, yPos)
                    cont.BackgroundTransparency = 1

                    local l = Instance.new("TextLabel", cont)
                    l.Size = UDim2.new(0, 20, 1, 0)
                    l.Text = letter
                    l.TextColor3 = Theme.TextColor
                    l.BackgroundTransparency = 1
                    RegisterThemeObject(l, "TextColor", "TextColor3")

                    local bar = Instance.new("Frame", cont)
                    bar.Size = UDim2.new(1, -30, 0, 10)
                    bar.Position = UDim2.new(0, 25, 0.5, -5)
                    bar.BackgroundColor3 = Theme.DarkContrast
                    RegisterThemeObject(bar, "DarkContrast")
                    local f = Instance.new("Frame", bar)
                    f.Size = UDim2.new(0, 0, 1, 0)
                    f.BackgroundColor3 = colorPart
                    local k = Instance.new("Frame", bar)
                    k.Size = UDim2.new(0, 10, 0, 10)
                    k.Position = UDim2.new(0, -5, 0.5, -5)
                    k.BackgroundColor3 = Color3.fromRGB(255,255,255)

                    local val = (letter=="R" and default.R*255) or (letter=="G" and default.G*255) or default.B*255
                    local function upd(v)
                        val = math.clamp(math.floor(v), 0, 255)
                        local scale = val/255
                        f.Size = UDim2.new(scale, 0, 1, 0)
                        k.Position = UDim2.new(scale, -5, 0.5, -5)
                        local newCol = Color3.fromRGB(
                            letter=="R" and val or preview.BackgroundColor3.R*255,
                            letter=="G" and val or preview.BackgroundColor3.G*255,
                            letter=="B" and val or preview.BackgroundColor3.B*255
                        )
                        preview.BackgroundColor3 = newCol
                        if callback then callback(newCol) end
                    end
                    local drag = false
                    k.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                    bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
                    UserInputService.InputChanged:Connect(function(input)
                        if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
                            local mp = UserInputService:GetMouseLocation()
                            local x = math.clamp(mp.X - bar.AbsolutePosition.X, 0, bar.AbsoluteSize.X)
                            upd(x / bar.AbsoluteSize.X * 255)
                        end
                    end)
                    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
                    upd(val)
                end
                createSlider("R", Color3.fromRGB(255,0,0), 10)
                createSlider("G", Color3.fromRGB(0,255,0), 45)
                createSlider("B", Color3.fromRGB(0,0,255), 80)

                lblBtn.MouseButton1Click:Connect(function()
                    dialog.Visible = not dialog.Visible
                    frame.Size = UDim2.new(1, -10, 0, 30 + (dialog.Visible and 130 or 0))
                    resize()
                end)
                resize()
            end

            function sec:AddKeybind(text, defaultKey, callback, changedCallback)
                local currentKey = defaultKey or Enum.KeyCode.One
                local frame = Instance.new("Frame", Content)
                frame.Size = UDim2.new(1, -10, 0, 30)
                frame.BackgroundColor3 = Theme.LightContrast
                frame.BorderSizePixel = 0
                RegisterThemeObject(frame, "LightContrast")

                local btn = Instance.new("TextButton", frame)
                btn.Size = UDim2.new(1, -10, 0, 28)
                btn.Position = UDim2.new(0, 5, 0, 1)
                btn.BackgroundColor3 = Theme.DarkContrast
                btn.Text = text .. " [" .. currentKey.Name .. "]"
                btn.TextColor3 = Theme.TextColor
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                RegisterThemeObject(btn, "DarkContrast")
                RegisterThemeObject(btn, "TextColor", "TextColor3")

                local listening = false
                btn.MouseButton1Click:Connect(function() listening = true; btn.Text = text .. " ..." end)
                UserInputService.InputBegan:Connect(function(input, gp)
                    if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                        currentKey = input.KeyCode
                        btn.Text = text .. " [" .. currentKey.Name .. "]"
                        listening = false
                        if changedCallback then changedCallback(currentKey) end
                    elseif not listening and input.KeyCode == currentKey then
                        if callback then callback() end
                    end
                end)
                resize()
            end

            return sec
        end

        return PageObj
    end

    function Lib:Notify(title, message)
        local notif = Instance.new("Frame")
        notif.Size = UDim2.new(0, 280, 0, 50)
        notif.BackgroundColor3 = Theme.Accent
        notif.BorderSizePixel = 0
        notif.Parent = NotifHolder
        RegisterThemeObject(notif, "Accent")

        local t = Instance.new("TextLabel", notif)
        t.Size = UDim2.new(1, -10, 0, 20)
        t.Position = UDim2.new(0, 5, 0, 2)
        t.BackgroundTransparency = 1
        t.Text = title
        t.TextColor3 = Theme.TextColor
        t.Font = Enum.Font.SourceSansBold
        t.TextSize = 14
        t.TextXAlignment = Enum.TextXAlignment.Left
        RegisterThemeObject(t, "TextColor", "TextColor3")

        local m = Instance.new("TextLabel", notif)
        m.Size = UDim2.new(1, -10, 0, 20)
        m.Position = UDim2.new(0, 5, 0, 22)
        m.BackgroundTransparency = 1
        m.Text = message
        m.TextColor3 = Theme.TextColor
        m.Font = Enum.Font.SourceSans
        m.TextSize = 12
        m.TextXAlignment = Enum.TextXAlignment.Left
        RegisterThemeObject(m, "TextColor", "TextColor3")

        notif.Position = UDim2.new(1, 0, 0, -60)
        TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0, 0)}):Play()
        delay(3, function()
            local tween = TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(1, 0, 0, 0)})
            tween:Play()
            tween.Completed:Wait()
            notif:Destroy()
        end)
    end

    function Lib:SetTheme(key, color)
        if Theme[key] then
            Theme[key] = color
            ApplyTheme()
        end
    end

    function Lib:Toggle()
        ScreenGui.Enabled = not ScreenGui.Enabled
    end

    function Lib:SelectPage(pageObj, noAnim)
        for _, p in ipairs(Pages) do p.Page.Visible = false end
        if type(pageObj) == "number" and Pages[pageObj] then
            Pages[pageObj].Page.Visible = true
        elseif pageObj and pageObj.Page then
            pageObj.Page.Visible = true
        end
    end

    return Lib
end

return Library        Parent = Sidebar
    })

    local Author = Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 40),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].author,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 11,
        Parent = Sidebar
    })

    -- Menú Items (Main y Settings)
    local function CreateSidebarItem(text, yPos, active)
        local Container = Create("Frame", {
            Size = UDim2.new(0, 160, 0, 30),
            Position = UDim2.new(0, 10, 0, yPos),
            BackgroundColor3 = active and COLORS.Highlight or Color3.new(0,0,0),
            BackgroundTransparency = active and 0 or 1,
            Parent = Sidebar
        })
        if active then Round(Container, 8) end
        
        local Label = Create("TextLabel", {
            Size = UDim2.new(1,0,1,0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = active and COLORS.TextMain or COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 14,
            Parent = Container
        })
        return Container
    end

    local MainItem = CreateSidebarItem("  " .. TRANSLATIONS[LANG].main, 80, true)
    local SettingsItem = CreateSidebarItem("  ⚙️ " .. TRANSLATIONS[LANG].settings, 120, false)

    -- =============== PANEL PRINCIPAL (DERECHA) ===============
    local Panel = Create("Frame", {
        Size = UDim2.new(0, 460, 1, 0),
        Position = UDim2.new(0, 180, 0, 0),
        BackgroundColor3 = COLORS.PanelBg,
        Parent = MainFrame
    })

    -- Título "Interactive Elements"
    local PanelTitle = Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 25),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].title,
        TextColor3 = COLORS.TextMain,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 16,
        Parent = Panel
    })

    -- Subtítulo
    local PanelSub = Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 20),
        Position = UDim2.new(0, 20, 0, 45),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].subtitle,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 12,
        Parent = Panel
    })

    -- CONTENEDOR DE CONTROLES DINÁMICOS
    local ControlsContainer = Create("Frame", {
        Size = UDim2.new(1, -30, 0, 300),
        Position = UDim2.new(0, 15, 0, 70),
        BackgroundTransparency = 1,
        Parent = Panel
    })

    -- ==========================================================
    -- MÉTODOS DE LA LIBRERÍA
    -- ==========================================================
    local Methods = {}
    local yOffset = 0
    local layoutItems = {}

    -- 🔧 TOGGLE (Estilo verde exacto de la imagen)
    function Methods:AddToggle(labelText, defaultValue, callback)
        local Container = Create("Frame", {
            Size = UDim2.new(0, 200, 0, 35),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundColor3 = COLORS.ButtonBg,
            Parent = ControlsContainer
        })
        Round(Container, 18) -- Bordes redondeados del contenedor

        local Label = Create("TextLabel", {
            Size = UDim2.new(0.6, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 13,
            Parent = Container
        })
        table.insert(layoutItems, {type = "toggle", label = labelText, obj = Label})

        -- Switch y dot
        local Switch = Create("Frame", {
            Size = UDim2.new(0, 36, 0, 18),
            Position = UDim2.new(0, 130, 0.5, -9),
            BackgroundColor3 = defaultValue and COLORS.ToggleOn or COLORS.ToggleOff,
            Parent = Container,
            Active = true
        })
        Round(Switch, 9)

        local Dot = Create("Frame", {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(0, defaultValue and 20 or 2, 0.5, -7),
            BackgroundColor3 = COLORS.ToggleKnob,
            Parent = Switch
        })
        Round(Dot, 7)

        -- Lógica
        local state = defaultValue
        Switch.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                state = not state
                Dot.Position = UDim2.new(0, state and 20 or 2, 0.5, -7)
                Switch.BackgroundColor3 = state and COLORS.ToggleOn or COLORS.ToggleOff
                if callback then callback(state) end
            end
        end)

        yOffset = yOffset + 45
        return Container
    end

    -- 🔧 SLIDER (Estilo azul exacto de la imagen)
    function Methods:AddSlider(labelText, defaultValue, iconL, iconR, callback)
        local Container = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 50),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundTransparency = 1,
            Parent = ControlsContainer
        })

        local Label = Create("TextLabel", {
            Size = UDim2.new(0.5, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSansSemibold,
            TextSize = 13,
            Parent = Container
        })
        table.insert(layoutItems, {type = "slider", label = labelText, obj = Label})

        -- Pista del slider
        local Track = Create("Frame", {
            Size = UDim2.new(1, -40, 0, 4),
            Position = UDim2.new(0, 20, 0, 30),
            BackgroundColor3 = COLORS.SliderTrack,
            Parent = Container,
            Active = true
        })

        local Fill = Create("Frame", {
            Size = UDim2.new(defaultValue/100, 0, 1, 0),
            BackgroundColor3 = COLORS.SliderFill,
            Parent = Track
        })

        local Knob = Create("Frame", {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(defaultValue/100, -7, 0.5, -7),
            BackgroundColor3 = COLORS.SliderKnob,
            Parent = Track,
            Active = true
        })
        Round(Knob, 7)

        -- Iconos (Luna / Sol / Altavoces)
        local LeftIcon = Create("TextLabel", {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, 0, 0, 27),
            BackgroundTransparency = 1,
            Text = iconL or "🌙",
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 15,
            Parent = Container
        })
        local RightIcon = Create("TextLabel", {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(1, -16, 0, 27),
            BackgroundTransparency = 1,
            Text = iconR or "☀️",
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.SourceSans,
            TextSize = 15,
            Parent = Container
        })

        -- Lógica de arrastre
        local value = defaultValue
        Track.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local mousePos = game:GetService("UserInputService"):GetMouseLocation()
                    local relX = mousePos.X - Track.AbsolutePosition.X
                    local pct = math.clamp(relX / Track.AbsoluteSize.X, 0, 1)
                    value = math.floor(pct * 100)
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                    Knob.Position = UDim2.new(pct, -7, 0.5, -7)
                    if callback then callback(value) end
                end)
                input.InputEnded:Connect(function()
                    if connection then connection:Disconnect() end
                end)
            end
        end)

        yOffset = yOffset + 60
        return Container
    end

    -- 🔧 BOTÓN (Estilo minimalista de la imagen)
    function Methods:AddButton(labelText, iconOrImageId, callback)
        local Container = Create("Frame", {
            Size = UDim2.new(0, 200, 0, 35),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundColor3 = COLORS.ButtonBg,
            Parent = ControlsContainer,
            Active = true
        })
        Round(Container, 18)

        -- Icono (Imagen o Texto)
        if tonumber(iconOrImageId) then
            local Img = Create("ImageLabel", {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 15, 0.5, -8),
                BackgroundTransparency = 1,
                Image = "rbxassetid://" .. tostring(iconOrImageId),
                Parent = Container
            })
        else
            local Icon = Create("TextLabel", {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 10, 0.5, -8),
                BackgroundTransparency = 1,
                Text = iconOrImageId or "📦",
                TextColor3 = COLORS.TextMain,
                Font = Enum.Font.SourceSans,
                TextSize = 15,
                Parent = Container
            })
        end

        -- Etiqueta del botón
        local Lbl = Create("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.SourceSans,
            TextSize = 13,
            Parent = Container
        })
        table.insert(layoutItems, {type = "button", label = labelText, obj = Lbl})

        Container.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if callback then callback() end
            end
        end)

        yOffset = yOffset + 45
        return Container
    end

    -- 🔧 IDIOMA (Actualización de textos)
    function Methods:SetLanguage(newLang)
        if TRANSLATIONS[newLang] then
            LANG = newLang
            Title.Text = TRANSLATIONS[LANG].theme
            Author.Text = TRANSLATIONS[LANG].author
            MainItem:FindFirstChildOfClass("TextLabel").Text = "  " .. TRANSLATIONS[LANG].main
            SettingsItem:FindFirstChildOfClass("TextLabel").Text = "  ⚙️ " .. TRANSLATIONS[LANG].settings
            PanelTitle.Text = TRANSLATIONS[LANG].title
            PanelSub.Text = TRANSLATIONS[LANG].subtitle
            
            -- Actualizar controles dinámicos
            for _, item in ipairs(layoutItems) do
                if item.type == "toggle" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                elseif item.type == "slider" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                elseif item.type == "button" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                end
            end
        end
    end

    -- 🔧 ELIMINAR GUI
    function Methods:Destroy()
        ScreenGui:Destroy()
    end

    return Methods
end

return DarkUI
