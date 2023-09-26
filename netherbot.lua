NetherBot.InitLocale()
local i18n = NetherBot.I18n

-- Create the Main frame
local frame = CreateFrame("Frame", "NetherbotFrame", UIParent)
frame:SetSize(200, 200)
frame:SetPoint("CENTER", UIParent, "CENTER")

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOP", frame, "TOP", 0, -10)
title:SetText(i18n("NetherBot - NPCBOT Tool"))

-- Set the background color and transparency for MainFrame "Frame"
frame:SetBackdrop({
  bgFile = "Interface/Buttons/WHITE8X8",
  edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
  tile = true, tileSize = 16, edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0.35, 0.14, 0.73, 0.25)
frame:SetBackdropBorderColor(0.53,0.07,0.89,1)

-- Make the frame movable
frame:SetMovable(true)
frame:EnableMouse(true)


-- Create the adminFrame
local adminFrame = CreateFrame("Frame", "NetherbotAdminFrame", UIParent)
adminFrame:SetSize(200, 200)
adminFrame:SetPoint("RIGHT", frame, "LEFT", -10, 0)
adminFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                      edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                      tile = true, tileSize = 16, edgeSize = 16, 
                      insets = { left = 4, right = 4, top = 4, bottom = 4 }})
adminFrame:SetBackdropColor(1, 0, 0, 0.2) -- Set the background color to red and transparency to 20%.
adminFrame:SetBackdropBorderColor(0, 1, 0,1)
adminFrame:Hide() -- hide the admin frame by default

local adminTitle = adminFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
adminTitle:SetPoint("TOP", adminFrame, "TOP", 0, -10)
adminTitle:SetText(i18n("Admin"))


-- Handle frame movement
    frame:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
          self:StartMoving()
        end
      end)

-- Stop frame movement
frame:SetScript("OnMouseUp", function(self, button)
  if button == "LeftButton" then
    self:StopMovingOrSizing()
  end
end)


-- Create the buttons
-- Follow Button
local followButton = CreateFrame("Button", "NetherbotFollowButton", frame, "ActionButtonTemplate")
followButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -35)
followButton:SetSize(42, 42)
followButton:SetText(i18n("Follow"))
followButton:SetNormalFontObject("GameFontNormal")
local followTexture = followButton:CreateTexture(nil, "BACKGROUND")
followTexture:SetTexture("Interface\\Icons\\Ability_Tracking")
followTexture:SetAllPoints()
followButton:SetNormalTexture(followTexture)
local followpushedTexture = followButton:CreateTexture(nil, "BACKGROUND")
followpushedTexture:SetTexture("Interface\\Icons\\Ability_Tracking")
followpushedTexture:SetAllPoints()
followButton:SetPushedTexture(followpushedTexture)

-- StandStill Button
local standstillButton = CreateFrame("Button", "NetherbotStandstillButton", frame, "ActionButtonTemplate")
standstillButton:SetPoint("LEFT", followButton, "RIGHT", 5, 0)
standstillButton:SetSize(42, 42)
standstillButton:SetText(i18n("Stand"))
standstillButton:SetNormalFontObject("GameFontNormal")
local standstillTexture = standstillButton:CreateTexture(nil, "BACKGROUND")
standstillTexture:SetTexture("Interface\\Icons\\Inv_misc_map_01")
standstillTexture:SetAllPoints()
standstillButton:SetNormalTexture(standstillTexture)
local standstillpushedTexture = standstillButton:CreateTexture(nil, "BACKGROUND")
standstillpushedTexture:SetTexture("Interface\\Icons\\Inv_misc_map_01")
standstillpushedTexture:SetAllPoints()
standstillButton:SetPushedTexture(standstillpushedTexture)

