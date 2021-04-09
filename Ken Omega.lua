local StarterGui = game:GetService("StarterGui")
local PlayerModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()

function Notification(Msg)
    StarterGui:SetCore("SendNotification", {
        Title = "Synapse-Notification",
        Text = tostring(Msg),
        Duration = 4,
    })
end 
shared.MoneyFarmed = (shared.MoneyFarmed and shared.MoneyFarmed1()) or false




local Run = nil
local StopRun = nil
local Script = game:GetService("Players").LocalPlayer.Backpack.LocalS
for _, v in next, getgc() do
    if typeof(v) == "function" then
    local script = getfenv(v).script
        if script and typeof(script) == "Instance" then
            if script == Script then
                if debug.getinfo(v).name == "runPrompt" then 
                 Run = v
                elseif debug.getinfo(v).name == "stopSprint" then 
                StopRun = v
                end 
            end
        end
    end
end
--local Bar = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar
local function CanSpeed()
    if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X < 115 then 
        return false 
    elseif game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X > 535 then
        return true 
    end 
end



function WalkTo(destination,state,CanRun,Getfood)
   local Char =  game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local RunOn = false
    local PathfindingService = game:GetService("PathfindingService")
 
    local path = PathfindingService:CreatePath()
    path:ComputeAsync(Char:FindFirstChild("HumanoidRootPart").Position, destination)
    local humanoid = Char:WaitForChild("Humanoid")

    local waypoints = path:GetWaypoints(nil,1.5,nil)
    local Money = tonumber(string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2))
    path.Blocked:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end)
    for _, waypoint in pairs(waypoints) do
        local CombatTag = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible
        
        if CanSpeed() == true and CanRun == true and RunOn == false then 
            print(RunOn)
            RunOn = true
            print("Ok")
            local Co = coroutine.create(function()
                Run()
            end)
            coroutine.resume(Co)
        elseif CanSpeed() == false and RunOn == true and CanRun == true then
            print(RunOn)
            RunOn = false 
            print("No")
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
        end 
        if waypoint.Action == Enum.PathWaypointAction.Jump then 
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):MoveTo(waypoint.Position)
        --print(waypoint.Action)
        
        pcall(function()
            local Bin1 = game.Workspace:FindFirstChild("Bins") or game.Workspace:FindFirstChild("Bin1")
            Bin1.Name = "Bin1"
            local Bin2 = game.Workspace:FindFirstChild("Bins") or game.Workspace:FindFirstChild("Bin2")
            Bin2.Name = "Bin2"
            
            local Bin = game.Workspace:FindFirstChild("Bin1")
            local Distance = (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Bin.Part.Position).magnitude
            --print(Distance)
            if Distance < 4.3 then
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end 
        end)
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").MoveToFinished:Wait()
        if shared.MoneyFarmed == false then
            return
        end 
        if CanSpeed() == true and CanRun == true and RunOn == false then 
            print(RunOn)
            RunOn = true
            print("Ok")
            local Co = coroutine.create(function()
                Run()
            end)
            coroutine.resume(Co)
        elseif CanSpeed() == false and RunOn == true and CanRun == true then
            print(RunOn)
            RunOn = false 
            print("No")
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
        end 
        if CombatTag == true and state == true and Money > 600 and CanRun == true and shared.MoneyFarmed == true then
            local Bank = game:GetService("Workspace").Bank.Part
            local BankLoc = Bank.Position
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
            WalkTo(BankLoc,false,true,false)
           local Click = Bank.Parent.ClickDetector
           fireclickdetector(Click)
           for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Deposit.MouseButton1Click)) do 
                local Money = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2)
                game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Amount.Text = Money
                wait(.5)
                v:Fire()
            end
            local Co1 = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co1)
            WalkTo(destination,true,true,true)
            break 
        elseif Money > 3500 and state == true then
            local Bank = game:GetService("Workspace").Bank.Part
            local BankLoc = Bank.Position
            warn("Bank")
            local Co = coroutine.create(function()
                StopRun()
            end)
            coroutine.resume(Co)
            WalkTo(BankLoc,false,true,false)
           local Click = Bank.Parent.ClickDetector
           fireclickdetector(Click)
           wait(1)
           for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Deposit.MouseButton1Click)) do 
                local Money = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2)
                game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("BankGUI").Frame.Amount.Text = Money
                wait(.5)
                v:Fire()
            end
            local Co1 = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co1)
            WalkTo(destination,true,true,true)
            break 
        elseif game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X < 55 and CombatTag == false and Money > 300 and Getfood == true and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chicken Fries") == nil and shared.MoneyFarmed == true then 
            local Food = Vector3.new(-1125.52173, 47.2412643, -294.940125)
            warn("Food")
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
            WalkTo(Food,true,false,false)
            for count = 0, 5, 1  do 
                fireclickdetector(game:GetService("Workspace")["Chicken Fries: $20"].ClickDetector)
                wait(1.5)
            end 
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v.Name == "Chicken Fries" and v:IsA("Tool") then 
                    warn("eat")
                    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(v) 
                    v:Activate()
                    wait(1)
                    if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X > 200 then
                        break
                    end
                end 
            end
            local Co1 = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co1)
            WalkTo(destination,true,true,true)
            break 
        elseif game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X < 55 and CombatTag == false and Getfood == true and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chicken Fries") and shared.MoneyFarmed == true then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v.Name == "Chicken Fries" and v:IsA("Tool") then 
                        warn("eat")
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(v) 
                        v:Activate()
                        wait(1)
                        if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X > 200 then
                            break
                        end
                    end 
                end
                local Co = coroutine.create(function ()
                    StopRun()
                end)
                coroutine.resume(Co)
                WalkTo(destination,true,true,true)
                break 
        elseif shared.MoneyFarmed == false then
            return
        end
    end
