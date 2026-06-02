local ui_options = {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(400, 300),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
}

do
	local imgui = game:GetService("CoreGui"):FindFirstChild("imgui")
	if imgui then imgui:Destroy() end
end

local imgui = Instance.new("ScreenGui")
local prefabs = Instance.new("Frame")
local label = Instance.new("TextLabel")
local window = Instance.new("ImageLabel")
local resizer = Instance.new("Frame")
local bar = Instance.new("Frame")
local toggle = Instance.new("ImageButton")
local base = Instance.new("ImageLabel")
local top = Instance.new("ImageLabel")
local tabs = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local tabSelection = Instance.new("ImageLabel")
local tabButtons = Instance.new("Frame")
local uiListLayout = Instance.new("UIListLayout")
local frame = Instance.new("Frame")
local tab = Instance.new("Frame")
local uiListLayout2 = Instance.new("UIListLayout")
local textBox = Instance.new("TextBox")
local textBoxRoundify4px = Instance.new("ImageLabel")
local slider = Instance.new("ImageLabel")
local sliderTitle = Instance.new("TextLabel")
local indicator = Instance.new("ImageLabel")
local sliderValue = Instance.new("TextLabel")
local textLabel = Instance.new("TextLabel")
local textLabel2 = Instance.new("TextLabel")
local circle = Instance.new("ImageLabel")
local uiListLayout3 = Instance.new("UIListLayout")
local dropdown = Instance.new("TextButton")
local dropdownIndicator = Instance.new("ImageLabel")
local dropdownBox = Instance.new("ImageButton")
local dropdownObjects = Instance.new("ScrollingFrame")
local uiListLayout4 = Instance.new("UIListLayout")
local textButtonRoundify4px = Instance.new("ImageLabel")
local tabButton = Instance.new("TextButton")
local textButtonRoundify4px_2 = Instance.new("ImageLabel")
local folder = Instance.new("ImageLabel")
local button = Instance.new("TextButton")
local textButtonRoundify4px_3 = Instance.new("ImageLabel")
local toggle2 = Instance.new("ImageLabel")
local objects2 = Instance.new("Frame")
local uiListLayout5 = Instance.new("UIListLayout")
local horizontalAlignment = Instance.new("Frame")
local uiListLayout6 = Instance.new("UIListLayout")
local console = Instance.new("ImageLabel")
local scrollingFrame = Instance.new("ScrollingFrame")
local source = Instance.new("TextBox")
local commentsLabel = Instance.new("TextLabel")
local globalsLabel = Instance.new("TextLabel")
local keywordsLabel = Instance.new("TextLabel")
local remoteHighlight = Instance.new("TextLabel")
local stringsLabel = Instance.new("TextLabel")
local tokensLabel = Instance.new("TextLabel")
local numbersLabel = Instance.new("TextLabel")
local infoLabel = Instance.new("TextLabel")
local linesLabel = Instance.new("TextLabel")
local colorPicker = Instance.new("ImageLabel")
local palette = Instance.new("ImageLabel")
local indicator3 = Instance.new("ImageLabel")
local sample = Instance.new("ImageLabel")
local saturation = Instance.new("ImageLabel")
local indicator4 = Instance.new("Frame")
local switchButton = Instance.new("TextButton")
local textButtonRoundify4px_4 = Instance.new("ImageLabel")
local title3Label = Instance.new("TextLabel")
local button2 = Instance.new("TextButton")
local textButtonRoundify4px_5 = Instance.new("ImageLabel")
local dropdownButton = Instance.new("TextButton")
local keybind = Instance.new("ImageLabel")
local title4Label = Instance.new("TextLabel")
local inputButton = Instance.new("TextButton")
local inputRoundify4px = Instance.new("ImageLabel")
local windowsFrame = Instance.new("Frame")
local cloneref = cloneref and cloneref or function(...) return ... end
local CoreGui= cloneref(game:GetService("CoreGui"))


imgui.Name = "imgui"
imgui.Parent = gethui and gethui() or (CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui"))
prefabs.Name = "Prefabs"
prefabs.Parent = imgui
prefabs.BackgroundColor3 = Color3.new(1, 1, 1)
prefabs.Size = UDim2.new(0, 100, 0, 100)
prefabs.Visible = false

label.Name = "Label"
label.Parent = prefabs
label.BackgroundColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 200, 0, 20)
label.Font = Enum.Font.GothamSemibold
label.Text = "Hello, world 123"
label.TextColor3 = Color3.new(1, 1, 1)
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left

window.Name = "Window"
window.Parent = prefabs
window.Active = true
window.BackgroundColor3 = Color3.new(1, 1, 1)
window.BackgroundTransparency = 1
window.ClipsDescendants = true
window.Position = UDim2.new(0, 20, 0, 20)
window.Selectable = true
window.Size = UDim2.new(0, 200, 0, 200)
window.Image = "rbxassetid://2851926732"
window.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
window.ScaleType = Enum.ScaleType.Slice
window.SliceCenter = Rect.new(12, 12, 12, 12)

resizer.Name = "Resizer"
resizer.Parent = window
resizer.Active = true
resizer.BackgroundColor3 = Color3.new(1, 1, 1)
resizer.BackgroundTransparency = 1
resizer.BorderSizePixel = 0
resizer.Position = UDim2.new(1, -20, 1, -20)
resizer.Size = UDim2.new(0, 20, 0, 20)

bar.Name = "Bar"
bar.Parent = window
bar.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
bar.BorderSizePixel = 0
bar.Position = UDim2.new(0, 0, 0, 5)
bar.Size = UDim2.new(1, 0, 0, 15)

toggle.Name = "Toggle"
toggle.Parent = bar
toggle.BackgroundColor3 = Color3.new(1, 1, 1)
toggle.BackgroundTransparency = 1
toggle.Position = UDim2.new(0, 5, 0, -2)
toggle.Rotation = 90
toggle.Size = UDim2.new(0, 20, 0, 20)
toggle.ZIndex = 2
toggle.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

base.Name = "Base"
base.Parent = bar
base.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
base.BorderSizePixel = 0
base.Position = UDim2.new(0, 0, 0.800000012, 0)
base.Size = UDim2.new(1, 0, 0, 10)
base.Image = "rbxassetid://2851926732"
base.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
base.ScaleType = Enum.ScaleType.Slice
base.SliceCenter = Rect.new(12, 12, 12, 12)

top.Name = "Top"
top.Parent = bar
top.BackgroundColor3 = Color3.new(1, 1, 1)
top.BackgroundTransparency = 1
top.Position = UDim2.new(0, 0, 0, -5)
top.Size = UDim2.new(1, 0, 0, 10)
top.Image = "rbxassetid://2851926732"
top.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
top.ScaleType = Enum.ScaleType.Slice
top.SliceCenter = Rect.new(12, 12, 12, 12)

tabs.Name = "Tabs"
tabs.Parent = window
tabs.BackgroundColor3 = Color3.new(1, 1, 1)
tabs.BackgroundTransparency = 1
tabs.Position = UDim2.new(0, 15, 0, 60)
tabs.Size = UDim2.new(1, -30, 1, -60)

titleLabel.Name = "Title"
titleLabel.Parent = window
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 30, 0, 3)
titleLabel.Size = UDim2.new(0, 200, 0, 20)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "Gamer Time"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

tabSelection.Name = "TabSelection"
tabSelection.Parent = window
tabSelection.BackgroundColor3 = Color3.new(1, 1, 1)
tabSelection.BackgroundTransparency = 1
tabSelection.Position = UDim2.new(0, 15, 0, 30)
tabSelection.Size = UDim2.new(1, -30, 0, 25)
tabSelection.Visible = false
tabSelection.Image = "rbxassetid://2851929490"
tabSelection.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
tabSelection.ScaleType = Enum.ScaleType.Slice
tabSelection.SliceCenter = Rect.new(4, 4, 4, 4)

