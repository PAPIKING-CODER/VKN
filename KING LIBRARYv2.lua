local a={main_color=Color3.fromRGB(41,74,122),min_size=Vector2.new(400,300),toggle_key=Enum.KeyCode.RightShift,can_resize=true}do local b=game:GetService("CoreGui"):FindFirstChild("imgui")if b then b:Destroy()end end;local b=Instance.new("ScreenGui")local c=Instance.new("Frame")local d=Instance.new("TextLabel")local e=Instance.new("ImageLabel")local f=Instance.new("Frame")local g=Instance.new("Frame")local h=Instance.new("ImageButton")local i=Instance.new("ImageLabel")local j=Instance.new("ImageLabel")local k=Instance.new("Frame")local l=Instance.new("TextLabel")local m=Instance.new("ImageLabel")local n=Instance.new("ScrollingFrame")local o=Instance.new("Frame")local p=Instance.new("UIListLayout")local q=Instance.new("Frame")local r=Instance.new("Frame")local s=Instance.new("UIListLayout")local t=Instance.new("TextBox")local u=Instance.new("ImageLabel")local v=Instance.new("ImageLabel")local w=Instance.new("TextLabel")local x=Instance.new("ImageLabel")local y=Instance.new("TextLabel")local z=Instance.new("TextLabel")local A=Instance.new("TextLabel")local B=Instance.new("ImageLabel")local C=Instance.new("UIListLayout")local D=Instance.new("TextButton")local E=Instance.new("ImageLabel")local F=Instance.new("ImageButton")local G=Instance.new("ScrollingFrame")local H=Instance.new("UIListLayout")local I=Instance.new("ImageLabel")local J=Instance.new("TextButton")local K=Instance.new("ImageLabel")local L=Instance.new("ImageLabel")local M=Instance.new("TextButton")local N=Instance.new("ImageLabel")local O=Instance.new("ImageLabel")local P=Instance.new("Frame")local Q=Instance.new("UIListLayout")local R=Instance.new("Frame")local S=Instance.new("UIListLayout")local T=Instance.new("ImageLabel")local U=Instance.new("ScrollingFrame")local V=Instance.new("TextBox")local W=Instance.new("TextLabel")local X=Instance.new("TextLabel")local Y=Instance.new("TextLabel")local Z=Instance.new("TextLabel")local _=Instance.new("TextLabel")local a0=Instance.new("TextLabel")local a1=Instance.new("TextLabel")local a2=Instance.new("TextLabel")local a3=Instance.new("TextLabel")local a4=Instance.new("ImageLabel")local a5=Instance.new("ImageLabel")local a6=Instance.new("ImageLabel")local a7=Instance.new("ImageLabel")local a8=Instance.new("ImageLabel")local a9=Instance.new("Frame")local aa=Instance.new("TextButton")local ab=Instance.new("ImageLabel")local ac=Instance.new("TextLabel")local ad=Instance.new("TextButton")local ae=Instance.new("ImageLabel")local af=Instance.new("TextButton")local ag=Instance.new("ImageLabel")local ah=Instance.new("TextLabel")local ai=Instance.new("TextButton")local aj=Instance.new("ImageLabel")local ak=Instance.new("Frame")b.Name="imgui"b.Parent=game:GetService("CoreGui")or gethui()c.Name="Prefabs"c.Parent=b;c.BackgroundColor3=Color3.new(1,1,1)c.Size=UDim2.new(0,100,0,100)c.Visible=false;d.Name="Label"d.Parent=c;d.BackgroundColor3=Color3.new(1,1,1)d.BackgroundTransparency=1;d.Size=UDim2.new(0,200,0,20)d.Font=Enum.Font.FredokaOne;d.Text="Hello, world 123"d.TextColor3=Color3.new(1,1,1)d.TextSize=16;d.TextXAlignment=Enum.TextXAlignment.Left;e.Name="Window"e.Parent=c;e.Active=true;e.BackgroundColor3=Color3.new(1,1,1)e.BackgroundTransparency=1;e.ClipsDescendants=true;e.Position=UDim2.new(0,20,0,20)e.Selectable=true;e.Size=UDim2.new(0,200,0,200)e.Image="rbxassetid://2851926732"e.ImageColor3=Color3.new(0.0823529,0.0862745,0.0901961)e.ScaleType=Enum.ScaleType.Slice;e.SliceCenter=Rect.new(12,12,12,12)f.Name="Resizer"f.Parent=e;f.Active=true;f.BackgroundColor3=Color3.new(1,1,1)f.BackgroundTransparency=1;f.BorderSizePixel=0;f.Position=UDim2.new(1,-20,1,-20)f.Size=UDim2.new(0,20,0,20)g.Name="Bar"g.Parent=e;g.BackgroundColor3=Color3.new(0.160784,0.290196,0.478431)g.BorderSizePixel=0;g.Position=UDim2.new(0,0,0,5)g.Size=UDim2.new(1,0,0,15)h.Name="Toggle"h.Parent=g;h.BackgroundColor3=Color3.new(1,1,1)h.BackgroundTransparency=1;h.Position=UDim2.new(0,5,0,-2)h.Rotation=0;h.Size=UDim2.new(0,20,0,20)h.ZIndex=2;h.Image="rbxassetid://123496559805941"i.Name="Base"i.Parent=g;i.BackgroundColor3=Color3.new(0.160784,0.290196,0.478431)i.BorderSizePixel=0;i.Position=UDim2.new(0,0,0.800000012,0)i.Size=UDim2.new(1,0,0,10)i.Image="rbxassetid://2851926732"i.ImageColor3=Color3.new(0.160784,0.290196,0.478431)i.ScaleType=Enum.ScaleType.Slice;i.SliceCenter=Rect.new(12,12,12,12)j.Name="Top"j.Parent=g;j.BackgroundColor3=Color3.new(1,1,1)j.BackgroundTransparency=1;j.Position=UDim2.new(0,0,0,-5)j.Size=UDim2.new(1,0,0,10)j.Image="rbxassetid://2851926732"j.ImageColor3=Color3.new(0.160784,0.290196,0.478431)j.ScaleType=Enum.ScaleType.Slice;j.SliceCenter=Rect.new(12,12,12,12)k.Name="Tabs"k.Parent=e;k.BackgroundColor3=Color3.new(1,1,1)k.BackgroundTransparency=1;k.Position=UDim2.new(0,15,0,60)k.Size=UDim2.new(1,-30,1,-60)k.ClipsDescendants=true;l.Name="Title"l.Parent=e;l.BackgroundColor3=Color3.new(1,1,1)l.BackgroundTransparency=1;l.Position=UDim2.new(0,30,0,3)l.Size=UDim2.new(0,200,0,20)l.Font=Enum.Font.FredokaOne;l.Text="Gamer Time"l.TextColor3=Color3.new(1,1,1)l.TextSize=16;l.TextXAlignment=Enum.TextXAlignment.Left;m.Name="TabSelection"m.Parent=e;m.BackgroundColor3=Color3.new(1,1,1)m.BackgroundTransparency=1;m.Position=UDim2.new(0,15,0,30)m.Size=UDim2.new(1,-30,0,25)m.Visible=false;m.Image="rbxassetid://2851929490"m.ImageColor3=Color3.new(0.145098,0.14902,0.156863)m.ScaleType=Enum.ScaleType.Slice;m.SliceCenter=Rect.new(4,4,4,4)n.Name="TabScrolling"n.Parent=m;n.BackgroundTransparency=1;n.BorderSizePixel=0;n.Size=UDim2.new(1,0,1,0)n.CanvasSize=UDim2.new(0,0,1,0)n.ScrollBarThickness=0;n.ScrollingDirection=Enum.ScrollingDirection.X;o.Name="TabButtons"o.Parent=n;o.BackgroundColor3=Color3.new(1,1,1)o.BackgroundTransparency=1;o.Size=UDim2.new(0,0,1,0)o.ClipsDescendants=true;p.Parent=o;p.FillDirection=Enum.FillDirection.Horizontal;p.SortOrder=Enum.SortOrder.LayoutOrder;p.Padding=UDim.new(0,2)q.Parent=m;q.BackgroundColor3=Color3.new(0.12549,0.227451,0.372549)q.BorderColor3=Color3.new(0.105882,0.164706,0.207843)q.BorderSizePixel=0;q.Position=UDim2.new(0,0,1,0)q.Size=UDim2.new(1,0,0,2)r.Name="Tab"r.Parent=c;r.BackgroundColor3=Color3.new(1,1,1)r.BackgroundTransparency=1;r.Size=UDim2.new(1,0,1,0)r.Visible=false;s.Parent=r;s.SortOrder=Enum.SortOrder.LayoutOrder;s.Padding=UDim.new(0,5)t.Parent=c;t.BackgroundColor3=Color3.new(1,1,1)t.BackgroundTransparency=1;t.BorderSizePixel=0;t.Size=UDim2.new(1,0,0,20)t.ZIndex=2;t.Font=Enum.Font.FredokaOne;t.PlaceholderColor3=Color3.new(0.698039,0.698039,0.698039)t.PlaceholderText="Input Text"t.Text=""t.TextColor3=Color3.new(0.784314,0.784314,0.784314)t.TextSize=14;u.Name="TextBox_Roundify_4px"u.Parent=t;u.BackgroundColor3=Color3.new(1,1,1)u.BackgroundTransparency=1;u.Size=UDim2.new(1,0,1,0)u.Image="rbxassetid://2851929490"u.ImageColor3=Color3.new(0.203922,0.207843,0.219608)u.ScaleType=Enum.ScaleType.Slice;u.SliceCenter=Rect.new(4,4,4,4)v.Name="Slider"v.Parent=c;v.BackgroundColor3=Color3.new(1,1,1)v.BackgroundTransparency=1;v.Position=UDim2.new(0,0,0.178571433,0)v.Size=UDim2.new(1,0,0,20)v.Image="rbxassetid://2851929490"v.ImageColor3=Color3.new(0.145098,0.14902,0.156863)v.ScaleType=Enum.ScaleType.Slice;v.SliceCenter=Rect.new(4,4,4,4)w.Name="Title"w.Parent=v;w.BackgroundColor3=Color3.new(1,1,1)w.BackgroundTransparency=1;w.Position=UDim2.new(0.5,0,0.5,-10)w.Size=UDim2.new(0,0,0,20)w.ZIndex=2;w.Font=Enum.Font.FredokaOne;w.Text="Slider"w.TextColor3=Color3.new(0.784314,0.784314,0.784314)w.TextSize=14;x.Name="Indicator"x.Parent=v;x.BackgroundColor3=Color3.new(1,1,1)x.BackgroundTransparency=1;x.Size=UDim2.new(0,0,0,20)x.Image="rbxassetid://2851929490"x.ImageColor3=Color3.new(0.254902,0.262745,0.278431)x.ScaleType=Enum.ScaleType.Slice;x.SliceCenter=Rect.new(4,4,4,4)y.Name="Value"y.Parent=v;y.BackgroundColor3=Color3.new(1,1,1)y.BackgroundTransparency=1;y.Position=UDim2.new(1,-55,0.5,-10)y.Size=UDim2.new(0,50,0,20)y.Font=Enum.Font.FredokaOne;y.Text="0%"y.TextColor3=Color3.new(0.784314,0.784314,0.784314)y.TextSize=14;z.Parent=v;z.BackgroundColor3=Color3.new(1,1,1)z.BackgroundTransparency=1;z.Position=UDim2.new(1,-20,-0.75,0)z.Size=UDim2.new(0,26,0,50)z.Font=Enum.Font.FredokaOne;z.Text="]"z.TextColor3=Color3.new(0.627451,0.627451,0.627451)z.TextSize=14;A.Parent=v;A.BackgroundColor3=Color3.new(1,1,1)A.BackgroundTransparency=1;A.Position=UDim2.new(1,-65,-0.75,0)A.Size=UDim2.new(0,26,0,50)A.Font=Enum.Font.FredokaOne;A.Text="["A.TextColor3=Color3.new(0.627451,0.627451,0.627451)A.TextSize=14;B.Name="Circle"B.Parent=c;B.BackgroundColor3=Color3.new(1,1,1)B.BackgroundTransparency=1;B.Image="rbxassetid://266543268"B.ImageTransparency=0.5;C.Parent=c;C.FillDirection=Enum.FillDirection.Horizontal;C.SortOrder=Enum.SortOrder.LayoutOrder;C.Padding=UDim.new(0,20)D.Name="Dropdown"D.Parent=c;D.BackgroundColor3=Color3.new(1,1,1)D.BackgroundTransparency=1;D.BorderSizePixel=0;D.Position=UDim2.new(-0.055555556,0,0.0833333284,0)D.Size=UDim2.new(0,200,0,20)D.ZIndex=2;D.Font=Enum.Font.FredokaOne;D.Text="      Dropdown"D.TextColor3=Color3.new(0.784314,0.784314,0.784314)D.TextSize=14;D.TextXAlignment=Enum.TextXAlignment.Left;E.Name="Indicator"E.Parent=D;E.BackgroundColor3=Color3.new(1,1,1)E.BackgroundTransparency=1;E.Position=UDim2.new(0.899999976,-10,0.100000001,0)E.Rotation=-90;E.Size=UDim2.new(0,15,0,15)E.ZIndex=2;E.Image="rbxassetid://123496559805941"F.Name="Box"F.Parent=D;F.BackgroundColor3=Color3.new(1,1,1)F.BackgroundTransparency=1;F.Position=UDim2.new(0,0,0,25)F.Size=UDim2.new(1,0,0,150)F.ZIndex=3;F.Image="rbxassetid://2851929490"F.ImageColor3=Color3.new(0.129412,0.133333,0.141176)F.ScaleType=Enum.ScaleType.Slice;F.SliceCenter=Rect.new(4,4,4,4)G.Name="Objects"G.Parent=F;G.BackgroundColor3=Color3.new(1,1,1)G.BackgroundTransparency=1;G.BorderSizePixel=0;G.Size=UDim2.new(1,0,1,0)G.ZIndex=3;G.CanvasSize=UDim2.new(0,0,0,0)G.ScrollBarThickness=4;G.ScrollBarImageColor3=Color3.fromRGB(255,0,0)H.Parent=G;H.SortOrder=Enum.SortOrder.LayoutOrder;I.Name="TextButton_Roundify_4px"I.Parent=D;I.BackgroundColor3=Color3.new(1,1,1)I.BackgroundTransparency=1;I.Size=UDim2.new(1,0,1,0)I.Image="rbxassetid://2851929490"I.ImageColor3=Color3.new(0.203922,0.207843,0.219608)I.ScaleType=Enum.ScaleType.Slice;I.SliceCenter=Rect.new(4,4,4,4)J.Name="TabButton"J.Parent=c;J.BackgroundColor3=Color3.new(0.160784,0.290196,0.478431)J.BackgroundTransparency=1;J.BorderSizePixel=0;J.Position=UDim2.new(0.185185179,0,0,0)J.Size=UDim2.new(0,71,0,20)J.ZIndex=2;J.Font=Enum.Font.FredokaOne;J.Text="Test tab"J.TextColor3=Color3.new(0.784314,0.784314,0.784314)J.TextSize=14;K.Name="TextButton_Roundify_4px"K.Parent=J;K.BackgroundColor3=Color3.new(1,1,1)K.BackgroundTransparency=1;K.Size=UDim2.new(1,0,1,0)K.Image="rbxassetid://2851929490"K.ImageColor3=Color3.new(0.203922,0.207843,0.219608)K.ScaleType=Enum.ScaleType.Slice;K.SliceCenter=Rect.new(4,4,4,4)L.Name="Folder"L.Parent=c;L.BackgroundColor3=Color3.new(1,1,1)L.BackgroundTransparency=1;L.Position=UDim2.new(0,0,0,50)L.Size=UDim2.new(1,0,0,20)L.Image="rbxassetid://2851929490"L.ImageColor3=Color3.new(0.0823529,0.0862745,0.0901961)L.ScaleType=Enum.ScaleType.Slice;L.SliceCenter=Rect.new(4,4,4,4)M.Name="Button"M.Parent=L;M.BackgroundColor3=Color3.new(0.160784,0.290196,0.478431)M.BackgroundTransparency=1;M.BorderSizePixel=0;M.Size=UDim2.new(1,0,0,20)M.ZIndex=2;M.Font=Enum.Font.FredokaOne;M.Text="      Folder"M.TextColor3=Color3.new(1,1,1)M.TextSize=14;M.TextXAlignment=Enum.TextXAlignment.Left;N.Name="TextButton_Roundify_4px"N.Parent=M;N.BackgroundColor3=Color3.new(1,1,1)N.BackgroundTransparency=1;N.Size=UDim2.new(1,0,1,0)N.Image="rbxassetid://2851929490"N.ImageColor3=Color3.new(0.160784,0.290196,0.478431)N.ScaleType=Enum.ScaleType.Slice;N.SliceCenter=Rect.new(4,4,4,4)O.Name="Toggle"O.Parent=M;O.BackgroundColor3=Color3.new(1,1,1)O.BackgroundTransparency=1;O.Position=UDim2.new(0,5,0,0)O.Size=UDim2.new(0,20,0,20)O.Image="rbxassetid://4731371541"P.Name="Objects"P.Parent=L;P.BackgroundColor3=Color3.new(1,1,1)P.BackgroundTransparency=1;P.Position=UDim2.new(0,10,0,25)P.Size=UDim2.new(1,-10,1,-25)P.Visible=false;Q.Parent=P;Q.SortOrder=Enum.SortOrder.LayoutOrder;Q.Padding=UDim.new(0,5)R.Name="HorizontalAlignment"R.Parent=c;R.BackgroundColor3=Color3.new(1,1,1)R.BackgroundTransparency=1;R.Size=UDim2.new(1,0,0,20)S.Parent=R;S.FillDirection=Enum.FillDirection.Horizontal;S.SortOrder=Enum.SortOrder.LayoutOrder;S.Padding=UDim.new(0,5)T.Name="Console"T.Parent=c;T.BackgroundColor3=Color3.new(1,1,1)T.BackgroundTransparency=1;T.Size=UDim2.new(1,0,0,200)T.Image="rbxassetid://2851928141"T.ImageColor3=Color3.new(0.129412,0.133333,0.141176)T.ScaleType=Enum.ScaleType.Slice;T.SliceCenter=Rect.new(8,8,8,8)U.Parent=T;U.BackgroundColor3=Color3.new(1,1,1)U.BackgroundTransparency=1;U.BorderSizePixel=0;U.Size=UDim2.new(1,0,1,1)U.CanvasSize=UDim2.new(0,0,0,0)U.ScrollBarThickness=4;V.Name="Source"V.Parent=U;V.BackgroundColor3=Color3.new(1,1,1)V.BackgroundTransparency=1;V.Position=UDim2.new(0,40,0,0)V.Size=UDim2.new(1,-40,0,10000)V.ZIndex=3;V.ClearTextOnFocus=false;V.Font=Enum.Font.Code;V.MultiLine=true;V.PlaceholderColor3=Color3.new(0.8,0.8,0.8)V.Text=""V.TextColor3=Color3.new(1,1,1)V.TextSize=15;V.TextStrokeColor3=Color3.new(1,1,1)V.TextWrapped=true;V.TextXAlignment=Enum.TextXAlignment.Left;V.TextYAlignment=Enum.TextYAlignment.Top;W.Name="Comments"W.Parent=V;W.BackgroundColor3=Color3.new(1,1,1)W.BackgroundTransparency=1;W.Size=UDim2.new(1,0,1,0)W.ZIndex=5;W.Font=Enum.Font.Code;W.Text=""W.TextColor3=Color3.new(0.231373,0.784314,0.231373)W.TextSize=15;W.TextXAlignment=Enum.TextXAlignment.Left;W.TextYAlignment=Enum.TextYAlignment.Top;X.Name="Globals"X.Parent=V;X.BackgroundColor3=Color3.new(1,1,1)X.BackgroundTransparency=1;X.Size=UDim2.new(1,0,1,0)X.ZIndex=5;X.Font=Enum.Font.Code;X.Text=""X.TextColor3=Color3.new(0.517647,0.839216,0.968628)X.TextSize=15;X.TextXAlignment=Enum.TextXAlignment.Left;X.TextYAlignment=Enum.TextYAlignment.Top;Y.Name="Keywords"Y.Parent=V;Y.BackgroundColor3=Color3.new(1,1,1)Y.BackgroundTransparency=1;Y.Size=UDim2.new(1,0,1,0)Y.ZIndex=5;Y.Font=Enum.Font.Code;Y.Text=""Y.TextColor3=Color3.new(0.972549,0.427451,0.486275)Y.TextSize=15;Y.TextXAlignment=Enum.TextXAlignment.Left;Y.TextYAlignment=Enum.TextYAlignment.Top;Z.Name="RemoteHighlight"Z.Parent=V;Z.BackgroundColor3=Color3.new(1,1,1)Z.BackgroundTransparency=1;Z.Size=UDim2.new(1,0,1,0)Z.ZIndex=5;Z.Font=Enum.Font.Code;Z.Text=""Z.TextColor3=Color3.new(0,0.568627,1)Z.TextSize=15;Z.TextXAlignment=Enum.TextXAlignment.Left;Z.TextYAlignment=Enum.TextYAlignment.Top;_.Name="Strings"_.Parent=V;_.BackgroundColor3=Color3.new(1,1,1)_.BackgroundTransparency=1;_.Size=UDim2.new(1,0,1,0)_.ZIndex=5;_.Font=Enum.Font.Code;_.Text=""_.TextColor3=Color3.new(0.678431,0.945098,0.584314)_.TextSize=15;_.TextXAlignment=Enum.TextXAlignment.Left;_.TextYAlignment=Enum.TextYAlignment.Top;a0.Name="Tokens"a0.Parent=V;a0.BackgroundColor3=Color3.new(1,1,1)a0.BackgroundTransparency=1;a0.Size=UDim2.new(1,0,1,0)a0.ZIndex=5;a0.Font=Enum.Font.Code;a0.Text=""a0.TextColor3=Color3.new(1,1,1)a0.TextSize=15;a0.TextXAlignment=Enum.TextXAlignment.Left;a0.TextYAlignment=Enum.TextYAlignment.Top;a1.Name="Numbers"a1.Parent=V;a1.BackgroundColor3=Color3.new(1,1,1)a1.BackgroundTransparency=1;a1.Size=UDim2.new(1,0,1,0)a1.ZIndex=4;a1.Font=Enum.Font.Code;a1.Text=""a1.TextColor3=Color3.new(1,0.776471,0)a1.TextSize=15;a1.TextXAlignment=Enum.TextXAlignment.Left;a1.TextYAlignment=Enum.TextYAlignment.Top;a2.Name="Info"a2.Parent=V;a2.BackgroundColor3=Color3.new(1,1,1)a2.BackgroundTransparency=1;a2.Size=UDim2.new(1,0,1,0)a2.ZIndex=5;a2.Font=Enum.Font.Code;a2.Text=""a2.TextColor3=Color3.new(0,0.635294,1)a2.TextSize=15;a2.TextXAlignment=Enum.TextXAlignment.Left;a2.TextYAlignment=Enum.TextYAlignment.Top;a3.Name="Lines"a3.Parent=U;a3.BackgroundColor3=Color3.new(1,1,1)a3.BackgroundTransparency=1;a3.BorderSizePixel=0;a3.Size=UDim2.new(0,40,0,10000)a3.ZIndex=4;a3.Font=Enum.Font.Code;a3.Text="1\n"a3.TextColor3=Color3.new(1,1,1)a3.TextSize=15;a3.TextWrapped=true;a3.TextYAlignment=Enum.TextYAlignment.Top;a4.Name="ColorPicker"a4.Parent=c;a4.BackgroundColor3=Color3.new(1,1,1)a4.BackgroundTransparency=1;a4.Size=UDim2.new(0,180,0,110)a4.Image="rbxassetid://2851929490"a4.ImageColor3=Color3.new(0.203922,0.207843,0.219608)a4.ScaleType=Enum.ScaleType.Slice;a4.SliceCenter=Rect.new(4,4,4,4)a5.Name="Palette"a5.Parent=a4;a5.BackgroundColor3=Color3.new(1,1,1)a5.BackgroundTransparency=1;a5.Position=UDim2.new(0.0500000007,0,0.0500000007,0)a5.Size=UDim2.new(0,100,0,100)a5.Image="rbxassetid://698052001"a5.ScaleType=Enum.ScaleType.Slice;a5.SliceCenter=Rect.new(4,4,4,4)a6.Name="Indicator"a6.Parent=a5;a6.BackgroundColor3=Color3.new(1,1,1)a6.BackgroundTransparency=1;a6.Size=UDim2.new(0,5,0,5)a6.ZIndex=2;a6.Image="rbxassetid://2851926732"a6.ImageColor3=Color3.new(0,0,0)a6.ScaleType=Enum.ScaleType.Slice;a6.SliceCenter=Rect.new(12,12,12,12)a7.Name="Sample"a7.Parent=a4;a7.BackgroundColor3=Color3.new(1,1,1)a7.BackgroundTransparency=1;a7.Position=UDim2.new(0.800000012,0,0.0500000007,0)a7.Size=UDim2.new(0,25,0,25)a7.Image="rbxassetid://2851929490"a7.ScaleType=Enum.ScaleType.Slice;a7.SliceCenter=Rect.new(4,4,4,4)a8.Name="Saturation"a8.Parent=a4;a8.BackgroundColor3=Color3.new(1,1,1)a8.Position=UDim2.new(0.649999976,0,0.0500000007,0)a8.Size=UDim2.new(0,15,0,100)a8.Image="rbxassetid://3641079629"a9.Name="Indicator"a9.Parent=a8;a9.BackgroundColor3=Color3.new(1,1,1)a9.BorderSizePixel=0;a9.Size=UDim2.new(0,20,0,2)a9.ZIndex=2;aa.Name="Switch"aa.Parent=c;aa.BackgroundColor3=Color3.new(1,1,1)aa.BackgroundTransparency=1;aa.BorderSizePixel=0;aa.Position=UDim2.new(0.229411766,0,0.20714286,0)aa.Size=UDim2.new(0,20,0,20)aa.ZIndex=2;aa.Font=Enum.Font.SourceSans;aa.Text=""aa.TextColor3=Color3.new(1,1,1)aa.TextSize=14;ab.Name="TextButton_Roundify_4px"ab.Parent=aa;ab.BackgroundColor3=Color3.new(1,1,1)ab.BackgroundTransparency=1;ab.Size=UDim2.new(1,0,1,0)ab.Image="rbxassetid://2851929490"ab.ImageColor3=Color3.new(0.160784,0.290196,0.478431)ab.ImageTransparency=0.5;ab.ScaleType=Enum.ScaleType.Slice;ab.SliceCenter=Rect.new(4,4,4,4)ac.Name="Title"ac.Parent=aa;ac.BackgroundColor3=Color3.new(1,1,1)ac.BackgroundTransparency=1;ac.Position=UDim2.new(1.20000005,0,0,0)ac.Size=UDim2.new(0,20,0,20)ac.Font=Enum.Font.FredokaOne;ac.Text="Switch"ac.TextColor3=Color3.new(0.784314,0.784314,0.784314)ac.TextSize=14;ac.TextXAlignment=Enum.TextXAlignment.Left;ad.Name="Button"ad.Parent=c;ad.BackgroundColor3=Color3.new(0.160784,0.290196,0.478431)ad.BackgroundTransparency=1;ad.BorderSizePixel=0;ad.Size=UDim2.new(0,91,0,20)ad.ZIndex=2;ad.Font=Enum.Font.FredokaOne;ad.TextColor3=Color3.new(1,1,1)ad.TextSize=14;ae.Name="TextButton_Roundify_4px"ae.Parent=ad;ae.BackgroundColor3=Color3.new(1,1,1)ae.BackgroundTransparency=1;ae.Size=UDim2.new(1,0,1,0)ae.Image="rbxassetid://2851929490"ae.ImageColor3=Color3.new(0.160784,0.290196,0.478431)ae.ScaleType=Enum.ScaleType.Slice;ae.SliceCenter=Rect.new(4,4,4,4)af.Name="DropdownButton"af.Parent=c;af.BackgroundColor3=Color3.new(0.129412,0.133333,0.141176)af.BorderSizePixel=0;af.Size=UDim2.new(1,0,0,20)af.ZIndex=3;af.Font=Enum.Font.FredokaOne;af.Text="      Button"af.TextColor3=Color3.new(0.784314,0.784314,0.784314)af.TextSize=14;af.TextXAlignment=Enum.TextXAlignment.Left;ag.Name="Keybind"ag.Parent=c;ag.BackgroundColor3=Color3.new(1,1,1)ag.BackgroundTransparency=1;ag.Size=UDim2.new(0,200,0,20)ag.Image="rbxassetid://2851929490"ag.ImageColor3=Color3.new(0.203922,0.207843,0.219608)ag.ScaleType=Enum.ScaleType.Slice;ag.SliceCenter=Rect.new(4,4,4,4)ah.Name="Title"ah.Parent=ag;ah.BackgroundColor3=Color3.new(1,1,1)ah.BackgroundTransparency=1;ah.Size=UDim2.new(0,0,1,0)ah.Font=Enum.Font.FredokaOne;ah.Text="Keybind"ah.TextColor3=Color3.new(0.784314,0.784314,0.784314)ah.TextSize=14;ah.TextXAlignment=Enum.TextXAlignment.Left;ai.Name="Input"ai.Parent=ag;ai.BackgroundColor3=Color3.new(1,1,1)ai.BackgroundTransparency=1;ai.BorderSizePixel=0;ai.Position=UDim2.new(1,-85,0,2)ai.Size=UDim2.new(0,80,1,-4)ai.ZIndex=2;ai.Font=Enum.Font.FredokaOne;ai.Text="RShift"ai.TextColor3=Color3.new(0.784314,0.784314,0.784314)ai.TextSize=12;ai.TextWrapped=true;aj.Name="Input_Roundify_4px"aj.Parent=ai;aj.BackgroundColor3=Color3.new(1,1,1)aj.BackgroundTransparency=1;aj.Size=UDim2.new(1,0,1,0)aj.Image="rbxassetid://2851929490"aj.ImageColor3=Color3.new(0.290196,0.294118,0.313726)aj.ScaleType=Enum.ScaleType.Slice;aj.SliceCenter=Rect.new(4,4,4,4)ak.Name="Windows"ak.Parent=b;ak.BackgroundColor3=Color3.new(1,1,1)ak.BackgroundTransparency=1;ak.Position=UDim2.new(0,20,0,20)ak.Size=UDim2.new(1,20,1,-20)script.Parent=b;local al=game:GetService("UserInputService")local am=game:GetService("TweenService")local an=game:GetService("RunService")local ao=game:GetService("Players")local ap=ao.LocalPlayer;local aq=ap:GetMouse()local c=script.Parent:WaitForChild("Prefabs")local ak=script.Parent:FindFirstChild("Windows")local ar={binding=false}local as={}local function at(au)table.insert(as,au)return au end;local function av()for aw,au in ipairs(as)do if au.Connected then au:Disconnect()end end;as={}end;at(al.InputBegan:Connect(function(ax,ay)if ax.KeyCode==(typeof(a.toggle_key)=="EnumItem"and a.toggle_key or Enum.KeyCode.RightShift)then if script.Parent and not ar.binding then script.Parent.Enabled=not script.Parent.Enabled end end end))local function az(aA,aB,aC)aC=aC or 0.1;if aC==0 then for aD,aE in pairs(aB)do aA[aD]=aE end;return end;local aF=TweenInfo.new(aC,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local aG=am:Create(aA,aF,aB)aG:Play()return aG end;local function aH(aI,aJ,aK)local aL=aI:FindFirstChild("UIGradient")if aL then aL:Destroy()end;if typeof(aJ)=="Color3"then aJ={aJ}end;if not aJ or#aJ==0 then return end;if#aJ==1 then if aI:IsA("ImageLabel")or aI:IsA("ImageButton")then aI.ImageColor3=aJ[1]else aI.BackgroundColor3=aJ[1]end;return end;local aM=Instance.new("UIGradient")aM.Parent=aI;aM.Rotation=aK or 0;local aN={}if#aJ==2 then aN={ColorSequenceKeypoint.new(0,aJ[1]),ColorSequenceKeypoint.new(1,aJ[2])}elseif#aJ>=3 then aN={ColorSequenceKeypoint.new(0,aJ[1]),ColorSequenceKeypoint.new(0.5,aJ[2]),ColorSequenceKeypoint.new(1,aJ[3])}end;aM.Color=ColorSequence.new(aN)if aI:IsA("ImageLabel")or aI:IsA("ImageButton")then aI.ImageColor3=Color3.new(1,1,1)else aI.BackgroundColor3=Color3.new(1,1,1)end end;local function aO(aP,aQ,aR)aP,aQ,aR=aP/255,aQ/255,aR/255;local aS,aT=math.max(aP,aQ,aR),math.min(aP,aQ,aR)local aU,aV,aW=0,0,aS;local aX=aS-aT;aV=aS==0 and 0 or aX/aS;if aS==aT then aU=0 else if aS==aP then aU=(aQ-aR)/aX+(aQ<aR and 6 or 0)elseif aS==aQ then aU=(aR-aP)/aX+2 elseif aS==aR then aU=(aP-aQ)/aX+4 end;aU=aU/6 end;return aU,aV,aW end;local function aY(aZ,aD)local a_,b0=pcall(function()return aZ[tostring(aD)]end)return a_ and b0 end;local function b1(b2)return b2.TextBounds.X+15 end;local function b3()return Vector2.new(al:GetMouseLocation().X+1,al:GetMouseLocation().Y-35)end;local function b4(b5,b6,b7)task.spawn(function()b5.ClipsDescendants=true;local b8=c:FindFirstChild("Circle"):Clone()b8.Parent=b5;b8.ZIndex=1000;local b9=b6-b8.AbsolutePosition.X;local ba=b7-b8.AbsolutePosition.Y;b8.Position=UDim2.new(0,b9,0,ba)local bb=math.max(b5.AbsoluteSize.X,b5.AbsoluteSize.Y)*1.5;b8:TweenSizeAndPosition(UDim2.new(0,bb,0,bb),UDim2.new(0.5,-bb/2,0.5,-bb/2),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.5,false)az(b8,{ImageTransparency=1},0.5)task.wait(0.5)b8:Destroy()end)end;local bc=0;local bd={}local function be()local bf=c:FindFirstChild("UIListLayout"):Clone()bf.Parent=ak;local bg={}for aw,aW in ipairs(ak:GetChildren())do if not aW:IsA("UIListLayout")then bg[aW]=aW.AbsolutePosition end end;bf:Destroy()for bh,aW in pairs(bg)do bh.Position=UDim2.new(0,aW.X,0,aW.Y)end end;function bd:FormatWindows()be()end;function bd:AddWindow(bi,bj)bc=bc+1;local bk=false;bi=tostring(bi or"New Window")bj=typeof(bj)=="table"and bj or a;bj.tween_time=bj.tween_time or 0.1;bj.title_bar=bj.title_bar or{Color3.fromRGB(41,74,122)}if typeof(bj.title_bar)=="Color3"then bj.title_bar={bj.title_bar}end;bj.title_bar_transparency=bj.title_bar_transparency or 0;bj.background=bj.background or{Color3.new(0.08,0.09,0.1)}if typeof(bj.background)=="Color3"then bj.background={bj.background}end;bj.background_transparency=bj.background_transparency or 0.1;if not bj.main_color then bj.main_color=bj.title_bar[1]end;local e=c:FindFirstChild("Window"):Clone()e.Parent=ak;e:FindFirstChild("Title").Text=bi;e.Size=UDim2.new(0,bj.min_size.X,0,bj.min_size.Y)e.ZIndex=e.ZIndex+bc*10;do local g=e:FindFirstChild("Bar")local l=g:FindFirstChild("Title")local h=g:FindFirstChild("Toggle")local i=g:FindFirstChild("Base")local j=g:FindFirstChild("Top")local m=e:FindFirstChild("TabSelection")local bl=m:FindFirstChild("Frame")local bm=24;local bn=(bm-18)/2;g.Size=UDim2.new(1,0,0,bm)g.Position=UDim2.new(0,0,0,0)if i then i:Destroy()end;if j then j:Destroy()end;local bo=Instance.new("UICorner")bo.CornerRadius=UDim.new(0,5)bo.Parent=g;if h then h.Position=UDim2.new(0,5,0,bn)end;if l then local bp=25;local bq=5;l.Position=UDim2.new(0,bp,0,bn)l.Size=UDim2.new(1,-(bp+bq),1,-bn*2)l.TextXAlignment=Enum.TextXAlignment.Center end;g.BackgroundTransparency=bj.title_bar_transparency;aH(g,bj.title_bar,0)if m then m.Size=UDim2.new(1,-30,0,22)m.Position=UDim2.new(0,15,0,28)local br=Instance.new("UICorner")br.CornerRadius=UDim.new(0,6)br.Parent=m;m.ImageTransparency=0.4;aH(m,bj.title_bar,45)local bs=m:FindFirstChild("TabScrolling")if bs then local bt=bs:FindFirstChild("TabButtons")if bt then local bu=bt:FindFirstChild("UIListLayout")if bu then bu.VerticalAlignment=Enum.VerticalAlignment.Center;bu.Padding=UDim.new(0,12)end end end;if bl then bl:Destroy()end end;e.ImageTransparency=bj.background_transparency;aH(e,bj.background,45)local bv=e:FindFirstChild("Tabs")h.MouseButton1Click:Connect(function()local bw=bv.Visible;if bw then bv.Visible=false;az(e,{Size=UDim2.new(0,e.AbsoluteSize.X,0,bm)},bj.tween_time)else bv.Visible=true;e.Size=UDim2.new(0,e.AbsoluteSize.X,0,bj.min_size.Y)end end)end;local f=e:WaitForChild("Resizer")local bx={}e.Draggable=true;do local by=aq.Icon;local bz=false;f.MouseEnter:Connect(function()e.Draggable=false;if bj.can_resize then by=aq.Icon end;bz=true end)f.MouseLeave:Connect(function()bz=false;if bj.can_resize then aq.Icon=by end;e.Draggable=true end)local bA=false;local bB;al.InputBegan:Connect(function(bC)if bC.UserInputType==Enum.UserInputType.MouseButton1 then bA=true;if bz and f.Active and bj.can_resize then bB=an.Heartbeat:Connect(function()if not bA or not f.Active then if bB then bB:Disconnect()bB=nil end;return end;local bD=b3()local b6=bD.X-e.AbsolutePosition.X;local b7=bD.Y-e.AbsolutePosition.Y;b6=math.max(bj.min_size.X,b6)b7=math.max(bj.min_size.Y,b7)e.Size=UDim2.new(0,b6,0,b7)end)end end end)al.InputEnded:Connect(function(bC)if bC.UserInputType==Enum.UserInputType.MouseButton1 then bA=false;if bB then bB:Disconnect()bB=nil end end end)end;do local bE=e:FindFirstChild("Bar"):FindFirstChild("Toggle")local bF=true;local bG=true;local bH={}local bI=e.AbsoluteSize.Y;bE.MouseButton1Click:Connect(function()if not bG then return end;bG=false;if bF then bH={}for aw,aW in ipairs(e:FindFirstChild("Tabs"):GetChildren())do bH[aW]=aW.Visible;aW.Visible=false end;f.Active=false;bI=e.AbsoluteSize.Y;az(bE,{Rotation=0},bj.tween_time)local aG=az(e,{Size=UDim2.new(0,e.AbsoluteSize.X,0,26)},bj.tween_time)if bE.Parent:FindFirstChild("Base")then bE.Parent:FindFirstChild("Base").Transparency=1 end else for bh,aW in pairs(bH)do bh.Visible=aW end;f.Active=true;az(bE,{Rotation=0},bj.tween_time)local aG=az(e,{Size=UDim2.new(0,e.AbsoluteSize.X,0,bI)},bj.tween_time)if bE.Parent:FindFirstChild("Base")then bE.Parent:FindFirstChild("Base").Transparency=bj.title_bar_transparency end end;bF=not bF;task.delay(bj.tween_time,function()bG=true end)end)end;do local bJ=e:FindFirstChild("Tabs")local bK=e:FindFirstChild("TabSelection")local bL=bK:FindFirstChild("TabScrolling")local bM=bL:FindFirstChild("TabButtons")local bN=nil;local bO=nil;local function bP()local bQ=0;local bR=bM:FindFirstChildOfClass("UIListLayout").Padding.Offset or 0;for aw,bS in ipairs(bM:GetChildren())do if bS:IsA("TextButton")then bQ=bQ+bS.AbsoluteSize.X+bR end end;bM.Size=UDim2.new(0,bQ,1,0)if bL then bL.CanvasSize=UDim2.new(0,bQ,0,0)end end;function bx:AddTab(bT)local bU={}bT=tostring(bT or"New Tab")bK.Visible=true;local bV=c:FindFirstChild("TabButton"):Clone()bV.Parent=bM;bV.Text=bT;bV.Size=UDim2.new(0,b1(bV)+20,0,18)bV.ZIndex=bV.ZIndex+bc*10;bV.BackgroundTransparency=1;local bW=bV:GetChildren()[1]bW.ZIndex=bV.ZIndex+bc*10;bW.ImageTransparency=1;local bX=Instance.new("UICorner")bX.CornerRadius=UDim.new(0,4)bX.Parent=bV;bV.TextColor3=Color3.fromRGB(200,200,200)bV.TextSize=13;bV.Font=Enum.Font.FredokaOne;local bY=Instance.new("UIStroke")bY.Color=Color3.new(0,0,0)bY.Thickness=1.2;bY.Transparency=0.7;bY.Parent=bV;local bZ=Instance.new("Frame")bZ.Name="TabOutline"bZ.Size=UDim2.new(1,0,1,0)bZ.BackgroundTransparency=1;bZ.BorderSizePixel=2;bZ.BorderColor3=bj.main_color;bZ.ZIndex=bV.ZIndex+10;bZ.Visible=false;local b_=Instance.new("UICorner")b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ;bZ.Parent=bV;local c0=c:FindFirstChild("Tab"):Clone()c0.Parent=bJ;c0.ZIndex=c0.ZIndex+bc*10;c0.Visible=false;c0.ClipsDescendants=false;c0.Size=UDim2.new(1,0,1,0)c0.BackgroundTransparency=1;local c1=Instance.new("ScrollingFrame")c1.Name="TabScroller"c1.Parent=c0;c1.Size=UDim2.new(1,0,1,0)c1.BackgroundTransparency=1;c1.BorderSizePixel=0;c1.ScrollBarThickness=4;c1.CanvasSize=UDim2.new(0,0,0,0)c1.ZIndex=c0.ZIndex;c1.ScrollBarImageColor3=Color3.fromRGB(255,0,0)c1.ScrollBarImageTransparency=0.4;local bu=c0:FindFirstChildOfClass("UIListLayout")if bu then bu.Parent=c1 end;local function c2()local c3=bu.AbsoluteContentSize.Y;c1.CanvasSize=UDim2.new(0,0,0,c3+10)end;bu:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(c2)c2()task.defer(bP)local function c4(b5)if b5~=bN then return end;local c5=b5.AbsoluteSize;for bh=1,3 do task.spawn(function()local c6=Instance.new("Frame")c6.Name="SimpleParticle"c6.Size=UDim2.new(0,1.5,0,1.5)c6.AnchorPoint=Vector2.new(0.5,0.5)c6.BackgroundColor3=Color3.fromRGB(255,255,255)c6.BorderSizePixel=0;c6.ZIndex=b5.ZIndex+15;local bo=Instance.new("UICorner")bo.CornerRadius=UDim.new(1,0)bo.Parent=c6;local c7=math.random(1,4)local c8,c9=0,0;if c7==1 then c8=math.random(5,c5.X-5)c9=1 elseif c7==2 then c8=c5.X-1;c9=math.random(5,c5.Y-5)elseif c7==3 then c8=math.random(5,c5.X-5)c9=c5.Y-1 else c8=1;c9=math.random(5,c5.Y-5)end;c6.Position=UDim2.new(0,c8,0,c9)c6.Parent=b5;local ca,cb=c5.X/2,c5.Y/2;local cc,cd=c8-ca,c9-cb;local ce=math.sqrt(cc*cc+cd*cd)cc,cd=cc/ce,cd/ce;local cf=c8+cc*6;local cg=c9+cd*6;local aF=TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local aG=am:Create(c6,aF,{Position=UDim2.new(0,cf,0,cg),BackgroundTransparency=1})aG:Play()task.wait(0.5)if c6 and c6.Parent then c6:Destroy()end end)end end;local function ch()if bO then bO:Disconnect()end;bO=an.Heartbeat:Connect(function()if bN and bN.Parent then c4(bN)task.wait(0.2)end end)end;local function ci()if bk then return end;if bN and bN~=bV then local cj=bN:FindFirstChild("TabOutline")if cj then cj.Visible=false end;bN.TextColor3=Color3.fromRGB(200,200,200)end;for aw,aW in ipairs(bJ:GetChildren())do if aW:IsA("Frame")then aW.Visible=false end end;bN=bV;local ck=bV:FindFirstChild("TabOutline")if ck then ck.Visible=true;ck.BorderColor3=bj.main_color end;bV.TextColor3=Color3.new(1,1,1)ch()c0.Visible=true end;bV.MouseButton1Click:Connect(ci)bV.MouseEnter:Connect(function()if bV~=bN then bV.TextColor3=Color3.fromRGB(230,230,230)end end)bV.MouseLeave:Connect(function()if bV~=bN then bV.TextColor3=Color3.fromRGB(200,200,200)end end)function bU:Show()ci()end;bV.AncestryChanged:Connect(function()if not bV.Parent then if bN==bV then bN=nil;if bO then bO:Disconnect()bO=nil end end end end)if#bM:GetChildren()==2 then ci()end;do function bU:AddLabel(cl)cl=tostring(cl or"New Label")local cm=c:FindFirstChild("Label"):Clone()local c1=c0:FindFirstChild("TabScroller")cm.Parent=c1 or c0;cm.Text=cl;cm.Size=UDim2.new(0,b1(cm),0,20)cm.ZIndex=cm.ZIndex+bc*10;return cm end;function bU:AddButton(cn,co)cn=tostring(cn or"New Button")co=typeof(co)=="function"and co or function()end;local b5=c:FindFirstChild("Button"):Clone()local c1=c0:FindFirstChild("TabScroller")b5.Parent=c1 or c0;b5.Text=cn;b5.Size=UDim2.new(0,b1(b5),0,20)b5.ZIndex=b5.ZIndex+bc*10;local cp=b5:GetChildren()[1]cp.ZIndex=cp.ZIndex+bc*10;cp.ImageTransparency=bj.title_bar_transparency or 0;aH(cp,bj.title_bar,0)b5.TextColor3=Color3.new(1,1,1)b5.MouseButton1Click:Connect(function()b4(b5,aq.X,aq.Y)pcall(co)end)return b5 end;function bU:AddSwitch(cq,co)local cr={}cq=tostring(cq or"New Switch")co=typeof(co)=="function"and co or function()end;local cs=c:FindFirstChild("Switch"):Clone()local c1=c0:FindFirstChild("TabScroller")cs.Parent=c1 or c0;cs:FindFirstChild("Title").Text=cq;cs:FindFirstChild("Title").ZIndex=cs:FindFirstChild("Title").ZIndex+bc*10;cs.ZIndex=cs.ZIndex+bc*10;local ct=cs:GetChildren()[1]ct.ZIndex=ct.ZIndex+bc*10;ct.ImageTransparency=bj.title_bar_transparency or 0;aH(ct,bj.title_bar,0)local cu=false;cs.MouseButton1Click:Connect(function()cu=not cu;cs.Text=cu and utf8.char(10003)or""pcall(co,cu)end)function cr:Set(cv)cu=typeof(cv)=="boolean"and cv or false;cs.Text=cu and utf8.char(10003)or""pcall(co,cu)end;return cr,cs end;function bU:AddTextBox(cw,co,cx)cw=tostring(cw or"New TextBox")co=typeof(co)=="function"and co or function()end;cx=typeof(cx)=="table"and cx or{clear=false}cx.clear=cx.clear==true;local cy=c:FindFirstChild("TextBox"):Clone()cy.Size=UDim2.new(0.5,-5,0,20)local c1=c0:FindFirstChild("TabScroller")cy.Parent=c1 or c0;cy.PlaceholderText=cw;cy.ZIndex=cy.ZIndex+bc*10;local cz=cy:GetChildren()[1]cz.ZIndex=cz.ZIndex+bc*10;cz.ImageTransparency=bj.title_bar_transparency or 0;aH(cz,bj.title_bar,0)cy.TextColor3=Color3.new(1,1,1)cy.PlaceholderColor3=Color3.fromRGB(200,200,200)cy.FocusLost:Connect(function(cA)if cA and#cy.Text>0 then pcall(co,cy.Text)if cx.clear then cy.Text=""end end end)return cy end;function bU:AddSlider(cB,co,cC)local cD={}cB=tostring(cB or"New Slider")co=typeof(co)=="function"and co or function()end;cC=typeof(cC)=="table"and cC or{}cC.min=cC.min or 0;cC.max=cC.max or 100;cC.readonly=cC.readonly or false;local cE=c:FindFirstChild("Slider"):Clone()local c1=c0:FindFirstChild("TabScroller")cE.Parent=c1 or c0;cE.ZIndex=cE.ZIndex+bc*10;local bi=cE:FindFirstChild("Title")local cF=cE:FindFirstChild("Indicator")local cG=cE:FindFirstChild("Value")bi.ZIndex=bi.ZIndex+bc*10;cF.ZIndex=cF.ZIndex+bc*10;cG.ZIndex=cG.ZIndex+bc*10;bi.Text=cB;local bz=false;local cH;cE.MouseEnter:Connect(function()bz=true;e.Draggable=false end)cE.MouseLeave:Connect(function()bz=false;e.Draggable=true end)local bA=false;al.InputBegan:Connect(function(bC)if bC.UserInputType==Enum.UserInputType.MouseButton1 then bA=true;if bz and not cC.readonly then cH=an.Heartbeat:Connect(function()if not bA or bk then if cH then cH:Disconnect()cH=nil end;return end;local bD=b3()local b6=math.clamp((bD.X-cE.AbsolutePosition.X)/cE.AbsoluteSize.X,0,1)cF.Size=UDim2.new(b6,0,0,20)local ap=math.floor(b6*100)local cI=cC.max;local cJ=cC.min;local cK=cI-cJ;local cL=math.floor(cK/100*ap+cJ)cG.Text=tostring(cL)pcall(co,cL)end)end end end)al.InputEnded:Connect(function(bC)if bC.UserInputType==Enum.UserInputType.MouseButton1 then bA=false;if cH then cH:Disconnect()cH=nil end end end)function cD:Set(cM)cM=tonumber(cM)or 0;cM=math.clamp(cM,0,100)/100;cF.Size=UDim2.new(cM,0,0,20)local ap=math.floor(cM*100)local cI=cC.max;local cJ=cC.min;local cK=cI-cJ;local cL=math.floor(cK/100*ap+cJ)cG.Text=tostring(cL)pcall(co,cL)end;cD:Set(cC.min)return cD,cE end;function bU:AddKeybind(cN,co,cO)local cP={}cN=tostring(cN or"New Keybind")co=typeof(co)=="function"and co or function()end;cO=typeof(cO)=="table"and cO or{}cO.standard=cO.standard or Enum.KeyCode.RightShift;local cQ=c:FindFirstChild("Keybind"):Clone()local ax=cQ:FindFirstChild("Input")local bi=cQ:FindFirstChild("Title")cQ.ZIndex=cQ.ZIndex+bc*10;ax.ZIndex=ax.ZIndex+bc*10;ax:GetChildren()[1].ZIndex=ax:GetChildren()[1].ZIndex+bc*10;bi.ZIndex=bi.ZIndex+bc*10;local c1=c0:FindFirstChild("TabScroller")cQ.Parent=c1 or c0;bi.Text="  "..cN;cQ.Size=UDim2.new(0,b1(bi)+80,0,20)local cR={RightControl="RightCtrl",LeftControl="LeftCtrl",LeftShift="LShift",RightShift="RShift",MouseButton1="Mouse1",MouseButton2="Mouse2"}local cS=cO.standard;function cP:SetKeybind(ag)local cT=cR[ag.Name]or ag.Name;ax.Text=cT;cS=ag end;al.InputBegan:Connect(function(cU,aR)if ar.binding then task.defer(function()ar.binding=false end)return end;if cU.KeyCode==cS and not aR then pcall(co,cS)end end)cP:SetKeybind(cO.standard)ax.MouseButton1Click:Connect(function()if ar.binding then return end;ax.Text="..."ar.binding=true;local cU=al.InputBegan:Wait()cP:SetKeybind(cU.KeyCode)end)return cP,cQ end;function bU:AddDropdown(cV,co)local cW={}cV=tostring(cV or"New Dropdown")co=typeof(co)=="function"and co or function()end;local cX=c:FindFirstChild("Dropdown"):Clone()local cY=cX:FindFirstChild("Box")local cZ=cY:FindFirstChild("Objects")local cF=cX:FindFirstChild("Indicator")cX.ZIndex=cX.ZIndex+bc*10;cY.ZIndex=cY.ZIndex+bc*10;cZ.ZIndex=cZ.ZIndex+bc*10;cF.ZIndex=cF.ZIndex+bc*10;cX.Size=UDim2.new(0.5,-5,0,20)local c_=cX:GetChildren()[3]c_.ZIndex=c_.ZIndex+bc*10;c_.ImageTransparency=bj.title_bar_transparency or 0;aH(c_,bj.title_bar,0)cY.ImageTransparency=bj.background_transparency or 0.1;aH(cY,bj.background,0)local d0=Instance.new("UICorner")d0.CornerRadius=UDim.new(0,6)d0.Parent=cY;cZ.BackgroundTransparency=1;cZ.Position=UDim2.new(0,0,0,0)cZ.Size=UDim2.new(1,0,1,0)local c1=c0:FindFirstChild("TabScroller")cX.Parent=c1 or c0;cX.Text="      "..cV;cY.Size=UDim2.new(1,0,0,0)cY.Position=UDim2.new(0,0,0,25)cX.TextColor3=Color3.new(1,1,1)local bF=false;local d1=false;cX.MouseButton1Click:Connect(function()bF=not bF;local d2=math.min((#cZ:GetChildren()-1)*20,200)if#cZ:GetChildren()-1>=10 then cZ.CanvasSize=UDim2.new(0,0,(#cZ:GetChildren()-1)*0.1,0)end;if bF then if bk then return end;bk=true;local d3=cX.AbsolutePosition.Y;local d4=cX.AbsoluteSize.Y;local d5=e.AbsolutePosition.Y+e.AbsoluteSize.Y;local d6=d5-(d3+d4)if d6<d2 then d1=true;cY.Position=UDim2.new(0,0,0,-d2-5)cY.Size=UDim2.new(1,0,0,0)local aF=TweenInfo.new(bj.tween_time,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local aG=am:Create(cY,aF,{Size=UDim2.new(1,0,0,d2),Position=UDim2.new(0,0,0,-d2-5)})aG:Play()az(cF,{Rotation=-90},bj.tween_time)else d1=false;cY.Position=UDim2.new(0,0,0,25)cY.Size=UDim2.new(1,0,0,0)az(cY,{Size=UDim2.new(1,0,0,d2)},bj.tween_time)az(cF,{Rotation=90},bj.tween_time)end else bk=false;if d1 then local aF=TweenInfo.new(bj.tween_time,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local aG=am:Create(cY,aF,{Size=UDim2.new(1,0,0,0),Position=UDim2.new(0,0,0,-5)})aG:Play()aG.Completed:Connect(function()cY.Position=UDim2.new(0,0,0,25)end)else az(cY,{Size=UDim2.new(1,0,0,0)},bj.tween_time)end;az(cF,{Rotation=-90},bj.tween_time)end end)function cW:Add(d7)local d8={}d7=tostring(d7 or"New Object")local aZ=c:FindFirstChild("DropdownButton"):Clone()aZ.Parent=cZ;aZ.Text="      "..d7;aZ.ZIndex=aZ.ZIndex+bc*10+5;aZ.BackgroundTransparency=1;aZ.TextColor3=Color3.new(1,1,1)aZ.BorderSizePixel=0;aZ.TextXAlignment=Enum.TextXAlignment.Left;local d9=aZ:FindFirstChildOfClass("UICorner")if d9 then d9:Destroy()end;local bY=Instance.new("UIStroke")bY.Color=Color3.new(0,0,0)bY.Thickness=1;bY.Transparency=0.3;bY.Parent=aZ;aZ.MouseEnter:Connect(function()aZ.BackgroundTransparency=0.8;aZ.BackgroundColor3=bj.main_color end)aZ.MouseLeave:Connect(function()aZ.BackgroundTransparency=1 end)if bF then local d2=math.min((#cZ:GetChildren()-1)*20,200)if#cZ:GetChildren()-1>=10 then cZ.CanvasSize=UDim2.new(0,0,(#cZ:GetChildren()-1)*0.1,0)end;if d1 then local aF=TweenInfo.new(bj.tween_time,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local aG=am:Create(cY,aF,{Size=UDim2.new(1,0,0,d2),Position=UDim2.new(0,0,0,-d2-5)})aG:Play()else az(cY,{Size=UDim2.new(1,0,0,d2)},bj.tween_time)end end;aZ.MouseButton1Click:Connect(function()if bk then cX.Text="      [ "..d7 .." ]"bk=false;bF=false;if d1 then local aF=TweenInfo.new(bj.tween_time,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)local aG=am:Create(cY,aF,{Size=UDim2.new(1,0,0,0),Position=UDim2.new(0,0,0,-5)})aG:Play()aG.Completed:Connect(function()cY.Position=UDim2.new(0,0,0,25)end)else az(cY,{Size=UDim2.new(1,0,0,0)},bj.tween_time)end;az(cF,{Rotation=-90},bj.tween_time)pcall(co,d7)end end)function d8:Remove()aZ:Destroy()end;return aZ,d8 end;function cW:Remove(da)local db=cZ:FindFirstChild(da)if db then db:Destroy()if cW.currentSelection==da then local dc=cZ:GetChildren()[1]local dd=dc and dc.Text or"No Selection"cW.currentSelection=dd;cX.Text="        [ "..dd.." ]"pcall(co,dd)end end end;return cW,cX end;function bU:AddColorPicker(co)local de={}co=typeof(co)=="function"and co or function()end;local df=c:FindFirstChild("ColorPicker"):Clone()local c1=c0:FindFirstChild("TabScroller")df.Parent=c1 or c0;df.ZIndex=df.ZIndex+bc*10;local dg=df:FindFirstChild("Palette")local dh=df:FindFirstChild("Sample")local di=df:FindFirstChild("Saturation")dg.ZIndex=dg.ZIndex+bc*10;dh.ZIndex=dh.ZIndex+bc*10;di.ZIndex=di.ZIndex+bc*10;local aU,aV,aW=0,1,1;local function dj()local dk=Color3.fromHSV(aU,aV,aW)dh.ImageColor3=dk;di.ImageColor3=Color3.fromHSV(aU,1,1)pcall(co,dk)end;local dk=Color3.fromHSV(aU,aV,aW)dh.ImageColor3=dk;di.ImageColor3=Color3.fromHSV(aU,1,1)local dl,dm=false,false;dg.MouseEnter:Connect(function()e.Draggable=false;dl=true end)dg.MouseLeave:Connect(function()e.Draggable=true;dl=false end)di.MouseEnter:Connect(function()e.Draggable=false;dm=true end)di.MouseLeave:Connect(function()e.Draggable=true;dm=false end)local dn=dg:FindFirstChild("Indicator")local dp=di:FindFirstChild("Indicator")dn.ZIndex=dn.ZIndex+bc*10;dp.ZIndex=dp.ZIndex+bc*10;local bA=false;local dq;al.InputBegan:Connect(function(bC)if bC.UserInputType==Enum.UserInputType.MouseButton1 then bA=true;dq=an.Heartbeat:Connect(function()if not bA or bk then if dq then dq:Disconnect()dq=nil end;return end;if dl then local bD=b3()local b6=math.clamp((bD.X-dg.AbsolutePosition.X)/dg.AbsoluteSize.X,0,1)local b7=math.clamp((bD.Y-dg.AbsolutePosition.Y)/dg.AbsoluteSize.Y,0,1)aU=b6;aV=1-b7;dn.Position=UDim2.new(b6,-dn.AbsoluteSize.X/2,b7,-dn.AbsoluteSize.Y/2)dj()elseif dm then local bD=b3()local b7=math.clamp((bD.Y-di.AbsolutePosition.Y)/di.AbsoluteSize.Y,0,1)aW=1-b7;dp.Position=UDim2.new(0,0,b7,0)dj()end end)end end)al.InputEnded:Connect(function(bC)if bC.UserInputType==Enum.UserInputType.MouseButton1 then bA=false;if dq then dq:Disconnect()dq=nil end end end)function de:Set(dk)dk=typeof(dk)=="Color3"and dk or Color3.new(1,1,1)local dr,ds,dt=aO(dk.r*255,dk.g*255,dk.b*255)dh.ImageColor3=dk;di.ImageColor3=Color3.fromHSV(dr,1,1)pcall(co,dk)end;return de,df end;function bU:AddHorizontalAlignment()local du={}local dv=c:FindFirstChild("HorizontalAlignment"):Clone()local c1=c0:FindFirstChild("TabScroller")dv.Parent=c1 or c0;function du:AddButton(...)local dw={bU:AddButton(...)}local aZ=dw[#dw]aZ.Parent=dv;return table.unpack(dw)end;return du,dv end;function bU:AddFolder(dx)local dy={}dx=tostring(dx or"New Folder")local dz=c:FindFirstChild("Folder"):Clone()local b5=dz:FindFirstChild("Button")local cZ=dz:FindFirstChild("Objects")local dA=b5:FindFirstChild("Toggle")dz.ZIndex=dz.ZIndex+bc*10;b5.ZIndex=b5.ZIndex+bc*10;cZ.ZIndex=cZ.ZIndex+bc*10;dA.ZIndex=dA.ZIndex+bc*10;b5:GetChildren()[1].ZIndex=b5:GetChildren()[1].ZIndex+bc*10;local c1=c0:FindFirstChild("TabScroller")dz.Parent=c1 or c0;b5.Text="      "..dx;local cp=b5:GetChildren()[1]cp.ImageColor3=bj.main_color;local function dB()local d7=25;for aw,aW in ipairs(cZ:GetChildren())do if not aW:IsA("UIListLayout")then d7=d7+aW.AbsoluteSize.Y+5 end end;return d7 end;local bF=false;local dC;b5.MouseButton1Click:Connect(function()bF=not bF;if bF then az(dA,{Rotation=90},bj.tween_time)cZ.Visible=true;if dC then dC:Disconnect()end;dC=an.Heartbeat:Connect(function()if bF then dz.Size=UDim2.new(1,0,0,dB())else if dC then dC:Disconnect()dC=nil end end end)else az(dA,{Rotation=0},bj.tween_time)cZ.Visible=false;dz.Size=UDim2.new(1,0,0,20)if dC then dC:Disconnect()dC=nil end end end)for bh,aW in pairs(bU)do dy[bh]=function(...)local dw={aW(...)}local aZ=dw[#dw]aZ.Parent=cZ;return table.unpack(dw)end end;return dy,dz end end;return bU,c0 end end;for aw,aW in ipairs(e:GetDescendants())do if aY(aW,"ZIndex")then aW.ZIndex=aW.ZIndex+bc*10 end end;return bx,e end;script.AncestryChanged:Connect(function()if not script.Parent then av()end end)return bdlocal TextLabel_2 = Instance.new("TextLabel")
local Circle = Instance.new("ImageLabel")
local UIListLayout_3 = Instance.new("UIListLayout")
local Dropdown = Instance.new("TextButton")
local Indicator_2 = Instance.new("ImageLabel")
local Box = Instance.new("ImageButton")
local Objects = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local TextButton_Roundify_4px = Instance.new("ImageLabel")
local TabButton = Instance.new("TextButton")
local TextButton_Roundify_4px_2 = Instance.new("ImageLabel")
local Folder = Instance.new("ImageLabel")
local Button = Instance.new("TextButton")
local TextButton_Roundify_4px_3 = Instance.new("ImageLabel")
local Toggle_2 = Instance.new("ImageLabel")
local Objects_2 = Instance.new("Frame")
local UIListLayout_5 = Instance.new("UIListLayout")
local HorizontalAlignment = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local Console = Instance.new("ImageLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Source = Instance.new("TextBox")
local Comments = Instance.new("TextLabel")
local Globals = Instance.new("TextLabel")
local Keywords = Instance.new("TextLabel")
local RemoteHighlight = Instance.new("TextLabel")
local Strings = Instance.new("TextLabel")
local Tokens = Instance.new("TextLabel")
local Numbers = Instance.new("TextLabel")
local Info = Instance.new("TextLabel")
local Lines = Instance.new("TextLabel")
local ColorPicker = Instance.new("ImageLabel")
local Palette = Instance.new("ImageLabel")
local Indicator_3 = Instance.new("ImageLabel")
local Sample = Instance.new("ImageLabel")
local Saturation = Instance.new("ImageLabel")
local Indicator_4 = Instance.new("Frame")
local Switch = Instance.new("TextButton")
local TextButton_Roundify_4px_4 = Instance.new("ImageLabel")
local Title_3 = Instance.new("TextLabel")
local Button_2 = Instance.new("TextButton")
local TextButton_Roundify_4px_5 = Instance.new("ImageLabel")
local DropdownButton = Instance.new("TextButton")
local Keybind = Instance.new("ImageLabel")
local Title_4 = Instance.new("TextLabel")
local Input = Instance.new("TextButton")
local Input_Roundify_4px = Instance.new("ImageLabel")
local Windows = Instance.new("Frame")

imgui.Name = "imgui"
imgui.Parent = game:GetService("CoreGui") or gethui()

Prefabs.Name = "Prefabs"
Prefabs.Parent = imgui
Prefabs.BackgroundColor3 = Color3.new(1, 1, 1)
Prefabs.Size = UDim2.new(0, 100, 0, 100)
Prefabs.Visible = false

Label.Name = "Label"
Label.Parent = Prefabs
Label.BackgroundColor3 = Color3.new(1, 1, 1)
Label.BackgroundTransparency = 1
Label.Size = UDim2.new(0, 200, 0, 20)
Label.Font = Enum.Font.GothamSemibold
Label.Text = "Hello, world 123"
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextSize = 14
Label.TextXAlignment = Enum.TextXAlignment.Left

Window.Name = "Window"
Window.Parent = Prefabs
Window.Active = true
Window.BackgroundColor3 = Color3.new(1, 1, 1)
Window.BackgroundTransparency = 1
Window.ClipsDescendants = true
Window.Position = UDim2.new(0, 20, 0, 20)
Window.Selectable = true
Window.Size = UDim2.new(0, 200, 0, 200)
Window.Image = "rbxassetid://2851926732"
Window.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
Window.ScaleType = Enum.ScaleType.Slice
Window.SliceCenter = Rect.new(12, 12, 12, 12)

Resizer.Name = "Resizer"
Resizer.Parent = Window
Resizer.Active = true
Resizer.BackgroundColor3 = Color3.new(1, 1, 1)
Resizer.BackgroundTransparency = 1
Resizer.BorderSizePixel = 0
Resizer.Position = UDim2.new(1, -20, 1, -20)
Resizer.Size = UDim2.new(0, 20, 0, 20)

Bar.Name = "Bar"
Bar.Parent = Window
Bar.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 0, 0, 5)
Bar.Size = UDim2.new(1, 0, 0, 15)

Toggle.Name = "Toggle"
Toggle.Parent = Bar
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BackgroundTransparency = 0.4
Toggle.Position = UDim2.new(0, 3, 0, -2)
Toggle.Rotation = 0
Toggle.Size = UDim2.new(0, 22, 0, 18)
Toggle.ZIndex = 2
Toggle.Text = "48"
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 10
Toggle.TextColor3 = Color3.fromRGB(220, 0, 255)
Toggle.AutoButtonColor = false
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 4)

