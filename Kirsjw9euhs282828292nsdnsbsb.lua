-- old script (still works doesnt lag but forces server shutdown) Execute Atleast 5-4 times for faster SwitchTeams 
-- W vorbescu (also takes like 20-40 secs to shutdown server its based on executions if execute more than faster lol)
-- importanttttt!!!! KEEP EXECUTING ATLEAST 20 TIMES FOR FASTER SHUTDOWN
_G.FastMaybe = true
while task.wait() do
    if _G.FastMaybe == true then
        task.spawn(
            function()
                teams = game:GetService("Teams")
                for _, team in ipairs(
                    {
                        teams.black,
                        teams.blue,
                        teams.green,
                        teams.magenta,
                        teams.red,
                        teams.white,
                        teams.yellow
                    }
                ) do
                    workspace.ChangeTeam:FireServer(team)
                end
            end
        )
    else
        teams = game:GetService("Teams")
        for _, team in ipairs(
            {
                teams.black,
                teams.blue,
                teams.green,
                teams.magenta,
                teams.red,
                teams.white,
                teams.yellow
            }
        ) do
            workspace.ChangeTeam:FireServer(team)
        end
    end
end
