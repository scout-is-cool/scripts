-- uses jan's ui lib and coastified source
-- I do not take any credit for any of the scripts

Studio = game:GetService("RunService"):IsStudio()
local library
if Studio then
	library = require(workspace.UI)
else
	library = loadstring(game:HttpGet("http://bloxxite.xyz/rgwergdsfgsdtrjhsdrth", true))()
end

local GamesList = {
    [2677609345] = "Sound Space",
    [292439477] = "Phantom Forces",
    [301549746] = "Counter Blox",
    [286090429] = "Arsenal"
}
local VanillaGame = GamesList[game.PlaceId]
local Vanilla = {}

repeat wait() until game:IsLoaded()

local LocalPlayer = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Camera = Workspace:FindFirstChildOfClass("Camera")
local CurrentCamera = Workspace.CurrentCamera

local Mouse = LocalPlayer:GetMouse()

local ClosureCheck = is_synapse_function or is_protosmasher_caller or issentinelclosure

local function FindLocal(Name)
    local Matches = {}
    for i, v in pairs(getgc()) do
        if typeof(v) == "function" and not ClosureCheck(v) then
            if getinfo(v).Name == Name then
                Matches[i] = v
            end
        end
    end
    return Matches
end

if VanillaGame == "Phantom Forces" then
    local Place = "Phantom Forces"
    local GetHealth = FindLocal("gethealth")[2]
end

function Vanilla:LoadArsenal()
Arsenal = library:CreateWindow("Arsenal")

local WeaponTab = Arsenal:CreateTab("Weapon")
local WeaponBox = WeaponTab:AddLocalTab("Weapon Modifactions")

local CharacterTab = Arsenal:CreateTab("Character")
local CharacterBox = CharacterTab:AddLocalTab("Character Modifactions")

local InfiniteAmmo = false
local NoRecoil = false
local NoSpread = false

function SilentAimOn()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = false
local RunService = game:GetService("RunService")

local features = {
silentaim = true;
fov = 500;
}

function getnearest()
local nearestmagnitude = math.huge
local nearestenemy = nil
local vector = nil
for i,v in next, Players:GetChildren() do
if v ~= Players.LocalPlayer then
if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
if onScreen then
local ray = Ray.new(
Camera.CFrame.p,
(v.Character["Head"].Position-Camera.CFrame.p).unit*500
)
local ignore = {
LocalPlayer.Character,
}
local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
if hit and hit:FindFirstAncestorOfClass("Model") and Players:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
if magnitude < nearestmagnitude and magnitude <= features["fov"] then
nearestenemy = v
nearestmagnitude = magnitude
end
end
end
end
end
end
return nearestenemy
end


local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldNamecall = meta.__namecall
meta.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = {...}
if string.find(method,'Ray') then
if target then
args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target + Vector3.new(0,(workspace.CurrentCamera.CFrame.Position-target).Magnitude/500,0) - workspace.CurrentCamera.CFrame.Position).unit * 500)
end
end
return oldNamecall(unpack(args))
end)


RunService:BindToRenderStep("silentaim",1,function()
if UserInputService:IsMouseButtonPressed(0) and features["silentaim"] and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Players.LocalPlayer.Character.Humanoid.Health > 0 then
local enemy = getnearest()
if enemy and enemy.Character and enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then                
local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["Head"].Position)
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
target = workspace[enemy.Name]["Head"].Position
end
else
target = nil
end
end)
end

function SilentAimOff()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = false
local RunService = game:GetService("RunService")

local features = {
silentaim = false;
fov = 0;
}

function getnearest()
local nearestmagnitude = math.huge
local nearestenemy = nil
local vector = nil
for i,v in next, Players:GetChildren() do
if v ~= Players.LocalPlayer then
if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
if onScreen then
local ray = Ray.new(
Camera.CFrame.p,
(v.Character["Head"].Position-Camera.CFrame.p).unit*500
)
local ignore = {
LocalPlayer.Character,
}
local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
if hit and hit:FindFirstAncestorOfClass("Model") and Players:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
if magnitude < nearestmagnitude and magnitude <= features["fov"] then
nearestenemy = v
nearestmagnitude = magnitude
end
end
end
end
end
end
return nearestenemy
end


local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldNamecall = meta.__namecall
meta.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = {...}
if string.find(method,'Ray') then
if target then
args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target + Vector3.new(0,(workspace.CurrentCamera.CFrame.Position-target).Magnitude/500,0) - workspace.CurrentCamera.CFrame.Position).unit * 500)
end
end
return oldNamecall(unpack(args))
end)


