-- ==========================================
-- BRUSK HUB | ULTRA SPEED EDITION V22
-- ==========================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

local hudRainbowConnection

-- 1. Screen GUI Container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BruskHubMasterV22"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- 2. Bottom-Center HUD Widget
local hudFrame = Instance.new("Frame")
hudFrame.Name = "BruskHUD"
hudFrame.Size = UDim2.new(0, 310, 0, 68)
hudFrame.Position = UDim2.new(0.5, -155, 1, -140)
hudFrame.BackgroundColor3 = Color3.fromRGB(18, 10, 25)
hudFrame.BackgroundTransparency = 0.1
hudFrame.BorderSizePixel = 0
hudFrame.Visible = false
hudFrame.Parent = screenGui

local hudCorner = Instance.new("UICorner")
hudCorner.CornerRadius = UDim.new(0, 14)
hudCorner.Parent = hudFrame

local hudStroke = Instance.new("UIStroke")
hudStroke.Color = Color3.fromRGB(130, 80, 255)
hudStroke.Thickness = 2.5
hudStroke.Parent = hudFrame

-- Profile Avatar Image
local avatarImage = Instance.new("ImageLabel")
avatarImage.Size = UDim2.new(0, 48, 0, 48)
avatarImage.Position = UDim2.new(0, 10, 0.5, -24)
avatarImage.BackgroundTransparency = 1
avatarImage.Image = Players:GetUserThumbnailAsync(
    LocalPlayer.UserId,
    Enum.ThumbnailType.HeadShot,
    Enum.ThumbnailSize.Size100x100
)
avatarImage.Parent = hudFrame

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = avatarImage

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Color = Color3.fromRGB(0, 240, 255)
avatarStroke.Thickness = 2
avatarStroke.Parent = avatarImage

-- Online Status Dot
local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 10, 0, 10)
statusDot.Position = UDim2.new(0, 42, 0, 42)
statusDot.BackgroundColor3 = Color3.fromRGB(50, 255, 150)
statusDot.BorderSizePixel = 0
statusDot.Parent = hudFrame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

-- User Name Text (Rainbow)
local hudUserText = Instance.new("TextLabel")
hudUserText.Size = UDim2.new(1, -70, 0, 24)
hudUserText.Position = UDim2.new(0, 66, 0, 8)
hudUserText.BackgroundTransparency = 1
hudUserText.Text = LocalPlayer.Name
hudUserText.TextSize = 16
hudUserText.Font = Enum.Font.SourceSansBold
hudUserText.TextXAlignment = Enum.TextXAlignment.Left
hudUserText.TextStrokeTransparency = 0
hudUserText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
hudUserText.Parent = hudFrame

-- Stats, Ping & WalkSpeed Text (Rainbow)
local hudStatsText = Instance.new("TextLabel")
hudStatsText.Size = UDim2.new(1, -70, 0, 22)
hudStatsText.Position = UDim2.new(0, 66, 0, 34)
hudStatsText.BackgroundTransparency = 1
hudStatsText.TextSize = 11
hudStatsText.Font = Enum.Font.SourceSansBold
hudStatsText.TextXAlignment = Enum.TextXAlignment.Left
hudStatsText.TextStrokeTransparency = 0
hudStatsText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
hudStatsText.Parent = hudFrame

local function activateHUD()
    local startTime = tick()
    hudFrame.Visible = true

    if hudRainbowConnection then hudRainbowConnection:Disconnect() end
    hudRainbowConnection = RunService.RenderStepped:Connect(function()
        local hue = (tick() * 0.8) % 1
        local currentColor = Color3.fromHSV(hue, 1, 1)

        hudUserText.TextColor3 = currentColor
        hudStatsText.TextColor3 = currentColor

        local elapsedSeconds = math.floor(tick() - startTime)
        
        if elapsedSeconds <= 60 then
            hudUserText.Text = "tiktok//brusky_script"
        else
            hudUserText.Text = LocalPlayer.Name
        end
        
        local pingValue = 0
        pcall(function()
            pingValue = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)

        local walkSpeed = 16
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                walkSpeed = math.floor(LocalPlayer.Character.Humanoid.WalkSpeed)
            end
        end)

        hudStatsText.Text = "⏱️ " .. elapsedSeconds .. "s | 📶 " .. pingValue .. "ms | ⚡ " .. walkSpeed .. "Spd"
    end)
