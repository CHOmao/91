game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "猫脚本",
    Text = "欢迎使用猫脚本",
    Icon = "rbxassetid://134258450785486",
    Duration = 1,
    Callback = bindable,
    Button1 = "脚本功能多多",
    Button2 = "感谢您的使用"
})

wait(1.5)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "猫脚本",
    Text = "自动检测到此服务器为nico的下一个机器人",
    Icon = "rbxassetid://134258450785486",
    Duration = 1,
    Callback = bindable,
    Button1 = "此脚本为永久免费脚本",
    Button2 = "请勿倒卖"
})

wait(1.5)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "猫脚本",
    Text = "自动为您打开nico的下一个机器人服务器功能",
    Icon = "rbxassetid://134258450785486",
    Duration = 2,
    Callback = bindable,
    Button1 = "祝您使用愉快",
    Button2 = "玩的开心"
})

local RevenantLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
RevenantLibrary.DefaultColor = Color3.fromRGB(255, 0, 0)

RevenantLibrary:Notification({
    Text = "猫脚本作者: 臭猫",
    Duration = 6
})

wait(1)

RevenantLibrary:Notification({
    Text = "猫脚本帮助者: 臭猫",
    Duration = 6
})

wait(1)

RevenantLibrary:Notification({
    Text = "谢谢大家一直以来的支持^ω^",
    Duration = 6
})

function Notify(NotifyTitle, NotifyText, NotifyIcon, NotifyDuration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = NotifyTitle,
        Text = NotifyText,
        Icon = NotifyIcon,
        Duration = NotifyDuration
    })
end

local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/UI/refs/heads/main/%E5%BD%A9%E8%99%B9.lua"))():new("猫脚本 | nico的下一个机器人")

local InfoTab = UILibrary:Tab("信息", "134258450785486")

local PlayerInfoSection = InfoTab:section("玩家信息", true)

PlayerInfoSection:Label("您的注入器:" .. identifyexecutor())
PlayerInfoSection:Label("您当前服务器的ID:" .. game.GameId)
PlayerInfoSection:Label("您的用户ID:" .. game.Players.LocalPlayer.UserId)
PlayerInfoSection:Label("您的客户端ID:" .. game:GetService("RbxAnalyticsService"):GetClientId())

local RunService = game:GetService("RunService")

local RainbowColors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 127, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(75, 0, 130),
    Color3.fromRGB(148, 0, 211)
}

local TimeLabel = PlayerInfoSection:Label("XP时间: 00时00分00秒", {
    TextColor3 = RainbowColors[1],
    Position = UDim2.new(0.75, 0, 0.01, 0),
    Size = UDim2.new(0, 200, 0, 30),
    Font = Enum.Font.GothamSemibold,
    TextSize = 14,
    BackgroundTransparency = 1
})

local ColorProgress = 0

local function UpdateTimeLabel()
    local CurrentTime = os.date("*t")
    TimeLabel.Text = string.format("XP时间: %02d时%02d分%02d秒", CurrentTime.hour, CurrentTime.min, CurrentTime.sec)
    ColorProgress = (ColorProgress + 0.01) % 1
    local CurrentColorIndex = math.floor(ColorProgress * #RainbowColors) + 1
    local NextColorIndex = CurrentColorIndex % #RainbowColors + 1
    local LerpAlpha = ColorProgress * #RainbowColors % 1
    TimeLabel.TextColor3 = RainbowColors[CurrentColorIndex]:Lerp(RainbowColors[NextColorIndex], LerpAlpha)
end

RunService.Heartbeat:Connect(UpdateTimeLabel)
UpdateTimeLabel()

local PlayersService = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunServiceRef = game:GetService("RunService")

local UserDisplayEnabled = false
local UserDisplayGui = nil
local UserDisplayToggleState = false

local function CreateUserDisplayGui()
    if UserDisplayGui then
        UserDisplayGui:Destroy()
    end
    
    UserDisplayGui = Instance.new("ScreenGui")
    UserDisplayGui.Name = "UserGui"
    UserDisplayGui.Parent = game.CoreGui
    UserDisplayGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local UserLabel = Instance.new("TextLabel")
    UserLabel.Name = "UserLabel"
    UserLabel.Parent = UserDisplayGui
    UserLabel.BackgroundTransparency = 1
    UserLabel.Position = UDim2.new(0.8, 0.8, 0.0009, 0)
    UserLabel.Size = UDim2.new(0, 135, 0, 50)
    UserLabel.Font = Enum.Font.GothamSemibold
    UserLabel.Text = "尊贵的猫脚本用户: " .. PlayersService.LocalPlayer.DisplayName
    UserLabel.TextColor3 = Color3.new(1, 1, 1)
    UserLabel.TextSize = 25
    UserLabel.TextWrapped = true
    
    local RainbowGradient = Instance.new("UIGradient")
    RainbowGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.1, Color3.fromRGB(255, 127, 0)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(139, 0, 255)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 127, 0)),
        ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
    })
    RainbowGradient.Rotation = 10
    RainbowGradient.Parent = UserLabel
    
    TweenService:Create(RainbowGradient, TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
        Rotation = 360
    }):Play()
    
    return UserDisplayGui
end

PlayerInfoSection:Toggle("开启/关闭猫脚本用户名称显示", "user_display_toggle", false, function(ToggleValue)
    UserDisplayEnabled = ToggleValue
    UserDisplayToggleState = ToggleValue
    
    if ToggleValue then
        CreateUserDisplayGui()
        Notify("用户显示", "已开启用户名称显示")
    else
        if UserDisplayGui then
            UserDisplayGui:Destroy()
            UserDisplayGui = nil
        end
        Notify("用户显示", "已关闭用户名称显示")
    end
end)

local AuthorInfoSection = InfoTab:section("作者信息", true)

AuthorInfoSection:Label("猫脚本")
AuthorInfoSection:Label("永不跑路的脚本")
AuthorInfoSection:Label("作者: 臭猫")
AuthorInfoSection:Label("作者QQ: 2131869117")
AuthorInfoSection:Label("猫脚本QQ主群: 894995244")
AuthorInfoSection:Label("猫脚本QQ副群: 1002100032")
AuthorInfoSection:Label("猫脚本QQ二群: 746849372")
AuthorInfoSection:Label("猫脚本QQ三群: 571553667")
AuthorInfoSection:Label("猫脚本QQ四群: 609250910")
AuthorInfoSection:Label("解卡主群: 134410951")
AuthorInfoSection:Label("解卡群二群: 954149920")
AuthorInfoSection:Label("猫脚本帮助者: 臭猫")
AuthorInfoSection:Label("给猫脚本提供了许多的功能源码与帮助")
AuthorInfoSection:Label("谢谢您的帮助与支持")

AuthorInfoSection:Button("复制作者QQ", function()
    setclipboard("2131869117")
end)

AuthorInfoSection:Button("复制猫脚本QQ主群", function()
    setclipboard("894995244")
end)

AuthorInfoSection:Button("复制猫脚本QQ副群", function()
    setclipboard("1002100032")
end)

AuthorInfoSection:Button("复制猫脚本QQ二群", function()
    setclipboard("746849372")
end)

AuthorInfoSection:Button("复制猫脚本QQ三群", function()
    setclipboard("571553667")
end)

AuthorInfoSection:Button("复制猫脚本QQ四群", function()
    setclipboard("609250910")
end)

AuthorInfoSection:Button("复制解卡主群", function()
    setclipboard("134410951")
end)

AuthorInfoSection:Button("复制解卡群二群", function()
    setclipboard("954149920")
end)

local AnnouncementSection = UILibrary:Tab("公告", "134258450785486"):section("公告", true)

