game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "猫脚本",
    Text = "欢迎使用猫脚本",
    Icon = "rbxassetid://18941716391",
    Duration = 1,
    Callback = bindable,
    Button1 = "脚本一般",
    Button2 = "感谢您的使用"
})

wait(1.5)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "猫脚本",
    Text = "自动检测到此服务器为nico的下一个机器人",
    Icon = "rbxassetid://18941716391",
    Duration = 1,
    Callback = bindable,
    Button1 = "脚本为永久免费脚本",
    Button2 = "请勿倒卖"
})

wait(1.5)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "猫脚本",
    Text = "自动为您打开nico的下一个机器人服务器功能",
    Icon = "rbxassetid://18941716391",
    Duration = 2,
    Callback = bindable,
    Button1 = "祝您玩的愉快",
    Button2 = "玩的开心"
})

local RevenantLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
RevenantLibrary.DefaultColor = Color3.fromRGB(255, 0, 0)

RevenantLibrary:Notification({
    Text = "猫脚本作者: 臭猫大王",
    Duration = 6
})

wait(1)

RevenantLibrary:Notification({
    Text = "猫脚本帮助者: 臭猫",
    Duration = 6
})

wait(1)

RevenantLibrary:Notification({
    Text = "谢谢大家一直以来的支持
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

local InfoTab = UILibrary:Tab("信息", "18941716391")

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
AuthorInfoSection:Label("兄弟：钱哥")
AuthorInfoSection:Label("猫脚本")
AuthorInfoSection:Label("永不跑路的脚本")
AuthorInfoSection:Label("作者: 臭猫大王")
AuthorInfoSection:Label("作者QQ: 2131869117")
AuthorInfoSection:Label("猫脚本QQ主群: 91")
AuthorInfoSection:Label("猫脚本QQ副群: 91")
AuthorInfoSection:Label("猫脚本QQ二群: 746849372")
AuthorInfoSection:Label("猫脚本QQ三群: 571553667")
AuthorInfoSection:Label("猫脚本QQ四群: 609250910")
AuthorInfoSection:Label("解卡主群: 134410951")
AuthorInfoSection:Label("解卡群二群: 954149920")
AuthorInfoSection:Label("猫脚本帮助者: 臭猫")
AuthorInfoSection:Label("给猫脚本提供了许多的功能源码与帮助")
AuthorInfoSection:Label("谢谢您的帮助与支持")

AuthorInfoSection:Button("复制作者QQ", function()
    setclipboard("3662088421")
end)

AuthorInfoSection:Button("复制猫脚本QQ主群", function()
    setclipboard("7891")
end)

AuthorInfoSection:Button("复制猫脚本QQ副群", function()
    setclipboard("102")