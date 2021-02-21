local StarterGui = game:GetService("StarterGui")
local Mob = {Humans = "Human",Ghouls = "Ghoul",CCG = "CCG"}
local KeyTabe = {[1] = "One", [2] = "Two", [3] = "Three", [4] = "Four"}
local Mob  = nil
local On = false 
local Stage = 1
local Tween = game:GetService("TweenService")

function GoTo(Where,Vol)
    repeat
        wait()
    until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil
    local Distance = (Where.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude
    local Hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local Time = (Distance/Vol)
    local goal = {}
    goal.CFrame = Where.CFrame
    local tweenInfo = TweenInfo.new(
    	Time,
    	Enum.EasingStyle.Sine,
    	Enum.EasingDirection.Out,
    	0, 
    	false, 
    	0
    )
    return Tween:Create(Hrp , tweenInfo, goal), Time
end 

function FireRemote(arg)
    pcall(function()
        if arg == "Speical1" then 
            local args1 = {
                [1] = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146" ..
                    "\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140",
                [2] = "E",
                [3] = "Down",
                [4] = CFrame.new(Vector3.new(-762.00109863281, 69.85383605957, -613.72406005859), Vector3.new(-0.96342146396637, 0.055975794792175, 0.26207992434502)),
                [6] = CFrame.new(Vector3.new(-734.39886474609, 68.25, -621.23364257813), Vector3.new(-0.97677379846573, -0.20000027120113, 0.076894633471966))
            }
            local args2 = {
                [1] = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146" ..
                    "\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140",
                [2] = "E",
                [3] = "Up",
                [4] = CFrame.new(Vector3.new(-746.41101074219, 61, -542.36102294922), Vector3.new(-0.073057174682617, -0.082235097885132, 0.99393159151077)),
                [6] = CFrame.new(Vector3.new(-740.04229736328, 68.167663574219, -628.98681640625), Vector3.new(-0.59045016765594, -0.19341339170933, 0.78355592489243))
            }

                game:GetService("Players").LocalPlayer.Character.Remotes.KeyEvent:FireServer(unpack(args1))
                game:GetService("Players").LocalPlayer.Character.Remotes.KeyEvent:FireServer(unpack(args2))
        elseif arg == "M1" then
            local args1 = {
                [1] = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146" ..
                    "\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140",
                [2] = "Mouse1",
                [3] = "Down",
                [4] = CFrame.new(Vector3.new(-773.92742919922, 70.635551452637, -541.47351074219), Vector3.new(-0.36096861958504, 0.026291381567717, 0.93220728635788)),
                [6] = CFrame.new(Vector3.new(-740.04229736328, 68.167663574219, -628.98681640625), Vector3.new(-0.59045016765594, -0.19341339170933, 0.78355592489243))
            }
            local args2 = {
                [1] = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146" ..
                    "\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140",
                [2] = "Mouse1",
                [3] = "Up",
                [4] = CFrame.new(Vector3.new(-773.92742919922, 70.635551452637, -541.47351074219), Vector3.new(-0.36096861958504, 0.026291381567717, 0.93220728635788)),
                [6] = CFrame.new(Vector3.new(-740.04229736328, 68.167663574219, -628.98681640625), Vector3.new(-0.59045016765594, -0.19341339170933, 0.78355592489243))
            }
            game:GetService("Players").LocalPlayer.Character.Remotes.KeyEvent:FireServer(unpack(args1))
            game:GetService("Players").LocalPlayer.Character.Remotes.KeyEvent:FireServer(unpack(args2))
        end 
    end)
end

function Rquip(Faction)
    if Faction == "Ghoul" and game:GetService("Players").LocalPlayer.Character ~= nil then 
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kagune") == nil then 
            local args = {
                [1] = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146" ..
                    "\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140",
                [2] = KeyTabe[Stage],
                [3] = "Down",
                [4] = CFrame.new(Vector3.new(-752.63427734375, 64.382080078125, -593.32513427734), Vector3.new(-0.30480656027794, -0.10630693286657, 0.94646281003952)),
                [6] = CFrame.new(Vector3.new(-736.49285888672, 70.012092590332, -643.4482421875), Vector3.new(-0.5331181883812, -0.25882199406624, 0.80547887086868))
            }
            game:GetService("Players").LocalPlayer.Character.Remotes.KeyEvent:FireServer(unpack(args))
        end
    elseif Faction == "CCG" and game:GetService("Players").LocalPlayer.Character ~= nil then    
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quinque") == nil then 
            local args = {
                [1] = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146" ..
                    "\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140",
                [2] = KeyTabe[Stage],
                [3] = "Down",
                [4] = CFrame.new(Vector3.new(-752.63427734375, 64.382080078125, -593.32513427734), Vector3.new(-0.30480656027794, -0.10630693286657, 0.94646281003952)),
                [6] = CFrame.new(Vector3.new(-736.49285888672, 70.012092590332, -643.4482421875), Vector3.new(-0.5331181883812, -0.25882199406624, 0.80547887086868))
            }
            game:GetService("Players").LocalPlayer.Character.Remotes.KeyEvent:FireServer(unpack(args))

        end
    end 
end

function Notification(Msg)
    StarterGui:SetCore("SendNotification", {
        Title = "Synapse-Notification",
        Text = tostring(Msg),
        Duration = 4,
    })
end 

function DestroyThingz()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do 
        if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Accessory") then 
            v:Destroy()
        elseif v:IsA("Part") then 
            v.CanCollide = false 
        end
    end 
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Head"):FindFirstChild("PlayerStatus"):Destroy()
end 
StarterGui:SetCore("SendNotification", {
	Title = "Synapse-Notification",
	Text = "Ro-Ghoul Gui Starting",
	Duration = 4,
})
wait(4.5)

local Ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()


local AutoFarmCate = Ui:CreateTab("Auto-Farm")
AutoFarmCate:CreateToggle("Enabled Auto Farm", function(arg)
    if arg == true and Mob and Stage then 
        On = true 
        if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerFolder") and On == true then 
            wait(.1)
            local Faction = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerFolder").Customization.Team.Value
            if  game:GetService("Players").LocalPlayer.Character ~= nil and On == true  then 
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shirt") then 
                    DestroyThingz()
                end 
            end
            while On == true do  
                for i,v in pairs(game:GetService("Workspace").NPCSpawns:GetChildren()) do  
                    if v:FindFirstChildOfClass("Model") and On == true then 
                        local PotentialTarget = v:FindFirstChildOfClass("Model") 
                        if  Mob == "Humans" and On == true  then 
                            if PotentialTarget.Name == "Human" or PotentialTarget.Name == "Athlete" and game:GetService("Players").LocalPlayer.Character ~= nil  then 
                                Rquip(Faction)
                                local Target = PotentialTarget 
                                pcall(function()
                                local Play,Time = GoTo(Target:FindFirstChild("HumanoidRootPart"),150)
                                local Math = Time/3.5
                                Play:Play()
                                wait(Time-Math)
                                Play:Cancel()
                                end)
                                repeat
                                    wait()
                                    if Target:FindFirstChild("HumanoidRootPart") ~= nil and On == true  then 
                                        pcall(function()
                                            Rquip(Faction)
                                            nmyhrp = Target:FindFirstChild("HumanoidRootPart").CFrame
                                        end)
                                        if game:GetService("Players").LocalPlayer.Character ~= nil and Target ~= nil and nmyhrp and On == true  then 
                                            if game:GetService("Players").LocalPlayer.Character ~= nil and Target ~= nil and nmyhrp and On == true  then 
                                                pcall(function()
                                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = nmyhrp * CFrame.new(0,0,2.8)
                                                end)
                                                FireRemote("M1")
                                                FireRemote("Speical1")
                                            else 
                                               break 
                                            end 
                                        else
                                            repeat
                                                wait(1.5)
                                                if game:GetService("Players").LocalPlayer.Character ~= nil and nmyhrp and On == true  then
                                                    break 
                                                end 
                                                if  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and On == true  then 
                                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shirt") then 
                                                        DestroyThingz()
                                                    end 
                                                    
                                                end
                                                if game:GetService("Players").LocalPlayer.Character and On == true  then 
                                                     break 
                                                end     
                                            until game:GetService("Players").LocalPlayer.Character ~= nil and On == true 
                                        end
                                    else 
                                        Notification("Something Happened")
                                        break
                                    end 
                                until Target == nil and On == true 
                                wait(.5)
                                local OldName = v.Name 
                                pcall(function()   
                                    local Target = v:FindFirstChildOfClass("Model"):FindFirstChildOfClass("Model")
                                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Target:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,1)
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                end)
                                wait(1.75)
                            end 
                        elseif Mob == "Ghouls" and On == true  then 
                            if v.Name == "AggroSpawns" or v.Name == "GhoulSpawns" and game:GetService("Players").LocalPlayer.Character ~= nil then 
                                if string.match(PotentialTarget.Name,"Aogiri") then
                                    Rquip(Faction)
                                    local Target = PotentialTarget 
                                    pcall(function()
                                        local Play,Time = GoTo(Target:FindFirstChild("HumanoidRootPart"),150)
                                        local Math = Time/3.5
                                        Play:Play()
                                        wait(Time-Math)
                                        Play:Cancel()
                                        end)
                                    repeat
                                        wait()
                                        if Target:FindFirstChild("HumanoidRootPart") ~= nil and On == true  then 
                                            local nmyhrp = nil
                                            pcall(function()
                                                Rquip(Faction)
                                                nmyhrp = Target:FindFirstChild("HumanoidRootPart").CFrame
                                            end)
                                            if game:GetService("Players").LocalPlayer.Character ~= nil and Target ~= nil and nmyhrp and On == true  then 
                                                if game:GetService("Players").LocalPlayer.Character ~= nil and Target ~= nil and nmyhrp and On == true  then 
                                                    pcall(function()
                                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = nmyhrp * CFrame.new(0,0,3)
                                                    end)
                                                    FireRemote("M1")
                                                    FireRemote("Speical1")
                                                else 
                                                   break 
                                                end 
                                            else
                                                repeat
                                                    wait(1.5)
                                                    if game:GetService("Players").LocalPlayer.Character ~= nil and nmyhrp and On == true  then
                                                        break 
                                                    end 
                                                    if  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and On == true  then 
                                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shirt") then 
                                                            DestroyThingz()
                                                        end 
                                                        
                                                    end
                                                    if game:GetService("Players").LocalPlayer.Character and On == true  then 
                                                         break 
                                                    end     
                                                until game:GetService("Players").LocalPlayer.Character ~= nil and On == true 
                                            end
                                        else 
                                            Notification("Something Happened")
                                            break
                                        end 
                                    until Target == nil and On == true 
                                    wait(.5)
                                    local OldName = v.Name 
                                    pcall(function()   
                                        local Target = v:FindFirstChildOfClass("Model"):FindFirstChildOfClass("Model")
                                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Target:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,1)
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector")) 
                                    end)
                                    wait(1.75)
                                end 
                            end 
                        elseif Mob == "CCG" and On == true then
                            if v.Name == "AggroSpawns" or v.Name == "CCGSpawns" and game:GetService("Players").LocalPlayer.Character ~= nil then 
                                if string.match(PotentialTarget.Name,"Investigator") then
                                    Rquip(Faction)
                                    local Target = PotentialTarget 
                                    pcall(function()
                                        local Play,Time = GoTo(Target:FindFirstChild("HumanoidRootPart"),150)
                                        local Math = Time/3.5
                                        Play:Play()
                                        wait(Time-Math)
                                        Play:Cancel()
                                        end)
                                    repeat
                                        wait()
                                        if Target:FindFirstChild("HumanoidRootPart") ~= nil and On == true  then 
                                            local nmyhrp = nil
                                            pcall(function()
                                                Rquip(Faction)
                                                nmyhrp = Target:FindFirstChild("HumanoidRootPart").CFrame
                                            end)
                                            if game:GetService("Players").LocalPlayer.Character ~= nil and Target ~= nil and nmyhrp and On == true  then 
                                                if game:GetService("Players").LocalPlayer.Character ~= nil and Target ~= nil and nmyhrp and On == true  then 
                                                    pcall(function()
                                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = nmyhrp * CFrame.new(0,0,2.85)
                                                    end)
                                                    FireRemote("M1")
                                                    FireRemote("Speical1")
                                                else 
                                                   break 
                                                end 
                                            else
                                                repeat
                                                    wait(1.5)
                                                    if game:GetService("Players").LocalPlayer.Character ~= nil and nmyhrp and On == true  then
                                                        break 
                                                    end 
                                                    if  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and On == true  then 
                                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shirt") then 
                                                            DestroyThingz()
                                                        end 
                                                        
                                                    end
                                                    if game:GetService("Players").LocalPlayer.Character and On == true  then 
                                                         break 
                                                    end     
                                                until game:GetService("Players").LocalPlayer.Character ~= nil and On == true 
                                            end
                                        else 
                                            Notification("Something Happened")
                                            break
                                        end 
                                    until Target == nil and On == true 
                                    wait(.5)
                                    local OldName = v.Name 
                                    pcall(function()   
                                        local Target = v:FindFirstChildOfClass("Model"):FindFirstChildOfClass("Model")
                                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Target:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,1)
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                        fireclickdetector(Target:FindFirstChild("ClickPart"):FindFirstChildOfClass("ClickDetector"))
                                    end)
                                    wait(1.75)
                                end 
                            end 
                        else 
                            Notification("Stopped The AutoFarm")
                            break
                        end 
                    end 
                end
                wait()
            end 
        else 
            Notification("Select A Team")
        end 
    elseif arg == false and Mob and Stage then
        On = false  
    else 
        Notification("Select A Mob Type Or Stage")
    end 
end)

AutoFarmCate:CreateDropDown("Mob Type",{"Humans","Ghouls","CCG"}, function(args)
    if args ~= nil then 
        Mob = args
    end
end)

AutoFarmCate:CreateSlider("Kangune/Quinque Stage",1,4,function(arg)
    Stage = arg
end
)