--FullStop Button
local fullstopButton = CreateFrame("Button", "NetherbotfullstopButton", frame, "ActionButtonTemplate")
fullstopButton:SetPoint("LEFT", standstillButton, "RIGHT", 5, 0)
fullstopButton:SetSize(42, 42)
fullstopButton:SetText(i18n("Stop"))
fullstopButton:SetNormalFontObject("GameFontNormal")
local fullstopTexture = fullstopButton:CreateTexture(nil, "BACKGROUND")
fullstopTexture:SetTexture("Interface\\Icons\\Spell_chargenegative")
fullstopTexture:SetAllPoints()
fullstopButton:SetNormalTexture(fullstopTexture)
local fullstoppushedTexture = fullstopButton:CreateTexture(nil, "BACKGROUND")
fullstoppushedTexture:SetTexture("Interface\\Icons\\Spell_chargenegative")
fullstoppushedTexture:SetAllPoints()
fullstopButton:SetPushedTexture(fullstoppushedTexture)

-- Slack Button
local followOnlyButton = CreateFrame("Button", "NetherbotFollowOnlyButton", frame, "ActionButtonTemplate")
followOnlyButton:SetPoint("LEFT", fullstopButton, "RIGHT", 5, 0)
followOnlyButton:SetSize(42, 42)
followOnlyButton:SetText(i18n("Slack"))
followOnlyButton:SetNormalFontObject("GameFontNormal")
local followOnlyTexture = followOnlyButton:CreateTexture(nil, "BACKGROUND")
followOnlyTexture:SetTexture("Interface\\Icons\\Spell_Nature_Sleep")
followOnlyTexture:SetAllPoints()
followOnlyButton:SetNormalTexture(followOnlyTexture)
local followOnlyPushedTexture = followOnlyButton:CreateTexture(nil, "BACKGROUND")
followOnlyPushedTexture:SetTexture("Interface\\Icons\\Spell_Nature_Sleep")
followOnlyPushedTexture:SetAllPoints()
followOnlyButton:SetPushedTexture(followOnlyPushedTexture)

local distanceLabel = standstillButton:CreateFontString(nil, "ARTWORK", "GameFontNormal")
distanceLabel:SetPoint("BOTTOM", standstillButton, "BOTTOM", 20, -35)
distanceLabel:SetText(i18n("Follow Distance:"))

--Distance1 Button
local distance1Button = CreateFrame("Button", "Netherbotdistance1Button", frame, "ActionButtonTemplate")
distance1Button:SetPoint("TOPLEFT", followButton, "BOTTOMLEFT", 10, -40)
distance1Button:SetSize(50, 25)
distance1Button:SetText(i18n("Low"))
distance1Button:SetNormalFontObject("GameFontNormal")
local distance1Texture = distance1Button:CreateTexture(nil, "BACKGROUND")
distance1Texture:SetTexture("Interface\\Icons\\Inv_misc_punchcards_red")
distance1Texture:SetAllPoints()
distance1Button:SetNormalTexture(distance1Texture)
local distance1pushedTexture = distance1Button:CreateTexture(nil, "BACKGROUND")
distance1pushedTexture:SetTexture("Interface\\Icons\\Inv_misc_punchcards_red")
distance1pushedTexture:SetAllPoints()
distance1Button:SetPushedTexture(distance1pushedTexture)

--Distance2 Button
local distance2Button = CreateFrame("Button", "Netherbotdistance2Button", frame, "ActionButtonTemplate")
distance2Button:SetPoint("LEFT", distance1Button, "RIGHT", 5, 0)
distance2Button:SetSize(50, 25)
distance2Button:SetText(i18n("Medium"))
distance2Button:SetNormalFontObject("GameFontNormal")
local distance2Texture = distance2Button:CreateTexture(nil, "BACKGROUND")
distance2Texture:SetTexture("Interface\\Icons\\Inv_misc_punchcards_red")
distance2Texture:SetAllPoints()
distance2Button:SetNormalTexture(distance2Texture)
local distance2pushedTexture = distance2Button:CreateTexture(nil, "BACKGROUND")
distance2pushedTexture:SetTexture("Interface\\Icons\\Inv_misc_punchcards_red")
distance2pushedTexture:SetAllPoints()
distance2Button:SetPushedTexture(distance2pushedTexture)

