-- ==========================================
-- BRUSK HUB | CLEAN & FAST MENU
-- ==========================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local targetParent = CoreGui
pcall(function()
    if not syn and not gethui then
        targetParent = LocalPlayer:WaitForChild("PlayerGui")
    elseif gethui then
        targetParent = gethui()
    end
end)

if targetParent:FindFirstChild("BruskHubCleanV500") then
    targetParent.BruskHubCleanV500:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BruskHubCleanV500"
screenGui.ResetOnSpawn = false
screenGui.Parent = targetParent

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 360)
mainFrame.Position = UDim2.new(0.5, -175, 0.4, -180)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 255, 255)
stroke.Thickness = 3
stroke.Parent = mainFrame

task.spawn(function()
    while screenGui.Parent do
        for i = 0, 1, 0.005 do
            stroke.Color = Color3.fromHSV(i, 1, 1)
            task.wait(0.03)
        end
    end
end)

local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, 0, 0, 45)
headerFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 30)
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = headerFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ BRUSK HUB | PRO"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 15
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = headerFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -38, 0, 7)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 40, 90)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 13
closeBtn.Parent = headerFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- وێنەی پرۆفایلی یاریزانەکە
local profileImg = Instance.new("ImageLabel")
profileImg.Size = UDim2.new(0, 52, 0, 52)
profileImg.Position = UDim2.new(0.5, -26, 0, 50)
profileImg.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
pcall(function()
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local content, isReady = Players:GetUserThumbnailAsync(LocalPlayer.UserId, thumbType, thumbSize)
    profileImg.Image = content
end)
if profileImg.Image == "" then
    profileImg.Image = "rbxassetid://10875151528"
end
profileImg.Parent = mainFrame

local pCorner = Instance.new("UICorner")
pCorner.CornerRadius = UDim.new(1, 0)
pCorner.Parent = profileImg

local pStroke = Instance.new("UIStroke")
pStroke.Color = Color3.fromRGB(0, 255, 255)
pStroke.Thickness = 2
pStroke.Parent = profileImg

-- دەقی کات، FPS و MS
local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1, 0, 0, 20)
statsLabel.Position = UDim2.new(0, 0, 0, 105)
statsLabel.BackgroundTransparency = 1
statsLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
statsLabel.Font = Enum.Font.GothamBold
statsLabel.TextSize = 11
statsLabel.TextXAlignment = Enum.TextXAlignment.Center
statsLabel.Parent = mainFrame

local startTime = tick()
local lastUpdate = 0
local cachedFps = 60
local cachedPing = 0

RunService.RenderStepped:Connect(function(dt)
    lastUpdate = lastUpdate + dt
    if lastUpdate >= 0.5 then
        lastUpdate = 0
        cachedFps = math.floor(1 / dt)
        pcall(function()
            cachedPing = math.floor(LocalPlayer:GetNetworkPing() * 1000)
        end)
    end
    
    local elapsed = math.floor(tick() - startTime)
    local hours = math.floor(elapsed / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = elapsed % 60
    
    local timeStr = string.format("%02d:%02d:%02d", hours, minutes, seconds)
    statsLabel.Text = string.format("⏱️ Time: %s | 🎮 FPS: %d | ⚡ MS: %dms", timeStr, cachedFps, cachedPing)
end)

-- پەنجەرەی سەرەکی لیستەکان
local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -20, 1, -135)
container.Position = UDim2.new(0, 10, 0, 130)
container.BackgroundTransparency = 1
container.CanvasSize = UDim2.new(0, 0, 0, 200)
container.ScrollBarThickness = 4
container.Parent = mainFrame

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 8)
list.Parent = container