RunService:BindToRenderStep("silentaim",1,function()
if UserInputService:IsMouseButtonPressed(0) and features["silentaim"] and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Players.LocalPlayer.Character.Humanoid.Health > 0 then
local enemy = getnearest()
if enemy and enemy.Character and enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then                
local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["Head"].Position)
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
target = workspace[enemy.Name]["Head"].Position
end
else
target = nil
end
end)
end

loadstring(game:HttpGet("https://pastebin.com/raw/D4DbwUBj", true))()

local a;
local b;
for i,v in next, getgc() do
  if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
     a = getfenv(v);
     b = v;
  end
end
local wshook;
wshook = hookfunction(a.speedupdate, function()
  return;
end)

local Ammo = WeaponBox:AddToggle("Infinite Ammo", false, function(enabled)
        if enabled then
            InfiniteAmmo = true

            local Storage = nil

            local function Scan(functionname, Arg1, Arg2)
                for i, v in pairs(getgc(true)) do
                    if typeof(v) == "function" and debug.getinfo(v).name == functionname then
                        Storage = v
                    end
                end
            end

            Scan("updateInventory")
    
            while InfiniteAmmo do
                debug.setupvalue(Storage, 3, InfiniteAmmo and 100)
                wait()
            end

		elseif not enabled then
            InfiniteAmmo = false

        end
end)

local Recoil = WeaponBox:AddToggle("No Recoil", false, function(enabled)
       if enabled then
            NoRecoil = true

            if NoRecoil then
                for i,v in pairs(getgc(true)) do
                    if type(v) == "table" then
                        if rawget(v, "getammo") then
                            while NoRecoil do
                                v.recoil = 0
                                wait()
                            end
                        end
                    end
                end
            end
        elseif not enabled then
            NoRecoil = false
        end
end)

local Spread = WeaponBox:AddToggle("No Spread", false, function(enabled)
       if enabled then
            NoSpread = true

            if NoSpread then
                for i,v in pairs(getgc(true)) do
                    if type(v) == "table" then
                        if rawget(v, "getammo") then
                            while NoSpread do
                                v.currentspread = 0
                                wait()
                            end
                        end
                    end
                end
            end
        elseif not enabled then
            NoSpread = false
        end
end)

local Aim = WeaponBox:AddToggle("Silent Aim", false, function(enabled)
	if enabled then
		SilentAimOn()
	elseif not enabled then
		SilentAimOff()
end
end)

local ShootWalls = WeaponBox:AddButton("Shoot through walls", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/R0DDuQ8R", true))()
end)

local Speed = CharacterBox:AddSlider("WalkSpeed", 100, 0, function(num)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
end)

local Jump = CharacterBox:AddToggle("Infinite Jump", false, function(enabled)
if enabled then
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
Action(Player.Character.Humanoid, function(self)
if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
Action(self.Parent.HumanoidRootPart, function(self)
self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
end)
end
end)
end
end)
elseif not enabled then
_G.JumpHeight = 0;
end
end)

local BunnyHop = CharacterBox:AddButton("BHOP", function()
game:GetService'RunService'.Stepped:Connect(function(t)
  if not (game:GetService'Players'.LocalPlayer.Character and game:GetService'Players'.LocalPlayer.Character:FindFirstChild'Humanoid') then
    return
  end

  game:GetService'Players'.LocalPlayer.Character.Humanoid.Jump = game:GetService'UserInputService':IsKeyDown(Enum.KeyCode.Space)
end)
end)

local Slowdown = CharacterBox:AddButton("No Slowdown", function()
local meta = assert(getrawmetatable,"not supported")(game)
local chr = game:service'Players'.LocalPlayer.Character or game:service'Players'.LocalPlayer.CharacterAdded:wait()
local cc = (newcclosure or protect_function)
do
  (make_writeable or setreadonly and function(...) setreadonly(..., false) end)(meta)
end
local backup = meta.__index
meta.__index = cc(function(z, x)
  if x == "WalkSpeed" then
      return 25
  end
  return backup(z, x)
end)
end)

local Debris = CharacterBox:AddButton("Collect All Ammo/Health", function()
workspace.Debris.ChildAdded:Connect(function(part)
local toGrab = workspace.Debris:getChildren()
for i=1,#toGrab do
if toGrab[i].Name == "DeadHP" or toGrab[i].Name == "DeadAmmo" then
toGrab[i].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
end)
end)
end

