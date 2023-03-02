
local target
local current = View.ActiveVehicle.GetGuid()

function CheatWindow(title, x, y, w, h)
	local self = {
		window
	}
	local window = Tools.CreateWindow(x, y, w, h)
	self.window = window
	Tools.SetWindowTitle(window, title)
	function self.Label(label)
		return Tools.Window.CreateLabel(window, " " .. label)
	end
	function self.Button(label, action)
		return Tools.Window.CreateButton(window, action, " [" .. label .. "]")
	end
	function self.Checkbox(label, variableName, script, initialState)
		local checkboxId = Tools.Window.CreateCheckbox(window, variableName, script, "  " .. label)
		Tools.Window.SetCheckboxState(window, checkboxId, initialState)
		return id
	end
	function self.Separator()
		return Tools.Window.CreateSeparator(window)
	end
	function self.Text(varName, text, label)
		return Tools.Window.CreateTextField(window, varName, text, label)
	end
	function self.Init()
		Tools.DestroyWindow(window)
		current = View.ActiveVehicle.GetGuid()
		return MainWindow()
	end
	return self
end

function nocrashdamage(value)
	Cheats.SetNoCrashDamage(value)
	cw.Init()
end

function propellant(value)
	Cheats.SetInfinitePropellant(value)
	cw.Init()
end

function electricity(value)
	Cheats.SetInfiniteElectricity(value)
	cw.Init()
end

function joints(value)
	Cheats.SetUnbreakableJoints(value)
	cw.Init()
end

function parts(value)
	Cheats.SetUnbreakableParts(value)
	cw.Init()
end

function gravity(value)
	Cheats.SetDisableGravity(value)
	cw.Init()
end

function aero(value)
	Cheats.SetDisableAerodynamics(value)
	cw.Init()
end

function thermo(value)
	Cheats.SetDisableThermodynamics(value)
	cw.Init()
end

function maxtemp(value)
	Cheats.SetIgnoreMaxTemp(value)
	cw.Init()
end

function reset()
	Cheats.ResetAllValues()
	target = nil
	current = View.ActiveVehicle.GetGuid()
	cw.Init()
end

function teleport(where, body, alt)
	if where == "rendezvous" then
		SpaceSimulation.TeleportToRendezvous(current, target, 50, 50, 50, 0, 0, 0)
	end
	if where == "orbit" then
		if body then
			SpaceSimulation.TeleportToOrbit(current, body, 0, 0, alt, 0, 0, 0, 0)
		end
	end
	if where == "lp1" then
		if body then
			SpaceSimulation.TeleportToSurface(current, "Kerbin", 1000, -0.426506, 285.17035, 0)
		end
	end
	if where == "lp2" then
		if body then
			SpaceSimulation.TeleportToSurface(current, "Kerbin", 1000, -0.24179, 285.01398, 0)
		end
	end
	if where == "lp3" then
		if body then
			SpaceSimulation.TeleportToSurface(current, "Kerbin", 1000, -0.24195, 284.69295, 0)
		end
	end
	cw.Init()
end

function tag(data)
	if data == "target" then
		local vguid = View.ActiveVehicle.GetGuid()
		target = vguid
	elseif data == "active" then
		local vguid = View.ActiveVehicle.GetGuid()
		current = vguid
	end
	cw.Init()
end