Base.Name = "Base"
Base.Parent = Bar
Base.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Base.BorderSizePixel = 0
Base.Position = UDim2.new(0, 0, 0.800000012, 0)
Base.Size = UDim2.new(1, 0, 0, 10)
Base.Image = "rbxassetid://2851926732"
Base.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Base.ScaleType = Enum.ScaleType.Slice
Base.SliceCenter = Rect.new(12, 12, 12, 12)

Top.Name = "Top"
Top.Parent = Bar
Top.BackgroundColor3 = Color3.new(1, 1, 1)
Top.BackgroundTransparency = 1
Top.Position = UDim2.new(0, 0, 0, -5)
Top.Size = UDim2.new(1, 0, 0, 10)
Top.Image = "rbxassetid://2851926732"
Top.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Top.ScaleType = Enum.ScaleType.Slice
Top.SliceCenter = Rect.new(12, 12, 12, 12)

Tabs.Name = "Tabs"
Tabs.Parent = Window
Tabs.BackgroundColor3 = Color3.new(1, 1, 1)
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0, 15, 0, 60)
Tabs.Size = UDim2.new(1, -30, 1, -60)
Tabs.CanvasSize = UDim2.new(0, 0, 0, 0)
Tabs.AutomaticCanvasSize = Enum.AutomaticSize.Y
Tabs.ScrollBarThickness = 6
Tabs.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
Tabs.BorderSizePixel = 0

