-- ScreenGui
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui -- ما يروح عند الموت

-- زر المربع الصغير
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
ToggleButton.Text = ""
ToggleButton.Active = true
ToggleButton.Draggable = true -- قابل للسحب
ToggleButton.Parent = ScreenGui

-- المربع الكبير (القائمة)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 0) -- يبدأ مغلق
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- العنوان
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 150)
Title.Text = "SCRIPIT NEYMAR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.Parent = MainFrame

-- الحاوية الأساسية
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -10, 1, -50)
ContentFrame.Position = UDim2.new(0, 5, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- قسم القائمة (يسار)
local SectionsFrame = Instance.new("Frame")
SectionsFrame.Size = UDim2.new(0.3, 0, 1, 0)
SectionsFrame.Position = UDim2.new(0, 0, 0, 0)
SectionsFrame.BackgroundTransparency = 1
SectionsFrame.Parent = ContentFrame

-- قسم الصفحات (يمين)
local PagesFrame = Instance.new("Frame")
PagesFrame.Size = UDim2.new(0.7, -5, 1, 0)
PagesFrame.Position = UDim2.new(0.3, 5, 0, 0)
PagesFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 150)
PagesFrame.Parent = ContentFrame

-- الصفحات (10 صفحات كـ ScrollingFrame)
local Pages = {}
for i = 1, 10 do
    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundColor3 = Color3.fromRGB(0, 0, 120 + i*10)
    Page.Visible = false
    Page.ScrollBarThickness = 8
    Page.CanvasSize = UDim2.new(0, 0, 2, 0) -- يخليها طويلة للتمرير
    Page.Parent = PagesFrame

    -- مثال: عنوان داخل الصفحة
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -10, 0, 40)
    Label.Position = UDim2.new(0, 5, 0, 5)
    Label.BackgroundTransparency = 1
    if i == 1 then
        Label.Text = "هذه صفحة المعلومات"
    else
        Label.Text = "صفحة " .. i
    end
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.TextSize = 22
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Page

    Pages[i] = Page
end

-- إظهار الصفحة الأولى افتراضيًا
Pages[1].Visible = true

-- الأزرار (10 أقسام)
for i = 1, 10 do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.Position = UDim2.new(0, 5, 0, 45 * (i-1))
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 180)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)

    if i == 1 then
        Button.Text = "معلومات" -- القسم الأول
    else
        Button.Text = "قسم " .. i
    end

    Button.Parent = SectionsFrame

    -- عند الضغط يفتح الصفحة المناسبة
    Button.MouseButton1Click:Connect(function()
        for _, p in ipairs(Pages) do
            p.Visible = false
        end
        Pages[i].Visible = true
    end)
end

-- التحكم بالفتح والغلق مع انيميشن
local TweenService = game:GetService("TweenService")
local open = false

ToggleButton.MouseButton1Click:Connect(function()
	open = not open
	local goal = {}
	if open then
		goal.Size = UDim2.new(0, 400, 0, 500)
	else
		goal.Size = UDim2.new(0, 400, 0, 0)
	end
	local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
	tween:Play()
end)