end
local function DoJob()
    local FirstSpot = game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1
    local SecondSpot = game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part2
    WalkTo(FirstSpot.Position,true,true,false)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
    local Co = coroutine.create(function ()
        StopRun()
    end)
    coroutine.resume(Co)
    WalkTo(SecondSpot.Position,true,true,true)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part2,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part2,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
end


local Script = game:GetService("Players").LocalPlayer.Backpack.LocalS
---


local Ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()


local AutoFarmCate = Ui:CreateTab("Auto-Farm","",true)
AutoFarmCate:CreateToggle("Money Farm", function(arg)
    local PlayerName = game.Players.LocalPlayer.Name
    if arg == true and game.Workspace.Live:FindFirstChild(PlayerName) then 
        Controls:Disable()
        shared.MoneyFarmed = true 
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") == nil and shared.MoneyFarmed == true  then
            local Board = Vector3.new(-1166.06531, 47.1613693, -224.598022)
            while shared.MoneyFarmed == true do
                local Co = coroutine.create(function ()
                    StopRun()
                end)
                coroutine.resume(Co)
                WalkTo(Board,true,false,true)
                wait()
                repeat
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") == nil then 
                        fireclickdetector(game:GetService("Workspace").JobBoardModel1.ClickDetector)
                    end 
                    wait(.85)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") and shared.MoneyFarmed == true then 
                        if game:GetService("Players").LocalPlayer.PlayerGui.JobGUI.Frame.Title.Text == "Restock Job" and shared.MoneyFarmed == true then 
                            break
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.JobGUI.Frame.Title.Text ~= "Restock Job" and shared.MoneyFarmed == true  then 
                            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.JobGUI.Frame.Quit.MouseButton1Click)) do 
                                wait(.5)
                                v:Fire()
                            end
                            fireclickdetector(game:GetService("Workspace").JobBoardModel1.ClickDetector)
                            wait(1)
                        elseif shared.MoneyFarmed == false then 
                            break 
                        end 
                    end 
                    wait()
                until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI").Frame.Title.Text == "Restock Job"
                DoJob()
            end 
        elseif game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") and shared.MoneyFarmed == true then
            local Board = game:GetService("Workspace").JobBoardModel1.Board  
            while shared.MoneyFarmed == true do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") == nil or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI").Frame.Title.Text ~= "Restock Job" and shared.MoneyFarmed == true then 
                    local Co = coroutine.create(function ()
                        StopRun()
                    end)
                    coroutine.resume(Co)
                    WalkTo(Board.Position,true,true,true)
                    warn("Oh Ok")
                end
                wait()
                repeat
                    fireclickdetector(game:GetService("Workspace").JobBoardModel1.ClickDetector)
                    wait(.85)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") and shared.MoneyFarmed == true then 
                        if game:GetService("Players").LocalPlayer.PlayerGui.JobGUI.Frame.Title.Text == "Restock Job" and shared.MoneyFarmed == true then 
                            break
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.JobGUI.Frame.Title.Text ~= "Restock Job" and shared.MoneyFarmed == true  then 
                            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.JobGUI.Frame.Quit.MouseButton1Click)) do 
                                wait(.5)
                                v:Fire()
                            end
                        elseif shared.MoneyFarmed == false then 
                            break 
                        end 
                    end 
                    wait()
                until game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("JobGUI").Frame.Title.Text == "Restock Job"
                DoJob()
            end 
        end 
    elseif game.Workspace.Live:FindFirstChild(PlayerName) == nil then 
        Notification("Your Not Loaded In The game")
    elseif arg == false then
        Controls:Enable()
        shared.MoneyFarmed = false 
        Notification("You Have Stopped AutoFarming")
    end 
end)

function shared.MoneyFarmed1()
    Notification("ReDo")
end