tabButtons.Name = "TabButtons"
tabButtons.Parent = tabSelection
tabButtons.BackgroundColor3 = Color3.new(1, 1, 1)
tabButtons.BackgroundTransparency = 1
tabButtons.Size = UDim2.new(1, 0, 1, 0)

uiListLayout.Parent = tabButtons
uiListLayout.FillDirection = Enum.FillDirection.Horizontal
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 2)

frame.Parent = tabSelection
frame.BackgroundColor3 = Color3.new(0.12549, 0.227451, 0.372549)
frame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, 1, 0)
frame.Size = UDim2.new(1, 0, 0, 2)

tab.Name = "Tab"
tab.Parent = prefabs
tab.BackgroundColor3 = Color3.new(1, 1, 1)
tab.BackgroundTransparency = 1
tab.Size = UDim2.new(1, 0, 1, 0)
tab.Visible = false

uiListLayout2.Parent = tab
uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout2.Padding = UDim.new(0, 5)

textBox.Parent = prefabs
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.BackgroundTransparency = 1
textBox.BorderSizePixel = 0
textBox.Size = UDim2.new(1, 0, 0, 20)
textBox.ZIndex = 2
textBox.Font = Enum.Font.GothamSemibold
textBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
textBox.PlaceholderText = "Input Text"
textBox.Text = ""
textBox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
textBox.TextSize = 14

textBoxRoundify4px.Name = "TextBox_Roundify_4px"
textBoxRoundify4px.Parent = textBox
textBoxRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
textBoxRoundify4px.BackgroundTransparency = 1
textBoxRoundify4px.Size = UDim2.new(1, 0, 1, 0)
textBoxRoundify4px.Image = "rbxassetid://2851929490"
textBoxRoundify4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textBoxRoundify4px.ScaleType = Enum.ScaleType.Slice
textBoxRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

slider.Name = "Slider"
slider.Parent = prefabs
slider.BackgroundColor3 = Color3.new(1, 1, 1)
slider.BackgroundTransparency = 1
slider.Position = UDim2.new(0, 0, 0.178571433, 0)
slider.Size = UDim2.new(1, 0, 0, 20)
slider.Image = "rbxassetid://2851929490"
slider.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
slider.ScaleType = Enum.ScaleType.Slice
slider.SliceCenter = Rect.new(4, 4, 4, 4)

sliderTitle.Name = "Title"
sliderTitle.Parent = slider
sliderTitle.BackgroundColor3 = Color3.new(1, 1, 1)
sliderTitle.BackgroundTransparency = 1
sliderTitle.Position = UDim2.new(0.5, 0, 0.5, -10)
sliderTitle.Size = UDim2.new(0, 0, 0, 20)
sliderTitle.ZIndex = 2
sliderTitle.Font = Enum.Font.GothamBold
sliderTitle.Text = "Slider"
sliderTitle.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
sliderTitle.TextSize = 14

indicator.Name = "Indicator"
indicator.Parent = slider
indicator.BackgroundColor3 = Color3.new(1, 1, 1)
indicator.BackgroundTransparency = 1
indicator.Size = UDim2.new(0, 0, 0, 20)
indicator.Image = "rbxassetid://2851929490"
indicator.ImageColor3 = Color3.new(0.254902, 0.262745, 0.278431)
indicator.ScaleType = Enum.ScaleType.Slice
indicator.SliceCenter = Rect.new(4, 4, 4, 4)

sliderValue.Name = "Value"
sliderValue.Parent = slider
sliderValue.BackgroundColor3 = Color3.new(1, 1, 1)
sliderValue.BackgroundTransparency = 1
sliderValue.Position = UDim2.new(1, -55, 0.5, -10)
sliderValue.Size = UDim2.new(0, 50, 0, 20)
sliderValue.Font = Enum.Font.GothamBold
sliderValue.Text = "0%"
sliderValue.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
sliderValue.TextSize = 14

textLabel.Parent = slider
textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.new(1, -20, -0.75, 0)
textLabel.Size = UDim2.new(0, 26, 0, 50)
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "]"
textLabel.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
textLabel.TextSize = 14

textLabel2.Parent = slider
textLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel2.BackgroundTransparency = 1
textLabel2.Position = UDim2.new(1, -65, -0.75, 0)
textLabel2.Size = UDim2.new(0, 26, 0, 50)
textLabel2.Font = Enum.Font.GothamBold
textLabel2.Text = "["
textLabel2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
textLabel2.TextSize = 14

circle.Name = "Circle"
circle.Parent = prefabs
circle.BackgroundColor3 = Color3.new(1, 1, 1)
circle.BackgroundTransparency = 1
circle.Image = "rbxassetid://266543268"
circle.ImageTransparency = 0.5

uiListLayout3.Parent = prefabs
uiListLayout3.FillDirection = Enum.FillDirection.Horizontal
uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout3.Padding = UDim.new(0, 20)

dropdown.Name = "Dropdown"
dropdown.Parent = prefabs
dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown.BackgroundTransparency = 1
dropdown.BorderSizePixel = 0
dropdown.Position = UDim2.new(-0.055555556, 0, 0.0833333284, 0)
dropdown.Size = UDim2.new(0, 200, 0, 20)
dropdown.ZIndex = 2
dropdown.Font = Enum.Font.GothamBold
dropdown.Text = "      Dropdown"
dropdown.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
dropdown.TextSize = 14
dropdown.TextXAlignment = Enum.TextXAlignment.Left

dropdownIndicator.Name = "Indicator"
dropdownIndicator.Parent = dropdown
dropdownIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownIndicator.BackgroundTransparency = 1
dropdownIndicator.Position = UDim2.new(0.899999976, -10, 0.100000001, 0)
dropdownIndicator.Rotation = -90
dropdownIndicator.Size = UDim2.new(0, 15, 0, 15)
dropdownIndicator.ZIndex = 2
dropdownIndicator.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4744658743"

dropdownBox.Name = "Box"
dropdownBox.Parent = dropdown
dropdownBox.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownBox.BackgroundTransparency = 1
dropdownBox.Position = UDim2.new(0, 0, 0, 25)
dropdownBox.Size = UDim2.new(1, 0, 0, 150)
dropdownBox.ZIndex = 3
dropdownBox.Image = "rbxassetid://2851929490"
dropdownBox.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
dropdownBox.ScaleType = Enum.ScaleType.Slice
dropdownBox.SliceCenter = Rect.new(4, 4, 4, 4)

dropdownObjects.Name = "Objects"
dropdownObjects.Parent = dropdownBox
dropdownObjects.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownObjects.BackgroundTransparency = 1
dropdownObjects.BorderSizePixel = 0
dropdownObjects.Size = UDim2.new(1, 0, 1, 0)
dropdownObjects.ZIndex = 3
dropdownObjects.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdownObjects.ScrollBarThickness = 8

uiListLayout4.Parent = dropdownObjects
uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder

textButtonRoundify4px.Name = "TextButton_Roundify_4px"
textButtonRoundify4px.Parent = dropdown
textButtonRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px.BackgroundTransparency = 1
textButtonRoundify4px.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px.Image = "rbxassetid://2851929490"
textButtonRoundify4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textButtonRoundify4px.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

tabButton.Name = "TabButton"
tabButton.Parent = prefabs
tabButton.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
tabButton.BackgroundTransparency = 1
tabButton.BorderSizePixel = 0
tabButton.Position = UDim2.new(0.185185179, 0, 0, 0)
tabButton.Size = UDim2.new(0, 71, 0, 20)
tabButton.ZIndex = 2
tabButton.Font = Enum.Font.GothamSemibold
tabButton.Text = "Test tab"
tabButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
tabButton.TextSize = 14

textButtonRoundify4px_2.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_2.Parent = tabButton
textButtonRoundify4px_2.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_2.BackgroundTransparency = 1
textButtonRoundify4px_2.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_2.Image = "rbxassetid://2851929490"
textButtonRoundify4px_2.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textButtonRoundify4px_2.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_2.SliceCenter = Rect.new(4, 4, 4, 4)