Title.Name = "Title"
Title.Parent = Window
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 30, 0, 3)
Title.Size = UDim2.new(0, 200, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gamer Time"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

TabSelection.Name = "TabSelection"
TabSelection.Parent = Window
TabSelection.BackgroundColor3 = Color3.new(1, 1, 1)
TabSelection.BackgroundTransparency = 1
TabSelection.Position = UDim2.new(0, 15, 0, 30)
TabSelection.Size = UDim2.new(1, -30, 0, 25)
TabSelection.Visible = false
TabSelection.Image = "rbxassetid://2851929490"
TabSelection.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
TabSelection.ScaleType = Enum.ScaleType.Slice
TabSelection.SliceCenter = Rect.new(4, 4, 4, 4)

TabButtons.Name = "TabButtons"
TabButtons.Parent = TabSelection
TabButtons.BackgroundColor3 = Color3.new(1, 1, 1)
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 1, 0)

UIListLayout.Parent = TabButtons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

Frame.Parent = TabSelection
Frame.BackgroundColor3 = Color3.new(0.12549, 0.227451, 0.372549)
Frame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 1, 0)
Frame.Size = UDim2.new(1, 0, 0, 2)

Tab.Name = "Tab"
Tab.Parent = Prefabs
Tab.BackgroundColor3 = Color3.new(1, 1, 1)
Tab.BackgroundTransparency = 1
Tab.Size = UDim2.new(1, 0, 1, 0)
Tab.Visible = false

