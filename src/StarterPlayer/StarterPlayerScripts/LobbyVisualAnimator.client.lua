local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local lobby = Workspace:WaitForChild("SpaceFishingLobbyStatic", 20)
if not lobby then
	warn("[SpaceFishing] LobbyVisualAnimator could not find SpaceFishingLobbyStatic.")
	return
end

local remodel = lobby:WaitForChild("LobbyRemodelPass02", 10)
if not remodel then
	warn("[SpaceFishing] LobbyVisualAnimator could not find LobbyRemodelPass02.")
	return
end

local decorations = remodel:FindFirstChild("PlanetPizzaDecorationsAndLights")
local forceField = remodel:FindFirstChild("SafeZoneForceField")
local shopFinish = remodel:FindFirstChild("DetailedStuddedShopFinish")

local planets = {}
local cannons = {}
local cannonModels = {}
local aliens = {}
local shopPulses = {}
local shopSpinners = {}
local shopBobs = {}

local function getPivot(instance)
	if instance:IsA("Model") then
		return instance:GetPivot()
	end

	if instance:IsA("BasePart") then
		return instance.CFrame
	end

	return nil
end

local function movePivot(instance, cframe)
	if instance:IsA("Model") then
		instance:PivotTo(cframe)
	elseif instance:IsA("BasePart") then
		instance.CFrame = cframe
	end
end

