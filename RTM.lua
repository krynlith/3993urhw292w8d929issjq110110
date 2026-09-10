-- this noobs all players that respawn so op lollington
-- execute 20 times brodingaling
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local r3Remote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("R3")

RunService.Heartbeat:Connect(function()
    for i = 1, 50 do
        r3Remote:FireServer()
    end
end)
