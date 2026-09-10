-- Nightmare Troll Slap Tower👻 Hax opensource by vorbescu super easy
-- enjoy skiddies
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "VorbescuGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.fromScale(0.32, 0.32)
frame.Position = UDim2.fromScale(0.34, 0.35)
frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
frame.BorderSizePixel = 1

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.fromScale(1,0.22)
title.BackgroundTransparency = 1
title.Text = "VorbescuHax V1"
title.TextColor3 = Color3.fromRGB(0,0,0)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

local freeze = Instance.new("TextButton")
freeze.Parent = frame
freeze.Size = UDim2.fromScale(0.42,0.22)
freeze.Position = UDim2.fromScale(0.06,0.32)
freeze.BackgroundColor3 = Color3.fromRGB(255,255,255)
freeze.BorderSizePixel = 1
freeze.Text = "FREEZE ALL"
freeze.TextColor3 = Color3.fromRGB(0,0,0)
freeze.Font = Enum.Font.SourceSans
freeze.TextScaled = true

local explode = Instance.new("TextButton")
explode.Parent = frame
explode.Size = UDim2.fromScale(0.42,0.22)
explode.Position = UDim2.fromScale(0.52,0.32)
explode.BackgroundColor3 = Color3.fromRGB(255,255,255)
explode.BorderSizePixel = 1
explode.Text = "EXPLODE ALL"
explode.TextColor3 = Color3.fromRGB(0,0,0)
explode.Font = Enum.Font.SourceSans
explode.TextScaled = true

local trip = Instance.new("TextButton")
trip.Parent = frame
trip.Size = UDim2.fromScale(0.42,0.22)
trip.Position = UDim2.fromScale(0.06,0.60)
trip.BackgroundColor3 = Color3.fromRGB(255,255,255)
trip.BorderSizePixel = 1
trip.Text = "TRIP ALL"
trip.TextColor3 = Color3.fromRGB(0,0,0)
trip.Font = Enum.Font.SourceSans
trip.TextScaled = true

local lag = Instance.new("TextButton")
lag.Parent = frame
lag.Size = UDim2.fromScale(0.42,0.22)
lag.Position = UDim2.fromScale(0.52,0.60)
lag.BackgroundColor3 = Color3.fromRGB(255,255,255)
lag.BorderSizePixel = 1
lag.Text = "LAG SERVER"
lag.TextColor3 = Color3.fromRGB(0,0,0)
lag.Font = Enum.Font.SourceSans
lag.TextScaled = true

freeze.MouseButton1Click:Connect(function()
    ReplicatedStorage:WaitForChild("FreezeAllEvent"):FireServer()
end)

explode.MouseButton1Click:Connect(function()
    ReplicatedStorage:WaitForChild("ExplodeAllEvent"):FireServer()
end)

trip.MouseButton1Click:Connect(function()
    ReplicatedStorage:WaitForChild("TripAllEvent"):FireServer()
end)

lag.MouseButton1Click:Connect(function()
    while true do
    task.wait()
    game:GetService("ReplicatedStorage").ExplodeAllEvent:FireServer()
end
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