local function collectShopAnimations(container)
	for _, descendant in ipairs(container:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.Name:match("^ShopPulse_") then
			local light = descendant:FindFirstChildWhichIsA("PointLight")
			local shouldScale = descendant.Name:match("Beam")
				or descendant.Name:match("Halo")
				or descendant.Name:match("Flame")
				or descendant.Name:match("Orb")
				or descendant.Name:match("Ring")

			table.insert(shopPulses, {
				Part = descendant,
				BaseTransparency = descendant.Transparency,
				BaseSize = descendant.Size,
				Light = light,
				BaseBrightness = light and light.Brightness or nil,
				Phase = #shopPulses * 0.47,
				Speed = 1.45 + (#shopPulses % 5) * 0.17,
				Amplitude = descendant.Transparency > 0.45 and 0.075 or 0.035,
				Scale = shouldScale and 0.035 or 0,
			})
		end

		if (descendant:IsA("Model") or descendant:IsA("BasePart")) and descendant.Name:match("^ShopSpin_") then
			table.insert(shopSpinners, {
				Instance = descendant,
				BasePivot = getPivot(descendant),
				Speed = 0.75 + (#shopSpinners % 4) * 0.22,
			})
		end

		if (descendant:IsA("Model") or descendant:IsA("BasePart")) and descendant.Name:match("^ShopBob_") then
			table.insert(shopBobs, {
				Instance = descendant,
				BasePivot = getPivot(descendant),
				Phase = #shopBobs * 0.9,
			})
		end
	end
end

if decorations then
	for _, child in ipairs(decorations:GetChildren()) do
		if child:IsA("Model") and child.Name:match("^MiniOrbitPlanetDisplay_") then
			table.insert(planets, {
				Model = child,
				BasePivot = child:GetPivot(),
				Speed = 0.18 + (#planets % 4) * 0.08,
			})
		elseif child:IsA("Model") and child.Name:match("^LightCannonFinish_") then
			local index = tonumber(child.Name:match("^LightCannonFinish_(%d+)")) or 0
			table.insert(cannonModels, {
				Index = index,
				Model = child,
				BasePivot = child:GetPivot(),
			})
		elseif child:IsA("Model") and child.Name:match("^MiniAlienStatue_") then
			table.insert(aliens, {
				Model = child,
				BasePivot = child:GetPivot(),
				Phase = #aliens * 0.7,
			})
		end
	end

	local byIndex = {}
	for _, part in ipairs(decorations:GetChildren()) do
		local index, kind = part.Name:match("^PizzaPlanetSkyBeam_(%d+)_(.+)$")
		if index and part:IsA("BasePart") then
			byIndex[index] = byIndex[index] or {}
			byIndex[index][kind] = part
		end
	end

	for index, parts in pairs(byIndex) do
		if parts.Head or parts.Beam then
			table.insert(cannons, {
				Index = tonumber(index) or 0,
				Head = parts.Head,
				Beam = parts.Beam,
				HeadCFrame = parts.Head and parts.Head.CFrame,
				BeamCFrame = parts.Beam and parts.Beam.CFrame,
			})
		end
	end
end

if shopFinish then
	collectShopAnimations(shopFinish)
end

local fieldBasePivot = forceField and forceField:GetPivot()
local shell = forceField and forceField:FindFirstChild("SafeZoneFieldShell")
local innerShell = forceField and forceField:FindFirstChild("SafeZoneInnerPulseShell")
local shellBaseSize = shell and shell.Size
local innerShellBaseSize = innerShell and innerShell.Size

RunService.RenderStepped:Connect(function()
	local now = os.clock()

	for _, planet in ipairs(planets) do
		local spin = CFrame.Angles(0, now * planet.Speed, 0)
		local bob = CFrame.new(0, math.sin(now * 1.25 + planet.Speed * 8) * 0.18, 0)
		planet.Model:PivotTo(planet.BasePivot * bob * spin)
	end

	for _, alien in ipairs(aliens) do
		local bob = math.sin(now * 2.1 + alien.Phase) * 0.12
		local sway = math.sin(now * 1.4 + alien.Phase) * math.rad(2.5)
		alien.Model:PivotTo(alien.BasePivot * CFrame.new(0, bob, 0) * CFrame.Angles(0, sway, 0))
	end

	for _, cannon in ipairs(cannons) do
		local sweep = math.sin(now * 0.65 + cannon.Index * 0.9) * math.rad(18)
		local lift = math.sin(now * 0.5 + cannon.Index) * math.rad(4)

		if cannon.Head and cannon.HeadCFrame then
			cannon.Head.CFrame = cannon.HeadCFrame * CFrame.Angles(lift, sweep, 0)
		end

		if cannon.Beam and cannon.BeamCFrame then
			cannon.Beam.CFrame = cannon.BeamCFrame * CFrame.Angles(lift * 0.8, sweep * 0.85, 0)
			cannon.Beam.Transparency = 0.68 + math.sin(now * 2.8 + cannon.Index) * 0.08
		end
	end

	for _, cannon in ipairs(cannonModels) do
		local sweep = math.sin(now * 0.65 + cannon.Index * 0.9) * math.rad(9)
		local lift = math.sin(now * 0.5 + cannon.Index) * math.rad(2)
		cannon.Model:PivotTo(cannon.BasePivot * CFrame.Angles(lift, sweep, 0))
	end

	for _, pulse in ipairs(shopPulses) do
		local wave = math.sin(now * pulse.Speed + pulse.Phase)
		pulse.Part.Transparency = math.clamp(pulse.BaseTransparency + wave * pulse.Amplitude, 0, 0.93)

		if pulse.Scale > 0 then
			pulse.Part.Size = pulse.BaseSize * (1 + wave * pulse.Scale)
		end

		if pulse.Light and pulse.BaseBrightness then
			pulse.Light.Brightness = pulse.BaseBrightness * (1 + wave * 0.32)
		end
	end

	for _, spinner in ipairs(shopSpinners) do
		if spinner.BasePivot then
			movePivot(spinner.Instance, spinner.BasePivot * CFrame.Angles(0, now * spinner.Speed, 0))
		end
	end

	for _, bob in ipairs(shopBobs) do
		if bob.BasePivot then
			local lift = math.sin(now * 1.7 + bob.Phase) * 0.16
			local sway = math.sin(now * 1.15 + bob.Phase) * math.rad(2)
			movePivot(bob.Instance, bob.BasePivot * CFrame.new(0, lift, 0) * CFrame.Angles(0, sway, 0))
		end
	end

	if forceField and fieldBasePivot then
		forceField:PivotTo(fieldBasePivot * CFrame.Angles(0, now * 0.025, 0))
	end

	if shell and shellBaseSize then
		local pulse = 1 + math.sin(now * 1.15) * 0.006
		shell.Size = shellBaseSize * pulse
		shell.Transparency = 0.84 + math.sin(now * 1.35) * 0.035
	end

	if innerShell and innerShellBaseSize then
		local pulse = 1 + math.sin(now * 1.15 + math.pi) * 0.004
		innerShell.Size = innerShellBaseSize * pulse
		innerShell.Transparency = 0.92 + math.sin(now * 1.6) * 0.025
	end
end)
