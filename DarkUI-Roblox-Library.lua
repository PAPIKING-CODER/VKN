-- Cargar la librería
local DarkUI = loadstring(game:HttpGet("https://pastebin.com/raw/YOUR_PASTEBIN_LINK"))() -- O require si es un ModuleScript

-- Crear la ventana (Diseño exacto de la imagen)
local Window = DarkUI:CreateWindow()

-- Si quieres cambiar el idioma desde el script:
-- DarkUI:SetLanguage("es")  -- Español
-- DarkUI:SetLanguage("en")  -- Inglés
-- (Nota: Esto requeriría modificar la librería para exponer SetLanguage)    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = frame
end

-- ==========================================================
-- CREACIÓN DE LA VENTANA PRINCIPAL
-- ==========================================================
function DarkUI:CreateWindow()
    local ScreenGui = Create("ScreenGui", {
        Name = "DarkUI_Window",
        ResetOnSpawn = false,
        Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    })

    -- FONDO OSCURO (Overlay)
    local Overlay = Create("Frame", {
        Size = UDim2.new(1,0,1,0),
        BackgroundColor3 = Color3.fromRGB(0,0,0),
        BackgroundTransparency = 0.5,
        Parent = ScreenGui
    })

    -- VENTANA PRINCIPAL (Tamaño exacto y posición centrada)
    local MainFrame = Create("Frame", {
        Size = UDim2.new(0, 640, 0, 380),
        Position = UDim2.new(0.5, -320, 0.5, -190),
        BackgroundColor3 = COLORS.MainBg,
        BorderSizePixel = 0,
        Parent = ScreenGui,
        Active = true,
        Draggable = true
    })
    Round(MainFrame, 12)

    -- =============== SIDEBAR (IZQUIERDA) ===============
    local Sidebar = Create("Frame", {
        Size = UDim2.new(0, 180, 1, 0),
        BackgroundColor3 = COLORS.SidebarBg,
        Parent = MainFrame
    })
    -- El sidebar tiene sus propias esquinas redondeadas a la izquierda
    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 12)
    SidebarCorner.Parent = Sidebar

    -- Título y Autor
    local Title = Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 0, 15),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].theme,
        TextColor3 = COLORS.TextMain,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 15,
        Parent = Sidebar
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