-- نۆتیفکەیشنی نایاب
local function notify(msg)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 310, 0, 44)
    notif.Position = UDim2.new(0.5, -155, 0, 18)
    notif.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.Text = msg
    notif.Font = Enum.Font.FredokaOne
    notif.TextSize = 15
    notif.ZIndex = 10
    notif.Parent = screenGui

    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 12)
    nc.Parent = notif

    local ns = Instance.new("UIStroke")
    ns.Color = Color3.fromRGB(0, 255, 255)
    ns.Transparency = 0.1
    ns.Thickness = 2
    ns.Parent = notif

    task.spawn(function()
        task.wait(2)
        for i = 1, 0, -0.1 do
            notif.TextTransparency = 1 - i
            notif.BackgroundTransparency = 1 - i
            ns.Transparency = 1 - i
            task.wait(0.05)
        end
        notif:Destroy()
    end)
end

local function createBtn(parentFrame, tKey, sKey, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -4, 0, 48)
    btn.BackgroundColor3 = color
    btn.Text = ""
    btn.Parent = parentFrame

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 10)
    bCorner.Parent = btn

    local bStroke = Instance.new("UIStroke")
    bStroke.Color = Color3.fromRGB(255, 255, 255)
    bStroke.Transparency = 0.5
    bStroke.Thickness = 1.5
    bStroke.Parent = btn

    local tLabel = Instance.new("TextLabel")
    tLabel.Size = UDim2.new(1, -20, 0, 20)
    tLabel.Position = UDim2.new(0, 12, 0, 5)
    tLabel.BackgroundTransparency = 1
    tLabel.Text = tKey
    tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tLabel.Font = Enum.Font.GothamBold
    tLabel.TextSize = 13
    tLabel.TextXAlignment = Enum.TextXAlignment.Left
    tLabel.Parent = btn

    local sLabel = Instance.new("TextLabel")
    sLabel.Size = UDim2.new(1, -20, 0, 16)
    sLabel.Position = UDim2.new(0, 12, 0, 25)
    sLabel.BackgroundTransparency = 1
    sLabel.Text = sKey
    sLabel.TextColor3 = Color3.fromRGB(200, 210, 240)
    sLabel.Font = Enum.Font.Gotham
    sLabel.TextSize = 11
    sLabel.TextXAlignment = Enum.TextXAlignment.Left
    sLabel.Parent = btn

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return tLabel, sLabel
end

-- دوگمەکانی مەنیو
createBtn(container, "🔥 Miranda Hub", "سکرپتی خێرا بۆ دزینی هێلکەکان", Color3.fromRGB(45, 20, 80), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/main/stealaeggs"))()
    notify("Miranda Hub Loaded!")
end)

createBtn(container, "🌶️ Chilli Hub", "سکرپتی خێرا بۆ Steal An Egg", Color3.fromRGB(20, 45, 80), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))()
    notify("Chilli Hub Loaded!")
end)

createBtn(container, "🗑️ Clear / Destroy GUI", "پاککردنەوەی تەواوی مەنیوکان", Color3.fromRGB(50, 25, 30), function()
    screenGui:Destroy()
end)

-- دوگمەی مەلەوانی دەرەکی (Toggle Button B)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleBRUSK"
toggleBtn.Size = UDim2.new(0, 56, 0, 56)
toggleBtn.Position = UDim2.new(0, 15, 0, 85)
toggleBtn.BackgroundColor3 = Color3.fromRGB(12, 10, 20)
toggleBtn.Text = "B"
toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
toggleBtn.Font = Enum.Font.GothamBlack
toggleBtn.TextSize = 26
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.Visible = true
toggleBtn.Parent = screenGui

local tCorner = Instance.new("UICorner")
tCorner.CornerRadius = UDim.new(1, 0)
tCorner.Parent = toggleBtn

local tStroke = Instance.new("UIStroke")
tStroke.Color = Color3.fromRGB(0, 255, 255)
tStroke.Thickness = 2.5
tStroke.Parent = toggleBtn

task.spawn(function()
    while toggleBtn.Parent do
        for i = 0, 1, 0.008 do
            tStroke.Color = Color3.fromHSV(i, 1, 1)
            task.wait(0.04)
        end
    end
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