--Distance3 Button
local distance3Button = CreateFrame("Button", "Netherbotdistance3Button", frame, "ActionButtonTemplate")
distance3Button:SetPoint("LEFT", distance2Button, "RIGHT", 5, 0)
distance3Button:SetSize(50, 25)
distance3Button:SetText(i18n("High"))
distance3Button:SetNormalFontObject("GameFontNormal")
local distance3Texture = distance3Button:CreateTexture(nil, "BACKGROUND")
distance3Texture:SetTexture("Interface\\Icons\\Inv_misc_punchcards_red")
distance3Texture:SetAllPoints()
distance3Button:SetNormalTexture(distance3Texture)
local distance3pushedTexture = distance3Button:CreateTexture(nil, "BACKGROUND")
distance3pushedTexture:SetTexture("Interface\\Icons\\Inv_misc_punchcards_red")
distance3pushedTexture:SetAllPoints()
distance3Button:SetPushedTexture(distance3pushedTexture)

local adminButton = CreateFrame("Button", "NetherbotAdminButton", frame, "UIPanelButtonTemplate")
adminButton:SetSize(60, 20)
adminButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -10, 10) -- position the button in the bottom right of the frame
adminButton:SetText(i18n("Admin"))
adminButton:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local raidButton = CreateFrame("Button", "NetherbotRaidButton", frame, "UIPanelButtonTemplate")
raidButton:SetSize(70, 20)
raidButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -120, 10) -- position the button in the bottom right of the frame
raidButton:SetText("RaidFrame")
raidButton:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

-- Create Admin Buttons
local buttonAdd = CreateFrame("Button", "NetherbotButtonAdd", adminFrame, "UIPanelButtonTemplate")
buttonAdd:SetSize(56, 22)
buttonAdd:SetPoint("TOPLEFT", adminFrame, "TOPLEFT", 10, -35)
buttonAdd:SetText(i18n("Add"))
buttonAdd:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local buttonRemove = CreateFrame("Button", "NetherbotButtonRemove", adminFrame, "UIPanelButtonTemplate")
buttonRemove:SetSize(65, 22)
buttonRemove:SetPoint("TOP", buttonAdd, "BOTTOM", 25, -5)
buttonRemove:SetText(i18n("Remove"))
buttonRemove:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local buttonRecall = CreateFrame("Button", "NetherbotButtonRecall", adminFrame, "UIPanelButtonTemplate")
buttonRecall:SetSize(59, 22)
buttonRecall:SetPoint("LEFT", buttonAdd, "RIGHT", 3, 0)
buttonRecall:SetText(i18n("Recall"))
buttonRecall:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local buttonBotinfo = CreateFrame("Button", "NetherbotButtonBotInfo", adminFrame, "UIPanelButtonTemplate")
buttonBotinfo:SetSize(62, 22)
buttonBotinfo:SetPoint("LEFT", buttonRecall, "RIGHT", 2, 0)
buttonBotinfo:SetText(i18n("Bot-Info"))
buttonBotinfo:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local buttonMove = CreateFrame("Button", "NetherbotButtonMove", adminFrame, "UIPanelButtonTemplate")
buttonMove:SetSize(65, 22)
buttonMove:SetPoint("LEFT", buttonRemove, "RIGHT", 5, 0)
buttonMove:SetText(i18n("Move"))
buttonMove:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local buttonDelete = CreateFrame("Button", "NetherbotButtonDelete", adminFrame, "UIPanelButtonTemplate")
buttonDelete:SetSize(60, 22)
buttonDelete:SetPoint("BOTTOMRIGHT", adminFrame, "BOTTOMRIGHT", -10, 10)
buttonDelete:SetText(i18n("Delete"))
buttonDelete:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