function Vanilla:LoadCounterBlox()
CounterBlox = library:CreateWindow("Counter Blox")

local WeaponTab = CounterBlox:CreateTab("Weapon")
local WeaponBox = WeaponTab:AddLocalTab("Weapon Modifactions")

local CharacterTab = CounterBlox:CreateTab("Character")
local CharacterBox = CharacterTab:AddLocalTab("Character Modifactions")

local Accuracy = getsenv(LocalPlayer.PlayerGui.Client)

local InfiniteAmmo = false
local FasterFirerate = false
local AutomaticWeapon = false
local NoSpread = false
local NoRecoil = false
local MoltovWalk = false

local OldAmmoAmount = nil
local OldStoredAmmoAmount = nil
local OldFireRate = nil
local OldSpread = nil
local OldSpread2 = nil
local OldRecoilX = nil
local OldRecoilY = nil

Services = setmetatable({}, {
    __index = function(self, index)
        return game:GetService(index)
    end
})

function Players(func, includenewplayers)
    for i,v in pairs(Services.Players:GetPlayers()) do
        func(v)
    end
	if includenewplayers then
		Services.Players.PlayerAdded:connect(func)
	end
end

local Ammo = WeaponBox:AddToggle("Infinite Ammo", false, function(enabled)
		if enabled then
            InfiniteAmmo = true	
            
			for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
                if v.Name == "Ammo" then
                    OldAmmoAmount = v.Value
					v.Value = 50000
				end
                if v.Name == "StoredAmmo" then
                    OldStoredAmmoAmount = v.Value
					v.Value = 50000
				end
			end
		elseif not enabled then
            InfiniteAmmo = false
            
			for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
				if v.Name == "Ammo" then
					v.Value = OldAmmoAmount
				end
				if v.Name == "StoredAmmo" then
					v.Value = OldStoredAmmoAmount
				end
			end
		end
end)

local Recoil = WeaponBox:AddToggle("No Recoil", false, function(enabled)
		if enabled then
            NoRecoil = true
            
            OldRecoilX = Accuracy.RecoilX
            OldRecoilY = Accuracy.RecoilY

            RunService:BindToRenderStep("recoil", 100, function()
				Accuracy.resetaccuracy()
				Accuracy.RecoilX = 0
				Accuracy.RecoilY = 0
			end)
		elseif not enabled then
            NoRecoil = false
            
            RunService:UnbindFromRenderStep("recoil")

            Accuracy.resetaccuracy()
            Accuracy.RecoilX = OldRecoilX
            Accuracy.RecoilY = OldRecoilY
		end
end)

local Spread = WeaponBox:AddToggle("No Spread", false, function(enabled)
		if enabled then
            NoSpread = true
            
			for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
                if v.Name == "Spread" then
                    OldSpread = v.Value
					v.Value = 0
                    for i2, v2 in pairs(v:GetChildren()) do
                        OldSpread2 = v2.Value
						v2.Value = 0
					end
				end
			end
		elseif not enabled then
            NoSpread = false
			for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
                if v.Name == "Spread" then
					v.Value = OldSpread
                    for i2, v2 in pairs(v:GetChildren()) do
						v2.Value = OldSpread2
					end
				end
			end
		end
end)

local FastFire = WeaponBox:AddToggle("Fast Fire", false, function(enabled)
		if enabled then
            FasterFirerate = true
            
			for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
                if v.Name == "FireRate" then
                    OldFireRate = v.Value
					v.Value = 0
				end
			end
		elseif not enabled then
            FasterFirerate = false
            
            for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
                if v.Name == "FireRate" then
					v.Value = OldFireRate
				end
			end
		end
end)

local AutoGun = WeaponBox:AddToggle("Automatic Weapons", false, function(enabled)
		if enabled then
            AutomaticWeapon = true
            
			for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
				if v.Name == "Auto" then
					v.Value = true
				end
			end
		elseif not enabled then
			AutomaticWeapon = false
		end
end)

