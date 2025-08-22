-- Gui Fly V3 (منظّف ومُرتّب)
-- Script by المطوّر الأصلي / تعديل: نيمار

-- إنشاء واجهة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FlyGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- الإطار الرئيسي
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 150)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- عنوان
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "🔥 سكربت الطيران V3 🔥"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = MainFrame

-- زر تشغيل الطيران
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0.9, 0, 0, 40)
FlyButton.Position = UDim2.new(0.05, 0, 0.3, 0)
FlyButton.Text = "تشغيل الطيران ✈️"
FlyButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Font = Enum.Font.SourceSansBold
FlyButton.TextSize = 18
FlyButton.Parent = MainFrame

-- زر إيقاف الطيران
local StopButton = Instance.new("TextButton")
StopButton.Size = UDim2.new(0.9, 0, 0, 40)
StopButton.Position = UDim2.new(0.05, 0, 0.65, 0)
StopButton.Text = "إيقاف الطيران 🛑"
StopButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.SourceSansBold
StopButton.TextSize = 18
StopButton.Parent = MainFrame

-- منطق الطيران
local flying = false
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
BodyVelocity.Velocity = Vector3.new(0, 0, 0)
BodyVelocity.Parent = HumanoidRootPart

-- تشغيل الطيران
FlyButton.MouseButton1Click:Connect(function()
    flying = true
    BodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)

    game:GetService("RunService").Heartbeat:Connect(function()
        if flying then
            local moveDir = Player.Character.Humanoid.MoveDirection
            BodyVelocity.Velocity = moveDir * 50
        else
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
    end)

    print("تم تشغيل الطيران")
end)

-- إيقاف الطيران
StopButton.MouseButton1Click:Connect(function()
    flying = false
    BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
    print("تم إيقاف الطيران")
end)
