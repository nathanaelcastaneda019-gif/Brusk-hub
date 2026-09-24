--[==[ Brusk Hub Protected - Ultra Speed ]==]
local _c = {'\x67\x61\x6d\x65','\x50\x6c\x61\x79\x65\x72\x73','\x52\x75\x6e\x53\x65\x72\x76\x69\x63\x65','\x53\x74\x61\x74\x73','\x4c\x6f\x63\x61\x6c\x50\x6c\x61\x79\x65\x72','\x49\x6e\x73\x74\x61\x6e\x63\x65','\x6e\x65\x77','\x53\x63\x72\x65\x65\x6e\x47\x75\x69','\x50\x6c\x61\x79\x65\x72\x47\x75\x69','\x46\x72\x61\x6d\x65','\x53\x69\x7a\x65','\x55\x44\x69\x6d\x32','\x50\x6f\x73\x69\x74\x69\x6f\x6e','\x42\x61\x63\x6b\x67\x72\x6f\x75\x6e\x64\x43\x6f\x6c\x6f\x72\x33','\x66\x72\x6f\x6d\x52\x47\x42','\x42\x6f\x72\x64\x65\x72\x53\x69\x7a\x65\x50\x69\x78\x65\x6c','\x50\x61\x72\x65\x6e\x74','\x55\x49\x43\x6f\x72\x6e\x65\x72','\x43\x6f\x72\x6e\x65\x72\x52\x61\x64\x69\x75\x73','\x55\x49\x53\x74\x72\x6f\x6b\x65','\x43\x6f\x6c\x6f\x72','\x54\x68\x69\x63\x6b\x6e\x65\x73\x73','\x54\x65\x78\x74\x4c\x61\x62\x65\x6c','\x54\x65\x78\x74','\x54\x65\x78\x74\x43\x6f\x6c\x6f\x72\x33','\x54\x65\x78\x74\x53\x69\x7a\x65','\x46\x6f\x6e\x74','\x45\x6e\x75\x6d','\x53\x6f\x75\x72\x63\x65\x53\x61\x6e\x73\x42\x6f\x6c\x64'};
local Plrs = game[_c[2]](game);
local LP = Plrs[_c[5]];
local SGui = Instance[_c[7]](_c[8]);
SGui.Name = "BruskHubMasterV22";
SGui.ResetOnSpawn = false;
SGui.Parent = LP[_c[9]]:WaitForChild("PlayerGui");

local mf = Instance.new(_c[10]);
mf.Name = "MainFrame";
mf.Size = _c[12].new(0, 340, 0, 360);
mf.Position = _c[12].new(0.5, -170, 0.4, -180);
mf.BackgroundColor3 = _c[14].new(15, 12, 25);
mf.BorderSizePixel = 0;
mf.Active = true;
mf.Draggable = true;
mf.Visible = true;
mf.Parent = SGui;

local crn = Instance.new(_c[17]);
crn.CornerRadius = _c[12].new(0, 14);
crn.Parent = mf;

local strk = Instance.new(_c[19]);
strk.Color = _c[14].new(0, 220, 255);
strk.Thickness = 2.5;
strk.Parent = mf;

local hf = Instance.new(_c[10]);
hf.Size = _c[12].new(1, 0, 0, 42);
hf.BackgroundColor3 = _c[14].new(25, 18, 40);
hf.BorderSizePixel = 0;
hf.Parent = mf;

local hcrn = Instance.new(_c[17]);
hcrn.CornerRadius = _c[12].new(0, 14);
hcrn.Parent = hf;

local tit = Instance.new(_c[22]);
tit.Size = _c[12].new(1, -50, 1, 0);
tit.Position = _c[12].new(0, 15, 0, 0);
tit.BackgroundTransparency = 1;
tit.Text = "BRUSK HUB  •  ULTRA SPEED";
tit.TextColor3 = _c[14].new(0, 245, 255);
tit.TextSize = 14;
tit.Font = Enum.Font.SourceSansBold;
tit.TextXAlignment = Enum.TextXAlignment.Left;
tit.Parent = hf;

