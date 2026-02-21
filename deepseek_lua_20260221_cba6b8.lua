--[[
    ██████╗  █████╗ ███╗   ██╗ █████╗ ███╗   ██╗ █████╗     ██╗  ██╗██╗   ██╗██████╗ 
    ██╔══██╗██╔══██╗████╗  ██║██╔══██╗████╗  ██║██╔══██╗    ██║  ██║██║   ██║██╔══██╗
    ██████╔╝███████║██╔██╗ ██║███████║██╔██╗ ██║███████║    ███████║██║   ██║██████╔╝
    ██╔══██╗██╔══██║██║╚██╗██║██╔══██║██║╚██╗██║██╔══██║    ██╔══██║██║   ██║██╔══██╗
    ██████╔╝██║  ██║██║ ╚████║██║  ██║██║ ╚████║██║  ██║    ██║  ██║╚██████╔╝██████╔╝
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
    
    ███████╗██████╗ ██╗████████╗██╗ ██████╗ ███╗   ██╗
    ██╔════╝██╔══██╗██║╚══██╔══╝██║██╔═══██╗████╗  ██║
    █████╗  ██████╔╝██║   ██║   ██║██║   ██║██╔██╗ ██║
    ██╔══╝  ██╔══██╗██║   ██║   ██║██║   ██║██║╚██╗██║
    ██║     ██║  ██║██║   ██║   ██║╚██████╔╝██║ ╚████║
    ╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
]]

-- ==================================================
-- BANANA HUB STYLE - BLOX FRUIT SCRIPT
-- Author: Zo - Dành riêng cho Alpha
-- Version: 3.5 (Banana Hub Edition)
-- ==================================================

-- Thông báo khởi động
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🍌 BANANA HUB - ALPHA EDITION 🍌",
    Text = "Đang tải script...",
    Duration = 3,
    Icon = "rbxassetid://1234567890"
})

wait(1.5)

-- ==================================================
-- SERVICES
-- ==================================================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- ==================================================
-- LIBRARY UI (Giống Banana Hub)
-- ==================================================

local Library = {}
Library.Flags = {}
Library.Toggles = {}