local redemptionButton = CreateFrame("Button", "NetherbotRedemptionButton", adminFrame, "SecureActionButtonTemplate")
redemptionButton:SetSize(30, 30)
redemptionButton:SetPoint("BOTTOMLEFT", adminFrame, "BOTTOMLEFT", 10, 10)

local redemptionIcon = redemptionButton:CreateTexture(nil, "BACKGROUND")
redemptionIcon:SetAllPoints()
redemptionIcon:SetTexture(select(3, GetSpellInfo(7328)))

redemptionButton:SetNormalTexture(redemptionIcon)

redemptionButton:SetAttribute("type", "spell")
redemptionButton:SetAttribute("spell", 7328)

-- Create the "botLookupButton" button
local botLookupButton = CreateFrame("Button", "NetherbotBotLookupButton", adminFrame, "UIPanelButtonTemplate")
botLookupButton:SetSize(65, 22)
botLookupButton:SetPoint("BOTTOM", adminFrame, "BOTTOM", 0, 10)
botLookupButton:SetText(i18n("Lookup"))
botLookupButton:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)


-- Main Frame Button Functions:
followButton:SetScript("OnClick", function()
    SendChatMessage(".npcbot command follow", "SAY")
  end)


standstillButton:SetScript("OnClick", function()
    SendChatMessage(".npcbot command standstill", "SAY")
  end)

  fullstopButton:SetScript("OnClick", function()
    SendChatMessage(".npcbot command stopfully", "SAY")
  end)


  distance1Button:SetScript("OnClick", function()
    SendChatMessage(".npcbot distance 30", "SAY")
  end)

  distance2Button:SetScript("OnClick", function()
    SendChatMessage(".npcbot distance 50", "SAY")
  end)

  distance3Button:SetScript("OnClick", function()
    SendChatMessage(".npcbot distance 85", "SAY")
  end)
  
followOnlyButton:SetScript("OnClick", function()
SendChatMessage(".npcbot command follow only", "SAY")
end)


  adminButton:SetScript("OnClick", function()
    if adminFrame:IsShown() then
      adminFrame:Hide()
    else
      adminFrame:Show()
    end
  end)

-- Admin Frame Button Functions