folder.Name = "Folder"
folder.Parent = prefabs
folder.BackgroundColor3 = Color3.new(1, 1, 1)
folder.BackgroundTransparency = 1
folder.Position = UDim2.new(0, 0, 0, 50)
folder.Size = UDim2.new(1, 0, 0, 20)
folder.Image = "rbxassetid://2851929490"
folder.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
folder.ScaleType = Enum.ScaleType.Slice
folder.SliceCenter = Rect.new(4, 4, 4, 4)

button.Name = "Button"
button.Parent = folder
button.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
button.BackgroundTransparency = 1
button.BorderSizePixel = 0
button.Size = UDim2.new(1, 0, 0, 20)
button.ZIndex = 2
button.Font = Enum.Font.GothamSemibold
button.Text = "      Folder"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 14
button.TextXAlignment = Enum.TextXAlignment.Left

textButtonRoundify4px_3.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_3.Parent = button
textButtonRoundify4px_3.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_3.BackgroundTransparency = 1
textButtonRoundify4px_3.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_3.Image = "rbxassetid://2851929490"
textButtonRoundify4px_3.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
textButtonRoundify4px_3.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_3.SliceCenter = Rect.new(4, 4, 4, 4)

toggle2.Name = "Toggle"
toggle2.Parent = button
toggle2.BackgroundColor3 = Color3.new(1, 1, 1)
toggle2.BackgroundTransparency = 1
toggle2.Position = UDim2.new(0, 5, 0, 0)
toggle2.Size = UDim2.new(0, 20, 0, 20)
toggle2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

objects2.Name = "Objects"
objects2.Parent = folder
objects2.BackgroundColor3 = Color3.new(1, 1, 1)
objects2.BackgroundTransparency = 1
objects2.Position = UDim2.new(0, 10, 0, 25)
objects2.Size = UDim2.new(1, -10, 1, -25)
objects2.Visible = false

uiListLayout5.Parent = objects2
uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout5.Padding = UDim.new(0, 5)

horizontalAlignment.Name = "HorizontalAlignment"
horizontalAlignment.Parent = prefabs
horizontalAlignment.BackgroundColor3 = Color3.new(1, 1, 1)
horizontalAlignment.BackgroundTransparency = 1
horizontalAlignment.Size = UDim2.new(1, 0, 0, 20)

uiListLayout6.Parent = horizontalAlignment
uiListLayout6.FillDirection = Enum.FillDirection.Horizontal
uiListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout6.Padding = UDim.new(0, 5)

console.Name = "Console"
console.Parent = prefabs
console.BackgroundColor3 = Color3.new(1, 1, 1)
console.BackgroundTransparency = 1
console.Size = UDim2.new(1, 0, 0, 200)
console.Image = "rbxassetid://2851928141"
console.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
console.ScaleType = Enum.ScaleType.Slice
console.SliceCenter = Rect.new(8, 8, 8, 8)

scrollingFrame.Parent = console
scrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Size = UDim2.new(1, 0, 1, 1)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 4

source.Name = "Source"
source.Parent = scrollingFrame
source.BackgroundColor3 = Color3.new(1, 1, 1)
source.BackgroundTransparency = 1
source.Position = UDim2.new(0, 40, 0, 0)
source.Size = UDim2.new(1, -40, 0, 10000)
source.ZIndex = 3
source.ClearTextOnFocus = false
source.Font = Enum.Font.Code
source.MultiLine = true
source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
source.Text = ""
source.TextColor3 = Color3.new(1, 1, 1)
source.TextSize = 15
source.TextStrokeColor3 = Color3.new(1, 1, 1)
source.TextWrapped = true
source.TextXAlignment = Enum.TextXAlignment.Left
source.TextYAlignment = Enum.TextYAlignment.Top

commentsLabel.Name = "Comments"
commentsLabel.Parent = source
commentsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
commentsLabel.BackgroundTransparency = 1
commentsLabel.Size = UDim2.new(1, 0, 1, 0)
commentsLabel.ZIndex = 5
commentsLabel.Font = Enum.Font.Code
commentsLabel.Text = ""
commentsLabel.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
commentsLabel.TextSize = 15
commentsLabel.TextXAlignment = Enum.TextXAlignment.Left
commentsLabel.TextYAlignment = Enum.TextYAlignment.Top

globalsLabel.Name = "Globals"
globalsLabel.Parent = source
globalsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
globalsLabel.BackgroundTransparency = 1
globalsLabel.Size = UDim2.new(1, 0, 1, 0)
globalsLabel.ZIndex = 5
globalsLabel.Font = Enum.Font.Code
globalsLabel.Text = ""
globalsLabel.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
globalsLabel.TextSize = 15
globalsLabel.TextXAlignment = Enum.TextXAlignment.Left
globalsLabel.TextYAlignment = Enum.TextYAlignment.Top

keywordsLabel.Name = "Keywords"
keywordsLabel.Parent = source
keywordsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
keywordsLabel.BackgroundTransparency = 1
keywordsLabel.Size = UDim2.new(1, 0, 1, 0)
keywordsLabel.ZIndex = 5
keywordsLabel.Font = Enum.Font.Code
keywordsLabel.Text = ""
keywordsLabel.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
keywordsLabel.TextSize = 15
keywordsLabel.TextXAlignment = Enum.TextXAlignment.Left
keywordsLabel.TextYAlignment = Enum.TextYAlignment.Top

remoteHighlight.Name = "RemoteHighlight"
remoteHighlight.Parent = source
remoteHighlight.BackgroundColor3 = Color3.new(1, 1, 1)
remoteHighlight.BackgroundTransparency = 1
remoteHighlight.Size = UDim2.new(1, 0, 1, 0)
remoteHighlight.ZIndex = 5
remoteHighlight.Font = Enum.Font.Code
remoteHighlight.Text = ""
remoteHighlight.TextColor3 = Color3.new(0, 0.568627, 1)
remoteHighlight.TextSize = 15
remoteHighlight.TextXAlignment = Enum.TextXAlignment.Left
remoteHighlight.TextYAlignment = Enum.TextYAlignment.Top

stringsLabel.Name = "Strings"
stringsLabel.Parent = source
stringsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
stringsLabel.BackgroundTransparency = 1
stringsLabel.Size = UDim2.new(1, 0, 1, 0)
stringsLabel.ZIndex = 5
stringsLabel.Font = Enum.Font.Code
stringsLabel.Text = ""
stringsLabel.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
stringsLabel.TextSize = 15
stringsLabel.TextXAlignment = Enum.TextXAlignment.Left
stringsLabel.TextYAlignment = Enum.TextYAlignment.Top

tokensLabel.Name = "Tokens"
tokensLabel.Parent = source
tokensLabel.BackgroundColor3 = Color3.new(1, 1, 1)
tokensLabel.BackgroundTransparency = 1
tokensLabel.Size = UDim2.new(1, 0, 1, 0)
tokensLabel.ZIndex = 5
tokensLabel.Font = Enum.Font.Code
tokensLabel.Text = ""
tokensLabel.TextColor3 = Color3.new(1, 1, 1)
tokensLabel.TextSize = 15
tokensLabel.TextXAlignment = Enum.TextXAlignment.Left
tokensLabel.TextYAlignment = Enum.TextYAlignment.Top

numbersLabel.Name = "Numbers"
numbersLabel.Parent = source
numbersLabel.BackgroundColor3 = Color3.new(1, 1, 1)
numbersLabel.BackgroundTransparency = 1
numbersLabel.Size = UDim2.new(1, 0, 1, 0)
numbersLabel.ZIndex = 4
numbersLabel.Font = Enum.Font.Code
numbersLabel.Text = ""
numbersLabel.TextColor3 = Color3.new(1, 0.776471, 0)
numbersLabel.TextSize = 15
numbersLabel.TextXAlignment = Enum.TextXAlignment.Left
numbersLabel.TextYAlignment = Enum.TextYAlignment.Top

