local function delayAndTeleport()
    local function teleport()
        local success, err = pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end)
        local success, err =
            pcall(
            function()
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        )

        if not success then
            -- Send error to Discord Webhook
          --  local DiscordWebhookURL = "webhook trunated for privacy" -- webhook has been seized by GNAA agents. 
              local DiscordWebhookURL = ""
            --  local DiscordWebhookURL = "webhook trunated for privacy" -- webhook has been seized by GNAA agents.
            local DiscordWebhookURL = ""
            local data = {
                content = "Error occurred while teleporting: " .. tostring(err)
            }
            local headers = {
                ["Content-Type"] = "application/json"
            }
            local success, response = pcall(function()
                local httpService = game:GetService("HttpService")
                local requestInfo = {
                    Url = DiscordWebhookURL,
                    Method = "POST",
                    Headers = headers,
                    Body = httpService:JSONEncode(data)
                }
                httpService:RequestAsync(requestInfo)
            end)
            local success, response =
                pcall(
                function()
                    local httpService = game:GetService("HttpService")
                    local requestInfo = {
                        Url = DiscordWebhookURL,
                        Method = "POST",
                        Headers = headers,
                        Body = httpService:JSONEncode(data)
                    }
                    httpService:RequestAsync(requestInfo)
                end
            )
            if not success then
                warn("Failed to send error to Discord Webhook: " .. tostring(response))
            end
end

coroutine.wrap(delayAndTeleport)()


BlacklistedPlayers, WhitelistedPlayers, ModsTable, kroneTable, BLSV, WLSV, MDSV, KRONE = {}, {}, {}, {}, false, false, false, false
Settings = {ServerHops = 1, Loadstring = "https://linktodbbjson.com/db.json", Distance = 18, Globals = {"Executions", "List"}}
BlacklistedPlayers, WhitelistedPlayers, ModsTable, kroneTable, BLSV, WLSV, MDSV, KRONE =
    {},
    {},
    {},
    {},
    false,
    false,
    false,
    false
Settings = {ServerHops = 1, Distance = 18, Globals = {"Executions", "List"}}
Blacklist, kroneUserids = {}, {4710732523, 354902977}

if (type(getgenv()[Settings["Globals"][1]]) == "number" and getgenv()[Settings["Globals"][1]] > 0) then getgenv()[Settings["Globals"][1]] = getgenv()[Settings["Globals"][1]] + 1; end if (not getgenv()[Settings["Globals"][2]]) then getgenv()[Settings["Globals"][1]] = 1; getgenv()[Settings["Globals"][2]] = game:GetService("HttpService"):JSONDecode(game:HttpGet(Settings["Loadstring"])) end if (type(getgenv()[Settings["Globals"][1]]) == "number" and getgenv()[Settings["Globals"][1]] >= tonumber(Settings["ServerHops"])) then getgenv()[Settings["Globals"][1]] = 1; getgenv()[Settings["Globals"][2]] = game:GetService("HttpService"):JSONDecode(game:HttpGet(Settings["Loadstring"])) end for _,v in pairs(getgenv()[Settings["Globals"][2]]) do table.insert(WhitelistedPlayers, v["RID"]) end
if (type(getgenv()[Settings["Globals"][1]]) == "number" and getgenv()[Settings["Globals"][1]] > 0) then
    getgenv()[Settings["Globals"][1]] = getgenv()[Settings["Globals"][1]] + 1
end
if (not getgenv()[Settings["Globals"][2]]) then
    getgenv()[Settings["Globals"][1]] = 1
    getgenv()[Settings["Globals"][2]] = {}
end
if
    (type(getgenv()[Settings["Globals"][1]]) == "number" and
        getgenv()[Settings["Globals"][1]] >= tonumber(Settings["ServerHops"]))
 then
    getgenv()[Settings["Globals"][1]] = 1
    getgenv()[Settings["Globals"][2]] = {}
end