buttonAdd:SetScript("OnClick", function()
    local target = UnitName("target")
    if target then
      -- Target is selected, run command ".npcbot add target"
      ChatFrame1:AddMessage(".npcbot add " .. target)
      SendChatMessage(".npcbot add ", "SAY")
    else
      -- Target is not selected, prompt input and run command ".npcbot add (input value)"
      StaticPopupDialogs["ADD_NPC"] = {
        text = "Enter NPCBOT ID:",
        button1 = "Ok",
        button2 = "Cancel",
        hasEditBox = true,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        OnAccept = function(self)
          local npc = self.editBox:GetText()
          ChatFrame1:AddMessage(".npcbot add " .. npc)
          SendChatMessage(".npcbot add " .. npc, "SAY")
        end,
      }
      StaticPopup_Show("ADD_NPC")
    end
  end)

  buttonRemove:SetScript("OnClick", function()
    local target = UnitName("target")
    if target then
      -- Target is selected, run command ".npcbot remove target"
      ChatFrame1:AddMessage(".npcbot remove " .. target)
      SendChatMessage(".npcbot remove ", "SAY")
    else
      -- Target is not selected, prompt input and run command ".npcbot remove (input value)"
      StaticPopupDialogs["REMOVE_NPC"] = {
        text = "Enter NPCBOT ID:",
        button1 = "Ok",
        button2 = "Cancel",
        hasEditBox = true,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        OnAccept = function(self)
          local npc = self.editBox:GetText()
          ChatFrame1:AddMessage(".npcbot remove " .. npc)
          SendChatMessage(".npcbot remove " .. npc, "SAY")
        end,
      }
      StaticPopup_Show("REMOVE_NPC")
    end
  end)

  buttonRecall:SetScript("OnClick", function()
    SendChatMessage(".npcbot recall", "SAY")
  end)

  buttonBotinfo:SetScript("OnClick", function()
    SendChatMessage(".npcbot info", "SAY")
    DoEmote("BONK")
  end)

  buttonMove:SetScript("OnClick", function()
    SendChatMessage(".npcbot move", "SAY")
  end)
  
  buttonDelete:SetScript("OnClick", function()
    StaticPopupDialogs["CONFIRM_DELETE"] = {
    text = "Are you sure you want to delete?",
    button1 = "Yes",
    button2 = "No",
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnAccept = function()
    local target = UnitName("target")
    if target then
    -- Target is selected, run command ".npcbot delete target"
    ChatFrame1:AddMessage(".npcbot delete " .. target)
    SendChatMessage(".npcbot delete ", "SAY")
    else
    -- Target is not selected, prompt input and run command ".npcbot delete (input value)"
    StaticPopupDialogs["DELETE_NPC"] = {
    text = "Enter NPCBOT ID:",
    button1 = "Ok",
    button2 = "Cancel",
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnAccept = function(self)
    local npc = self.editBox:GetText()
    ChatFrame1:AddMessage(".npcbot delete " .. npc)
    SendChatMessage(".npcbot delete " .. npc, "SAY")
    end,
    }
    StaticPopup_Show("DELETE_NPC")
    end
    end,
    }
    StaticPopup_Show("CONFIRM_DELETE")
    end)

  
  redemptionButton:SetScript("OnClick", function()
    ChatFrame1:AddMessage(".npcbot revive")
    SendChatMessage(".npcbot revive", "SAY")
end)

  redemptionButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(i18n("Revive Bots"))
    GameTooltip:Show()
  end)
  
  redemptionButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
  end)