infoLabel.Name = "Info"
infoLabel.Parent = source
infoLabel.BackgroundColor3 = Color3.new(1, 1, 1)
infoLabel.BackgroundTransparency = 1
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.ZIndex = 5
infoLabel.Font = Enum.Font.Code
infoLabel.Text = ""
infoLabel.TextColor3 = Color3.new(0, 0.635294, 1)
infoLabel.TextSize = 15
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top

linesLabel.Name = "Lines"
linesLabel.Parent = scrollingFrame
linesLabel.BackgroundColor3 = Color3.new(1, 1, 1)
linesLabel.BackgroundTransparency = 1
linesLabel.BorderSizePixel = 0
linesLabel.Size = UDim2.new(0, 40, 0, 10000)
linesLabel.ZIndex = 4
linesLabel.Font = Enum.Font.Code
linesLabel.Text = "1\n"
linesLabel.TextColor3 = Color3.new(1, 1, 1)
linesLabel.TextSize = 15
linesLabel.TextWrapped = true
linesLabel.TextYAlignment = Enum.TextYAlignment.Top

colorPicker.Name = "ColorPicker"
colorPicker.Parent = prefabs
colorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
colorPicker.BackgroundTransparency = 1
colorPicker.Size = UDim2.new(0, 180, 0, 110)
colorPicker.Image = "rbxassetid://2851929490"
colorPicker.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
colorPicker.ScaleType = Enum.ScaleType.Slice
colorPicker.SliceCenter = Rect.new(4, 4, 4, 4)

palette.Name = "Palette"
palette.Parent = colorPicker
palette.BackgroundColor3 = Color3.new(1, 1, 1)
palette.BackgroundTransparency = 1
palette.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
palette.Size = UDim2.new(0, 100, 0, 100)
palette.Image = "rbxassetid://698052001"
palette.ScaleType = Enum.ScaleType.Slice
palette.SliceCenter = Rect.new(4, 4, 4, 4)

indicator3.Name = "Indicator"
indicator3.Parent = palette
indicator3.BackgroundColor3 = Color3.new(1, 1, 1)
indicator3.BackgroundTransparency = 1
indicator3.Size = UDim2.new(0, 5, 0, 5)
indicator3.ZIndex = 2
indicator3.Image = "rbxassetid://2851926732"
indicator3.ImageColor3 = Color3.new(0, 0, 0)
indicator3.ScaleType = Enum.ScaleType.Slice
indicator3.SliceCenter = Rect.new(12, 12, 12, 12)

sample.Name = "Sample"
sample.Parent = colorPicker
sample.BackgroundColor3 = Color3.new(1, 1, 1)
sample.BackgroundTransparency = 1
sample.Position = UDim2.new(0.800000012, 0, 0.0500000007, 0)
sample.Size = UDim2.new(0, 25, 0, 25)
sample.Image = "rbxassetid://2851929490"
sample.ScaleType = Enum.ScaleType.Slice
sample.SliceCenter = Rect.new(4, 4, 4, 4)

saturation.Name = "Saturation"
saturation.Parent = colorPicker
saturation.BackgroundColor3 = Color3.new(1, 1, 1)
saturation.Position = UDim2.new(0.649999976, 0, 0.0500000007, 0)
saturation.Size = UDim2.new(0, 15, 0, 100)
saturation.Image = "rbxassetid://3641079629"

indicator4.Name = "Indicator"
indicator4.Parent = saturation
indicator4.BackgroundColor3 = Color3.new(1, 1, 1)
indicator4.BorderSizePixel = 0
indicator4.Size = UDim2.new(0, 20, 0, 2)
indicator4.ZIndex = 2

switchButton.Name = "Switch"
switchButton.Parent = prefabs
switchButton.BackgroundColor3 = Color3.new(1, 1, 1)
switchButton.BackgroundTransparency = 1
switchButton.BorderSizePixel = 0
switchButton.Position = UDim2.new(0.229411766, 0, 0.20714286, 0)
switchButton.Size = UDim2.new(0, 20, 0, 20)
switchButton.ZIndex = 2
switchButton.Font = Enum.Font.SourceSans
switchButton.Text = ""
switchButton.TextColor3 = Color3.new(1, 1, 1)
switchButton.TextSize = 18

textButtonRoundify4px_4.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_4.Parent = switchButton
textButtonRoundify4px_4.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_4.BackgroundTransparency = 1
textButtonRoundify4px_4.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_4.Image = "rbxassetid://2851929490"
textButtonRoundify4px_4.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
textButtonRoundify4px_4.ImageTransparency = 0.5
textButtonRoundify4px_4.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_4.SliceCenter = Rect.new(4, 4, 4, 4)

title3Label.Name = "Title"
title3Label.Parent = switchButton
title3Label.BackgroundColor3 = Color3.new(1, 1, 1)
title3Label.BackgroundTransparency = 1
title3Label.Position = UDim2.new(1.20000005, 0, 0, 0)
title3Label.Size = UDim2.new(0, 20, 0, 20)
title3Label.Font = Enum.Font.GothamSemibold
title3Label.Text = "Switch"
title3Label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
title3Label.TextSize = 14
title3Label.TextXAlignment = Enum.TextXAlignment.Left

button2.Name = "Button"
button2.Parent = prefabs
button2.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
button2.BackgroundTransparency = 1
button2.BorderSizePixel = 0
button2.Size = UDim2.new(0, 91, 0, 20)
button2.ZIndex = 2
button2.Font = Enum.Font.GothamSemibold
button2.TextColor3 = Color3.new(1, 1, 1)
button2.TextSize = 14

textButtonRoundify4px_5.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_5.Parent = button2
textButtonRoundify4px_5.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_5.BackgroundTransparency = 1
textButtonRoundify4px_5.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_5.Image = "rbxassetid://2851929490"
textButtonRoundify4px_5.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
textButtonRoundify4px_5.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_5.SliceCenter = Rect.new(4, 4, 4, 4)

dropdownButton.Name = "DropdownButton"
dropdownButton.Parent = prefabs
dropdownButton.BackgroundColor3 = Color3.new(0.129412, 0.133333, 0.141176)
dropdownButton.BorderSizePixel = 0
dropdownButton.Size = UDim2.new(1, 0, 0, 20)
dropdownButton.ZIndex = 3
dropdownButton.Font = Enum.Font.GothamBold
dropdownButton.Text = "      Button"
dropdownButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
dropdownButton.TextSize = 14
dropdownButton.TextXAlignment = Enum.TextXAlignment.Left

keybind.Name = "Keybind"
keybind.Parent = prefabs
keybind.BackgroundColor3 = Color3.new(1, 1, 1)
keybind.BackgroundTransparency = 1
keybind.Size = UDim2.new(0, 200, 0, 20)
keybind.Image = "rbxassetid://2851929490"
keybind.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
keybind.ScaleType = Enum.ScaleType.Slice
keybind.SliceCenter = Rect.new(4, 4, 4, 4)

title4Label.Name = "Title"
title4Label.Parent = keybind
title4Label.BackgroundColor3 = Color3.new(1, 1, 1)
title4Label.BackgroundTransparency = 1
title4Label.Size = UDim2.new(0, 0, 1, 0)
title4Label.Font = Enum.Font.GothamBold
title4Label.Text = "Keybind"
title4Label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
title4Label.TextSize = 14
title4Label.TextXAlignment = Enum.TextXAlignment.Left

inputButton.Name = "Input"
inputButton.Parent = keybind
inputButton.BackgroundColor3 = Color3.new(1, 1, 1)
inputButton.BackgroundTransparency = 1
inputButton.BorderSizePixel = 0
inputButton.Position = UDim2.new(1, -85, 0, 2)
inputButton.Size = UDim2.new(0, 80, 1, -4)
inputButton.ZIndex = 2
inputButton.Font = Enum.Font.GothamSemibold
inputButton.Text = "RShift"
inputButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
inputButton.TextSize = 12
inputButton.TextWrapped = true