end

local function removeHUD()
    if hudRainbowConnection then
        hudRainbowConnection:Disconnect()
        hudRainbowConnection = nil
    end
    hudFrame.Visible = false
end

-- 3. Main Script Hub Window
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 340, 0, 360)
mainFrame.Position = UDim2.new(0.5, -170, 0.4, -180)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true -- ڕاستەوخۆ دەردەکەوێت چونکە لۆدینگ لابرا
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 220, 255)
stroke.Thickness = 2.5
stroke.Parent = mainFrame

-- Title Header
local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, 0, 0, 42)
headerFrame.BackgroundColor3 = Color3.fromRGB(25, 18, 40)
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = headerFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "BRUSK HUB  •  ULTRA SPEED"
title.TextColor3 = Color3.fromRGB(0, 245, 255)
title.TextSize = 14
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = headerFrame

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -36, 0, 7)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 14
closeBtn.Parent = headerFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Button Container
local container = Instance.new("Frame")
container.Size = UDim2.new(1, -24, 1, -56)
container.Position = UDim2.new(0, 12, 0, 50)
container.BackgroundTransparency = 1
container.Parent = mainFrame

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 8)
list.Parent = container

local function createScriptBtn(titleText, subtitleText, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.BackgroundColor3 = color
    btn.AutoButtonColor = true
    btn.Text = ""
    btn.Parent = container

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(0, 240, 255)
    btnStroke.Transparency = 0.4
    btnStroke.Thickness = 1.5
    btnStroke.Parent = btn

    local mainText = Instance.new("TextLabel")
    mainText.Size = UDim2.new(1, -20, 0, 22)
    mainText.Position = UDim2.new(0, 12, 0, 6)
    mainText.BackgroundTransparency = 1
    mainText.Text = titleText
    mainText.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainText.Font = Enum.Font.SourceSansBold
    mainText.TextSize = 14
    mainText.TextXAlignment = Enum.TextXAlignment.Left
    mainText.Parent = btn

    local subText = Instance.new("TextLabel")
    subText.Size = UDim2.new(1, -20, 0, 16)
    subText.Position = UDim2.new(0, 12, 0, 25)
    subText.BackgroundTransparency = 1
    subText.Text = subtitleText
    subText.TextColor3 = Color3.fromRGB(180, 210, 255)
    subText.Font = Enum.Font.SourceSans
    subText.TextSize = 11
    subText.TextXAlignment = Enum.TextXAlignment.Left
    subText.Parent = btn

    btn.MouseButton1Click:Connect(function()
        task.spawn(callback)
    end)
end

-- 1. Miranda Hub
createScriptBtn("🔥 Miranda Hub", "سکرپتی خێرا بۆ دزینی هێلکەکان", Color3.fromRGB(40, 25, 70), function()
    activateHUD()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/main/stealaeggs"))()
    end)
end)

-- 2. Chilli Hub
createScriptBtn("🌶️ Chilli Hub", "سکرپتی خێرا بۆ Steal An Egg", Color3.fromRGB(30, 45, 75), function()
    activateHUD()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))()
    end)
end)

-- 3. Private Server Bypass
createScriptBtn("🔒 Private Server Bypass", "پەڕینەوەی خێرا بۆ سێرڤەری تایبەتی", Color3.fromRGB(20, 60, 60), function()
    activateHUD()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-roblox/PrivateServerBypass/refs/heads/main/lua"))()
    end)
end)

-- 4. Remove HUD Button
createScriptBtn("❌ Remove HUD Stats", "لابردنی تابلۆی زانیاری خێرا", Color3.fromRGB(50, 30, 60), function()
    removeHUD()
end)

-- 5. Clear / Destroy GUI
createScriptBtn("🗑️ Clear / Destroy GUI", "پاککردنەوەی تەواوی مەنیوکان", Color3.fromRGB(40, 40, 50), function()
    removeHUD()
    screenGui:Destroy()
end)

-- Screen Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleBRUSK"
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 15, 0, 85)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
toggleBtn.Text = "BRUSK"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 11
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.Visible = true -- دیارە لە کاتی کردنهوەدا
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Thickness = 2
toggleStroke.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