function Library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BananaHub_" .. HttpService:GenerateGUID(false)
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    -- Gradient
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))
    })
    Gradient.Rotation = 90
    Gradient.Parent = MainFrame
    
    -- Corner
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TitleBar.BackgroundTransparency = 0.3
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 8)
    TitleCorner.Parent = TitleBar
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -40, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "🍌 " .. title .. " 🍌"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.Parent = TitleBar
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 2.5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.BackgroundTransparency = 0.3
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 18
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = TitleBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Tab Buttons
    local TabFrame = Instance.new("Frame")
    TabFrame.Size = UDim2.new(1, 0, 0, 40)
    TabFrame.Position = UDim2.new(0, 0, 0, 35)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Parent = MainFrame
    
    local TabButtons = {}
    local Tabs = {}
    
    function Library:AddTab(name)
        local tabId = #TabButtons + 1
        
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(0, 100, 0, 30)
        TabButton.Position = UDim2.new(0, (tabId-1) * 105 + 10, 0, 5)
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.BorderSizePixel = 0
        TabButton.Parent = TabFrame
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = TabButton
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Size = UDim2.new(1, -20, 1, -90)
        TabContent.Position = UDim2.new(0, 10, 0, 80)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 5
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.Parent = MainFrame
        TabContent.Visible = false
        
        table.insert(TabButtons, TabButton)
        table.insert(Tabs, TabContent)
        
        TabButton.MouseButton1Click:Connect(function()
            for i, btn in ipairs(TabButtons) do
                btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                btn.TextColor3 = Color3.fromRGB(200, 200, 200)
                Tabs[i].Visible = false
            end
            TabButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
            TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TabContent.Visible = true
        end)
        
        if tabId == 1 then
            TabButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
            TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TabContent.Visible = true
        end
        
        local tab = {}
        
        function tab:AddSection(sectionName)
            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Size = UDim2.new(1, -10, 0, 25)
            SectionLabel.Position = UDim2.new(0, 5, 0, #TabContent:GetChildren() * 30)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Text = "▶ " .. sectionName
            SectionLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.TextSize = 16
            SectionLabel.Parent = TabContent
            
            TabContent.CanvasSize = UDim2.new(0, 0, 0, #TabContent:GetChildren() * 30 + 50)
        end
        
        function tab:AddToggle(option, default, callback)
            local toggleId = #TabContent:GetChildren() + 1
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, -10, 0, 35)
            ToggleFrame.Position = UDim2.new(0, 5, 0, (toggleId-1) * 40)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ToggleFrame.BackgroundTransparency = 0.3
            ToggleFrame.Parent = TabContent
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 6)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(1, -50, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = option
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.TextSize = 14
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 30, 0, 30)
            ToggleButton.Position = UDim2.new(1, -40, 0, 2.5)
            ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            ToggleButton.Text = ""
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Parent = ToggleFrame
            
            local ToggleCorner2 = Instance.new("UICorner")
            ToggleCorner2.CornerRadius = UDim.new(0, 15)
            ToggleCorner2.Parent = ToggleButton
            
            local ToggleState = default or false
            Library.Toggles[option] = ToggleState
            
            ToggleButton.MouseButton1Click:Connect(function()
                ToggleState = not ToggleState
                ToggleButton.BackgroundColor3 = ToggleState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                Library.Toggles[option] = ToggleState
                if callback then
                    callback(ToggleState)
                end
            end)
            
            TabContent.CanvasSize = UDim2.new(0, 0, 0, #TabContent:GetChildren() * 40 + 50)
        end
        
        function tab:AddButton(buttonName, callback)
            local btnId = #TabContent:GetChildren() + 1
            
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -20, 0, 35)
            Button.Position = UDim2.new(0, 10, 0, (btnId-1) * 40)
            Button.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
            Button.Text = buttonName
            Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button.TextSize = 14
            Button.Font = Enum.Font.GothamBold
            Button.BorderSizePixel = 0
            Button.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
                if callback then
                    callback()
                end
            end)
            
            TabContent.CanvasSize = UDim2.new(0, 0, 0, #TabContent:GetChildren() * 40 + 50)
        end
        
        function tab:AddSlider(sliderName, min, max, default, callback)
            local sliderId = #TabContent:GetChildren() + 1
            
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Size = UDim2.new(1, -10, 0, 50)
            SliderFrame.Position = UDim2.new(0, 5, 0, (sliderId-1) * 55)
            SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderFrame.BackgroundTransparency = 0.3
            SliderFrame.Parent = TabContent
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 6)
            SliderCorner.Parent = SliderFrame
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Size = UDim2.new(1, -20, 0, 20)
            SliderLabel.Position = UDim2.new(0, 10, 0, 5)
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Text = sliderName .. ": " .. default
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.TextSize = 14
            SliderLabel.Parent = SliderFrame
            
            local SliderBg = Instance.new("Frame")
            SliderBg.Size = UDim2.new(1, -20, 0, 10)
            SliderBg.Position = UDim2.new(0, 10, 0, 30)
            SliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SliderBg.Parent = SliderFrame
            
            local SliderCorner2 = Instance.new("UICorner")
            SliderCorner2.CornerRadius = UDim.new(0, 5)
            SliderCorner2.Parent = SliderBg
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
            SliderFill.Parent = SliderBg
            
            local SliderCorner3 = Instance.new("UICorner")
            SliderCorner3.CornerRadius = UDim.new(0, 5)
            SliderCorner3.Parent = SliderFill
            
            local SliderValue = default
            
            SliderFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local mousePos = UserInputService:GetMouseLocation()
                        local absPos = SliderBg.AbsolutePosition
                        local absSize = SliderBg.AbsoluteSize
                        
                        local percent = math.clamp((mousePos.X - absPos.X) / absSize.X, 0, 1)
                        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                        
                        SliderValue = math.floor(min + (max - min) * percent)
                        SliderLabel.Text = sliderName .. ": " .. SliderValue
                        
                        if callback then
                            callback(SliderValue)
                        end
                        
                        RunService.RenderStepped:Wait()
                    end
                end
            end)
            
            TabContent.CanvasSize = UDim2.new(0, 0, 0, #TabContent:GetChildren() * 55 + 50)
        end
        
        function tab:AddDropdown(dropdownName, options, callback)
            local dropdownId = #TabContent:GetChildren() + 1
            
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Size = UDim2.new(1, -10, 0, 35)
            DropdownFrame.Position = UDim2.new(0, 5, 0, (dropdownId-1) * 40)
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            DropdownFrame.BackgroundTransparency = 0.3
            DropdownFrame.Parent = TabContent
            
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 6)
            DropdownCorner.Parent = DropdownFrame
            
            local DropdownLabel = Instance.new("TextLabel")
            DropdownLabel.Size = UDim2.new(1, -30, 1, 0)
            DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
            DropdownLabel.BackgroundTransparency = 1
            DropdownLabel.Text = dropdownName .. ": " .. options[1]
            DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            DropdownLabel.Font = Enum.Font.Gotham
            DropdownLabel.TextSize = 14
            DropdownLabel.Parent = DropdownFrame
            
            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Size = UDim2.new(0, 20, 0, 20)
            DropdownButton.Position = UDim2.new(1, -30, 0, 7.5)
            DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
            DropdownButton.Text = "▼"
            DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownButton.TextSize = 12
            DropdownButton.Font = Enum.Font.GothamBold
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Parent = DropdownFrame
            
            local DropdownCorner2 = Instance.new("UICorner")
            DropdownCorner2.CornerRadius = UDim.new(0, 4)
            DropdownCorner2.Parent = DropdownButton
            
            local DropdownList = Instance.new("ScrollingFrame")
            DropdownList.Size = UDim2.new(1, -20, 0, 100)
            DropdownList.Position = UDim2.new(0, 10, 0, 40)
            DropdownList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            DropdownList.BackgroundTransparency = 0.1
            DropdownList.Visible = false
            DropdownList.ZIndex = 10
            DropdownList.Parent = DropdownFrame
            
            local ListCorner = Instance.new("UICorner")
            ListCorner.CornerRadius = UDim.new(0, 6)
            ListCorner.Parent = DropdownList
            
            for i, option in ipairs(options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Size = UDim2.new(1, 0, 0, 25)
                OptionButton.Position = UDim2.new(0, 0, 0, (i-1) * 25)
                OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                OptionButton.Text = option
                OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                OptionButton.TextSize = 12
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.BorderSizePixel = 0
                OptionButton.Parent = DropdownList
                OptionButton.ZIndex = 10
                
                OptionButton.MouseButton1Click:Connect(function()
                    DropdownLabel.Text = dropdownName .. ": " .. option
                    DropdownList.Visible = false
                    if callback then
                        callback(option)
                    end
                end)
            end
            
            DropdownList.CanvasSize = UDim2.new(0, 0, 0, #options * 25)
            
            DropdownButton.MouseButton1Click:Connect(function()
                DropdownList.Visible = not DropdownList.Visible
            end)
            
            TabContent.CanvasSize = UDim2.new(0, 0, 0, #TabContent:GetChildren() * 40 + 50)
        end
        
        return tab
    end
    
    return Library
end

-- ==================================================
-- CREATE UI (GIỐNG BANANA HUB)
-- ==================================================

local Window = Library:CreateWindow("BANANA HUB - ALPHA EDITION")

-- ==================================================
-- AUTO FARM TAB
-- ==================================================

local FarmTab = Window:AddTab("⚔️ Auto Farm")

FarmTab:AddSection("Farm Settings")

FarmTab:AddToggle("Auto Farm", true, function(state)
    Library.Toggles["Auto Farm"] = state
end)

FarmTab:AddToggle("Auto Quest", true, function(state)
    Library.Toggles["Auto Quest"] = state
end)

FarmTab:AddToggle("Bring Mobs", true, function(state)
    Library.Toggles["Bring Mobs"] = state
end)

FarmTab:AddToggle("Auto Haki", true, function(state)
    Library.Toggles["Auto Haki"] = state
end)

FarmTab:AddSlider("Farm Speed", 1, 10, 5, function(value)
    Library.Flags["Farm Speed"] = value
end)

FarmTab:AddDropdown("Select Island", ["Jungle", "Desert", "Snow", "Marine", "Sky"], function(option)
    Library.Flags["Selected Island"] = option
end)

FarmTab:AddButton("Start Farming", function()
    Notify("Banana Hub", "Bắt đầu Auto Farm!", 2)
end)

-- ==================================================
-- DEVIL FRUIT TAB
-- ==================================================

local FruitTab = Window:AddTab("🍎 Devil Fruit")

FruitTab:AddSection("Fruit Settings")

FruitTab:AddToggle("Auto Store Fruit", true, function(state)
    Library.Toggles["Auto Store Fruit"] = state
end)

FruitTab:AddToggle("Auto Eat Fruit", false, function(state)
    Library.Toggles["Auto Eat Fruit"] = state
end)

FruitTab:AddToggle("Fruit Sniper", true, function(state)
    Library.Toggles["Fruit Sniper"] = state
end)

FruitTab:AddDropdown("Target Fruit", {"Dragon", "Leopard", "Venom", "Dough", "Spirit"}, function(option)
    Library.Flags["Target Fruit"] = option
end)

FruitTab:AddButton("Find Fruit", function()
    Notify("Banana Hub", "Đang tìm fruit...", 2)
end)

-- ==================================================
-- RAID TAB
-- ==================================================

local RaidTab = Window:AddTab("⚡ Raids")

RaidTab:AddSection("Raid Settings")

RaidTab:AddToggle("Auto Raid", true, function(state)
    Library.Toggles["Auto Raid"] = state
end)

RaidTab:AddToggle("Auto Awakening", true, function(state)
    Library.Toggles["Auto Awakening"] = state
end)

RaidTab:AddSlider("Raid Count", 1, 20, 10, function(value)
    Library.Flags["Raid Count"] = value
end)

RaidTab:AddButton("Start Raid", function()
    Notify("Banana Hub", "Bắt đầu Auto Raid!", 2)
end)

-- ==================================================
-- MISC TAB
-- ==================================================

local MiscTab = Window:AddTab("🎮 Misc")

MiscTab:AddSection("Misc Settings")

MiscTab:AddToggle("ESP (Wallhack)", true, function(state)
    Library.Toggles["ESP"] = state
end)

MiscTab:AddToggle("Auto Sea Event", true, function(state)
    Library.Toggles["Auto Sea Event"] = state
end)

MiscTab:AddToggle("Anti AFK", true, function(state)
    Library.Toggles["Anti AFK"] = state
end)

MiscTab:AddToggle("FPS Boost", true, function(state)
    Library.Toggles["FPS Boost"] = state
end)

MiscTab:AddSlider("Walk Speed", 16, 250, 100, function(value)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

MiscTab:AddSlider("Jump Power", 50, 250, 100, function(value)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = value
    end
end)

-- ==================================================
-- STATS TAB
-- ==================================================

local StatsTab = Window:AddTab("📊 Stats")

StatsTab:AddSection("Player Stats")

StatsTab:AddButton("Refresh Stats", function()
    -- Cập nhật stats
end)

local function UpdateStats()
    -- Tạo label stats
end

-- ==================================================
-- ANTI AFK
-- ==================================================

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- ==================================================
-- NOTIFICATION FUNCTION
-- ==================================================

function Notify(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = "🍌 " .. title,
        Text = text,
        Duration = duration or 3,
        Icon = "rbxassetid://1234567890"
    })
end

-- ==================================================
-- MAIN LOOP
-- ==================================================

Notify("Banana Hub", "Đã tải thành công!", 3)

spawn(function()
    while wait(0.1) do
        if Library.Toggles["Anti AFK"] then
            -- Chống AFK
        end
        
        if Library.Toggles["Auto Farm"] then
            -- Auto farm code here
        end
        
        if Library.Toggles["Auto Raid"] then
            -- Auto raid code here
        end
        
        if Library.Toggles["FPS Boost"] then
            -- Tối ưu FPS
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 1e10
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end
        
        if Library.Toggles["ESP"] then
            -- ESP code here
        end
    end
end)

-- ==================================================
-- CREDITS
-- ==================================================

print([[
    ========================================
    🍌 BANANA HUB - ALPHA EDITION 🍌
    Author: Zo - Dành riêng cho Alpha
    Version: 3.5
    Discord: https://discord.gg/bananahub
    ========================================
]])

Notify("Banana Hub", "Chúc Alpha chơi game vui vẻ! 🔥", 5)