inputRoundify4px.Name = "Input_Roundify_4px"
inputRoundify4px.Parent = inputButton
inputRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
inputRoundify4px.BackgroundTransparency = 1
inputRoundify4px.Size = UDim2.new(1, 0, 1, 0)
inputRoundify4px.Image = "rbxassetid://2851929490"
inputRoundify4px.ImageColor3 = Color3.new(0.290196, 0.294118, 0.313726)
inputRoundify4px.ScaleType = Enum.ScaleType.Slice
inputRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

windowsFrame.Name = "Windows"
windowsFrame.Parent = imgui
windowsFrame.BackgroundColor3 = Color3.new(1, 1, 1)
windowsFrame.BackgroundTransparency = 1
windowsFrame.Position = UDim2.new(0, 20, 0, 20)
windowsFrame.Size = UDim2.new(1, 20, 1, -20)

--[[ Script ]]--
local root = imgui

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("RunService")
local ps = game:GetService("Players")

local p = ps.LocalPlayer
local mouse = p:GetMouse()

local Prefabs = prefabs
local Windows = windowsFrame

local checks = {
	["binding"] = false,
}

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == ((typeof(ui_options.toggle_key) == "EnumItem") and ui_options.toggle_key or Enum.KeyCode.RightShift) then
		if root then
			if not checks.binding and root.Enabled ~= nil then
				root.Enabled = not root.Enabled
			end
		end
	end
end)