local function checkBlacklist(player) if table.find(Blacklist, player.UserId) then table.insert(BlacklistedPlayers, player) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Blacklisted Player Detected: " .. player.DisplayName, "All") BLSV = true end end local function checkKrone(player) if table.find(kroneUserids, player.UserId) then table.insert(kroneTable, player) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("krone | owner Detected: " .. player.DisplayName, "All") KRONE = true end end local function checkWhitelist(player) if table.find(WhitelistedPlayers, tostring(player.UserId)) then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Whitelisted Player Detected: " .. player.DisplayName, "All") end WLSV = true end local function checkAllPlayers() for _, player in ipairs(game.Players:GetPlayers()) do if player ~= LocalPlayer then checkBlacklist(player) checkKrone(player) checkWhitelist(player) end end end
local function checkBlacklist(player)
    if table.find(Blacklist, player.UserId) then
      table.insert(BlacklistedPlayers, player)
      game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Blacklisted Player Detected: " .. player.DisplayName, "All")
      BLSV = true
    end
  end

local function checkKrone(player)
    if table.find(kroneUserids, player.UserId) then
      table.insert(kroneTable, player)
      game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(" silly goose | owner Detected: " .. player.DisplayName, "All")
      KRONE = true
    end 
  end
local function checkWhitelist(player)
end
local function checkAllPlayers()
    for _, player in ipairs(game.Players:GetPlayers()) do
      if player ~= LocalPlayer then
        checkBlacklist(player) 
        checkKrone(player)
        checkWhitelist(player)
      end
    end
  end

game.Players.PlayerAdded:Connect(function(player) if player ~= LocalPlayer then checkBlacklist(player) checkKrone(player) checkWhitelist(player) end end)
checkAllPlayers()
  game.Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
      checkBlacklist(player)
      checkKrone(player) 
      checkWhitelist(player)
    end
  end)


checkAllPlayers()