local Moltov = CharacterBox:AddToggle("Moltov Walk", false, function(enabled)
        if enabled then
            MoltovWalk = true

            spawn(function()
                while wait(0.3) do
                    if LocalPlayer.Character then
                        if MoltovWalk then
                            local Moltov = ReplicatedStorage.Weapons["Molotov"].Model
                            local Bruh = 25
                            local Gamer = 35
                            local Epic = ""
                            local Bum = ""
                            ReplicatedStorage.Events.ThrowGrenade:FireServer(Moltov, nil, Bruh, Gamer, Vector3.new(0, -100, 0), Epic, Bum)
                        elseif not MoltovWalk then
                            break
                        end
                    end
                end
            end)
        elseif not enabled then
            MoltovWalk = false
        end
end)
end

function Vanilla:LoadPhantomForces()
PhantomForces = library:CreateWindow("Phantom Forces")

local WeaponTab = PhantomForces:CreateTab("Weapon")
local WeaponBox = WeaponTab:AddLocalTab("Weapon Modifactions")

local GunModules = ReplicatedStorage.GunModules

local InfiniteRange = false
local FasterFireate = false
local NoRecoil = false
local AutomaticGun = false

local Range = WeaponBox:AddToggle("Infinite Range", false, function(enabled)
        if enabled then
            InfiniteRange = true

            for i, v in next, (GunModules:GetChildren()) do 
                local GunData = require(v)
                if InfiniteRange then
                    GunData.range0 = math.huge
                    GunData.range1 = math.huge
                else
                    return
                end
            end
        elseif not enabled then
            InfiniteRange = false
        end
end)

local Recoil = WeaponBox:AddToggle("No Recoil", false, function(enabled)
        if enabled then
            NoRecoil = true
            local V = Vector3.new()

            if NoRecoil then
                for _,GunData in next, GunModules:GetChildren() do
                    GunData = require(GunData)
                    GunData.camkickmin = V
                    GunData.camkickmax = V
                    GunData.aimcamkickmin = V
                    GunData.aimcamkickmax = V
                    GunData.aimtranskickmin = V
                    GunData.aimtranskickmax = V
                    GunData.transkickmin = V
                    GunData.transkickmax = V
                    GunData.rotkickmin = V
                    GunData.rotkickmax = V
                    GunData.aimrotkickmin = V
                    GunData.aimrotkickmax = V
                    GunData.hipfirespread = 0
                    GunData.hipfirestability = 0
                end
            end
        elseif not enabled then
            NoRecoil = false
        end
end)

local FastFire = WeaponBox:AddToggle("Fast Fire", false, function(enabled)
        if enabled then
            FasterFireate = true
            local V = Vector3.new()

            for i, v in next, (GunModules:GetChildren()) do 
                local GunData = require(v)
                if FasterFireate then
                    GunData.firerate = 1200
                    GunData.variablefirerate = false
                    GunData.requirechamber = false
                else
                    return
                end
            end
        elseif not enabled then
            FasterFireate = false
        end
end)

local AutoGun = WeaponBox:AddToggle("Automatic Weapons", false, function(enabled)
        if enabled then
            AutomaticGun = true
            local V = Vector3.new()

            for i, v in next, (GunModules:GetChildren()) do 
                local GunData = require(v)
                if AutomaticGun then
                    GunData.firemodes = {true}
                else
                    return
                end
            end
        elseif not enabled then
            AutomaticGun = false
        end
end)

end

function Vanilla:LoadSoundSpace()
SoundSpace = library:CreateWindow("Sound Space")

local AutoTab = SoundSpace:CreateTab("Auto")
local AutoBox = AutoTab:AddLocalTab("Auto Player")

local MainCursor = game:GetService("Players").LocalPlayer.PlayerGui.CursorGui

local MapData = game:GetService("Players").LocalPlayer.MapData
local ClientCursor = Workspace.Client.Cursor
local MainCursor = game:GetService("Players").LocalPlayer.PlayerGui.CursorGui
local CursorsHolder = Workspace.Cursors

local UpdateSaber = getmenv(ReplicatedFirst.GameScript).UpdateSaber
local ResetCamera = getmenv(ReplicatedFirst.GameScript).ResetCamera
local CFrameSoundSpace = Instance.new("CFrameValue")

local AutoPlayer = false
local Value = 0

