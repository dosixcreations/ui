local Library = {
	Flags = {},
	Items = {},
	KeybindsListEnabled = false
}

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local stats = game:GetService("Stats")

function Library:Dragify(ins,touse)
	local dragging
	local dragInput
	local dragStart
	local startPos
	--
	local function update(input)
		local delta = input.Position - dragStart
		touse:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.1,true)
	end
	--
	ins.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = touse.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	--
	ins.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	--
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

local function tweenObject(object, properties, duration, easingStyle, easingDirection)
	local tweenInfo = TweenInfo.new(
		duration,
		easingStyle or Enum.EasingStyle.Linear,
		easingDirection or Enum.EasingDirection.Out
	)
	local tween = TweenService:Create(object, tweenInfo, properties)
	tween:Play()
	return tween
end

local function printTable(tbl, indent)
	indent = indent or 0
	local prefix = string.rep("  ", indent) -- Indentation for nested tables
	for key, value in pairs(tbl) do
		if type(value) == "table" then
			print(prefix .. tostring(key) .. ":")
			printTable(value, indent + 1) -- Recursively print nested tables
		else
			print(prefix .. tostring(key) .. " = " .. tostring(value))
		end
	end
end

function Library:NewWindow(option)
	option = typeof(option) == "table" and option or {}
	option.text = option.text or "pyps.cc"

	local Window = {}

	do -- window
		-- StarterGui.UILIBMAIN
		Window["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		Window["1"]["Name"] = [[UILIBMAIN]];
		Window["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

		Window["SGD"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		Window["SGD"]["Name"] = [[KEYBINDLIST]];
		Window["SGD"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

		-- StarterGui.UILIBMAIN.UIHolder
		Window["2"] = Instance.new("Frame", Window["1"]);
		Window["2"]["BorderSizePixel"] = 0;
		Window["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		Window["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["2"]["Size"] = UDim2.new(0, 650, 0, 500);
		Window["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["2"]["Name"] = [[UIHolder]];
		Window["2"]["BackgroundTransparency"] = 1;


		-- StarterGui.UILIBMAIN.UIHolder.Outline
		Window["3"] = Instance.new("Frame", Window["2"]);
		Window["3"]["BorderSizePixel"] = 0;
		Window["3"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
		Window["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["3"]["Size"] = UDim2.new(1, 0, 1, 0);
		Window["3"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["3"]["Name"] = [[Outline]];


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent
		Window["4"] = Instance.new("Frame", Window["3"]);
		Window["4"]["BorderSizePixel"] = 0;
		Window["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["4"]["Size"] = UDim2.new(1, -2, 1, -2);
		Window["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["4"]["Name"] = [[Accent]];


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline
		Window["5"] = Instance.new("Frame", Window["4"]);
		Window["5"]["BorderSizePixel"] = 0;
		Window["5"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		Window["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["5"]["Size"] = UDim2.new(1, -2, 1, -2);
		Window["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["5"]["Name"] = [[Innerline]];


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main
		Window["6"] = Instance.new("Frame", Window["5"]);
		Window["6"]["BorderSizePixel"] = 0;
		Window["6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		Window["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["6"]["Size"] = UDim2.new(1, -2, 1, -2);
		Window["6"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["6"]["Name"] = [[Main]];


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline
		Window["7"] = Instance.new("Frame", Window["6"]);
		Window["7"]["BorderSizePixel"] = 0;
		Window["7"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		Window["7"]["AnchorPoint"] = Vector2.new(0.5, 1);
		Window["7"]["Size"] = UDim2.new(1, -10, 1, -30);
		Window["7"]["Position"] = UDim2.new(0.5, 0, 1, -5);
		Window["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["7"]["Name"] = [[Innerline]];


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline
		Window["8"] = Instance.new("Frame", Window["7"]);
		Window["8"]["BorderSizePixel"] = 0;
		Window["8"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
		Window["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["8"]["Size"] = UDim2.new(1, -2, 1, -2);
		Window["8"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["8"]["Name"] = [[Outline]];


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain
		Window["9"] = Instance.new("Frame", Window["8"]);
		Window["9"]["BorderSizePixel"] = 0;
		Window["9"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
		Window["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["9"]["Size"] = UDim2.new(1, -2, 1, -2);
		Window["9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["9"]["Name"] = [[insideMain]];

		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.CheatNameLabel
		Window["12e"] = Instance.new("TextLabel", Window["6"]);
		Window["12e"]["LineHeight"] = 3;
		Window["12e"]["TextStrokeTransparency"] = 0;
		Window["12e"]["BorderSizePixel"] = 0;
		Window["12e"]["TextSize"] = 15;
		Window["12e"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
		Window["12e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["12e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Window["12e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		Window["12e"]["BackgroundTransparency"] = 1;
		Window["12e"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Window["12e"]["Size"] = UDim2.new(1, 0, 0, 25);
		Window["12e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["12e"]["Text"] = option.text;
		Window["12e"]["Name"] = [[CheatNameLabel]];
		Window["12e"]["Position"] = UDim2.new(0.5, 0, 0, 0);


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.CheatNameLabel.CheatNamePadding
		Window["12f"] = Instance.new("UIPadding", Window["12e"]);
		Window["12f"]["PaddingRight"] = UDim.new(0, 5);
		Window["12f"]["Name"] = [[CheatNamePadding]];
		Window["12f"]["PaddingLeft"] = UDim.new(0, 5);
		Window["12f"]["PaddingBottom"] = UDim.new(0, 4);

		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder
		Window["a"] = Instance.new("Frame", Window["9"]);
		Window["a"]["BorderSizePixel"] = 0;
		Window["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["a"]["Size"] = UDim2.new(1, -10, 1, -10);
		Window["a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["a"]["Name"] = [[insideHolder]];
		Window["a"]["BackgroundTransparency"] = 1;


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder
		Window["b"] = Instance.new("ScrollingFrame", Window["a"]);
		Window["b"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
		Window["b"]["ZIndex"] = 2;
		Window["b"]["BorderSizePixel"] = 0;
		Window["b"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		Window["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["b"]["Name"] = [[TabHolder]];
		Window["b"]["Selectable"] = false;
		Window["b"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
		Window["b"]["Size"] = UDim2.new(1, 0, 0, 30);
		Window["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["b"]["ScrollBarThickness"] = 0;
		Window["b"]["BackgroundTransparency"] = 1;


		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.UIListLayout
		Window["c"] = Instance.new("UIListLayout", Window["b"]);
		Window["c"]["Padding"] = UDim.new(0, 3);
		Window["c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		Window["c"]["FillDirection"] = Enum.FillDirection.Horizontal;

		-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"]
		Window["19"] = Instance.new("Frame", Window["a"]);
		Window["19"]["BorderSizePixel"] = 0;
		Window["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["19"]["AnchorPoint"] = Vector2.new(0.5, 1);
		Window["19"]["Size"] = UDim2.new(1, 0, 1, -28);
		Window["19"]["Position"] = UDim2.new(0.5, 0, 1, 0);
		Window["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["19"]["Name"] = [[TabTabA]];
		Window["19"]["BackgroundTransparency"] = 1;

		-- StarterGui.UILIBMAIN.KeybindsHolder
		Window["131"] = Instance.new("Frame", Window["SGD"]);
		Window["131"]["BorderSizePixel"] = 0;
		Window["131"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["131"]["AnchorPoint"] = Vector2.new(0, 0.5);
		Window["131"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Window["131"]["Size"] = UDim2.new(0, 125, 0, 50);
		Window["131"]["Position"] = UDim2.new(0, 5, 0.5, 0);
		Window["131"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["131"]["Name"] = [[KeybindsHolder]];
		Window["131"]["BackgroundTransparency"] = 1;


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline
		Window["132"] = Instance.new("Frame", Window["131"]);
		Window["132"]["BorderSizePixel"] = 0;
		Window["132"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
		Window["132"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Window["132"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Window["132"]["Size"] = UDim2.new(1, -2, 0, 48);
		Window["132"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		Window["132"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["132"]["Name"] = [[Outline]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent
		Window["133"] = Instance.new("Frame", Window["132"]);
		Window["133"]["BorderSizePixel"] = 0;
		Window["133"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["133"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Window["133"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Window["133"]["Size"] = UDim2.new(1, -2, 0, 46);
		Window["133"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		Window["133"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["133"]["Name"] = [[Accent]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline
		Window["134"] = Instance.new("Frame", Window["133"]);
		Window["134"]["BorderSizePixel"] = 0;
		Window["134"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		Window["134"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Window["134"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Window["134"]["Size"] = UDim2.new(1, -2, 0, 44);
		Window["134"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		Window["134"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["134"]["Name"] = [[Innerline]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main
		Window["135"] = Instance.new("Frame", Window["134"]);
		Window["135"]["BorderSizePixel"] = 0;
		Window["135"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		Window["135"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Window["135"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Window["135"]["Size"] = UDim2.new(1, -2, 0, 42);
		Window["135"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		Window["135"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["135"]["Name"] = [[Main]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.TextLabel
		Window["136"] = Instance.new("TextLabel", Window["135"]);
		Window["136"]["TextStrokeTransparency"] = 0;
		Window["136"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
		Window["136"]["BorderSizePixel"] = 0;
		Window["136"]["TextSize"] = 14;
		Window["136"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
		Window["136"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		Window["136"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["136"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Window["136"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		Window["136"]["BackgroundTransparency"] = 1;
		Window["136"]["Size"] = UDim2.new(1, 0, 0, 20);
		Window["136"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["136"]["Text"] = [[Keybinds]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.UIPadding
		Window["137"] = Instance.new("UIPadding", Window["135"]);
		Window["137"]["PaddingTop"] = UDim.new(0, 3);
		Window["137"]["PaddingRight"] = UDim.new(0, 5);
		Window["137"]["PaddingLeft"] = UDim.new(0, 5);
		Window["137"]["PaddingBottom"] = UDim.new(0, 5);


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.Keybinds
		Window["138"] = Instance.new("Frame", Window["135"]);
		Window["138"]["BorderSizePixel"] = 0;
		Window["138"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["138"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Window["138"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Window["138"]["Size"] = UDim2.new(1, 0, 0, 20);
		Window["138"]["Position"] = UDim2.new(0.5, 0, 0, 17);
		Window["138"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["138"]["Name"] = [[Keybinds]];
		Window["138"]["BackgroundTransparency"] = 1;

		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.Keybinds.UIPadding
		Window["13e"] = Instance.new("UIPadding", Window["138"]);
		Window["13e"]["PaddingTop"] = UDim.new(0, 6);


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.Keybinds.UIListLayout
		Window["13f"] = Instance.new("UIListLayout", Window["138"]);
		Window["13f"]["Padding"] = UDim.new(0, 2);
		Window["13f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.AccentOutline
		Window["140"] = Instance.new("Frame", Window["135"]);
		Window["140"]["BorderSizePixel"] = 0;
		Window["140"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
		Window["140"]["Size"] = UDim2.new(1, 0, 0, 3);
		Window["140"]["Position"] = UDim2.new(0, 0, 0, 16);
		Window["140"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["140"]["Name"] = [[AccentOutline]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.Main.AccentOutline.Accent
		Window["141"] = Instance.new("Frame", Window["140"]);
		Window["141"]["BorderSizePixel"] = 0;
		Window["141"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["141"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["141"]["Size"] = UDim2.new(1, -2, 1, -2);
		Window["141"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Window["141"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Window["141"]["Name"] = [[Accent]];


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.Innerline.UIPadding
		Window["142"] = Instance.new("UIPadding", Window["134"]);
		Window["142"]["PaddingTop"] = UDim.new(0, 1);
		Window["142"]["PaddingBottom"] = UDim.new(0, 1);


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.AccentGradient
		Window["143"] = Instance.new("UIGradient", Window["133"]);
		Window["143"]["Rotation"] = 90;
		Window["143"]["Name"] = [[AccentGradient]];
		Window["143"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(209, 209, 209))};


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.Accent.UIPadding
		Window["144"] = Instance.new("UIPadding", Window["133"]);
		Window["144"]["PaddingTop"] = UDim.new(0, 1);
		Window["144"]["PaddingBottom"] = UDim.new(0, 1);


		-- StarterGui.UILIBMAIN.KeybindsHolder.Outline.UIPadding
		Window["145"] = Instance.new("UIPadding", Window["132"]);
		Window["145"]["PaddingTop"] = UDim.new(0, 1);
		Window["145"]["PaddingBottom"] = UDim.new(0, 1);
	end

	do -- logic
		game:GetService("UserInputService").InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.Insert then
				Window["1"].Enabled = not Window["1"].Enabled
			end
		end)

		Library:Dragify(Window["12e"], Window["2"])
		Library:Dragify(Window["136"], Window["131"])
	end

	local firsttab = true
	local activetab = nil

	function Window:NewTab(option)
		option = typeof(option) == "table" and option or {}
		option.text = option.text or "NewTab"

		local Tab = {}

		do -- tab
			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.CombatTabHolder
			Tab["d"] = Instance.new("Frame", Window["b"]);
			Tab["d"]["Active"] = true;
			Tab["d"]["ZIndex"] = 2;
			Tab["d"]["BorderSizePixel"] = 0;
			Tab["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["d"]["Size"] = UDim2.new(0, 125, 0, 30);
			Tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["d"]["Name"] = [[CombatTabHolder]];
			Tab["d"]["BackgroundTransparency"] = 1;


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.CombatTabHolder.Outline
			Tab["e"] = Instance.new("Frame", Tab["d"]);
			Tab["e"]["ZIndex"] = 2;
			Tab["e"]["BorderSizePixel"] = 0;
			Tab["e"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
			Tab["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["e"]["Size"] = UDim2.new(1, 0, 1, -2);
			Tab["e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			Tab["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["e"]["Name"] = [[Outline]];


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.CombatTabHolder.Outline.Innerline
			Tab["f"] = Instance.new("Frame", Tab["e"]);
			Tab["f"]["ZIndex"] = 2;
			Tab["f"]["BorderSizePixel"] = 0;
			Tab["f"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			Tab["f"]["AnchorPoint"] = Vector2.new(0.5, 1);
			Tab["f"]["Size"] = UDim2.new(1, -2, 1, 0);
			Tab["f"]["Position"] = UDim2.new(0.5, 0, 1, 0);
			Tab["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["f"]["Name"] = [[Innerline]];


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.CombatTabHolder.Outline.Innerline.Main
			Tab["10"] = Instance.new("Frame", Tab["f"]);
			Tab["10"]["ZIndex"] = 2;
			Tab["10"]["BorderSizePixel"] = 0;
			Tab["10"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			Tab["10"]["AnchorPoint"] = Vector2.new(0.5, 0);
			Tab["10"]["Size"] = UDim2.new(1, -2, 1, -1);
			Tab["10"]["Position"] = UDim2.new(0.5, 0, 0, 1);
			Tab["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["10"]["Name"] = [[Main]];


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.CombatTabHolder.Outline.Innerline.Main.TabGradient
			Tab["11"] = Instance.new("UIGradient", Tab["10"]);
			Tab["11"]["Rotation"] = 90;
			Tab["11"]["Name"] = [[TabGradient]];
			Tab["11"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(187, 187, 187))};


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabHolder.CombatTabHolder.Outline.Innerline.Main.TabText
			Tab["12"] = Instance.new("TextLabel", Tab["10"]);
			Tab["12"]["TextStrokeTransparency"] = 0;
			Tab["12"]["BorderSizePixel"] = 0;
			Tab["12"]["TextSize"] = 14;
			Tab["12"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
			Tab["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["12"]["TextColor3"] = Color3.fromRGB(91,91,91);
			Tab["12"]["BackgroundTransparency"] = 1;
			Tab["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["12"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["12"]["Text"] = option.text;
			Tab["12"]["Name"] = [[TabText]];
			Tab["12"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"]
			Tab["1a"] = Instance.new("Frame", Window["19"]);
			Tab["1a"]["BorderSizePixel"] = 0;
			Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			Tab["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1a"]["Name"] = option.text..[[TabEverythingHolder]];
			Tab["1a"]["BackgroundTransparency"] = 1;
			Tab["1a"]["Visible"] = false;

			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"].Outline
			Tab["1b"] = Instance.new("Frame", Tab["1a"]);
			Tab["1b"]["BorderSizePixel"] = 0;
			Tab["1b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
			Tab["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["1b"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			Tab["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1b"]["Name"] = [[Outline]];


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"].Outline.Innerline
			Tab["1c"] = Instance.new("Frame", Tab["1b"]);
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			Tab["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["1c"]["Size"] = UDim2.new(1, -2, 1, -2);
			Tab["1c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			Tab["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1c"]["Name"] = [[Innerline]];


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"].Outline.Innerline.Main
			Tab["1d"] = Instance.new("Frame", Tab["1c"]);
			Tab["1d"]["BorderSizePixel"] = 0;
			Tab["1d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			Tab["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["1d"]["Size"] = UDim2.new(1, -2, 1, -2);
			Tab["1d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			Tab["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1d"]["Name"] = [[Main]];


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"].Outline.Innerline.Main.SectionsHolder
			Tab["1e"] = Instance.new("ScrollingFrame", Tab["1d"]);
			Tab["1e"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
			Tab["1e"]["BorderSizePixel"] = 0;
			Tab["1e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
			Tab["1e"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 22);
			Tab["1e"]["Name"] = [[SectionsHolder]];
			Tab["1e"]["Selectable"] = false;
			Tab["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["1e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
			Tab["1e"]["Size"] = UDim2.new(1, -2, 1, -2);
			Tab["1e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			Tab["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1e"]["ScrollBarThickness"] = 0;
			Tab["1e"]["BackgroundTransparency"] = 1;


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"].Outline.Innerline.Main.SectionsHolder.UIListLayout
			Tab["1f"] = Instance.new("UIListLayout", Tab["1e"]);
			Tab["1f"]["Wraps"] = true;
			Tab["1f"]["Padding"] = UDim.new(0, 5);
			Tab["1f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			Tab["1f"]["FillDirection"] = Enum.FillDirection.Horizontal;


			-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabTab["1a"].CombatTabTab["1a"].Outline.Innerline.Main.SectionsHolder.UIPadding
			Tab["20"] = Instance.new("UIPadding", Tab["1e"]);
			Tab["20"]["PaddingTop"] = UDim.new(0, 5);
			Tab["20"]["PaddingRight"] = UDim.new(0, 5);
			Tab["20"]["PaddingLeft"] = UDim.new(0, 5);
			Tab["20"]["PaddingBottom"] = UDim.new(0, 5);

		end

		do -- logic			
			local oldtabcolor = Color3.fromRGB(91,91,91)
			local activetabcolor = Color3.fromRGB(255,255,255)

			local function activateTab(tab)
				if activetab then
					activetab["1a"].Visible = false
					activetab["10"].Size = UDim2.new(1, -2, 1, -1);
					activetab["12"].TextColor3 = oldtabcolor
					activetab["11"].Rotation = 90
				end

				tab["1a"].Visible = true
				tab["10"].Size = UDim2.new(1, -2, 1, 0);
				tab["12"].TextColor3 = activetabcolor
				tab["11"].Rotation = -90
				activetab = tab
			end

			if firsttab then
				activateTab(Tab)
				Tab["1a"].Visible = true
				firsttab = false
			end

			local hovertabcolor = Color3.fromRGB(120,120,120)

			Tab["12"].MouseEnter:Connect(function()
				if activetab ~= Tab then
					Tab["12"].TextColor3 = hovertabcolor
				else
					Tab["12"].TextColor3 = activetabcolor
				end
			end)

			Tab["12"].MouseLeave:Connect(function()
				if activetab ~= Tab then
					Tab["12"].TextColor3 = oldtabcolor
				else
					Tab["12"].TextColor3 = activetabcolor
				end
			end)

			Tab["12"].InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if activetab ~= Tab then
						activateTab(Tab)
					end
				end
			end)
		end

		local firstsection = true

		function Tab:NewSection(option)
			option = typeof(option) == "table" and option or {}
			option.text = option.text or "NewSection"

			local Section = {}

			do -- section
				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder
				Section["21"] = Instance.new("Frame", Tab["1e"]);
				Section["21"]["BorderSizePixel"] = 0;
				Section["21"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				Section["21"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Section["21"]["AutomaticSize"] = Enum.AutomaticSize.Y;
				Section["21"]["Size"] = UDim2.new(0, 198, 0, 25);
				Section["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["21"]["Name"] = [[SectionHolder]];


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline
				Section["22"] = Instance.new("Frame", Section["21"]);
				Section["22"]["BorderSizePixel"] = 0;
				Section["22"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
				Section["22"]["AnchorPoint"] = Vector2.new(0.5, 0);
				Section["22"]["AutomaticSize"] = Enum.AutomaticSize.Y;
				Section["22"]["Size"] = UDim2.new(1, -2, 0, 23);
				Section["22"]["Position"] = UDim2.new(0.5, 0, 0, 0);
				Section["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["22"]["Name"] = [[Outline]];


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main
				Section["23"] = Instance.new("Frame", Section["22"]);
				Section["23"]["BorderSizePixel"] = 0;
				Section["23"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
				Section["23"]["AnchorPoint"] = Vector2.new(0.5, 0);
				Section["23"]["AutomaticSize"] = Enum.AutomaticSize.Y;
				Section["23"]["Size"] = UDim2.new(1, -2, 0, 21);
				Section["23"]["Position"] = UDim2.new(0.5, 0, 0, 0);
				Section["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["23"]["Name"] = [[Main]];


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.UIListLayout
				Section["24"] = Instance.new("UIListLayout", Section["23"]);
				Section["24"]["VerticalFlex"] = Enum.UIFlexAlignment.SpaceBetween;
				Section["24"]["Padding"] = UDim.new(0, 5);
				Section["24"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
				Section["24"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.UIPadding
				Section["25"] = Instance.new("UIPadding", Section["23"]);
				Section["25"]["PaddingTop"] = UDim.new(0, 5);
				Section["25"]["PaddingRight"] = UDim.new(0, 5);
				Section["25"]["PaddingLeft"] = UDim.new(0, 5);
				Section["25"]["PaddingBottom"] = UDim.new(0, 5);


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SectionText
				Section["26"] = Instance.new("TextLabel", Section["23"]);
				Section["26"]["TextStrokeTransparency"] = 0;
				Section["26"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
				Section["26"]["BorderSizePixel"] = 0;
				Section["26"]["TextSize"] = 14;
				Section["26"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Section["26"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
				Section["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Section["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Section["26"]["BackgroundTransparency"] = 1;
				Section["26"]["Size"] = UDim2.new(1, 0, 0, 14);
				Section["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["26"]["Text"] = option.text;
				Section["26"]["Name"] = [[SectionText]];

				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.UIPadding
				Section["a1"] = Instance.new("UIPadding", Section["22"]);
				Section["a1"]["PaddingTop"] = UDim.new(0, 1);
				Section["a1"]["PaddingBottom"] = UDim.new(0, 1);


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.UIPadding
				Section["a2"] = Instance.new("UIPadding", Section["21"]);
				Section["a2"]["PaddingTop"] = UDim.new(0, 1);
				Section["a2"]["PaddingBottom"] = UDim.new(0, 1);


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Accent
				Section["a3"] = Instance.new("Frame", Section["21"]);
				Section["a3"]["BorderSizePixel"] = 0;
				Section["a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["a3"]["AnchorPoint"] = Vector2.new(0.5, 0);
				Section["a3"]["Size"] = UDim2.new(1, -4, 0, 1);
				Section["a3"]["Position"] = UDim2.new(0.5, 0, 0, 2);
				Section["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["a3"]["Name"] = [[Accent]];


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Accent.AccentGradient
				Section["a4"] = Instance.new("UIGradient", Section["a3"]);
				Section["a4"]["Name"] = [[AccentGradient]];
				Section["a4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(201, 201, 201))};
			end

			do -- Logic
			end

			function Section:NewToggle(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "New Toggle"
				option.enabled = option.enabled or false
				option.risky = option.risky or false
				option.flag = option.flag or option.text
				option.state = option.enabled
				option.callback = option.callback or function() end
				option.utilitytype = "toggle"

				local Toggle = {}

				do -- toggle
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder
					Toggle["27"] = Instance.new("Frame", Section["23"]);
					Toggle["27"]["ZIndex"] = 1000;
					Toggle["27"]["BorderSizePixel"] = 0;
					Toggle["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["27"]["Size"] = UDim2.new(1, 0, 0, 15);
					Toggle["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["27"]["Name"] = [[ToggleHolder]];
					Toggle["27"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline
					Toggle["28"] = Instance.new("Frame", Toggle["27"]);
					Toggle["28"]["Active"] = true;
					Toggle["28"]["BorderSizePixel"] = 0;
					Toggle["28"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Toggle["28"]["Size"] = UDim2.new(0, 15, 0, 15);
					Toggle["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["28"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline
					Toggle["29"] = Instance.new("Frame", Toggle["28"]);
					Toggle["29"]["Active"] = true;
					Toggle["29"]["BorderSizePixel"] = 0;
					Toggle["29"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Toggle["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["29"]["Size"] = UDim2.new(1, -2, 1, -2);
					Toggle["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Toggle["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["29"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline.Toggle
					Toggle["2a"] = Instance.new("Frame", Toggle["29"]);
					Toggle["2a"]["Active"] = true;
					Toggle["2a"]["BorderSizePixel"] = 0;
					Toggle["2a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Toggle["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["2a"]["Size"] = UDim2.new(1, -2, 1, -2);
					Toggle["2a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Toggle["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2a"]["Name"] = [[Toggle]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline.Toggle.UIGradient
					Toggle["2b"] = Instance.new("UIGradient", Toggle["2a"]);
					Toggle["2b"]["Rotation"] = 90;
					Toggle["2b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline.Toggle.ToggleButton
					Toggle["2c"] = Instance.new("TextButton", Toggle["2a"]);
					Toggle["2c"]["BorderSizePixel"] = 0;
					Toggle["2c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2c"]["TextTransparency"] = 1;
					Toggle["2c"]["TextSize"] = 14;
					Toggle["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["2c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["2c"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["2c"]["BackgroundTransparency"] = 1;
					Toggle["2c"]["Name"] = [[ToggleButton]];
					Toggle["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.ToggleText
					Toggle["2d"] = Instance.new("TextLabel", Toggle["27"]);
					Toggle["2d"]["TextStrokeTransparency"] = 0;
					Toggle["2d"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Toggle["2d"]["BorderSizePixel"] = 0;
					Toggle["2d"]["TextSize"] = 14;
					Toggle["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["2d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Toggle["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["2d"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Toggle["2d"]["BackgroundTransparency"] = 1;
					Toggle["2d"]["AnchorPoint"] = Vector2.new(1, 0);
					Toggle["2d"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2d"]["Text"] = option.text;
					Toggle["2d"]["Name"] = [[ToggleText]];
					Toggle["2d"]["Position"] = UDim2.new(1, 0, 0, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.ToggleText.UIPadding
					Toggle["2e"] = Instance.new("UIPadding", Toggle["2d"]);
					Toggle["2e"]["PaddingRight"] = UDim.new(0, 1);
					Toggle["2e"]["PaddingLeft"] = UDim.new(0, 18);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.AdditionHolder
					Toggle["2f"] = Instance.new("Frame", Toggle["27"]);
					Toggle["2f"]["BorderSizePixel"] = 0;
					Toggle["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2f"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Toggle["2f"]["Size"] = UDim2.new(0, 50, 1, 0);
					Toggle["2f"]["Position"] = UDim2.new(1, 0, 0.5, 0);
					Toggle["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2f"]["Name"] = [[AdditionHolder]];
					Toggle["2f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.AdditionHolder.UIListLayout
					Toggle["30"] = Instance.new("UIListLayout", Toggle["2f"]);
					Toggle["30"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
					Toggle["30"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					Toggle["30"]["FillDirection"] = Enum.FillDirection.Horizontal;
				end

				do -- logic
					local btnToggle = Toggle["2c"]
					local basiccolor = Color3.fromRGB(31,31,31)
					local accentcolor = Color3.fromRGB(255,255,255)
					local hovercolor = Color3.fromRGB(40,40,40)

					btnToggle.MouseButton1Click:Connect(function()
						if option.state == false then
							Toggle["2a"]["BackgroundColor3"] = accentcolor
						elseif option.state == true then
							Toggle["2a"]["BackgroundColor3"] = basiccolor
						end

						option.state = not option.state
						Library.Flags[option.flag] = option.state
						option.callback(option.state)
					end)


					btnToggle.MouseEnter:Connect(function()
						Toggle["2d"]["TextColor3"] = Color3.fromRGB(112, 112, 112);
					end)

					btnToggle.MouseLeave:Connect(function()
						Toggle["2d"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					end)

					if option.enabled == true then
						option.callback(true)
						option.state = true
						Toggle["2a"]["BackgroundColor3"] = accentcolor
					end

					function option:SetValue(boolean)
						boolean = typeof(boolean) == "boolean" and boolean 
						option.state = boolean
						option.callback(option.state)
						Library.Flags[option.flag] = option.state
						if option.state == true then
							Toggle["2a"]["BackgroundColor3"] = accentcolor
						elseif option.state == false then
							Toggle["2a"]["BackgroundColor3"] = basiccolor
						end
					end

					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.state
						Library.Items[option.flag] = option
					end
				end

				local hopster = option

				function Toggle:AddKeybind(option)
					option = typeof(option) == "table" and option or {}
					option.text = option.text
					option.key = option.key or Enum.KeyCode.World95
					option.state = option.state or false
					option.sync = option.sync or false
					option.flag = option.flag or option.text
					option.callback = option.callback or function() end
					option.utilitytype = "keybind"

					local Keybind = {}

					do -- keybind
						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder
						Keybind["87"] = Instance.new("Frame", Toggle["2f"]);
						Keybind["87"]["BorderSizePixel"] = 0;
						Keybind["87"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["87"]["Size"] = UDim2.new(1, 0, 0, 15);
						Keybind["87"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["87"]["Name"] = [[KeybindHolder]];
						Keybind["87"]["BackgroundTransparency"] = 1;
						Keybind["87"]["ZIndex"] = 10


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline
						Keybind["88"] = Instance.new("Frame", Keybind["87"]);
						Keybind["88"]["BorderSizePixel"] = 0;
						Keybind["88"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						Keybind["88"]["AnchorPoint"] = Vector2.new(1, 0.5);
						Keybind["88"]["Size"] = UDim2.new(0, 25, 1, 0);
						Keybind["88"]["Position"] = UDim2.new(1, 0, 0.5, 0);
						Keybind["88"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["88"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline
						Keybind["89"] = Instance.new("Frame", Keybind["88"]);
						Keybind["89"]["BorderSizePixel"] = 0;
						Keybind["89"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["89"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["89"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["89"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["89"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main
						Keybind["8a"] = Instance.new("Frame", Keybind["89"]);
						Keybind["8a"]["BorderSizePixel"] = 0;
						Keybind["8a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["8a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8a"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["8a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["8a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8a"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.UIGradient
						Keybind["8b"] = Instance.new("UIGradient", Keybind["8a"]);
						Keybind["8b"]["Rotation"] = 90;
						Keybind["8b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Keybind
						Keybind["8c"] = Instance.new("TextLabel", Keybind["8a"]);
						Keybind["8c"]["TextStrokeTransparency"] = 0;
						Keybind["8c"]["ZIndex"] = 1;
						Keybind["8c"]["BorderSizePixel"] = 0;
						Keybind["8c"]["TextSize"] = 12;
						Keybind["8c"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["8c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["8c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["8c"]["BackgroundTransparency"] = 1;
						Keybind["8c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8c"]["Size"] = UDim2.new(1, 0, 1, 0);
						Keybind["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8c"]["Text"] = [[...]];
						Keybind["8c"]["Name"] = [[Keybind]];
						Keybind["8c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings
						Keybind["8d"] = Instance.new("Frame", Keybind["8a"]);
						Keybind["8d"]["Visible"] = false;
						Keybind["8d"]["BorderSizePixel"] = 0;
						Keybind["8d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						Keybind["8d"]["AnchorPoint"] = Vector2.new(0.5, 0);
						Keybind["8d"]["Size"] = UDim2.new(0, 50, 0, 50);
						Keybind["8d"]["Position"] = UDim2.new(0.5, 0, 1, 1);
						Keybind["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8d"]["Name"] = [[Settings]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline
						Keybind["8e"] = Instance.new("Frame", Keybind["8d"]);
						Keybind["8e"]["BorderSizePixel"] = 0;
						Keybind["8e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["8e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8e"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["8e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8e"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main
						Keybind["8f"] = Instance.new("Frame", Keybind["8e"]);
						Keybind["8f"]["BorderSizePixel"] = 0;
						Keybind["8f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["8f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8f"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["8f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["8f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8f"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIGradient
						Keybind["90"] = Instance.new("UIGradient", Keybind["8f"]);
						Keybind["90"]["Rotation"] = 90;
						Keybind["90"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIListLayout
						Keybind["91"] = Instance.new("UIListLayout", Keybind["8f"]);
						Keybind["91"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
						Keybind["91"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
						Keybind["91"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
						Keybind["91"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Always
						Keybind["92"] = Instance.new("TextButton", Keybind["8f"]);
						Keybind["92"]["TextStrokeTransparency"] = 0;
						Keybind["92"]["BorderSizePixel"] = 0;
						Keybind["92"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["92"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["92"]["TextSize"] = 12;
						Keybind["92"]["BackgroundColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["92"]["Size"] = UDim2.new(0, 200, 0, 50);
						Keybind["92"]["BackgroundTransparency"] = 1;
						Keybind["92"]["Name"] = [[Always]];
						Keybind["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["92"]["Text"] = [[always]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Toggle
						Keybind["93"] = Instance.new("TextButton", Keybind["8f"]);
						Keybind["93"]["TextStrokeTransparency"] = 0;
						Keybind["93"]["BorderSizePixel"] = 0;
						Keybind["93"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["93"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["93"]["TextSize"] = 12;
						Keybind["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["93"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["93"]["Size"] = UDim2.new(0, 200, 0, 50);
						Keybind["93"]["BackgroundTransparency"] = 1;
						Keybind["93"]["Name"] = [[Toggle]];
						Keybind["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["93"]["Text"] = [[toggle]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.OnHold
						Keybind["94"] = Instance.new("TextButton", Keybind["8f"]);
						Keybind["94"]["TextStrokeTransparency"] = 0;
						Keybind["94"]["BorderSizePixel"] = 0;
						Keybind["94"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["94"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["94"]["TextSize"] = 12;
						Keybind["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["94"]["Size"] = UDim2.new(0, 200, 0, 50);
						Keybind["94"]["BackgroundTransparency"] = 1;
						Keybind["94"]["Name"] = [[OnHold]];
						Keybind["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["94"]["Text"] = [[on hold]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.SetKeybindButton
						Keybind["95"] = Instance.new("TextButton", Keybind["88"]);
						Keybind["95"]["BorderSizePixel"] = 0;
						Keybind["95"]["ZIndex"] = 5
						Keybind["95"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["95"]["TextTransparency"] = 1;
						Keybind["95"]["TextSize"] = 14;
						Keybind["95"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["95"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["95"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["95"]["Size"] = UDim2.new(1, 0, 1, 0);
						Keybind["95"]["BackgroundTransparency"] = 1;
						Keybind["95"]["Name"] = [[SetKeybindButton]];
						Keybind["95"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["95"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					end

					do -- logic				

						local hold = false
						local onhold = false
						local opened = false
						local activecolor = Color3.fromRGB(255, 255, 255)
						local notactivecolor = Color3.fromRGB(92, 92, 92)
						local activebutton = "button92"

						local shorts = {
							RightAlt = "RA",
							LeftAlt = "LA",
							RightControl = "RC",
							LeftControl = "LC",
							LeftShift = "LS",
							RightShift = "RS",
							MouseButton1 = "M1",
							MouseButton2 = "M2",
							Return = "ENT",
							Backspace = "BP",
							Tab = "TAB",
							CapsLock = "CL",
							Escape = "ESC",
							Insert = "INS",
							PageUp = "UP",
							PageDown = "DOWN",
							KeypadMultiply = "*",
							KeypadDivide = "/",
							End = "END",
							Unknown = "?",
							World95 = "?"
						}

						local ignored = {
							W = true,
							A = true,
							S = true,
							D = true,
							Space = true,
							F = true,
							R = true
						}

						Keybind["8c"].Text = tostring(shorts[option.key.Name]) or tostring(option.key.Name)
						if Keybind["8c"].Text:match("nil") then
							Keybind["8c"].Text = tostring(option.key.Name)
						end

						local newBindButtonSize =
							game:GetService("TextService"):GetTextSize(
								Keybind["8c"].Text,
								Keybind["8c"].TextSize,
								Keybind["8c"].Font,
								Vector2.new(math.huge, math.huge)
							)
						Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)

						Keybind["95"].MouseButton2Click:Connect(function()
							if opened == true then
								Keybind["8d"].Visible = false
								opened = false
							elseif opened == false then
								Keybind["8d"].Visible = true
								opened = true
							end
						end)

						Keybind["92"].MouseButton1Click:Connect(function()
							if activebutton ~= "button92" then
								if activebutton == "button93" then
									Keybind["93"].TextColor3 = notactivecolor
								elseif activebutton == "button94" then
									Keybind["94"].TextColor3 = notactivecolor
								end	
							end

							Keybind["92"].TextColor3 = activecolor
							activebutton = "button92"
						end)

						Keybind["93"].MouseButton1Click:Connect(function()
							if activebutton ~= "button93" then
								if activebutton == "button92" then
									Keybind["92"].TextColor3 = notactivecolor
								elseif activebutton == "button94" then
									Keybind["94"].TextColor3 = notactivecolor
								end						
							end

							Keybind["93"].TextColor3 = activecolor
							activebutton = "button93"
						end)



						Keybind["94"].MouseButton1Click:Connect(function()
							if activebutton ~= "button94" then
								if activebutton == "button92" then
									Keybind["92"].TextColor3 = notactivecolor
								elseif activebutton == "button93" then
									Keybind["93"].TextColor3 = notactivecolor
								end	
							end

							Keybind["94"].TextColor3 = activecolor
							activebutton = "button94"
						end)

						Keybind["95"].MouseButton1Click:Connect(function()
							hold = true
							if hold == true then
								Keybind["8c"].Text = " ... "
								local newBindButtonSize =
									game:GetService("TextService"):GetTextSize(
										Keybind["8c"].Text,
										Keybind["8c"].TextSize,
										Keybind["8c"].Font,
										Vector2.new(math.huge, math.huge)
									)
								Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
								local Input
								repeat Input = game:GetService("UserInputService").InputBegan:Wait() until not ignored[Input.KeyCode.Name] do end
								if Input.KeyCode.Name ~= "Unknown" and not ignored[Input.KeyCode.Name] then
									local K = shorts[Input.KeyCode.Name] or Input.KeyCode.Name
									Keybind["8c"].Text = K
									option.key = Input.KeyCode
									local newBindButtonSize =
										game:GetService("TextService"):GetTextSize(
											Keybind["8c"].Text,
											Keybind["8c"].TextSize,
											Keybind["8c"].Font,
											Vector2.new(math.huge, math.huge)
										)
									Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
									Library.Flags[option.flag] = option.key.Name									
								end
							end
							wait()
							hold = false
						end)

						local basiccolor = Color3.fromRGB(31,31,31)
						local accentcolor = Color3.fromRGB(255,255,255)

						if activebutton == "button92" then
						end

						local state = hopster.state

						UserInputService.InputBegan:Connect(function(k, t)
							if activebutton == "button93" then
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if not option.hold then
											hopster:SetValue(not hopster.state)
										end
									end
								end
							elseif activebutton == "button94" then
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if not option.hold then
											if not onhold then
												onhold = true
												hopster:SetValue(not hopster.state)
											end
										end
									end
								end
							end
						end)

						UserInputService.InputEnded:Connect(function(k, t)
							if activebutton == "button94" then
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if not option.hold then
											if onhold then
												onhold = false
												hopster:SetValue(not hopster.state)
											end
										end
									end
								end
							end
						end)


						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.key.Name
							Library.Items[option.flag] = option
						end

						function option:SetValue(key)
							option.key = key
							local text = shorts[option.key.Name] or option.key.Name
							Keybind["8c"].Text = text
							local newBindButtonSize =
								game:GetService("TextService"):GetTextSize(
									Keybind["8c"].Text,
									Keybind["8c"].TextSize,
									Keybind["8c"].Font,
									Vector2.new(math.huge, math.huge)
								)
							Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
							Library.Flags[option.flag] = option.key.Name
						end
					end

					return Keybind
				end

				function Toggle:AddColorpicker(option)
					option = typeof(option) == "table" and option or {}
					option.text = option.text or "New Color" or "nil"
					option.color = option.color or Color3.fromRGB(255, 255, 255)
					option.transparency = typeof(option.transparency) == "number" and option.transparency or typeof(option.transparency) == "boolean" and option.transparency or false
					option.flag = option.flag or option.text
					option.callback = option.callback or function() end
					option.transparencyCallback = option.transparencyCallback or function() end
					option.utilitytype = "color"

					local ColorPicker = {}

					do -- colorpicker
						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder
						ColorPicker["5b"] = Instance.new("Frame", Toggle["2f"]);
						ColorPicker["5b"]["ZIndex"] = 999;
						ColorPicker["5b"]["BorderSizePixel"] = 0;
						ColorPicker["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5b"]["Size"] = UDim2.new(0, 25, 0, 15);
						ColorPicker["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5b"]["Name"] = [[ColorpickerHolder]];
						ColorPicker["5b"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline
						ColorPicker["5d"] = Instance.new("Frame", ColorPicker["5b"]);
						ColorPicker["5d"]["BorderSizePixel"] = 0;
						ColorPicker["5d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["5d"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["5d"]["Size"] = UDim2.new(0, 25, 1, 0);
						ColorPicker["5d"]["Position"] = UDim2.new(1, 0, 0, 0);
						ColorPicker["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5d"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine
						ColorPicker["5e"] = Instance.new("Frame", ColorPicker["5d"]);
						ColorPicker["5e"]["BorderSizePixel"] = 0;
						ColorPicker["5e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5e"]["Name"] = [[InnerLine]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display
						ColorPicker["5f"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["5f"]["ZIndex"] = 2;
						ColorPicker["5f"]["BorderSizePixel"] = 0;
						ColorPicker["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5f"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5f"]["Name"] = [[Display]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display.UIGradient
						ColorPicker["60"] = Instance.new("UIGradient", ColorPicker["5f"]);
						ColorPicker["60"]["Rotation"] = 90;
						ColorPicker["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerButton
						ColorPicker["61"] = Instance.new("TextButton", ColorPicker["5e"]);
						ColorPicker["61"]["BorderSizePixel"] = 0;
						ColorPicker["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["TextTransparency"] = 1;
						ColorPicker["61"]["AutoButtonColor"] = false;
						ColorPicker["61"]["TextSize"] = 14;
						ColorPicker["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["61"]["Size"] = UDim2.new(1, 0, 1, 0);
						ColorPicker["61"]["BackgroundTransparency"] = 1;
						ColorPicker["61"]["Name"] = [[ColorPickerButton]];
						ColorPicker["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain
						ColorPicker["62"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["62"]["Visible"] = false;
						ColorPicker["62"]["ZIndex"] = 10000;
						ColorPicker["62"]["BorderSizePixel"] = 0;
						ColorPicker["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["62"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["62"]["Size"] = UDim2.new(0, 125, 0, 150);
						ColorPicker["62"]["Position"] = UDim2.new(0, -1, 0, -1);
						ColorPicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["62"]["Name"] = [[ColorPickerMain]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline
						ColorPicker["63"] = Instance.new("Frame", ColorPicker["62"]);
						ColorPicker["63"]["BorderSizePixel"] = 0;
						ColorPicker["63"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["63"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["63"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main
						ColorPicker["64"] = Instance.new("Frame", ColorPicker["63"]);
						ColorPicker["64"]["BorderSizePixel"] = 0;
						ColorPicker["64"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["64"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["64"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["64"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIGradient
						ColorPicker["65"] = Instance.new("UIGradient", ColorPicker["64"]);
						ColorPicker["65"]["Rotation"] = 90;
						ColorPicker["65"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIPadding
						ColorPicker["66"] = Instance.new("UIPadding", ColorPicker["64"]);
						ColorPicker["66"]["PaddingTop"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingRight"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingLeft"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingBottom"] = UDim.new(0, 3);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder
						ColorPicker["67"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["67"]["BorderSizePixel"] = 0;
						ColorPicker["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["67"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["67"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["67"]["Position"] = UDim2.new(0, 0, 1, 0);
						ColorPicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["67"]["Name"] = [[RGBtextHolder]];
						ColorPicker["67"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.UIListLayout
						ColorPicker["68"] = Instance.new("UIListLayout", ColorPicker["67"]);
						ColorPicker["68"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
						ColorPicker["68"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["Padding"] = UDim.new(0, 1);
						ColorPicker["68"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
						ColorPicker["68"]["FillDirection"] = Enum.FillDirection.Horizontal;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R
						ColorPicker["69"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["69"]["BorderSizePixel"] = 0;
						ColorPicker["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["69"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["69"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["69"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["69"]["Name"] = [[R]];
						ColorPicker["69"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline
						ColorPicker["6a"] = Instance.new("Frame", ColorPicker["69"]);
						ColorPicker["6a"]["BorderSizePixel"] = 0;
						ColorPicker["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6a"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6a"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline
						ColorPicker["6b"] = Instance.new("Frame", ColorPicker["6a"]);
						ColorPicker["6b"]["BorderSizePixel"] = 0;
						ColorPicker["6b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6b"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6b"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main
						ColorPicker["6c"] = Instance.new("Frame", ColorPicker["6b"]);
						ColorPicker["6c"]["BorderSizePixel"] = 0;
						ColorPicker["6c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6c"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6c"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.R
						ColorPicker["6d"] = Instance.new("TextBox", ColorPicker["6c"]);
						ColorPicker["6d"]["TextStrokeTransparency"] = 0;
						ColorPicker["6d"]["Name"] = [[R]];
						ColorPicker["6d"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["6d"]["BorderSizePixel"] = 0;
						ColorPicker["6d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["6d"]["TextSize"] = 13;
						ColorPicker["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6d"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6d"]["Text"] = [[255]];
						ColorPicker["6d"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.UIGradient
						ColorPicker["6e"] = Instance.new("UIGradient", ColorPicker["6c"]);
						ColorPicker["6e"]["Rotation"] = 90;
						ColorPicker["6e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G
						ColorPicker["6f"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["6f"]["BorderSizePixel"] = 0;
						ColorPicker["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6f"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["6f"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["6f"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6f"]["Name"] = [[G]];
						ColorPicker["6f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline
						ColorPicker["70"] = Instance.new("Frame", ColorPicker["6f"]);
						ColorPicker["70"]["BorderSizePixel"] = 0;
						ColorPicker["70"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["70"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["70"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["70"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline
						ColorPicker["71"] = Instance.new("Frame", ColorPicker["70"]);
						ColorPicker["71"]["BorderSizePixel"] = 0;
						ColorPicker["71"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["71"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["71"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main
						ColorPicker["72"] = Instance.new("Frame", ColorPicker["71"]);
						ColorPicker["72"]["BorderSizePixel"] = 0;
						ColorPicker["72"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["72"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["72"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["72"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.G
						ColorPicker["73"] = Instance.new("TextBox", ColorPicker["72"]);
						ColorPicker["73"]["TextStrokeTransparency"] = 0;
						ColorPicker["73"]["Name"] = [[G]];
						ColorPicker["73"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["73"]["BorderSizePixel"] = 0;
						ColorPicker["73"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["73"]["TextSize"] = 13;
						ColorPicker["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["73"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["73"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["73"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["73"]["Text"] = [[255]];
						ColorPicker["73"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.UIGradient
						ColorPicker["74"] = Instance.new("UIGradient", ColorPicker["72"]);
						ColorPicker["74"]["Rotation"] = 90;
						ColorPicker["74"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B
						ColorPicker["75"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["75"]["BorderSizePixel"] = 0;
						ColorPicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["75"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["75"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["75"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["75"]["Name"] = [[B]];
						ColorPicker["75"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline
						ColorPicker["76"] = Instance.new("Frame", ColorPicker["75"]);
						ColorPicker["76"]["BorderSizePixel"] = 0;
						ColorPicker["76"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["76"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["76"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["76"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline
						ColorPicker["77"] = Instance.new("Frame", ColorPicker["76"]);
						ColorPicker["77"]["BorderSizePixel"] = 0;
						ColorPicker["77"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["77"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["77"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main
						ColorPicker["78"] = Instance.new("Frame", ColorPicker["77"]);
						ColorPicker["78"]["BorderSizePixel"] = 0;
						ColorPicker["78"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["78"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["78"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.B
						ColorPicker["79"] = Instance.new("TextBox", ColorPicker["78"]);
						ColorPicker["79"]["TextStrokeTransparency"] = 0;
						ColorPicker["79"]["Name"] = [[B]];
						ColorPicker["79"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["79"]["BorderSizePixel"] = 0;
						ColorPicker["79"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["79"]["TextSize"] = 13;
						ColorPicker["79"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["79"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["79"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["79"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["79"]["Text"] = [[255]];
						ColorPicker["79"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.UIGradient
						ColorPicker["7a"] = Instance.new("UIGradient", ColorPicker["78"]);
						ColorPicker["7a"]["Rotation"] = 90;
						ColorPicker["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue
						ColorPicker["7b"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7b"]["BorderSizePixel"] = 0;
						ColorPicker["7b"]["AutoButtonColor"] = false;
						ColorPicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7b"]["Selectable"] = false;
						ColorPicker["7b"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["7b"]["Image"] = [[rbxassetid://2615692420]];
						ColorPicker["7b"]["Size"] = UDim2.new(0, 15, 0, 95);
						ColorPicker["7b"]["Name"] = [[Hue]];
						ColorPicker["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7b"]["Position"] = UDim2.new(1, 0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue.huecursor
						ColorPicker["7c"] = Instance.new("Frame", ColorPicker["7b"]);
						ColorPicker["7c"]["BorderSizePixel"] = 0;
						ColorPicker["7c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["7c"]["AnchorPoint"] = Vector2.new(0.5, 0);
						ColorPicker["7c"]["Size"] = UDim2.new(1, 6, 0, 3);
						ColorPicker["7c"]["Position"] = UDim2.new(0.5, 0, 0, 0);
						ColorPicker["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7c"]["Name"] = [[huecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme
						ColorPicker["7d"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7d"]["BorderSizePixel"] = 0;
						ColorPicker["7d"]["AutoButtonColor"] = false;
						ColorPicker["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7d"]["Selectable"] = false;
						ColorPicker["7d"]["Image"] = [[rbxassetid://2615689005]];
						ColorPicker["7d"]["Size"] = UDim2.new(0, 95, 0, 95);
						ColorPicker["7d"]["Name"] = [[Scheme]];
						ColorPicker["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme.schemecursor
						ColorPicker["7e"] = Instance.new("ImageLabel", ColorPicker["7d"]);
						ColorPicker["7e"]["ZIndex"] = 5;
						ColorPicker["7e"]["BorderSizePixel"] = 0;
						ColorPicker["7e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["Image"] = [[http://www.roblox.com/asset/?id=16006380635]];
						ColorPicker["7e"]["ImageRectSize"] = Vector2.new(1000, 1000);
						ColorPicker["7e"]["Size"] = UDim2.new(0, 5, 0, 5);
						ColorPicker["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["BackgroundTransparency"] = 1;
						ColorPicker["7e"]["Name"] = [[schemecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency
						ColorPicker["7f"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["7f"]["BorderSizePixel"] = 0;
						ColorPicker["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7f"]["AnchorPoint"] = Vector2.new(0.5, 1);
						ColorPicker["7f"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["7f"]["Position"] = UDim2.new(0.5, 0, 1, -20);
						ColorPicker["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7f"]["Name"] = [[Transparency]];
						ColorPicker["7f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline
						ColorPicker["80"] = Instance.new("Frame", ColorPicker["7f"]);
						ColorPicker["80"]["BorderSizePixel"] = 0;
						ColorPicker["80"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["80"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["80"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["80"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline
						ColorPicker["81"] = Instance.new("Frame", ColorPicker["80"]);
						ColorPicker["81"]["BorderSizePixel"] = 0;
						ColorPicker["81"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["81"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["81"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["81"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main
						ColorPicker["82"] = Instance.new("Frame", ColorPicker["81"]);
						ColorPicker["82"]["BorderSizePixel"] = 0;
						ColorPicker["82"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["82"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["82"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["82"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.Transparency
						ColorPicker["83"] = Instance.new("TextBox", ColorPicker["82"]);
						ColorPicker["83"]["TextStrokeTransparency"] = 0;
						ColorPicker["83"]["Name"] = [[Transparency]];
						ColorPicker["83"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["83"]["BorderSizePixel"] = 0;
						ColorPicker["83"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["83"]["TextSize"] = 13;
						ColorPicker["83"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["83"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["83"]["PlaceholderText"] = [[Transparency:]];
						ColorPicker["83"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["83"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["83"]["Text"] = [[100]];
						ColorPicker["83"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.UIGradient
						ColorPicker["84"] = Instance.new("UIGradient", ColorPicker["82"]);
						ColorPicker["84"]["Rotation"] = 90;
						ColorPicker["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};

						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Frame
						ColorPicker["86"] = Instance.new("ImageLabel", ColorPicker["5e"]);
						ColorPicker["86"]["BorderSizePixel"] = 0;
						ColorPicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["86"]["ScaleType"] = Enum.ScaleType.Crop;
						ColorPicker["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["86"]["Image"] = [[rbxassetid://98372645101260]];
						ColorPicker["86"]["ImageRectSize"] = Vector2.new(100, 100);
						ColorPicker["86"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["86"]["Name"] = [[Frame]];
						ColorPicker["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					end

					do -- logic
						local opened = false

						ColorPicker["61"].MouseButton1Click:Connect(function()
							ColorPicker["62"].Visible = not opened
							opened = not opened
						end)

						local colorPickerMain = ColorPicker["62"]
						local scrollFrame = Tab["1e"]

						-- Function to update position and anchor point
						local function updatePosition()
							local pickerAbsPos = colorPickerMain.AbsolutePosition
							local scrollFrameAbsPos = scrollFrame.AbsolutePosition
							local scrollFrameSize = scrollFrame.AbsoluteSize

							-- Check if touching the top
							if pickerAbsPos.Y < scrollFrameAbsPos.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 1, 1) -- Position at the top
								colorPickerMain.AnchorPoint = Vector2.new(0, 0) -- Anchor point at the top
								print("Moved to top with AnchorPoint 0,0 and Position {0, -1}, {1, 1}")
							end

							-- Check if touching the bottom
							if pickerAbsPos.Y + colorPickerMain.AbsoluteSize.Y > scrollFrameAbsPos.Y + scrollFrameSize.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 0, -1) -- Position at the bottom
								colorPickerMain.AnchorPoint = Vector2.new(0, 1) -- Anchor point at the bottom
								print("Moved to bottom with AnchorPoint 0,1 and Position {0, -1}, {0, -1}")
							end
						end

						-- Connect to the RenderStepped event for constant checking
						game:GetService("RunService").RenderStepped:Connect(updatePosition)

						local white, black = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
						local colors = {
							Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0),
							Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0)
						}

						local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
						local UserInputService = game:GetService("UserInputService")

						-- UI elements
						local Schema = ColorPicker["7d"] -- Gradient area
						local SchemaCursor = ColorPicker["7e"] -- Cursor for the scheme
						local HUE = ColorPicker["7b"] -- Hue bar
						local HueCursor = ColorPicker["7c"] -- Cursor for the hue bar
						local Display = ColorPicker["5f"] -- Color display
						local TransparencyTextBox = ColorPicker["83"] -- Transparency input box
						local TextBoxR = ColorPicker["6d"] -- Red input box
						local TextBoxG = ColorPicker["73"] -- Green input box
						local TextBoxB = ColorPicker["79"] -- Blue input box

						-- Function: Convert RGB to HSV
						local function rgbToHSV(color)
							local r, g, b = color.R, color.G, color.B
							local max, min = math.max(r, g, b), math.min(r, g, b)
							local delta = max - min

							local h = 0
							if delta > 0 then
								if max == r then
									h = (g - b) / delta % 6
								elseif max == g then
									h = (b - r) / delta + 2
								elseif max == b then
									h = (r - g) / delta + 4
								end
								h = h / 6
							end

							local s = (max == 0) and 0 or delta / max
							local v = max
							return h, s, v
						end

						-- Function: Clamp a value between min and max
						local function clamp(value, min, max)
							return math.max(min, math.min(max, value))
						end

						-- Function: Update the color display
						local function updateColor(outputColor)
							if typeof(outputColor) ~= "Color3" then
								error("Invalid color value: Expected Color3, got " .. typeof(outputColor))
							end

							Display.BackgroundColor3 = outputColor
							option.color = outputColor

							local r = math.floor(outputColor.R * 255 + 0.5)
							local g = math.floor(outputColor.G * 255 + 0.5)
							local b = math.floor(outputColor.B * 255 + 0.5)

							TextBoxR.Text = tostring(r)
							TextBoxG.Text = tostring(g)
							TextBoxB.Text = tostring(b)

							if option.callback then
								option.callback(outputColor)
							end
						end

						-- Function to update the hue-based color dynamically
						local function updateHueColor(huePercent)
							-- Calculate the color from the hue percentage
							local hueColor = Color3.fromHSV(huePercent, 1, 1)

							-- Update the scheme's background color to reflect the hue
							Schema.BackgroundColor3 = hueColor

							-- Calculate the scheme cursor's position and update the final color
							local xP = math.clamp((SchemaCursor.AbsolutePosition.X - Schema.AbsolutePosition.X) / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp((SchemaCursor.AbsolutePosition.Y - Schema.AbsolutePosition.Y) / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(hueColor, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function to update the scheme-based color dynamically
						local function updateSchemeColor(relativeX, relativeY)
							-- Calculate the interpolated color based on cursor position
							local xP = math.clamp(relativeX / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp(relativeY / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(Schema.BackgroundColor3, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function: Sync color picker cursors and display based on a Color3 value
						local function syncColor()
							local h, s, v = rgbToHSV(option.color)

							local huePosition = h * HUE.AbsoluteSize.Y
							HueCursor.Position = UDim2.new(0.5, 0, 0, huePosition - (HueCursor.AbsoluteSize.Y / 2))

							local hueColor = Color3.fromHSV(h, 1, 1)
							Schema.BackgroundColor3 = hueColor

							local schemeX = s * Schema.AbsoluteSize.X
							local schemeY = (1 - v) * Schema.AbsoluteSize.Y
							SchemaCursor.Position = UDim2.new(0, schemeX - (SchemaCursor.AbsoluteSize.X / 2), 0, schemeY - (SchemaCursor.AbsoluteSize.Y / 2))

							updateColor(option.color)
						end

						-- Function: Update transparency
						local function updateTransparency(transparencyValue)
							local clampedValue = clamp(transparencyValue, 0, 100)
							local callbackValue = 1 - (clampedValue / 100)

							Display.BackgroundTransparency = callbackValue
							option.transparency = clampedValue

							if option.transparencyCallback then
								option.transparencyCallback(callbackValue)
							end

							TransparencyTextBox.Text = tostring(clampedValue)
						end

						-- Connect transparency TextBox changes
						TransparencyTextBox.FocusLost:Connect(function()
							local transparencyValue = tonumber(TransparencyTextBox.Text)
							if transparencyValue then
								updateTransparency(transparencyValue)
							else
								TransparencyTextBox.Text = tostring(option.transparency)
							end
						end)

						TransparencyTextBox:GetPropertyChangedSignal("Text"):Connect(function()
							local inputText = TransparencyTextBox.Text
							if not tonumber(inputText) and inputText ~= "" then
								TransparencyTextBox.Text = inputText:gsub("%D", "")
							end
						end)

						-- Function: Handle RGB input changes
						local function handleRGBInputChange(textBox, component)
							textBox.FocusLost:Connect(function()
								local inputValue = tonumber(textBox.Text)
								if inputValue then
									local r = component == "R" and inputValue or math.floor(option.color.R * 255 + 0.5)
									local g = component == "G" and inputValue or math.floor(option.color.G * 255 + 0.5)
									local b = component == "B" and inputValue or math.floor(option.color.B * 255 + 0.5)

									option.color = Color3.fromRGB(clamp(r, 0, 255), clamp(g, 0, 255), clamp(b, 0, 255))
									syncColor()
								else
									textBox.Text = tostring(math.floor(option.color[component] * 255 + 0.5))
								end
							end)

							textBox:GetPropertyChangedSignal("Text"):Connect(function()
								local inputText = textBox.Text
								if not tonumber(inputText) and inputText ~= "" then
									textBox.Text = inputText:gsub("%D", "")
								end
							end)
						end

						-- Logic for interacting with the hue bar
						HUE.MouseButton1Down:Connect(function()
							-- Function to dynamically update the hue cursor and color
							local function updateHueCursor()
								local relativeY = math.clamp(Mouse.Y - HUE.AbsolutePosition.Y, 0, HUE.AbsoluteSize.Y)

								-- Correct the X offset: center the cursor horizontally within the hue bar
								HueCursor.Position = UDim2.new(0.5, 0, 0, relativeY - (HueCursor.AbsoluteSize.Y / 2))

								-- Calculate hue as a percentage (0 to 1) and update the color
								local huePercent = math.clamp(relativeY / HUE.AbsoluteSize.Y, 0, 1)
								updateHueColor(huePercent)
							end

							-- Initial update
							updateHueCursor()

							-- Connect mouse movement for dragging
							local hueConnection
							hueConnection = Mouse.Move:Connect(updateHueCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if hueConnection then
										hueConnection:Disconnect()
										hueConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						-- Logic for interacting with the scheme area
						Schema.MouseButton1Down:Connect(function()
							-- Function to dynamically update the scheme cursor and color
							local function updateSchemeCursor()
								local relativeX = math.clamp(Mouse.X - Schema.AbsolutePosition.X, 0, Schema.AbsoluteSize.X)
								local relativeY = math.clamp(Mouse.Y - Schema.AbsolutePosition.Y, 0, Schema.AbsoluteSize.Y)

								-- Update the cursor position
								SchemaCursor.Position = UDim2.new(0, relativeX - (SchemaCursor.AbsoluteSize.X / 2), 0, relativeY - (SchemaCursor.AbsoluteSize.Y / 2))

								-- Update the scheme-based color
								updateSchemeColor(relativeX, relativeY)
							end

							-- Initial update
							updateSchemeCursor()

							-- Connect mouse movement for dragging
							local schemeConnection
							schemeConnection = Mouse.Move:Connect(updateSchemeCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if schemeConnection then
										schemeConnection:Disconnect()
										schemeConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						handleRGBInputChange(TextBoxR, "R")
						handleRGBInputChange(TextBoxG, "G")
						handleRGBInputChange(TextBoxB, "B")

						-- Initialize color picker
						syncColor()
						updateTransparency(option.transparency)
					end

					return ColorPicker
				end

				function Toggle:AddColorpicker2(option)
					option = typeof(option) == "table" and option or {}
					option.text = option.text or "New Color" or "nil"
					option.color = option.color or Color3.fromRGB(255, 255, 255)
					option.transparency = typeof(option.transparency) == "number" and option.transparency or typeof(option.transparency) == "boolean" and option.transparency or false
					option.flag = option.flag or option.text
					option.callback = option.callback or function() end
					option.transparencyCallback = option.transparencyCallback or function() end
					option.utilitytype = "color"

					local ColorPicker = {}

					do -- colorpicker
						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder
						ColorPicker["5b"] = Instance.new("Frame", Toggle["2f"]);
						ColorPicker["5b"]["ZIndex"] = 999;
						ColorPicker["5b"]["BorderSizePixel"] = 0;
						ColorPicker["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5b"]["Size"] = UDim2.new(0, 25, 0, 15);
						ColorPicker["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5b"]["Name"] = [[ColorpickerHolder]];
						ColorPicker["5b"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline
						ColorPicker["5d"] = Instance.new("Frame", ColorPicker["5b"]);
						ColorPicker["5d"]["BorderSizePixel"] = 0;
						ColorPicker["5d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["5d"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["5d"]["Size"] = UDim2.new(0, 25, 1, 0);
						ColorPicker["5d"]["Position"] = UDim2.new(1, 0, 0, 0);
						ColorPicker["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5d"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine
						ColorPicker["5e"] = Instance.new("Frame", ColorPicker["5d"]);
						ColorPicker["5e"]["BorderSizePixel"] = 0;
						ColorPicker["5e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5e"]["Name"] = [[InnerLine]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display
						ColorPicker["5f"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["5f"]["ZIndex"] = 2;
						ColorPicker["5f"]["BorderSizePixel"] = 0;
						ColorPicker["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5f"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5f"]["Name"] = [[Display]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display.UIGradient
						ColorPicker["60"] = Instance.new("UIGradient", ColorPicker["5f"]);
						ColorPicker["60"]["Rotation"] = 90;
						ColorPicker["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerButton
						ColorPicker["61"] = Instance.new("TextButton", ColorPicker["5e"]);
						ColorPicker["61"]["BorderSizePixel"] = 0;
						ColorPicker["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["TextTransparency"] = 1;
						ColorPicker["61"]["AutoButtonColor"] = false;
						ColorPicker["61"]["TextSize"] = 14;
						ColorPicker["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["61"]["Size"] = UDim2.new(1, 0, 1, 0);
						ColorPicker["61"]["BackgroundTransparency"] = 1;
						ColorPicker["61"]["Name"] = [[ColorPickerButton]];
						ColorPicker["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain
						ColorPicker["62"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["62"]["Visible"] = false;
						ColorPicker["62"]["ZIndex"] = 10000;
						ColorPicker["62"]["BorderSizePixel"] = 0;
						ColorPicker["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["62"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["62"]["Size"] = UDim2.new(0, 125, 0, 150);
						ColorPicker["62"]["Position"] = UDim2.new(0, -1, 0, -1);
						ColorPicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["62"]["Name"] = [[ColorPickerMain]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline
						ColorPicker["63"] = Instance.new("Frame", ColorPicker["62"]);
						ColorPicker["63"]["BorderSizePixel"] = 0;
						ColorPicker["63"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["63"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["63"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main
						ColorPicker["64"] = Instance.new("Frame", ColorPicker["63"]);
						ColorPicker["64"]["BorderSizePixel"] = 0;
						ColorPicker["64"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["64"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["64"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["64"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIGradient
						ColorPicker["65"] = Instance.new("UIGradient", ColorPicker["64"]);
						ColorPicker["65"]["Rotation"] = 90;
						ColorPicker["65"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIPadding
						ColorPicker["66"] = Instance.new("UIPadding", ColorPicker["64"]);
						ColorPicker["66"]["PaddingTop"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingRight"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingLeft"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingBottom"] = UDim.new(0, 3);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder
						ColorPicker["67"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["67"]["BorderSizePixel"] = 0;
						ColorPicker["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["67"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["67"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["67"]["Position"] = UDim2.new(0, 0, 1, 0);
						ColorPicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["67"]["Name"] = [[RGBtextHolder]];
						ColorPicker["67"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.UIListLayout
						ColorPicker["68"] = Instance.new("UIListLayout", ColorPicker["67"]);
						ColorPicker["68"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
						ColorPicker["68"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["Padding"] = UDim.new(0, 1);
						ColorPicker["68"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
						ColorPicker["68"]["FillDirection"] = Enum.FillDirection.Horizontal;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R
						ColorPicker["69"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["69"]["BorderSizePixel"] = 0;
						ColorPicker["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["69"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["69"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["69"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["69"]["Name"] = [[R]];
						ColorPicker["69"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline
						ColorPicker["6a"] = Instance.new("Frame", ColorPicker["69"]);
						ColorPicker["6a"]["BorderSizePixel"] = 0;
						ColorPicker["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6a"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6a"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline
						ColorPicker["6b"] = Instance.new("Frame", ColorPicker["6a"]);
						ColorPicker["6b"]["BorderSizePixel"] = 0;
						ColorPicker["6b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6b"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6b"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main
						ColorPicker["6c"] = Instance.new("Frame", ColorPicker["6b"]);
						ColorPicker["6c"]["BorderSizePixel"] = 0;
						ColorPicker["6c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6c"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6c"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.R
						ColorPicker["6d"] = Instance.new("TextBox", ColorPicker["6c"]);
						ColorPicker["6d"]["TextStrokeTransparency"] = 0;
						ColorPicker["6d"]["Name"] = [[R]];
						ColorPicker["6d"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["6d"]["BorderSizePixel"] = 0;
						ColorPicker["6d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["6d"]["TextSize"] = 13;
						ColorPicker["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6d"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6d"]["Text"] = [[255]];
						ColorPicker["6d"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.UIGradient
						ColorPicker["6e"] = Instance.new("UIGradient", ColorPicker["6c"]);
						ColorPicker["6e"]["Rotation"] = 90;
						ColorPicker["6e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G
						ColorPicker["6f"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["6f"]["BorderSizePixel"] = 0;
						ColorPicker["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6f"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["6f"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["6f"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6f"]["Name"] = [[G]];
						ColorPicker["6f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline
						ColorPicker["70"] = Instance.new("Frame", ColorPicker["6f"]);
						ColorPicker["70"]["BorderSizePixel"] = 0;
						ColorPicker["70"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["70"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["70"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["70"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline
						ColorPicker["71"] = Instance.new("Frame", ColorPicker["70"]);
						ColorPicker["71"]["BorderSizePixel"] = 0;
						ColorPicker["71"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["71"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["71"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main
						ColorPicker["72"] = Instance.new("Frame", ColorPicker["71"]);
						ColorPicker["72"]["BorderSizePixel"] = 0;
						ColorPicker["72"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["72"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["72"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["72"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.G
						ColorPicker["73"] = Instance.new("TextBox", ColorPicker["72"]);
						ColorPicker["73"]["TextStrokeTransparency"] = 0;
						ColorPicker["73"]["Name"] = [[G]];
						ColorPicker["73"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["73"]["BorderSizePixel"] = 0;
						ColorPicker["73"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["73"]["TextSize"] = 13;
						ColorPicker["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["73"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["73"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["73"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["73"]["Text"] = [[255]];
						ColorPicker["73"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.UIGradient
						ColorPicker["74"] = Instance.new("UIGradient", ColorPicker["72"]);
						ColorPicker["74"]["Rotation"] = 90;
						ColorPicker["74"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B
						ColorPicker["75"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["75"]["BorderSizePixel"] = 0;
						ColorPicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["75"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["75"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["75"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["75"]["Name"] = [[B]];
						ColorPicker["75"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline
						ColorPicker["76"] = Instance.new("Frame", ColorPicker["75"]);
						ColorPicker["76"]["BorderSizePixel"] = 0;
						ColorPicker["76"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["76"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["76"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["76"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline
						ColorPicker["77"] = Instance.new("Frame", ColorPicker["76"]);
						ColorPicker["77"]["BorderSizePixel"] = 0;
						ColorPicker["77"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["77"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["77"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main
						ColorPicker["78"] = Instance.new("Frame", ColorPicker["77"]);
						ColorPicker["78"]["BorderSizePixel"] = 0;
						ColorPicker["78"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["78"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["78"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.B
						ColorPicker["79"] = Instance.new("TextBox", ColorPicker["78"]);
						ColorPicker["79"]["TextStrokeTransparency"] = 0;
						ColorPicker["79"]["Name"] = [[B]];
						ColorPicker["79"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["79"]["BorderSizePixel"] = 0;
						ColorPicker["79"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["79"]["TextSize"] = 13;
						ColorPicker["79"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["79"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["79"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["79"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["79"]["Text"] = [[255]];
						ColorPicker["79"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.UIGradient
						ColorPicker["7a"] = Instance.new("UIGradient", ColorPicker["78"]);
						ColorPicker["7a"]["Rotation"] = 90;
						ColorPicker["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue
						ColorPicker["7b"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7b"]["BorderSizePixel"] = 0;
						ColorPicker["7b"]["AutoButtonColor"] = false;
						ColorPicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7b"]["Selectable"] = false;
						ColorPicker["7b"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["7b"]["Image"] = [[rbxassetid://2615692420]];
						ColorPicker["7b"]["Size"] = UDim2.new(0, 15, 0, 95);
						ColorPicker["7b"]["Name"] = [[Hue]];
						ColorPicker["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7b"]["Position"] = UDim2.new(1, 0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue.huecursor
						ColorPicker["7c"] = Instance.new("Frame", ColorPicker["7b"]);
						ColorPicker["7c"]["BorderSizePixel"] = 0;
						ColorPicker["7c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["7c"]["AnchorPoint"] = Vector2.new(0.5, 0);
						ColorPicker["7c"]["Size"] = UDim2.new(1, 6, 0, 3);
						ColorPicker["7c"]["Position"] = UDim2.new(0.5, 0, 0, 0);
						ColorPicker["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7c"]["Name"] = [[huecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme
						ColorPicker["7d"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7d"]["BorderSizePixel"] = 0;
						ColorPicker["7d"]["AutoButtonColor"] = false;
						ColorPicker["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7d"]["Selectable"] = false;
						ColorPicker["7d"]["Image"] = [[rbxassetid://2615689005]];
						ColorPicker["7d"]["Size"] = UDim2.new(0, 95, 0, 95);
						ColorPicker["7d"]["Name"] = [[Scheme]];
						ColorPicker["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme.schemecursor
						ColorPicker["7e"] = Instance.new("ImageLabel", ColorPicker["7d"]);
						ColorPicker["7e"]["ZIndex"] = 5;
						ColorPicker["7e"]["BorderSizePixel"] = 0;
						ColorPicker["7e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["Image"] = [[http://www.roblox.com/asset/?id=16006380635]];
						ColorPicker["7e"]["ImageRectSize"] = Vector2.new(1000, 1000);
						ColorPicker["7e"]["Size"] = UDim2.new(0, 5, 0, 5);
						ColorPicker["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["BackgroundTransparency"] = 1;
						ColorPicker["7e"]["Name"] = [[schemecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency
						ColorPicker["7f"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["7f"]["BorderSizePixel"] = 0;
						ColorPicker["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7f"]["AnchorPoint"] = Vector2.new(0.5, 1);
						ColorPicker["7f"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["7f"]["Position"] = UDim2.new(0.5, 0, 1, -20);
						ColorPicker["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7f"]["Name"] = [[Transparency]];
						ColorPicker["7f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline
						ColorPicker["80"] = Instance.new("Frame", ColorPicker["7f"]);
						ColorPicker["80"]["BorderSizePixel"] = 0;
						ColorPicker["80"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["80"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["80"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["80"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline
						ColorPicker["81"] = Instance.new("Frame", ColorPicker["80"]);
						ColorPicker["81"]["BorderSizePixel"] = 0;
						ColorPicker["81"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["81"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["81"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["81"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main
						ColorPicker["82"] = Instance.new("Frame", ColorPicker["81"]);
						ColorPicker["82"]["BorderSizePixel"] = 0;
						ColorPicker["82"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["82"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["82"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["82"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.Transparency
						ColorPicker["83"] = Instance.new("TextBox", ColorPicker["82"]);
						ColorPicker["83"]["TextStrokeTransparency"] = 0;
						ColorPicker["83"]["Name"] = [[Transparency]];
						ColorPicker["83"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["83"]["BorderSizePixel"] = 0;
						ColorPicker["83"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["83"]["TextSize"] = 13;
						ColorPicker["83"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["83"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["83"]["PlaceholderText"] = [[Transparency:]];
						ColorPicker["83"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["83"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["83"]["Text"] = [[100]];
						ColorPicker["83"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.UIGradient
						ColorPicker["84"] = Instance.new("UIGradient", ColorPicker["82"]);
						ColorPicker["84"]["Rotation"] = 90;
						ColorPicker["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};

						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Frame
						ColorPicker["86"] = Instance.new("ImageLabel", ColorPicker["5e"]);
						ColorPicker["86"]["BorderSizePixel"] = 0;
						ColorPicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["86"]["ScaleType"] = Enum.ScaleType.Crop;
						ColorPicker["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["86"]["Image"] = [[rbxassetid://98372645101260]];
						ColorPicker["86"]["ImageRectSize"] = Vector2.new(100, 100);
						ColorPicker["86"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["86"]["Name"] = [[Frame]];
						ColorPicker["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					end

					do -- logic
						local opened = false

						ColorPicker["61"].MouseButton1Click:Connect(function()
							ColorPicker["62"].Visible = not opened
							opened = not opened
						end)

						local colorPickerMain = ColorPicker["62"]
						local scrollFrame = Tab["1e"]

						-- Function to update position and anchor point
						local function updatePosition()
							local pickerAbsPos = colorPickerMain.AbsolutePosition
							local scrollFrameAbsPos = scrollFrame.AbsolutePosition
							local scrollFrameSize = scrollFrame.AbsoluteSize

							-- Check if touching the top
							if pickerAbsPos.Y < scrollFrameAbsPos.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 1, 1) -- Position at the top
								colorPickerMain.AnchorPoint = Vector2.new(0, 0) -- Anchor point at the top
								print("Moved to top with AnchorPoint 0,0 and Position {0, -1}, {1, 1}")
							end

							-- Check if touching the bottom
							if pickerAbsPos.Y + colorPickerMain.AbsoluteSize.Y > scrollFrameAbsPos.Y + scrollFrameSize.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 0, -1) -- Position at the bottom
								colorPickerMain.AnchorPoint = Vector2.new(0, 1) -- Anchor point at the bottom
								print("Moved to bottom with AnchorPoint 0,1 and Position {0, -1}, {0, -1}")
							end
						end

						-- Connect to the RenderStepped event for constant checking
						game:GetService("RunService").RenderStepped:Connect(updatePosition)

						local white, black = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
						local colors = {
							Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0),
							Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0)
						}

						local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
						local UserInputService = game:GetService("UserInputService")

						-- UI elements
						local Schema = ColorPicker["7d"] -- Gradient area
						local SchemaCursor = ColorPicker["7e"] -- Cursor for the scheme
						local HUE = ColorPicker["7b"] -- Hue bar
						local HueCursor = ColorPicker["7c"] -- Cursor for the hue bar
						local Display = ColorPicker["5f"] -- Color display
						local TransparencyTextBox = ColorPicker["83"] -- Transparency input box
						local TextBoxR = ColorPicker["6d"] -- Red input box
						local TextBoxG = ColorPicker["73"] -- Green input box
						local TextBoxB = ColorPicker["79"] -- Blue input box

						-- Function: Convert RGB to HSV
						local function rgbToHSV(color)
							local r, g, b = color.R, color.G, color.B
							local max, min = math.max(r, g, b), math.min(r, g, b)
							local delta = max - min

							local h = 0
							if delta > 0 then
								if max == r then
									h = (g - b) / delta % 6
								elseif max == g then
									h = (b - r) / delta + 2
								elseif max == b then
									h = (r - g) / delta + 4
								end
								h = h / 6
							end

							local s = (max == 0) and 0 or delta / max
							local v = max
							return h, s, v
						end

						-- Function: Clamp a value between min and max
						local function clamp(value, min, max)
							return math.max(min, math.min(max, value))
						end

						-- Function: Update the color display
						local function updateColor(outputColor)
							if typeof(outputColor) ~= "Color3" then
								error("Invalid color value: Expected Color3, got " .. typeof(outputColor))
							end

							Display.BackgroundColor3 = outputColor
							option.color = outputColor

							local r = math.floor(outputColor.R * 255 + 0.5)
							local g = math.floor(outputColor.G * 255 + 0.5)
							local b = math.floor(outputColor.B * 255 + 0.5)

							TextBoxR.Text = tostring(r)
							TextBoxG.Text = tostring(g)
							TextBoxB.Text = tostring(b)

							if option.callback then
								option.callback(outputColor)
							end
						end

						-- Function to update the hue-based color dynamically
						local function updateHueColor(huePercent)
							-- Calculate the color from the hue percentage
							local hueColor = Color3.fromHSV(huePercent, 1, 1)

							-- Update the scheme's background color to reflect the hue
							Schema.BackgroundColor3 = hueColor

							-- Calculate the scheme cursor's position and update the final color
							local xP = math.clamp((SchemaCursor.AbsolutePosition.X - Schema.AbsolutePosition.X) / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp((SchemaCursor.AbsolutePosition.Y - Schema.AbsolutePosition.Y) / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(hueColor, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function to update the scheme-based color dynamically
						local function updateSchemeColor(relativeX, relativeY)
							-- Calculate the interpolated color based on cursor position
							local xP = math.clamp(relativeX / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp(relativeY / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(Schema.BackgroundColor3, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function: Sync color picker cursors and display based on a Color3 value
						local function syncColor()
							local h, s, v = rgbToHSV(option.color)

							local huePosition = h * HUE.AbsoluteSize.Y
							HueCursor.Position = UDim2.new(0.5, 0, 0, huePosition - (HueCursor.AbsoluteSize.Y / 2))

							local hueColor = Color3.fromHSV(h, 1, 1)
							Schema.BackgroundColor3 = hueColor

							local schemeX = s * Schema.AbsoluteSize.X
							local schemeY = (1 - v) * Schema.AbsoluteSize.Y
							SchemaCursor.Position = UDim2.new(0, schemeX - (SchemaCursor.AbsoluteSize.X / 2), 0, schemeY - (SchemaCursor.AbsoluteSize.Y / 2))

							updateColor(option.color)
						end

						-- Function: Update transparency
						local function updateTransparency(transparencyValue)
							local clampedValue = clamp(transparencyValue, 0, 100)
							local callbackValue = 1 - (clampedValue / 100)

							Display.BackgroundTransparency = callbackValue
							option.transparency = clampedValue

							if option.transparencyCallback then
								option.transparencyCallback(callbackValue)
							end

							TransparencyTextBox.Text = tostring(clampedValue)
						end

						-- Connect transparency TextBox changes
						TransparencyTextBox.FocusLost:Connect(function()
							local transparencyValue = tonumber(TransparencyTextBox.Text)
							if transparencyValue then
								updateTransparency(transparencyValue)
							else
								TransparencyTextBox.Text = tostring(option.transparency)
							end
						end)

						TransparencyTextBox:GetPropertyChangedSignal("Text"):Connect(function()
							local inputText = TransparencyTextBox.Text
							if not tonumber(inputText) and inputText ~= "" then
								TransparencyTextBox.Text = inputText:gsub("%D", "")
							end
						end)

						-- Function: Handle RGB input changes
						local function handleRGBInputChange(textBox, component)
							textBox.FocusLost:Connect(function()
								local inputValue = tonumber(textBox.Text)
								if inputValue then
									local r = component == "R" and inputValue or math.floor(option.color.R * 255 + 0.5)
									local g = component == "G" and inputValue or math.floor(option.color.G * 255 + 0.5)
									local b = component == "B" and inputValue or math.floor(option.color.B * 255 + 0.5)

									option.color = Color3.fromRGB(clamp(r, 0, 255), clamp(g, 0, 255), clamp(b, 0, 255))
									syncColor()
								else
									textBox.Text = tostring(math.floor(option.color[component] * 255 + 0.5))
								end
							end)

							textBox:GetPropertyChangedSignal("Text"):Connect(function()
								local inputText = textBox.Text
								if not tonumber(inputText) and inputText ~= "" then
									textBox.Text = inputText:gsub("%D", "")
								end
							end)
						end

						-- Logic for interacting with the hue bar
						HUE.MouseButton1Down:Connect(function()
							-- Function to dynamically update the hue cursor and color
							local function updateHueCursor()
								local relativeY = math.clamp(Mouse.Y - HUE.AbsolutePosition.Y, 0, HUE.AbsoluteSize.Y)

								-- Correct the X offset: center the cursor horizontally within the hue bar
								HueCursor.Position = UDim2.new(0.5, 0, 0, relativeY - (HueCursor.AbsoluteSize.Y / 2))

								-- Calculate hue as a percentage (0 to 1) and update the color
								local huePercent = math.clamp(relativeY / HUE.AbsoluteSize.Y, 0, 1)
								updateHueColor(huePercent)
							end

							-- Initial update
							updateHueCursor()

							-- Connect mouse movement for dragging
							local hueConnection
							hueConnection = Mouse.Move:Connect(updateHueCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if hueConnection then
										hueConnection:Disconnect()
										hueConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						-- Logic for interacting with the scheme area
						Schema.MouseButton1Down:Connect(function()
							-- Function to dynamically update the scheme cursor and color
							local function updateSchemeCursor()
								local relativeX = math.clamp(Mouse.X - Schema.AbsolutePosition.X, 0, Schema.AbsoluteSize.X)
								local relativeY = math.clamp(Mouse.Y - Schema.AbsolutePosition.Y, 0, Schema.AbsoluteSize.Y)

								-- Update the cursor position
								SchemaCursor.Position = UDim2.new(0, relativeX - (SchemaCursor.AbsoluteSize.X / 2), 0, relativeY - (SchemaCursor.AbsoluteSize.Y / 2))

								-- Update the scheme-based color
								updateSchemeColor(relativeX, relativeY)
							end

							-- Initial update
							updateSchemeCursor()

							-- Connect mouse movement for dragging
							local schemeConnection
							schemeConnection = Mouse.Move:Connect(updateSchemeCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if schemeConnection then
										schemeConnection:Disconnect()
										schemeConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						handleRGBInputChange(TextBoxR, "R")
						handleRGBInputChange(TextBoxG, "G")
						handleRGBInputChange(TextBoxB, "B")

						-- Initialize color picker
						syncColor()
						updateTransparency(option.transparency)
					end

					return ColorPicker
				end

				return Toggle
			end

			function Section:NewButton(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "Button"
				option.callback = option.callback or function() end

				local Button = {}

				do -- button
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder
					Button["54"] = Instance.new("Frame", Section["23"]);
					Button["54"]["BorderSizePixel"] = 0;
					Button["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["54"]["Size"] = UDim2.new(1, 0, 0, 18);
					Button["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["54"]["Name"] = [[ButtonHolder]];
					Button["54"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline
					Button["55"] = Instance.new("Frame", Button["54"]);
					Button["55"]["BorderSizePixel"] = 0;
					Button["55"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Button["55"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["55"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["55"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Button["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["55"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline
					Button["56"] = Instance.new("Frame", Button["55"]);
					Button["56"]["BorderSizePixel"] = 0;
					Button["56"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Button["56"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["56"]["Size"] = UDim2.new(1, -2, 1, -2);
					Button["56"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Button["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["56"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline.Main
					Button["57"] = Instance.new("Frame", Button["56"]);
					Button["57"]["BorderSizePixel"] = 0;
					Button["57"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Button["57"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["57"]["Size"] = UDim2.new(1, -2, 1, -2);
					Button["57"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Button["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["57"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline.Main.UIGradient
					Button["58"] = Instance.new("UIGradient", Button["57"]);
					Button["58"]["Rotation"] = 90;
					Button["58"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline.Main.TextLabel
					Button["59"] = Instance.new("TextLabel", Button["57"]);
					Button["59"]["TextStrokeTransparency"] = 0;
					Button["59"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Button["59"]["BorderSizePixel"] = 0;
					Button["59"]["TextSize"] = 14;
					Button["59"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Button["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Button["59"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Button["59"]["BackgroundTransparency"] = 1;
					Button["59"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["59"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["59"]["Text"] = option.text;
					Button["59"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Button
					Button["5a"] = Instance.new("TextButton", Button["54"]);
					Button["5a"]["BorderSizePixel"] = 0;
					Button["5a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Button["5a"]["TextTransparency"] = 1;
					Button["5a"]["TextSize"] = 14;
					Button["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Button["5a"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["5a"]["BackgroundTransparency"] = 1;
					Button["5a"]["Name"] = [[Button]];
					Button["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				end

				do -- logic
					local btnButton = Button["5a"]
					local basiccolor = Color3.fromRGB(31,31,31)

					btnButton.MouseButton1Click:Connect(function()
						pcall(option.callback)
						Button["56"]["BackgroundColor3"] = basiccolor
						wait(0.05)
						Button["56"]["BackgroundColor3"] = Color3.fromRGB(50,50,50)
						tweenObject(Button["56"], {BackgroundColor3 = basiccolor}, 2)
					end)

					btnButton.MouseEnter:Connect(function()
						Button["59"]["TextColor3"] = Color3.fromRGB(112, 112, 112);
					end)

					btnButton.MouseLeave:Connect(function()
						Button["59"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					end)
				end

				return Button
			end

			function Section:NewKeybind(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text
				option.key = option.key or Enum.KeyCode.World95
				option.flag = option.flag or option.text
				option.callback = option.callback or function() end
				option.utilitytype = "keybind"

				local Keybind = {}

				do -- keybind
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder
					Keybind["87"] = Instance.new("Frame", Section["23"]);
					Keybind["87"]["BorderSizePixel"] = 0;
					Keybind["87"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["87"]["Size"] = UDim2.new(1, 0, 0, 15);
					Keybind["87"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["87"]["Name"] = [[KeybindHolder]];
					Keybind["87"]["BackgroundTransparency"] = 1;
					Keybind["87"]["ZIndex"] = 10


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline
					Keybind["88"] = Instance.new("Frame", Keybind["87"]);
					Keybind["88"]["BorderSizePixel"] = 0;
					Keybind["88"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Keybind["88"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Keybind["88"]["Size"] = UDim2.new(0, 25, 1, 0);
					Keybind["88"]["Position"] = UDim2.new(1, 0, 0.5, 0);
					Keybind["88"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["88"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline
					Keybind["89"] = Instance.new("Frame", Keybind["88"]);
					Keybind["89"]["BorderSizePixel"] = 0;
					Keybind["89"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["89"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["89"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["89"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["89"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main
					Keybind["8a"] = Instance.new("Frame", Keybind["89"]);
					Keybind["8a"]["BorderSizePixel"] = 0;
					Keybind["8a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["8a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8a"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["8a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["8a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8a"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.UIGradient
					Keybind["8b"] = Instance.new("UIGradient", Keybind["8a"]);
					Keybind["8b"]["Rotation"] = 90;
					Keybind["8b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Keybind
					Keybind["8c"] = Instance.new("TextLabel", Keybind["8a"]);
					Keybind["8c"]["TextStrokeTransparency"] = 0;
					Keybind["8c"]["ZIndex"] = 1;
					Keybind["8c"]["BorderSizePixel"] = 0;
					Keybind["8c"]["TextSize"] = 12;
					Keybind["8c"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["8c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["8c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["8c"]["BackgroundTransparency"] = 1;
					Keybind["8c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8c"]["Size"] = UDim2.new(1, 0, 1, 0);
					Keybind["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8c"]["Text"] = [[...]];
					Keybind["8c"]["Name"] = [[Keybind]];
					Keybind["8c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings
					Keybind["8d"] = Instance.new("Frame", Keybind["8a"]);
					Keybind["8d"]["Visible"] = false;
					Keybind["8d"]["BorderSizePixel"] = 0;
					Keybind["8d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Keybind["8d"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Keybind["8d"]["Size"] = UDim2.new(0, 50, 0, 50);
					Keybind["8d"]["Position"] = UDim2.new(0.5, 0, 1, 1);
					Keybind["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8d"]["Name"] = [[Settings]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline
					Keybind["8e"] = Instance.new("Frame", Keybind["8d"]);
					Keybind["8e"]["BorderSizePixel"] = 0;
					Keybind["8e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["8e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8e"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["8e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8e"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main
					Keybind["8f"] = Instance.new("Frame", Keybind["8e"]);
					Keybind["8f"]["BorderSizePixel"] = 0;
					Keybind["8f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["8f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8f"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["8f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["8f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8f"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIGradient
					Keybind["90"] = Instance.new("UIGradient", Keybind["8f"]);
					Keybind["90"]["Rotation"] = 90;
					Keybind["90"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIListLayout
					Keybind["91"] = Instance.new("UIListLayout", Keybind["8f"]);
					Keybind["91"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Keybind["91"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
					Keybind["91"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
					Keybind["91"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Always
					Keybind["92"] = Instance.new("TextButton", Keybind["8f"]);
					Keybind["92"]["TextStrokeTransparency"] = 0;
					Keybind["92"]["BorderSizePixel"] = 0;
					Keybind["92"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["92"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["92"]["TextSize"] = 12;
					Keybind["92"]["BackgroundColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["92"]["Size"] = UDim2.new(0, 200, 0, 50);
					Keybind["92"]["BackgroundTransparency"] = 1;
					Keybind["92"]["Name"] = [[Always]];
					Keybind["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["92"]["Text"] = [[always]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Toggle
					Keybind["93"] = Instance.new("TextButton", Keybind["8f"]);
					Keybind["93"]["TextStrokeTransparency"] = 0;
					Keybind["93"]["BorderSizePixel"] = 0;
					Keybind["93"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["93"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["93"]["TextSize"] = 12;
					Keybind["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["93"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["93"]["Size"] = UDim2.new(0, 200, 0, 50);
					Keybind["93"]["BackgroundTransparency"] = 1;
					Keybind["93"]["Name"] = [[Toggle]];
					Keybind["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["93"]["Text"] = [[toggle]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.OnHold
					Keybind["94"] = Instance.new("TextButton", Keybind["8f"]);
					Keybind["94"]["TextStrokeTransparency"] = 0;
					Keybind["94"]["BorderSizePixel"] = 0;
					Keybind["94"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["94"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["94"]["TextSize"] = 12;
					Keybind["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["94"]["Size"] = UDim2.new(0, 200, 0, 50);
					Keybind["94"]["BackgroundTransparency"] = 1;
					Keybind["94"]["Name"] = [[OnHold]];
					Keybind["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["94"]["Text"] = [[on hold]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.SetKeybindButton
					Keybind["95"] = Instance.new("TextButton", Keybind["88"]);
					Keybind["95"]["BorderSizePixel"] = 0;
					Keybind["95"]["ZIndex"] = 5
					Keybind["95"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["95"]["TextTransparency"] = 1;
					Keybind["95"]["TextSize"] = 14;
					Keybind["95"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["95"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["95"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["95"]["Size"] = UDim2.new(1, 0, 1, 0);
					Keybind["95"]["BackgroundTransparency"] = 1;
					Keybind["95"]["Name"] = [[SetKeybindButton]];
					Keybind["95"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["95"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.KeybindText
					Keybind["96"] = Instance.new("TextLabel", Keybind["87"]);
					Keybind["96"]["TextStrokeTransparency"] = 0;
					Keybind["96"]["BorderSizePixel"] = 0;
					Keybind["96"]["TextSize"] = 14;
					Keybind["96"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Keybind["96"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["96"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["96"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["96"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["96"]["BackgroundTransparency"] = 1;
					Keybind["96"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Keybind["96"]["Size"] = UDim2.new(1, -25, 1, 0);
					Keybind["96"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["96"]["Text"] = option.text;
					Keybind["96"]["Name"] = [[KeybindText]];
					Keybind["96"]["Position"] = UDim2.new(0, 0, 0.5, 0);
				end

				do -- logic				

					local hold = false
					local onhold = false
					local opened = false
					local activecolor = Color3.fromRGB(255, 255, 255)
					local notactivecolor = Color3.fromRGB(92, 92, 92)
					local activebutton = "button92"

					local shorts = {
						RightAlt = "RA",
						LeftAlt = "LA",
						RightControl = "RC",
						LeftControl = "LC",
						LeftShift = "LS",
						RightShift = "RS",
						MouseButton1 = "M1",
						MouseButton2 = "M2",
						Return = "ENT",
						Backspace = "BP",
						Tab = "TAB",
						CapsLock = "CL",
						Escape = "ESC",
						Insert = "INS",
						PageUp = "UP",
						PageDown = "DOWN",
						KeypadMultiply = "*",
						KeypadDivide = "/",
						End = "END",
						Unknown = "?",
						World95 = "?"
					}

					local ignored = {
						W = true,
						A = true,
						S = true,
						D = true,
						Space = true,
						F = true,
						R = true
					}

					Keybind["8c"].Text = tostring(shorts[option.key.Name]) or tostring(option.key.Name)
					if Keybind["8c"].Text:match("nil") then
						Keybind["8c"].Text = tostring(option.key.Name)
					end

					local newBindButtonSize =
						game:GetService("TextService"):GetTextSize(
							Keybind["8c"].Text,
							Keybind["8c"].TextSize,
							Keybind["8c"].Font,
							Vector2.new(math.huge, math.huge)
						)
					Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)

					Keybind["95"].MouseButton2Click:Connect(function()
						if opened == true then
							Keybind["8d"].Visible = false
							opened = false
						elseif opened == false then
							Keybind["8d"].Visible = true
							opened = true
						end
					end)

					Keybind["92"].MouseButton1Click:Connect(function()
						if activebutton ~= "button92" then
							if activebutton == "button93" then
								Keybind["93"].TextColor3 = notactivecolor
							elseif activebutton == "button94" then
								Keybind["94"].TextColor3 = notactivecolor
							end	
						end

						Keybind["92"].TextColor3 = activecolor
						activebutton = "button92"
					end)

					Keybind["93"].MouseButton1Click:Connect(function()
						if activebutton ~= "button93" then
							if activebutton == "button92" then
								Keybind["92"].TextColor3 = notactivecolor
							elseif activebutton == "button94" then
								Keybind["94"].TextColor3 = notactivecolor
							end						
						end

						Keybind["93"].TextColor3 = activecolor
						activebutton = "button93"
					end)



					Keybind["94"].MouseButton1Click:Connect(function()
						if activebutton ~= "button94" then
							if activebutton == "button92" then
								Keybind["92"].TextColor3 = notactivecolor
							elseif activebutton == "button93" then
								Keybind["93"].TextColor3 = notactivecolor
							end	
						end

						Keybind["94"].TextColor3 = activecolor
						activebutton = "button94"
					end)

					Keybind["95"].MouseButton1Click:Connect(function()
						hold = true
						if hold == true then
							Keybind["8c"].Text = " ... "
							local newBindButtonSize =
								game:GetService("TextService"):GetTextSize(
									Keybind["8c"].Text,
									Keybind["8c"].TextSize,
									Keybind["8c"].Font,
									Vector2.new(math.huge, math.huge)
								)
							Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
							local Input
							repeat Input = game:GetService("UserInputService").InputBegan:Wait() until not ignored[Input.KeyCode.Name] do end
							if Input.KeyCode.Name ~= "Unknown" and not ignored[Input.KeyCode.Name] then
								local K = shorts[Input.KeyCode.Name] or Input.KeyCode.Name
								Keybind["8c"].Text = K
								option.key = Input.KeyCode
								local newBindButtonSize =
									game:GetService("TextService"):GetTextSize(
										Keybind["8c"].Text,
										Keybind["8c"].TextSize,
										Keybind["8c"].Font,
										Vector2.new(math.huge, math.huge)
									)
								Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
								Library.Flags[option.flag] = option.key.Name									
							end
						end
						wait()
						hold = false
					end)

					if activebutton == "button92" then
						print("lol")
					end

					UserInputService.InputBegan:Connect(function(k, t)
						if activebutton == "button93" then
							if t then return end
							if k.KeyCode == option.key then
								if not option.hold then
									option.callback(option.key)
								end
							end
						elseif activebutton == "button94" then
							if t then return end
							if k.KeyCode == option.key then
								if not option.hold then
									if not onhold then
										onhold = true
										print("holding")
									end
								end
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(k, t)
						if activebutton == "button94" then
							if t then return end
							if k.KeyCode == option.key then
								if not option.hold then
									if onhold then
										onhold = false
										print("released")
									end
								end
							end
						end
					end)


					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.key.Name
						Library.Items[option.flag] = option
					end

					function option:SetValue(key)
						option.key = key
						local text = shorts[option.key.Name] or option.key.Name
						Keybind["8c"].Text = text
						local newBindButtonSize =
							game:GetService("TextService"):GetTextSize(
								Keybind["8c"].Text,
								Keybind["8c"].TextSize,
								Keybind["8c"].Font,
								Vector2.new(math.huge, math.huge)
							)
						Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
						Library.Flags[option.flag] = option.key.Name
					end
				end

				return Keybind
			end

			function Section:NewLabel(option)
				option = typeof(option) and option or {}
				option.text = option.text or "New Label"

				local Label = {}

				do -- label
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.LabelHolder
					Label["3c"] = Instance.new("Frame", Section["23"]);
					Label["3c"]["BorderSizePixel"] = 0;
					Label["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["3c"]["Size"] = UDim2.new(1, 0, 0, 15);
					Label["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["3c"]["Name"] = [[LabelHolder]];
					Label["3c"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.LabelHolder.LabelText
					Label["3d"] = Instance.new("TextLabel", Label["3c"]);
					Label["3d"]["TextStrokeTransparency"] = 0;
					Label["3d"]["BorderSizePixel"] = 0;
					Label["3d"]["TextSize"] = 14;
					Label["3d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Label["3d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Label["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Label["3d"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Label["3d"]["BackgroundTransparency"] = 1;
					Label["3d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Label["3d"]["Size"] = UDim2.new(1, 0, 1, 0);
					Label["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["3d"]["Text"] = option.text;
					Label["3d"]["Name"] = [[LabelText]];
					Label["3d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
				end

				return Label
			end

			function Section:NewSlider(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "New Slider"
				option.min = option.min or 0
				option.max = option.max  or 100
				option.value = option.value or 0
				option.flag = option.flag or option.text
				option.float = typeof(option.float) == "number" and option.float or 0
				option.suffix = option.suffix or ""
				option.callback = option.callback or function() end
				option.utilitytype = "slider"

				local Slider = {}

				do -- slider
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder
					Slider["31"] = Instance.new("Frame", Section["23"]);
					Slider["31"]["BorderSizePixel"] = 0;
					Slider["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["31"]["Size"] = UDim2.new(1, 0, 0, 33);
					Slider["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["31"]["Name"] = [[SliderHolder]];
					Slider["31"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderTextHolder
					Slider["32"] = Instance.new("Frame", Slider["31"]);
					Slider["32"]["BorderSizePixel"] = 0;
					Slider["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["32"]["Size"] = UDim2.new(1, 0, 0.5, -1);
					Slider["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["32"]["Name"] = [[SliderTextHolder]];
					Slider["32"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderTextHolder.SliderText
					Slider["33"] = Instance.new("TextLabel", Slider["32"]);
					Slider["33"]["TextStrokeTransparency"] = 0;
					Slider["33"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Slider["33"]["BorderSizePixel"] = 0;
					Slider["33"]["TextSize"] = 14;
					Slider["33"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["33"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Slider["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["33"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Slider["33"]["BackgroundTransparency"] = 1;
					Slider["33"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["33"]["Size"] = UDim2.new(1, 0, 1, 0);
					Slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["33"]["Text"] = option.text;
					Slider["33"]["Name"] = [[SliderText]];
					Slider["33"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder
					Slider["34"] = Instance.new("Frame", Slider["31"]);
					Slider["34"]["BorderSizePixel"] = 0;
					Slider["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["34"]["AnchorPoint"] = Vector2.new(0, 1);
					Slider["34"]["Size"] = UDim2.new(1, 0, 0.5, 2);
					Slider["34"]["Position"] = UDim2.new(0, 0, 1, 0);
					Slider["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["34"]["Name"] = [[SliderMainHolder]];
					Slider["34"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline
					Slider["35"] = Instance.new("Frame", Slider["34"]);
					Slider["35"]["BorderSizePixel"] = 0;
					Slider["35"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Slider["35"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["35"]["Size"] = UDim2.new(1, -2, 1, -2);
					Slider["35"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Slider["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["35"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline
					Slider["36"] = Instance.new("Frame", Slider["35"]);
					Slider["36"]["BorderSizePixel"] = 0;
					Slider["36"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Slider["36"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["36"]["Size"] = UDim2.new(1, -2, 1, -2);
					Slider["36"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Slider["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["36"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderBackground
					Slider["37"] = Instance.new("Frame", Slider["36"]);
					Slider["37"]["Active"] = true;
					Slider["37"]["ZIndex"] = 0;
					Slider["37"]["BorderSizePixel"] = 0;
					Slider["37"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Slider["37"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["37"]["Size"] = UDim2.new(1, -2, 1, -2);
					Slider["37"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Slider["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["37"]["Name"] = [[SliderBackground]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderBackground.UIGradient
					Slider["38"] = Instance.new("UIGradient", Slider["37"]);
					Slider["38"]["Rotation"] = 90;
					Slider["38"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderFill
					Slider["39"] = Instance.new("Frame", Slider["36"]);
					Slider["39"]["BorderSizePixel"] = 0;
					Slider["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["39"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Slider["39"]["Size"] = UDim2.new(0.5, 0, 1, 0);
					Slider["39"]["Position"] = UDim2.new(0, 0, 0.5, 0);
					Slider["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["39"]["Name"] = [[SliderFill]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderFill.UIGradient
					Slider["3a"] = Instance.new("UIGradient", Slider["39"]);
					Slider["3a"]["Rotation"] = 90;
					Slider["3a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderFill.TextLabel
					Slider["3b"] = Instance.new("TextBox", Slider["39"]);
					Slider["3b"]["TextStrokeTransparency"] = 0;
					Slider["3b"]["Name"] = [[TextLabel]];
					Slider["3b"]["BorderSizePixel"] = 0;
					Slider["3b"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Slider["3b"]["TextSize"] = 13;
					Slider["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["3b"]["Selectable"] = false;
					Slider["3b"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Slider["3b"]["Size"] = UDim2.new(0, 1, 1, 0);
					Slider["3b"]["Position"] = UDim2.new(1, 1, 0.5, 0);
					Slider["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["3b"]["Text"] = [[50/100]];
				end

				do -- logic
					local frameSlider = Slider["39"]
					local ignoreSliderValue = Slider["3b"]
					local btnSlider = Slider["37"]

					local dragging = false
					local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

					if option.value > option.max then
						option.value = option.max
						frameSlider.Size = UDim2.new(0, option.value == option.min and 0 or math.floor((((option.value - option.min) / (option.max - option.min)) * 178) + 0.5), 0, 15)

						ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					elseif option.value < option.min then
						option.value = option.min
						frameSlider.Size = UDim2.new(0, option.value == option.min and 0 or math.floor((((option.value - option.min) / (option.max - option.min)) * 178) + 0.5), 0, 15)
						ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					else
						option.value = option.value
						frameSlider.Size = UDim2.new(0, option.value == option.min and 0 or math.floor((((option.value - option.min) / (option.max - option.min)) * 178) + 0.5), 0, 15)

						ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					end
					option.callback(option.value)

					frameSlider.Size = UDim2.new(0, math.floor(((((option.value - option.min) / (option.max - option.min)) * 178) + 0) * 100) / 100, 0, 15)

					ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					option.callback(option.value)

					local UIS = game:GetService("UserInputService")

					local function updateSlider()
						frameSlider.Size = UDim2.new(0, math.clamp(math.floor(((option.value - option.min) / (option.max - option.min)) * 178), 0, 178), 0, 15)
						ignoreSliderValue.Text = tostring(option.value) .. "/" .. tostring(option.max) .. option.suffix
						if option.callback then
							pcall(option.callback, option.value)
						end
					end


					btnSlider.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							local moveConnection
							moveConnection = Mouse.Move:Connect(function()
								local mouseDelta = math.clamp(Mouse.X - frameSlider.AbsolutePosition.X, 0, 178)
								option.value = tonumber(string.format("%." .. option.float .. "f", (mouseDelta / 178) * (option.max - option.min) + option.min))
								updateSlider()
							end)

							local releaseConnection
							releaseConnection = UIS.InputEnded:Connect(function(releaseInput)
								if releaseInput.UserInputType == Enum.UserInputType.MouseButton1 then
									moveConnection:Disconnect()
									releaseConnection:Disconnect()
									dragging = false
								end
							end)
						end
					end)

					-- Add a listener for the TextBox to handle user input
					ignoreSliderValue.FocusLost:Connect(function(enterPressed)
						if enterPressed then
							-- Try to parse the user input as a number
							local inputValue = tonumber(ignoreSliderValue.Text)

							if inputValue then
								-- Clamp the input value to the valid range
								if inputValue < option.min then
									option.value = option.min
								elseif inputValue > option.max then
									option.value = option.max
								else
									option.value = tonumber(string.format("%." .. option.float .. "f", inputValue))
								end

								-- Update the slider's size and text display
								frameSlider.Size = UDim2.new(0, math.floor(((option.value - option.min) / (option.max - option.min)) * 178), 0, 15)
								ignoreSliderValue.Text = tostring(option.value) .. "/" .. tostring(option.max) .. option.suffix

								-- Call the callback function if it exists
								if option.callback then
									pcall(option.callback, option.value)
								end

								-- Update the flag if applicable
								if option.flag then
									Library.Flags[option.flag] = option.value
								end
							else
								-- If input is invalid, reset the TextBox to the current value
								ignoreSliderValue.Text = tostring(option.value) .. "/" .. tostring(option.max) .. option.suffix
							end
						end
					end)

					btnSlider.MouseEnter:Connect(function()
						--UISbtnSlider.Color = Library.Theme.Accent
					end)
					btnSlider.MouseLeave:Connect(function()
						if not dragging then
							--UISbtnSlider.Color = Library.Theme.Border
						end
					end)

					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.value
						Library.Items[option.flag] = option
					end

					function option:SetValue(int)
						if int > option.max then
							option.value = option.max
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
						elseif int < option.min then
							option.value = option.min
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
						else
							option.value = int
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
						end
						option.callback(option.value)
						Library.Flags[option.flag] = option.value
					end
				end

				return Slider
			end

			function Section:NewDropdown(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "nil"
				option.multi = option.multi or false
				option.value = typeof(option.value) == "table" and option.value or option.value or ""
				option.values = typeof(option.values) == "table" and option.values or {}
				option.flag = option.flag or option.text or "DDYDR"
				option.callback = option.callback or function() end
				option.utilitytype = "dropdown"

				local Dropdown = {}

				do -- dropdown
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder
					Dropdown["3e"] = Instance.new("Frame", Section["23"]);
					Dropdown["3e"]["ZIndex"] = 2;
					Dropdown["3e"]["BorderSizePixel"] = 0;
					Dropdown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3e"]["Size"] = UDim2.new(1, 0, 0, 33);
					Dropdown["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["3e"]["Name"] = [[DropdownHolder]];
					Dropdown["3e"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownTextHolder
					Dropdown["3f"] = Instance.new("Frame", Dropdown["3e"]);
					Dropdown["3f"]["BorderSizePixel"] = 0;
					Dropdown["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3f"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Dropdown["3f"]["Size"] = UDim2.new(1, 0, 0.5, -1);
					Dropdown["3f"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Dropdown["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["3f"]["Name"] = [[DropdownTextHolder]];
					Dropdown["3f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownTextHolder.DropdownText
					Dropdown["40"] = Instance.new("TextLabel", Dropdown["3f"]);
					Dropdown["40"]["TextStrokeTransparency"] = 0;
					Dropdown["40"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Dropdown["40"]["BorderSizePixel"] = 0;
					Dropdown["40"]["TextSize"] = 14;
					Dropdown["40"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["40"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Dropdown["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["40"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Dropdown["40"]["BackgroundTransparency"] = 1;
					Dropdown["40"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["40"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["40"]["Text"] = option.text;
					Dropdown["40"]["Name"] = [[DropdownText]];
					Dropdown["40"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder
					Dropdown["41"] = Instance.new("Frame", Dropdown["3e"]);
					Dropdown["41"]["BorderSizePixel"] = 0;
					Dropdown["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["41"]["AnchorPoint"] = Vector2.new(0.5, 1);
					Dropdown["41"]["Size"] = UDim2.new(1, 0, 0.5, 2);
					Dropdown["41"]["Position"] = UDim2.new(0.5, 0, 1, 0);
					Dropdown["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["41"]["Name"] = [[DropdownMainHolder]];
					Dropdown["41"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline
					Dropdown["42"] = Instance.new("Frame", Dropdown["41"]);
					Dropdown["42"]["BorderSizePixel"] = 0;
					Dropdown["42"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Dropdown["42"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["42"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["42"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["42"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline
					Dropdown["43"] = Instance.new("Frame", Dropdown["42"]);
					Dropdown["43"]["BorderSizePixel"] = 0;
					Dropdown["43"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["43"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["43"]["Size"] = UDim2.new(1, -2, 1, -2);
					Dropdown["43"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["43"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main
					Dropdown["44"] = Instance.new("Frame", Dropdown["43"]);
					Dropdown["44"]["BorderSizePixel"] = 0;
					Dropdown["44"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["44"]["Size"] = UDim2.new(1, -2, 1, -2);
					Dropdown["44"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["44"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.UIGradient
					Dropdown["45"] = Instance.new("UIGradient", Dropdown["44"]);
					Dropdown["45"]["Rotation"] = 90;
					Dropdown["45"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownValueText
					Dropdown["46"] = Instance.new("TextLabel", Dropdown["44"]);
					Dropdown["46"]["TextStrokeTransparency"] = 0;
					Dropdown["46"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Dropdown["46"]["ZIndex"] = 2;
					Dropdown["46"]["BorderSizePixel"] = 0;
					Dropdown["46"]["TextSize"] = 13;
					Dropdown["46"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["46"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Dropdown["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["46"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["46"]["BackgroundTransparency"] = 1;
					Dropdown["46"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Dropdown["46"]["Size"] = UDim2.new(1, -15, 1, 0);
					Dropdown["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["46"]["Name"] = [[DropdownValueText]];
					Dropdown["46"]["Position"] = UDim2.new(0, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownValueText.UIPadding
					Dropdown["47"] = Instance.new("UIPadding", Dropdown["46"]);
					Dropdown["47"]["PaddingRight"] = UDim.new(0, 1);
					Dropdown["47"]["PaddingLeft"] = UDim.new(0, 1);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.+/-
					Dropdown["48"] = Instance.new("TextLabel", Dropdown["44"]);
					Dropdown["48"]["TextStrokeTransparency"] = 0;
					Dropdown["48"]["ZIndex"] = 2;
					Dropdown["48"]["BorderSizePixel"] = 0;
					Dropdown["48"]["TextSize"] = 12;
					Dropdown["48"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					Dropdown["48"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Dropdown["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["48"]["BackgroundTransparency"] = 1;
					Dropdown["48"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Dropdown["48"]["Size"] = UDim2.new(0, 15, 1, 0);
					Dropdown["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["48"]["Text"] = [[+]];
					Dropdown["48"]["Name"] = [[+/-]];
					Dropdown["48"]["Position"] = UDim2.new(1, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.+/-.UIPadding
					Dropdown["49"] = Instance.new("UIPadding", Dropdown["48"]);
					Dropdown["49"]["PaddingRight"] = UDim.new(0, 2);
					Dropdown["49"]["PaddingLeft"] = UDim.new(0, 2);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownButton
					Dropdown["4a"] = Instance.new("TextButton", Dropdown["44"]);
					Dropdown["4a"]["BorderSizePixel"] = 0;
					Dropdown["4a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4a"]["TextTransparency"] = 1;
					Dropdown["4a"]["TextSize"] = 14;
					Dropdown["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["4a"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["4a"]["BackgroundTransparency"] = 1;
					Dropdown["4a"]["Name"] = [[DropdownButton]];
					Dropdown["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder
					Dropdown["4b"] = Instance.new("Frame", Dropdown["44"]);
					Dropdown["4b"]["Visible"] = false;
					Dropdown["4b"]["BorderSizePixel"] = 0;
					Dropdown["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["4b"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Dropdown["4b"]["Size"] = UDim2.new(1, 4, 0, 45);
					Dropdown["4b"]["Position"] = UDim2.new(0.5, 0, 1, 0);
					Dropdown["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4b"]["Name"] = [[DropdownOpenedHolder]];
					Dropdown["4b"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline
					Dropdown["4c"] = Instance.new("Frame", Dropdown["4b"]);
					Dropdown["4c"]["BorderSizePixel"] = 0;
					Dropdown["4c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Dropdown["4c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["4c"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["4c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4c"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline
					Dropdown["4d"] = Instance.new("Frame", Dropdown["4c"]);
					Dropdown["4d"]["BorderSizePixel"] = 0;
					Dropdown["4d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["4d"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Dropdown["4d"]["Size"] = UDim2.new(1, -2, 1, -1);
					Dropdown["4d"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Dropdown["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4d"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main
					Dropdown["4e"] = Instance.new("Frame", Dropdown["4d"]);
					Dropdown["4e"]["BorderSizePixel"] = 0;
					Dropdown["4e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["4e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["4e"]["Size"] = UDim2.new(1, -2, 1, -2);
					Dropdown["4e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4e"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main.UIGradient
					Dropdown["4f"] = Instance.new("UIGradient", Dropdown["4e"]);
					Dropdown["4f"]["Rotation"] = 90;
					Dropdown["4f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main.VariantsHolder
					Dropdown["50"] = Instance.new("ScrollingFrame", Dropdown["4e"]);
					Dropdown["50"]["Active"] = true;
					Dropdown["50"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
					Dropdown["50"]["BorderSizePixel"] = 0;
					Dropdown["50"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
					Dropdown["50"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["50"]["Name"] = [[VariantsHolder]];
					Dropdown["50"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["50"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
					Dropdown["50"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["50"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["50"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["50"]["ScrollBarThickness"] = 0;
					Dropdown["50"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main.VariantsHolder.UIListLayout
					Dropdown["51"] = Instance.new("UIListLayout", Dropdown["50"]);
					Dropdown["51"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				end

				do -- logic
					local selected = {}
					local dropped = false

					-- Dropdown elements
					local btnDD = Dropdown["46"]
					local D = Dropdown["4b"]

					-- Dropdown toggle
					Dropdown["4a"].MouseButton1Click:Connect(function()
						D.Visible = not dropped
						if D.Visible == true then
							Dropdown["3e"]["ZIndex"] = 3152
							Dropdown["48"]["Text"] = [[-]];
						else
							Dropdown["3e"]["ZIndex"] = 2
							Dropdown["48"]["Text"] = [[+]];
						end
						dropped = not dropped
					end)

					-- Helper function for updating dropdown text
					local function updateDropdownText()
						if option.multi then
							btnDD.Text = (#selected > 0) and table.concat(selected, ", ") or "None"
						else
							btnDD.Text = tostring(option.value)
						end
					end

					-- Helper function for selecting or deselecting an option
					local function toggleOption(button, value)
						local activeColor = Color3.fromRGB(255, 255, 255)
						local inactiveColor = Color3.fromRGB(91, 91, 91)

						if option.multi then
							if table.find(selected, value) then
								table.remove(selected, table.find(selected, value))
								button.TextColor3 = inactiveColor
							else
								table.insert(selected, value)
								button.TextColor3 = activeColor
							end
							option.value = selected
						else
							option.value = value
							for _, sibling in ipairs(button.Parent:GetChildren()) do
								if sibling:IsA("TextButton") then
									sibling.TextColor3 = inactiveColor
								end
							end
							button.TextColor3 = activeColor
						end

						updateDropdownText()
						option.callback(option.value)
					end

					-- Create dropdown buttons for each option
					for _, value in ipairs(option.values) do
						local button = Instance.new("TextButton", Dropdown["50"]) -- Correct parent
						button.Name = "Option" -- Rename from "Variant" to something descriptive
						button.Size = UDim2.new(1, 0, 0, 15)
						button.BackgroundTransparency = 1
						button.Text = tostring(value) -- Set text to the dropdown value
						button.TextColor3 = Color3.fromRGB(91, 91, 91) -- Default text color
						button.TextXAlignment = Enum.TextXAlignment.Left
						button.Font = Enum.Font.SourceSans
						button.TextSize = 13

						local padding = Instance.new("UIPadding", button)
						padding.PaddingRight = UDim.new(0, 2)
						padding.PaddingLeft = UDim.new(0, 2)

						-- Ensure no extra buttons are preselected incorrectly
						if option.multi then
							if table.find(selected, value) then
								button.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
						else
							if option.value == value then
								button.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
						end

						-- Attach button click functionality
						button.MouseButton1Click:Connect(function()
							toggleOption(button, value)
						end)
					end

					-- Initialization
					updateDropdownText()
					option.callback(option.value)

					-- Store option in library
					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.value
						Library.Items[option.flag] = option
					end

					-- Function to set values programmatically
					function option:SetValue(newValue)
						if option.multi then
							selected = type(newValue) == "table" and newValue or {}
							for _, button in ipairs(D:GetChildren()) do
								if button:IsA("TextButton") then
									button.TextColor3 = table.find(selected, button.Text) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(91, 91, 91)
								end
							end
						else
							option.value = newValue
						end
						updateDropdownText()
						option.callback(option.value)
					end

					function option:SetValues(newValues)
						-- Clear out existing dropdown buttons
						for _, child in ipairs(Dropdown["50"]:GetChildren()) do
							if child:IsA("TextButton") and child.Name == "Option" then
								child:Destroy()
							end
						end

						-- Update the values array
						option.values = newValues or {}

						-- Set the first value in the dropdown automatically, if it exists
						if #option.values > 0 then
							if option.multi then
								selected = { option.values[1] }
							else
								option.value = option.values[1]
							end
						else
							-- Handle the case where the newValues array is empty
							if option.multi then
								selected = {}
							else
								option.value = nil
							end
						end

						-- Create new buttons for the dropdown
						for _, value in ipairs(option.values) do
							local button = Instance.new("TextButton", Dropdown["50"]) -- Correct parent
							button.Name = "Option" -- Name the button for easier identification
							button.Size = UDim2.new(1, 0, 0, 15)
							button.BackgroundTransparency = 1
							button.Text = tostring(value) -- Set text to the dropdown value
							button.TextColor3 = Color3.fromRGB(91, 91, 91) -- Default text color
							button.TextXAlignment = Enum.TextXAlignment.Left
							button.Font = Enum.Font.SourceSans
							button.TextSize = 13

							local padding = Instance.new("UIPadding", button)
							padding.PaddingRight = UDim.new(0, 2)
							padding.PaddingLeft = UDim.new(0, 2)

							-- Ensure no extra buttons are preselected incorrectly
							if option.multi then
								if table.find(selected, value) then
									button.TextColor3 = Color3.fromRGB(255, 255, 255)
								end
							else
								if option.value == value then
									button.TextColor3 = Color3.fromRGB(255, 255, 255)
								end
							end

							-- Attach button click functionality
							button.MouseButton1Click:Connect(function()
								toggleOption(button, value)
							end)
						end

						-- Update the dropdown display text
						updateDropdownText()

						-- Call the callback with the updated value
						option.callback(option.value)
					end
				end

				return Dropdown
			end

			function Section:NewTextBox(option)
				option = typeof(option) == "table" and option or {}
				option.textr = option.textr or "new text box"
				option.text = option.text or "nil"
				option.placeholder = option.placeholder or "Value"
				option.value = option.value or ""
				option.clearonfocus = option.clearonfocus or false
				option.flag = option.flag or option.text or option.value or option.placeholder
				option.callback = option.callback or function() end
				option.utilitytype = "textbox"

				local TextBox = {}

				do -- textbox
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder
					TextBox["97"] = Instance.new("Frame", Section["23"]);
					TextBox["97"]["BorderSizePixel"] = 0;
					TextBox["97"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["97"]["Size"] = UDim2.new(1, 0, 0, 33);
					TextBox["97"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["97"]["Name"] = [[TextBoxHolder]];
					TextBox["97"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxText
					TextBox["98"] = Instance.new("Frame", TextBox["97"]);
					TextBox["98"]["BorderSizePixel"] = 0;
					TextBox["98"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["98"]["Size"] = UDim2.new(1, 0, 0.5, -1);
					TextBox["98"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["98"]["Name"] = [[TextBoxText]];
					TextBox["98"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxText.TextBoxTXT
					TextBox["99"] = Instance.new("TextLabel", TextBox["98"]);
					TextBox["99"]["TextStrokeTransparency"] = 0;
					TextBox["99"]["BorderSizePixel"] = 0;
					TextBox["99"]["TextSize"] = 14;
					TextBox["99"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextBox["99"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					TextBox["99"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["99"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextBox["99"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					TextBox["99"]["BackgroundTransparency"] = 1;
					TextBox["99"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["99"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["99"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["99"]["Text"] = option.textr;
					TextBox["99"]["Name"] = [[TextBoxTXT]];
					TextBox["99"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain
					TextBox["9a"] = Instance.new("Frame", TextBox["97"]);
					TextBox["9a"]["BorderSizePixel"] = 0;
					TextBox["9a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["9a"]["AnchorPoint"] = Vector2.new(0, 1);
					TextBox["9a"]["Size"] = UDim2.new(1, 0, 0.5, 2);
					TextBox["9a"]["Position"] = UDim2.new(0, 0, 1, 0);
					TextBox["9a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9a"]["Name"] = [[TextBoxMain]];
					TextBox["9a"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline
					TextBox["9b"] = Instance.new("Frame", TextBox["9a"]);
					TextBox["9b"]["BorderSizePixel"] = 0;
					TextBox["9b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					TextBox["9b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9b"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["9b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9b"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline
					TextBox["9c"] = Instance.new("Frame", TextBox["9b"]);
					TextBox["9c"]["BorderSizePixel"] = 0;
					TextBox["9c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					TextBox["9c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9c"]["Size"] = UDim2.new(1, -2, 1, -2);
					TextBox["9c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9c"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main
					TextBox["9d"] = Instance.new("Frame", TextBox["9c"]);
					TextBox["9d"]["BorderSizePixel"] = 0;
					TextBox["9d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					TextBox["9d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9d"]["Size"] = UDim2.new(1, -2, 1, -2);
					TextBox["9d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9d"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main.UIGradient
					TextBox["9e"] = Instance.new("UIGradient", TextBox["9d"]);
					TextBox["9e"]["Rotation"] = 90;
					TextBox["9e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main.TextBox
					TextBox["9f"] = Instance.new("TextBox", TextBox["9d"]);
					TextBox["9f"]["CursorPosition"] = -1;
					TextBox["9f"]["TextStrokeTransparency"] = 0;
					TextBox["9f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextBox["9f"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					TextBox["9f"]["BorderSizePixel"] = 0;
					TextBox["9f"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					TextBox["9f"]["TextSize"] = 13;
					TextBox["9f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["9f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["9f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextBox["9f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9f"]["PlaceholderText"] = option.placeholder;
					TextBox["9f"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["9f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9f"]["BackgroundTransparency"] = 1;
					TextBox["9f"].Text = tostring(option.text)
					TextBox["9f"].ClearTextOnFocus = typeof(option.clearonfocus) == "boolean" and option.clearonfocus or false


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main.TextBox.UIPadding
					TextBox["a0"] = Instance.new("UIPadding", TextBox["9f"]);
					TextBox["a0"]["PaddingRight"] = UDim.new(0, 1);
					TextBox["a0"]["PaddingLeft"] = UDim.new(0, 1);
				end

				do -- logic
					local txt = TextBox["9f"]
					local down = false

					game:GetService("UserInputService").InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.Return then  down = true end end)

					game:GetService("UserInputService").InputEnded:Connect(function(input) if input.KeyCode == Enum.KeyCode.Return then  down = false  end end)

					txt.FocusLost:Connect(function()
						task.wait()
						if down then 
							option.value = txt.Text
							option.callback(option.value)
							Library.Flags[option.flag] = option.value
						end 
					end)

					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.value
						Library.Items[option.flag] = option
					end

					option.callback(option.value)

					function option:SetValue(str)
						option.value = tostring(str)
						txt.Text = option.value
						Library.Flags[option.flag] = option.value
						option.callback(option.value)
					end
				end

				return TextBox
			end

			function Section:NewColorpicker(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "New Color" or "nil"
				option.color = option.color or Color3.fromRGB(255, 255, 255)
				option.transparency = typeof(option.transparency) == "number" and option.transparency or typeof(option.transparency) == "boolean" and option.transparency or false
				option.flag = option.flag or option.text
				option.callback = option.callback or function() end
				option.transparencyCallback = option.transparencyCallback or function() end
				option.utilitytype = "color"

				local ColorPicker = {}

				do -- colorpicker
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder
					ColorPicker["5b"] = Instance.new("Frame", Section["23"]);
					ColorPicker["5b"]["ZIndex"] = 999;
					ColorPicker["5b"]["BorderSizePixel"] = 0;
					ColorPicker["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["5b"]["Size"] = UDim2.new(1, 0, 0, 15);
					ColorPicker["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5b"]["Name"] = [[ColorpickerHolder]];
					ColorPicker["5b"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.ColorpickerText
					ColorPicker["5c"] = Instance.new("TextLabel", ColorPicker["5b"]);
					ColorPicker["5c"]["TextStrokeTransparency"] = 0;
					ColorPicker["5c"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					ColorPicker["5c"]["BorderSizePixel"] = 0;
					ColorPicker["5c"]["TextSize"] = 14;
					ColorPicker["5c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					ColorPicker["5c"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["5c"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["5c"]["BackgroundTransparency"] = 1;
					ColorPicker["5c"]["AnchorPoint"] = Vector2.new(0, 0.5);
					ColorPicker["5c"]["Size"] = UDim2.new(1, -20, 1, 0);
					ColorPicker["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5c"]["Text"] = [[ColorPicker preview]];
					ColorPicker["5c"]["Name"] = [[ColorpickerText]];
					ColorPicker["5c"]["Position"] = UDim2.new(0, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline
					ColorPicker["5d"] = Instance.new("Frame", ColorPicker["5b"]);
					ColorPicker["5d"]["BorderSizePixel"] = 0;
					ColorPicker["5d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["5d"]["AnchorPoint"] = Vector2.new(1, 0);
					ColorPicker["5d"]["Size"] = UDim2.new(0, 25, 1, 0);
					ColorPicker["5d"]["Position"] = UDim2.new(1, 0, 0, 0);
					ColorPicker["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5d"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine
					ColorPicker["5e"] = Instance.new("Frame", ColorPicker["5d"]);
					ColorPicker["5e"]["BorderSizePixel"] = 0;
					ColorPicker["5e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5e"]["Name"] = [[InnerLine]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display
					ColorPicker["5f"] = Instance.new("Frame", ColorPicker["5e"]);
					ColorPicker["5f"]["ZIndex"] = 2;
					ColorPicker["5f"]["BorderSizePixel"] = 0;
					ColorPicker["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["5f"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5f"]["Name"] = [[Display]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display.UIGradient
					ColorPicker["60"] = Instance.new("UIGradient", ColorPicker["5f"]);
					ColorPicker["60"]["Rotation"] = 90;
					ColorPicker["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerButton
					ColorPicker["61"] = Instance.new("TextButton", ColorPicker["5e"]);
					ColorPicker["61"]["BorderSizePixel"] = 0;
					ColorPicker["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["61"]["TextTransparency"] = 1;
					ColorPicker["61"]["AutoButtonColor"] = false;
					ColorPicker["61"]["TextSize"] = 14;
					ColorPicker["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["61"]["Size"] = UDim2.new(1, 0, 1, 0);
					ColorPicker["61"]["BackgroundTransparency"] = 1;
					ColorPicker["61"]["Name"] = [[ColorPickerButton]];
					ColorPicker["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain
					ColorPicker["62"] = Instance.new("Frame", ColorPicker["5e"]);
					ColorPicker["62"]["Visible"] = false;
					ColorPicker["62"]["ZIndex"] = 10000;
					ColorPicker["62"]["BorderSizePixel"] = 0;
					ColorPicker["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["62"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["62"]["Size"] = UDim2.new(0, 125, 0, 150);
					ColorPicker["62"]["Position"] = UDim2.new(0, -1, 0, -1);
					ColorPicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["62"]["Name"] = [[ColorPickerMain]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline
					ColorPicker["63"] = Instance.new("Frame", ColorPicker["62"]);
					ColorPicker["63"]["BorderSizePixel"] = 0;
					ColorPicker["63"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["63"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["63"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main
					ColorPicker["64"] = Instance.new("Frame", ColorPicker["63"]);
					ColorPicker["64"]["BorderSizePixel"] = 0;
					ColorPicker["64"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["64"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["64"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["64"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIGradient
					ColorPicker["65"] = Instance.new("UIGradient", ColorPicker["64"]);
					ColorPicker["65"]["Rotation"] = 90;
					ColorPicker["65"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIPadding
					ColorPicker["66"] = Instance.new("UIPadding", ColorPicker["64"]);
					ColorPicker["66"]["PaddingTop"] = UDim.new(0, 3);
					ColorPicker["66"]["PaddingRight"] = UDim.new(0, 3);
					ColorPicker["66"]["PaddingLeft"] = UDim.new(0, 3);
					ColorPicker["66"]["PaddingBottom"] = UDim.new(0, 3);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder
					ColorPicker["67"] = Instance.new("Frame", ColorPicker["64"]);
					ColorPicker["67"]["BorderSizePixel"] = 0;
					ColorPicker["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["67"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["67"]["Size"] = UDim2.new(1, 0, 0, 18);
					ColorPicker["67"]["Position"] = UDim2.new(0, 0, 1, 0);
					ColorPicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["67"]["Name"] = [[RGBtextHolder]];
					ColorPicker["67"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.UIListLayout
					ColorPicker["68"] = Instance.new("UIListLayout", ColorPicker["67"]);
					ColorPicker["68"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					ColorPicker["68"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
					ColorPicker["68"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
					ColorPicker["68"]["Padding"] = UDim.new(0, 1);
					ColorPicker["68"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					ColorPicker["68"]["FillDirection"] = Enum.FillDirection.Horizontal;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R
					ColorPicker["69"] = Instance.new("Frame", ColorPicker["67"]);
					ColorPicker["69"]["BorderSizePixel"] = 0;
					ColorPicker["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["69"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["69"]["Size"] = UDim2.new(0, 33, 0, 15);
					ColorPicker["69"]["Position"] = UDim2.new(0, 37, 1, 0);
					ColorPicker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["69"]["Name"] = [[R]];
					ColorPicker["69"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline
					ColorPicker["6a"] = Instance.new("Frame", ColorPicker["69"]);
					ColorPicker["6a"]["BorderSizePixel"] = 0;
					ColorPicker["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6a"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6a"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline
					ColorPicker["6b"] = Instance.new("Frame", ColorPicker["6a"]);
					ColorPicker["6b"]["BorderSizePixel"] = 0;
					ColorPicker["6b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6b"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6b"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main
					ColorPicker["6c"] = Instance.new("Frame", ColorPicker["6b"]);
					ColorPicker["6c"]["BorderSizePixel"] = 0;
					ColorPicker["6c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6c"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6c"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.R
					ColorPicker["6d"] = Instance.new("TextBox", ColorPicker["6c"]);
					ColorPicker["6d"]["TextStrokeTransparency"] = 0;
					ColorPicker["6d"]["Name"] = [[R]];
					ColorPicker["6d"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["6d"]["BorderSizePixel"] = 0;
					ColorPicker["6d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["6d"]["TextSize"] = 13;
					ColorPicker["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["6d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6d"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6d"]["Text"] = [[255]];
					ColorPicker["6d"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.UIGradient
					ColorPicker["6e"] = Instance.new("UIGradient", ColorPicker["6c"]);
					ColorPicker["6e"]["Rotation"] = 90;
					ColorPicker["6e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G
					ColorPicker["6f"] = Instance.new("Frame", ColorPicker["67"]);
					ColorPicker["6f"]["BorderSizePixel"] = 0;
					ColorPicker["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["6f"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["6f"]["Size"] = UDim2.new(0, 33, 0, 15);
					ColorPicker["6f"]["Position"] = UDim2.new(0, 37, 1, 0);
					ColorPicker["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6f"]["Name"] = [[G]];
					ColorPicker["6f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline
					ColorPicker["70"] = Instance.new("Frame", ColorPicker["6f"]);
					ColorPicker["70"]["BorderSizePixel"] = 0;
					ColorPicker["70"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["70"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["70"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["70"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline
					ColorPicker["71"] = Instance.new("Frame", ColorPicker["70"]);
					ColorPicker["71"]["BorderSizePixel"] = 0;
					ColorPicker["71"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["71"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["71"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main
					ColorPicker["72"] = Instance.new("Frame", ColorPicker["71"]);
					ColorPicker["72"]["BorderSizePixel"] = 0;
					ColorPicker["72"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["72"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["72"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["72"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.G
					ColorPicker["73"] = Instance.new("TextBox", ColorPicker["72"]);
					ColorPicker["73"]["TextStrokeTransparency"] = 0;
					ColorPicker["73"]["Name"] = [[G]];
					ColorPicker["73"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["73"]["BorderSizePixel"] = 0;
					ColorPicker["73"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["73"]["TextSize"] = 13;
					ColorPicker["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["73"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["73"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["73"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["73"]["Text"] = [[255]];
					ColorPicker["73"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.UIGradient
					ColorPicker["74"] = Instance.new("UIGradient", ColorPicker["72"]);
					ColorPicker["74"]["Rotation"] = 90;
					ColorPicker["74"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B
					ColorPicker["75"] = Instance.new("Frame", ColorPicker["67"]);
					ColorPicker["75"]["BorderSizePixel"] = 0;
					ColorPicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["75"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["75"]["Size"] = UDim2.new(0, 33, 0, 15);
					ColorPicker["75"]["Position"] = UDim2.new(0, 37, 1, 0);
					ColorPicker["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["75"]["Name"] = [[B]];
					ColorPicker["75"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline
					ColorPicker["76"] = Instance.new("Frame", ColorPicker["75"]);
					ColorPicker["76"]["BorderSizePixel"] = 0;
					ColorPicker["76"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["76"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["76"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["76"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline
					ColorPicker["77"] = Instance.new("Frame", ColorPicker["76"]);
					ColorPicker["77"]["BorderSizePixel"] = 0;
					ColorPicker["77"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["77"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["77"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main
					ColorPicker["78"] = Instance.new("Frame", ColorPicker["77"]);
					ColorPicker["78"]["BorderSizePixel"] = 0;
					ColorPicker["78"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["78"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["78"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.B
					ColorPicker["79"] = Instance.new("TextBox", ColorPicker["78"]);
					ColorPicker["79"]["TextStrokeTransparency"] = 0;
					ColorPicker["79"]["Name"] = [[B]];
					ColorPicker["79"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["79"]["BorderSizePixel"] = 0;
					ColorPicker["79"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["79"]["TextSize"] = 13;
					ColorPicker["79"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["79"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["79"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["79"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["79"]["Text"] = [[255]];
					ColorPicker["79"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.UIGradient
					ColorPicker["7a"] = Instance.new("UIGradient", ColorPicker["78"]);
					ColorPicker["7a"]["Rotation"] = 90;
					ColorPicker["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue
					ColorPicker["7b"] = Instance.new("ImageButton", ColorPicker["64"]);
					ColorPicker["7b"]["BorderSizePixel"] = 0;
					ColorPicker["7b"]["AutoButtonColor"] = false;
					ColorPicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["7b"]["Selectable"] = false;
					ColorPicker["7b"]["AnchorPoint"] = Vector2.new(1, 0);
					ColorPicker["7b"]["Image"] = [[rbxassetid://2615692420]];
					ColorPicker["7b"]["Size"] = UDim2.new(0, 15, 0, 95);
					ColorPicker["7b"]["Name"] = [[Hue]];
					ColorPicker["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7b"]["Position"] = UDim2.new(1, 0, 0, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue.huecursor
					ColorPicker["7c"] = Instance.new("Frame", ColorPicker["7b"]);
					ColorPicker["7c"]["BorderSizePixel"] = 0;
					ColorPicker["7c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["7c"]["AnchorPoint"] = Vector2.new(0.5, 0);
					ColorPicker["7c"]["Size"] = UDim2.new(1, 6, 0, 3);
					ColorPicker["7c"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					ColorPicker["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7c"]["Name"] = [[huecursor]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme
					ColorPicker["7d"] = Instance.new("ImageButton", ColorPicker["64"]);
					ColorPicker["7d"]["BorderSizePixel"] = 0;
					ColorPicker["7d"]["AutoButtonColor"] = false;
					ColorPicker["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["7d"]["Selectable"] = false;
					ColorPicker["7d"]["Image"] = [[rbxassetid://2615689005]];
					ColorPicker["7d"]["Size"] = UDim2.new(0, 95, 0, 95);
					ColorPicker["7d"]["Name"] = [[Scheme]];
					ColorPicker["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme.schemecursor
					ColorPicker["7e"] = Instance.new("ImageLabel", ColorPicker["7d"]);
					ColorPicker["7e"]["ZIndex"] = 5;
					ColorPicker["7e"]["BorderSizePixel"] = 0;
					ColorPicker["7e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7e"]["Image"] = [[http://www.roblox.com/asset/?id=16006380635]];
					ColorPicker["7e"]["ImageRectSize"] = Vector2.new(1000, 1000);
					ColorPicker["7e"]["Size"] = UDim2.new(0, 5, 0, 5);
					ColorPicker["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7e"]["BackgroundTransparency"] = 1;
					ColorPicker["7e"]["Name"] = [[schemecursor]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency
					ColorPicker["7f"] = Instance.new("Frame", ColorPicker["64"]);
					ColorPicker["7f"]["BorderSizePixel"] = 0;
					ColorPicker["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["7f"]["AnchorPoint"] = Vector2.new(0.5, 1);
					ColorPicker["7f"]["Size"] = UDim2.new(1, 0, 0, 18);
					ColorPicker["7f"]["Position"] = UDim2.new(0.5, 0, 1, -20);
					ColorPicker["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7f"]["Name"] = [[Transparency]];
					ColorPicker["7f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline
					ColorPicker["80"] = Instance.new("Frame", ColorPicker["7f"]);
					ColorPicker["80"]["BorderSizePixel"] = 0;
					ColorPicker["80"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["80"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["80"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["80"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline
					ColorPicker["81"] = Instance.new("Frame", ColorPicker["80"]);
					ColorPicker["81"]["BorderSizePixel"] = 0;
					ColorPicker["81"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["81"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["81"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["81"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main
					ColorPicker["82"] = Instance.new("Frame", ColorPicker["81"]);
					ColorPicker["82"]["BorderSizePixel"] = 0;
					ColorPicker["82"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["82"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["82"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["82"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.Transparency
					ColorPicker["83"] = Instance.new("TextBox", ColorPicker["82"]);
					ColorPicker["83"]["TextStrokeTransparency"] = 0;
					ColorPicker["83"]["Name"] = [[Transparency]];
					ColorPicker["83"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["83"]["BorderSizePixel"] = 0;
					ColorPicker["83"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["83"]["TextSize"] = 13;
					ColorPicker["83"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["83"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["83"]["PlaceholderText"] = [[Transparency:]];
					ColorPicker["83"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["83"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["83"]["Text"] = [[100]];
					ColorPicker["83"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.UIGradient
					ColorPicker["84"] = Instance.new("UIGradient", ColorPicker["82"]);
					ColorPicker["84"]["Rotation"] = 90;
					ColorPicker["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};

					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Frame
					ColorPicker["86"] = Instance.new("ImageLabel", ColorPicker["5e"]);
					ColorPicker["86"]["BorderSizePixel"] = 0;
					ColorPicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["86"]["ScaleType"] = Enum.ScaleType.Crop;
					ColorPicker["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["86"]["Image"] = [[rbxassetid://98372645101260]];
					ColorPicker["86"]["ImageRectSize"] = Vector2.new(100, 100);
					ColorPicker["86"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["86"]["Name"] = [[Frame]];
					ColorPicker["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
				end

				do -- logic
					local opened = false

					ColorPicker["61"].MouseButton1Click:Connect(function()
						ColorPicker["62"].Visible = not opened
						opened = not opened
					end)

					local colorPickerMain = ColorPicker["62"]
					local scrollFrame = Tab["1e"]

					-- Function to update position and anchor point
					local function updatePosition()
						local pickerAbsPos = colorPickerMain.AbsolutePosition
						local scrollFrameAbsPos = scrollFrame.AbsolutePosition
						local scrollFrameSize = scrollFrame.AbsoluteSize

						-- Check if touching the top
						if pickerAbsPos.Y < scrollFrameAbsPos.Y then
							colorPickerMain.Position = UDim2.new(0, -1, 1, 1) -- Position at the top
							colorPickerMain.AnchorPoint = Vector2.new(0, 0) -- Anchor point at the top
							print("Moved to top with AnchorPoint 0,0 and Position {0, -1}, {1, 1}")
						end

						-- Check if touching the bottom
						if pickerAbsPos.Y + colorPickerMain.AbsoluteSize.Y > scrollFrameAbsPos.Y + scrollFrameSize.Y then
							colorPickerMain.Position = UDim2.new(0, -1, 0, -1) -- Position at the bottom
							colorPickerMain.AnchorPoint = Vector2.new(0, 1) -- Anchor point at the bottom
							print("Moved to bottom with AnchorPoint 0,1 and Position {0, -1}, {0, -1}")
						end
					end

					-- Connect to the RenderStepped event for constant checking
					game:GetService("RunService").RenderStepped:Connect(updatePosition)

					local white, black = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
					local colors = {
						Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0),
						Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0)
					}

					local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
					local UserInputService = game:GetService("UserInputService")

					-- UI elements
					local Schema = ColorPicker["7d"] -- Gradient area
					local SchemaCursor = ColorPicker["7e"] -- Cursor for the scheme
					local HUE = ColorPicker["7b"] -- Hue bar
					local HueCursor = ColorPicker["7c"] -- Cursor for the hue bar
					local Display = ColorPicker["5f"] -- Color display
					local TransparencyTextBox = ColorPicker["83"] -- Transparency input box
					local TextBoxR = ColorPicker["6d"] -- Red input box
					local TextBoxG = ColorPicker["73"] -- Green input box
					local TextBoxB = ColorPicker["79"] -- Blue input box

					-- Function: Convert RGB to HSV
					local function rgbToHSV(color)
						local r, g, b = color.R, color.G, color.B
						local max, min = math.max(r, g, b), math.min(r, g, b)
						local delta = max - min

						local h = 0
						if delta > 0 then
							if max == r then
								h = (g - b) / delta % 6
							elseif max == g then
								h = (b - r) / delta + 2
							elseif max == b then
								h = (r - g) / delta + 4
							end
							h = h / 6
						end

						local s = (max == 0) and 0 or delta / max
						local v = max
						return h, s, v
					end

					-- Function: Clamp a value between min and max
					local function clamp(value, min, max)
						return math.max(min, math.min(max, value))
					end

					-- Function: Update the color display
					local function updateColor(outputColor)
						if typeof(outputColor) ~= "Color3" then
							error("Invalid color value: Expected Color3, got " .. typeof(outputColor))
						end

						Display.BackgroundColor3 = outputColor
						option.color = outputColor

						local r = math.floor(outputColor.R * 255 + 0.5)
						local g = math.floor(outputColor.G * 255 + 0.5)
						local b = math.floor(outputColor.B * 255 + 0.5)

						TextBoxR.Text = tostring(r)
						TextBoxG.Text = tostring(g)
						TextBoxB.Text = tostring(b)

						if option.callback then
							option.callback(outputColor)
						end
					end

					-- Function to update the hue-based color dynamically
					local function updateHueColor(huePercent)
						-- Calculate the color from the hue percentage
						local hueColor = Color3.fromHSV(huePercent, 1, 1)

						-- Update the scheme's background color to reflect the hue
						Schema.BackgroundColor3 = hueColor

						-- Calculate the scheme cursor's position and update the final color
						local xP = math.clamp((SchemaCursor.AbsolutePosition.X - Schema.AbsolutePosition.X) / Schema.AbsoluteSize.X, 0, 1)
						local yP = math.clamp((SchemaCursor.AbsolutePosition.Y - Schema.AbsolutePosition.Y) / Schema.AbsoluteSize.Y, 0, 1)
						local outputColor = white:Lerp(hueColor, xP):Lerp(black, yP)

						-- Update the display, text boxes, and trigger callbacks
						updateColor(outputColor)
					end

					-- Function to update the scheme-based color dynamically
					local function updateSchemeColor(relativeX, relativeY)
						-- Calculate the interpolated color based on cursor position
						local xP = math.clamp(relativeX / Schema.AbsoluteSize.X, 0, 1)
						local yP = math.clamp(relativeY / Schema.AbsoluteSize.Y, 0, 1)
						local outputColor = white:Lerp(Schema.BackgroundColor3, xP):Lerp(black, yP)

						-- Update the display, text boxes, and trigger callbacks
						updateColor(outputColor)
					end

					-- Function: Sync color picker cursors and display based on a Color3 value
					local function syncColor()
						local h, s, v = rgbToHSV(option.color)

						local huePosition = h * HUE.AbsoluteSize.Y
						HueCursor.Position = UDim2.new(0.5, 0, 0, huePosition - (HueCursor.AbsoluteSize.Y / 2))

						local hueColor = Color3.fromHSV(h, 1, 1)
						Schema.BackgroundColor3 = hueColor

						local schemeX = s * Schema.AbsoluteSize.X
						local schemeY = (1 - v) * Schema.AbsoluteSize.Y
						SchemaCursor.Position = UDim2.new(0, schemeX - (SchemaCursor.AbsoluteSize.X / 2), 0, schemeY - (SchemaCursor.AbsoluteSize.Y / 2))

						updateColor(option.color)
					end

					-- Function: Update transparency
					local function updateTransparency(transparencyValue)
						local clampedValue = clamp(transparencyValue, 0, 100)
						local callbackValue = 1 - (clampedValue / 100)

						Display.BackgroundTransparency = callbackValue
						option.transparency = clampedValue

						if option.transparencyCallback then
							option.transparencyCallback(callbackValue)
						end

						TransparencyTextBox.Text = tostring(clampedValue)
					end

					-- Connect transparency TextBox changes
					TransparencyTextBox.FocusLost:Connect(function()
						local transparencyValue = tonumber(TransparencyTextBox.Text)
						if transparencyValue then
							updateTransparency(transparencyValue)
						else
							TransparencyTextBox.Text = tostring(option.transparency)
						end
					end)

					TransparencyTextBox:GetPropertyChangedSignal("Text"):Connect(function()
						local inputText = TransparencyTextBox.Text
						if not tonumber(inputText) and inputText ~= "" then
							TransparencyTextBox.Text = inputText:gsub("%D", "")
						end
					end)

					-- Function: Handle RGB input changes
					local function handleRGBInputChange(textBox, component)
						textBox.FocusLost:Connect(function()
							local inputValue = tonumber(textBox.Text)
							if inputValue then
								local r = component == "R" and inputValue or math.floor(option.color.R * 255 + 0.5)
								local g = component == "G" and inputValue or math.floor(option.color.G * 255 + 0.5)
								local b = component == "B" and inputValue or math.floor(option.color.B * 255 + 0.5)

								option.color = Color3.fromRGB(clamp(r, 0, 255), clamp(g, 0, 255), clamp(b, 0, 255))
								syncColor()
							else
								textBox.Text = tostring(math.floor(option.color[component] * 255 + 0.5))
							end
						end)

						textBox:GetPropertyChangedSignal("Text"):Connect(function()
							local inputText = textBox.Text
							if not tonumber(inputText) and inputText ~= "" then
								textBox.Text = inputText:gsub("%D", "")
							end
						end)
					end

					-- Logic for interacting with the hue bar
					HUE.MouseButton1Down:Connect(function()
						-- Function to dynamically update the hue cursor and color
						local function updateHueCursor()
							local relativeY = math.clamp(Mouse.Y - HUE.AbsolutePosition.Y, 0, HUE.AbsoluteSize.Y)

							-- Correct the X offset: center the cursor horizontally within the hue bar
							HueCursor.Position = UDim2.new(0.5, 0, 0, relativeY - (HueCursor.AbsoluteSize.Y / 2))

							-- Calculate hue as a percentage (0 to 1) and update the color
							local huePercent = math.clamp(relativeY / HUE.AbsoluteSize.Y, 0, 1)
							updateHueColor(huePercent)
						end

						-- Initial update
						updateHueCursor()

						-- Connect mouse movement for dragging
						local hueConnection
						hueConnection = Mouse.Move:Connect(updateHueCursor)

						-- Detect when the mouse button is released
						local inputEndedConnection
						inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								-- Disconnect connections safely
								if hueConnection then
									hueConnection:Disconnect()
									hueConnection = nil
								end
								if inputEndedConnection then
									inputEndedConnection:Disconnect()
									inputEndedConnection = nil
								end
							end
						end)
					end)

					-- Logic for interacting with the scheme area
					Schema.MouseButton1Down:Connect(function()
						-- Function to dynamically update the scheme cursor and color
						local function updateSchemeCursor()
							local relativeX = math.clamp(Mouse.X - Schema.AbsolutePosition.X, 0, Schema.AbsoluteSize.X)
							local relativeY = math.clamp(Mouse.Y - Schema.AbsolutePosition.Y, 0, Schema.AbsoluteSize.Y)

							-- Update the cursor position
							SchemaCursor.Position = UDim2.new(0, relativeX - (SchemaCursor.AbsoluteSize.X / 2), 0, relativeY - (SchemaCursor.AbsoluteSize.Y / 2))

							-- Update the scheme-based color
							updateSchemeColor(relativeX, relativeY)
						end

						-- Initial update
						updateSchemeCursor()

						-- Connect mouse movement for dragging
						local schemeConnection
						schemeConnection = Mouse.Move:Connect(updateSchemeCursor)

						-- Detect when the mouse button is released
						local inputEndedConnection
						inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								-- Disconnect connections safely
								if schemeConnection then
									schemeConnection:Disconnect()
									schemeConnection = nil
								end
								if inputEndedConnection then
									inputEndedConnection:Disconnect()
									inputEndedConnection = nil
								end
							end
						end)
					end)

					handleRGBInputChange(TextBoxR, "R")
					handleRGBInputChange(TextBoxG, "G")
					handleRGBInputChange(TextBoxB, "B")

					-- Initialize color picker
					syncColor()
					updateTransparency(option.transparency)
				end

				return ColorPicker
			end

			return Section
		end

		function Tab:NewMultiSection(option)
			option = typeof(option) == "table" and option or {}
			option.variants = typeof(option.variants) == "table" and option.variants or {}

			local MultiSection = {}

			local section = {}

			do -- multisection
				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder
				MultiSection["a5"] = Instance.new("Frame", Tab["1e"]);
				MultiSection["a5"]["BorderSizePixel"] = 0;
				MultiSection["a5"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				MultiSection["a5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				MultiSection["a5"]["AutomaticSize"] = Enum.AutomaticSize.Y;
				MultiSection["a5"]["Size"] = UDim2.new(0, 198, 0, 25);
				MultiSection["a5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				MultiSection["a5"]["Name"] = [[MultiSectionHolder]];


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.UIPadding
				MultiSection["a6"] = Instance.new("UIPadding", MultiSection["a5"]);
				MultiSection["a6"]["PaddingTop"] = UDim.new(0, 1);
				MultiSection["a6"]["PaddingBottom"] = UDim.new(0, 1);


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.Accent
				MultiSection["a7"] = Instance.new("Frame", MultiSection["a5"]);
				MultiSection["a7"]["ZIndex"] = 2;
				MultiSection["a7"]["BorderSizePixel"] = 0;
				MultiSection["a7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				MultiSection["a7"]["AnchorPoint"] = Vector2.new(0.5, 0);
				MultiSection["a7"]["Size"] = UDim2.new(1, -4, 0, 1);
				MultiSection["a7"]["Position"] = UDim2.new(0.5, 0, 0, 2);
				MultiSection["a7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				MultiSection["a7"]["Name"] = [[Accent]];


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.Accent.AccentGradient
				MultiSection["a8"] = Instance.new("UIGradient", MultiSection["a7"]);
				MultiSection["a8"]["Name"] = [[AccentGradient]];
				MultiSection["a8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(201, 201, 201))};


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.ButtonsHolder
				MultiSection["a9"] = Instance.new("ScrollingFrame", MultiSection["a5"]);
				MultiSection["a9"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
				MultiSection["a9"]["ZIndex"] = 2;
				MultiSection["a9"]["BorderSizePixel"] = 0;
				MultiSection["a9"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
				MultiSection["a9"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
				MultiSection["a9"]["Name"] = [[ButtonsHolder]];
				MultiSection["a9"]["Selectable"] = false;
				MultiSection["a9"]["AnchorPoint"] = Vector2.new(0.5, 0);
				MultiSection["a9"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
				MultiSection["a9"]["Size"] = UDim2.new(1, -4, 0, 17);
				MultiSection["a9"]["Position"] = UDim2.new(0.5, 0, 0, 3);
				MultiSection["a9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				MultiSection["a9"]["ScrollBarThickness"] = 0;


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.ButtonsHolder.UIListLayout
				MultiSection["aa"] = Instance.new("UIListLayout", MultiSection["a9"]);
				MultiSection["aa"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				MultiSection["aa"]["FillDirection"] = Enum.FillDirection.Horizontal;


				-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.VariantsHolder
				MultiSection["b1"] = Instance.new("Frame", MultiSection["a5"]);
				MultiSection["b1"]["BorderSizePixel"] = 0;
				MultiSection["b1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				MultiSection["b1"]["AnchorPoint"] = Vector2.new(0.5, 0);
				MultiSection["b1"]["AutomaticSize"] = Enum.AutomaticSize.Y;
				MultiSection["b1"]["Size"] = UDim2.new(1, 0, 0, 23);
				MultiSection["b1"]["Position"] = UDim2.new(0.5, 0, 0, 0);
				MultiSection["b1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				MultiSection["b1"]["Name"] = [[VariantsHolder]];
				MultiSection["b1"]["BackgroundTransparency"] = 1;
			end

			do -- logic
				local activatedsection = nil

				for i,v in ipairs(option.variants) do
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.ButtonsHolder.MultiSectionVariant
					section["ab"] = Instance.new("Frame", MultiSection["a9"]);
					section["ab"]["Active"] = true;
					section["ab"]["BorderSizePixel"] = 0;
					section["ab"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					section["ab"]["AutomaticSize"] = Enum.AutomaticSize.X;
					section["ab"]["Size"] = UDim2.new(0, 1, 1, 0);
					section["ab"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					section["ab"]["Name"] = [[MultiSectionVariant]];
					section["ab"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.sectionHolder.ButtonsHolder.MultiSectionVariant.SectionText
					section["ac"] = Instance.new("TextLabel", section["ab"]);
					section["ac"]["TextStrokeTransparency"] = 0;
					section["ac"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					section["ac"]["BorderSizePixel"] = 0;
					section["ac"]["TextSize"] = 14;
					section["ac"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					section["ac"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					section["ac"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					section["ac"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					section["ac"]["TextColor3"] = Color3.fromRGB(91, 91, 91);
					section["ac"]["BackgroundTransparency"] = 1;
					section["ac"]["Size"] = UDim2.new(1, 0, 0, 14);
					section["ac"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					section["ac"]["Text"] = tostring(v);
					section["ac"]["AutomaticSize"] = Enum.AutomaticSize.X;
					section["ac"]["Name"] = [[SectionText]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.ButtonsHolder.MultiSectionVariant.SectionText.UIPadding
					section["ad"] = Instance.new("UIPadding", section["ac"]);
					section["ad"]["PaddingTop"] = UDim.new(0, 11);
					section["ad"]["PaddingLeft"] = UDim.new(0, 5);
					section["ad"]["PaddingBottom"] = UDim.new(0, 5);


					------------

					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.VariantsHolder.Outline
					section["b2"] = Instance.new("Frame", MultiSection["b1"]);
					section["b2"]["Visible"] = false
					section["b2"]["BorderSizePixel"] = 0;
					section["b2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					section["b2"]["AnchorPoint"] = Vector2.new(0.5, 0);
					section["b2"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					section["b2"]["Size"] = UDim2.new(1, -2, 0, 23);
					section["b2"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					section["b2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					section["b2"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.VariantsHolder.Outline.Main
					section["b3"] = Instance.new("Frame", section["b2"]);
					section["b3"]["BorderSizePixel"] = 0;
					section["b3"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
					section["b3"]["AnchorPoint"] = Vector2.new(0.5, 0);
					section["b3"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					section["b3"]["Size"] = UDim2.new(1, -2, 0, 21);
					section["b3"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					section["b3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					section["b3"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.VariantsHolder.Outline.Main.UIListLayout
					section["b4"] = Instance.new("UIListLayout", section["b3"]);
					section["b4"]["VerticalFlex"] = Enum.UIFlexAlignment.SpaceBetween;
					section["b4"]["Padding"] = UDim.new(0, 5);
					section["b4"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
					section["b4"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.MultiSectionHolder.VariantsHolder.Outline.Main.UIPadding
					section["b5"] = Instance.new("UIPadding", section["b3"]);
					section["b5"]["PaddingTop"] = UDim.new(0, 5);
					section["b5"]["PaddingRight"] = UDim.new(0, 5);
					section["b5"]["PaddingLeft"] = UDim.new(0, 5);
					section["b5"]["PaddingBottom"] = UDim.new(0, 5);

					local function ActivateSection(section)
						if activatedsection ~= section and activatedsection ~= nil then
							activatedsection["b2"].Visible = false
							activatedsection["ac"].TextColor3 = Color3.fromRGB(91, 91, 91);
						end

						section["b2"]["Visible"] = true
						section["ac"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
						activatedsection = section
					end

					if firstsection then
						ActivateSection(section)
					end

					section["ab"].InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							ActivateSection(section)
						end
					end)
				end
			end

			function section:NewToggle(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "New Toggle"
				option.enabled = option.enabled or false
				option.risky = option.risky or false
				option.flag = option.flag or option.text
				option.state = option.enabled
				option.callback = option.callback or function() end
				option.utilitytype = "toggle"

				local Toggle = {}

				do -- toggle
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder
					Toggle["27"] = Instance.new("Frame", section["b3"]);
					Toggle["27"]["ZIndex"] = 1000;
					Toggle["27"]["BorderSizePixel"] = 0;
					Toggle["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["27"]["Size"] = UDim2.new(1, 0, 0, 15);
					Toggle["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["27"]["Name"] = [[ToggleHolder]];
					Toggle["27"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline
					Toggle["28"] = Instance.new("Frame", Toggle["27"]);
					Toggle["28"]["Active"] = true;
					Toggle["28"]["BorderSizePixel"] = 0;
					Toggle["28"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Toggle["28"]["Size"] = UDim2.new(0, 15, 0, 15);
					Toggle["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["28"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline
					Toggle["29"] = Instance.new("Frame", Toggle["28"]);
					Toggle["29"]["Active"] = true;
					Toggle["29"]["BorderSizePixel"] = 0;
					Toggle["29"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Toggle["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["29"]["Size"] = UDim2.new(1, -2, 1, -2);
					Toggle["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Toggle["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["29"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline.Toggle
					Toggle["2a"] = Instance.new("Frame", Toggle["29"]);
					Toggle["2a"]["Active"] = true;
					Toggle["2a"]["BorderSizePixel"] = 0;
					Toggle["2a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Toggle["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["2a"]["Size"] = UDim2.new(1, -2, 1, -2);
					Toggle["2a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Toggle["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2a"]["Name"] = [[Toggle]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline.Toggle.UIGradient
					Toggle["2b"] = Instance.new("UIGradient", Toggle["2a"]);
					Toggle["2b"]["Rotation"] = 90;
					Toggle["2b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.Outline.Innerline.Toggle.ToggleButton
					Toggle["2c"] = Instance.new("TextButton", Toggle["2a"]);
					Toggle["2c"]["BorderSizePixel"] = 0;
					Toggle["2c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2c"]["TextTransparency"] = 1;
					Toggle["2c"]["TextSize"] = 14;
					Toggle["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["2c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["2c"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["2c"]["BackgroundTransparency"] = 1;
					Toggle["2c"]["Name"] = [[ToggleButton]];
					Toggle["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.ToggleText
					Toggle["2d"] = Instance.new("TextLabel", Toggle["27"]);
					Toggle["2d"]["TextStrokeTransparency"] = 0;
					Toggle["2d"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Toggle["2d"]["BorderSizePixel"] = 0;
					Toggle["2d"]["TextSize"] = 14;
					Toggle["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["2d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Toggle["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["2d"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Toggle["2d"]["BackgroundTransparency"] = 1;
					Toggle["2d"]["AnchorPoint"] = Vector2.new(1, 0);
					Toggle["2d"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2d"]["Text"] = option.text;
					Toggle["2d"]["Name"] = [[ToggleText]];
					Toggle["2d"]["Position"] = UDim2.new(1, 0, 0, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.ToggleText.UIPadding
					Toggle["2e"] = Instance.new("UIPadding", Toggle["2d"]);
					Toggle["2e"]["PaddingRight"] = UDim.new(0, 1);
					Toggle["2e"]["PaddingLeft"] = UDim.new(0, 18);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.AdditionHolder
					Toggle["2f"] = Instance.new("Frame", Toggle["27"]);
					Toggle["2f"]["BorderSizePixel"] = 0;
					Toggle["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2f"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Toggle["2f"]["Size"] = UDim2.new(0, 50, 1, 0);
					Toggle["2f"]["Position"] = UDim2.new(1, 0, 0.5, 0);
					Toggle["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2f"]["Name"] = [[AdditionHolder]];
					Toggle["2f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ToggleHolder.AdditionHolder.UIListLayout
					Toggle["30"] = Instance.new("UIListLayout", Toggle["2f"]);
					Toggle["30"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
					Toggle["30"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					Toggle["30"]["FillDirection"] = Enum.FillDirection.Horizontal;
				end

				do -- logic
					local btnToggle = Toggle["2c"]
					local basiccolor = Color3.fromRGB(31,31,31)
					local accentcolor = Color3.fromRGB(255,255,255)
					local hovercolor = Color3.fromRGB(40,40,40)

					btnToggle.MouseButton1Click:Connect(function()
						if option.state == false then
							Toggle["2a"]["BackgroundColor3"] = accentcolor
						elseif option.state == true then
							Toggle["2a"]["BackgroundColor3"] = basiccolor
						end

						option.state = not option.state
						Library.Flags[option.flag] = option.state
						option.callback(option.state)
					end)


					btnToggle.MouseEnter:Connect(function()
						Toggle["2d"]["TextColor3"] = Color3.fromRGB(112, 112, 112);
					end)

					btnToggle.MouseLeave:Connect(function()
						Toggle["2d"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					end)

					if option.enabled == true then
						option.callback(true)
						option.state = true
						Toggle["2a"]["BackgroundColor3"] = accentcolor
					end

					function option:SetValue(boolean)
						boolean = typeof(boolean) == "boolean" and boolean 
						option.state = boolean
						option.callback(option.state)
						Library.Flags[option.flag] = option.state
						if option.state == true then
							Toggle["2a"]["BackgroundColor3"] = accentcolor
						elseif option.state == false then
							Toggle["2a"]["BackgroundColor3"] = basiccolor
						end
					end

					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.state
						Library.Items[option.flag] = option
					end
				end

				local hopster = option

				function Toggle:AddKeybind(option)
					option = typeof(option) == "table" and option or {}
					option.text = option.text
					option.key = option.key or Enum.KeyCode.World95
					option.state = option.state or false
					option.sync = option.sync or false
					option.flag = option.flag or option.text
					option.callback = option.callback or function() end
					option.utilitytype = "keybind"

					local Keybind = {}

					do -- keybind
						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder
						Keybind["87"] = Instance.new("Frame", Toggle["2f"]);
						Keybind["87"]["BorderSizePixel"] = 0;
						Keybind["87"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["87"]["Size"] = UDim2.new(1, 0, 0, 15);
						Keybind["87"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["87"]["Name"] = [[KeybindHolder]];
						Keybind["87"]["BackgroundTransparency"] = 1;
						Keybind["87"]["ZIndex"] = 10


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline
						Keybind["88"] = Instance.new("Frame", Keybind["87"]);
						Keybind["88"]["BorderSizePixel"] = 0;
						Keybind["88"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						Keybind["88"]["AnchorPoint"] = Vector2.new(1, 0.5);
						Keybind["88"]["Size"] = UDim2.new(0, 25, 1, 0);
						Keybind["88"]["Position"] = UDim2.new(1, 0, 0.5, 0);
						Keybind["88"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["88"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline
						Keybind["89"] = Instance.new("Frame", Keybind["88"]);
						Keybind["89"]["BorderSizePixel"] = 0;
						Keybind["89"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["89"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["89"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["89"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["89"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main
						Keybind["8a"] = Instance.new("Frame", Keybind["89"]);
						Keybind["8a"]["BorderSizePixel"] = 0;
						Keybind["8a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["8a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8a"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["8a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["8a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8a"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.UIGradient
						Keybind["8b"] = Instance.new("UIGradient", Keybind["8a"]);
						Keybind["8b"]["Rotation"] = 90;
						Keybind["8b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Keybind
						Keybind["8c"] = Instance.new("TextLabel", Keybind["8a"]);
						Keybind["8c"]["TextStrokeTransparency"] = 0;
						Keybind["8c"]["ZIndex"] = 1;
						Keybind["8c"]["BorderSizePixel"] = 0;
						Keybind["8c"]["TextSize"] = 12;
						Keybind["8c"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["8c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["8c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["8c"]["BackgroundTransparency"] = 1;
						Keybind["8c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8c"]["Size"] = UDim2.new(1, 0, 1, 0);
						Keybind["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8c"]["Text"] = [[...]];
						Keybind["8c"]["Name"] = [[Keybind]];
						Keybind["8c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings
						Keybind["8d"] = Instance.new("Frame", Keybind["8a"]);
						Keybind["8d"]["Visible"] = false;
						Keybind["8d"]["BorderSizePixel"] = 0;
						Keybind["8d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						Keybind["8d"]["AnchorPoint"] = Vector2.new(0.5, 0);
						Keybind["8d"]["Size"] = UDim2.new(0, 50, 0, 50);
						Keybind["8d"]["Position"] = UDim2.new(0.5, 0, 1, 1);
						Keybind["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8d"]["Name"] = [[Settings]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline
						Keybind["8e"] = Instance.new("Frame", Keybind["8d"]);
						Keybind["8e"]["BorderSizePixel"] = 0;
						Keybind["8e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["8e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8e"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["8e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8e"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main
						Keybind["8f"] = Instance.new("Frame", Keybind["8e"]);
						Keybind["8f"]["BorderSizePixel"] = 0;
						Keybind["8f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						Keybind["8f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["8f"]["Size"] = UDim2.new(1, -2, 1, -2);
						Keybind["8f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						Keybind["8f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["8f"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIGradient
						Keybind["90"] = Instance.new("UIGradient", Keybind["8f"]);
						Keybind["90"]["Rotation"] = 90;
						Keybind["90"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIListLayout
						Keybind["91"] = Instance.new("UIListLayout", Keybind["8f"]);
						Keybind["91"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
						Keybind["91"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
						Keybind["91"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
						Keybind["91"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Always
						Keybind["92"] = Instance.new("TextButton", Keybind["8f"]);
						Keybind["92"]["TextStrokeTransparency"] = 0;
						Keybind["92"]["BorderSizePixel"] = 0;
						Keybind["92"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["92"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["92"]["TextSize"] = 12;
						Keybind["92"]["BackgroundColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["92"]["Size"] = UDim2.new(0, 200, 0, 50);
						Keybind["92"]["BackgroundTransparency"] = 1;
						Keybind["92"]["Name"] = [[Always]];
						Keybind["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["92"]["Text"] = [[always]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Toggle
						Keybind["93"] = Instance.new("TextButton", Keybind["8f"]);
						Keybind["93"]["TextStrokeTransparency"] = 0;
						Keybind["93"]["BorderSizePixel"] = 0;
						Keybind["93"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["93"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["93"]["TextSize"] = 12;
						Keybind["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["93"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["93"]["Size"] = UDim2.new(0, 200, 0, 50);
						Keybind["93"]["BackgroundTransparency"] = 1;
						Keybind["93"]["Name"] = [[Toggle]];
						Keybind["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["93"]["Text"] = [[toggle]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.OnHold
						Keybind["94"] = Instance.new("TextButton", Keybind["8f"]);
						Keybind["94"]["TextStrokeTransparency"] = 0;
						Keybind["94"]["BorderSizePixel"] = 0;
						Keybind["94"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
						Keybind["94"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						Keybind["94"]["TextSize"] = 12;
						Keybind["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["94"]["Size"] = UDim2.new(0, 200, 0, 50);
						Keybind["94"]["BackgroundTransparency"] = 1;
						Keybind["94"]["Name"] = [[OnHold]];
						Keybind["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["94"]["Text"] = [[on hold]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.SetKeybindButton
						Keybind["95"] = Instance.new("TextButton", Keybind["88"]);
						Keybind["95"]["BorderSizePixel"] = 0;
						Keybind["95"]["ZIndex"] = 5
						Keybind["95"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["95"]["TextTransparency"] = 1;
						Keybind["95"]["TextSize"] = 14;
						Keybind["95"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						Keybind["95"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Keybind["95"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						Keybind["95"]["Size"] = UDim2.new(1, 0, 1, 0);
						Keybind["95"]["BackgroundTransparency"] = 1;
						Keybind["95"]["Name"] = [[SetKeybindButton]];
						Keybind["95"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Keybind["95"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					end

					do -- logic				

						local hold = false
						local onhold = false
						local opened = false
						local activecolor = Color3.fromRGB(255, 255, 255)
						local notactivecolor = Color3.fromRGB(92, 92, 92)
						local activebutton = "button92"

						local shorts = {
							RightAlt = "RA",
							LeftAlt = "LA",
							RightControl = "RC",
							LeftControl = "LC",
							LeftShift = "LS",
							RightShift = "RS",
							MouseButton1 = "M1",
							MouseButton2 = "M2",
							Return = "ENT",
							Backspace = "BP",
							Tab = "TAB",
							CapsLock = "CL",
							Escape = "ESC",
							Insert = "INS",
							PageUp = "UP",
							PageDown = "DOWN",
							KeypadMultiply = "*",
							KeypadDivide = "/",
							End = "END",
							Unknown = "?",
							World95 = "?"
						}

						local ignored = {
							W = true,
							A = true,
							S = true,
							D = true,
							Space = true,
							F = true,
							R = true
						}

						Keybind["8c"].Text = tostring(shorts[option.key.Name]) or tostring(option.key.Name)
						if Keybind["8c"].Text:match("nil") then
							Keybind["8c"].Text = tostring(option.key.Name)
						end

						local newBindButtonSize =
							game:GetService("TextService"):GetTextSize(
								Keybind["8c"].Text,
								Keybind["8c"].TextSize,
								Keybind["8c"].Font,
								Vector2.new(math.huge, math.huge)
							)
						Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)

						Keybind["95"].MouseButton2Click:Connect(function()
							if opened == true then
								Keybind["8d"].Visible = false
								opened = false
							elseif opened == false then
								Keybind["8d"].Visible = true
								opened = true
							end
						end)

						Keybind["92"].MouseButton1Click:Connect(function()
							if activebutton ~= "button92" then
								if activebutton == "button93" then
									Keybind["93"].TextColor3 = notactivecolor
								elseif activebutton == "button94" then
									Keybind["94"].TextColor3 = notactivecolor
								end	
							end

							Keybind["92"].TextColor3 = activecolor
							activebutton = "button92"
						end)

						Keybind["93"].MouseButton1Click:Connect(function()
							if activebutton ~= "button93" then
								if activebutton == "button92" then
									Keybind["92"].TextColor3 = notactivecolor
								elseif activebutton == "button94" then
									Keybind["94"].TextColor3 = notactivecolor
								end						
							end

							Keybind["93"].TextColor3 = activecolor
							activebutton = "button93"
						end)



						Keybind["94"].MouseButton1Click:Connect(function()
							if activebutton ~= "button94" then
								if activebutton == "button92" then
									Keybind["92"].TextColor3 = notactivecolor
								elseif activebutton == "button93" then
									Keybind["93"].TextColor3 = notactivecolor
								end	
							end

							Keybind["94"].TextColor3 = activecolor
							activebutton = "button94"
						end)

						Keybind["95"].MouseButton1Click:Connect(function()
							hold = true
							if hold == true then
								Keybind["8c"].Text = " ... "
								local newBindButtonSize =
									game:GetService("TextService"):GetTextSize(
										Keybind["8c"].Text,
										Keybind["8c"].TextSize,
										Keybind["8c"].Font,
										Vector2.new(math.huge, math.huge)
									)
								Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
								local Input
								repeat Input = game:GetService("UserInputService").InputBegan:Wait() until not ignored[Input.KeyCode.Name] do end
								if Input.KeyCode.Name ~= "Unknown" and not ignored[Input.KeyCode.Name] then
									local K = shorts[Input.KeyCode.Name] or Input.KeyCode.Name
									Keybind["8c"].Text = K
									option.key = Input.KeyCode
									local newBindButtonSize =
										game:GetService("TextService"):GetTextSize(
											Keybind["8c"].Text,
											Keybind["8c"].TextSize,
											Keybind["8c"].Font,
											Vector2.new(math.huge, math.huge)
										)
									Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
									Library.Flags[option.flag] = option.key.Name									
								end
							end
							wait()
							hold = false
						end)

						local basiccolor = Color3.fromRGB(31,31,31)
						local accentcolor = Color3.fromRGB(255,255,255)

						if activebutton == "button92" then
						end

						local state = hopster.state

						UserInputService.InputBegan:Connect(function(k, t)
							if activebutton == "button93" then
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if not option.hold then
											hopster:SetValue(not hopster.state)
										end
									end
								end
							elseif activebutton == "button94" then
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if not option.hold then
											if not onhold then
												onhold = true
												hopster:SetValue(not hopster.state)
											end
										end
									end
								end
							end
						end)

						UserInputService.InputEnded:Connect(function(k, t)
							if activebutton == "button94" then
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if not option.hold then
											if onhold then
												onhold = false
												hopster:SetValue(not hopster.state)
											end
										end
									end
								end
							end
						end)


						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.key.Name
							Library.Items[option.flag] = option
						end

						function option:SetValue(key)
							option.key = key
							local text = shorts[option.key.Name] or option.key.Name
							Keybind["8c"].Text = text
							local newBindButtonSize =
								game:GetService("TextService"):GetTextSize(
									Keybind["8c"].Text,
									Keybind["8c"].TextSize,
									Keybind["8c"].Font,
									Vector2.new(math.huge, math.huge)
								)
							Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
							Library.Flags[option.flag] = option.key.Name
						end
					end

					return Keybind
				end

				function Toggle:AddColorpicker(option)
					option = typeof(option) == "table" and option or {}
					option.text = option.text or "New Color" or "nil"
					option.color = option.color or Color3.fromRGB(255, 255, 255)
					option.transparency = typeof(option.transparency) == "number" and option.transparency or typeof(option.transparency) == "boolean" and option.transparency or false
					option.flag = option.flag or option.text
					option.callback = option.callback or function() end
					option.transparencyCallback = option.transparencyCallback or function() end
					option.utilitytype = "color"

					local ColorPicker = {}

					do -- colorpicker
						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder
						ColorPicker["5b"] = Instance.new("Frame", Toggle["2f"]);
						ColorPicker["5b"]["ZIndex"] = 999;
						ColorPicker["5b"]["BorderSizePixel"] = 0;
						ColorPicker["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5b"]["Size"] = UDim2.new(0, 25, 0, 15);
						ColorPicker["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5b"]["Name"] = [[ColorpickerHolder]];
						ColorPicker["5b"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline
						ColorPicker["5d"] = Instance.new("Frame", ColorPicker["5b"]);
						ColorPicker["5d"]["BorderSizePixel"] = 0;
						ColorPicker["5d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["5d"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["5d"]["Size"] = UDim2.new(0, 25, 1, 0);
						ColorPicker["5d"]["Position"] = UDim2.new(1, 0, 0, 0);
						ColorPicker["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5d"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine
						ColorPicker["5e"] = Instance.new("Frame", ColorPicker["5d"]);
						ColorPicker["5e"]["BorderSizePixel"] = 0;
						ColorPicker["5e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5e"]["Name"] = [[InnerLine]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display
						ColorPicker["5f"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["5f"]["ZIndex"] = 2;
						ColorPicker["5f"]["BorderSizePixel"] = 0;
						ColorPicker["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5f"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5f"]["Name"] = [[Display]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display.UIGradient
						ColorPicker["60"] = Instance.new("UIGradient", ColorPicker["5f"]);
						ColorPicker["60"]["Rotation"] = 90;
						ColorPicker["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerButton
						ColorPicker["61"] = Instance.new("TextButton", ColorPicker["5e"]);
						ColorPicker["61"]["BorderSizePixel"] = 0;
						ColorPicker["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["TextTransparency"] = 1;
						ColorPicker["61"]["AutoButtonColor"] = false;
						ColorPicker["61"]["TextSize"] = 14;
						ColorPicker["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["61"]["Size"] = UDim2.new(1, 0, 1, 0);
						ColorPicker["61"]["BackgroundTransparency"] = 1;
						ColorPicker["61"]["Name"] = [[ColorPickerButton]];
						ColorPicker["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain
						ColorPicker["62"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["62"]["Visible"] = false;
						ColorPicker["62"]["ZIndex"] = 10000;
						ColorPicker["62"]["BorderSizePixel"] = 0;
						ColorPicker["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["62"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["62"]["Size"] = UDim2.new(0, 125, 0, 150);
						ColorPicker["62"]["Position"] = UDim2.new(0, -1, 0, -1);
						ColorPicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["62"]["Name"] = [[ColorPickerMain]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline
						ColorPicker["63"] = Instance.new("Frame", ColorPicker["62"]);
						ColorPicker["63"]["BorderSizePixel"] = 0;
						ColorPicker["63"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["63"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["63"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main
						ColorPicker["64"] = Instance.new("Frame", ColorPicker["63"]);
						ColorPicker["64"]["BorderSizePixel"] = 0;
						ColorPicker["64"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["64"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["64"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["64"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIGradient
						ColorPicker["65"] = Instance.new("UIGradient", ColorPicker["64"]);
						ColorPicker["65"]["Rotation"] = 90;
						ColorPicker["65"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIPadding
						ColorPicker["66"] = Instance.new("UIPadding", ColorPicker["64"]);
						ColorPicker["66"]["PaddingTop"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingRight"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingLeft"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingBottom"] = UDim.new(0, 3);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder
						ColorPicker["67"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["67"]["BorderSizePixel"] = 0;
						ColorPicker["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["67"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["67"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["67"]["Position"] = UDim2.new(0, 0, 1, 0);
						ColorPicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["67"]["Name"] = [[RGBtextHolder]];
						ColorPicker["67"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.UIListLayout
						ColorPicker["68"] = Instance.new("UIListLayout", ColorPicker["67"]);
						ColorPicker["68"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
						ColorPicker["68"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["Padding"] = UDim.new(0, 1);
						ColorPicker["68"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
						ColorPicker["68"]["FillDirection"] = Enum.FillDirection.Horizontal;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R
						ColorPicker["69"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["69"]["BorderSizePixel"] = 0;
						ColorPicker["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["69"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["69"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["69"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["69"]["Name"] = [[R]];
						ColorPicker["69"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline
						ColorPicker["6a"] = Instance.new("Frame", ColorPicker["69"]);
						ColorPicker["6a"]["BorderSizePixel"] = 0;
						ColorPicker["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6a"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6a"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline
						ColorPicker["6b"] = Instance.new("Frame", ColorPicker["6a"]);
						ColorPicker["6b"]["BorderSizePixel"] = 0;
						ColorPicker["6b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6b"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6b"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main
						ColorPicker["6c"] = Instance.new("Frame", ColorPicker["6b"]);
						ColorPicker["6c"]["BorderSizePixel"] = 0;
						ColorPicker["6c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6c"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6c"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.R
						ColorPicker["6d"] = Instance.new("TextBox", ColorPicker["6c"]);
						ColorPicker["6d"]["TextStrokeTransparency"] = 0;
						ColorPicker["6d"]["Name"] = [[R]];
						ColorPicker["6d"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["6d"]["BorderSizePixel"] = 0;
						ColorPicker["6d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["6d"]["TextSize"] = 13;
						ColorPicker["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6d"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6d"]["Text"] = [[255]];
						ColorPicker["6d"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.UIGradient
						ColorPicker["6e"] = Instance.new("UIGradient", ColorPicker["6c"]);
						ColorPicker["6e"]["Rotation"] = 90;
						ColorPicker["6e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G
						ColorPicker["6f"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["6f"]["BorderSizePixel"] = 0;
						ColorPicker["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6f"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["6f"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["6f"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6f"]["Name"] = [[G]];
						ColorPicker["6f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline
						ColorPicker["70"] = Instance.new("Frame", ColorPicker["6f"]);
						ColorPicker["70"]["BorderSizePixel"] = 0;
						ColorPicker["70"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["70"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["70"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["70"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline
						ColorPicker["71"] = Instance.new("Frame", ColorPicker["70"]);
						ColorPicker["71"]["BorderSizePixel"] = 0;
						ColorPicker["71"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["71"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["71"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main
						ColorPicker["72"] = Instance.new("Frame", ColorPicker["71"]);
						ColorPicker["72"]["BorderSizePixel"] = 0;
						ColorPicker["72"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["72"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["72"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["72"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.G
						ColorPicker["73"] = Instance.new("TextBox", ColorPicker["72"]);
						ColorPicker["73"]["TextStrokeTransparency"] = 0;
						ColorPicker["73"]["Name"] = [[G]];
						ColorPicker["73"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["73"]["BorderSizePixel"] = 0;
						ColorPicker["73"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["73"]["TextSize"] = 13;
						ColorPicker["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["73"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["73"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["73"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["73"]["Text"] = [[255]];
						ColorPicker["73"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.UIGradient
						ColorPicker["74"] = Instance.new("UIGradient", ColorPicker["72"]);
						ColorPicker["74"]["Rotation"] = 90;
						ColorPicker["74"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B
						ColorPicker["75"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["75"]["BorderSizePixel"] = 0;
						ColorPicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["75"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["75"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["75"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["75"]["Name"] = [[B]];
						ColorPicker["75"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline
						ColorPicker["76"] = Instance.new("Frame", ColorPicker["75"]);
						ColorPicker["76"]["BorderSizePixel"] = 0;
						ColorPicker["76"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["76"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["76"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["76"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline
						ColorPicker["77"] = Instance.new("Frame", ColorPicker["76"]);
						ColorPicker["77"]["BorderSizePixel"] = 0;
						ColorPicker["77"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["77"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["77"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main
						ColorPicker["78"] = Instance.new("Frame", ColorPicker["77"]);
						ColorPicker["78"]["BorderSizePixel"] = 0;
						ColorPicker["78"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["78"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["78"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.B
						ColorPicker["79"] = Instance.new("TextBox", ColorPicker["78"]);
						ColorPicker["79"]["TextStrokeTransparency"] = 0;
						ColorPicker["79"]["Name"] = [[B]];
						ColorPicker["79"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["79"]["BorderSizePixel"] = 0;
						ColorPicker["79"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["79"]["TextSize"] = 13;
						ColorPicker["79"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["79"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["79"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["79"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["79"]["Text"] = [[255]];
						ColorPicker["79"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.UIGradient
						ColorPicker["7a"] = Instance.new("UIGradient", ColorPicker["78"]);
						ColorPicker["7a"]["Rotation"] = 90;
						ColorPicker["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue
						ColorPicker["7b"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7b"]["BorderSizePixel"] = 0;
						ColorPicker["7b"]["AutoButtonColor"] = false;
						ColorPicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7b"]["Selectable"] = false;
						ColorPicker["7b"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["7b"]["Image"] = [[rbxassetid://2615692420]];
						ColorPicker["7b"]["Size"] = UDim2.new(0, 15, 0, 95);
						ColorPicker["7b"]["Name"] = [[Hue]];
						ColorPicker["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7b"]["Position"] = UDim2.new(1, 0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue.huecursor
						ColorPicker["7c"] = Instance.new("Frame", ColorPicker["7b"]);
						ColorPicker["7c"]["BorderSizePixel"] = 0;
						ColorPicker["7c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["7c"]["AnchorPoint"] = Vector2.new(0.5, 0);
						ColorPicker["7c"]["Size"] = UDim2.new(1, 6, 0, 3);
						ColorPicker["7c"]["Position"] = UDim2.new(0.5, 0, 0, 0);
						ColorPicker["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7c"]["Name"] = [[huecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme
						ColorPicker["7d"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7d"]["BorderSizePixel"] = 0;
						ColorPicker["7d"]["AutoButtonColor"] = false;
						ColorPicker["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7d"]["Selectable"] = false;
						ColorPicker["7d"]["Image"] = [[rbxassetid://2615689005]];
						ColorPicker["7d"]["Size"] = UDim2.new(0, 95, 0, 95);
						ColorPicker["7d"]["Name"] = [[Scheme]];
						ColorPicker["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme.schemecursor
						ColorPicker["7e"] = Instance.new("ImageLabel", ColorPicker["7d"]);
						ColorPicker["7e"]["ZIndex"] = 5;
						ColorPicker["7e"]["BorderSizePixel"] = 0;
						ColorPicker["7e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["Image"] = [[http://www.roblox.com/asset/?id=16006380635]];
						ColorPicker["7e"]["ImageRectSize"] = Vector2.new(1000, 1000);
						ColorPicker["7e"]["Size"] = UDim2.new(0, 5, 0, 5);
						ColorPicker["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["BackgroundTransparency"] = 1;
						ColorPicker["7e"]["Name"] = [[schemecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency
						ColorPicker["7f"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["7f"]["BorderSizePixel"] = 0;
						ColorPicker["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7f"]["AnchorPoint"] = Vector2.new(0.5, 1);
						ColorPicker["7f"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["7f"]["Position"] = UDim2.new(0.5, 0, 1, -20);
						ColorPicker["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7f"]["Name"] = [[Transparency]];
						ColorPicker["7f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline
						ColorPicker["80"] = Instance.new("Frame", ColorPicker["7f"]);
						ColorPicker["80"]["BorderSizePixel"] = 0;
						ColorPicker["80"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["80"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["80"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["80"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline
						ColorPicker["81"] = Instance.new("Frame", ColorPicker["80"]);
						ColorPicker["81"]["BorderSizePixel"] = 0;
						ColorPicker["81"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["81"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["81"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["81"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main
						ColorPicker["82"] = Instance.new("Frame", ColorPicker["81"]);
						ColorPicker["82"]["BorderSizePixel"] = 0;
						ColorPicker["82"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["82"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["82"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["82"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.Transparency
						ColorPicker["83"] = Instance.new("TextBox", ColorPicker["82"]);
						ColorPicker["83"]["TextStrokeTransparency"] = 0;
						ColorPicker["83"]["Name"] = [[Transparency]];
						ColorPicker["83"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["83"]["BorderSizePixel"] = 0;
						ColorPicker["83"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["83"]["TextSize"] = 13;
						ColorPicker["83"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["83"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["83"]["PlaceholderText"] = [[Transparency:]];
						ColorPicker["83"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["83"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["83"]["Text"] = [[100]];
						ColorPicker["83"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.UIGradient
						ColorPicker["84"] = Instance.new("UIGradient", ColorPicker["82"]);
						ColorPicker["84"]["Rotation"] = 90;
						ColorPicker["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};

						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Frame
						ColorPicker["86"] = Instance.new("ImageLabel", ColorPicker["5e"]);
						ColorPicker["86"]["BorderSizePixel"] = 0;
						ColorPicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["86"]["ScaleType"] = Enum.ScaleType.Crop;
						ColorPicker["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["86"]["Image"] = [[rbxassetid://98372645101260]];
						ColorPicker["86"]["ImageRectSize"] = Vector2.new(100, 100);
						ColorPicker["86"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["86"]["Name"] = [[Frame]];
						ColorPicker["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					end

					do -- logic
						local opened = false

						ColorPicker["61"].MouseButton1Click:Connect(function()
							ColorPicker["62"].Visible = not opened
							opened = not opened
						end)

						local colorPickerMain = ColorPicker["62"]
						local scrollFrame = Tab["1e"]

						-- Function to update position and anchor point
						local function updatePosition()
							local pickerAbsPos = colorPickerMain.AbsolutePosition
							local scrollFrameAbsPos = scrollFrame.AbsolutePosition
							local scrollFrameSize = scrollFrame.AbsoluteSize

							-- Check if touching the top
							if pickerAbsPos.Y < scrollFrameAbsPos.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 1, 1) -- Position at the top
								colorPickerMain.AnchorPoint = Vector2.new(0, 0) -- Anchor point at the top
								print("Moved to top with AnchorPoint 0,0 and Position {0, -1}, {1, 1}")
							end

							-- Check if touching the bottom
							if pickerAbsPos.Y + colorPickerMain.AbsoluteSize.Y > scrollFrameAbsPos.Y + scrollFrameSize.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 0, -1) -- Position at the bottom
								colorPickerMain.AnchorPoint = Vector2.new(0, 1) -- Anchor point at the bottom
								print("Moved to bottom with AnchorPoint 0,1 and Position {0, -1}, {0, -1}")
							end
						end

						-- Connect to the RenderStepped event for constant checking
						game:GetService("RunService").RenderStepped:Connect(updatePosition)

						local white, black = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
						local colors = {
							Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0),
							Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0)
						}

						local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
						local UserInputService = game:GetService("UserInputService")

						-- UI elements
						local Schema = ColorPicker["7d"] -- Gradient area
						local SchemaCursor = ColorPicker["7e"] -- Cursor for the scheme
						local HUE = ColorPicker["7b"] -- Hue bar
						local HueCursor = ColorPicker["7c"] -- Cursor for the hue bar
						local Display = ColorPicker["5f"] -- Color display
						local TransparencyTextBox = ColorPicker["83"] -- Transparency input box
						local TextBoxR = ColorPicker["6d"] -- Red input box
						local TextBoxG = ColorPicker["73"] -- Green input box
						local TextBoxB = ColorPicker["79"] -- Blue input box

						-- Function: Convert RGB to HSV
						local function rgbToHSV(color)
							local r, g, b = color.R, color.G, color.B
							local max, min = math.max(r, g, b), math.min(r, g, b)
							local delta = max - min

							local h = 0
							if delta > 0 then
								if max == r then
									h = (g - b) / delta % 6
								elseif max == g then
									h = (b - r) / delta + 2
								elseif max == b then
									h = (r - g) / delta + 4
								end
								h = h / 6
							end

							local s = (max == 0) and 0 or delta / max
							local v = max
							return h, s, v
						end

						-- Function: Clamp a value between min and max
						local function clamp(value, min, max)
							return math.max(min, math.min(max, value))
						end

						-- Function: Update the color display
						local function updateColor(outputColor)
							if typeof(outputColor) ~= "Color3" then
								error("Invalid color value: Expected Color3, got " .. typeof(outputColor))
							end

							Display.BackgroundColor3 = outputColor
							option.color = outputColor

							local r = math.floor(outputColor.R * 255 + 0.5)
							local g = math.floor(outputColor.G * 255 + 0.5)
							local b = math.floor(outputColor.B * 255 + 0.5)

							TextBoxR.Text = tostring(r)
							TextBoxG.Text = tostring(g)
							TextBoxB.Text = tostring(b)

							if option.callback then
								option.callback(outputColor)
							end
						end

						-- Function to update the hue-based color dynamically
						local function updateHueColor(huePercent)
							-- Calculate the color from the hue percentage
							local hueColor = Color3.fromHSV(huePercent, 1, 1)

							-- Update the scheme's background color to reflect the hue
							Schema.BackgroundColor3 = hueColor

							-- Calculate the scheme cursor's position and update the final color
							local xP = math.clamp((SchemaCursor.AbsolutePosition.X - Schema.AbsolutePosition.X) / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp((SchemaCursor.AbsolutePosition.Y - Schema.AbsolutePosition.Y) / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(hueColor, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function to update the scheme-based color dynamically
						local function updateSchemeColor(relativeX, relativeY)
							-- Calculate the interpolated color based on cursor position
							local xP = math.clamp(relativeX / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp(relativeY / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(Schema.BackgroundColor3, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function: Sync color picker cursors and display based on a Color3 value
						local function syncColor()
							local h, s, v = rgbToHSV(option.color)

							local huePosition = h * HUE.AbsoluteSize.Y
							HueCursor.Position = UDim2.new(0.5, 0, 0, huePosition - (HueCursor.AbsoluteSize.Y / 2))

							local hueColor = Color3.fromHSV(h, 1, 1)
							Schema.BackgroundColor3 = hueColor

							local schemeX = s * Schema.AbsoluteSize.X
							local schemeY = (1 - v) * Schema.AbsoluteSize.Y
							SchemaCursor.Position = UDim2.new(0, schemeX - (SchemaCursor.AbsoluteSize.X / 2), 0, schemeY - (SchemaCursor.AbsoluteSize.Y / 2))

							updateColor(option.color)
						end

						-- Function: Update transparency
						local function updateTransparency(transparencyValue)
							local clampedValue = clamp(transparencyValue, 0, 100)
							local callbackValue = 1 - (clampedValue / 100)

							Display.BackgroundTransparency = callbackValue
							option.transparency = clampedValue

							if option.transparencyCallback then
								option.transparencyCallback(callbackValue)
							end

							TransparencyTextBox.Text = tostring(clampedValue)
						end

						-- Connect transparency TextBox changes
						TransparencyTextBox.FocusLost:Connect(function()
							local transparencyValue = tonumber(TransparencyTextBox.Text)
							if transparencyValue then
								updateTransparency(transparencyValue)
							else
								TransparencyTextBox.Text = tostring(option.transparency)
							end
						end)

						TransparencyTextBox:GetPropertyChangedSignal("Text"):Connect(function()
							local inputText = TransparencyTextBox.Text
							if not tonumber(inputText) and inputText ~= "" then
								TransparencyTextBox.Text = inputText:gsub("%D", "")
							end
						end)

						-- Function: Handle RGB input changes
						local function handleRGBInputChange(textBox, component)
							textBox.FocusLost:Connect(function()
								local inputValue = tonumber(textBox.Text)
								if inputValue then
									local r = component == "R" and inputValue or math.floor(option.color.R * 255 + 0.5)
									local g = component == "G" and inputValue or math.floor(option.color.G * 255 + 0.5)
									local b = component == "B" and inputValue or math.floor(option.color.B * 255 + 0.5)

									option.color = Color3.fromRGB(clamp(r, 0, 255), clamp(g, 0, 255), clamp(b, 0, 255))
									syncColor()
								else
									textBox.Text = tostring(math.floor(option.color[component] * 255 + 0.5))
								end
							end)

							textBox:GetPropertyChangedSignal("Text"):Connect(function()
								local inputText = textBox.Text
								if not tonumber(inputText) and inputText ~= "" then
									textBox.Text = inputText:gsub("%D", "")
								end
							end)
						end

						-- Logic for interacting with the hue bar
						HUE.MouseButton1Down:Connect(function()
							-- Function to dynamically update the hue cursor and color
							local function updateHueCursor()
								local relativeY = math.clamp(Mouse.Y - HUE.AbsolutePosition.Y, 0, HUE.AbsoluteSize.Y)

								-- Correct the X offset: center the cursor horizontally within the hue bar
								HueCursor.Position = UDim2.new(0.5, 0, 0, relativeY - (HueCursor.AbsoluteSize.Y / 2))

								-- Calculate hue as a percentage (0 to 1) and update the color
								local huePercent = math.clamp(relativeY / HUE.AbsoluteSize.Y, 0, 1)
								updateHueColor(huePercent)
							end

							-- Initial update
							updateHueCursor()

							-- Connect mouse movement for dragging
							local hueConnection
							hueConnection = Mouse.Move:Connect(updateHueCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if hueConnection then
										hueConnection:Disconnect()
										hueConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						-- Logic for interacting with the scheme area
						Schema.MouseButton1Down:Connect(function()
							-- Function to dynamically update the scheme cursor and color
							local function updateSchemeCursor()
								local relativeX = math.clamp(Mouse.X - Schema.AbsolutePosition.X, 0, Schema.AbsoluteSize.X)
								local relativeY = math.clamp(Mouse.Y - Schema.AbsolutePosition.Y, 0, Schema.AbsoluteSize.Y)

								-- Update the cursor position
								SchemaCursor.Position = UDim2.new(0, relativeX - (SchemaCursor.AbsoluteSize.X / 2), 0, relativeY - (SchemaCursor.AbsoluteSize.Y / 2))

								-- Update the scheme-based color
								updateSchemeColor(relativeX, relativeY)
							end

							-- Initial update
							updateSchemeCursor()

							-- Connect mouse movement for dragging
							local schemeConnection
							schemeConnection = Mouse.Move:Connect(updateSchemeCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if schemeConnection then
										schemeConnection:Disconnect()
										schemeConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						handleRGBInputChange(TextBoxR, "R")
						handleRGBInputChange(TextBoxG, "G")
						handleRGBInputChange(TextBoxB, "B")

						-- Initialize color picker
						syncColor()
						updateTransparency(option.transparency)
					end

					return ColorPicker
				end

				function Toggle:AddColorpicker2(option)
					option = typeof(option) == "table" and option or {}
					option.text = option.text or "New Color" or "nil"
					option.color = option.color or Color3.fromRGB(255, 255, 255)
					option.transparency = typeof(option.transparency) == "number" and option.transparency or typeof(option.transparency) == "boolean" and option.transparency or false
					option.flag = option.flag or option.text
					option.callback = option.callback or function() end
					option.transparencyCallback = option.transparencyCallback or function() end
					option.utilitytype = "color"

					local ColorPicker = {}

					do -- colorpicker
						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder
						ColorPicker["5b"] = Instance.new("Frame", Toggle["2f"]);
						ColorPicker["5b"]["ZIndex"] = 999;
						ColorPicker["5b"]["BorderSizePixel"] = 0;
						ColorPicker["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5b"]["Size"] = UDim2.new(0, 25, 0, 15);
						ColorPicker["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5b"]["Name"] = [[ColorpickerHolder]];
						ColorPicker["5b"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline
						ColorPicker["5d"] = Instance.new("Frame", ColorPicker["5b"]);
						ColorPicker["5d"]["BorderSizePixel"] = 0;
						ColorPicker["5d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["5d"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["5d"]["Size"] = UDim2.new(0, 25, 1, 0);
						ColorPicker["5d"]["Position"] = UDim2.new(1, 0, 0, 0);
						ColorPicker["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5d"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine
						ColorPicker["5e"] = Instance.new("Frame", ColorPicker["5d"]);
						ColorPicker["5e"]["BorderSizePixel"] = 0;
						ColorPicker["5e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5e"]["Name"] = [[InnerLine]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display
						ColorPicker["5f"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["5f"]["ZIndex"] = 2;
						ColorPicker["5f"]["BorderSizePixel"] = 0;
						ColorPicker["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["5f"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["5f"]["Name"] = [[Display]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display.UIGradient
						ColorPicker["60"] = Instance.new("UIGradient", ColorPicker["5f"]);
						ColorPicker["60"]["Rotation"] = 90;
						ColorPicker["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerButton
						ColorPicker["61"] = Instance.new("TextButton", ColorPicker["5e"]);
						ColorPicker["61"]["BorderSizePixel"] = 0;
						ColorPicker["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["TextTransparency"] = 1;
						ColorPicker["61"]["AutoButtonColor"] = false;
						ColorPicker["61"]["TextSize"] = 14;
						ColorPicker["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["61"]["Size"] = UDim2.new(1, 0, 1, 0);
						ColorPicker["61"]["BackgroundTransparency"] = 1;
						ColorPicker["61"]["Name"] = [[ColorPickerButton]];
						ColorPicker["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain
						ColorPicker["62"] = Instance.new("Frame", ColorPicker["5e"]);
						ColorPicker["62"]["Visible"] = false;
						ColorPicker["62"]["ZIndex"] = 10000;
						ColorPicker["62"]["BorderSizePixel"] = 0;
						ColorPicker["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["62"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["62"]["Size"] = UDim2.new(0, 125, 0, 150);
						ColorPicker["62"]["Position"] = UDim2.new(0, -1, 0, -1);
						ColorPicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["62"]["Name"] = [[ColorPickerMain]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline
						ColorPicker["63"] = Instance.new("Frame", ColorPicker["62"]);
						ColorPicker["63"]["BorderSizePixel"] = 0;
						ColorPicker["63"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["63"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["63"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main
						ColorPicker["64"] = Instance.new("Frame", ColorPicker["63"]);
						ColorPicker["64"]["BorderSizePixel"] = 0;
						ColorPicker["64"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["64"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["64"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["64"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIGradient
						ColorPicker["65"] = Instance.new("UIGradient", ColorPicker["64"]);
						ColorPicker["65"]["Rotation"] = 90;
						ColorPicker["65"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIPadding
						ColorPicker["66"] = Instance.new("UIPadding", ColorPicker["64"]);
						ColorPicker["66"]["PaddingTop"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingRight"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingLeft"] = UDim.new(0, 3);
						ColorPicker["66"]["PaddingBottom"] = UDim.new(0, 3);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder
						ColorPicker["67"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["67"]["BorderSizePixel"] = 0;
						ColorPicker["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["67"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["67"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["67"]["Position"] = UDim2.new(0, 0, 1, 0);
						ColorPicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["67"]["Name"] = [[RGBtextHolder]];
						ColorPicker["67"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.UIListLayout
						ColorPicker["68"] = Instance.new("UIListLayout", ColorPicker["67"]);
						ColorPicker["68"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
						ColorPicker["68"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
						ColorPicker["68"]["Padding"] = UDim.new(0, 1);
						ColorPicker["68"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
						ColorPicker["68"]["FillDirection"] = Enum.FillDirection.Horizontal;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R
						ColorPicker["69"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["69"]["BorderSizePixel"] = 0;
						ColorPicker["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["69"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["69"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["69"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["69"]["Name"] = [[R]];
						ColorPicker["69"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline
						ColorPicker["6a"] = Instance.new("Frame", ColorPicker["69"]);
						ColorPicker["6a"]["BorderSizePixel"] = 0;
						ColorPicker["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6a"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6a"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline
						ColorPicker["6b"] = Instance.new("Frame", ColorPicker["6a"]);
						ColorPicker["6b"]["BorderSizePixel"] = 0;
						ColorPicker["6b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6b"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6b"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main
						ColorPicker["6c"] = Instance.new("Frame", ColorPicker["6b"]);
						ColorPicker["6c"]["BorderSizePixel"] = 0;
						ColorPicker["6c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6c"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6c"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.R
						ColorPicker["6d"] = Instance.new("TextBox", ColorPicker["6c"]);
						ColorPicker["6d"]["TextStrokeTransparency"] = 0;
						ColorPicker["6d"]["Name"] = [[R]];
						ColorPicker["6d"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["6d"]["BorderSizePixel"] = 0;
						ColorPicker["6d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["6d"]["TextSize"] = 13;
						ColorPicker["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["6d"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6d"]["Text"] = [[255]];
						ColorPicker["6d"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.UIGradient
						ColorPicker["6e"] = Instance.new("UIGradient", ColorPicker["6c"]);
						ColorPicker["6e"]["Rotation"] = 90;
						ColorPicker["6e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G
						ColorPicker["6f"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["6f"]["BorderSizePixel"] = 0;
						ColorPicker["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["6f"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["6f"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["6f"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["6f"]["Name"] = [[G]];
						ColorPicker["6f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline
						ColorPicker["70"] = Instance.new("Frame", ColorPicker["6f"]);
						ColorPicker["70"]["BorderSizePixel"] = 0;
						ColorPicker["70"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["70"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["70"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["70"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline
						ColorPicker["71"] = Instance.new("Frame", ColorPicker["70"]);
						ColorPicker["71"]["BorderSizePixel"] = 0;
						ColorPicker["71"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["71"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["71"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main
						ColorPicker["72"] = Instance.new("Frame", ColorPicker["71"]);
						ColorPicker["72"]["BorderSizePixel"] = 0;
						ColorPicker["72"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["72"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["72"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["72"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.G
						ColorPicker["73"] = Instance.new("TextBox", ColorPicker["72"]);
						ColorPicker["73"]["TextStrokeTransparency"] = 0;
						ColorPicker["73"]["Name"] = [[G]];
						ColorPicker["73"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["73"]["BorderSizePixel"] = 0;
						ColorPicker["73"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["73"]["TextSize"] = 13;
						ColorPicker["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["73"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["73"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["73"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["73"]["Text"] = [[255]];
						ColorPicker["73"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.UIGradient
						ColorPicker["74"] = Instance.new("UIGradient", ColorPicker["72"]);
						ColorPicker["74"]["Rotation"] = 90;
						ColorPicker["74"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B
						ColorPicker["75"] = Instance.new("Frame", ColorPicker["67"]);
						ColorPicker["75"]["BorderSizePixel"] = 0;
						ColorPicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["75"]["AnchorPoint"] = Vector2.new(0, 1);
						ColorPicker["75"]["Size"] = UDim2.new(0, 33, 0, 15);
						ColorPicker["75"]["Position"] = UDim2.new(0, 37, 1, 0);
						ColorPicker["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["75"]["Name"] = [[B]];
						ColorPicker["75"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline
						ColorPicker["76"] = Instance.new("Frame", ColorPicker["75"]);
						ColorPicker["76"]["BorderSizePixel"] = 0;
						ColorPicker["76"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["76"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["76"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["76"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline
						ColorPicker["77"] = Instance.new("Frame", ColorPicker["76"]);
						ColorPicker["77"]["BorderSizePixel"] = 0;
						ColorPicker["77"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["77"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["77"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main
						ColorPicker["78"] = Instance.new("Frame", ColorPicker["77"]);
						ColorPicker["78"]["BorderSizePixel"] = 0;
						ColorPicker["78"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["78"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["78"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.B
						ColorPicker["79"] = Instance.new("TextBox", ColorPicker["78"]);
						ColorPicker["79"]["TextStrokeTransparency"] = 0;
						ColorPicker["79"]["Name"] = [[B]];
						ColorPicker["79"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["79"]["BorderSizePixel"] = 0;
						ColorPicker["79"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["79"]["TextSize"] = 13;
						ColorPicker["79"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["79"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["79"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["79"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["79"]["Text"] = [[255]];
						ColorPicker["79"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.UIGradient
						ColorPicker["7a"] = Instance.new("UIGradient", ColorPicker["78"]);
						ColorPicker["7a"]["Rotation"] = 90;
						ColorPicker["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue
						ColorPicker["7b"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7b"]["BorderSizePixel"] = 0;
						ColorPicker["7b"]["AutoButtonColor"] = false;
						ColorPicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7b"]["Selectable"] = false;
						ColorPicker["7b"]["AnchorPoint"] = Vector2.new(1, 0);
						ColorPicker["7b"]["Image"] = [[rbxassetid://2615692420]];
						ColorPicker["7b"]["Size"] = UDim2.new(0, 15, 0, 95);
						ColorPicker["7b"]["Name"] = [[Hue]];
						ColorPicker["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7b"]["Position"] = UDim2.new(1, 0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue.huecursor
						ColorPicker["7c"] = Instance.new("Frame", ColorPicker["7b"]);
						ColorPicker["7c"]["BorderSizePixel"] = 0;
						ColorPicker["7c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["7c"]["AnchorPoint"] = Vector2.new(0.5, 0);
						ColorPicker["7c"]["Size"] = UDim2.new(1, 6, 0, 3);
						ColorPicker["7c"]["Position"] = UDim2.new(0.5, 0, 0, 0);
						ColorPicker["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7c"]["Name"] = [[huecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme
						ColorPicker["7d"] = Instance.new("ImageButton", ColorPicker["64"]);
						ColorPicker["7d"]["BorderSizePixel"] = 0;
						ColorPicker["7d"]["AutoButtonColor"] = false;
						ColorPicker["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7d"]["Selectable"] = false;
						ColorPicker["7d"]["Image"] = [[rbxassetid://2615689005]];
						ColorPicker["7d"]["Size"] = UDim2.new(0, 95, 0, 95);
						ColorPicker["7d"]["Name"] = [[Scheme]];
						ColorPicker["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme.schemecursor
						ColorPicker["7e"] = Instance.new("ImageLabel", ColorPicker["7d"]);
						ColorPicker["7e"]["ZIndex"] = 5;
						ColorPicker["7e"]["BorderSizePixel"] = 0;
						ColorPicker["7e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["Image"] = [[http://www.roblox.com/asset/?id=16006380635]];
						ColorPicker["7e"]["ImageRectSize"] = Vector2.new(1000, 1000);
						ColorPicker["7e"]["Size"] = UDim2.new(0, 5, 0, 5);
						ColorPicker["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7e"]["BackgroundTransparency"] = 1;
						ColorPicker["7e"]["Name"] = [[schemecursor]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency
						ColorPicker["7f"] = Instance.new("Frame", ColorPicker["64"]);
						ColorPicker["7f"]["BorderSizePixel"] = 0;
						ColorPicker["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["7f"]["AnchorPoint"] = Vector2.new(0.5, 1);
						ColorPicker["7f"]["Size"] = UDim2.new(1, 0, 0, 18);
						ColorPicker["7f"]["Position"] = UDim2.new(0.5, 0, 1, -20);
						ColorPicker["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["7f"]["Name"] = [[Transparency]];
						ColorPicker["7f"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline
						ColorPicker["80"] = Instance.new("Frame", ColorPicker["7f"]);
						ColorPicker["80"]["BorderSizePixel"] = 0;
						ColorPicker["80"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						ColorPicker["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["80"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["80"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["80"]["Name"] = [[Outline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline
						ColorPicker["81"] = Instance.new("Frame", ColorPicker["80"]);
						ColorPicker["81"]["BorderSizePixel"] = 0;
						ColorPicker["81"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["81"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["81"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["81"]["Name"] = [[Innerline]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main
						ColorPicker["82"] = Instance.new("Frame", ColorPicker["81"]);
						ColorPicker["82"]["BorderSizePixel"] = 0;
						ColorPicker["82"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["82"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["82"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["82"]["Name"] = [[Main]];


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.Transparency
						ColorPicker["83"] = Instance.new("TextBox", ColorPicker["82"]);
						ColorPicker["83"]["TextStrokeTransparency"] = 0;
						ColorPicker["83"]["Name"] = [[Transparency]];
						ColorPicker["83"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
						ColorPicker["83"]["BorderSizePixel"] = 0;
						ColorPicker["83"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
						ColorPicker["83"]["TextSize"] = 13;
						ColorPicker["83"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["83"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
						ColorPicker["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						ColorPicker["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["83"]["PlaceholderText"] = [[Transparency:]];
						ColorPicker["83"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["83"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
						ColorPicker["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["83"]["Text"] = [[100]];
						ColorPicker["83"]["BackgroundTransparency"] = 1;


						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.UIGradient
						ColorPicker["84"] = Instance.new("UIGradient", ColorPicker["82"]);
						ColorPicker["84"]["Rotation"] = 90;
						ColorPicker["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};

						-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Frame
						ColorPicker["86"] = Instance.new("ImageLabel", ColorPicker["5e"]);
						ColorPicker["86"]["BorderSizePixel"] = 0;
						ColorPicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
						ColorPicker["86"]["ScaleType"] = Enum.ScaleType.Crop;
						ColorPicker["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
						ColorPicker["86"]["Image"] = [[rbxassetid://98372645101260]];
						ColorPicker["86"]["ImageRectSize"] = Vector2.new(100, 100);
						ColorPicker["86"]["Size"] = UDim2.new(1, -2, 1, -2);
						ColorPicker["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						ColorPicker["86"]["Name"] = [[Frame]];
						ColorPicker["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					end

					do -- logic
						local opened = false

						ColorPicker["61"].MouseButton1Click:Connect(function()
							ColorPicker["62"].Visible = not opened
							opened = not opened
						end)

						local colorPickerMain = ColorPicker["62"]
						local scrollFrame = Tab["1e"]

						-- Function to update position and anchor point
						local function updatePosition()
							local pickerAbsPos = colorPickerMain.AbsolutePosition
							local scrollFrameAbsPos = scrollFrame.AbsolutePosition
							local scrollFrameSize = scrollFrame.AbsoluteSize

							-- Check if touching the top
							if pickerAbsPos.Y < scrollFrameAbsPos.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 1, 1) -- Position at the top
								colorPickerMain.AnchorPoint = Vector2.new(0, 0) -- Anchor point at the top
								print("Moved to top with AnchorPoint 0,0 and Position {0, -1}, {1, 1}")
							end

							-- Check if touching the bottom
							if pickerAbsPos.Y + colorPickerMain.AbsoluteSize.Y > scrollFrameAbsPos.Y + scrollFrameSize.Y then
								colorPickerMain.Position = UDim2.new(0, -1, 0, -1) -- Position at the bottom
								colorPickerMain.AnchorPoint = Vector2.new(0, 1) -- Anchor point at the bottom
								print("Moved to bottom with AnchorPoint 0,1 and Position {0, -1}, {0, -1}")
							end
						end

						-- Connect to the RenderStepped event for constant checking
						game:GetService("RunService").RenderStepped:Connect(updatePosition)

						local white, black = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
						local colors = {
							Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0),
							Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0)
						}

						local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
						local UserInputService = game:GetService("UserInputService")

						-- UI elements
						local Schema = ColorPicker["7d"] -- Gradient area
						local SchemaCursor = ColorPicker["7e"] -- Cursor for the scheme
						local HUE = ColorPicker["7b"] -- Hue bar
						local HueCursor = ColorPicker["7c"] -- Cursor for the hue bar
						local Display = ColorPicker["5f"] -- Color display
						local TransparencyTextBox = ColorPicker["83"] -- Transparency input box
						local TextBoxR = ColorPicker["6d"] -- Red input box
						local TextBoxG = ColorPicker["73"] -- Green input box
						local TextBoxB = ColorPicker["79"] -- Blue input box

						-- Function: Convert RGB to HSV
						local function rgbToHSV(color)
							local r, g, b = color.R, color.G, color.B
							local max, min = math.max(r, g, b), math.min(r, g, b)
							local delta = max - min

							local h = 0
							if delta > 0 then
								if max == r then
									h = (g - b) / delta % 6
								elseif max == g then
									h = (b - r) / delta + 2
								elseif max == b then
									h = (r - g) / delta + 4
								end
								h = h / 6
							end

							local s = (max == 0) and 0 or delta / max
							local v = max
							return h, s, v
						end

						-- Function: Clamp a value between min and max
						local function clamp(value, min, max)
							return math.max(min, math.min(max, value))
						end

						-- Function: Update the color display
						local function updateColor(outputColor)
							if typeof(outputColor) ~= "Color3" then
								error("Invalid color value: Expected Color3, got " .. typeof(outputColor))
							end

							Display.BackgroundColor3 = outputColor
							option.color = outputColor

							local r = math.floor(outputColor.R * 255 + 0.5)
							local g = math.floor(outputColor.G * 255 + 0.5)
							local b = math.floor(outputColor.B * 255 + 0.5)

							TextBoxR.Text = tostring(r)
							TextBoxG.Text = tostring(g)
							TextBoxB.Text = tostring(b)

							if option.callback then
								option.callback(outputColor)
							end
						end

						-- Function to update the hue-based color dynamically
						local function updateHueColor(huePercent)
							-- Calculate the color from the hue percentage
							local hueColor = Color3.fromHSV(huePercent, 1, 1)

							-- Update the scheme's background color to reflect the hue
							Schema.BackgroundColor3 = hueColor

							-- Calculate the scheme cursor's position and update the final color
							local xP = math.clamp((SchemaCursor.AbsolutePosition.X - Schema.AbsolutePosition.X) / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp((SchemaCursor.AbsolutePosition.Y - Schema.AbsolutePosition.Y) / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(hueColor, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function to update the scheme-based color dynamically
						local function updateSchemeColor(relativeX, relativeY)
							-- Calculate the interpolated color based on cursor position
							local xP = math.clamp(relativeX / Schema.AbsoluteSize.X, 0, 1)
							local yP = math.clamp(relativeY / Schema.AbsoluteSize.Y, 0, 1)
							local outputColor = white:Lerp(Schema.BackgroundColor3, xP):Lerp(black, yP)

							-- Update the display, text boxes, and trigger callbacks
							updateColor(outputColor)
						end

						-- Function: Sync color picker cursors and display based on a Color3 value
						local function syncColor()
							local h, s, v = rgbToHSV(option.color)

							local huePosition = h * HUE.AbsoluteSize.Y
							HueCursor.Position = UDim2.new(0.5, 0, 0, huePosition - (HueCursor.AbsoluteSize.Y / 2))

							local hueColor = Color3.fromHSV(h, 1, 1)
							Schema.BackgroundColor3 = hueColor

							local schemeX = s * Schema.AbsoluteSize.X
							local schemeY = (1 - v) * Schema.AbsoluteSize.Y
							SchemaCursor.Position = UDim2.new(0, schemeX - (SchemaCursor.AbsoluteSize.X / 2), 0, schemeY - (SchemaCursor.AbsoluteSize.Y / 2))

							updateColor(option.color)
						end

						-- Function: Update transparency
						local function updateTransparency(transparencyValue)
							local clampedValue = clamp(transparencyValue, 0, 100)
							local callbackValue = 1 - (clampedValue / 100)

							Display.BackgroundTransparency = callbackValue
							option.transparency = clampedValue

							if option.transparencyCallback then
								option.transparencyCallback(callbackValue)
							end

							TransparencyTextBox.Text = tostring(clampedValue)
						end

						-- Connect transparency TextBox changes
						TransparencyTextBox.FocusLost:Connect(function()
							local transparencyValue = tonumber(TransparencyTextBox.Text)
							if transparencyValue then
								updateTransparency(transparencyValue)
							else
								TransparencyTextBox.Text = tostring(option.transparency)
							end
						end)

						TransparencyTextBox:GetPropertyChangedSignal("Text"):Connect(function()
							local inputText = TransparencyTextBox.Text
							if not tonumber(inputText) and inputText ~= "" then
								TransparencyTextBox.Text = inputText:gsub("%D", "")
							end
						end)

						-- Function: Handle RGB input changes
						local function handleRGBInputChange(textBox, component)
							textBox.FocusLost:Connect(function()
								local inputValue = tonumber(textBox.Text)
								if inputValue then
									local r = component == "R" and inputValue or math.floor(option.color.R * 255 + 0.5)
									local g = component == "G" and inputValue or math.floor(option.color.G * 255 + 0.5)
									local b = component == "B" and inputValue or math.floor(option.color.B * 255 + 0.5)

									option.color = Color3.fromRGB(clamp(r, 0, 255), clamp(g, 0, 255), clamp(b, 0, 255))
									syncColor()
								else
									textBox.Text = tostring(math.floor(option.color[component] * 255 + 0.5))
								end
							end)

							textBox:GetPropertyChangedSignal("Text"):Connect(function()
								local inputText = textBox.Text
								if not tonumber(inputText) and inputText ~= "" then
									textBox.Text = inputText:gsub("%D", "")
								end
							end)
						end

						-- Logic for interacting with the hue bar
						HUE.MouseButton1Down:Connect(function()
							-- Function to dynamically update the hue cursor and color
							local function updateHueCursor()
								local relativeY = math.clamp(Mouse.Y - HUE.AbsolutePosition.Y, 0, HUE.AbsoluteSize.Y)

								-- Correct the X offset: center the cursor horizontally within the hue bar
								HueCursor.Position = UDim2.new(0.5, 0, 0, relativeY - (HueCursor.AbsoluteSize.Y / 2))

								-- Calculate hue as a percentage (0 to 1) and update the color
								local huePercent = math.clamp(relativeY / HUE.AbsoluteSize.Y, 0, 1)
								updateHueColor(huePercent)
							end

							-- Initial update
							updateHueCursor()

							-- Connect mouse movement for dragging
							local hueConnection
							hueConnection = Mouse.Move:Connect(updateHueCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if hueConnection then
										hueConnection:Disconnect()
										hueConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						-- Logic for interacting with the scheme area
						Schema.MouseButton1Down:Connect(function()
							-- Function to dynamically update the scheme cursor and color
							local function updateSchemeCursor()
								local relativeX = math.clamp(Mouse.X - Schema.AbsolutePosition.X, 0, Schema.AbsoluteSize.X)
								local relativeY = math.clamp(Mouse.Y - Schema.AbsolutePosition.Y, 0, Schema.AbsoluteSize.Y)

								-- Update the cursor position
								SchemaCursor.Position = UDim2.new(0, relativeX - (SchemaCursor.AbsoluteSize.X / 2), 0, relativeY - (SchemaCursor.AbsoluteSize.Y / 2))

								-- Update the scheme-based color
								updateSchemeColor(relativeX, relativeY)
							end

							-- Initial update
							updateSchemeCursor()

							-- Connect mouse movement for dragging
							local schemeConnection
							schemeConnection = Mouse.Move:Connect(updateSchemeCursor)

							-- Detect when the mouse button is released
							local inputEndedConnection
							inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then
									-- Disconnect connections safely
									if schemeConnection then
										schemeConnection:Disconnect()
										schemeConnection = nil
									end
									if inputEndedConnection then
										inputEndedConnection:Disconnect()
										inputEndedConnection = nil
									end
								end
							end)
						end)

						handleRGBInputChange(TextBoxR, "R")
						handleRGBInputChange(TextBoxG, "G")
						handleRGBInputChange(TextBoxB, "B")

						-- Initialize color picker
						syncColor()
						updateTransparency(option.transparency)
					end

					return ColorPicker
				end

				return Toggle
			end

			function section:NewButton(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "Button"
				option.callback = option.callback or function() end

				local Button = {}

				do -- button
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder
					Button["54"] = Instance.new("Frame", section["b3"]);
					Button["54"]["BorderSizePixel"] = 0;
					Button["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["54"]["Size"] = UDim2.new(1, 0, 0, 18);
					Button["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["54"]["Name"] = [[ButtonHolder]];
					Button["54"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline
					Button["55"] = Instance.new("Frame", Button["54"]);
					Button["55"]["BorderSizePixel"] = 0;
					Button["55"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Button["55"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["55"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["55"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Button["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["55"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline
					Button["56"] = Instance.new("Frame", Button["55"]);
					Button["56"]["BorderSizePixel"] = 0;
					Button["56"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Button["56"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["56"]["Size"] = UDim2.new(1, -2, 1, -2);
					Button["56"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Button["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["56"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline.Main
					Button["57"] = Instance.new("Frame", Button["56"]);
					Button["57"]["BorderSizePixel"] = 0;
					Button["57"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Button["57"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["57"]["Size"] = UDim2.new(1, -2, 1, -2);
					Button["57"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Button["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["57"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline.Main.UIGradient
					Button["58"] = Instance.new("UIGradient", Button["57"]);
					Button["58"]["Rotation"] = 90;
					Button["58"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Outline.Innerline.Main.TextLabel
					Button["59"] = Instance.new("TextLabel", Button["57"]);
					Button["59"]["TextStrokeTransparency"] = 0;
					Button["59"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Button["59"]["BorderSizePixel"] = 0;
					Button["59"]["TextSize"] = 14;
					Button["59"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Button["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Button["59"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Button["59"]["BackgroundTransparency"] = 1;
					Button["59"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["59"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["59"]["Text"] = option.text;
					Button["59"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ButtonHolder.Button
					Button["5a"] = Instance.new("TextButton", Button["54"]);
					Button["5a"]["BorderSizePixel"] = 0;
					Button["5a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Button["5a"]["TextTransparency"] = 1;
					Button["5a"]["TextSize"] = 14;
					Button["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Button["5a"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["5a"]["BackgroundTransparency"] = 1;
					Button["5a"]["Name"] = [[Button]];
					Button["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				end

				do -- logic
					local btnButton = Button["5a"]
					local basiccolor = Color3.fromRGB(31,31,31)

					btnButton.MouseButton1Click:Connect(function()
						pcall(option.callback)
						Button["56"]["BackgroundColor3"] = basiccolor
						wait(0.05)
						Button["56"]["BackgroundColor3"] = Color3.fromRGB(50,50,50)
						tweenObject(Button["56"], {BackgroundColor3 = basiccolor}, 2)
					end)

					btnButton.MouseEnter:Connect(function()
						Button["59"]["TextColor3"] = Color3.fromRGB(112, 112, 112);
					end)

					btnButton.MouseLeave:Connect(function()
						Button["59"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					end)
				end

				return Button
			end

			function section:NewKeybind(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text
				option.key = option.key or Enum.KeyCode.World95
				option.flag = option.flag or option.text
				option.callback = option.callback or function() end
				option.utilitytype = "keybind"

				local Keybind = {}

				do -- keybind
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder
					Keybind["87"] = Instance.new("Frame", section["b3"]);
					Keybind["87"]["BorderSizePixel"] = 0;
					Keybind["87"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["87"]["Size"] = UDim2.new(1, 0, 0, 15);
					Keybind["87"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["87"]["Name"] = [[KeybindHolder]];
					Keybind["87"]["BackgroundTransparency"] = 1;
					Keybind["87"]["ZIndex"] = 10


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline
					Keybind["88"] = Instance.new("Frame", Keybind["87"]);
					Keybind["88"]["BorderSizePixel"] = 0;
					Keybind["88"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Keybind["88"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Keybind["88"]["Size"] = UDim2.new(0, 25, 1, 0);
					Keybind["88"]["Position"] = UDim2.new(1, 0, 0.5, 0);
					Keybind["88"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["88"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline
					Keybind["89"] = Instance.new("Frame", Keybind["88"]);
					Keybind["89"]["BorderSizePixel"] = 0;
					Keybind["89"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["89"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["89"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["89"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["89"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main
					Keybind["8a"] = Instance.new("Frame", Keybind["89"]);
					Keybind["8a"]["BorderSizePixel"] = 0;
					Keybind["8a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["8a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8a"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["8a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["8a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8a"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.UIGradient
					Keybind["8b"] = Instance.new("UIGradient", Keybind["8a"]);
					Keybind["8b"]["Rotation"] = 90;
					Keybind["8b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Keybind
					Keybind["8c"] = Instance.new("TextLabel", Keybind["8a"]);
					Keybind["8c"]["TextStrokeTransparency"] = 0;
					Keybind["8c"]["ZIndex"] = 1;
					Keybind["8c"]["BorderSizePixel"] = 0;
					Keybind["8c"]["TextSize"] = 12;
					Keybind["8c"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["8c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["8c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["8c"]["BackgroundTransparency"] = 1;
					Keybind["8c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8c"]["Size"] = UDim2.new(1, 0, 1, 0);
					Keybind["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8c"]["Text"] = [[...]];
					Keybind["8c"]["Name"] = [[Keybind]];
					Keybind["8c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings
					Keybind["8d"] = Instance.new("Frame", Keybind["8a"]);
					Keybind["8d"]["Visible"] = false;
					Keybind["8d"]["BorderSizePixel"] = 0;
					Keybind["8d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Keybind["8d"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Keybind["8d"]["Size"] = UDim2.new(0, 50, 0, 50);
					Keybind["8d"]["Position"] = UDim2.new(0.5, 0, 1, 1);
					Keybind["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8d"]["Name"] = [[Settings]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline
					Keybind["8e"] = Instance.new("Frame", Keybind["8d"]);
					Keybind["8e"]["BorderSizePixel"] = 0;
					Keybind["8e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["8e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8e"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["8e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8e"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main
					Keybind["8f"] = Instance.new("Frame", Keybind["8e"]);
					Keybind["8f"]["BorderSizePixel"] = 0;
					Keybind["8f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Keybind["8f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["8f"]["Size"] = UDim2.new(1, -2, 1, -2);
					Keybind["8f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Keybind["8f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["8f"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIGradient
					Keybind["90"] = Instance.new("UIGradient", Keybind["8f"]);
					Keybind["90"]["Rotation"] = 90;
					Keybind["90"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.UIListLayout
					Keybind["91"] = Instance.new("UIListLayout", Keybind["8f"]);
					Keybind["91"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Keybind["91"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
					Keybind["91"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
					Keybind["91"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Always
					Keybind["92"] = Instance.new("TextButton", Keybind["8f"]);
					Keybind["92"]["TextStrokeTransparency"] = 0;
					Keybind["92"]["BorderSizePixel"] = 0;
					Keybind["92"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["92"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["92"]["TextSize"] = 12;
					Keybind["92"]["BackgroundColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["92"]["Size"] = UDim2.new(0, 200, 0, 50);
					Keybind["92"]["BackgroundTransparency"] = 1;
					Keybind["92"]["Name"] = [[Always]];
					Keybind["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["92"]["Text"] = [[always]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.Toggle
					Keybind["93"] = Instance.new("TextButton", Keybind["8f"]);
					Keybind["93"]["TextStrokeTransparency"] = 0;
					Keybind["93"]["BorderSizePixel"] = 0;
					Keybind["93"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["93"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["93"]["TextSize"] = 12;
					Keybind["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["93"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["93"]["Size"] = UDim2.new(0, 200, 0, 50);
					Keybind["93"]["BackgroundTransparency"] = 1;
					Keybind["93"]["Name"] = [[Toggle]];
					Keybind["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["93"]["Text"] = [[toggle]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.Innerline.Main.Settings.Innerline.Main.OnHold
					Keybind["94"] = Instance.new("TextButton", Keybind["8f"]);
					Keybind["94"]["TextStrokeTransparency"] = 0;
					Keybind["94"]["BorderSizePixel"] = 0;
					Keybind["94"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["94"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["94"]["TextSize"] = 12;
					Keybind["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["94"]["Size"] = UDim2.new(0, 200, 0, 50);
					Keybind["94"]["BackgroundTransparency"] = 1;
					Keybind["94"]["Name"] = [[OnHold]];
					Keybind["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["94"]["Text"] = [[on hold]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.Outline.SetKeybindButton
					Keybind["95"] = Instance.new("TextButton", Keybind["88"]);
					Keybind["95"]["BorderSizePixel"] = 0;
					Keybind["95"]["ZIndex"] = 5
					Keybind["95"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["95"]["TextTransparency"] = 1;
					Keybind["95"]["TextSize"] = 14;
					Keybind["95"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["95"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["95"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Keybind["95"]["Size"] = UDim2.new(1, 0, 1, 0);
					Keybind["95"]["BackgroundTransparency"] = 1;
					Keybind["95"]["Name"] = [[SetKeybindButton]];
					Keybind["95"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["95"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.KeybindHolder.KeybindText
					Keybind["96"] = Instance.new("TextLabel", Keybind["87"]);
					Keybind["96"]["TextStrokeTransparency"] = 0;
					Keybind["96"]["BorderSizePixel"] = 0;
					Keybind["96"]["TextSize"] = 14;
					Keybind["96"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Keybind["96"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Keybind["96"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Keybind["96"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Keybind["96"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Keybind["96"]["BackgroundTransparency"] = 1;
					Keybind["96"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Keybind["96"]["Size"] = UDim2.new(1, -25, 1, 0);
					Keybind["96"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Keybind["96"]["Text"] = option.text;
					Keybind["96"]["Name"] = [[KeybindText]];
					Keybind["96"]["Position"] = UDim2.new(0, 0, 0.5, 0);
				end

				do -- logic				

					local hold = false
					local onhold = false
					local opened = false
					local activecolor = Color3.fromRGB(255, 255, 255)
					local notactivecolor = Color3.fromRGB(92, 92, 92)
					local activebutton = "button92"

					local shorts = {
						RightAlt = "RA",
						LeftAlt = "LA",
						RightControl = "RC",
						LeftControl = "LC",
						LeftShift = "LS",
						RightShift = "RS",
						MouseButton1 = "M1",
						MouseButton2 = "M2",
						Return = "ENT",
						Backspace = "BP",
						Tab = "TAB",
						CapsLock = "CL",
						Escape = "ESC",
						Insert = "INS",
						PageUp = "UP",
						PageDown = "DOWN",
						KeypadMultiply = "*",
						KeypadDivide = "/",
						End = "END",
						Unknown = "?",
						World95 = "?"
					}

					local ignored = {
						W = true,
						A = true,
						S = true,
						D = true,
						Space = true,
						F = true,
						R = true
					}

					Keybind["8c"].Text = tostring(shorts[option.key.Name]) or tostring(option.key.Name)
					if Keybind["8c"].Text:match("nil") then
						Keybind["8c"].Text = tostring(option.key.Name)
					end

					local newBindButtonSize =
						game:GetService("TextService"):GetTextSize(
							Keybind["8c"].Text,
							Keybind["8c"].TextSize,
							Keybind["8c"].Font,
							Vector2.new(math.huge, math.huge)
						)
					Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)

					Keybind["95"].MouseButton2Click:Connect(function()
						if opened == true then
							Keybind["8d"].Visible = false
							opened = false
						elseif opened == false then
							Keybind["8d"].Visible = true
							opened = true
						end
					end)

					Keybind["92"].MouseButton1Click:Connect(function()
						if activebutton ~= "button92" then
							if activebutton == "button93" then
								Keybind["93"].TextColor3 = notactivecolor
							elseif activebutton == "button94" then
								Keybind["94"].TextColor3 = notactivecolor
							end	
						end

						Keybind["92"].TextColor3 = activecolor
						activebutton = "button92"
					end)

					Keybind["93"].MouseButton1Click:Connect(function()
						if activebutton ~= "button93" then
							if activebutton == "button92" then
								Keybind["92"].TextColor3 = notactivecolor
							elseif activebutton == "button94" then
								Keybind["94"].TextColor3 = notactivecolor
							end						
						end

						Keybind["93"].TextColor3 = activecolor
						activebutton = "button93"
					end)



					Keybind["94"].MouseButton1Click:Connect(function()
						if activebutton ~= "button94" then
							if activebutton == "button92" then
								Keybind["92"].TextColor3 = notactivecolor
							elseif activebutton == "button93" then
								Keybind["93"].TextColor3 = notactivecolor
							end	
						end

						Keybind["94"].TextColor3 = activecolor
						activebutton = "button94"
					end)

					Keybind["95"].MouseButton1Click:Connect(function()
						hold = true
						if hold == true then
							Keybind["8c"].Text = " ... "
							local newBindButtonSize =
								game:GetService("TextService"):GetTextSize(
									Keybind["8c"].Text,
									Keybind["8c"].TextSize,
									Keybind["8c"].Font,
									Vector2.new(math.huge, math.huge)
								)
							Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
							local Input
							repeat Input = game:GetService("UserInputService").InputBegan:Wait() until not ignored[Input.KeyCode.Name] do end
							if Input.KeyCode.Name ~= "Unknown" and not ignored[Input.KeyCode.Name] then
								local K = shorts[Input.KeyCode.Name] or Input.KeyCode.Name
								Keybind["8c"].Text = K
								option.key = Input.KeyCode
								local newBindButtonSize =
									game:GetService("TextService"):GetTextSize(
										Keybind["8c"].Text,
										Keybind["8c"].TextSize,
										Keybind["8c"].Font,
										Vector2.new(math.huge, math.huge)
									)
								Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
								Library.Flags[option.flag] = option.key.Name									
							end
						end
						wait()
						hold = false
					end)

					if activebutton == "button92" then
						print("lol")
					end

					UserInputService.InputBegan:Connect(function(k, t)
						if activebutton == "button93" then
							if t then return end
							if k.KeyCode == option.key then
								if not option.hold then
									option.callback(option.key)
								end
							end
						elseif activebutton == "button94" then
							if t then return end
							if k.KeyCode == option.key then
								if not option.hold then
									if not onhold then
										onhold = true
										print("holding")
									end
								end
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(k, t)
						if activebutton == "button94" then
							if t then return end
							if k.KeyCode == option.key then
								if not option.hold then
									if onhold then
										onhold = false
										print("released")
									end
								end
							end
						end
					end)


					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.key.Name
						Library.Items[option.flag] = option
					end

					function option:SetValue(key)
						option.key = key
						local text = shorts[option.key.Name] or option.key.Name
						Keybind["8c"].Text = text
						local newBindButtonSize =
							game:GetService("TextService"):GetTextSize(
								Keybind["8c"].Text,
								Keybind["8c"].TextSize,
								Keybind["8c"].Font,
								Vector2.new(math.huge, math.huge)
							)
						Keybind["8c"].Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
						Library.Flags[option.flag] = option.key.Name
					end
				end

				return Keybind
			end

			function section:NewLabel(option)
				option = typeof(option) and option or {}
				option.text = option.text or "New Label"

				local Label = {}

				do -- label
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.LabelHolder
					Label["3c"] = Instance.new("Frame", section["b3"]);
					Label["3c"]["BorderSizePixel"] = 0;
					Label["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["3c"]["Size"] = UDim2.new(1, 0, 0, 15);
					Label["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["3c"]["Name"] = [[LabelHolder]];
					Label["3c"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.LabelHolder.LabelText
					Label["3d"] = Instance.new("TextLabel", Label["3c"]);
					Label["3d"]["TextStrokeTransparency"] = 0;
					Label["3d"]["BorderSizePixel"] = 0;
					Label["3d"]["TextSize"] = 14;
					Label["3d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Label["3d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Label["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Label["3d"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Label["3d"]["BackgroundTransparency"] = 1;
					Label["3d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Label["3d"]["Size"] = UDim2.new(1, 0, 1, 0);
					Label["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["3d"]["Text"] = option.text;
					Label["3d"]["Name"] = [[LabelText]];
					Label["3d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
				end

				return Label
			end

			function section:NewSlider(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "New Slider"
				option.min = option.min or 0
				option.max = option.max  or 100
				option.value = option.value or 0
				option.flag = option.flag or option.text
				option.float = typeof(option.float) == "number" and option.float or 0
				option.suffix = option.suffix or ""
				option.callback = option.callback or function() end
				option.utilitytype = "slider"

				local Slider = {}

				do -- slider
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder
					Slider["31"] = Instance.new("Frame", section["b3"]);
					Slider["31"]["BorderSizePixel"] = 0;
					Slider["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["31"]["Size"] = UDim2.new(1, 0, 0, 33);
					Slider["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["31"]["Name"] = [[SliderHolder]];
					Slider["31"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderTextHolder
					Slider["32"] = Instance.new("Frame", Slider["31"]);
					Slider["32"]["BorderSizePixel"] = 0;
					Slider["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["32"]["Size"] = UDim2.new(1, 0, 0.5, -1);
					Slider["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["32"]["Name"] = [[SliderTextHolder]];
					Slider["32"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderTextHolder.SliderText
					Slider["33"] = Instance.new("TextLabel", Slider["32"]);
					Slider["33"]["TextStrokeTransparency"] = 0;
					Slider["33"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Slider["33"]["BorderSizePixel"] = 0;
					Slider["33"]["TextSize"] = 14;
					Slider["33"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["33"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Slider["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["33"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Slider["33"]["BackgroundTransparency"] = 1;
					Slider["33"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["33"]["Size"] = UDim2.new(1, 0, 1, 0);
					Slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["33"]["Text"] = option.text;
					Slider["33"]["Name"] = [[SliderText]];
					Slider["33"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder
					Slider["34"] = Instance.new("Frame", Slider["31"]);
					Slider["34"]["BorderSizePixel"] = 0;
					Slider["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["34"]["AnchorPoint"] = Vector2.new(0, 1);
					Slider["34"]["Size"] = UDim2.new(1, 0, 0.5, 2);
					Slider["34"]["Position"] = UDim2.new(0, 0, 1, 0);
					Slider["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["34"]["Name"] = [[SliderMainHolder]];
					Slider["34"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline
					Slider["35"] = Instance.new("Frame", Slider["34"]);
					Slider["35"]["BorderSizePixel"] = 0;
					Slider["35"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Slider["35"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["35"]["Size"] = UDim2.new(1, -2, 1, -2);
					Slider["35"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Slider["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["35"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline
					Slider["36"] = Instance.new("Frame", Slider["35"]);
					Slider["36"]["BorderSizePixel"] = 0;
					Slider["36"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Slider["36"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["36"]["Size"] = UDim2.new(1, -2, 1, -2);
					Slider["36"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Slider["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["36"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderBackground
					Slider["37"] = Instance.new("Frame", Slider["36"]);
					Slider["37"]["Active"] = true;
					Slider["37"]["ZIndex"] = 0;
					Slider["37"]["BorderSizePixel"] = 0;
					Slider["37"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Slider["37"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["37"]["Size"] = UDim2.new(1, -2, 1, -2);
					Slider["37"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Slider["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["37"]["Name"] = [[SliderBackground]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderBackground.UIGradient
					Slider["38"] = Instance.new("UIGradient", Slider["37"]);
					Slider["38"]["Rotation"] = 90;
					Slider["38"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderFill
					Slider["39"] = Instance.new("Frame", Slider["36"]);
					Slider["39"]["BorderSizePixel"] = 0;
					Slider["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["39"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Slider["39"]["Size"] = UDim2.new(0.5, 0, 1, 0);
					Slider["39"]["Position"] = UDim2.new(0, 0, 0.5, 0);
					Slider["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["39"]["Name"] = [[SliderFill]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderFill.UIGradient
					Slider["3a"] = Instance.new("UIGradient", Slider["39"]);
					Slider["3a"]["Rotation"] = 90;
					Slider["3a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.SliderHolder.SliderMainHolder.Outline.Innerline.SliderFill.TextLabel
					Slider["3b"] = Instance.new("TextBox", Slider["39"]);
					Slider["3b"]["TextStrokeTransparency"] = 0;
					Slider["3b"]["Name"] = [[TextLabel]];
					Slider["3b"]["BorderSizePixel"] = 0;
					Slider["3b"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Slider["3b"]["TextSize"] = 13;
					Slider["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["3b"]["Selectable"] = false;
					Slider["3b"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Slider["3b"]["Size"] = UDim2.new(0, 1, 1, 0);
					Slider["3b"]["Position"] = UDim2.new(1, 1, 0.5, 0);
					Slider["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["3b"]["Text"] = [[50/100]];
				end

				do -- logic
					local frameSlider = Slider["39"]
					local ignoreSliderValue = Slider["3b"]
					local btnSlider = Slider["37"]

					local dragging = false
					local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

					if option.value > option.max then
						option.value = option.max
						frameSlider.Size = UDim2.new(0, option.value == option.min and 0 or math.floor((((option.value - option.min) / (option.max - option.min)) * 178) + 0.5), 0, 15)

						ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					elseif option.value < option.min then
						option.value = option.min
						frameSlider.Size = UDim2.new(0, option.value == option.min and 0 or math.floor((((option.value - option.min) / (option.max - option.min)) * 178) + 0.5), 0, 15)
						ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					else
						option.value = option.value
						frameSlider.Size = UDim2.new(0, option.value == option.min and 0 or math.floor((((option.value - option.min) / (option.max - option.min)) * 178) + 0.5), 0, 15)

						ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					end
					option.callback(option.value)

					frameSlider.Size = UDim2.new(0, math.floor(((((option.value - option.min) / (option.max - option.min)) * 178) + 0) * 100) / 100, 0, 15)

					ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
					option.callback(option.value)

					local UIS = game:GetService("UserInputService")

					local function updateSlider()
						frameSlider.Size = UDim2.new(0, math.clamp(math.floor(((option.value - option.min) / (option.max - option.min)) * 178), 0, 178), 0, 15)
						ignoreSliderValue.Text = tostring(option.value) .. "/" .. tostring(option.max) .. option.suffix
						if option.callback then
							pcall(option.callback, option.value)
						end
					end


					btnSlider.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							local moveConnection
							moveConnection = Mouse.Move:Connect(function()
								local mouseDelta = math.clamp(Mouse.X - frameSlider.AbsolutePosition.X, 0, 178)
								option.value = tonumber(string.format("%." .. option.float .. "f", (mouseDelta / 178) * (option.max - option.min) + option.min))
								updateSlider()
							end)

							local releaseConnection
							releaseConnection = UIS.InputEnded:Connect(function(releaseInput)
								if releaseInput.UserInputType == Enum.UserInputType.MouseButton1 then
									moveConnection:Disconnect()
									releaseConnection:Disconnect()
									dragging = false
								end
							end)
						end
					end)

					-- Add a listener for the TextBox to handle user input
					ignoreSliderValue.FocusLost:Connect(function(enterPressed)
						if enterPressed then
							-- Try to parse the user input as a number
							local inputValue = tonumber(ignoreSliderValue.Text)

							if inputValue then
								-- Clamp the input value to the valid range
								if inputValue < option.min then
									option.value = option.min
								elseif inputValue > option.max then
									option.value = option.max
								else
									option.value = tonumber(string.format("%." .. option.float .. "f", inputValue))
								end

								-- Update the slider's size and text display
								frameSlider.Size = UDim2.new(0, math.floor(((option.value - option.min) / (option.max - option.min)) * 178), 0, 15)
								ignoreSliderValue.Text = tostring(option.value) .. "/" .. tostring(option.max) .. option.suffix

								-- Call the callback function if it exists
								if option.callback then
									pcall(option.callback, option.value)
								end

								-- Update the flag if applicable
								if option.flag then
									Library.Flags[option.flag] = option.value
								end
							else
								-- If input is invalid, reset the TextBox to the current value
								ignoreSliderValue.Text = tostring(option.value) .. "/" .. tostring(option.max) .. option.suffix
							end
						end
					end)

					btnSlider.MouseEnter:Connect(function()
						--UISbtnSlider.Color = Library.Theme.Accent
					end)
					btnSlider.MouseLeave:Connect(function()
						if not dragging then
							--UISbtnSlider.Color = Library.Theme.Border
						end
					end)

					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.value
						Library.Items[option.flag] = option
					end

					function option:SetValue(int)
						if int > option.max then
							option.value = option.max
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
						elseif int < option.min then
							option.value = option.min
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
						else
							option.value = int
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value.."/"..option.max..option.suffix
						end
						option.callback(option.value)
						Library.Flags[option.flag] = option.value
					end
				end

				return Slider
			end

			function section:NewDropdown(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "nil"
				option.multi = option.multi or false
				option.value = typeof(option.value) == "table" and option.value or option.value or ""
				option.values = typeof(option.values) == "table" and option.values or {}
				option.flag = option.flag or option.text or "DDYDR"
				option.callback = option.callback or function() end
				option.utilitytype = "dropdown"

				local Dropdown = {}

				do -- dropdown
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder
					Dropdown["3e"] = Instance.new("Frame", section["b3"]);
					Dropdown["3e"]["ZIndex"] = 2;
					Dropdown["3e"]["BorderSizePixel"] = 0;
					Dropdown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3e"]["Size"] = UDim2.new(1, 0, 0, 33);
					Dropdown["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["3e"]["Name"] = [[DropdownHolder]];
					Dropdown["3e"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownTextHolder
					Dropdown["3f"] = Instance.new("Frame", Dropdown["3e"]);
					Dropdown["3f"]["BorderSizePixel"] = 0;
					Dropdown["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3f"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Dropdown["3f"]["Size"] = UDim2.new(1, 0, 0.5, -1);
					Dropdown["3f"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Dropdown["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["3f"]["Name"] = [[DropdownTextHolder]];
					Dropdown["3f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownTextHolder.DropdownText
					Dropdown["40"] = Instance.new("TextLabel", Dropdown["3f"]);
					Dropdown["40"]["TextStrokeTransparency"] = 0;
					Dropdown["40"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Dropdown["40"]["BorderSizePixel"] = 0;
					Dropdown["40"]["TextSize"] = 14;
					Dropdown["40"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["40"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Dropdown["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["40"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					Dropdown["40"]["BackgroundTransparency"] = 1;
					Dropdown["40"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["40"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["40"]["Text"] = option.text;
					Dropdown["40"]["Name"] = [[DropdownText]];
					Dropdown["40"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder
					Dropdown["41"] = Instance.new("Frame", Dropdown["3e"]);
					Dropdown["41"]["BorderSizePixel"] = 0;
					Dropdown["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["41"]["AnchorPoint"] = Vector2.new(0.5, 1);
					Dropdown["41"]["Size"] = UDim2.new(1, 0, 0.5, 2);
					Dropdown["41"]["Position"] = UDim2.new(0.5, 0, 1, 0);
					Dropdown["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["41"]["Name"] = [[DropdownMainHolder]];
					Dropdown["41"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline
					Dropdown["42"] = Instance.new("Frame", Dropdown["41"]);
					Dropdown["42"]["BorderSizePixel"] = 0;
					Dropdown["42"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Dropdown["42"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["42"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["42"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["42"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline
					Dropdown["43"] = Instance.new("Frame", Dropdown["42"]);
					Dropdown["43"]["BorderSizePixel"] = 0;
					Dropdown["43"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["43"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["43"]["Size"] = UDim2.new(1, -2, 1, -2);
					Dropdown["43"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["43"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main
					Dropdown["44"] = Instance.new("Frame", Dropdown["43"]);
					Dropdown["44"]["BorderSizePixel"] = 0;
					Dropdown["44"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["44"]["Size"] = UDim2.new(1, -2, 1, -2);
					Dropdown["44"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["44"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.UIGradient
					Dropdown["45"] = Instance.new("UIGradient", Dropdown["44"]);
					Dropdown["45"]["Rotation"] = 90;
					Dropdown["45"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownValueText
					Dropdown["46"] = Instance.new("TextLabel", Dropdown["44"]);
					Dropdown["46"]["TextStrokeTransparency"] = 0;
					Dropdown["46"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					Dropdown["46"]["ZIndex"] = 2;
					Dropdown["46"]["BorderSizePixel"] = 0;
					Dropdown["46"]["TextSize"] = 13;
					Dropdown["46"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["46"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Dropdown["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["46"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["46"]["BackgroundTransparency"] = 1;
					Dropdown["46"]["AnchorPoint"] = Vector2.new(0, 0.5);
					Dropdown["46"]["Size"] = UDim2.new(1, -15, 1, 0);
					Dropdown["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["46"]["Name"] = [[DropdownValueText]];
					Dropdown["46"]["Position"] = UDim2.new(0, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownValueText.UIPadding
					Dropdown["47"] = Instance.new("UIPadding", Dropdown["46"]);
					Dropdown["47"]["PaddingRight"] = UDim.new(0, 1);
					Dropdown["47"]["PaddingLeft"] = UDim.new(0, 1);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.+/-
					Dropdown["48"] = Instance.new("TextLabel", Dropdown["44"]);
					Dropdown["48"]["TextStrokeTransparency"] = 0;
					Dropdown["48"]["ZIndex"] = 2;
					Dropdown["48"]["BorderSizePixel"] = 0;
					Dropdown["48"]["TextSize"] = 12;
					Dropdown["48"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					Dropdown["48"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					Dropdown["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["48"]["BackgroundTransparency"] = 1;
					Dropdown["48"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Dropdown["48"]["Size"] = UDim2.new(0, 15, 1, 0);
					Dropdown["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["48"]["Text"] = [[+]];
					Dropdown["48"]["Name"] = [[+/-]];
					Dropdown["48"]["Position"] = UDim2.new(1, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.+/-.UIPadding
					Dropdown["49"] = Instance.new("UIPadding", Dropdown["48"]);
					Dropdown["49"]["PaddingRight"] = UDim.new(0, 2);
					Dropdown["49"]["PaddingLeft"] = UDim.new(0, 2);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownButton
					Dropdown["4a"] = Instance.new("TextButton", Dropdown["44"]);
					Dropdown["4a"]["BorderSizePixel"] = 0;
					Dropdown["4a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4a"]["TextTransparency"] = 1;
					Dropdown["4a"]["TextSize"] = 14;
					Dropdown["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["4a"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["4a"]["BackgroundTransparency"] = 1;
					Dropdown["4a"]["Name"] = [[DropdownButton]];
					Dropdown["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder
					Dropdown["4b"] = Instance.new("Frame", Dropdown["44"]);
					Dropdown["4b"]["Visible"] = false;
					Dropdown["4b"]["BorderSizePixel"] = 0;
					Dropdown["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["4b"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Dropdown["4b"]["Size"] = UDim2.new(1, 4, 0, 45);
					Dropdown["4b"]["Position"] = UDim2.new(0.5, 0, 1, 0);
					Dropdown["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4b"]["Name"] = [[DropdownOpenedHolder]];
					Dropdown["4b"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline
					Dropdown["4c"] = Instance.new("Frame", Dropdown["4b"]);
					Dropdown["4c"]["BorderSizePixel"] = 0;
					Dropdown["4c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					Dropdown["4c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["4c"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["4c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4c"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline
					Dropdown["4d"] = Instance.new("Frame", Dropdown["4c"]);
					Dropdown["4d"]["BorderSizePixel"] = 0;
					Dropdown["4d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["4d"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Dropdown["4d"]["Size"] = UDim2.new(1, -2, 1, -1);
					Dropdown["4d"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Dropdown["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4d"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main
					Dropdown["4e"] = Instance.new("Frame", Dropdown["4d"]);
					Dropdown["4e"]["BorderSizePixel"] = 0;
					Dropdown["4e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					Dropdown["4e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["4e"]["Size"] = UDim2.new(1, -2, 1, -2);
					Dropdown["4e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["4e"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main.UIGradient
					Dropdown["4f"] = Instance.new("UIGradient", Dropdown["4e"]);
					Dropdown["4f"]["Rotation"] = 90;
					Dropdown["4f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main.VariantsHolder
					Dropdown["50"] = Instance.new("ScrollingFrame", Dropdown["4e"]);
					Dropdown["50"]["Active"] = true;
					Dropdown["50"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
					Dropdown["50"]["BorderSizePixel"] = 0;
					Dropdown["50"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
					Dropdown["50"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["50"]["Name"] = [[VariantsHolder]];
					Dropdown["50"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["50"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
					Dropdown["50"]["Size"] = UDim2.new(1, 0, 1, 0);
					Dropdown["50"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["50"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Dropdown["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["50"]["ScrollBarThickness"] = 0;
					Dropdown["50"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.DropdownHolder.DropdownMainHolder.Outline.Innerline.Main.DropdownOpenedHolder.Outline.Innerline.Main.VariantsHolder.UIListLayout
					Dropdown["51"] = Instance.new("UIListLayout", Dropdown["50"]);
					Dropdown["51"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				end

				do -- logic
					local selected = {}
					local dropped = false

					-- Dropdown elements
					local btnDD = Dropdown["46"]
					local D = Dropdown["4b"]

					-- Dropdown toggle
					Dropdown["4a"].MouseButton1Click:Connect(function()
						D.Visible = not dropped
						if D.Visible == true then
							Dropdown["3e"]["ZIndex"] = 3152
							Dropdown["48"]["Text"] = [[-]];
						else
							Dropdown["3e"]["ZIndex"] = 2
							Dropdown["48"]["Text"] = [[+]];
						end
						dropped = not dropped
					end)

					-- Helper function for updating dropdown text
					local function updateDropdownText()
						if option.multi then
							btnDD.Text = (#selected > 0) and table.concat(selected, ", ") or "None"
						else
							btnDD.Text = tostring(option.value)
						end
					end

					-- Helper function for selecting or deselecting an option
					local function toggleOption(button, value)
						local activeColor = Color3.fromRGB(255, 255, 255)
						local inactiveColor = Color3.fromRGB(91, 91, 91)

						if option.multi then
							if table.find(selected, value) then
								table.remove(selected, table.find(selected, value))
								button.TextColor3 = inactiveColor
							else
								table.insert(selected, value)
								button.TextColor3 = activeColor
							end
							option.value = selected
						else
							option.value = value
							for _, sibling in ipairs(button.Parent:GetChildren()) do
								if sibling:IsA("TextButton") then
									sibling.TextColor3 = inactiveColor
								end
							end
							button.TextColor3 = activeColor
						end

						updateDropdownText()
						option.callback(option.value)
					end

					-- Create dropdown buttons for each option
					for _, value in ipairs(option.values) do
						local button = Instance.new("TextButton", Dropdown["50"]) -- Correct parent
						button.Name = "Option" -- Rename from "Variant" to something descriptive
						button.Size = UDim2.new(1, 0, 0, 15)
						button.BackgroundTransparency = 1
						button.Text = tostring(value) -- Set text to the dropdown value
						button.TextColor3 = Color3.fromRGB(91, 91, 91) -- Default text color
						button.TextXAlignment = Enum.TextXAlignment.Left
						button.Font = Enum.Font.SourceSans
						button.TextSize = 13

						local padding = Instance.new("UIPadding", button)
						padding.PaddingRight = UDim.new(0, 2)
						padding.PaddingLeft = UDim.new(0, 2)

						-- Ensure no extra buttons are preselected incorrectly
						if option.multi then
							if table.find(selected, value) then
								button.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
						else
							if option.value == value then
								button.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
						end

						-- Attach button click functionality
						button.MouseButton1Click:Connect(function()
							toggleOption(button, value)
						end)
					end

					-- Initialization
					updateDropdownText()
					option.callback(option.value)

					-- Store option in library
					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.value
						Library.Items[option.flag] = option
					end

					-- Function to set values programmatically
					function option:SetValue(newValue)
						if option.multi then
							selected = type(newValue) == "table" and newValue or {}
							for _, button in ipairs(D:GetChildren()) do
								if button:IsA("TextButton") then
									button.TextColor3 = table.find(selected, button.Text) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(91, 91, 91)
								end
							end
						else
							option.value = newValue
						end
						updateDropdownText()
						option.callback(option.value)
					end

					function option:SetValues(newValues)
						-- Clear out existing dropdown buttons
						for _, child in ipairs(Dropdown["50"]:GetChildren()) do
							if child:IsA("TextButton") and child.Name == "Option" then
								child:Destroy()
							end
						end

						-- Update the values array
						option.values = newValues or {}

						-- Set the first value in the dropdown automatically, if it exists
						if #option.values > 0 then
							if option.multi then
								selected = { option.values[1] }
							else
								option.value = option.values[1]
							end
						else
							-- Handle the case where the newValues array is empty
							if option.multi then
								selected = {}
							else
								option.value = nil
							end
						end

						-- Create new buttons for the dropdown
						for _, value in ipairs(option.values) do
							local button = Instance.new("TextButton", Dropdown["50"]) -- Correct parent
							button.Name = "Option" -- Name the button for easier identification
							button.Size = UDim2.new(1, 0, 0, 15)
							button.BackgroundTransparency = 1
							button.Text = tostring(value) -- Set text to the dropdown value
							button.TextColor3 = Color3.fromRGB(91, 91, 91) -- Default text color
							button.TextXAlignment = Enum.TextXAlignment.Left
							button.Font = Enum.Font.SourceSans
							button.TextSize = 13

							local padding = Instance.new("UIPadding", button)
							padding.PaddingRight = UDim.new(0, 2)
							padding.PaddingLeft = UDim.new(0, 2)

							-- Ensure no extra buttons are preselected incorrectly
							if option.multi then
								if table.find(selected, value) then
									button.TextColor3 = Color3.fromRGB(255, 255, 255)
								end
							else
								if option.value == value then
									button.TextColor3 = Color3.fromRGB(255, 255, 255)
								end
							end

							-- Attach button click functionality
							button.MouseButton1Click:Connect(function()
								toggleOption(button, value)
							end)
						end

						-- Update the dropdown display text
						updateDropdownText()

						-- Call the callback with the updated value
						option.callback(option.value)
					end
				end

				return Dropdown
			end

			function section:NewTextBox(option)
				option = typeof(option) == "table" and option or {}
				option.textr = option.textr or "new text box"
				option.text = option.text or "nil"
				option.placeholder = option.placeholder or "Value"
				option.value = option.value or ""
				option.clearonfocus = option.clearonfocus or false
				option.flag = option.flag or option.text or option.value or option.placeholder
				option.callback = option.callback or function() end
				option.utilitytype = "textbox"

				local TextBox = {}

				do -- textbox
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder
					TextBox["97"] = Instance.new("Frame", section["b3"]);
					TextBox["97"]["BorderSizePixel"] = 0;
					TextBox["97"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["97"]["Size"] = UDim2.new(1, 0, 0, 33);
					TextBox["97"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["97"]["Name"] = [[TextBoxHolder]];
					TextBox["97"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxText
					TextBox["98"] = Instance.new("Frame", TextBox["97"]);
					TextBox["98"]["BorderSizePixel"] = 0;
					TextBox["98"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["98"]["Size"] = UDim2.new(1, 0, 0.5, -1);
					TextBox["98"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["98"]["Name"] = [[TextBoxText]];
					TextBox["98"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxText.TextBoxTXT
					TextBox["99"] = Instance.new("TextLabel", TextBox["98"]);
					TextBox["99"]["TextStrokeTransparency"] = 0;
					TextBox["99"]["BorderSizePixel"] = 0;
					TextBox["99"]["TextSize"] = 14;
					TextBox["99"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextBox["99"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					TextBox["99"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["99"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextBox["99"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					TextBox["99"]["BackgroundTransparency"] = 1;
					TextBox["99"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["99"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["99"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["99"]["Text"] = option.textr;
					TextBox["99"]["Name"] = [[TextBoxTXT]];
					TextBox["99"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain
					TextBox["9a"] = Instance.new("Frame", TextBox["97"]);
					TextBox["9a"]["BorderSizePixel"] = 0;
					TextBox["9a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["9a"]["AnchorPoint"] = Vector2.new(0, 1);
					TextBox["9a"]["Size"] = UDim2.new(1, 0, 0.5, 2);
					TextBox["9a"]["Position"] = UDim2.new(0, 0, 1, 0);
					TextBox["9a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9a"]["Name"] = [[TextBoxMain]];
					TextBox["9a"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline
					TextBox["9b"] = Instance.new("Frame", TextBox["9a"]);
					TextBox["9b"]["BorderSizePixel"] = 0;
					TextBox["9b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					TextBox["9b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9b"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["9b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9b"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline
					TextBox["9c"] = Instance.new("Frame", TextBox["9b"]);
					TextBox["9c"]["BorderSizePixel"] = 0;
					TextBox["9c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					TextBox["9c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9c"]["Size"] = UDim2.new(1, -2, 1, -2);
					TextBox["9c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9c"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main
					TextBox["9d"] = Instance.new("Frame", TextBox["9c"]);
					TextBox["9d"]["BorderSizePixel"] = 0;
					TextBox["9d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					TextBox["9d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9d"]["Size"] = UDim2.new(1, -2, 1, -2);
					TextBox["9d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9d"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main.UIGradient
					TextBox["9e"] = Instance.new("UIGradient", TextBox["9d"]);
					TextBox["9e"]["Rotation"] = 90;
					TextBox["9e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main.TextBox
					TextBox["9f"] = Instance.new("TextBox", TextBox["9d"]);
					TextBox["9f"]["CursorPosition"] = -1;
					TextBox["9f"]["TextStrokeTransparency"] = 0;
					TextBox["9f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextBox["9f"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					TextBox["9f"]["BorderSizePixel"] = 0;
					TextBox["9f"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					TextBox["9f"]["TextSize"] = 13;
					TextBox["9f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["9f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["9f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextBox["9f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					TextBox["9f"]["PlaceholderText"] = option.placeholder;
					TextBox["9f"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["9f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					TextBox["9f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextBox["9f"]["BackgroundTransparency"] = 1;
					TextBox["9f"].Text = tostring(option.text)
					TextBox["9f"].ClearTextOnFocus = typeof(option.clearonfocus) == "boolean" and option.clearonfocus or false


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.TextBoxHolder.TextBoxMain.Outline.Innerline.Main.TextBox.UIPadding
					TextBox["a0"] = Instance.new("UIPadding", TextBox["9f"]);
					TextBox["a0"]["PaddingRight"] = UDim.new(0, 1);
					TextBox["a0"]["PaddingLeft"] = UDim.new(0, 1);
				end

				do -- logic
					local txt = TextBox["9f"]
					local down = false

					game:GetService("UserInputService").InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.Return then  down = true end end)

					game:GetService("UserInputService").InputEnded:Connect(function(input) if input.KeyCode == Enum.KeyCode.Return then  down = false  end end)

					txt.FocusLost:Connect(function()
						task.wait()
						if down then 
							option.value = txt.Text
							option.callback(option.value)
							Library.Flags[option.flag] = option.value
						end 
					end)

					if option.flag and option.flag ~= "" then
						Library.Flags[option.flag] = option.value
						Library.Items[option.flag] = option
					end

					option.callback(option.value)

					function option:SetValue(str)
						option.value = tostring(str)
						txt.Text = option.value
						Library.Flags[option.flag] = option.value
						option.callback(option.value)
					end
				end

				return TextBox
			end

			function section:NewColorpicker(option)
				option = typeof(option) == "table" and option or {}
				option.text = option.text or "New Color" or "nil"
				option.color = option.color or Color3.fromRGB(255, 255, 255)
				option.transparency = typeof(option.transparency) == "number" and option.transparency or typeof(option.transparency) == "boolean" and option.transparency or false
				option.flag = option.flag or option.text
				option.callback = option.callback or function() end
				option.transparencyCallback = option.transparencyCallback or function() end
				option.utilitytype = "color"

				local ColorPicker = {}

				do -- colorpicker
					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder
					ColorPicker["5b"] = Instance.new("Frame", section["b3"]);
					ColorPicker["5b"]["ZIndex"] = 999;
					ColorPicker["5b"]["BorderSizePixel"] = 0;
					ColorPicker["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["5b"]["Size"] = UDim2.new(1, 0, 0, 15);
					ColorPicker["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5b"]["Name"] = [[ColorpickerHolder]];
					ColorPicker["5b"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.ColorpickerText
					ColorPicker["5c"] = Instance.new("TextLabel", ColorPicker["5b"]);
					ColorPicker["5c"]["TextStrokeTransparency"] = 0;
					ColorPicker["5c"]["TextTruncate"] = Enum.TextTruncate.SplitWord;
					ColorPicker["5c"]["BorderSizePixel"] = 0;
					ColorPicker["5c"]["TextSize"] = 14;
					ColorPicker["5c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					ColorPicker["5c"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["5c"]["TextColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["5c"]["BackgroundTransparency"] = 1;
					ColorPicker["5c"]["AnchorPoint"] = Vector2.new(0, 0.5);
					ColorPicker["5c"]["Size"] = UDim2.new(1, -20, 1, 0);
					ColorPicker["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5c"]["Text"] = [[ColorPicker preview]];
					ColorPicker["5c"]["Name"] = [[ColorpickerText]];
					ColorPicker["5c"]["Position"] = UDim2.new(0, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline
					ColorPicker["5d"] = Instance.new("Frame", ColorPicker["5b"]);
					ColorPicker["5d"]["BorderSizePixel"] = 0;
					ColorPicker["5d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["5d"]["AnchorPoint"] = Vector2.new(1, 0);
					ColorPicker["5d"]["Size"] = UDim2.new(0, 25, 1, 0);
					ColorPicker["5d"]["Position"] = UDim2.new(1, 0, 0, 0);
					ColorPicker["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5d"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine
					ColorPicker["5e"] = Instance.new("Frame", ColorPicker["5d"]);
					ColorPicker["5e"]["BorderSizePixel"] = 0;
					ColorPicker["5e"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["5e"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["5e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5e"]["Name"] = [[InnerLine]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display
					ColorPicker["5f"] = Instance.new("Frame", ColorPicker["5e"]);
					ColorPicker["5f"]["ZIndex"] = 2;
					ColorPicker["5f"]["BorderSizePixel"] = 0;
					ColorPicker["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["5f"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["5f"]["Name"] = [[Display]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Display.UIGradient
					ColorPicker["60"] = Instance.new("UIGradient", ColorPicker["5f"]);
					ColorPicker["60"]["Rotation"] = 90;
					ColorPicker["60"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerButton
					ColorPicker["61"] = Instance.new("TextButton", ColorPicker["5e"]);
					ColorPicker["61"]["BorderSizePixel"] = 0;
					ColorPicker["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["61"]["TextTransparency"] = 1;
					ColorPicker["61"]["AutoButtonColor"] = false;
					ColorPicker["61"]["TextSize"] = 14;
					ColorPicker["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["61"]["Size"] = UDim2.new(1, 0, 1, 0);
					ColorPicker["61"]["BackgroundTransparency"] = 1;
					ColorPicker["61"]["Name"] = [[ColorPickerButton]];
					ColorPicker["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain
					ColorPicker["62"] = Instance.new("Frame", ColorPicker["5e"]);
					ColorPicker["62"]["Visible"] = false;
					ColorPicker["62"]["ZIndex"] = 10000;
					ColorPicker["62"]["BorderSizePixel"] = 0;
					ColorPicker["62"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["62"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["62"]["Size"] = UDim2.new(0, 125, 0, 150);
					ColorPicker["62"]["Position"] = UDim2.new(0, -1, 0, -1);
					ColorPicker["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["62"]["Name"] = [[ColorPickerMain]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline
					ColorPicker["63"] = Instance.new("Frame", ColorPicker["62"]);
					ColorPicker["63"]["BorderSizePixel"] = 0;
					ColorPicker["63"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["63"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["63"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main
					ColorPicker["64"] = Instance.new("Frame", ColorPicker["63"]);
					ColorPicker["64"]["BorderSizePixel"] = 0;
					ColorPicker["64"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["64"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["64"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["64"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIGradient
					ColorPicker["65"] = Instance.new("UIGradient", ColorPicker["64"]);
					ColorPicker["65"]["Rotation"] = 90;
					ColorPicker["65"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.UIPadding
					ColorPicker["66"] = Instance.new("UIPadding", ColorPicker["64"]);
					ColorPicker["66"]["PaddingTop"] = UDim.new(0, 3);
					ColorPicker["66"]["PaddingRight"] = UDim.new(0, 3);
					ColorPicker["66"]["PaddingLeft"] = UDim.new(0, 3);
					ColorPicker["66"]["PaddingBottom"] = UDim.new(0, 3);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder
					ColorPicker["67"] = Instance.new("Frame", ColorPicker["64"]);
					ColorPicker["67"]["BorderSizePixel"] = 0;
					ColorPicker["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["67"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["67"]["Size"] = UDim2.new(1, 0, 0, 18);
					ColorPicker["67"]["Position"] = UDim2.new(0, 0, 1, 0);
					ColorPicker["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["67"]["Name"] = [[RGBtextHolder]];
					ColorPicker["67"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.UIListLayout
					ColorPicker["68"] = Instance.new("UIListLayout", ColorPicker["67"]);
					ColorPicker["68"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					ColorPicker["68"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
					ColorPicker["68"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
					ColorPicker["68"]["Padding"] = UDim.new(0, 1);
					ColorPicker["68"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					ColorPicker["68"]["FillDirection"] = Enum.FillDirection.Horizontal;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R
					ColorPicker["69"] = Instance.new("Frame", ColorPicker["67"]);
					ColorPicker["69"]["BorderSizePixel"] = 0;
					ColorPicker["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["69"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["69"]["Size"] = UDim2.new(0, 33, 0, 15);
					ColorPicker["69"]["Position"] = UDim2.new(0, 37, 1, 0);
					ColorPicker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["69"]["Name"] = [[R]];
					ColorPicker["69"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline
					ColorPicker["6a"] = Instance.new("Frame", ColorPicker["69"]);
					ColorPicker["6a"]["BorderSizePixel"] = 0;
					ColorPicker["6a"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6a"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6a"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline
					ColorPicker["6b"] = Instance.new("Frame", ColorPicker["6a"]);
					ColorPicker["6b"]["BorderSizePixel"] = 0;
					ColorPicker["6b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6b"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6b"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main
					ColorPicker["6c"] = Instance.new("Frame", ColorPicker["6b"]);
					ColorPicker["6c"]["BorderSizePixel"] = 0;
					ColorPicker["6c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6c"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6c"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.R
					ColorPicker["6d"] = Instance.new("TextBox", ColorPicker["6c"]);
					ColorPicker["6d"]["TextStrokeTransparency"] = 0;
					ColorPicker["6d"]["Name"] = [[R]];
					ColorPicker["6d"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["6d"]["BorderSizePixel"] = 0;
					ColorPicker["6d"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["6d"]["TextSize"] = 13;
					ColorPicker["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["6d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["6d"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6d"]["Text"] = [[255]];
					ColorPicker["6d"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.R.Outline.Innerline.Main.UIGradient
					ColorPicker["6e"] = Instance.new("UIGradient", ColorPicker["6c"]);
					ColorPicker["6e"]["Rotation"] = 90;
					ColorPicker["6e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G
					ColorPicker["6f"] = Instance.new("Frame", ColorPicker["67"]);
					ColorPicker["6f"]["BorderSizePixel"] = 0;
					ColorPicker["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["6f"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["6f"]["Size"] = UDim2.new(0, 33, 0, 15);
					ColorPicker["6f"]["Position"] = UDim2.new(0, 37, 1, 0);
					ColorPicker["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["6f"]["Name"] = [[G]];
					ColorPicker["6f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline
					ColorPicker["70"] = Instance.new("Frame", ColorPicker["6f"]);
					ColorPicker["70"]["BorderSizePixel"] = 0;
					ColorPicker["70"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["70"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["70"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["70"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["70"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline
					ColorPicker["71"] = Instance.new("Frame", ColorPicker["70"]);
					ColorPicker["71"]["BorderSizePixel"] = 0;
					ColorPicker["71"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["71"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["71"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main
					ColorPicker["72"] = Instance.new("Frame", ColorPicker["71"]);
					ColorPicker["72"]["BorderSizePixel"] = 0;
					ColorPicker["72"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["72"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["72"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["72"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.G
					ColorPicker["73"] = Instance.new("TextBox", ColorPicker["72"]);
					ColorPicker["73"]["TextStrokeTransparency"] = 0;
					ColorPicker["73"]["Name"] = [[G]];
					ColorPicker["73"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["73"]["BorderSizePixel"] = 0;
					ColorPicker["73"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["73"]["TextSize"] = 13;
					ColorPicker["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["73"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["73"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["73"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["73"]["Text"] = [[255]];
					ColorPicker["73"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.G.Outline.Innerline.Main.UIGradient
					ColorPicker["74"] = Instance.new("UIGradient", ColorPicker["72"]);
					ColorPicker["74"]["Rotation"] = 90;
					ColorPicker["74"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B
					ColorPicker["75"] = Instance.new("Frame", ColorPicker["67"]);
					ColorPicker["75"]["BorderSizePixel"] = 0;
					ColorPicker["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["75"]["AnchorPoint"] = Vector2.new(0, 1);
					ColorPicker["75"]["Size"] = UDim2.new(0, 33, 0, 15);
					ColorPicker["75"]["Position"] = UDim2.new(0, 37, 1, 0);
					ColorPicker["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["75"]["Name"] = [[B]];
					ColorPicker["75"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline
					ColorPicker["76"] = Instance.new("Frame", ColorPicker["75"]);
					ColorPicker["76"]["BorderSizePixel"] = 0;
					ColorPicker["76"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["76"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["76"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["76"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline
					ColorPicker["77"] = Instance.new("Frame", ColorPicker["76"]);
					ColorPicker["77"]["BorderSizePixel"] = 0;
					ColorPicker["77"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["77"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["77"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main
					ColorPicker["78"] = Instance.new("Frame", ColorPicker["77"]);
					ColorPicker["78"]["BorderSizePixel"] = 0;
					ColorPicker["78"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["78"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["78"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.B
					ColorPicker["79"] = Instance.new("TextBox", ColorPicker["78"]);
					ColorPicker["79"]["TextStrokeTransparency"] = 0;
					ColorPicker["79"]["Name"] = [[B]];
					ColorPicker["79"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["79"]["BorderSizePixel"] = 0;
					ColorPicker["79"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["79"]["TextSize"] = 13;
					ColorPicker["79"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["79"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["79"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["79"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["79"]["Text"] = [[255]];
					ColorPicker["79"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.RGBtextHolder.B.Outline.Innerline.Main.UIGradient
					ColorPicker["7a"] = Instance.new("UIGradient", ColorPicker["78"]);
					ColorPicker["7a"]["Rotation"] = 90;
					ColorPicker["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue
					ColorPicker["7b"] = Instance.new("ImageButton", ColorPicker["64"]);
					ColorPicker["7b"]["BorderSizePixel"] = 0;
					ColorPicker["7b"]["AutoButtonColor"] = false;
					ColorPicker["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["7b"]["Selectable"] = false;
					ColorPicker["7b"]["AnchorPoint"] = Vector2.new(1, 0);
					ColorPicker["7b"]["Image"] = [[rbxassetid://2615692420]];
					ColorPicker["7b"]["Size"] = UDim2.new(0, 15, 0, 95);
					ColorPicker["7b"]["Name"] = [[Hue]];
					ColorPicker["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7b"]["Position"] = UDim2.new(1, 0, 0, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Hue.huecursor
					ColorPicker["7c"] = Instance.new("Frame", ColorPicker["7b"]);
					ColorPicker["7c"]["BorderSizePixel"] = 0;
					ColorPicker["7c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["7c"]["AnchorPoint"] = Vector2.new(0.5, 0);
					ColorPicker["7c"]["Size"] = UDim2.new(1, 6, 0, 3);
					ColorPicker["7c"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					ColorPicker["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7c"]["Name"] = [[huecursor]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme
					ColorPicker["7d"] = Instance.new("ImageButton", ColorPicker["64"]);
					ColorPicker["7d"]["BorderSizePixel"] = 0;
					ColorPicker["7d"]["AutoButtonColor"] = false;
					ColorPicker["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["7d"]["Selectable"] = false;
					ColorPicker["7d"]["Image"] = [[rbxassetid://2615689005]];
					ColorPicker["7d"]["Size"] = UDim2.new(0, 95, 0, 95);
					ColorPicker["7d"]["Name"] = [[Scheme]];
					ColorPicker["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Scheme.schemecursor
					ColorPicker["7e"] = Instance.new("ImageLabel", ColorPicker["7d"]);
					ColorPicker["7e"]["ZIndex"] = 5;
					ColorPicker["7e"]["BorderSizePixel"] = 0;
					ColorPicker["7e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7e"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7e"]["Image"] = [[http://www.roblox.com/asset/?id=16006380635]];
					ColorPicker["7e"]["ImageRectSize"] = Vector2.new(1000, 1000);
					ColorPicker["7e"]["Size"] = UDim2.new(0, 5, 0, 5);
					ColorPicker["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7e"]["BackgroundTransparency"] = 1;
					ColorPicker["7e"]["Name"] = [[schemecursor]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency
					ColorPicker["7f"] = Instance.new("Frame", ColorPicker["64"]);
					ColorPicker["7f"]["BorderSizePixel"] = 0;
					ColorPicker["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["7f"]["AnchorPoint"] = Vector2.new(0.5, 1);
					ColorPicker["7f"]["Size"] = UDim2.new(1, 0, 0, 18);
					ColorPicker["7f"]["Position"] = UDim2.new(0.5, 0, 1, -20);
					ColorPicker["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["7f"]["Name"] = [[Transparency]];
					ColorPicker["7f"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline
					ColorPicker["80"] = Instance.new("Frame", ColorPicker["7f"]);
					ColorPicker["80"]["BorderSizePixel"] = 0;
					ColorPicker["80"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
					ColorPicker["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["80"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["80"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["80"]["Name"] = [[Outline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline
					ColorPicker["81"] = Instance.new("Frame", ColorPicker["80"]);
					ColorPicker["81"]["BorderSizePixel"] = 0;
					ColorPicker["81"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["81"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["81"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["81"]["Name"] = [[Innerline]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main
					ColorPicker["82"] = Instance.new("Frame", ColorPicker["81"]);
					ColorPicker["82"]["BorderSizePixel"] = 0;
					ColorPicker["82"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["82"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["82"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["82"]["Name"] = [[Main]];


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.Transparency
					ColorPicker["83"] = Instance.new("TextBox", ColorPicker["82"]);
					ColorPicker["83"]["TextStrokeTransparency"] = 0;
					ColorPicker["83"]["Name"] = [[Transparency]];
					ColorPicker["83"]["PlaceholderColor3"] = Color3.fromRGB(92, 92, 92);
					ColorPicker["83"]["BorderSizePixel"] = 0;
					ColorPicker["83"]["TextStrokeColor3"] = Color3.fromRGB(11, 11, 11);
					ColorPicker["83"]["TextSize"] = 13;
					ColorPicker["83"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["83"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
					ColorPicker["83"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					ColorPicker["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["83"]["PlaceholderText"] = [[Transparency:]];
					ColorPicker["83"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["83"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					ColorPicker["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["83"]["Text"] = [[100]];
					ColorPicker["83"]["BackgroundTransparency"] = 1;


					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.ColorPickerMain.Innerline.Main.Transparency.Outline.Innerline.Main.UIGradient
					ColorPicker["84"] = Instance.new("UIGradient", ColorPicker["82"]);
					ColorPicker["84"]["Rotation"] = 90;
					ColorPicker["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(213, 213, 213))};

					-- StarterGui.UILIBMAIN.UIHolder.Outline.Accent.Innerline.Main.Innerline.Outline.insideMain.insideHolder.TabEverythingHolder.CombatTabEverythingHolder.Outline.Innerline.Main.SectionsHolder.SectionHolder.Outline.Main.ColorpickerHolder.Outline.InnerLine.Frame
					ColorPicker["86"] = Instance.new("ImageLabel", ColorPicker["5e"]);
					ColorPicker["86"]["BorderSizePixel"] = 0;
					ColorPicker["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					ColorPicker["86"]["ScaleType"] = Enum.ScaleType.Crop;
					ColorPicker["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					ColorPicker["86"]["Image"] = [[rbxassetid://98372645101260]];
					ColorPicker["86"]["ImageRectSize"] = Vector2.new(100, 100);
					ColorPicker["86"]["Size"] = UDim2.new(1, -2, 1, -2);
					ColorPicker["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					ColorPicker["86"]["Name"] = [[Frame]];
					ColorPicker["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
				end

				do -- logic
					local opened = false

					ColorPicker["61"].MouseButton1Click:Connect(function()
						ColorPicker["62"].Visible = not opened
						opened = not opened
					end)

					local colorPickerMain = ColorPicker["62"]
					local scrollFrame = Tab["1e"]

					-- Function to update position and anchor point
					local function updatePosition()
						local pickerAbsPos = colorPickerMain.AbsolutePosition
						local scrollFrameAbsPos = scrollFrame.AbsolutePosition
						local scrollFrameSize = scrollFrame.AbsoluteSize

						-- Check if touching the top
						if pickerAbsPos.Y < scrollFrameAbsPos.Y then
							colorPickerMain.Position = UDim2.new(0, -1, 1, 1) -- Position at the top
							colorPickerMain.AnchorPoint = Vector2.new(0, 0) -- Anchor point at the top
							print("Moved to top with AnchorPoint 0,0 and Position {0, -1}, {1, 1}")
						end

						-- Check if touching the bottom
						if pickerAbsPos.Y + colorPickerMain.AbsoluteSize.Y > scrollFrameAbsPos.Y + scrollFrameSize.Y then
							colorPickerMain.Position = UDim2.new(0, -1, 0, -1) -- Position at the bottom
							colorPickerMain.AnchorPoint = Vector2.new(0, 1) -- Anchor point at the bottom
							print("Moved to bottom with AnchorPoint 0,1 and Position {0, -1}, {0, -1}")
						end
					end

					-- Connect to the RenderStepped event for constant checking
					game:GetService("RunService").RenderStepped:Connect(updatePosition)

					local white, black = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
					local colors = {
						Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0),
						Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0)
					}

					local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
					local UserInputService = game:GetService("UserInputService")

					-- UI elements
					local Schema = ColorPicker["7d"] -- Gradient area
					local SchemaCursor = ColorPicker["7e"] -- Cursor for the scheme
					local HUE = ColorPicker["7b"] -- Hue bar
					local HueCursor = ColorPicker["7c"] -- Cursor for the hue bar
					local Display = ColorPicker["5f"] -- Color display
					local TransparencyTextBox = ColorPicker["83"] -- Transparency input box
					local TextBoxR = ColorPicker["6d"] -- Red input box
					local TextBoxG = ColorPicker["73"] -- Green input box
					local TextBoxB = ColorPicker["79"] -- Blue input box

					-- Function: Convert RGB to HSV
					local function rgbToHSV(color)
						local r, g, b = color.R, color.G, color.B
						local max, min = math.max(r, g, b), math.min(r, g, b)
						local delta = max - min

						local h = 0
						if delta > 0 then
							if max == r then
								h = (g - b) / delta % 6
							elseif max == g then
								h = (b - r) / delta + 2
							elseif max == b then
								h = (r - g) / delta + 4
							end
							h = h / 6
						end

						local s = (max == 0) and 0 or delta / max
						local v = max
						return h, s, v
					end

					-- Function: Clamp a value between min and max
					local function clamp(value, min, max)
						return math.max(min, math.min(max, value))
					end

					-- Function: Update the color display
					local function updateColor(outputColor)
						if typeof(outputColor) ~= "Color3" then
							error("Invalid color value: Expected Color3, got " .. typeof(outputColor))
						end

						Display.BackgroundColor3 = outputColor
						option.color = outputColor

						local r = math.floor(outputColor.R * 255 + 0.5)
						local g = math.floor(outputColor.G * 255 + 0.5)
						local b = math.floor(outputColor.B * 255 + 0.5)

						TextBoxR.Text = tostring(r)
						TextBoxG.Text = tostring(g)
						TextBoxB.Text = tostring(b)

						if option.callback then
							option.callback(outputColor)
						end
					end

					-- Function to update the hue-based color dynamically
					local function updateHueColor(huePercent)
						-- Calculate the color from the hue percentage
						local hueColor = Color3.fromHSV(huePercent, 1, 1)

						-- Update the scheme's background color to reflect the hue
						Schema.BackgroundColor3 = hueColor

						-- Calculate the scheme cursor's position and update the final color
						local xP = math.clamp((SchemaCursor.AbsolutePosition.X - Schema.AbsolutePosition.X) / Schema.AbsoluteSize.X, 0, 1)
						local yP = math.clamp((SchemaCursor.AbsolutePosition.Y - Schema.AbsolutePosition.Y) / Schema.AbsoluteSize.Y, 0, 1)
						local outputColor = white:Lerp(hueColor, xP):Lerp(black, yP)

						-- Update the display, text boxes, and trigger callbacks
						updateColor(outputColor)
					end

					-- Function to update the scheme-based color dynamically
					local function updateSchemeColor(relativeX, relativeY)
						-- Calculate the interpolated color based on cursor position
						local xP = math.clamp(relativeX / Schema.AbsoluteSize.X, 0, 1)
						local yP = math.clamp(relativeY / Schema.AbsoluteSize.Y, 0, 1)
						local outputColor = white:Lerp(Schema.BackgroundColor3, xP):Lerp(black, yP)

						-- Update the display, text boxes, and trigger callbacks
						updateColor(outputColor)
					end

					-- Function: Sync color picker cursors and display based on a Color3 value
					local function syncColor()
						local h, s, v = rgbToHSV(option.color)

						local huePosition = h * HUE.AbsoluteSize.Y
						HueCursor.Position = UDim2.new(0.5, 0, 0, huePosition - (HueCursor.AbsoluteSize.Y / 2))

						local hueColor = Color3.fromHSV(h, 1, 1)
						Schema.BackgroundColor3 = hueColor

						local schemeX = s * Schema.AbsoluteSize.X
						local schemeY = (1 - v) * Schema.AbsoluteSize.Y
						SchemaCursor.Position = UDim2.new(0, schemeX - (SchemaCursor.AbsoluteSize.X / 2), 0, schemeY - (SchemaCursor.AbsoluteSize.Y / 2))

						updateColor(option.color)
					end

					-- Function: Update transparency
					local function updateTransparency(transparencyValue)
						local clampedValue = clamp(transparencyValue, 0, 100)
						local callbackValue = 1 - (clampedValue / 100)

						Display.BackgroundTransparency = callbackValue
						option.transparency = clampedValue

						if option.transparencyCallback then
							option.transparencyCallback(callbackValue)
						end

						TransparencyTextBox.Text = tostring(clampedValue)
					end

					-- Connect transparency TextBox changes
					TransparencyTextBox.FocusLost:Connect(function()
						local transparencyValue = tonumber(TransparencyTextBox.Text)
						if transparencyValue then
							updateTransparency(transparencyValue)
						else
							TransparencyTextBox.Text = tostring(option.transparency)
						end
					end)

					TransparencyTextBox:GetPropertyChangedSignal("Text"):Connect(function()
						local inputText = TransparencyTextBox.Text
						if not tonumber(inputText) and inputText ~= "" then
							TransparencyTextBox.Text = inputText:gsub("%D", "")
						end
					end)

					-- Function: Handle RGB input changes
					local function handleRGBInputChange(textBox, component)
						textBox.FocusLost:Connect(function()
							local inputValue = tonumber(textBox.Text)
							if inputValue then
								local r = component == "R" and inputValue or math.floor(option.color.R * 255 + 0.5)
								local g = component == "G" and inputValue or math.floor(option.color.G * 255 + 0.5)
								local b = component == "B" and inputValue or math.floor(option.color.B * 255 + 0.5)

								option.color = Color3.fromRGB(clamp(r, 0, 255), clamp(g, 0, 255), clamp(b, 0, 255))
								syncColor()
							else
								textBox.Text = tostring(math.floor(option.color[component] * 255 + 0.5))
							end
						end)

						textBox:GetPropertyChangedSignal("Text"):Connect(function()
							local inputText = textBox.Text
							if not tonumber(inputText) and inputText ~= "" then
								textBox.Text = inputText:gsub("%D", "")
							end
						end)
					end

					-- Logic for interacting with the hue bar
					HUE.MouseButton1Down:Connect(function()
						-- Function to dynamically update the hue cursor and color
						local function updateHueCursor()
							local relativeY = math.clamp(Mouse.Y - HUE.AbsolutePosition.Y, 0, HUE.AbsoluteSize.Y)

							-- Correct the X offset: center the cursor horizontally within the hue bar
							HueCursor.Position = UDim2.new(0.5, 0, 0, relativeY - (HueCursor.AbsoluteSize.Y / 2))

							-- Calculate hue as a percentage (0 to 1) and update the color
							local huePercent = math.clamp(relativeY / HUE.AbsoluteSize.Y, 0, 1)
							updateHueColor(huePercent)
						end

						-- Initial update
						updateHueCursor()

						-- Connect mouse movement for dragging
						local hueConnection
						hueConnection = Mouse.Move:Connect(updateHueCursor)

						-- Detect when the mouse button is released
						local inputEndedConnection
						inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								-- Disconnect connections safely
								if hueConnection then
									hueConnection:Disconnect()
									hueConnection = nil
								end
								if inputEndedConnection then
									inputEndedConnection:Disconnect()
									inputEndedConnection = nil
								end
							end
						end)
					end)

					-- Logic for interacting with the scheme area
					Schema.MouseButton1Down:Connect(function()
						-- Function to dynamically update the scheme cursor and color
						local function updateSchemeCursor()
							local relativeX = math.clamp(Mouse.X - Schema.AbsolutePosition.X, 0, Schema.AbsoluteSize.X)
							local relativeY = math.clamp(Mouse.Y - Schema.AbsolutePosition.Y, 0, Schema.AbsoluteSize.Y)

							-- Update the cursor position
							SchemaCursor.Position = UDim2.new(0, relativeX - (SchemaCursor.AbsoluteSize.X / 2), 0, relativeY - (SchemaCursor.AbsoluteSize.Y / 2))

							-- Update the scheme-based color
							updateSchemeColor(relativeX, relativeY)
						end

						-- Initial update
						updateSchemeCursor()

						-- Connect mouse movement for dragging
						local schemeConnection
						schemeConnection = Mouse.Move:Connect(updateSchemeCursor)

						-- Detect when the mouse button is released
						local inputEndedConnection
						inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								-- Disconnect connections safely
								if schemeConnection then
									schemeConnection:Disconnect()
									schemeConnection = nil
								end
								if inputEndedConnection then
									inputEndedConnection:Disconnect()
									inputEndedConnection = nil
								end
							end
						end)
					end)

					handleRGBInputChange(TextBoxR, "R")
					handleRGBInputChange(TextBoxG, "G")
					handleRGBInputChange(TextBoxB, "B")

					-- Initialize color picker
					syncColor()
					updateTransparency(option.transparency)
				end

				return ColorPicker
			end

			return MultiSection
		end

		return Tab
	end

	return Window
end

local function dropdownChangeValues(flag, newValues)
	local dropdownOption = Library.Items[flag] -- Retrieve the dropdown by its flag
	if dropdownOption and dropdownOption.SetValues then
		dropdownOption:SetValues(newValues) -- Call the SetValues method to update the dropdown
	else
		warn("Dropdown with flag '" .. tostring(flag) .. "' not found or does not support SetValues.")
	end
end

return Library