AnnouncementSection:Label("猫脚本是永久免费脚本")
AnnouncementSection:Label("不许倒卖圈钱")
AnnouncementSection:Label("倒卖死全家 倒卖者我操你妈")
AnnouncementSection:Label("严禁倒卖 倒卖无爹无妈")
AnnouncementSection:Label("有时间就会更新")

local SettingsTab = UILibrary:Tab("设置", "6034509993")

local DisplaySettingsSection = SettingsTab:section("显示设置", true)

DisplaySettingsSection:Button("显示FPS", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/g54KFcUU"))()
end)

DisplaySettingsSection:Button("显示时间", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/RycMWV3a"))()
end)

local GraphicsSettingsSection = SettingsTab:section("画质设置", true)

GraphicsSettingsSection:Button("光影v4", function()
    print("button pressed")
    loadstring(game:HttpGet("https://pastebin.com/raw/gUceVJig"))()
end)

GraphicsSettingsSection:Button("RTX高仿", function()
    print("button pressed")
    loadstring(game:HttpGet("https://pastebin.com/raw/Bkf0BJb3"))()
end)

GraphicsSettingsSection:Button("光影菜单", function()
    print("button pressed")
    loadstring(game:HttpGet("https://pastefy.ga/xXkUxA0P/raw", true))()
end)

GraphicsSettingsSection:Button("光影", function()
    print("button pressed")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

GraphicsSettingsSection:Button("RTX图形画质", function()
    local Lighting = game.Lighting
    
    local IteratorFunction, ChildrenTable, CurrentIndex = pairs(Lighting:GetChildren())
    while true do
        local ChildObject
        CurrentIndex, ChildObject = IteratorFunction(ChildrenTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        ChildObject:Destroy()
    end
    
    local Terrain = workspace.Terrain
    local ColorCorrection = Instance.new("ColorCorrectionEffect")
    local Bloom = Instance.new("BloomEffect")
    local SunRays = Instance.new("SunRaysEffect")
    local Blur = Instance.new("BlurEffect")
    
    ColorCorrection.Parent = Lighting
    Bloom.Parent = Lighting
    SunRays.Parent = Lighting
    Blur.Parent = Lighting
    
    local EffectSettings = {
        Terrain = true,
        ColorCorrection = true,
        Sun = true,
        Lighting = true,
        BloomEffect = true
    }
    
    ColorCorrection.Enabled = false
    ColorCorrection.Contrast = 0.15
    ColorCorrection.Brightness = 0.1
    ColorCorrection.Saturation = 0.25
    ColorCorrection.TintColor = Color3.fromRGB(255, 222, 211)
    
    Bloom.Enabled = false
    Bloom.Intensity = 0.1
    
    SunRays.Enabled = false
    SunRays.Intensity = 0.2
    SunRays.Spread = 1
    
    Bloom.Enabled = false
    Bloom.Intensity = 0.05
    Bloom.Size = 32
    Bloom.Threshold = 1
    
    Blur.Enabled = false
    Blur.Size = 6
    
    if EffectSettings.ColorCorrection then
        ColorCorrection.Enabled = true
    end
    
    if EffectSettings.Sun then
        SunRays.Enabled = true
    end
    
    if EffectSettings.Terrain then
        Terrain.WaterWaveSize = 0.1
        Terrain.WaterWaveSpeed = 22
        Terrain.WaterTransparency = 0.9
        Terrain.WaterReflectance = 0.05
    end
    
    if EffectSettings.Lighting then
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.Brightness = 4
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.ExposureCompensation = 0
        Lighting.FogColor = Color3.fromRGB(132, 132, 132)
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
        Lighting.Outlines = false
    end
    
    local LightingRef = game.Lighting
    LightingRef.Ambient = Color3.fromRGB(33, 33, 33)
    LightingRef.Brightness = 5.69
    LightingRef.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
    LightingRef.ColorShift_Top = Color3.fromRGB(255, 247, 237)
    LightingRef.EnvironmentDiffuseScale = 0.105
    LightingRef.EnvironmentSpecularScale = 0.522
    LightingRef.GlobalShadows = true
    LightingRef.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
    LightingRef.ShadowSoftness = 0.18
    LightingRef.GeographicLatitude = -15.525
    LightingRef.ExposureCompensation = 0.75
    
    b.Enabled = true
    b.Intensity = 0.99
    b.Size = 9999
    b.Threshold = 0
    
    local ColorCorrectionNew = Instance.new("ColorCorrectionEffect", LightingRef)
    ColorCorrectionNew.Brightness = 0.015
    ColorCorrectionNew.Contrast = 0.25
    ColorCorrectionNew.Enabled = true
    ColorCorrectionNew.Saturation = 0.2
    ColorCorrectionNew.TintColor = Color3.fromRGB(217, 145, 57)
    
    if getgenv().mode ~= "Summer" then
        if getgenv().mode ~= "Autumn" then
            warn("没有选择模式")
            print("请选择一种模式")
            b:Destroy()
            ColorCorrectionNew:Destroy()
        else
            ColorCorrectionNew.TintColor = Color3.fromRGB(217, 145, 57)
        end
    else
        ColorCorrectionNew.TintColor = Color3.fromRGB(255, 220, 148)
    end
    
    local DepthOfField = Instance.new("DepthOfFieldEffect", LightingRef)
    DepthOfField.Enabled = true
    DepthOfField.FarIntensity = 0.077
    DepthOfField.FocusDistance = 21.54
    DepthOfField.InFocusRadius = 20.77
    DepthOfField.NearIntensity = 0.277
    
    local ColorCorrection2 = Instance.new("ColorCorrectionEffect", LightingRef)
    ColorCorrection2.Brightness = 0
    ColorCorrection2.Contrast = -0.07
    ColorCorrection2.Saturation = 0
    ColorCorrection2.Enabled = true
    ColorCorrection2.TintColor = Color3.fromRGB(255, 247, 239)
    
    local ColorCorrection3 = Instance.new("ColorCorrectionEffect", LightingRef)
    ColorCorrection3.Brightness = 0.2
    ColorCorrection3.Contrast = 0.45
    ColorCorrection3.Saturation = -0.1
    ColorCorrection3.Enabled = true
    ColorCorrection3.TintColor = Color3.fromRGB(255, 255, 255)
    
    local SunRaysNew = Instance.new("SunRaysEffect", LightingRef)
    SunRaysNew.Enabled = true
    SunRaysNew.Intensity = 0.01
    SunRaysNew.Spread = 0.146
    
    print("RTX图形加载成功")
end)

local GameSettingsSection = SettingsTab:section("游戏设置", true)

GameSettingsSection:Button("刷新字符", function()
    repeat
        chlplr.Health = 0
        task.wait()
    until chlplr.Health ~= 0
end)

GameSettingsSection:Button("重置字符", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AnAvaragelilmemer/scripts/main/refresh%20character"))()
end)

GameSettingsSection:Button("重新加入", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
end)

GameSettingsSection:Button("保存游戏", function()
    saveinstance()
end)

GameSettingsSection:Button("禁开游戏", function()
    game:Shutdown()
end)

GameSettingsSection:Button("开启最高帧数FPS", function()
    setfpscap(999)
end)

local UISettingsSection = SettingsTab:section("UI设置", true)

UISettingsSection:Toggle("移除UI辉光", "", false, function(ToggleValue)
    if ToggleValue then
        game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = false
    else
        game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = true
    end
end)

UISettingsSection:Toggle("彩虹UI", "", false, function(ToggleValue)
    if ToggleValue then
        game:GetService("CoreGui")["frosty is cute"].Main.Style = "DropShadow"
    else
        game:GetService("CoreGui")["frosty is cute"].Main.Style = "Custom"
    end
end)

UISettingsSection:Button("摧毁GUI", function()
    game:GetService("CoreGui")["frosty is cute"]:Destroy()
end)

UISettingsSection:Keybind("切换用户界面", Enum.KeyCode.Home, function(_)
    ToggleUILib()
end)

local MainFunctionSection = UILibrary:Tab("主要功能", "10882439086"):section("主要功能", true)

MainFunctionSection:Slider("设置速度", "", 16, 16, 400, false, function(SliderValue)
    Speed = SliderValue
end)

MainFunctionSection:Toggle("速度(开/关)", "", false, function(ToggleValue)
    if ToggleValue == true then
        sudu = game:GetService("RunService").Heartbeat:Connect(function()
            if game:GetService("Players").LocalPlayer.Character and (game:GetService("Players").LocalPlayer.Character.Humanoid and (game:GetService("Players").LocalPlayer.Character.Humanoid.Parent and game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0)) then
                game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 100)
            end
        end)
    elseif not ToggleValue and sudu then
        sudu:Disconnect()
        sudu = nil
    end
end)

MainFunctionSection:Toggle("解锁最大视距", "Cam", false, function(ToggleValue)
    Cam1 = ToggleValue
    if Cam1 then
        Cam2()
    end
end)

function Cam2()
    while Cam1 do
        wait(0.1)
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 9000000000
    end
    while not Cam1 do
        wait(0.1)
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 32
    end
end

MainFunctionSection:Toggle("夜视", "", false, function(NightVisionEnabled)
    spawn(function()
        while task.wait() do
            if NightVisionEnabled then
                game.Lighting.Ambient = Color3.new(1, 1, 1)
            else
                game.Lighting.Ambient = Color3.new(0, 0, 0)
            end
        end
    end)
end)

MainFunctionSection:Toggle("无限跳", "IJ", false, function(ToggleValue)
    getgenv().InfJ = ToggleValue
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)

local AutoJumpEnabled = false
local AutoJumpHeartbeatConnection = nil
local AutoJumpCharacterAddedConnection = nil

local function DisconnectAutoJump()
    if AutoJumpHeartbeatConnection then
        AutoJumpHeartbeatConnection:Disconnect()
        AutoJumpHeartbeatConnection = nil
    end
    if AutoJumpCharacterAddedConnection then
        AutoJumpCharacterAddedConnection:Disconnect()
        AutoJumpCharacterAddedConnection = nil
    end
end

MainFunctionSection:Toggle("自动跳跃", "Auto Jump", AutoJumpEnabled, function(ToggleValue)
    AutoJumpEnabled = ToggleValue
    DisconnectAutoJump()
    
    if ToggleValue then
        local LocalPlayer = game.Players.LocalPlayer
        
        local function AutoJumpLoop()
            while AutoJumpEnabled and LocalPlayer.Character do
                local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                task.wait(0.1)
            end
        end
        
        local function OnCharacterAdded(Character)
            if AutoJumpHeartbeatConnection then
                AutoJumpHeartbeatConnection:Disconnect()
            end
            AutoJumpHeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(AutoJumpLoop)
            Character:GetPropertyChangedSignal("Parent"):Connect(function()
                if not Character.Parent and AutoJumpHeartbeatConnection then
                    AutoJumpHeartbeatConnection:Disconnect()
                    AutoJumpHeartbeatConnection = nil
                end
            end)
        end
        
        AutoJumpCharacterAddedConnection = LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)
        
        if LocalPlayer.Character then
            OnCharacterAdded(LocalPlayer.Character)
        end
        
        Notify("自动跳跃", "已开启")
    else
        Notify("自动跳跃", "已关闭")
    end
end)