coroutine.wrap(function() while true do wait() if #BlacklistedPlayers > 0 then for _, player in ipairs(game.Players:GetPlayers()) do if player ~= LocalPlayer and not table.find(BlacklistedPlayers, player) then player:Destroy() if player.Character then player.Character:Destroy() wait(0.1) end end end end end end)() coroutine.wrap(function() while true do wait() if #WhitelistedPlayers > 0 then for _, player in ipairs(game.Players:GetPlayers()) do if player ~= LocalPlayer and table.find(WhitelistedPlayers, player) then player:Destroy() if player.Character then player.Character:Destroy() wait(0.1) end end end end end end)() coroutine.wrap(function() while true do wait() if #kroneTable > 0 then for _, player in ipairs(game.Players:GetPlayers()) do if player ~= LocalPlayer and table.find(kroneTable, player) then player:Destroy() if player.Character then player.Character:Destroy() wait(0.1) end end end end end end)()
coroutine.wrap(
    function()
        while true do
            wait()
            if #BlacklistedPlayers > 0 then
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and not table.find(BlacklistedPlayers, player) then
                        player:Destroy()
                        if player.Character then
                            player.Character:Destroy()
                            wait(0.1)
                        end
                    end
                end
            end
        end
    end
)()
coroutine.wrap(
    function()
        while true do
            wait()
            if #WhitelistedPlayers > 0 then
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and table.find(WhitelistedPlayers, player) then
                        player:Destroy()
                        if player.Character then
                            player.Character:Destroy()
                            wait(0.1)
                        end
                    end
                end
            end
        end
    end
)()
coroutine.wrap(
    function()
        while true do
            wait()
            if #kroneTable > 0 then
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and table.find(kroneTable, player) then
                        player:Destroy()
                        if player.Character then
                            player.Character:Destroy()
                            wait(0.1)
                        end
                    end
                end
            end
        end
    end
)()

game:GetService("Lighting").ClockTime = 0

local function ServerHop()
    local success, response = pcall(function()
        return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    local success, response =
        pcall(
        function()
            return game:GetService("HttpService"):JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                )
            )
        end
    )

    if success and response and response.data then
        local AvailableServers = response.data

        while true do
            wait()
            local RandomServer = AvailableServers[math.random(#AvailableServers)]
            if RandomServer.playing < RandomServer.maxPlayers - 1 and RandomServer.playing > 12 and RandomServer.id ~= game.JobId then
            if
                RandomServer.playing < RandomServer.maxPlayers - 1 and RandomServer.playing > 12 and
                    RandomServer.id ~= game.JobId
             then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, RandomServer.id)
            end
        end
local function ServerHop()
    end
end

local function hop() while true do local success, errorMessage = pcall(ServerHop) if not success then warn("Server hop error: " .. errorMessage) end wait() end end

local function hop()
    while true do
        local success, errorMessage = pcall(ServerHop)
        if not success then
            warn("Server hop error: " .. errorMessage)
        end
        wait()
    end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local rservice = game:GetService("RunService")

animations = { 3333499508; 3695333486; 3333136415; 3338042785; 4940561610; 4940564896; 4841399916; 4641985101; 4555782893; 4265725525; 3338097973; 3333432454; 3333387824; 4406555273; 4212455378; 4049037604; 3695300085; 3695322025; 5915648917; 5915714366; 5918726674; 5917459365; 5915712534; 5915713518; 5937558680; 5918728267; 5937560570; 507776043; 507777268; 507771019 }

local randomdance = animations[math.random(1, #animations)] local WaveAnim = Instance.new("Animation") WaveAnim.AnimationId = "rbxassetid://"..tostring(randomdance) local wave; PlayWaveAnim = function() wave = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(WaveAnim) wave:Play(1, 5, 1) end PlayWaveAnim()

if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then coroutine.wrap(function() while wait() do if game.Players.LocalPlayer.CharacterAdded then game.Players.LocalPlayer.CharacterAdded:wait() wait(1) PlayWaveAnim() end end end)() end

animations = {
    3333499508,
    3695333486,
    3333136415,
    3338042785,
    4940561610,
    4940564896,
    4841399916,
    4641985101,
    4555782893,
    4265725525,
    3338097973,
    3333432454,
    3333387824,
    4406555273,
    4212455378,
    4049037604,
    3695300085,
    3695322025,
    5915648917,
    5915714366,
    5918726674,
    5917459365,
    5915712534,
    5915713518,
    5937558680,
    5918728267,
    5937560570,
    507776043,
    507777268,
    507771019
}

local randomdance = animations[math.random(1, #animations)]
local WaveAnim = Instance.new("Animation")
WaveAnim.AnimationId = "rbxassetid://" .. tostring(randomdance)
local wave
PlayWaveAnim = function()
    wave = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(WaveAnim)
    wave:Play(1, 5, 1)
end
PlayWaveAnim()

if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    coroutine.wrap(
        function()
            while wait() do
                if game.Players.LocalPlayer.CharacterAdded then
                    game.Players.LocalPlayer.CharacterAdded:wait()
                    wait(1)
                    PlayWaveAnim()
                end
            end
        end
    )()
end

local CF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local numb = 0

local Nearby = function(TP, WP)
    local WC, TC = WP["Character"] or nil, TP["Character"] or nil;
    local WC, TC = WP["Character"] or nil, TP["Character"] or nil
    if WC and TC then
        local WPS, TPS = WC["PrimaryPart"]["Position"] or nil, TC["PrimaryPart"]["Position"] or nil;
        local WPS, TPS = WC["PrimaryPart"]["Position"] or nil, TC["PrimaryPart"]["Position"] or nil
        if WPS and TPS then
            return ((WPS - TPS)["magnitude"] <= Settings["Distance"])
        else
            return false;
        end;
    end; return false;
end;
            return false
        end
    end
    return false
end

local function shhhlol(TargetPlayer)
    local Character = LocalPlayer.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart
    

    local im = TargetPlayer.Character
    local so
    local sorry
    local please
    local stop
    local it
    

    if im:FindFirstChildOfClass("Humanoid") then
        so = im:FindFirstChildOfClass("Humanoid")
    end
 local function shhhlol(TargetPlayer)
    if Accessoy and stop:FindFirstChild("it") then
        it = stop.it
    end
    

    if Character and Humanoid and RootPart then
        if please then
            workspace.CurrentCamera.CameraSubject = please
local function shhhlol(TargetPlayer)
        if not im:FindFirstChildWhichIsA("BasePart") then
            return
        end
        local function mmmm(comkid,Pos,Ang)
        local function mmmm(comkid, Pos, Ang)
            RootPart.CFrame = CFrame.new(comkid.Position) * Pos * Ang
            RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        local function wtf(comkid)
            local TimeToWait = 0.134
            local Time = tick()
            local Angle = 0

        Att1 = Instance.new("Attachment", RootPart)
        Att2 = Instance.new("Attachment", sorry)


            Att1 = Instance.new("Attachment", RootPart)
            Att2 = Instance.new("Attachment", sorry)

            repeat
            for _,v in next, WhitelistedPlayers do
        local WP = table.find(WhitelistedPlayers, tostring(v.UserId))
        if WP and Nearby(Player, WP) then
            return;
        end;
    end;
                for _, v in next, WhitelistedPlayers do
                    local WP = table.find(WhitelistedPlayers, tostring(v.UserId))
                    if WP and Nearby(Player, WP) then
                        return
                    end
                end
                if RootPart and so then
                    if comkid.Velocity.Magnitude < 30 then
                        mmmm(comkid,CFrame.new(0,1.5,0) + so.MoveDirection * comkid.Velocity.Magnitude / 5,CFrame.Angles(math.random(1, 2) == 1 and math.rad(0) or math.rad(180), math.random(1, 2) == 1 and math.rad(0) or math.rad(180), math.random(1, 2) == 1 and math.rad(0) or math.rad(180)))
                        mmmm(
                            comkid,
                            CFrame.new(0, 1.5, 0) + so.MoveDirection * comkid.Velocity.Magnitude / 5,
                            CFrame.Angles(
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180),
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180),
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180)
                            )
                        )
                        game:GetService("RunService").Heartbeat:wait()

                        mmmm(comkid,CFrame.new(0,1.5,0) + so.MoveDirection * comkid.Velocity.Magnitude / 1.25,CFrame.Angles(math.random(1, 2) == 1 and math.rad(0) or math.rad(180), math.random(1, 2) == 1 and math.rad(0) or math.rad(180), math.random(1, 2) == 1 and math.rad(0) or math.rad(180)))
                        mmmm(
                            comkid,
                            CFrame.new(0, 1.5, 0) + so.MoveDirection * comkid.Velocity.Magnitude / 1.25,
                            CFrame.Angles(
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180),
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180),
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180)
                            )
                        )
                        game:GetService("RunService").Heartbeat:wait()

                        mmmm(comkid,CFrame.new(0,-1.5,0) + so.MoveDirection * comkid.Velocity.Magnitude / 1.25,CFrame.Angles(math.random(1, 2) == 1 and math.rad(0) or math.rad(180), math.random(1, 2) == 1 and math.rad(0) or math.rad(180), math.random(1, 2) == 1 and math.rad(0) or math.rad(180)))
                        mmmm(
                            comkid,
                            CFrame.new(0, -1.5, 0) + so.MoveDirection * comkid.Velocity.Magnitude / 1.25,
                            CFrame.Angles(
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180),
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180),
                                math.random(1, 2) == 1 and math.rad(0) or math.rad(180)
                            )
                        )
                        game:GetService("RunService").Heartbeat:wait()

                    else
                        mmmm(comkid,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(0),0,0))
                        mmmm(comkid, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(0), 0, 0))
                        game:GetService("RunService").Heartbeat:wait()

                    end
                else
                    break
                end
            until comkid.Velocity.Magnitude > 1000 or comkid.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == im or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            until comkid.Velocity.Magnitude > 1000 or comkid.Parent ~= TargetPlayer.Character or
                TargetPlayer.Parent ~= Players or
                not TargetPlayer.Character == im or
                Humanoid.Health <= 0 or
                tick() > Time + TimeToWait
            if game.PlaceId == 417267366 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5524, 36, -17126.50)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5524, 36, -17126.50)
            else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF
            end
        end
        workspace.FallenPartsDestroyHeight = 0/0
        workspace.FallenPartsDestroyHeight = 0 / 0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(-9e99,9e99,-9e99)
        BV.Velocity = Vector3.new(-9e99, 9e99, -9e99)
        BV.MaxForce = Vector3.new(-9e9, 9e9, -9e9)

        local BodyGyro = Instance.new("BodyGyro")
 local function shhhlol(TargetPlayer)
        BodyPosition.P = -9e9

        local LineForce = Instance.new("LineForce")
        LineForce.Attachment0 = Att1; LineForce.Attachment1 = Att2
        LineForce.Attachment0 = Att1
        LineForce.Attachment1 = Att2
        LineForce.ApplyAtCenterOfMass = true
        LineForce.InverseSquareLaw = true
        LineForce.Magnitude = 2e7
 local function shhhlol(TargetPlayer)
        LineForce:Destroy()
        Att1:Destroy()
        Att2:Destroy()
        for _,x in next, Character:GetDescendants() do
        for _, x in next, Character:GetDescendants() do
            if x:IsA("BasePart") then
                x.Velocity,x.RotVelocity = Vector3.new(),Vector3.new()
                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
            end
        end
        Humanoid:ChangeState("GettingUp")
        workspace.CurrentCamera.CameraSubject = Humanoid
    end
