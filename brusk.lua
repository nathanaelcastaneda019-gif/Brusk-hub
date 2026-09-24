local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BruskHubMasterV22"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local loadGui = Instance.new("Frame")
loadGui.Name = "LoadingScreen"
loadGui.Size = UDim2.new(0, 300, 0, 140)
loadGui.Position = UDim2.new(0.5, -150, 0.5, -70)
loadGui.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
loadGui.BorderSizePixel = 0
loadGui.Parent = screenGui

local loadCorner = Instance.new("UICorner")
loadCorner.CornerRadius = UDim.new(0, 16)
loadCorner.Parent = loadGui

local loadStroke = Instance.new("UIStroke")
loadStroke.Color = Color3.fromRGB(0, 240, 255)
loadStroke.Thickness = 2.5
loadStroke.Parent = loadGui

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 40)
loadTitle.Position = UDim2.new(0, 0, 0, 15)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "BRUSK HUB LOADING..."
loadTitle.TextColor3 = Color3.fromRGB(0, 245, 255)
loadTitle.TextSize = 16
loadTitle.Font = Enum.Font.SourceSansBold
loadTitle.Parent = loadGui

local loadStatus = Instance.new("TextLabel")
loadStatus.Size = UDim2.new(1, -40, 0, 30)
loadStatus.Position = UDim2.new(0, 20, 0, 55)
loadStatus.BackgroundTransparency = 1
loadStatus.Text = "سکرێپتە ئامادە دەکرێت..."
loadStatus.TextColor3 = Color3.fromRGB(200, 220, 255)
loadStatus.TextSize = 14
loadStatus.Font = Enum.Font.SourceSans
loadStatus.Parent = loadGui

