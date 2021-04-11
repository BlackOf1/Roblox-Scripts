local StarterGui = game:GetService("StarterGui")
local PlayerModule = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local PlayerName = game:GetService("Players").LocalPlayer.Name
local Controls = PlayerModule:GetControls()
local vu = game:GetService("VirtualUser")

shared.MoneyFarmed = (shared.MoneyFarmed and shared.MoneyFarmed1()) or false
shared.BankDeposit = shared.BankDeposit or 3500
shared.IdleConnection = game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)



function Notification(Msg)
    StarterGui:SetCore("SendNotification", {
        Title = "Synapse-Notification",
        Text = tostring(Msg),
        Duration = 4,
    })
end 

repeat 
    if game.Workspace.Live:FindFirstChild(PlayerName) then 
        break
    end 
    Notification("Your Not Loaded In The game")
     wait(5)
until game.Workspace.Live:FindFirstChild(PlayerName) == nil 

function DotPort(Position)
    local char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
    local PlayerLook = char:FindFirstChild("HumanoidRootPart").CFrame.LookVector;
    local Dis = (char:FindFirstChild("HumanoidRootPart").Position - Position).Unit
    local Dot = Dis:Dot(PlayerLook)
    if Dot > .5 then 
        return true 
    else 
        return false 
    end 
end


function GetTool(ToolName)
    local plr = game:GetService("Players").LocalPlayer
    if plr.Character then
        local Tool = plr.Backpack:FindFirstChild(ToolName)
        local Tool1 = plr.Character:FindFirstChild(ToolName)
        if Tool then 
            return Tool
        elseif Tool1 then 
            return Tool1
        end 
    end 
end 





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
local function CanSpeed()
    local Bar = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X
    if Bar <= 115 then 
        return false 
    elseif Bar >= 535 then
        return true 
    end 
end



function WalkTo(destination,state,CanRun,Getfood)
    local Char =  game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
    local RunOn = false
    local PathfindingService = game:GetService("PathfindingService")
 
    local path = PathfindingService:CreatePath()
    path:ComputeAsync(Char:FindFirstChild("HumanoidRootPart").Position, destination)

    local waypoints = path:GetWaypoints(1,1.5,nil)
    local Money = tonumber(string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2))

    path.Blocked:Connect(function()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end)
    for _, waypoint in pairs(waypoints) do
        local CombatTag = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible
        local CanSpeed1 = CanSpeed()
        if CanSpeed1 == true and CanRun == true and RunOn == false then 
            RunOn = true
            local Co = coroutine.create(function()
                Run()
            end)
            coroutine.resume(Co)
        elseif CanSpeed1 == false and RunOn == true and CanRun == true then
            RunOn = false 
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
        end 
        if waypoint.Action == Enum.PathWaypointAction.Jump then 
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):MoveTo(waypoint.Position)
        
        pcall(function()
            local Bin1 = game.Workspace:FindFirstChild("Bins") or game.Workspace:FindFirstChild("Bin1")
            Bin1.Name = "Bin1"
            local Bin2 = game.Workspace:FindFirstChild("Bins") or game.Workspace:FindFirstChild("Bin2")
            Bin2.Name = "Bin2"
            
            local Bin = game.Workspace:FindFirstChild("Bin1")
            local Bin0 = game.Workspace:FindFirstChild("Bin2")
            local Distance = (game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Bin.Part.Position).magnitude
            local Distance1 = (game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Bin0.Part.Position).magnitude
            if (Distance < 10.5) or (Distance1 < 10.5)  then
                wait(.5)
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end 
        end)
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").MoveToFinished:Wait()
        if shared.MoneyFarmed == false then
            return
        end 
        local CanSpeed2 = CanSpeed()
        if CanSpeed2 == true and CanRun == true and RunOn == false then 
            RunOn = true
            local Co = coroutine.create(function()
                Run()
            end)
            coroutine.resume(Co)
        elseif CanSpeed2 == false and RunOn == true and CanRun == true then
            RunOn = false 
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
        end 
        if CombatTag == true and state == true and Money > 600 and CanRun == true and shared.MoneyFarmed == true  then
            local Bank = game:GetService("Workspace").Bank.Part
            local BankLoc = Bank.Position
            local Co = coroutine.create(function ()
                StopRun()
            end)
            coroutine.resume(Co)
            WalkTo(BankLoc,false,true,false)
           local Click = Bank.Parent.ClickDetector
           fireclickdetector(Click)
           wait(1.45)
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
        elseif Money > shared.BankDeposit and state == true then
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
           wait(1.45)
           if game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.NoBankFrame.Visible == true then 
                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.NoBankFrame.Open.MouseButton1Click)) do
                    v:Fire()
                end 
                wait(.5)
           end 
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
                wait(1.15)
            end 
            for count = 0, 9, 1  do 
                wait(.65)
                local Char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
                local Tool = GetTool("Chicken Fries")
                Char:FindFirstChild("Humanoid"):EquipTool(Tool)
                wait(.45)
                Tool:Activate()
                wait(1.25)
                if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X > 200 then
                    break
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
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(v) 
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
                        wait(1.1)
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
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,0)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,1)
    local Co = coroutine.create(function ()
        StopRun()
    end)
    coroutine.resume(Co)
    WalkTo(SecondSpot.Position,true,true,true)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part2,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,0)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part2,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,1)
end


local Script = game:GetService("Players").LocalPlayer.Backpack.LocalS
---


local Ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()


local AutoFarmCate = Ui:CreateTab("Auto-Farm","If You Don't Have A Bank Account Buy One",true)
AutoFarmCate:CreateToggle("Money Farm", function(arg)
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
                until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI").Frame.Title.Text == "Restock Job"
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
                until  game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI").Frame.Title.Text == "Restock Job"
                DoJob()
            end 
        end 
    elseif arg == false then
        Controls:Enable()
        shared.MoneyFarmed = false 
        Notification("You Have Stopped AutoFarming")
    end 
end)
AutoFarmCate:CreateSlider("When To Deposit",3500,10000,function(arg)
    shared.BankDeposit = arg
end)

function shared.MoneyFarmed1()
    Notification("ReDo")
    shared.BankDeposit = 3500
    shared.IdleConnection:Disconnect()
    shared.IdleConnection = nil 
end