-- Create the lookup frame
local lookupFrame = CreateFrame("Frame", "NetherbotLookupFrame", UIParent)
lookupFrame:SetSize(200, 200)
lookupFrame:SetPoint("CENTER", UIParent, "CENTER")
lookupFrame:SetBackdrop({
  bgFile = "Interface/Tooltips/UI-Tooltip-Background",
  edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
  tile = true, tileSize = 16, edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
lookupFrame:SetBackdropColor(0, 0, 1, 0.3)
lookupFrame:SetBackdropBorderColor(0, 0, 1,1)
lookupFrame:Hide()

local lookupTitle = lookupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
lookupTitle:SetPoint("TOPLEFT", lookupFrame, "TOPLEFT", 10, -10)
lookupTitle:SetText(i18n("Select class:"))


-- Create the scrollframe for the list
local lookupScrollFrame = CreateFrame("ScrollFrame", "NetherbotLookupScrollFrame", lookupFrame, "UIPanelScrollFrameTemplate")
lookupScrollFrame:SetPoint("TOPLEFT", lookupFrame, "TOPLEFT", 4, -25)
lookupScrollFrame:SetPoint("BOTTOMRIGHT", lookupFrame, "BOTTOMRIGHT", -4, 4)

-- Create the list frame
local lookupList = CreateFrame("Frame", "NetherbotLookupList", lookupScrollFrame)
lookupList:SetSize(lookupScrollFrame:GetWidth(), lookupScrollFrame:GetHeight())
lookupScrollFrame:SetScrollChild(lookupList)

-- Create the key-value store
local classTable = {
  ["Warrior"] = 1,
  ["Paladin"] = 2,
  ["Hunter"] = 3,
  ["Rogue"] = 4,
  ["Priest"] = 5,
  ["Death Knight"] = 6,
  ["Shaman"] = 7,
  ["Mage"] = 8,
  ["Warlock"] = 9,
  ["Druid"] = 11,
  ["Blademaster"] = 12,
  ["Sphynx"] = 13,
  ["Archmage"] = 14,
  ["Dreadlord"] = 15,
  ["Spellbreaker"] = 16,
  ["DarkRanger"] = 17,
  ["Necromancer"] = 18,
  ["SeaWitch"] = 19
}

-- Create the buttons for the list items
for key, value in pairs(classTable) do
  local button = CreateFrame("Button", "NetherbotLookupButton"..value, lookupList, "UIPanelButtonTemplate")
  button:SetSize(180, 25)
  button:SetPoint("TOPLEFT", lookupList, "TOPLEFT", 10, -10 - (value-1)*30)
  button:SetText(i18n(key))
  button:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

  -- Handle the button's click event
  button:SetScript("OnClick", function()
    SendChatMessage(".npcbot lookup " .. value, "SAY")
    -- You can add your custom functionality here like running a command or doing some other action
  end)
end

-- Create the "hideLookup" button
local hideLookupButton = CreateFrame("Button", "NetherbotHideLookupButton", lookupFrame, "UIPanelButtonTemplate")
hideLookupButton:SetSize(21, 20)
hideLookupButton:SetPoint("TOPRIGHT", lookupFrame, "TOPRIGHT", -10, -8)
hideLookupButton:SetText(i18n("X"))
hideLookupButton:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)


-- Create the spawnFrame
local spawnFrame = CreateFrame("Frame", "NetherbotSpawnFrame", lookupFrame)
spawnFrame:SetSize(200, 60)
spawnFrame:SetPoint("BOTTOM", lookupFrame, "BOTTOM", 0, -70)
spawnFrame:SetBackdrop({
    bgFile = "Interface/BUTTONS/WHITE8X8", 
    edgeFile = "Interface/BUTTONS/WHITE8X8", 
    edgeSize = 1, 
    insets = {left = 0, right = 0, top = 0, bottom = 0}})
  spawnFrame:SetBackdropColor(0, 0, 1, 0.3)
  spawnFrame:SetBackdropBorderColor(0, 0, 1,1)

-- Create the title
local spawnTitle = spawnFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
spawnTitle:SetPoint("TOPLEFT", spawnFrame, "TOPLEFT", 10, -10)
spawnTitle:SetText(i18n("Spawn BOT ID:"))


-- Create the "buttonSpawnBot" button
local buttonSpawnBot = CreateFrame("Button", "NetherbotButtonSpawnBot", spawnFrame, "UIPanelButtonTemplate")
buttonSpawnBot:SetSize(80, 25)
buttonSpawnBot:SetPoint("BOTTOMLEFT", spawnFrame, "BOTTOMLEFT", 10, 10)
buttonSpawnBot:SetText(i18n("Spawn Bot"))
buttonSpawnBot:GetNormalTexture():SetVertexColor(0.10,1.00,0.10)

-- Create the "classInput" input box
local classInput = CreateFrame("EditBox", "NetherbotClassInput", spawnFrame, "InputBoxTemplate")
classInput:SetSize(80, 25)
classInput:SetPoint("BOTTOMLEFT", buttonSpawnBot, "BOTTOMRIGHT", 10, 0)
classInput:SetAutoFocus(false)

-- Handle the buttons click event
buttonSpawnBot:SetScript("OnClick", function()
  local input = classInput:GetText()
  if input ~= "" then
    SendChatMessage(".npcbot spawn "..input, "GUILD")
    classInput:SetText(i18n(""))
    classInput:ClearFocus()
  else
    print("Please enter an ID:")
  end
end)

-- Handle Lookup buttons click event
hideLookupButton:SetScript("OnClick", function()
    lookupFrame:Hide()
end)

-- Handle the Lookup buttons click event
botLookupButton:SetScript("OnClick", function()
  if lookupFrame:IsShown() then
    lookupFrame:Hide()
  else
    lookupFrame:Show()
  end
end)

-- Handle lookupframe movement
-- Make the frame movable
lookupFrame:SetMovable(true)
lookupFrame:EnableMouse(true)

  lookupFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
      self:StartMoving()
    end
  end)