local cb = Instance.new("TextButton");
cb.Size = _c[12].new(0, 28, 0, 28);
cb.Position = _c[12].new(1, -36, 0, 7);
cb.BackgroundColor3 = _c[14].new(255, 50, 100);
cb.Text = "✕";
cb.TextColor3 = _c[14].new(255, 255, 255);
cb.Font = Enum.Font.SourceSansBold;
cb.TextSize = 14;
cb.Parent = hf;

local ccrn = Instance.new(_c[17]);
ccrn.CornerRadius = _c[12].new(0, 8);
ccrn.Parent = cb;

cb.MouseButton1Click:Connect(function()
    mf.Visible = false;
end);

local cnt = Instance.new(_c[10]);
cnt.Size = _c[12].new(1, -24, 1, -56);
cnt.Position = _c[12].new(0, 12, 0, 50);
cnt.BackgroundTransparency = 1;
cnt.Parent = mf;

local lst = Instance.new("UIListLayout");
lst.Padding = _c[12].new(0, 8);
lst.Parent = cnt;

local function addBtn(tText, sText, col, cbk)
    local b = Instance.new("TextButton");
    b.Size = _c[12].new(1, 0, 0, 48);
    b.BackgroundColor3 = col;
    b.Text = "";
    b.Parent = cnt;
    local bcrn = Instance.new(_c[17]);
    bcrn.CornerRadius = _c[12].new(0, 10);
    bcrn.Parent = b;
    local bstr = Instance.new(_c[19]);
    bstr.Color = _c[14].new(0, 240, 255);
    bstr.Transparency = 0.4;
    bstr.Thickness = 1.5;
    bstr.Parent = b;
    local mt = Instance.new(_c[22]);
    mt.Size = _c[12].new(1, -20, 0, 22);
    mt.Position = _c[12].new(0, 12, 0, 6);
    mt.BackgroundTransparency = 1;
    mt.Text = tText;
    mt.TextColor3 = _c[14].new(255, 255, 255);
    mt.Font = Enum.Font.SourceSansBold;
    mt.TextSize = 14;
    mt.TextXAlignment = Enum.TextXAlignment.Left;
    mt.Parent = b;
    local st = Instance.new(_c[22]);
    st.Size = _c[12].new(1, -20, 0, 16);
    st.Position = _c[12].new(0, 12, 0, 25);
    st.BackgroundTransparency = 1;
    st.Text = sText;
    st.TextColor3 = _c[14].new(180, 210, 255);
    st.Font = Enum.Font.SourceSans;
    st.TextSize = 11;
    st.TextXAlignment = Enum.TextXAlignment.Left;
    st.Parent = b;
    b.MouseButton1Click:Connect(function()
        task.spawn(cbk);
    end);
end

addBtn("🔥 Miranda Hub", "سکرپتی خێرا بۆ دزینی هێلکەکان", _c[14].new(40, 25, 70), function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/main/stealaeggs"))();
    end);
end);

addBtn("🌶️ Chilli Hub", "سکرپتی خێرا بۆ Steal An Egg", _c[14].new(30, 45, 75), function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))();
    end);
end);

addBtn("🔒 Private Server Bypass", "پەڕینەوەی خێرا بۆ سێرڤەری تایبەتی", _c[14].new(20, 60, 60), function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-roblox/PrivateServerBypass/refs/heads/main/lua"))();
    end);
end);

addBtn("🗑️ Clear / Destroy GUI", "پاککردنەوەی تەواوی مەنیوکان", _c[14].new(40, 40, 50), function()
    SGui:Destroy();
end);

local tb = Instance.new("TextButton");
tb.Size = _c[12].new(0, 45, 0, 45);
tb.Position = _c[12].new(0, 15, 0, 85);
tb.BackgroundColor3 = _c[14].new(0, 200, 255);
tb.Text = "BRUSK";
tb.TextColor3 = _c[14].new(255, 255, 255);
tb.Font = Enum.Font.SourceSansBold;
tb.TextSize = 11;
tb.Active = true;
tb.Draggable = true;
tb.Visible = true;
tb.Parent = SGui;

local tcrn = Instance.new(_c[17]);
tcrn.CornerRadius = _c[12].new(1, 0);
tcrn.Parent = tb;

local tstr = Instance.new(_c[19]);
tstr.Color = _c[14].new(255, 255, 255);
tstr.Thickness = 2;
tstr.Parent = tb;

tb.MouseButton1Click:Connect(function()
    mf.Visible = not mf.Visible;
end);