UIListLayout_2.Parent = Tab
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

TextBox.Parent = Prefabs
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundTransparency = 1
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(1, 0, 0, 20)
TextBox.ZIndex = 2
TextBox.Font = Enum.Font.GothamSemibold
TextBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
TextBox.PlaceholderText = "Input Text"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TextBox.TextSize = 14

TextBox_Roundify_4px.Name = "TextBox_Roundify_4px"
TextBox_Roundify_4px.Parent = TextBox
TextBox_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox_Roundify_4px.BackgroundTransparency = 1
TextBox_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
TextBox_Roundify_4px.Image = "rbxassetid://2851929490"
TextBox_Roundify_4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextBox_Roundify_4px.ScaleType = Enum.ScaleType.Slice
TextBox_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

Slider.Name = "Slider"
Slider.Parent = Prefabs
Slider.BackgroundColor3 = Color3.new(1, 1, 1)
Slider.BackgroundTransparency = 1
Slider.Position = UDim2.new(0, 0, 0.178571433, 0)
Slider.Size = UDim2.new(1, 0, 0, 20)
Slider.Image = "rbxassetid://2851929490"
Slider.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
Slider.ScaleType = Enum.ScaleType.Slice
Slider.SliceCenter = Rect.new(4, 4, 4, 4)