end

rservice.Stepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
rservice.Stepped:Connect(
    function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
            for _, z in next, LocalPlayer.Character:GetChildren() do
                if z:IsA "BasePart" then
                    z.CanCollide = false
                end
            end
        end
        for _,z in next, LocalPlayer.Character:GetChildren() do if z:IsA'BasePart' then z.CanCollide = false end end
    end
end)
coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
            for _,z in pairs(Players:GetPlayers()) do
                if z ~= LocalPlayer and not table.find(WhitelistedPlayers, tostring(z.UserId)) then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and z and z.Character and z.Character:FindFirstChildOfClass("Humanoid").Sit == false then
                        shhhlol(z)
                        wait()
)
coroutine.resume(
    coroutine.create(
        function()
            while wait() do
                pcall(
                    function()
                        for _, z in pairs(Players:GetPlayers()) do
                            if z ~= LocalPlayer and not table.find(WhitelistedPlayers, tostring(z.UserId)) then
                                if
                                    LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and
                                        z and
                                        z.Character and
                                        z.Character:FindFirstChildOfClass("Humanoid").Sit == false
                                 then
                                    shhhlol(z)
                                    wait()
                                end
                            end
                        end
                    end
                end
                )
            end
        end)
    end
end))
local function Chat(msg) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All") end

task.spawn(function() while true do wait(0.45) Chat("erm put your advertising message in here") end end)

        end
    )
)
local function Chat(msg)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

spawn(function() while true do wait(0.5) numb = numb + 1 if numb == 212 then game.Players.LocalPlayer:Kick("Serverhopping.... cuz we swag like that") wait(0.5) pcall(hop) end end end)
task.spawn(
    function()
        while true do
            wait(0.45)
            Chat("erm put your advertising message in here")
        end
    end
)

spawn(
    function()
        while true do
            wait(0.5)
            numb = numb + 1
            if numb == 212 then
                game.Players.LocalPlayer:Kick("Serverhopping.... cuz we swag like that")
                wait(0.5)
                pcall(hop)
            end
        end
    end
)
