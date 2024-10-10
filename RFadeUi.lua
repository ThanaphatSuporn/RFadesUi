local RFadesui = {}

function RFadesui:Create(Title)
	-- Instances:

	local RFadeui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local TitleLabel = Instance.new("TextLabel")
	local Behind = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	--Properties:

	RFadeui.Name = "RFadeui"
	RFadeui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	RFadeui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = RFadeui
	Main.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.317140013, 0, 0.320512831, 0)
	Main.Size = UDim2.new(0.364687055, 0, 0.357745737, 0)

	TitleLabel.Name = "Title"
	TitleLabel.Parent = Main
	TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleLabel.BorderSizePixel = 0
	TitleLabel.Size = UDim2.new(1, 0, 0.100000009, 0)
	TitleLabel.Font = Enum.Font.SourceSansBold
	TitleLabel.Text = Title
	TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleLabel.TextScaled = true
	TitleLabel.TextSize = 14.000
	TitleLabel.TextWrapped = true
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	Behind.Name = "Behind"
	Behind.Parent = Main
	Behind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Behind.BackgroundTransparency = 1.000
	Behind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Behind.BorderSizePixel = 0
	Behind.Position = UDim2.new(0, 0, 0.0970587209, 0)
	Behind.Size = UDim2.new(1, 0, 0.902941823, 0)

	UIListLayout.Parent = Behind
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	-- Scripts:

	local function XURPPNE_fake_script() -- Main.SmoothDrag 
		local script = Instance.new('LocalScript', Main)

		local Drag = script.Parent
		local gsCoreGui = game:GetService("CoreGui")
		local gsTween = game:GetService("TweenService")
		local UserInputService = game:GetService("UserInputService")
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local dragTime = 0.04
			local SmoothDrag = {}
			SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
			dragSmoothFunction:Play()
		end
		Drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = Drag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		Drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Drag.Size then
				update(input)
			end
		end)

	end
	coroutine.wrap(XURPPNE_fake_script)()
	
	function RFadesui:Button(text,callback)
		local Button = Instance.new("TextButton")
		
		Button.Name = "Button"
		Button.Parent = Behind
		Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, 0, 0.116537116, 0)
		Button.Font = Enum.Font.SourceSansBold
		Button.Text = text
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextScaled = true
		Button.TextSize = 14.000
		Button.TextWrapped = true
		
		Button.MouseButton1Click:Connect(function()
			
			pcall(callback)
			
		end)
	end
end

return RFadesui

