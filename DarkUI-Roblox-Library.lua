-- ==========================================================
-- DARK UI LIBRARY v2.0 - DISEÑO IDÉNTICO A LA IMAGEN
-- ==========================================================
local DarkUI = {}

-- CONFIGURACIÓN DE COLORES
local COLORS = {
    MainBg = Color3.fromRGB(28, 28, 31),
    SidebarBg = Color3.fromRGB(22, 22, 24),
    PanelBg = Color3.fromRGB(37, 37, 43),
    Primary = Color3.fromRGB(59, 168, 245), -- Azul para sliders
    ToggleOn = Color3.fromRGB(59, 168, 245), -- Verde en la imagen
    ToggleOff = Color3.fromRGB(85, 85, 85),
    TextMain = Color3.fromRGB(224, 224, 224),
    TextMuted = Color3.fromRGB(136, 136, 136),
    ButtonBg = Color3.fromRGB(45, 45, 53),
    ActiveSidebar = Color3.fromRGB(42, 42, 48),
}

-- SISTEMA DE IDIOMAS (ES/EN)
local LANG = "es"
local TRANSLATIONS = {
    es = {
        theme = "Tema 'Oscuro'",
        author = "por /tgs",
        main = "Principal",
        settings = "Ajustes",
        title = "Elementos Interactivos",
        subtitle = "Demostración de nuevos componentes UI",
        autism = "Autismo",
        unload = "Descargar",
        brightness = "Control de Brillo",
        volume = "Ajustes de Volumen",
        save = "Guardar",
        reset = "Reiniciar"
    },
    en = {
        theme = "Theme 'Dark'",
        author = "by /tgs",
        main = "Main",
        settings = "Settings",
        title = "Interactive Elements",
        subtitle = "Demonstration of new UI components",
        autism = "Autism",
        unload = "Unload",
        brightness = "Brightness Control",
        volume = "Volume Settings",
        save = "Save",
        reset = "Reset"
    }
}

-- FUNCIONES AUXILIARES
local function CreateElement(class, props)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        if k == "Parent" then obj.Parent = v else obj[k] = v end
    end
    return obj
end

local function RoundRect(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = frame
end

-- ==========================================================
-- MÉTODO PRINCIPAL: CREAR VENTANA
-- ==========================================================
function DarkUI:CreateWindow()
    local screenGui = CreateElement("ScreenGui", {
        Name = "DarkUI_Window",
        ResetOnSpawn = false,
        Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    })

    -- OVERLAY (Fondo oscuro)
    local overlay = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0,0,0),
        BackgroundTransparency = 0.5,
        Parent = screenGui
    })

    -- VENTANA PRINCIPAL (680x400)
    local mainFrame = CreateElement("Frame", {
        Size = UDim2.new(0, 680, 0, 400),
        Position = UDim2.new(0.5, -340, 0.5, -200),
        BackgroundColor3 = COLORS.MainBg,
        BorderSizePixel = 0,
        Parent = screenGui,
        Active = true,
        Draggable = true
    })
    RoundRect(mainFrame, 12)

    -- =============== SIDEBAR (IZQUIERDA) ===============
    local sidebar = CreateElement("Frame", {
        Size = UDim2.new(0, 180, 1, 0),
        BackgroundColor3 = COLORS.SidebarBg,
        Parent = mainFrame
    })
    RoundRect(sidebar, 12)

    -- Título del tema
    local themeTitle = CreateElement("TextLabel", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 0, 20),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].theme,
        TextColor3 = COLORS.TextMain,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 16,
        Parent = sidebar
    })

    local author = CreateElement("TextLabel", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 45),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].author,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 12,
        Parent = sidebar
    })

    -- Botón Main (Activo)
    local mainBtn = CreateElement("Frame", {
        Size = UDim2.new(0, 160, 0, 30),
        Position = UDim2.new(0, 10, 0, 80),
        BackgroundColor3 = COLORS.ActiveSidebar,
        Parent = sidebar
    })
    RoundRect(mainBtn, 6)
    local mainText = CreateElement("TextLabel", {
        Size = UDim2.new(1,0,1,0),
        BackgroundTransparency = 1,
        Text = "🏠 " .. TRANSLATIONS[LANG].main,
        TextColor3 = COLORS.TextMain,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Parent = mainBtn
    })

    -- Botón Settings
    local settingsBtn = CreateElement("TextLabel", {
        Size = UDim2.new(0, 160, 0, 30),
        Position = UDim2.new(0, 10, 0, 120),
        BackgroundTransparency = 1,
        Text = "⚙️ " .. TRANSLATIONS[LANG].settings,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Parent = sidebar
    })

    -- =============== PANEL PRINCIPAL (DERECHA) ===============
    local panel = CreateElement("Frame", {
        Size = UDim2.new(0, 500, 1, 0),
        Position = UDim2.new(0, 180, 0, 0),
        BackgroundColor3 = COLORS.PanelBg,
        Parent = mainFrame
    })

    local title = CreateElement("TextLabel", {
        Size = UDim2.new(1, -30, 0, 30),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].title,
        TextColor3 = COLORS.TextMain,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 18,
        Parent = panel
    })

    local subtitle = CreateElement("TextLabel", {
        Size = UDim2.new(1, -30, 0, 20),
        Position = UDim2.new(0, 20, 0, 45),
        BackgroundTransparency = 1,
        Text = TRANSLATIONS[LANG].subtitle,
        TextColor3 = COLORS.TextMuted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSans,
        TextSize = 12,
        Parent = panel
    })

    -- CONTENEDOR DE CONTROLES DINÁMICOS
    local controlsContainer = CreateElement("Frame", {
        Size = UDim2.new(1, -40, 0, 300),
        Position = UDim2.new(0, 20, 0, 70),
        BackgroundTransparency = 1,
        Parent = panel
    })

    -- =============== SELECTOR DE IDIOMA FLOTANTE ===============
    local langBtn = CreateElement("TextButton", {
        Size = UDim2.new(0, 40, 0, 25),
        Position = UDim2.new(1, -50, 1, -35),
        BackgroundColor3 = Color3.fromRGB(0,0,0),
        BackgroundTransparency = 0.7,
        Text = LANG:upper(),
        TextColor3 = COLORS.TextMain,
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 12,
        Parent = mainFrame
    })
    RoundRect(langBtn, 10)

    -- Referencias para actualizar textos
    local guiRefs = {
        mainFrame = mainFrame,
        sidebar = sidebar,
        panel = panel,
        themeTitle = themeTitle,
        author = author,
        mainText = mainText,
        settingsBtn = settingsBtn,
        title = title,
        subtitle = subtitle,
        controlsContainer = controlsContainer,
        langBtn = langBtn,
        screenGui = screenGui
    }

    -- ==========================================================
    -- DEVOLVER MÉTODOS DE LA LIBRERÍA
    -- ==========================================================
    return DarkUI:CreateMethods(guiRefs)