local Player = AutoBox:AddToggle("Auto Player", false, function(enabled)
        if enabled then
            AutoPlayer = true

            if AutoPlayer then
                Value = 1
            end
        elseif not enabled then
            AutoPlayer = false
            Value = 0
        end
end)

    Frame_Speed = 1 / 60
    
    ArtificialHB = Instance.new("BindableEvent", script)
    ArtificialHB.Name = "ArtificialHB"
    
    script:WaitForChild("ArtificialHB")
    
    frame = Frame_Speed
    TF = 0
    AllowFrameLoss = false
    TossRemainder = false
    LastFrame = tick()
    script.ArtificialHB:Fire()
    
    game:GetService("RunService").RenderStepped:connect(function(s, p)
        TF = TF + s
        if TF >= frame then
            if AllowFrameLoss then
                script.ArtificialHB:Fire()
                LastFrame = tick()
            else
                for i = 1, math.floor(TF / frame) do
                    script.ArtificialHB:Fire()
                end
                LastFrame = tick()
            end
            if TossRemainder then
                TF = 0
            else
                TF = TF - frame * math.floor(TF / frame)
            end
        end
    end)
    
    function Swait(NUMBER)
        if NUMBER == 0 or NUMBER == nil then
            ArtificialHB.Event:wait()
        else
            for i = 1, NUMBER do
                ArtificialHB.Event:wait()
            end
        end
    end
    
    DistanceBetween = 85
    
    Fatinum = DistanceBetween - 7

    local CameraPart = Workspace:WaitForChild("Client"):WaitForChild("CameraPos")
    local CurrentObject = nil
    local Folder = Workspace
    local PlayerMouse = LocalPlayer:GetMouse()
    
    local function Find(arr)
        local CameraPartPosition = CameraPart.Position
        local BestPosition = DistanceBetween
        local BestPart = nil
        local CurrentDistance = 0
        for i, v in pairs(arr:GetDescendants()) do
            if v:IsA("Part") and v.Name:find("-") and (CameraPartPosition - v.Position).magnitude < BestPosition then
                BestPosition = (CameraPartPosition - v.Position).magnitude
                BestPart = v
                CurrentDistance = (CameraPartPosition - v.Position).magnitude
            end
        end
        return BestPart, CurrentDistance
    end
    
    CurrentDistance2 = 85
    
    spawn(function()
        while wait do
            Swait()
            if Value == 1 then
                local Cubes = Folder:GetDescendants()
                local BestPart, Dis = Find(Workspace)
                CurrentObject = BestPart
                CurrentDistance2 = Dis
            end
        end
    end)
    
    
    repeat Swait() until CurrentObject ~= nil
    
    local Sine = 0
    local Change = 0.01
    local OldObject = CurrentObject
    local RandomPlayerMouseSpin = 0

    while true do
        coroutine.resume(
            coroutine.create(
                function()
                    if AutoPlayer then
                        if MapData.Playing.Value then
                            if CurrentObject ~= nil then
                                if CurrentObject ~= OldObject then
                                    OldObject = CurrentObject
                                    Change = math.random(-5000, 8000) / 30000
                                    RandomPlayerMouseSpin = math.random(-0.75, 0.75)
                                end
    
                                Sine = Sine + Change

                                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(CFrame.new(CameraPart.Position, (CurrentObject.Position * Vector3.new(0, 1, 1)) + Vector3.new(CameraPart.Position.X - 7, RandomPlayerMouseSpin * math.sin(Sine) * (CurrentDistance2 / Fatinum), RandomPlayerMouseSpin * math.cos(Sine) * (CurrentDistance2 / Fatinum))), (1 - (CurrentDistance2 / Fatinum)) * (1 - (CurrentDistance2 / Fatinum)) * (1 - (CurrentDistance2 / Fatinum)) * (1 - (CurrentDistance2 / Fatinum)))
                            else
                                Sine = Sine + 0.01
        
                                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(CFrame.new(CurrentCamera.CFrame.p, CurrentCamera.CFrame.p + Vector3.new(0, 0, 0)), .04)
                                Swait()
                            end
                        end
                    end
                end
            )
        )
        Swait()
    end
end






























-- game checker
function Vanilla:LoadGame()
    if VanillaGame == "Sound Space" then
        Vanilla:LoadSoundSpace()
    elseif VanillaGame == "Phantom Forces" then
        Vanilla:LoadPhantomForces()
    elseif VanillaGame == "Counter Blox" then
        Vanilla:LoadCounterBlox()
    elseif VanillaGame == "Arsenal" then
        Vanilla:LoadArsenal()
    elseif VanillaGame == "Bullet Hell" then
        Vanilla:LoadBulletHell()
    end
end
Vanilla:LoadGame()