Title_2.Name = "Title"
Title_2.Parent = Slider
Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
Title_2.BackgroundTransparency = 1
Title_2.Position = UDim2.new(0.5, 0, 0.5, -10)
Title_2.Size = UDim2.new(0, 0, 0, 20)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Slider"
Title_2.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_2.TextSize = 14

Indicator.Name = "Indicator"
Indicator.Parent = Slider
Indicator.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator.BackgroundTransparency = 1
Indicator.Size = UDim2.new(0, 0, 0, 20)
Indicator.Image = "rbxassetid://2851929490"
Indicator.ImageColor3 = Color3.new(0.254902, 0.262745, 0.278431)
Indicator.ScaleType = Enum.ScaleType.Slice
Indicator.SliceCenter = Rect.new(4, 4, 4, 4)

Value.Name = "Value"
Value.Parent = Slider
Value.BackgroundColor3 = Color3.new(1, 1, 1)
Value.BackgroundTransparency = 1
Value.Position = UDim2.new(1, -55, 0.5, -10)
Value.Size = UDim2.new(0, 50, 0, 20)
Value.Font = Enum.Font.GothamBold
Value.Text = "0%"
Value.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Value.TextSize = 14

TextLabel.Parent = Slider
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(1, -20, -0.75, 0)
TextLabel.Size = UDim2.new(0, 26, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "]"
TextLabel.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextLabel.TextSize = 14

TextLabel_2.Parent = Slider
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(1, -65, -0.75, 0)
TextLabel_2.Size = UDim2.new(0, 26, 0, 50)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "["
TextLabel_2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextLabel_2.TextSize = 14

Circle.Name = "Circle"
Circle.Parent = Prefabs
Circle.BackgroundColor3 = Color3.new(1, 1, 1)
Circle.BackgroundTransparency = 1
Circle.Image = "rbxassetid://266543268"
Circle.ImageTransparency = 0.5

UIListLayout_3.Parent = Prefabs
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 20)

