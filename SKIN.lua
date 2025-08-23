--========================--
-- نسخ سكن من لاعب آخر --
--========================--

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- إنشاء خانة إدخال + زر نسخ
Tab:AddTextbox({
    Name = "اسم اللاعب لنسخ السكن",
    Default = "",
    TextDisappear = false,
    Callback = function(playerName)
        -- لما تكتب اسم اللاعب في الخانة هيتخزن هنا
        _G.CopySkinTarget = playerName
    end
})

Tab:AddButton({
    Name = "نسخ السكن",
    Callback = function()
        local targetPlayer = Players:FindFirstChild(_G.CopySkinTarget)
        if targetPlayer and targetPlayer.Character and LocalPlayer.Character then
            -- مسح ملابس اللاعب الحالي
            for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
                if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") then
                    item:Destroy()
                end
            end

            -- نسخ ملابس واكسسوارات اللاعب الهدف
            for _, item in ipairs(targetPlayer.Character:GetChildren()) do
                if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") then
                    item:Clone().Parent = LocalPlayer.Character
                end
            end
        else
            warn("⚠️ اللاعب غير موجود أو ماعندوش شخصية")
        end
    end
})

--by Shadow
