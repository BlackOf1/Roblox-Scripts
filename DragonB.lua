local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
game.Workspace.FallenPartsDestroyHeight = -5000000000000
spawn(function()
    while wait() do  
        pcall(function()
            if game:GetService("Players").LocalPlayer.Character and _G.NpcShadow then 
                if  game.Players.LocalPlayer.Character.Config.AttackCooldown.Value == true then 
                    game.Players.LocalPlayer.Character.Config.AttackCooldown.Value = false 
                elseif game.Players.LocalPlayer.Character.Config.CAttackCooldown.Value == true then
                    game.Players.LocalPlayer.Character.Config.CAttackCooldown.Value = false
                elseif game.Players.LocalPlayer.Character.Config.Stunned.Value == true then 
                    game.Players.LocalPlayer.Character.Config.Stunned.Value = false
                elseif  game.Players.LocalPlayer.Character.Config.CanRecover.Value == false then 
                    game.Players.LocalPlayer.Character.Config.CanRecover.Value = true
                elseif game.Players.LocalPlayer.Character.Config.Flying.Value == true then 
                    game.Players.LocalPlayer.Character.Config.Flying.Value = false 
                elseif game.Players.LocalPlayer.Character.Config.CanBlock.Value == false then 
                    game.Players.LocalPlayer.Character.Config.CanBlock.Value = true 
                end
            end 
        end)
    end
 end)
 spawn(function()
    while wait() do 
        pcall(function()
            if game:GetService("Players").LocalPlayer.Character and _G.NpcShadow then 
                game:GetService("Players").LocalPlayer.Character.Client.Events.Block:InvokeServer()
                wait(2.75)
                game:GetService("Players").LocalPlayer.Character.Client.Events.StopBlocking:InvokeServer()
                wait(5)
            end 
        end)
    end 
 end)
 while wait() do
     pcall(function()
         _G.NpcShadow = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Shadow Image")
         if game.Players.LocalPlayer.Character and _G.NpcShadow == nil then
            game:GetService("Players").LocalPlayer.Character.Client.Events:FindFirstChild("Shadow Spar"):FireServer()
            wait(1)
            _G.NpcShadow = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Shadow Image")
        end 
         if _G.NpcShadow and  game:GetService("Players").LocalPlayer.Character and game.Players.LocalPlayer.Character.Config.Resting.Value == false  then 
             game.Players.LocalPlayer.Character.Config.Resting.Value = true
            --game:GetService("Players").LocalPlayer.Character.Client.Events.Rest:FireServer()
         elseif _G.NpcShadow == nil then 
             game.Players.LocalPlayer.Character.Config.Resting.Value = false 
             --game:GetService("Players").LocalPlayer.Character.Client.Events.Rest:FireServer()
         end 
         if _G.NpcShadow and game:GetService("Players").LocalPlayer.Character then 
             local args = {[1] = "SecretCode"}
             game:GetService("Players").LocalPlayer.Character.Client.Events.LightAttack:FireServer(unpack(args))
             local Look = CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,_G.NpcShadow.HumanoidRootPart.Position)
             local perHrp = _G.NpcShadow.HumanoidRootPart.CFrame * CFrame.new(0,0,-1)
             local x, y, z, r00, r01, r02, r10, r11, r12, r20, r21, r22 = Look:components()
             local x1, y1, z1, r001, r011, r021, r101, r111, r121, r201, r211, r221 = perHrp:components()
             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x1,y2,z1,r00, r01, r02, r10, r11, r12, r20, r21, r22)
         end 
     end)
 end 