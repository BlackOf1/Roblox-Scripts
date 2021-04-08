function Notification(Msg)
    StarterGui:SetCore("SendNotification", {
        Title = "Synapse-Notification",
        Text = tostring(Msg),
        Duration = 4,
    })
end 

local Ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()
shared.MoneyFarmed = false

local AutoFarmCate = Ui:CreateTab("Auto-Farm","",true)
AutoFarmCate:CreateToggle("Money Farm", function(arg)
    if arg == true and game:GetSerivce("Workspace").Live:FindFirstChild("fordnikefox") then 
        
    elseif game:GetSerivce("Workspace").Live:FindFirstChild("fordnikefox") == nil then 
        Notification("Your Not Loaded In The Game")
    end 
end)