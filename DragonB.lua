spawn(function()
    while wait() do  
    pcall(function()
        if game:GetService("Players").LocalPlayer.Character then 
                if  game.Players.LocalPlayer.Character.Config.AttackCooldown.Value == true then 
                    game.Players.LocalPlayer.Character.Config.AttackCooldown.Value = false 
                elseif game.Players.LocalPlayer.Character.Config.CAttackCooldown.Value == true then
                    game.Players.LocalPlayer.Character.Config.CAttackCooldown.Value = false
                elseif game.Players.LocalPlayer.Character.Config.Stunned.Value == true then 
                    game.Players.LocalPlayer.Character.Config.Stunned.Value = false
                elseif  game.Players.LocalPlayer.Character.CanRecover.Value == false then 
                    game.Players.LocalPlayer.Character.CanRecover.Value = true
                end 
            end 
        end)
    end
 end)
 while wait() do
     pcall(function()
         local NpcShadow = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Shadow Image")
         if NpcShadow and  game:GetService("Players").LocalPlayer.Character and game.Players.LocalPlayer.Character.Config.Resting.Value == false  then 
             game.Players.LocalPlayer.Character.Config.Resting.Value = true
         elseif NpcShadow == nil then 
             game.Players.LocalPlayer.Character.Config.Resting.Value = false 
         end 
         if NpcShadow and game:GetService("Players").LocalPlayer.Character then 
             local args = {[1] = "SecretCode"}
             game:GetService("Players").LocalPlayer.Character.Client.Events.LightAttack:FireServer(unpack(args))
             local perHrp = NpcShadow.HumanoidRootPart.CFrame * CFrame.new(0,0,1)
             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = perHrp
             if game.Players.LocalPlayer.Character.Config.Flying.Value == true then 
                game.Players.LocalPlayer.Character.Config.Flying.Value = false 
             end
             game:GetService("Players").LocalPlayer.Character.Client.Events:FindFirstChild("Zenkai Vanish"):FireServer()
         end 
     end)
 end 