Dropdown.Name = "Dropdown"
Dropdown.Parent = Prefabs
Dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
Dropdown.BackgroundTransparency = 1
Dropdown.BorderSizePixel = 0
Dropdown.Position = UDim2.new(-0.055555556, 0, 0.0833333284, 0)
Dropdown.Size = UDim2.new(0, 200, 0, 20)
Dropdown.ZIndex = 2
Dropdown.Font = Enum.Font.GothamBold
Dropdown.Text = "      Dropdown"
Dropdown.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Dropdown.TextSize = 14
Dropdown.TextXAlignment = Enum.TextXAlignment.Left

Indicator_2.Name = "Indicator"
Indicator_2.Parent = Dropdown
Indicator_2.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_2.BackgroundTransparency = 1
Indicator_2.Position = UDim2.new(0.899999976, -10, 0.100000001, 0)
Indicator_2.Rotation = -90
Indicator_2.Size = UDim2.new(0, 15, 0, 15)
Indicator_2.ZIndex = 2
Indicator_2.Image = "rbxassetid://109520830767436"  -- Nuevo ícono

Box.Name = "Box"
Box.Parent = Dropdown
Box.BackgroundColor3 = Color3.new(1, 1, 1)
Box.BackgroundTransparency = 1
Box.Position = UDim2.new(0, 0, 0, 25)
Box.Size = UDim2.new(1, 0, 0, 150)
Box.ZIndex = 3
Box.Image = "rbxassetid://2851929490"
Box.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
Box.ScaleType = Enum.ScaleType.Slice
Box.SliceCenter = Rect.new(4, 4, 4, 4)