function MainWindow()
	cw = CheatWindow("Celestial Teleport Rendezvous", 1400, 250, 300, 300)
	cw.Button("Teleport to Kerbol Orbit", "teleport('orbit', 'Kerbol', 2500000000)")
	cw.Button("Teleport to Moho Orbit", "teleport('orbit', 'Moho', 1000000)")
	cw.Button("Teleport to Eve Orbit", "teleport('orbit', 'Eve', 1500000)")
	cw.Button("Teleport to Gilly Orbit", "teleport('orbit', 'Gilly', 50000)")
	cw.Button("Teleport to Kerbin Orbit", "teleport('orbit', 'Kerbin', 1100000)")
	cw.Button("Teleport to Mun Orbit", "teleport('orbit', 'Mun', 500000)")
	cw.Button("Teleport to Minmus Orbit", "teleport('orbit', 'Minmus', 150000)")
	cw.Button("Teleport to Duna Orbit", "teleport('orbit', 'Duna', 750000)")
	cw.Button("Teleport to Ike Orbit", "teleport('orbit', 'Ike', 330000)")
	cw.Button("Teleport to Dres Orbit", "teleport('orbit', 'Dres', 330000)")
	cw.Button("Teleport to Jool Orbit", "teleport('orbit', 'Jool', 10000000)")
	cw.Button("Teleport to Laythe Orbit", "teleport('orbit', 'Laythe', 1000000)")
	cw.Button("Teleport to Vall Orbit", "teleport('orbit', 'Vall', 750000)")
	cw.Button("Teleport to Tylo Orbit", "teleport('orbit', 'Tylo', 1500000)")
	cw.Button("Teleport to Bop Orbit", "teleport('orbit', 'Bop', 200000)")
	cw.Button("Teleport to Pol Orbit", "teleport('orbit', 'Pol', 100000)")
	cw.Button("Teleport to Eeloo Orbit", "teleport('orbit', 'Eeloo', 500000)")
	cw.Separator()
	cw.Button("Teleport to 1km above Launchpad 1", "teleport('lp1', 'Kerbin')")
	cw.Button("Teleport to 1km above Launchpad 2", "teleport('lp2', 'Kerbin')")
	cw.Button("Teleport to 1km above Launchpad 3", "teleport('lp3', 'Kerbin')")
	cw.Separator()
	cw.Button("Reset All", "reset()")
	cw.Separator()
	cw.Button("Set as Target for Rendezvous", "tag('target')")
	cw.Button("Set as Active for Teleport", "tag('active')")
	cw.Label("T: ")
	cw.Label(tostring(target))
	cw.Label("A: ")
	cw.Label(tostring(current))
	cw.Separator()
	cw.Button("Teleport to Rendezvous", "teleport('rendezvous')")
	cw.Separator()
	if not Cheats.GetNoCrashDamage() then
		cw.Button("Disable Crash Damage", "nocrashdamage(true)")
	else
		cw.Button("Enable Crash Damage", "nocrashdamage(false)")
	end
	if not Cheats.GetInfinitePropellant() then
		cw.Button("Enable Infinite Propellant", "propellant(true)")
	else
		cw.Button("Disable Infinite Propellant", "propellant(false)")
	end
	if not Cheats.GetInfiniteElectricity() then
		cw.Button("Enable Infinite Electricity", "electricity(true)")
	else
		cw.Button("Disable Infinite Electricity", "electricity(false)")
	end
	if not Cheats.GetUnbreakableJoints() then
		cw.Button("Enable Unbreakable Joints", "joints(true)")
	else
		cw.Button("Disable Unbreakable Joints", "joints(false)")
	end
	if not Cheats.GetUnbreakableParts() then
		cw.Button("Enable Unbreakable Parts", "parts(true)")
	else
		cw.Button("Disable Unbreakable Parts", "parts(false)")
	end
	if not Cheats.GetDisableGravity() then
		cw.Button("Disable Gravity", "gravity(true)")
	else
		cw.Button("Enable Gravity", "gravity(false)")
	end
	if not Cheats.GetDisableAerodynamics() then
		cw.Button("Disable Aerodynamics", "aero(true)")
	else
		cw.Button("Enable Aerodynamics", "aero(false)")
	end
	if not Cheats.GetDisableThermodynamics() then
		cw.Button("Disable Thermodynamics", "thermo(true)")
	else
		cw.Button("Enable Thermodynamics", "thermo(false)")
	end
	if not Cheats.GetIgnoreMaxTemp() then
		cw.Button("Enable Maximum Temperature Limit", "maxtemp(true)")
	else
		cw.Button("Disable Maximum Temperature Limit", "maxtemp(false)")
	end
end

MainWindow()