local RagdollEnabled = false
local RagdollConnections = {}

local function DisconnectRagdoll()
    local IteratorFunction, ConnectionsTable, CurrentIndex = pairs(RagdollConnections)
    while true do
        local Connection
        CurrentIndex, Connection = IteratorFunction(ConnectionsTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        Connection:Disconnect()
    end
    RagdollConnections = {}
end

local function InvokeRagdoll(RagdollState)
    local Character = game.Players.LocalPlayer.Character
    if Character then
        local StartTime = os.clock()
        local Timeout = 5
        
        while not (Character:FindFirstChild("scripts") and Character.scripts:FindFirstChild("misc")) do
            if Timeout < os.clock() - StartTime then
                warn("碰撞脚本加载超时")
                return
            end
            task.wait(0.1)
        end
        
        local RagdollEvent = Character.scripts.misc:FindFirstChild("ragdollEvent")
        if RagdollEvent then
            RagdollEvent:InvokeServer(RagdollState)
        else
            warn("找不到 ragdollEvent 脚本")
        end
    end
end

MainFunctionSection:Toggle("反挂机", "", false, function(ToggleValue)
    if ToggleValue then
        local VirtualUserService = game:GetService("VirtualUser")
        local LocalPlayer = PlayersService.LocalPlayer
        local AntiAFKConnection = nil
        local LastActivityTime = tick()
        
        local function StartAntiAFK()
            AntiAFKConnection = RunServiceRef.PreRender:Connect(function()
                if tick() - LastActivityTime >= 900 then
                    pcall(function()
                        VirtualUserService:CaptureController()
                        VirtualUserService:ClickButton2(Vector2.new())
                    end)
                    LastActivityTime = tick()
                end
            end)
        end
        
        LocalPlayer.Idled:Connect(function()
            pcall(function()
                VirtualUserService:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                VirtualUserService:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end)
        
        StartAntiAFK()
    else
        if antiAFKConnection then
            antiAFKConnection:Disconnect()
            antiAFKConnection = nil
        end
        if idleConnection then
            idleConnection:Disconnect()
            idleConnection = nil
        end
    end
end)

MainFunctionSection:Toggle("帮姊姊效果", "Ragdoll", RagdollEnabled, function(ToggleValue)
    RagdollEnabled = ToggleValue
    DisconnectRagdoll()
    
    if ToggleValue then
        if game.Players.LocalPlayer.Character then
            InvokeRagdoll(true)
        end
        
        table.insert(RagdollConnections, game.Players.LocalPlayer.CharacterAdded:Connect(function(_)
            task.wait(1)
            if RagdollEnabled then
                InvokeRagdoll(true)
            end
        end))
    elseif game.Players.LocalPlayer.Character then
        InvokeRagdoll(false)
    end
    
    Notify("帮姊姊效果", ToggleValue and "已开启" or "已关闭")
end)

game:GetService("Players").LocalPlayer.CharacterRemoving:Connect(function()
    if RagdollEnabled then
        DisconnectRagdoll()
    end
end)

MainFunctionSection:Button("立即死亡", function()
    game:GetService("ReplicatedStorage").events.player.char.ClientDeath:FireServer()
end)

local AutoRespawnEnabled = false
local RespawnOnCooldown = false
local RespawnCooldownTime = 1
local RespawnCooldownStartTime = 0

local function TryRespawn()
    if RespawnOnCooldown then
        return false
    else
        return pcall(function()
            local EventsFolder = game:GetService("ReplicatedStorage"):WaitForChild("events", 2)
            if EventsFolder then
                EventsFolder = EventsFolder:WaitForChild("player", 2)
            end
            if EventsFolder then
                EventsFolder = EventsFolder:WaitForChild("char", 2)
            end
            if EventsFolder then
                EventsFolder = EventsFolder:WaitForChild("respawnchar", 2)
            end
            if EventsFolder then
                EventsFolder:FireServer()
                RespawnOnCooldown = true
                RespawnCooldownStartTime = os.clock()
                task.delay(RespawnCooldownTime, function()
                    RespawnOnCooldown = false
                end)
                return true
            end
        end) or false
    end
end

MainFunctionSection:Toggle("自动重生", "", AutoRespawnEnabled, function(ToggleValue)
    AutoRespawnEnabled = ToggleValue
    if ToggleValue then
        Notify("自动重生", "已开启")
    else
        Notify("自动重生", "已关闭")
    end
end)

local StatusLabel = MainFunctionSection:Label("状态: 准备就绪")

game:GetService("RunService").Heartbeat:Connect(function()
    if RespawnOnCooldown then
        local RemainingTime = RespawnCooldownTime - (os.clock() - RespawnCooldownStartTime)
        StatusLabel.Text = string.format("冷却: %.1f秒", math.max(0, RemainingTime))
    else
        StatusLabel.Text = "状态: 准备就绪"
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if AutoRespawnEnabled and not RespawnOnCooldown then
        local Character = game.Players.LocalPlayer.Character
        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            if Humanoid and (Humanoid.Health <= 0 and TryRespawn()) then
                Notify("自动重生", "检测到死亡 已重生")
            end
        end
    else
        return
    end
end)

MainFunctionSection:Button("立即重生", function()
    game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
end)

local ESPTab = UILibrary:Tab("透视功能", "6035145364"):section("透视功能", true)

local BotESPEnabled = false
local BotESPData = {
    trackers = {},
    connections = {},
    folderName = "bots"
}

local function CleanupBotESP()
    local IteratorFunction, TrackersTable, CurrentIndex = pairs(BotESPData.trackers)
    while true do
        local TrackerData
        CurrentIndex, TrackerData = IteratorFunction(TrackersTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if TrackerData.billboard then
            TrackerData.billboard:Destroy()
        end
        if TrackerData.highlight then
            TrackerData.highlight:Destroy()
        end
        if TrackerData.connection then
            TrackerData.connection:Disconnect()
        end
    end
    
    local IteratorFunction2, ConnectionsTable, CurrentIndex2 = pairs(BotESPData.connections)
    while true do
        local Connection
        CurrentIndex2, Connection = IteratorFunction2(ConnectionsTable, CurrentIndex2)
        if CurrentIndex2 == nil then
            break
        end
        if Connection then
            Connection:Disconnect()
        end
    end
    
    BotESPData.trackers = {}
    BotESPData.connections = {}
end

local function GetRootPart(Model)
    if Model then
        Model = Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChildWhichIsA("BasePart")
    end
    return Model
end

local function CreateBotESP(TargetModel)
    if TargetModel and (TargetModel.Parent and BotESPEnabled) then
        local ContainerFrame = Instance.new("Frame")
        ContainerFrame.BackgroundTransparency = 1
        ContainerFrame.Size = UDim2.new(1, 0, 1, 0)
        
        local NameLabel = Instance.new("TextLabel")
        NameLabel.Name = "NameLabel"
        NameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        NameLabel.Position = UDim2.new(0, 0, 0, 0)
        NameLabel.BackgroundTransparency = 1
        NameLabel.TextColor3 = Color3.new(1, 0, 0)
        NameLabel.TextSize = 14
        NameLabel.Font = Enum.Font.SourceSansBold
        NameLabel.Text = TargetModel.Name
        NameLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        NameLabel.Parent = ContainerFrame
        
        local DistanceLabel = Instance.new("TextLabel")
        DistanceLabel.Name = "DistLabel"
        DistanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
        DistanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
        DistanceLabel.BackgroundTransparency = 1
        DistanceLabel.TextColor3 = Color3.new(1, 0, 0)
        DistanceLabel.TextSize = 12
        DistanceLabel.Font = Enum.Font.SourceSans
        DistanceLabel.TextYAlignment = Enum.TextYAlignment.Top
        DistanceLabel.Parent = ContainerFrame
        
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Name = "FolderESP"
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(4, 0, 4, 0)
        BillboardGui.Adornee = TargetModel
        BillboardGui.MaxDistance = 1000
        BillboardGui.Parent = game.CoreGui
        ContainerFrame.Parent = BillboardGui
        
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "FolderESP_Highlight"
        Highlight.Adornee = TargetModel
        Highlight.FillColor = Color3.new(1, 0, 0)
        Highlight.FillTransparency = 0.7
        Highlight.OutlineColor = Color3.new(1, 0, 0)
        Highlight.OutlineTransparency = 0
        Highlight.Parent = game.CoreGui
        
        local function UpdateDistance()
            if BotESPEnabled and TargetModel.Parent then
                local LocalRootPart = GetRootPart(game.Players.LocalPlayer.Character)
                local TargetRootPart = TargetModel.PrimaryPart or GetRootPart(TargetModel)
                if LocalRootPart and TargetRootPart then
                    local Distance = (LocalRootPart.Position - TargetRootPart.Position).Magnitude
                    DistanceLabel.Text = string.format("[%.1f]", Distance)
                else
                    DistanceLabel.Text = "[N/A]"
                end
            end
        end
        
        local TrackerData = {
            model = TargetModel,
            billboard = BillboardGui,
            highlight = Highlight,
            connection = TargetModel.AncestryChanged:Connect(function(_, NewParent)
                if NewParent == nil then
                    if BillboardGui.Parent then
                        BillboardGui:Destroy()
                    end
                    if Highlight.Parent then
                        Highlight:Destroy()
                    end
                end
            end),
            update = game:GetService("RunService").Heartbeat:Connect(UpdateDistance)
        }
        
        UpdateDistance()
        table.insert(BotESPData.trackers, TrackerData)
        return TrackerData
    end
end

local function InitializeBotESP()
    local BotsFolder = workspace:FindFirstChild(BotESPData.folderName)
    if BotsFolder then
        local IteratorFunction, DescendantsTable, CurrentIndex = pairs(BotsFolder:GetDescendants())
        while true do
            local Descendant
            CurrentIndex, Descendant = IteratorFunction(DescendantsTable, CurrentIndex)
            if CurrentIndex == nil then
                break
            end
            if Descendant:IsA("Model") then
                CreateBotESP(Descendant)
            end
        end
        
        local DescendantAddedConnection = BotsFolder.DescendantAdded:Connect(function(NewDescendant)
            if NewDescendant:IsA("Model") then
                CreateBotESP(NewDescendant)
            end
        end)
        table.insert(BotESPData.connections, DescendantAddedConnection)
    else
        warn("未找到文件夹: " .. BotESPData.folderName)
    end
end

ESPTab:Toggle("机器人透视", "Folder ESP", BotESPEnabled, function(ToggleValue)
    BotESPEnabled = ToggleValue
    if ToggleValue then
        CleanupBotESP()
        InitializeBotESP()
        Notify("机器人透视", "已开启 正在追踪: " .. BotESPData.folderName)
    else
        CleanupBotESP()
        Notify("机器人透视", "已关闭")
    end
end)

local ZombieESPEnabled = false
local ZombieESPData = {
    trackers = {},
    connections = {},
    modelNames = {
        "zombie"
    }
}

local function CleanupZombieESP()
    local IteratorFunction, TrackersTable, CurrentIndex = pairs(ZombieESPData.trackers)
    while true do
        local TrackerData
        CurrentIndex, TrackerData = IteratorFunction(TrackersTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if TrackerData.billboard then
            TrackerData.billboard:Destroy()
        end
        if TrackerData.highlight then
            TrackerData.highlight:Destroy()
        end
        if TrackerData.connection then
            TrackerData.connection:Disconnect()
        end
    end
    
    local IteratorFunction2, ConnectionsTable, CurrentIndex2 = pairs(ZombieESPData.connections)
    while true do
        local Connection
        CurrentIndex2, Connection = IteratorFunction2(ConnectionsTable, CurrentIndex2)
        if CurrentIndex2 == nil then
            break
        end
        if Connection then
            Connection:Disconnect()
        end
    end
    
    ZombieESPData.trackers = {}
    ZombieESPData.connections = {}
end

local function GetZombieRootPart(Model)
    if Model then
        Model = Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChildWhichIsA("BasePart")
    end
    return Model
end

local function CreateZombieESP(TargetModel)
    if TargetModel and (TargetModel.Parent and ZombieESPEnabled) then
        local ContainerFrame = Instance.new("Frame")
        ContainerFrame.BackgroundTransparency = 1
        ContainerFrame.Size = UDim2.new(1, 0, 1, 0)
        
        local NameLabel = Instance.new("TextLabel")
        NameLabel.Name = "NameLabel"
        NameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        NameLabel.Position = UDim2.new(0, 0, 0, 0)
        NameLabel.BackgroundTransparency = 1
        NameLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        NameLabel.TextSize = 14
        NameLabel.Font = Enum.Font.SourceSansBold
        NameLabel.Text = TargetModel.Name
        NameLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        NameLabel.Parent = ContainerFrame
        
        local DistanceLabel = Instance.new("TextLabel")
        DistanceLabel.Name = "DistLabel"
        DistanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
        DistanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
        DistanceLabel.BackgroundTransparency = 1
        DistanceLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        DistanceLabel.TextSize = 12
        DistanceLabel.Font = Enum.Font.SourceSans
        DistanceLabel.TextYAlignment = Enum.TextYAlignment.Top
        DistanceLabel.Parent = ContainerFrame
        
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Name = "ModelESP"
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(4, 0, 4, 0)
        BillboardGui.Adornee = TargetModel
        BillboardGui.MaxDistance = 1000
        BillboardGui.Parent = game.CoreGui
        ContainerFrame.Parent = BillboardGui
        
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "ModelESP_Highlight"
        Highlight.Adornee = TargetModel
        Highlight.FillColor = Color3.fromRGB(0, 255, 0)
        Highlight.FillTransparency = 0.7
        Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
        Highlight.OutlineTransparency = 0
        Highlight.Parent = game.CoreGui
        
        local function UpdateDistance()
            if ZombieESPEnabled and TargetModel.Parent then
                local LocalRootPart = GetZombieRootPart(game.Players.LocalPlayer.Character)
                local TargetRootPart = TargetModel.PrimaryPart or GetZombieRootPart(TargetModel)
                if LocalRootPart and TargetRootPart then
                    local Distance = (LocalRootPart.Position - TargetRootPart.Position).Magnitude
                    DistanceLabel.Text = string.format("[%.1f]", Distance)
                else
                    DistanceLabel.Text = "[N/A]"
                end
            end
        end
        
        local TrackerData = {
            model = TargetModel,
            billboard = BillboardGui,
            highlight = Highlight,
            connection = TargetModel.AncestryChanged:Connect(function(_, NewParent)
                if NewParent == nil then
                    if BillboardGui.Parent then
                        BillboardGui:Destroy()
                    end
                    if Highlight.Parent then
                        Highlight:Destroy()
                    end
                end
            end),
            update = game:GetService("RunService").Heartbeat:Connect(UpdateDistance)
        }
        
        UpdateDistance()
        table.insert(ZombieESPData.trackers, TrackerData)
        return TrackerData
    end
end

local function InitializeZombieESP()
    local IteratorFunction, DescendantsTable, CurrentIndex = pairs(workspace:GetDescendants())
    while true do
        local Descendant
        CurrentIndex, Descendant = IteratorFunction(DescendantsTable, CurrentIndex)
        if CurrentIndex == nil then
            local DescendantAddedConnection = workspace.DescendantAdded:Connect(function(NewDescendant)
                if NewDescendant:IsA("Model") then
                    local NameIterator, NamesTable, NameIndex = pairs(ZombieESPData.modelNames)
                    while true do
                        local ModelName
                        NameIndex, ModelName = NameIterator(NamesTable, NameIndex)
                        if NameIndex == nil then
                            break
                        end
                        if NewDescendant.Name:find(ModelName) then
                            CreateZombieESP(NewDescendant)
                            break
                        end
                    end
                end
            end)
            table.insert(ZombieESPData.connections, DescendantAddedConnection)
            return
        end
        if Descendant:IsA("Model") then
            local NameIterator, NamesTable, NameIndex = pairs(ZombieESPData.modelNames)
            while true do
                local ModelName
                NameIndex, ModelName = NameIterator(NamesTable, NameIndex)
                if NameIndex == nil then
                    break
                end
                if Descendant.Name:find(ModelName) then
                    CreateZombieESP(Descendant)
                    break
                end
            end
        end
    end
end

ESPTab:Toggle("僵尸透视", "Model ESP", ZombieESPEnabled, function(ToggleValue)
    ZombieESPEnabled = ToggleValue
    if ToggleValue then
        CleanupZombieESP()
        InitializeZombieESP()
        Notify("僵尸透视", "已开启")
    else
        CleanupZombieESP()
        Notify("僵尸透视", "已关闭")
    end
end)

local PlayerESPEnabled = false
local PlayerESPTrackers = {}
local PlayerESPConnections = {}
local PlayerESPSettings = {
    textSize = 14,
    nameSize = 16,
    fixedOffset = Vector3.new(0, 3.5, 0),
    fillColor = Color3.new(1, 1, 1),
    outlineColor = Color3.new(1, 1, 1),
    fillTransparency = 0.7,
    outlineTransparency = 0,
    showDistance = true,
    showHealth = true,
    showName = true
}

local function CleanupPlayerESP()
    local IteratorFunction, TrackersTable, CurrentIndex = pairs(PlayerESPTrackers)
    while true do
        local TrackerData
        CurrentIndex, TrackerData = IteratorFunction(TrackersTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if TrackerData.highlight then
            TrackerData.highlight:Destroy()
        end
        if TrackerData.billboard then
            TrackerData.billboard:Destroy()
        end
        if TrackerData.connection then
            TrackerData.connection:Disconnect()
        end
    end
    PlayerESPTrackers = {}
    
    local IteratorFunction2, ConnectionsTable, CurrentIndex2 = pairs(PlayerESPConnections)
    while true do
        local Connection
        CurrentIndex2, Connection = IteratorFunction2(ConnectionsTable, CurrentIndex2)
        if CurrentIndex2 == nil then
            break
        end
        Connection:Disconnect()
    end
    PlayerESPConnections = {}
end

local function GetPlayerDistance(TargetPlayer)
    local LocalPlayer = game.Players.LocalPlayer
    if not (LocalPlayer.Character and TargetPlayer.Character) then
        return "N/A"
    end
    local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local TargetRootPart = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
    return not (LocalRootPart and TargetRootPart) and "N/A" or string.format("%.1f米", (LocalRootPart.Position - TargetRootPart.Position).Magnitude)
end

local function GetPlayerHealth(TargetPlayer)
    if not TargetPlayer.Character then
        return "N/A"
    end
    local Humanoid = TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
    return Humanoid and math.floor(Humanoid.Health) or "N/A"
end

local function CreatePlayerESP(TargetPlayer)
    if PlayerESPEnabled then
        if TargetPlayer and TargetPlayer.Character then
            if PlayerESPTrackers[TargetPlayer] then
                if PlayerESPTrackers[TargetPlayer].highlight then
                    PlayerESPTrackers[TargetPlayer].highlight:Destroy()
                end
                if PlayerESPTrackers[TargetPlayer].billboard then
                    PlayerESPTrackers[TargetPlayer].billboard:Destroy()
                end
                if PlayerESPTrackers[TargetPlayer].connection then
                    PlayerESPTrackers[TargetPlayer].connection:Disconnect()
                end
            end
            
            local Highlight = Instance.new("Highlight")
            Highlight.Name = "PlayerESP_Highlight"
            Highlight.FillColor = PlayerESPSettings.fillColor
            Highlight.OutlineColor = PlayerESPSettings.outlineColor
            Highlight.FillTransparency = PlayerESPSettings.fillTransparency
            Highlight.OutlineTransparency = PlayerESPSettings.outlineTransparency
            Highlight.Parent = TargetPlayer.Character
            Highlight.Adornee = TargetPlayer.Character
            
            local BillboardGui = Instance.new("BillboardGui")
            BillboardGui.Name = "PlayerESP_Billboard"
            BillboardGui.Size = UDim2.new(6, 0, 4, 0)
            BillboardGui.StudsOffset = PlayerESPSettings.fixedOffset
            BillboardGui.AlwaysOnTop = true
            BillboardGui.Parent = TargetPlayer.Character
            BillboardGui.Adornee = TargetPlayer.Character
            
            local MainFrame = Instance.new("Frame")
            MainFrame.BackgroundTransparency = 1
            MainFrame.Size = UDim2.new(1, 0, 1, 0)
            MainFrame.Parent = BillboardGui
            
            local NameFrame = Instance.new("Frame")
            NameFrame.BackgroundTransparency = 1
            NameFrame.Size = UDim2.new(1, 0, 0.4, 0)
            NameFrame.Position = UDim2.new(0, 0, 0, 0)
            NameFrame.Parent = MainFrame
            
            local NameLabel = Instance.new("TextLabel")
            NameLabel.Name = "NameLabel"
            NameLabel.Size = UDim2.new(1, 0, 1, 0)
            NameLabel.Position = UDim2.new(0, 0, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = PlayerESPSettings.showName and (TargetPlayer.Name or "") or ""
            NameLabel.TextColor3 = Color3.new(1, 1, 1)
            NameLabel.TextXAlignment = Enum.TextXAlignment.Center
            NameLabel.Font = Enum.Font.SourceSansBold
            NameLabel.TextSize = PlayerESPSettings.nameSize
            NameLabel.Parent = NameFrame
            
            local HealthFrame = Instance.new("Frame")
            HealthFrame.BackgroundTransparency = 1
            HealthFrame.Size = UDim2.new(1, 0, 0.3, 0)
            HealthFrame.Position = UDim2.new(0, 0, 0.4, 0)
            HealthFrame.Parent = MainFrame
            
            local HealthLabel = Instance.new("TextLabel")
            HealthLabel.Name = "HealthLabel"
            HealthLabel.Size = UDim2.new(1, 0, 1, 0)
            HealthLabel.Position = UDim2.new(0, 0, 0, 0)
            HealthLabel.BackgroundTransparency = 1
            HealthLabel.TextColor3 = Color3.new(1, 1, 1)
            HealthLabel.TextXAlignment = Enum.TextXAlignment.Center
            HealthLabel.Font = Enum.Font.SourceSansBold
            HealthLabel.TextSize = PlayerESPSettings.textSize
            HealthLabel.Parent = HealthFrame
            
            local DistanceFrame = Instance.new("Frame")
            DistanceFrame.BackgroundTransparency = 1
            DistanceFrame.Size = UDim2.new(1, 0, 0.3, 0)
            DistanceFrame.Position = UDim2.new(0, 0, 0.7, 0)
            DistanceFrame.Parent = MainFrame
            
            local DistanceLabel = Instance.new("TextLabel")
            DistanceLabel.Name = "DistanceLabel"
            DistanceLabel.Size = UDim2.new(1, 0, 1, 0)
            DistanceLabel.Position = UDim2.new(0, 0, 0, 0)
            DistanceLabel.BackgroundTransparency = 1
            DistanceLabel.TextColor3 = Color3.new(1, 1, 1)
            DistanceLabel.TextXAlignment = Enum.TextXAlignment.Center
            DistanceLabel.Font = Enum.Font.SourceSans
            DistanceLabel.TextSize = PlayerESPSettings.textSize
            DistanceLabel.Parent = DistanceFrame
            
            local function UpdateLabels()
                HealthLabel.Text = PlayerESPSettings.showHealth and "血量: " .. GetPlayerHealth(TargetPlayer) or ""
                DistanceLabel.Text = PlayerESPSettings.showDistance and "距离: " .. GetPlayerDistance(TargetPlayer) or ""
                BillboardGui.StudsOffset = PlayerESPSettings.fixedOffset
            end
            
            PlayerESPTrackers[TargetPlayer] = {
                highlight = Highlight,
                billboard = BillboardGui,
                connection = game:GetService("RunService").Heartbeat:Connect(UpdateLabels)
            }
            
            UpdateLabels()
        else
            local CharacterAddedConnection = nil
            CharacterAddedConnection = TargetPlayer.CharacterAdded:Connect(function()
                CharacterAddedConnection:Disconnect()
                CreatePlayerESP(TargetPlayer)
            end)
        end
    else
        return
    end
end

local function InitializePlayerESP()
    local IteratorFunction, PlayersTable, CurrentIndex = pairs(game.Players:GetPlayers())
    while true do
        local CurrentPlayer
        CurrentIndex, CurrentPlayer = IteratorFunction(PlayersTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if CurrentPlayer ~= game.Players.LocalPlayer then
            CreatePlayerESP(CurrentPlayer)
            table.insert(PlayerESPConnections, CurrentPlayer.CharacterAdded:Connect(function()
                wait(0.5)
                CreatePlayerESP(CurrentPlayer)
            end))
        end
    end
    
    table.insert(PlayerESPConnections, game.Players.PlayerAdded:Connect(function(NewPlayer)
        if NewPlayer ~= game.Players.LocalPlayer then
            table.insert(PlayerESPConnections, NewPlayer.CharacterAdded:Connect(function()
                wait(0.5)
                CreatePlayerESP(NewPlayer)
            end))
            if NewPlayer.Character then
                CreatePlayerESP(NewPlayer)
            end
        end
    end))
end

ESPTab:Toggle("玩家透视", "Player ESP", PlayerESPEnabled, function(ToggleValue)
    PlayerESPEnabled = ToggleValue
    if ToggleValue then
        CleanupPlayerESP()
        InitializePlayerESP()
        Notify("玩家透视", "已开启")
    else
        CleanupPlayerESP()
        Notify("玩家透视", "已关闭")
    end
end)

local DataModificationSection = UILibrary:Tab("修改数据", "6035145364"):section("修改数据", true)

DataModificationSection:Textbox("修改生存时间", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.alive_time.Value = InputValue
end)

DataModificationSection:Textbox("修改最佳速度", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.best_speed.Value = InputValue
end)

DataModificationSection:Textbox("修改最佳时间", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.best_time.Value = InputValue
end)

DataModificationSection:Textbox("修改铜虫", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.bronglecronts.Value = InputValue
end)

DataModificationSection:Textbox("修改死亡次数", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.deaths.Value = InputValue
end)

DataModificationSection:Textbox("修改经验", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.xp.Value = InputValue
end)

DataModificationSection:Textbox("修改有限货币", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.limitedcurrency.Value = InputValue
end)

DataModificationSection:Textbox("修改总时间", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.total_time.Value = InputValue
end)

DataModificationSection:Textbox("修改已获取社交奖励", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.social_received.Value = InputValue
end)

DataModificationSection:Textbox("修改已捐赠社交币", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.social_donated.Value = InputValue
end)

DataModificationSection:Textbox("修改积分", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.score.Value = InputValue
end)

DataModificationSection:Textbox("修改打击次数", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.punches.Value = InputValue
end)

DataModificationSection:Textbox("修改拥有击杀次数", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.possess_kills.Value = InputValue
end)

DataModificationSection:Textbox("修改距离", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.distance.Value = InputValue
end)

DataModificationSection:Textbox("修改等级", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.level.Value = InputValue
end)

DataModificationSection:Textbox("修改击杀数", "arg", "输入", function(InputValue)
    game:GetService("Players").LocalPlayer.stats.kills.Value = InputValue
end)

local TeleportSection = UILibrary:Tab("传送功能", "6034509993"):section("传送功能", true)

local SelectedPlayer = nil

TeleportSection:Dropdown("选择玩家", {}, function(SelectedValue)
    SelectedPlayer = SelectedValue
end)

local function UpdatePlayerDropdown()
    local PlayerNames = {}
    local IteratorFunction, PlayersTable, CurrentIndex = pairs(game.Players:GetPlayers())
    while true do
        local CurrentPlayer
        CurrentIndex, CurrentPlayer = IteratorFunction(PlayersTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if CurrentPlayer ~= game.Players.LocalPlayer then
            table.insert(PlayerNames, CurrentPlayer.Name)
        end
    end
    return PlayerNames
end

TeleportSection:Button("刷新玩家列表", function()
    Notify("传送功能", "玩家列表已刷新")
end)

TeleportSection:Button("传送到选中玩家", function()
    if SelectedPlayer then
        local TargetPlayer = game.Players:FindFirstChild(SelectedPlayer)
        if TargetPlayer and TargetPlayer.Character then
            local TargetRootPart = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
            local LocalPlayer = game.Players.LocalPlayer
            if TargetRootPart and LocalPlayer.Character then
                local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if LocalRootPart then
                    LocalRootPart.CFrame = TargetRootPart.CFrame
                    Notify("传送功能", "已传送到: " .. SelectedPlayer)
                end
            end
        else
            Notify("传送功能", "无法找到目标玩家")
        end
    else
        Notify("传送功能", "请先选择一个玩家")
    end
end)

TeleportSection:Button("传送到随机玩家", function()
    local AllPlayers = game.Players:GetPlayers()
    local ValidPlayers = {}
    local IteratorFunction, PlayersTable, CurrentIndex = pairs(AllPlayers)
    while true do
        local CurrentPlayer
        CurrentIndex, CurrentPlayer = IteratorFunction(PlayersTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if CurrentPlayer ~= game.Players.LocalPlayer and CurrentPlayer.Character then
            table.insert(ValidPlayers, CurrentPlayer)
        end
    end
    
    if #ValidPlayers > 0 then
        local RandomPlayer = ValidPlayers[math.random(1, #ValidPlayers)]
        local TargetRootPart = RandomPlayer.Character:FindFirstChild("HumanoidRootPart")
        local LocalPlayer = game.Players.LocalPlayer
        if TargetRootPart and LocalPlayer.Character then
            local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if LocalRootPart then
                LocalRootPart.CFrame = TargetRootPart.CFrame
                Notify("传送功能", "已传送到: " .. RandomPlayer.Name)
            end
        end
    else
        Notify("传送功能", "没有可用的玩家")
    end
end)

local CoordinateX = 0
local CoordinateY = 0
local CoordinateZ = 0

TeleportSection:Textbox("X坐标", "X", "0", function(InputValue)
    CoordinateX = tonumber(InputValue) or 0
end)

TeleportSection:Textbox("Y坐标", "Y", "0", function(InputValue)
    CoordinateY = tonumber(InputValue) or 0
end)

TeleportSection:Textbox("Z坐标", "Z", "0", function(InputValue)
    CoordinateZ = tonumber(InputValue) or 0
end)

TeleportSection:Button("传送到坐标", function()
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if LocalRootPart then
            LocalRootPart.CFrame = CFrame.new(CoordinateX, CoordinateY, CoordinateZ)
            Notify("传送功能", string.format("已传送到坐标: %.1f, %.1f, %.1f", CoordinateX, CoordinateY, CoordinateZ))
        end
    end
end)

TeleportSection:Button("复制当前坐标", function()
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if LocalRootPart then
            local Position = LocalRootPart.Position
            local CoordinateString = string.format("%.2f, %.2f, %.2f", Position.X, Position.Y, Position.Z)
            setclipboard(CoordinateString)
            Notify("传送功能", "坐标已复制: " .. CoordinateString)
        end
    end
end)

local LocationTeleportSection = UILibrary:Tab("传送功能", "6034509993"):section("地点传送", true)

local SavedLocations = {}

LocationTeleportSection:Textbox("保存位置名称", "名称", "输入名称", function(InputValue)
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if LocalRootPart then
            SavedLocations[InputValue] = LocalRootPart.CFrame
            Notify("地点传送", "已保存位置: " .. InputValue)
        end
    end
end)

LocationTeleportSection:Button("传送到出生点", function()
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local LocalRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if LocalRootPart then
            local SpawnLocation = workspace:FindFirstChildOfClass("SpawnLocation")
            if SpawnLocation then
                LocalRootPart.CFrame = SpawnLocation.CFrame + Vector3.new(0, 3, 0)
                Notify("地点传送", "已传送到出生点")
            else
                Notify("地点传送", "未找到出生点")
            end
        end
    end
end)

local CharacterModSection = UILibrary:Tab("角色修改", "6034509993"):section("角色修改", true)

CharacterModSection:Slider("设置跳跃高度", "", 50, 50, 500, false, function(SliderValue)
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.JumpPower = SliderValue
        end
    end
end)

CharacterModSection:Slider("设置重力", "", 196, 0, 500, false, function(SliderValue)
    workspace.Gravity = SliderValue
end)

CharacterModSection:Toggle("无碰撞", "", false, function(ToggleValue)
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local IteratorFunction, DescendantsTable, CurrentIndex = pairs(LocalPlayer.Character:GetDescendants())
        while true do
            local Descendant
            CurrentIndex, Descendant = IteratorFunction(DescendantsTable, CurrentIndex)
            if CurrentIndex == nil then
                break
            end
            if Descendant:IsA("BasePart") then
                Descendant.CanCollide = not ToggleValue
            end
        end
    end
    Notify("角色修改", ToggleValue and "无碰撞已开启" or "无碰撞已关闭")
end)

CharacterModSection:Toggle("隐身", "", false, function(ToggleValue)
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local IteratorFunction, DescendantsTable, CurrentIndex = pairs(LocalPlayer.Character:GetDescendants())
        while true do
            local Descendant
            CurrentIndex, Descendant = IteratorFunction(DescendantsTable, CurrentIndex)
            if CurrentIndex == nil then
                break
            end
            if Descendant:IsA("BasePart") then
                Descendant.Transparency = ToggleValue and 1 or 0
            elseif Descendant:IsA("Decal") then
                Descendant.Transparency = ToggleValue and 1 or 0
            end
        end
    end
    Notify("角色修改", ToggleValue and "隐身已开启" or "隐身已关闭")
end)

CharacterModSection:Button("恢复默认跳跃高度", function()
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character then
        local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.JumpPower = 50
            Notify("角色修改", "已恢复默认跳跃高度")
        end
    end
end)

CharacterModSection:Button("恢复默认重力", function()
    workspace.Gravity = 196.2
    Notify("角色修改", "已恢复默认重力")
end)

local FlyEnabled = false
local FlySpeed = 50
local FlyConnection = nil
local BodyGyro = nil
local BodyVelocity = nil

CharacterModSection:Slider("飞行速度", "", 50, 10, 500, false, function(SliderValue)
    FlySpeed = SliderValue
end)

CharacterModSection:Toggle("飞行", "", false, function(ToggleValue)
    FlyEnabled = ToggleValue
    local LocalPlayer = game.Players.LocalPlayer
    
    if ToggleValue then
        if LocalPlayer.Character then
            local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            
            if HumanoidRootPart and Humanoid then
                BodyGyro = Instance.new("BodyGyro")
                BodyGyro.P = 9e4
                BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                BodyGyro.CFrame = HumanoidRootPart.CFrame
                BodyGyro.Parent = HumanoidRootPart
                
                BodyVelocity = Instance.new("BodyVelocity")
                BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                BodyVelocity.Parent = HumanoidRootPart
                
                FlyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if FlyEnabled and HumanoidRootPart then
                        local Camera = workspace.CurrentCamera
                        local MoveDirection = Vector3.new(0, 0, 0)
                        local UserInputService = game:GetService("UserInputService")
                        
                        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                            MoveDirection = MoveDirection + Camera.CFrame.LookVector
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                            MoveDirection = MoveDirection - Camera.CFrame.LookVector
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                            MoveDirection = MoveDirection - Camera.CFrame.RightVector
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                            MoveDirection = MoveDirection + Camera.CFrame.RightVector
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                            MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
                        end
                        
                        if MoveDirection.Magnitude > 0 then
                            MoveDirection = MoveDirection.Unit
                        end
                        
                        BodyVelocity.Velocity = MoveDirection * FlySpeed
                        BodyGyro.CFrame = Camera.CFrame
                    end
                end)
                
                Notify("飞行", "已开启 - 使用WASD移动, 空格上升, Ctrl下降")
            end
        end
    else
        if FlyConnection then
            FlyConnection:Disconnect()
            FlyConnection = nil
        end
        if BodyGyro then
            BodyGyro:Destroy()
            BodyGyro = nil
        end
        if BodyVelocity then
            BodyVelocity:Destroy()
            BodyVelocity = nil
        end
        Notify("飞行", "已关闭")
    end
end)

local MiscSection = UILibrary:Tab("杂项功能", "6034509993"):section("杂项功能", true)

MiscSection:Button("点击传送", function()
    local LocalPlayer = game.Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    
    Mouse.Button1Down:Connect(function()
        if LocalPlayer.Character then
            local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart and Mouse.Target then
                HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end
    end)
    
    Notify("杂项功能", "点击传送已开启 - 点击任意位置传送")
end)

MiscSection:Button("清除所有粒子效果", function()
    local IteratorFunction, DescendantsTable, CurrentIndex = pairs(workspace:GetDescendants())
    while true do
        local Descendant
        CurrentIndex, Descendant = IteratorFunction(DescendantsTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if Descendant:IsA("ParticleEmitter") or Descendant:IsA("Trail") or Descendant:IsA("Beam") then
            Descendant:Destroy()
        end
    end
    Notify("杂项功能", "已清除所有粒子效果")
end)

MiscSection:Button("清除所有声音", function()
    local IteratorFunction, DescendantsTable, CurrentIndex = pairs(workspace:GetDescendants())
    while true do
        local Descendant
        CurrentIndex, Descendant = IteratorFunction(DescendantsTable, CurrentIndex)
        if CurrentIndex == nil then
            break
        end
        if Descendant:IsA("Sound") then
            Descendant:Stop()
            Descendant.Volume = 0
        end
    end
    Notify("杂项功能", "已清除所有声音")
end)

MiscSection:Toggle("全屏模式", "", false, function(ToggleValue)
    game:GetService("GuiService"):SetFullscreen(ToggleValue)
    Notify("杂项功能", ToggleValue and "全屏已开启" or "全屏已关闭")
end)

MiscSection:Button("复制游戏ID", function()
    setclipboard(tostring(game.PlaceId))
    Notify("杂项功能", "游戏ID已复制: " .. game.PlaceId)
end)

MiscSection:Button("复制服务器ID", function()
    setclipboard(tostring(game.JobId))
    Notify("杂项功能", "服务器ID已复制")
end)

local ServerHopSection = UILibrary:Tab("杂项功能", "6034509993"):section("服务器跳转", true)

ServerHopSection:Button("跳转到最少人数服务器", function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    
    local Success, Servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if Success and Servers and Servers.data then
        local BestServer = nil
        local MinPlayers = math.huge
        
        local IteratorFunction, ServersTable, CurrentIndex = pairs(Servers.data)
        while true do
            local Server
            CurrentIndex, Server = IteratorFunction(ServersTable, CurrentIndex)
            if CurrentIndex == nil then
                break
            end
            if Server.playing < MinPlayers and Server.id ~= game.JobId then
                MinPlayers = Server.playing
                BestServer = Server
            end
        end
        
        if BestServer then
            Notify("服务器跳转", "正在跳转到最少人数服务器...")
            TeleportService:TeleportToPlaceInstance(game.PlaceId, BestServer.id)
        else
            Notify("服务器跳转", "未找到可用服务器")
        end
    else
        Notify("服务器跳转", "获取服务器列表失败")
    end
end)

ServerHopSection:Button("跳转到最多人数服务器", function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    
    local Success, Servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"))
    end)
    
    if Success and Servers and Servers.data then
        local BestServer = nil
        local MaxPlayers = 0
        
        local IteratorFunction, ServersTable, CurrentIndex = pairs(Servers.data)
        while true do
            local Server
            CurrentIndex, Server = IteratorFunction(ServersTable, CurrentIndex)
            if CurrentIndex == nil then
                break
            end
            if Server.playing > MaxPlayers and Server.id ~= game.JobId then
                MaxPlayers = Server.playing
                BestServer = Server
            end
        end
        
        if BestServer then
            Notify("服务器跳转", "正在跳转到最多人数服务器...")
            TeleportService:TeleportToPlaceInstance(game.PlaceId, BestServer.id)
        else
            Notify("服务器跳转", "未找到可用服务器")
        end
    else
        Notify("服务器跳转", "获取服务器列表失败")
    end
end)

ServerHopSection:Button("跳转到随机服务器", function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    
    local Success, Servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if Success and Servers and Servers.data and #Servers.data > 0 then
        local ValidServers = {}
        local IteratorFunction, ServersTable, CurrentIndex = pairs(Servers.data)
        while true do
            local Server
            CurrentIndex, Server = IteratorFunction(ServersTable, CurrentIndex)
            if CurrentIndex == nil then
                break
            end
            if Server.id ~= game.JobId then
                table.insert(ValidServers, Server)
            end
        end
        
        if #ValidServers > 0 then
            local RandomServer = ValidServers[math.random(1, #ValidServers)]
            Notify("服务器跳转", "正在跳转到随机服务器...")
            TeleportService:TeleportToPlaceInstance(game.PlaceId, RandomServer.id)
        else
            Notify("服务器跳转", "未找到可用服务器")
        end
    else
        Notify("服务器跳转", "获取服务器列表失败")
    end
end)

local ChatSection = UILibrary:Tab("聊天功能", "6034509993"):section("聊天功能", true)

local SpamMessage = ""
local SpamEnabled = false
local SpamDelay = 1

ChatSection:Textbox("刷屏消息", "", "输入消息", function(InputValue)
    SpamMessage = InputValue
end)

ChatSection:Slider("刷屏间隔(秒)", "", 1, 0.5, 10, true, function(SliderValue)
    SpamDelay = SliderValue
end)

ChatSection:Toggle("开始刷屏", "", false, function(ToggleValue)
    SpamEnabled = ToggleValue
    if ToggleValue then
        Notify("聊天功能", "刷屏已开启")
        spawn(function()
            while SpamEnabled do
                if SpamMessage ~= "" then
                    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(SpamMessage, "All")
                end
                wait(SpamDelay)
            end
        end)
    else
        Notify("聊天功能", "刷屏已关闭")
    end
end)

ChatSection:Button("发送一条消息", function()
    if SpamMessage ~= "" then
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(SpamMessage, "All")
        Notify("聊天功能", "消息已发送")
    else
        Notify("聊天功能", "请先输入消息")
    end
end)

local CreditsSection = UILibrary:Tab("鸣谢", "134258450785486"):section("鸣谢", true)

CreditsSection:Label("猫脚本")
CreditsSection:Label("版本: 1.0.0")
CreditsSection:Label("作者: 臭猫")
CreditsSection:Label("帮助者: 臭猫")
CreditsSection:Label("感谢所有支持者!")
CreditsSection:Label("此脚本永久免费")
CreditsSection:Label("严禁倒卖!")

CreditsSection:Button("加入QQ群", function()
    setclipboard("894995244")
    Notify("鸣谢", "QQ群号已复制: 894995244")
end)

CreditsSection:Button("联系作者", function()
    setclipboard("2131869117")
    Notify("鸣谢", "作者QQ已复制: 2131869117")
end)

Notify("猫脚本", "脚本加载完成! 祝您使用愉快~")