Objects.Name = "Objects"
Objects.Parent = Box
Objects.BackgroundColor3 = Color3.new(1, 1, 1)
Objects.BackgroundTransparency = 1
Objects.BorderSizePixel = 0
Objects.Size = UDim2.new(1, 0, 1, 0)
Objects.ZIndex = 3
Objects.CanvasSize = UDim2.new(0, 0, 0, 0)
Objects.ScrollBarThickness = 8

UIListLayout_4.Parent = Objects
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

TextButton_Roundify_4px.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px.Parent = Dropdown
TextButton_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px.BackgroundTransparency = 1
TextButton_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextButton_Roundify_4px.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

TabButton.Name = "TabButton"
TabButton.Parent = Prefabs
TabButton.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TabButton.BackgroundTransparency = 1
TabButton.BorderSizePixel = 0
TabButton.Position = UDim2.new(0.185185179, 0, 0, 0)
TabButton.Size = UDim2.new(0, 71, 0, 20)
TabButton.ZIndex = 2
TabButton.Font = Enum.Font.GothamSemibold
TabButton.Text = "Test tab"
TabButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TabButton.TextSize = 14

TextButton_Roundify_4px_2.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_2.Parent = TabButton
TextButton_Roundify_4px_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_2.BackgroundTransparency = 1
TextButton_Roundify_4px_2.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_2.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_2.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextButton_Roundify_4px_2.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_2.SliceCenter = Rect.new(4, 4, 4, 4)

Folder.Name = "Folder"
Folder.Parent = Prefabs
Folder.BackgroundColor3 = Color3.new(1, 1, 1)
Folder.BackgroundTransparency = 1
Folder.Position = UDim2.new(0, 0, 0, 50)
Folder.Size = UDim2.new(1, 0, 0, 20)
Folder.Image = "rbxassetid://2851929490"
Folder.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
Folder.ScaleType = Enum.ScaleType.Slice
Folder.SliceCenter = Rect.new(4, 4, 4, 4)

Button.Name = "Button"
Button.Parent = Folder
Button.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Button.BackgroundTransparency = 1
Button.BorderSizePixel = 0
Button.Size = UDim2.new(1, 0, 0, 20)
Button.ZIndex = 2
Button.Font = Enum.Font.GothamSemibold
Button.Text = "      Folder"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 14
Button.TextXAlignment = Enum.TextXAlignment.Left

TextButton_Roundify_4px_3.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_3.Parent = Button
TextButton_Roundify_4px_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_3.BackgroundTransparency = 1
TextButton_Roundify_4px_3.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_3.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_3.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_3.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_3.SliceCenter = Rect.new(4, 4, 4, 4)

Toggle_2.Name = "Toggle"
Toggle_2.Parent = Button
Toggle_2.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle_2.BackgroundTransparency = 1
Toggle_2.Position = UDim2.new(0, 5, 0, 0)
Toggle_2.Size = UDim2.new(0, 20, 0, 20)
Toggle_2.Image = "rbxassetid://109520830767436"  -- Nuevo ícono

Objects_2.Name = "Objects"
Objects_2.Parent = Folder
Objects_2.BackgroundColor3 = Color3.new(1, 1, 1)
Objects_2.BackgroundTransparency = 1
Objects_2.Position = UDim2.new(0, 10, 0, 25)
Objects_2.Size = UDim2.new(1, -10, 1, -25)
Objects_2.Visible = false

UIListLayout_5.Parent = Objects_2
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 5)

HorizontalAlignment.Name = "HorizontalAlignment"
HorizontalAlignment.Parent = Prefabs
HorizontalAlignment.BackgroundColor3 = Color3.new(1, 1, 1)
HorizontalAlignment.BackgroundTransparency = 1
HorizontalAlignment.Size = UDim2.new(1, 0, 0, 20)

UIListLayout_6.Parent = HorizontalAlignment
UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.Padding = UDim.new(0, 5)

Console.Name = "Console"
Console.Parent = Prefabs
Console.BackgroundColor3 = Color3.new(1, 1, 1)
Console.BackgroundTransparency = 1
Console.Size = UDim2.new(1, 0, 0, 200)
Console.Image = "rbxassetid://2851928141"
Console.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
Console.ScaleType = Enum.ScaleType.Slice
Console.SliceCenter = Rect.new(8, 8, 8, 8)

ScrollingFrame.Parent = Console
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 1)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 4

Source.Name = "Source"
Source.Parent = ScrollingFrame
Source.BackgroundColor3 = Color3.new(1, 1, 1)
Source.BackgroundTransparency = 1
Source.Position = UDim2.new(0, 40, 0, 0)
Source.Size = UDim2.new(1, -40, 0, 10000)
Source.ZIndex = 3
Source.ClearTextOnFocus = false
Source.Font = Enum.Font.Code
Source.MultiLine = true
Source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
Source.Text = ""
Source.TextColor3 = Color3.new(1, 1, 1)
Source.TextSize = 15
Source.TextStrokeColor3 = Color3.new(1, 1, 1)
Source.TextWrapped = true
Source.TextXAlignment = Enum.TextXAlignment.Left
Source.TextYAlignment = Enum.TextYAlignment.Top

Comments.Name = "Comments"
Comments.Parent = Source
Comments.BackgroundColor3 = Color3.new(1, 1, 1)
Comments.BackgroundTransparency = 1
Comments.Size = UDim2.new(1, 0, 1, 0)
Comments.ZIndex = 5
Comments.Font = Enum.Font.Code
Comments.Text = ""
Comments.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
Comments.TextSize = 15
Comments.TextXAlignment = Enum.TextXAlignment.Left
Comments.TextYAlignment = Enum.TextYAlignment.Top

Globals.Name = "Globals"
Globals.Parent = Source
Globals.BackgroundColor3 = Color3.new(1, 1, 1)
Globals.BackgroundTransparency = 1
Globals.Size = UDim2.new(1, 0, 1, 0)
Globals.ZIndex = 5
Globals.Font = Enum.Font.Code
Globals.Text = ""
Globals.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
Globals.TextSize = 15
Globals.TextXAlignment = Enum.TextXAlignment.Left
Globals.TextYAlignment = Enum.TextYAlignment.Top

Keywords.Name = "Keywords"
Keywords.Parent = Source
Keywords.BackgroundColor3 = Color3.new(1, 1, 1)
Keywords.BackgroundTransparency = 1
Keywords.Size = UDim2.new(1, 0, 1, 0)
Keywords.ZIndex = 5
Keywords.Font = Enum.Font.Code
Keywords.Text = ""
Keywords.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
Keywords.TextSize = 15
Keywords.TextXAlignment = Enum.TextXAlignment.Left
Keywords.TextYAlignment = Enum.TextYAlignment.Top

RemoteHighlight.Name = "RemoteHighlight"
RemoteHighlight.Parent = Source
RemoteHighlight.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteHighlight.BackgroundTransparency = 1
RemoteHighlight.Size = UDim2.new(1, 0, 1, 0)
RemoteHighlight.ZIndex = 5
RemoteHighlight.Font = Enum.Font.Code
RemoteHighlight.Text = ""
RemoteHighlight.TextColor3 = Color3.new(0, 0.568627, 1)
RemoteHighlight.TextSize = 15
RemoteHighlight.TextXAlignment = Enum.TextXAlignment.Left
RemoteHighlight.TextYAlignment = Enum.TextYAlignment.Top

Strings.Name = "Strings"
Strings.Parent = Source
Strings.BackgroundColor3 = Color3.new(1, 1, 1)
Strings.BackgroundTransparency = 1
Strings.Size = UDim2.new(1, 0, 1, 0)
Strings.ZIndex = 5
Strings.Font = Enum.Font.Code
Strings.Text = ""
Strings.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
Strings.TextSize = 15
Strings.TextXAlignment = Enum.TextXAlignment.Left
Strings.TextYAlignment = Enum.TextYAlignment.Top

Tokens.Name = "Tokens"
Tokens.Parent = Source
Tokens.BackgroundColor3 = Color3.new(1, 1, 1)
Tokens.BackgroundTransparency = 1
Tokens.Size = UDim2.new(1, 0, 1, 0)
Tokens.ZIndex = 5
Tokens.Font = Enum.Font.Code
Tokens.Text = ""
Tokens.TextColor3 = Color3.new(1, 1, 1)
Tokens.TextSize = 15
Tokens.TextXAlignment = Enum.TextXAlignment.Left
Tokens.TextYAlignment = Enum.TextYAlignment.Top

Numbers.Name = "Numbers"
Numbers.Parent = Source
Numbers.BackgroundColor3 = Color3.new(1, 1, 1)
Numbers.BackgroundTransparency = 1
Numbers.Size = UDim2.new(1, 0, 1, 0)
Numbers.ZIndex = 4
Numbers.Font = Enum.Font.Code
Numbers.Text = ""
Numbers.TextColor3 = Color3.new(1, 0.776471, 0)
Numbers.TextSize = 15
Numbers.TextXAlignment = Enum.TextXAlignment.Left
Numbers.TextYAlignment = Enum.TextYAlignment.Top

Info.Name = "Info"
Info.Parent = Source
Info.BackgroundColor3 = Color3.new(1, 1, 1)
Info.BackgroundTransparency = 1
Info.Size = UDim2.new(1, 0, 1, 0)
Info.ZIndex = 5
Info.Font = Enum.Font.Code
Info.Text = ""
Info.TextColor3 = Color3.new(0, 0.635294, 1)
Info.TextSize = 15
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.TextYAlignment = Enum.TextYAlignment.Top

Lines.Name = "Lines"
Lines.Parent = ScrollingFrame
Lines.BackgroundColor3 = Color3.new(1, 1, 1)
Lines.BackgroundTransparency = 1
Lines.BorderSizePixel = 0
Lines.Size = UDim2.new(0, 40, 0, 10000)
Lines.ZIndex = 4
Lines.Font = Enum.Font.Code
Lines.Text = "1\n"
Lines.TextColor3 = Color3.new(1, 1, 1)
Lines.TextSize = 15
Lines.TextWrapped = true
Lines.TextYAlignment = Enum.TextYAlignment.Top

ColorPicker.Name = "ColorPicker"
ColorPicker.Parent = Prefabs
ColorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
ColorPicker.BackgroundTransparency = 1
ColorPicker.Size = UDim2.new(0, 180, 0, 110)
ColorPicker.Image = "rbxassetid://2851929490"
ColorPicker.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
ColorPicker.ScaleType = Enum.ScaleType.Slice
ColorPicker.SliceCenter = Rect.new(4, 4, 4, 4)

Palette.Name = "Palette"
Palette.Parent = ColorPicker
Palette.BackgroundColor3 = Color3.new(1, 1, 1)
Palette.BackgroundTransparency = 1
Palette.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
Palette.Size = UDim2.new(0, 100, 0, 100)
Palette.Image = "rbxassetid://698052001"
Palette.ScaleType = Enum.ScaleType.Slice
Palette.SliceCenter = Rect.new(4, 4, 4, 4)

Indicator_3.Name = "Indicator"
Indicator_3.Parent = Palette
Indicator_3.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_3.BackgroundTransparency = 1
Indicator_3.Size = UDim2.new(0, 5, 0, 5)
Indicator_3.ZIndex = 2
Indicator_3.Image = "rbxassetid://2851926732"
Indicator_3.ImageColor3 = Color3.new(0, 0, 0)
Indicator_3.ScaleType = Enum.ScaleType.Slice
Indicator_3.SliceCenter = Rect.new(12, 12, 12, 12)