local function Resize(part, new, _delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(part, tweenInfo, new)
	tween:Play()
end

local function rgbtohsv(r, g, b) -- idk who made this function, but thanks
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max

	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end

	if max == min then
		h = 0
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

local function hasprop(object, prop)
	local a, b = pcall(function()
		return object[tostring(prop)]
	end)
	if a then
		return b
	end
end

local function gNameLen(obj)
	return obj.TextBounds.X + 15
end

local function gMouse()
	return Vector2.new(UIS:GetMouseLocation().X + 1, UIS:GetMouseLocation().Y - 35)
end

local function ripple(button, x, y)
	spawn(function()
		button.ClipsDescendants = true

		local circle = prefabs:FindFirstChild("Circle"):Clone()

		circle.Parent = button
		circle.ZIndex = 1000

		local new_x = x - circle.AbsolutePosition.X
		local new_y = y - circle.AbsolutePosition.Y
		circle.Position = UDim2.new(0, new_x, 0, new_y)

		local size = 0
		if button.AbsoluteSize.X > button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
			size = button.AbsoluteSize.Y * 1.5
		elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		end

		circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
		Resize(circle, {ImageTransparency = 1}, 0.5)

		wait(0.5)
		circle:Destroy()
	end)
end

local windows = 0
local library = {}

local function format_windows()
	local ull = prefabs:FindFirstChild("UIListLayout"):Clone()
	ull.Parent = windowsFrame
	local data = {}

	for i,v in pairs(windowsFrame:GetChildren()) do
		if not (v:IsA("UIListLayout")) then
			data[v] = v.AbsolutePosition
		end
	end

	ull:Destroy()

	for i,v in pairs(data) do
		i.Position = UDim2.new(0, v.X, 0, v.Y)
	end
end

function library:FormatWindows()
	format_windows()
end

function library:AddWindow(title, options)
	windows = windows + 1
	local dropdown_open = false
	title = tostring(title or "New Window")
	options = (typeof(options) == "table") and options or ui_options
	options.tween_time = 0.1

	local Window = prefabs:FindFirstChild("Window"):Clone()
	Window.Parent = windowsFrame
	Window:FindFirstChild("Title").Text = title
	Window.Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)
	Window.ZIndex = Window.ZIndex + (windows * 10)

	do -- Altering Window Color
		local Title = Window:FindFirstChild("Title")
		local Bar = Window:FindFirstChild("Bar")
		local Base = Bar:FindFirstChild("Base")
		local Top = Bar:FindFirstChild("Top")
		local SplitFrame = Window:FindFirstChild("TabSelection"):FindFirstChild("Frame")
		local Toggle = Bar:FindFirstChild("Toggle")

		spawn(function()
			while true do
				Bar.BackgroundColor3 = options.main_color
				Base.BackgroundColor3 = options.main_color
				Base.ImageColor3 = options.main_color
				Top.ImageColor3 = options.main_color
				SplitFrame.BackgroundColor3 = options.main_color

				RS.Heartbeat:Wait()
			end
		end)

	end

	local Resizer = Window:WaitForChild("Resizer")

	local window_data = {}
	Window.Draggable = true

	do -- Resize Window
		local oldIcon = mouse.Icon
		local Entered = false
		Resizer.MouseEnter:Connect(function()
			Window.Draggable = false
			if options.can_resize then
				oldIcon = mouse.Icon
				-- mouse.Icon = "http://www.roblox.com/asset?id=4745131330"
			end
			Entered = true
		end)

		Resizer.MouseLeave:Connect(function()
			Entered = false
			if options.can_resize then
				mouse.Icon = oldIcon
			end
			Window.Draggable = true
		end)

		local Held = false
		UIS.InputBegan:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = true

				spawn(function() -- Loop check
					if Entered and Resizer.Active and options.can_resize then
						while Held and Resizer.Active do

							local mouse_location = gMouse()
							local x = mouse_location.X - Window.AbsolutePosition.X
							local y = mouse_location.Y - Window.AbsolutePosition.Y

							--
							if x >= options.min_size.X and y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, x, 0, y)}, options.tween_time)
							elseif x >= options.min_size.X then
								Resize(Window, {Size = UDim2.new(0, x, 0, options.min_size.Y)}, options.tween_time)
							elseif y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, y)}, options.tween_time)
							else
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)}, options.tween_time)
							end

							RS.Heartbeat:Wait()
						end
					end
				end)
			end
		end)
		UIS.InputEnded:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = false
			end
		end)
	end

	do -- [Open / Close] Window
		local open_close = Window:FindFirstChild("Bar"):FindFirstChild("Toggle")
		local open = true
		local canopen = true

		local oldwindowdata = {}
		local oldy = Window.AbsoluteSize.Y
		open_close.MouseButton1Click:Connect(function()
			if canopen then
				canopen = false

				if open then
					-- Close

					oldwindowdata = {}
					for i,v in pairs(Window:FindFirstChild("Tabs"):GetChildren()) do
						oldwindowdata[v] = v.Visible
						v.Visible = false
					end

					Resizer.Active = false

					oldy = Window.AbsoluteSize.Y
					Resize(open_close, {Rotation = 0}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, 26)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 1

				else
					-- Open

					for i,v in pairs(oldwindowdata) do
						i.Visible = v
					end

					Resizer.Active = true

					Resize(open_close, {Rotation = 90}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, oldy)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 0

				end

				open = not open
				wait(options.tween_time)
				canopen = true

			end
		end)
	end

	do -- UI Elements
		local tabs = Window:FindFirstChild("Tabs")
		local tab_selection = Window:FindFirstChild("TabSelection")
		local tab_buttons = tab_selection:FindFirstChild("TabButtons")

		do -- Add Tab
			function window_data:AddTab(tab_name)
				local tab_data = {}
				tab_name = tostring(tab_name or "New Tab")
				tab_selection.Visible = true

				local new_button = prefabs:FindFirstChild("TabButton"):Clone()
				new_button.Parent = tab_buttons
				new_button.Text = tab_name
				new_button.Size = UDim2.new(0, gNameLen(new_button), 0, 20)
				new_button.ZIndex = new_button.ZIndex + (windows * 10)
				new_button:GetChildren()[1].ZIndex = new_button:GetChildren()[1].ZIndex + (windows * 10)

				local new_tab = prefabs:FindFirstChild("Tab"):Clone()
				new_tab.Parent = tabs
				new_tab.ZIndex = new_tab.ZIndex + (windows * 10)

				local function show()
					if dropdown_open then return end
					for i, v in pairs(tab_buttons:GetChildren()) do
						if not (v:IsA("UIListLayout")) then
							v:GetChildren()[1].ImageColor3 = Color3.fromRGB(52, 53, 56)
							Resize(v, {Size = UDim2.new(0, v.AbsoluteSize.X, 0, 20)}, options.tween_time)
						end
					end
					for i, v in pairs(tabs:GetChildren()) do
						v.Visible = false
					end

					Resize(new_button, {Size = UDim2.new(0, new_button.AbsoluteSize.X, 0, 25)}, options.tween_time)
					new_button:GetChildren()[1].ImageColor3 = Color3.fromRGB(73, 75, 79)
					new_tab.Visible = true
				end

				new_button.MouseButton1Click:Connect(function()
					show()
				end)

				function tab_data:Show()
					show()
				end

				do -- Tab Elements

					function tab_data:AddLabel(label_text) -- [Label]
						label_text = tostring(label_text or "New Label")

						local label = prefabs:FindFirstChild("Label"):Clone()

						label.Parent = new_tab
						label.Text = label_text
						label.Size = UDim2.new(0, gNameLen(label), 0, 20)
						label.ZIndex = label.ZIndex + (windows * 10)

						return label
					end

					function tab_data:AddButton(button_text, callback) -- [Button]
						button_text = tostring(button_text or "New Button")
						callback = typeof(callback) == "function" and callback or function()end

						local button = prefabs:FindFirstChild("Button"):Clone()

						button.Parent = new_tab
						button.Text = button_text
						button.Size = UDim2.new(0, gNameLen(button), 0, 20)
						button.ZIndex = button.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						spawn(function()
							while true do
								if button and button:GetChildren()[1] then
									button:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						button.MouseButton1Click:Connect(function()
							ripple(button, mouse.X, mouse.Y)
							pcall(callback)
						end)

						return button
					end

					function tab_data:AddSwitch(switch_text, callback) -- [Switch]
						local switch_data = {}

						switch_text = tostring(switch_text or "New Switch")
						callback = typeof(callback) == "function" and callback or function()end

						local switch = prefabs:FindFirstChild("Switch"):Clone()

						switch.Parent = new_tab
						switch:FindFirstChild("Title").Text = switch_text

						switch:FindFirstChild("Title").ZIndex = switch:FindFirstChild("Title").ZIndex + (windows * 10)
						switch.ZIndex = switch.ZIndex + (windows * 10)
						switch:GetChildren()[1].ZIndex = switch:GetChildren()[1].ZIndex + (windows * 10)

						spawn(function()
							while true do
								if switch and switch:GetChildren()[1] then
									switch:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						local toggled = false
						switch.MouseButton1Click:Connect(function()
							toggled = not toggled
							switch.Text = toggled and utf8.char(10003) or ""
							pcall(callback, toggled)
						end)

						function switch_data:Set(bool)
							toggled = (typeof(bool) == "boolean") and bool or false
							switch.Text = toggled and utf8.char(10003) or ""
							pcall(callback,toggled)
						end

						return switch_data, switch
					end

					function tab_data:AddTextBox(textbox_text, callback, textbox_options)
						textbox_text = tostring(textbox_text or "New TextBox")
						callback = typeof(callback) == "function" and callback or function()end
						textbox_options = typeof(textbox_options) == "table" and textbox_options or {["clear"] = true}
						textbox_options = {
							["clear"] = ((textbox_options.clear) == true)
						}

						local textbox = prefabs:FindFirstChild("TextBox"):Clone()

						textbox.Parent = new_tab
						textbox.PlaceholderText = textbox_text
						textbox.ZIndex = textbox.ZIndex + (windows * 10)
						textbox:GetChildren()[1].ZIndex = textbox:GetChildren()[1].ZIndex + (windows * 10)

						textbox.FocusLost:Connect(function(ep)
							if ep then
								if #textbox.Text > 0 then
									pcall(callback, textbox.Text)
									if textbox_options.clear then
										textbox.Text = ""
									end
								end
							end
						end)

						return textbox
					end

					function tab_data:AddSlider(slider_text, callback, slider_options)
						local slider_data = {}

						slider_text = tostring(slider_text or "New Slider")
						callback = typeof(callback) == "function" and callback or function()end
						slider_options = typeof(slider_options) == "table" and slider_options or {}
						slider_options = {
							["min"] = slider_options.min or 0,
							["max"] = slider_options.max or 100,
							["readonly"] = slider_options.readonly or false,
						}

						local slider = prefabs:FindFirstChild("Slider"):Clone()

						slider.Parent = new_tab
						slider.ZIndex = slider.ZIndex + (windows * 10)

						local title = slider:FindFirstChild("Title")
						local indicator = slider:FindFirstChild("Indicator")
						local value = slider:FindFirstChild("Value")
						title.ZIndex = title.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						value.ZIndex = value.ZIndex + (windows * 10)

						title.Text = slider_text

						do -- Slider Math
							local Entered = false
							slider.MouseEnter:Connect(function()
								Entered = true
								Window.Draggable = false
							end)
							slider.MouseLeave:Connect(function()
								Entered = false
								Window.Draggable = true
							end)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										if Entered and not slider_options.readonly then
											while Held and (not dropdown_open) do
												local mouse_location = gMouse()
												local x = (slider.AbsoluteSize.X - (slider.AbsoluteSize.X - ((mouse_location.X - slider.AbsolutePosition.X)) + 1)) / slider.AbsoluteSize.X

												local min = 0
												local max = 1

												local size = min
												if x >= min and x <= max then
													size = x
												elseif x < min then
													size = min
												elseif x > max then
													size = max
												end

												Resize(indicator, {Size = UDim2.new(size or min, 0, 0, 20)}, options.tween_time)
												local p = math.floor((size or min) * 100)

												local maxv = slider_options.max
												local minv = slider_options.min
												local diff = maxv - minv

												local sel_value = math.floor(((diff / 100) * p) + minv)

												value.Text = tostring(sel_value)
												pcall(callback, sel_value)

												RS.Heartbeat:Wait()
											end
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function slider_data:Set(new_value)
								new_value = tonumber(new_value) or 0
								new_value = (((new_value >= 0 and new_value <= 100) and new_value) / 100)

								Resize(indicator, {Size = UDim2.new(new_value or 0, 0, 0, 20)}, options.tween_time)
								local p = math.floor((new_value or 0) * 100)

								local maxv = slider_options.max
								local minv = slider_options.min
								local diff = maxv - minv

								local sel_value = math.floor(((diff / 100) * p) + minv)

								value.Text = tostring(sel_value)
								pcall(callback, sel_value)
							end

							slider_data:Set(slider_options["min"])
						end

						return slider_data, slider
					end

					function tab_data:AddKeybind(keybind_name, callback, keybind_options)
						local keybind_data = {}

						keybind_name = tostring(keybind_name or "New Keybind")
						callback = typeof(callback) == "function" and callback or function()end
						keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
						keybind_options = {
							["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
						}

						local keybind = prefabs:FindFirstChild("Keybind"):Clone()
						local input = keybind:FindFirstChild("Input")
						local title = keybind:FindFirstChild("Title")
						keybind.ZIndex = keybind.ZIndex + (windows * 10)
						input.ZIndex = input.ZIndex + (windows * 10)
						input:GetChildren()[1].ZIndex = input:GetChildren()[1].ZIndex + (windows * 10)
						title.ZIndex = title.ZIndex + (windows * 10)

						keybind.Parent = new_tab
						title.Text = "  " .. keybind_name
						keybind.Size = UDim2.new(0, gNameLen(title) + 80, 0, 20)

						local shortkeys = { -- thanks to stroketon for helping me out with this
							RightControl = 'RightCtrl',
							LeftControl = 'LeftCtrl',
							LeftShift = 'LShift',
							RightShift = 'RShift',
							MouseButton1 = "Mouse1",
							MouseButton2 = "Mouse2"
						}

						local keybind = keybind_options.standard

						function keybind_data:SetKeybind(Keybind)
							local key = shortkeys[Keybind.Name] or Keybind.Name
							input.Text = key
							keybind = Keybind
						end

						UIS.InputBegan:Connect(function(a, b)
							if checks.binding then
								spawn(function()
									wait()
									checks.binding = false
								end)
								return
							end
							if a.KeyCode == keybind and not b then
								pcall(callback, keybind)
							end
						end)

						keybind_data:SetKeybind(keybind_options.standard)

						input.MouseButton1Click:Connect(function()
							if checks.binding then return end
							input.Text = "..."
							checks.binding = true
							local a, b = UIS.InputBegan:Wait()
							keybind_data:SetKeybind(a.KeyCode)
						end)

						return keybind_data, keybind
					end

					function tab_data:AddDropdown(dropdown_name, callback)
						local dropdown_data = {}
						dropdown_name = tostring(dropdown_name or "New Dropdown")
						callback = typeof(callback) == "function" and callback or function()end

						local dropdown = prefabs:FindFirstChild("Dropdown"):Clone()
						local box = dropdown:FindFirstChild("Box")
						local objects = box:FindFirstChild("Objects")
						local indicator = dropdown:FindFirstChild("Indicator")
						dropdown.ZIndex = dropdown.ZIndex + (windows * 10)
						box.ZIndex = box.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						dropdown:GetChildren()[3].ZIndex = dropdown:GetChildren()[3].ZIndex + (windows * 10)

						dropdown.Parent = new_tab
						dropdown.Text = "      " .. dropdown_name
						box.Size = UDim2.new(1, 0, 0, 0)

						local open = false
						dropdown.MouseButton1Click:Connect(function()
							open = not open

							local len = (#objects:GetChildren() - 1) * 20
							if #objects:GetChildren() - 1 >= 10 then
								len = 10 * 20
								objects.CanvasSize = UDim2.new(0, 0, (#objects:GetChildren() - 1) * 0.1, 0)
							end

							if open then -- Open
								if dropdown_open then return end
								dropdown_open = true
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
								Resize(indicator, {Rotation = 90}, options.tween_time)
							else -- Close
								dropdown_open = false
								Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
								Resize(indicator, {Rotation = -90}, options.tween_time)
							end

						end)

						function dropdown_data:Add(n)
							local object_data = {}
							n = tostring(n or "New Object")

local object = prefabs:FindFirstChild("DropdownButton"):Clone()

							object.Parent = objects
							object.Text = n
							object.ZIndex = object.ZIndex + (windows * 10)

							object.MouseEnter:Connect(function()
								object.BackgroundColor3 = options.main_color
							end)
							object.MouseLeave:Connect(function()
								object.BackgroundColor3 = Color3.fromRGB(33, 34, 36)
							end)

							if open then
								local len = (#objects:GetChildren() - 1) * 20
								if #objects:GetChildren() - 1 >= 10 then
									len = 10 * 20
									objects.CanvasSize = UDim2.new(0, 0, (#objects:GetChildren() - 1) * 0.1, 0)
								end
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
							end

							object.MouseButton1Click:Connect(function()
								if dropdown_open then
									dropdown.Text = "      [ " .. n .. " ]"
									dropdown_open = false
									open = false
									Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
									Resize(indicator, {Rotation = -90}, options.tween_time)
									pcall(callback, n)
								end
							end)

							function object_data:Remove()
								object:Destroy()
							end

							return object, object_data
						end

						return dropdown_data, dropdown
					end

					function tab_data:AddColorPicker(callback)
						local color_picker_data = {}
						callback = typeof(callback) == "function" and callback or function()end

						local color_picker = prefabs:FindFirstChild("ColorPicker"):Clone()

						color_picker.Parent = new_tab
						color_picker.ZIndex = color_picker.ZIndex + (windows * 10)

						local palette = color_picker:FindFirstChild("Palette")
						local sample = color_picker:FindFirstChild("Sample")
						local saturation = color_picker:FindFirstChild("Saturation")
						palette.ZIndex = palette.ZIndex + (windows * 10)
						sample.ZIndex = sample.ZIndex + (windows * 10)
						saturation.ZIndex = saturation.ZIndex + (windows * 10)

						do -- Color Picker Math
							local h = 0
							local s = 1
							local v = 1

							local function update()
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
								pcall(callback, color)
							end

							do
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
							end

							local Entered1, Entered2 = false, false
							palette.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered1 = true
							end)
							palette.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered1 = false
							end)
							saturation.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered2 = true
							end)
							saturation.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered2 = false
							end)

							local palette_indicator = palette:FindFirstChild("Indicator")
							local saturation_indicator = saturation:FindFirstChild("Indicator")
							palette_indicator.ZIndex = palette_indicator.ZIndex + (windows * 10)
							saturation_indicator.ZIndex = saturation_indicator.ZIndex + (windows * 10)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										while Held and Entered1 and (not dropdown_open) do -- Palette
											local mouse_location = gMouse()

											local x = ((palette.AbsoluteSize.X - (mouse_location.X - palette.AbsolutePosition.X)) + 1)
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)

											local color = Color3.fromHSV(x / 100, y / 100, 0)
											h = x / 100
											s = y / 100

											Resize(palette_indicator, {Position = UDim2.new(0, math.abs(x - 100) - (palette_indicator.AbsoluteSize.X / 2), 0, math.abs(y - 100) - (palette_indicator.AbsoluteSize.Y / 2))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end

										while Held and Entered2 and (not dropdown_open) do -- Saturation
											local mouse_location = gMouse()
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)
											v = y / 100

											Resize(saturation_indicator, {Position = UDim2.new(0, 0, 0, math.abs(y - 100))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function color_picker_data:Set(color)
								color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
								local h2, s2, v2 = rgbtohsv(color.r * 255, color.g * 255, color.b * 255)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h2, 1, 1)
								pcall(callback, color)
							end
						end

						return color_picker_data, color_picker
					end

					function tab_data:AddConsole(console_options)
						local console_data = {}

						console_options = typeof(console_options) == "table" and console_options or {["readonly"] = true,["full"] = false,}
						console_options = {
							["y"] = tonumber(console_options.y) or 200,
							["source"] = console_options.source or "Logs",
							["readonly"] = ((console_options.readonly) == true),
							["full"] = ((console_options.full) == true),
						}

						local console = prefabs:FindFirstChild("Console"):Clone()

						console.Parent = new_tab
						console.ZIndex = console.ZIndex + (windows * 10)
						console.Size = UDim2.new(1, 0, console_options.full and 1 or 0, console_options.y)

						local sf = console:GetChildren()[1]
						local Source = sf:FindFirstChild("Source")
						local Lines = sf:FindFirstChild("Lines")
						Source.ZIndex = Source.ZIndex + (windows * 10)
						Lines.ZIndex = Lines.ZIndex + (windows * 10)

						Source.TextEditable = not console_options.readonly

						do
							for i,v in pairs(Source:GetChildren()) do
								v.ZIndex = v.ZIndex + (windows * 10) + 1
							end
						end
						Source.Comments.ZIndex = Source.Comments.ZIndex + 1

						do
							local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
							local global_env = {"getrawmetatable", "newcclosure", "islclosure", "setclipboard", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16", "load", "fire", "Fire"}

							local Highlight = function(string, keywords)
								local K = {}
								local S = string
								local Token =
									{
									["="] = true,
									["."] = true,
									[","] = true,
									["("] = true,
									[")"] = true,
									["["] = true,
									["]"] = true,
									["{"] = true,
									["}"] = true,
									[":"] = true,
									["*"] = true,
									["/"] = true,
									["+"] = true,
									["-"] = true,
									["%"] = true,
									[";"] = true,
									["~"] = true
								}
								for i, v in pairs(keywords) do
									K[v] = true
								end
								S = S:gsub(".", function(c)
									if Token[c] ~= nil then
										return "\32"
									else
										return c
									end
								end)
								S = S:gsub("%S+", function(c)
									if K[c] ~= nil then
										return c
									else
										return (" "):rep(#c)
									end
								end)

								return S
							end

							local hTokens = function(string)
								local Token =
									{
									["="] = true,
									["."] = true,
									[","] = true,
									["("] = true,
									[")"] = true,
									["["] = true,
									["]"] = true,
									["{"] = true,
									["}"] = true,
									[":"] = true,
									["*"] = true,
									["/"] = true,
									["+"] = true,
									["-"] = true,
									["%"] = true,
									[";"] = true,
									["~"] = true
								}
								local A = ""
								string:gsub(".", function(c)
									if Token[c] ~= nil then
										A = A .. c
									elseif c == "\n" then
										A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
									else
										A = A .. "\32"
									end
								end)

								return A
							end

							local strings = function(string)
								local highlight = ""
								local quote = false
								string:gsub(".", function(c)
									if quote == false and c == "\34" then
										quote = true
									elseif quote == true and c == "\34" then
										quote = false
									end
									if quote == false and c == "\34" then
										highlight = highlight .. "\34"
									elseif c == "\n" then
										highlight = highlight .. "\n"
									elseif c == "\t" then
										highlight = highlight .. "\t"
									elseif quote == true then
										highlight = highlight .. c
									elseif quote == false then
										highlight = highlight .. "\32"
									end
								end)

								return highlight
							end

							local info = function(string)
								local highlight = ""
								local quote = false
								string:gsub(".", function(c)
									if quote == false and c == "[" then
										quote = true
									elseif quote == true and c == "]" then
										quote = false
									end
									if quote == false and c == "]" then
										highlight = highlight .. "]"
									elseif c == "\n" then
										highlight = highlight .. "\n"
									elseif c == "\t" then
										highlight = highlight .. "\t"
									elseif quote == true then
										highlight = highlight .. c
									elseif quote == false then
										highlight = highlight .. "\32"
									end
								end)

								return highlight
							end

							local comments = function(string)
								local ret = ""
								string:gsub("[^\r\n]+", function(c)
									local comm = false
									local i = 0
									c:gsub(".", function(n)
										i = i + 1
										if c:sub(i, i + 1) == "--" then
											comm = true
										end
										if comm == true then
											ret = ret .. n
										else
											ret = ret .. "\32"
										end
									end)
									ret = ret
								end)

								return ret
							end

							local numbers = function(string)
								local A = ""
								string:gsub(".", function(c)
									if tonumber(c) ~= nil then
										A = A .. c
									elseif c == "\n" then
										A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
									else
										A = A .. "\32"
									end
								end)

								return A
							end

                            local function highlight_logs(s)
                                local result = s
                                for _, name in ipairs({"print","warn","error","console.log"}) do
                                    local pat = name:gsub("%.", "%%.")
                                    result = result:gsub(pat .. "%s*%b()", '<font color="rgb(130,255,170)">%0</font>')
                                end
                                return result
                            end

							local highlight_lua = function(type)
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Keywords.Text = Highlight(s, lua_keywords)
									Source.Globals.Text = Highlight(s, global_env)
									Source.RemoteHighlight.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
									Source.Tokens.Text = hTokens(s)
									Source.Numbers.Text = numbers(s)
									Source.Strings.Text = strings(s)
									Source.Comments.Text = comments(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									Lines.Text = ""
									for i = 1, lin do
										Lines.Text = Lines.Text .. i .. "\n"
									end

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end

								local highlight_logs = function(type)
                                    if type == "Text" then
                                        Source.Text = Source.Text:gsub("\13", "")
                                        Source.Text = Source.Text:gsub("\t", "      ")
                                        local s = Source.Text
                                        Source.Keywords.Text     = Highlight(s, lua_keywords)
                                        Source.Globals.Text      = Highlight(s, global_env)
                                        Source.RemoteHighlight.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
                                        Source.Tokens.Text       = hTokens(s)
                                        Source.Numbers.Text      = numbers(s)
                                        Source.Strings.Text      = strings(s)
                                        Source.Comments.Text     = comments(s)
                                        Source.Logs.Text = highlight_logs(s)
                                        local lin = 1
                                        s:gsub("\n", function() lin = lin + 1 end)
                                        Lines.Text = ""
                                        for i = 1, lin do
                                            Lines.Text = Lines.Text .. i .. "\n"
                                        end

                                        sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
                                    end
								end
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Info.Text = info(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end
							end

							if console_options.source == "Lua" then
								highlight_lua("Text")
								Source.Changed:Connect(highlight_lua)
							elseif console_options.source == "Logs" then
								Lines.Visible = false

								highlight_logs("Text")
								Source.Changed:Connect(highlight_logs)
							end

							function console_data:Set(code)
								Source.Text = tostring(code)
							end

							function console_data:Get()
								return Source.Text
							end

							function console_data:Log(msg)
								Source.Text = Source.Text .. "[*] " .. tostring(msg) .. "\n"
							end

						end

						return console_data, console
					end

					function tab_data:AddHorizontalAlignment()
						local ha_data = {}

						local ha = prefabs:FindFirstChild("HorizontalAlignment"):Clone()
						ha.Parent = new_tab

						function ha_data:AddButton(...)
							local data, object
							local ret = {tab_data:AddButton(...)}
							if typeof(ret[1]) == "table" then
								data = ret[1]
								object = ret[2]
								object.Parent = ha
								return data, object
							else
								object = ret[1]
								object.Parent = ha
								return object
							end
						end

						return ha_data, ha
					end

					function tab_data:AddFolder(folder_name) -- [Folder]
						local folder_data = {}

						folder_name = tostring(folder_name or "New Folder")

						local folder = prefabs:FindFirstChild("Folder"):Clone()
						local button = folder:FindFirstChild("Button")
						local objects = folder:FindFirstChild("Objects")
						local toggle = button:FindFirstChild("Toggle")
						folder.ZIndex = folder.ZIndex + (windows * 10)
						button.ZIndex = button.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						toggle.ZIndex = toggle.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						folder.Parent = new_tab
						button.Text = "      " .. folder_name

						spawn(function()
							while true do
								if button and button:GetChildren()[1] then
									button:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						local function gFolderLen()
							local n = 25
							for i,v in pairs(objects:GetChildren()) do
								if not (v:IsA("UIListLayout")) then
									n = n + v.AbsoluteSize.Y + 5
								end
							end
							return n
						end

						local open = false
						button.MouseButton1Click:Connect(function()
							if open then -- Close
								Resize(toggle, {Rotation = 0}, options.tween_time)
								objects.Visible = false
							else -- Open
								Resize(toggle, {Rotation = 90}, options.tween_time)
								objects.Visible = true
							end

							open = not open
						end)

						spawn(function()
							while true do
								Resize(folder, {Size = UDim2.new(1, 0, 0, (open and gFolderLen() or 20))}, options.tween_time)
								wait()
							end
						end)

						for i,v in pairs(tab_data) do
							folder_data[i] = function(...)
								local data, object
								local ret = {v(...)}
								if typeof(ret[1]) == "table" then
									data = ret[1]
									object = ret[2]
									object.Parent = objects
									return data, object
								else
									object = ret[1]
									object.Parent = objects
									return object
								end
							end
						end

						return folder_data, folder
					end

				end

				return tab_data, new_tab
			end
		end
	end

	do
		for i, v in pairs(Window:GetDescendants()) do
			if hasprop(v, "ZIndex") then
				v.ZIndex = v.ZIndex + (windows * 10)
			end
		end
	end

	return window_data, Window
end

return library        })
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
