local StarterGui = game:GetService("StarterGui")
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

    local PathfindingService = game:GetService("PathfindingService")
 
    local path = PathfindingService:CreatePath()
    path:ComputeAsync(Char:FindFirstChild("HumanoidRootPart").Position, destination)
    local humanoid = Char:WaitForChild("Humanoid")

    local waypoints = path:GetWaypoints()
    local Money = tonumber(string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2))

    for _, waypoint in pairs(waypoints) do
        local CombatTag = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible
        print(Run)
        print(StopRun)
        if CanSpeed() == true and CanRun == true then 
            Run()
        else 
            StopRun()
        end 
        humanoid:MoveTo(waypoint.Position)
        if waypoint.Action == Enum.PathWaypointAction.Jump  then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        humanoid.MoveToFinished:Wait()
        if CombatTag == true and state == true and Money > 600 and CanRun == true and shared.MoneyFarmed == true then
            local Bank = game:GetService("Workspace").Bank.Part
            local BankLoc = Bank.Position
            WalkTo(BankLoc,false,true)
           local Click = Bank.Parent.ClickDetector
           fireclickdetector(Click)
           for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Deposit.MouseButton1Click)) do 
                local Money = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2)
                game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Amount.Text = Money
                wait(.5)
                v:Fire()
            end
        elseif Money > 3500 then
            local Bank = game:GetService("Workspace").Bank.Part
            local BankLoc = Bank.Position
            WalkTo(BankLoc,false,true)
           local Click = Bank.Parent.ClickDetector
           fireclickdetector(Click)
           for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Deposit.MouseButton1Click)) do 
                local Money = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text,2)
                game:GetService("Players").LocalPlayer.PlayerGui.BankGUI.Frame.Amount.Text = Money
                wait(.5)
                v:Fire()
            end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X < 61 and CombatTag == false and Money > 300 and Getfood == true and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chicken Fries") == nil and shared.MoneyFarmed == true and shared.MoneyFarmed == true then 
            local Food = Vector3.new(-1125.52173, 47.2412643, -294.940125)
            MoveTo(Food,true,false)
            for count = 0, 5,1  do 
                fireclickdetector(game:GetService("Workspace")["Chicken Fries: $20"].ClickDetector)
            end 
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v.Name == "Chicken Fries" and v:IsA("Tool") then 
                    humanoid:EquipTool(v) 
                    v:Activate()
                    if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X > 220 then
                        break
                    end
                end 
            end
        elseif shared.MoneyFarmed == false then
            return
        end
        if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X < 61 and CombatTag == false and Money > 20 and Getfood == true and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chicken Fries") and shared.MoneyFarmed == true then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v.Name == "Chicken Fries" and v:IsA("Tool") then 
                    humanoid:EquipTool(v) 
                    v:Activate()
                    if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StamBar.BarF.Bar.AbsoluteSize.X > 220 then
                        break
                    end
                end 
            end
        elseif shared.MoneyFarmed == false then
            return
        end
        WalkTo(waypoint.Position,true,true,true)
    end 
end
local function DoJob()
    local FirstSpot = game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1
    local SecondSpot = game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part2
    WalkTo(FirstSpot.Position,true,true,false)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
    firetouchinterest(game:GetService("Workspace").Jobs.SupplyDelivery.Japanese1.Part1,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
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
        shared.MoneyFarmed = true 
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") == nil and shared.MoneyFarmed == true  then
            local Board = game:GetService("Workspace").JobBoardModel1.Board  
            while shared.MoneyFarmed == true do
                WalkTo(Board.Position,true,true,true)
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
        elseif game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") and shared.MoneyFarmed == true then
            local Board = game:GetService("Workspace").JobBoardModel1.Board  
            while shared.MoneyFarmed == true do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") == nil or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI").Text ~= "Restock Job" and shared.MoneyFarmed == true then 
                    WalkTo(Board.Position,true,true,true)
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
        shared.MoneyFarmed = false 
        Notification("You Have Stopped AutoFarming")
    end 
end)

function shared.MoneyFarmed1()
    Notification("ReDo")
end