Sample.Name = "Sample"
Sample.Parent = ColorPicker
Sample.BackgroundColor3 = Color3.new(1, 1, 1)
Sample.BackgroundTransparency = 1
Sample.Position = UDim2.new(0.800000012, 0, 0.0500000007, 0)
Sample.Size = UDim2.new(0, 25, 0, 25)
Sample.Image = "rbxassetid://2851929490"
Sample.ScaleType = Enum.ScaleType.Slice
Sample.SliceCenter = Rect.new(4, 4, 4, 4)

Saturation.Name = "Saturation"
Saturation.Parent = ColorPicker
Saturation.BackgroundColor3 = Color3.new(1, 1, 1)
Saturation.Position = UDim2.new(0.649999976, 0, 0.0500000007, 0)
Saturation.Size = UDim2.new(0, 15, 0, 100)
Saturation.Image = "rbxassetid://3641079629"

Indicator_4.Name = "Indicator"
Indicator_4.Parent = Saturation
Indicator_4.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_4.BorderSizePixel = 0
Indicator_4.Size = UDim2.new(0, 20, 0, 2)
Indicator_4.ZIndex = 2

Switch.Name = "Switch"
Switch.Parent = Prefabs
Switch.BackgroundColor3 = Color3.new(1, 1, 1)
Switch.BackgroundTransparency = 1
Switch.BorderSizePixel = 0
Switch.Position = UDim2.new(0.229411766, 0, 0.20714286, 0)
Switch.Size = UDim2.new(0, 20, 0, 20)
Switch.ZIndex = 2
Switch.Font = Enum.Font.SourceSans
Switch.Text = ""
Switch.TextColor3 = Color3.new(1, 1, 1)
Switch.TextSize = 18

TextButton_Roundify_4px_4.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_4.Parent = Switch
TextButton_Roundify_4px_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_4.BackgroundTransparency = 1
TextButton_Roundify_4px_4.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_4.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_4.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_4.ImageTransparency = 0.5
TextButton_Roundify_4px_4.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_4.SliceCenter = Rect.new(4, 4, 4, 4)

Title_3.Name = "Title"
Title_3.Parent = Switch
Title_3.BackgroundColor3 = Color3.new(1, 1, 1)
Title_3.BackgroundTransparency = 1
Title_3.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_3.Size = UDim2.new(0, 20, 0, 20)
Title_3.Font = Enum.Font.GothamSemibold
Title_3.Text = "Switch"
Title_3.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_3.TextSize = 14
Title_3.TextXAlignment = Enum.TextXAlignment.Left

Button_2.Name = "Button"
Button_2.Parent = Prefabs
Button_2.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Button_2.BackgroundTransparency = 1
Button_2.BorderSizePixel = 0
Button_2.Size = UDim2.new(0, 91, 0, 20)
Button_2.ZIndex = 2
Button_2.Font = Enum.Font.GothamSemibold
Button_2.TextColor3 = Color3.new(1, 1, 1)
Button_2.TextSize = 14

TextButton_Roundify_4px_5.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_5.Parent = Button_2
TextButton_Roundify_4px_5.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_5.BackgroundTransparency = 1
TextButton_Roundify_4px_5.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_5.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_5.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_5.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_5.SliceCenter = Rect.new(4, 4, 4, 4)

DropdownButton.Name = "DropdownButton"
DropdownButton.Parent = Prefabs
DropdownButton.BackgroundColor3 = Color3.new(0.129412, 0.133333, 0.141176)
DropdownButton.BorderSizePixel = 0
DropdownButton.Size = UDim2.new(1, 0, 0, 20)
DropdownButton.ZIndex = 3
DropdownButton.Font = Enum.Font.GothamBold
DropdownButton.Text = "      Button"
DropdownButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
DropdownButton.TextSize = 14
DropdownButton.TextXAlignment = Enum.TextXAlignment.Left

Keybind.Name = "Keybind"
Keybind.Parent = Prefabs
Keybind.BackgroundColor3 = Color3.new(1, 1, 1)
Keybind.BackgroundTransparency = 1
Keybind.Size = UDim2.new(0, 200, 0, 20)
Keybind.Image = "rbxassetid://2851929490"
Keybind.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
Keybind.ScaleType = Enum.ScaleType.Slice
Keybind.SliceCenter = Rect.new(4, 4, 4, 4)

Title_4.Name = "Title"
Title_4.Parent = Keybind
Title_4.BackgroundColor3 = Color3.new(1, 1, 1)
Title_4.BackgroundTransparency = 1
Title_4.Size = UDim2.new(0, 0, 1, 0)
Title_4.Font = Enum.Font.GothamBold
Title_4.Text = "Keybind"
Title_4.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_4.TextSize = 14
Title_4.TextXAlignment = Enum.TextXAlignment.Left

Input.Name = "Input"
Input.Parent = Keybind
Input.BackgroundColor3 = Color3.new(1, 1, 1)
Input.BackgroundTransparency = 1
Input.BorderSizePixel = 0
Input.Position = UDim2.new(1, -85, 0, 2)
Input.Size = UDim2.new(0, 80, 1, -4)
Input.ZIndex = 2
Input.Font = Enum.Font.GothamSemibold
Input.Text = "RShift"
Input.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Input.TextSize = 12
Input.TextWrapped = true

Input_Roundify_4px.Name = "Input_Roundify_4px"
Input_Roundify_4px.Parent = Input
Input_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
Input_Roundify_4px.BackgroundTransparency = 1
Input_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
Input_Roundify_4px.Image = "rbxassetid://2851929490"
Input_Roundify_4px.ImageColor3 = Color3.new(0.290196, 0.294118, 0.313726)
Input_Roundify_4px.ScaleType = Enum.ScaleType.Slice
Input_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

Windows.Name = "Windows"
Windows.Parent = imgui
Windows.BackgroundColor3 = Color3.new(1, 1, 1)
Windows.BackgroundTransparency = 1
Windows.Position = UDim2.new(0, 20, 0, 20)
Windows.Size = UDim2.new(1, 20, 1, -20)

--[[ Script ]]--
script.Parent = imgui

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("RunService")
local ps = game:GetService("Players")

local p = ps.LocalPlayer
local mouse = p:GetMouse()

local Prefabs = script.Parent:WaitForChild("Prefabs")
local Windows = script.Parent:FindFirstChild("Windows")

local checks = {
	["binding"] = false,
}

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == ((typeof(ui_options.toggle_key) == "EnumItem") and ui_options.toggle_key or Enum.KeyCode.RightShift) then
		if script.Parent then
			if not checks.binding then
				script.Parent.Enabled = not script.Parent.Enabled
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

		local circle = Prefabs:FindFirstChild("Circle"):Clone()

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
	local ull = Prefabs:FindFirstChild("UIListLayout"):Clone()
	ull.Parent = Windows
	local data = {}

	for i,v in next, Windows:GetChildren() do
		if not (v:IsA("UIListLayout")) then
			data[v] = v.AbsolutePosition
		end
	end

	ull:Destroy()

	for i,v in next, data do
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

	local Window = Prefabs:FindFirstChild("Window"):Clone()
	Window.Parent = Windows
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
					for i,v in next, Window:FindFirstChild("Tabs"):GetChildren() do
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

					for i,v in next, oldwindowdata do
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

				local new_button = Prefabs:FindFirstChild("TabButton"):Clone()
				new_button.Parent = tab_buttons
				new_button.Text = tab_name
				new_button.Size = UDim2.new(0, gNameLen(new_button), 0, 20)
				new_button.ZIndex = new_button.ZIndex + (windows * 10)
				new_button:GetChildren()[1].ZIndex = new_button:GetChildren()[1].ZIndex + (windows * 10)

				local new_tab = Prefabs:FindFirstChild("Tab"):Clone()
				new_tab.Parent = tabs
				new_tab.ZIndex = new_tab.ZIndex + (windows * 10)

				local ContentHolder = Instance.new("Frame")
				ContentHolder.Name = "ContentHolder"
				ContentHolder.Parent = new_tab
				ContentHolder.BackgroundColor3 = Color3.new(1, 1, 1)
				ContentHolder.BackgroundTransparency = 1
				ContentHolder.Size = UDim2.new(1, -20, 1, -10)
				ContentHolder.Position = UDim2.new(0, 10, 0, 5)

				local UIListLayout_2 = new_tab:FindFirstChild("UIListLayout")
				if UIListLayout_2 then
					UIListLayout_2.Parent = ContentHolder
				end
				UIListLayout_2.FillDirection = Enum.FillDirection.Vertical
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.Padding = UDim.new(0, 5)

				local function show()
					if dropdown_open then return end
					for i, v in next, tab_buttons:GetChildren() do
						if not (v:IsA("UIListLayout")) then
							v:GetChildren()[1].ImageColor3 = Color3.fromRGB(52, 53, 56)
							Resize(v, {Size = UDim2.new(0, v.AbsoluteSize.X, 0, 20)}, options.tween_time)
						end
					end
					for i, v in next, tabs:GetChildren() do
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

						local label = Prefabs:FindFirstChild("Label"):Clone()

						label.Parent = ContentHolder
						label.Text = label_text
						label.Size = UDim2.new(0, gNameLen(label), 0, 20)
						label.ZIndex = label.ZIndex + (windows * 10)

						return label
					end

					function tab_data:AddButton(button_text, callback) -- [Button]
						button_text = tostring(button_text or "New Button")
						callback = typeof(callback) == "function" and callback or function()end

						local button = Prefabs:FindFirstChild("Button"):Clone()

						button.Parent = ContentHolder
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

						local switch = Prefabs:FindFirstChild("Switch"):Clone()

						switch.Parent = ContentHolder
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

						local textbox = Prefabs:FindFirstChild("TextBox"):Clone()

						textbox.Parent = ContentHolder
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

						local slider = Prefabs:FindFirstChild("Slider"):Clone()

						slider.Parent = ContentHolder
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

						local keybind = Prefabs:FindFirstChild("Keybind"):Clone()
						local input = keybind:FindFirstChild("Input")
						local title = keybind:FindFirstChild("Title")
						keybind.ZIndex = keybind.ZIndex + (windows * 10)
						input.ZIndex = input.ZIndex + (windows * 10)
						input:GetChildren()[1].ZIndex = input:GetChildren()[1].ZIndex + (windows * 10)
						title.ZIndex = title.ZIndex + (windows * 10)

						keybind.Parent = ContentHolder
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

						local dropdown = Prefabs:FindFirstChild("Dropdown"):Clone()
						local box = dropdown:FindFirstChild("Box")
						local objects = box:FindFirstChild("Objects")
						local indicator = dropdown:FindFirstChild("Indicator")
						dropdown.ZIndex = dropdown.ZIndex + (windows * 10)
						box.ZIndex = box.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						dropdown:GetChildren()[3].ZIndex = dropdown:GetChildren()[3].ZIndex + (windows * 10)

						dropdown.Parent = ContentHolder
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

							local object = Prefabs:FindFirstChild("DropdownButton"):Clone()

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

						local color_picker = Prefabs:FindFirstChild("ColorPicker"):Clone()

						color_picker.Parent = ContentHolder
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

						local console = Prefabs:FindFirstChild("Console"):Clone()

						console.Parent = ContentHolder
						console.ZIndex = console.ZIndex + (windows * 10)
						console.Size = UDim2.new(1, 0, console_options.full and 1 or 0, console_options.y)

						local sf = console:GetChildren()[1]
						local Source = sf:FindFirstChild("Source")
						local Lines = sf:FindFirstChild("Lines")
						Source.ZIndex = Source.ZIndex + (windows * 10)
						Lines.ZIndex = Lines.ZIndex + (windows * 10)

						Source.TextEditable = not console_options.readonly

						do -- Syntax Zindex
							for i,v in next, Source:GetChildren() do
								v.ZIndex = v.ZIndex + (windows * 10) + 1
							end
						end
						Source.Comments.ZIndex = Source.Comments.ZIndex + 1

						do -- Highlighting (thanks to whoever made this)
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
									if quote == false and c == "\]" then
										highlight = highlight .. "\]"
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

						local ha = Prefabs:FindFirstChild("HorizontalAlignment"):Clone()
						ha.Parent = ContentHolder

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

						local folder = Prefabs:FindFirstChild("Folder"):Clone()
						local button = folder:FindFirstChild("Button")
						local objects = folder:FindFirstChild("Objects")
						local toggle = button:FindFirstChild("Toggle")
						folder.ZIndex = folder.ZIndex + (windows * 10)
						button.ZIndex = button.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						toggle.ZIndex = toggle.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						folder.Parent = ContentHolder
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
							for i,v in next, objects:GetChildren() do
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

						for i,v in next, tab_data do
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
		for i, v in next, Window:GetDescendants() do
			if hasprop(v, "ZIndex") then
				v.ZIndex = v.ZIndex + (windows * 10)
			end
		end
	end

	return window_data, Window
end

return library