-- Stop lookupframe movement.
 lookupFrame:SetScript("OnMouseUp", function(self, button)
   if button == "LeftButton" then
     self:StopMovingOrSizing()
  end
end)

-- Slash command to show-hide netherbot.
SLASH_NETHERBOT1 = "/netherbot"
function SlashCmdList.NETHERBOT(msg, editbox)
  if msg == "show" then
    frame:Show()
  elseif msg == "hide" then
    frame:Hide()
    adminFrame:Hide()
    lookupFrame:Hide()
  end
end

-- RAID FRAMES:

-- Create main frame
local TeamFrame = CreateFrame("Frame", "TeamFrame", UIParent)
TeamFrame:SetSize(350, 600)
TeamFrame:SetPoint("CENTER")

-- Make the frame draggable
TeamFrame:SetMovable(true)
TeamFrame:EnableMouse(true)
TeamFrame:RegisterForDrag("LeftButton")
TeamFrame:SetScript("OnDragStart", TeamFrame.StartMoving)
TeamFrame:SetScript("OnDragStop", TeamFrame.StopMovingOrSizing)
TeamFrame:Hide()

-- Create tables to store information
local memberFrames = {}
local healthBars = {}
local manaBars = {}
local nameTexts = {}
local groupFrames = {}

-- Initialize frames and bars
local function initializeFramesAndBars()

      -- Check if the necessary data is ready
      if not RAID_CLASS_COLORS then
        return  -- Data is not ready, exit the function
    end

    -- Clear old frames and bars
    for i = 1, #memberFrames do
        memberFrames[i]:Hide()
    end
    memberFrames = {}
    healthBars = {}
    manaBars = {}
    nameTexts = {}

    -- Loop over the raid members
    local numRaidMembers = GetNumRaidMembers()
    for i = 1, numRaidMembers do
        -- Calculate the group (1-8) and position within the group (1-5) of this member
        local group = math.ceil(i / 5)
        local position = i - ((group - 1) * 5)

         -- If this is the first member of the group, create a group frame with a title
    if position == 1 then
        local groupFrame = CreateFrame("Frame", nil, TeamFrame)
        groupFrame:SetSize(80, 20)  -- Adjust as needed

        -- Calculate the column (0-1) and row (0-7) of the group
        local column = (group - 1) % 2
        local row = math.floor((group - 1) / 2)
        groupFrame:SetPoint("TOPLEFT", TeamFrame, "TOP", 175 * (column - 1), 10 - row * 230)

        -- Set border to the frame
        groupFrame:SetBackdrop({
            edgeFile = "Interface/Tooltips/UI-Tooltip-Border",  
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })

TeamFrame:SetBackdropBorderColor(1, 0, 0, 0.5)  

        -- Add group title
        local groupTitle = groupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        groupTitle:SetPoint("TOP", 0, -3)
        groupTitle:SetText("Group: "..group)
        groupTitle:SetTextColor(1, 1, 1)  -- White color

        -- Store the group frame
        groupFrames[group] = groupFrame
    end

        -- Calculate the column (0-1) and row (0-7) of the group
        local column = (group - 1) % 2
        local row = math.floor((group - 1) / 2)

        -- Create a subframe for each raid member
        local memberFrame = CreateFrame("Button", nil, TeamFrame, "SecureUnitButtonTemplate")
        memberFrame:SetSize(150, 42)  -- Adjust size to better fit the new layout
        memberFrame:SetPoint("TOPLEFT", TeamFrame, "TOPLEFT", 10 + 175 * column, -10 - ((row * 230) + (position - 1) * 42))  -- Adjusted offset to better fit the new layout
        memberFrame:SetAttribute("unit", "raid"..i)
        memberFrame:RegisterForClicks("AnyUp")
        SecureUnitButton_OnLoad(memberFrame, "raid"..i)
        
        -- Set border to the frame
        memberFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",  
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        local playerClass, charClass, classIndex = UnitClass("raid"..i)
        local classColor = RAID_CLASS_COLORS[charClass] or { r = 1, g = 1, b = 1 }  -- Use a default color if characterClass is not found in RAID_CLASS_COLOR - Workaround for the delay of bots spawning
        memberFrame:SetBackdropBorderColor(classColor.r, classColor.g, classColor.b, 0.8)  -- Set the border color to class color
        memberFrame:SetBackdropColor(classColor.r, classColor.g, classColor.b, 0.2)
        

        -- Add the player's name
        local playerName, playerRealm = UnitName("raid"..i)
        local playerClass, charClass, classIndex = UnitClass("raid"..i)
        local classColor = RAID_CLASS_COLORS[charClass] or { r = 1, g = 1, b = 1 }
        local nameText = memberFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        nameText:SetPoint("TOP", 5, -5)
        nameText:SetText(playerName)
        nameText:SetTextColor(classColor.r, classColor.g, classColor.b)

        -- Add the health bar
        local healthBar = CreateFrame("StatusBar", nil, memberFrame)
        healthBar:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
        healthBar:SetPoint("TOP", nameText, "BOTTOM", 0, -2)
        healthBar:SetSize(100, 8)
        healthBar:SetMinMaxValues(0, UnitHealthMax("raid"..i))
        healthBar:SetValue(UnitHealth("raid"..i))

        -- Add the mana bar
        local manaBar = CreateFrame("StatusBar", nil, memberFrame)
        manaBar:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
        manaBar:SetStatusBarColor(0, 0, 1)
        manaBar:SetPoint("TOP", healthBar, "BOTTOM", 0, 0)
        manaBar:SetSize(100, 8)
        manaBar:SetMinMaxValues(0, UnitPowerMax("raid"..i))
        manaBar:SetValue(UnitPower("raid"..i))

        -- Add frames, bars, and texts to the tables
        memberFrames[i] = memberFrame
        healthBars[i] = healthBar
        manaBars[i] = manaBar
        nameTexts[i] = nameText
    end
end

-- Event handler for unit health and mana changes
local function updateHealthAndMana(self, event, unit)
    for i = 1, #healthBars do
        if unit == "raid"..i then
            healthBars[i]:SetMinMaxValues(0, UnitHealthMax(unit))
            healthBars[i]:SetValue(UnitHealth(unit))
            manaBars[i]:SetMinMaxValues(0, UnitPowerMax(unit))
            manaBars[i]:SetValue(UnitPower(unit))
        end
    end
end

-- Event handler for raid composition changes
local function updateRaidComposition(self, event, ...)
    initializeFramesAndBars()
end

-- Event handler for BotSpawn delay
local function OnEvent(self, event, ...)
  if event == "PLAYER_ENTERING_WORLD" or event == "RAID_ROSTER_UPDATE" or event == "ADDON_LOADED" then
      initializeFramesAndBars()
  else
      updateHealthAndMana(self, event, ...)
  end
end

-- Register events
TeamFrame:RegisterEvent("UNIT_HEALTH")
TeamFrame:RegisterEvent("UNIT_POWER_UPDATE")
TeamFrame:RegisterEvent("RAID_ROSTER_UPDATE")
TeamFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
TeamFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" or event == "RAID_ROSTER_UPDATE" then
        initializeFramesAndBars()
    else
        updateHealthAndMana(self, event, ...)
    end
end)
TeamFrame:SetScript("OnEvent", OnEvent)

raidButton:SetScript("OnClick", function()
  if TeamFrame:IsShown() then
    TeamFrame:Hide()
  else
    initializeFramesAndBars()
    TeamFrame:Show()
  end
end)