end

-- ==========================================================
-- MÉTODOS DE CONTROLES
-- ==========================================================
function DarkUI:CreateMethods(refs)
    local methods = {}
    local yOffset = 0
    local layoutItems = {} -- Para actualización de idioma

    -- 🔧 TOGGLE (Verde en la imagen)
    function methods:AddToggle(label, defaultState, callback)
        local container = CreateElement("Frame", {
            Size = UDim2.new(0.45, 0, 0, 40),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundColor3 = COLORS.ButtonBg,
            Parent = refs.controlsContainer
        })
        RoundRect(container, 20)

        local lbl = CreateElement("TextLabel", {
            Size = UDim2.new(0.6, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = label,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 14,
            Parent = container
        })
        table.insert(layoutItems, {type = "toggleLabel", label = label, obj = lbl})

        local switch = CreateElement("Frame", {
            Size = UDim2.new(0, 38, 0, 20),
            Position = UDim2.new(0, container.AbsoluteSize.X - 50, 0.5, -10),
            BackgroundColor3 = defaultState and COLORS.ToggleOn or COLORS.ToggleOff,
            Parent = container,
            Active = true
        })
        RoundRect(switch, 10)

        local dot = CreateElement("Frame", {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, defaultState and 20 or 2, 0, 2),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            Parent = switch
        })
        RoundRect(dot, 8)

        local state = defaultState
        switch.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                state = not state
                dot.Position = state and UDim2.new(0,20,0,2) or UDim2.new(0,2,0,2)
                switch.BackgroundColor3 = state and COLORS.ToggleOn or COLORS.ToggleOff
                if callback then callback(state) end
            end
        end)

        yOffset = yOffset + 50
        return container
    end

    -- 🔧 SLIDER (Azul en la imagen)
    function methods:AddSlider(label, defaultValue, iconL, iconR, callback)
        local container = CreateElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundTransparency = 1,
            Parent = refs.controlsContainer
        })

        local lbl = CreateElement("TextLabel", {
            Size = UDim2.new(0.5, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = label,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSansSemibold,
            TextSize = 14,
            Parent = container
        })
        table.insert(layoutItems, {type = "sliderLabel", label = label, obj = lbl})

        local valueDisplay = CreateElement("TextLabel", {
            Size = UDim2.new(0.3, 0, 0, 20),
            Position = UDim2.new(0.7, 0, 0, 0),
            BackgroundTransparency = 1,
            Text = tostring(defaultValue),
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.SourceSans,
            TextSize = 12,
            Parent = container
        })

        local track = CreateElement("Frame", {
            Size = UDim2.new(1, -40, 0, 4),
            Position = UDim2.new(0, 20, 0, 30),
            BackgroundColor3 = Color3.fromRGB(59,59,69),
            Parent = container,
            Active = true
        })

        local fill = CreateElement("Frame", {
            Size = UDim2.new(defaultValue/100, 0, 1, 0),
            BackgroundColor3 = COLORS.Primary,
            Parent = track
        })

        local knob = CreateElement("Frame", {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(defaultValue/100, -7, 0.5, -7),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            Parent = track,
            Active = true
        })
        RoundRect(knob, 7)

        -- Íconos
        local iconLbl = CreateElement("TextLabel", {
            Size = UDim2.new(0, 20, 0, 20),
            Position = UDim2.new(0, 0, 0, 25),
            BackgroundTransparency = 1,
            Text = iconL or "🌙",
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.SourceSans,
            TextSize = 16,
            Parent = container
        })
        local iconRbl = CreateElement("TextLabel", {
            Size = UDim2.new(0, 20, 0, 20),
            Position = UDim2.new(1, -20, 0, 25),
            BackgroundTransparency = 1,
            Text = iconR or "☀️",
            TextColor3 = COLORS.TextMuted,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.SourceSans,
            TextSize = 16,
            Parent = container
        })

        -- Lógica de arrastre
        local value = defaultValue
        track.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local mousePos = game:GetService("UserInputService"):GetMouseLocation()
                    local relX = mousePos.X - track.AbsolutePosition.X
                    local pct = math.clamp(relX / track.AbsoluteSize.X, 0, 1)
                    value = math.floor(pct * 100)
                    fill.Size = UDim2.new(pct, 0, 1, 0)
                    knob.Position = UDim2.new(pct, -7, 0.5, -7)
                    valueDisplay.Text = tostring(value)
                    if callback then callback(value) end
                end)
                input.InputEnded:Connect(function()
                    if connection then connection:Disconnect() end
                end)
            end
        end)

        yOffset = yOffset + 50
        return container
    end

    -- 🔧 BOTÓN CON ÍCONO O IMAGEN
    function methods:AddButton(label, iconOrImageId, callback)
        local container = CreateElement("Frame", {
            Size = UDim2.new(0.45, 0, 0, 40),
            Position = UDim2.new(0, 0, 0, yOffset),
            BackgroundColor3 = COLORS.ButtonBg,
            Parent = refs.controlsContainer,
            Active = true
        })
        RoundRect(container, 20)

        -- Manejar íconos o imágenes
        if tonumber(iconOrImageId) then
            local img = CreateElement("ImageLabel", {
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 10, 0.5, -10),
                BackgroundTransparency = 1,
                Image = "rbxassetid://" .. tostring(iconOrImageId),
                Parent = container
            })
        else
            local icon = CreateElement("TextLabel", {
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 10, 0.5, -10),
                BackgroundTransparency = 1,
                Text = iconOrImageId or "📦",
                TextColor3 = COLORS.TextMain,
                Font = Enum.Font.SourceSans,
                TextSize = 16,
                Parent = container
            })
        end

        local btnLbl = CreateElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = label,
            TextColor3 = COLORS.TextMain,
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.SourceSans,
            TextSize = 14,
            Parent = container
        })
        table.insert(layoutItems, {type = "buttonLabel", label = label, obj = btnLbl})

        container.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if callback then callback() end
            end
        end)

        yOffset = yOffset + 50
        return container
    end

    -- 🔧 CAMBIAR IDIOMA
    function methods:SetLanguage(newLang)
        if TRANSLATIONS[newLang] then
            LANG = newLang
            refs.themeTitle.Text = TRANSLATIONS[LANG].theme
            refs.author.Text = TRANSLATIONS[LANG].author
            refs.mainText.Text = "🏠 " .. TRANSLATIONS[LANG].main
            refs.settingsBtn.Text = "⚙️ " .. TRANSLATIONS[LANG].settings
            refs.title.Text = TRANSLATIONS[LANG].title
            refs.subtitle.Text = TRANSLATIONS[LANG].subtitle
            refs.langBtn.Text = LANG:upper()
            -- Actualizar elementos dinámicos guardados
            for _, item in ipairs(layoutItems) do
                if item.type == "toggleLabel" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                elseif item.type == "sliderLabel" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                elseif item.type == "buttonLabel" then
                    item.obj.Text = TRANSLATIONS[LANG][item.label:lower()] or item.label
                end
            end
        end
    end

    -- 🔧 DESTRUIR GUI
    function methods:Destroy()
        refs.screenGui:Destroy()
    end

    -- Conectar botón de idioma flotante
    refs.langBtn.MouseButton1Click:Connect(function()
        local newLang = (LANG == "es") and "en" or "es"
        methods:SetLanguage(newLang)
    end)

    return methods
end

return DarkUI
