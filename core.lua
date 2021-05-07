sNamePlates = LibStub("AceAddon-3.0"):NewAddon("sNamePlates", "AceConsole-3.0", "AceEvent-3.0")
local LSM = LibStub("LibSharedMedia-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local lastUpdate = 0
local backdrop = {
	edgeFile = [[Interface\AddOns\sNamePlates\Media\Textures\Glow\glowTex]], edgeSize = 5,
	insets = {left = 20, right = 3, top = 3, bottom = 3}
}
local _format = string.format
local math_max = math.max
local math_floor = math.floor
local unpack = unpack
local createdFrames = {}
local targetExist

local mode = CreateFrame("Frame")
local function setTimer(duration, func)
	local endTime = GetTime() + duration;
		mode:SetScript("OnUpdate", function()
		if(endTime < GetTime()) then
			--time is up
			func();
			mode:SetScript("OnUpdate", nil);
		end
	end);
end


function sNamePlates:OnInitialize()

	LSM:Register("statusbar", "Aluminium", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Aluminium]])
	LSM:Register("statusbar", "Armory", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Armory]])
	LSM:Register("statusbar", "BantoBar", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\BantoBar]])
	LSM:Register("statusbar", "Bars", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Bars]])
	LSM:Register("statusbar", "Bumps", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Bumps]])
	LSM:Register("statusbar", "Button", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Button]])
	LSM:Register("statusbar", "Charcoal", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Charcoal]])
	LSM:Register("statusbar", "Cilo", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Cilo]])
	LSM:Register("statusbar", "Cloud", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Cloud]])
	LSM:Register("statusbar", "Combo", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Combo]])
	LSM:Register("statusbar", "Comet", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Comet]])
	LSM:Register("statusbar", "Dabs", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Dabs]])
	LSM:Register("statusbar", "Details", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Details]])
	LSM:Register("statusbar", "Diagonal", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Diagonal]])
	LSM:Register("statusbar", "Falumn", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Falumn]])
	LSM:Register("statusbar", "Fifths", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Fifths]])
	LSM:Register("statusbar", "Flat", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Flat]])
	LSM:Register("statusbar", "Fourths", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Fourths]])
	LSM:Register("statusbar", "Frost", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Frost]])
	LSM:Register("statusbar", "Glamour", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour]])
	LSM:Register("statusbar", "Glamour2", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour2]])
	LSM:Register("statusbar", "Glamour3", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour3]])
	LSM:Register("statusbar", "Glamour4", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour4]])
	LSM:Register("statusbar", "Glamour5", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour5]])
	LSM:Register("statusbar", "Glamour6", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour6]])
	LSM:Register("statusbar", "Glamour7", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glamour7]])
	LSM:Register("statusbar", "Glass", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glass]])
	LSM:Register("statusbar", "Glaze", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glaze]])
	LSM:Register("statusbar", "Glaze2", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Glaze2]])
	LSM:Register("statusbar", "Gloss", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Gloss]])
	LSM:Register("statusbar", "Graphite", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Graphite]])
	LSM:Register("statusbar", "Grid", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Grid]])
	LSM:Register("statusbar", "Hatched", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Hatched]])
	LSM:Register("statusbar", "Healbot", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Healbot]])
	LSM:Register("statusbar", "LiteStep", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\LiteStep]])
	LSM:Register("statusbar", "LiteStepLite", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\LiteStepLite]])
	LSM:Register("statusbar", "Lyfe", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Lyfe]])
	LSM:Register("statusbar", "Melli", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Melli]])
	LSM:Register("statusbar", "MelliDark", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\MelliDark]])
	LSM:Register("statusbar", "Minimalist", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Minimalist]])
	LSM:Register("statusbar", "Otravi", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Otravi]])
	LSM:Register("statusbar", "Outline", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Outline]])
	LSM:Register("statusbar", "Perl2", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Perl2]])
	LSM:Register("statusbar", "Pill", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Pill]])
	LSM:Register("statusbar", "Rain", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Rain]])
	LSM:Register("statusbar", "Rocks", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Rocks]])
	LSM:Register("statusbar", "Round", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Round]])
	LSM:Register("statusbar", "Ruben", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Ruben]])
	LSM:Register("statusbar", "Runes", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Runes]])
	LSM:Register("statusbar", "Serenity", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Serenity]])
	LSM:Register("statusbar", "Skewed", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Skewed]])
	LSM:Register("statusbar", "Smooth v2", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Smoothv2]])
	LSM:Register("statusbar", "Smooth", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Smooth]])
	LSM:Register("statusbar", "Smudge", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Smudge]])
	LSM:Register("statusbar", "Striped", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Striped]])
	LSM:Register("statusbar", "Tube", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Tube]])
	LSM:Register("statusbar", "TukTex", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\TukTex]])
	LSM:Register("statusbar", "Water", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Water]])
	LSM:Register("statusbar", "Wglass", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Wglass]])
	LSM:Register("statusbar", "Wisps", [[Interface\AddOns\sNamePlates\Media\Textures\Statusbar\Wisps]])

	LSM:Register("font", "ABF", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\\ABF.ttf]])
	LSM:Register("font", "Accidental Presidency", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Accidental Presidency.ttf]])
	LSM:Register("font", "Action Man", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\ActionMan.ttf]])
	LSM:Register("font", "Adventure", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Adventure.ttf]])
	LSM:Register("font", "ContinuumMedium", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\ContinuumMedium.ttf]])
	LSM:Register("font", "Diablo", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Diablo.ttf]])
	LSM:Register("font", "DomyoujiRegular", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\DomyoujiRegular.ttf]])
	LSM:Register("font", "Die Die Die!", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\DieDieDie.ttf]])
	LSM:Register("font", "Dsdig", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Dsdig.ttf]])
	LSM:Register("font", "Expressway", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Expressway.ttf]])
	LSM:Register("font", "Forced Square", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\FORCED SQUARE.ttf]])
	LSM:Register("font", "Hooge", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Hooge.ttf]])
	LSM:Register("font", "Homespun", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Homespun.ttf]])
	LSM:Register("font", "PT Sans Narrow", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\PTSansNarrow.ttf]])
	LSM:Register("font", "Seagram", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Seagram.ttf]])
	LSM:Register("font", "Vipnagorgia", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\Vipnagorgiallarg.ttf]])
	LSM:Register("font", "yanone", [[Interface\AddOns\sNamePlates\Media\Fonts\Statusbar\yanone.ttf]])


    LibStub("AceConfig-3.0"):RegisterOptionsTable("sNamePlates", self.options)

    self.db = LibStub("AceDB-3.0"):New("sNamePlatesDB", self.defaults, true)
    --self.optionsFrame = ACD:AddToBlizOptions("sNamePlates", "sNamePlates")
	self.Frame = CreateFrame("Frame"):SetScript("OnUpdate", sNamePlates_OnUpdate)
end

function sNamePlates:OnEnable()
	self:RegisterChatCommand("snameplates", "ChatCommand")
    self:RegisterChatCommand("sNamePlates", "ChatCommand")
    self:RegisterChatCommand("snp", "ChatCommand")
	
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
end

function sNamePlates:OnDisable()
end

function sNamePlates:ChatCommand(input)
    self:OpenOptions()
end

local function sNamePlates_CBOnValueChanged(self, curval)
    local minval, maxval = self:GetMinMaxValues()

	if UnitChannelInfo("target") then
        self.cbTime:SetFormattedText("%.1f", curval)
		self.cbName:SetText(UnitChannelInfo("target"))
    else
        --self.time:SetFormattedText("%.1f", maxval - curval) this will make cast go from max duration to zero
        self.cbTime:SetFormattedText("%.1f", maxval - (maxval - curval))
		self.cbName:SetText(UnitCastingInfo("target"))
    end 
end

local function sNamePlates_IsValidFrame(frame)
	if frame:GetName() then
		return
	end

	overlayRegion = select(2, frame:GetRegions())

	return overlayRegion and overlayRegion:GetObjectType() == "Texture" and overlayRegion:GetTexture() == [[Interface\Tooltips\Nameplate-Border]]
end

local function sNamePlates_NameplateColoring(r, g, b, a)
	if g + b == 0 then 
		newr = sNamePlates.db.profile.hostileColor.r
		newg = sNamePlates.db.profile.hostileColor.g
		newb = sNamePlates.db.profile.hostileColor.b 
		newa = sNamePlates.db.profile.hostileColor.a	
	elseif r + b == 0 then
		newr = sNamePlates.db.profile.pvpFlaggedColor.r
		newg = sNamePlates.db.profile.pvpFlaggedColor.g
		newb = sNamePlates.db.profile.pvpFlaggedColor.b 
		newa = sNamePlates.db.profile.pvpFlaggedColor.a	
	elseif r + g == 0 then
		newr = sNamePlates.db.profile.nonpvpFlaggedColor.r
		newg = sNamePlates.db.profile.nonpvpFlaggedColor.g
		newb = sNamePlates.db.profile.nonpvpFlaggedColor.b 
		newa = sNamePlates.db.profile.nonpvpFlaggedColor.a
	elseif 2 - (r + g) < 0.05 then
		newr = sNamePlates.db.profile.neutralColor.r
		newg = sNamePlates.db.profile.neutralColor.g
		newb = sNamePlates.db.profile.neutralColor.b 
		newa = sNamePlates.db.profile.neutralColor.a
	else
		newr, newg, newb, newa = r, g, b, a
	end
	return newr, newg, newb, newa
end	

local sNamePlates_FormatHealthText
do
    local function sNamePlates_Shorten(num)
        local res

        if num > 1000000000 then
            res = format("%02.3fB", num / 1000000000)
        elseif num > 1000000 then
            res = format("%02.2fM", num / 1000000)
        elseif num > 1000 then
            res = format("%02.1fK", num / 1000)
        else
            res = math_floor(num)
        end

        return res
    end

    function sNamePlates_FormatHealthText(self)
        if not self or not self.healthbar then
            return
        end

        if sNamePlates.db.profile.healthPercentToggle or sNamePlates.db.profile.healthAmmountToggle then
            local minval, maxval = self.healthbar:GetMinMaxValues()
            local curval = self.healthbar:GetValue()

          	if sNamePlates.db.profile.healthAmmountToggle then
				if sNamePlates.db.profile.infoIfFullSelect then
                	self.hpText:SetText(true and sNamePlates_Shorten(curval) or curval)
				else
					if 100 * curval / math_max(1, maxval) == 100.0 then 
						self.hpText:SetText("")
					else
						self.hpText:SetText(true and sNamePlates_Shorten(curval) or curval)
					end
				end
            end

            if sNamePlates.db.profile.healthPercentToggle then
                if sNamePlates.db.profile.infoIfFullSelect then
                    self.hpPercent:SetText(_format("%02.1f%%", 100 * curval / math_max(1, maxval)))
                else 
                    if 100 * curval / math_max(1, maxval) == 100.0 then
                        self.hpPercent:SetText("")
                    else
                        self.hpPercent:SetText(_format("%02.1f%%", 100 * curval / math_max(1, maxval)))
                    end 
                end 
            end
        end
    end
end

local function CastbarIconScaling(X, Y)
	local icon_crop = 0.15-- The abound of Icon zoom (crop of its borders) Can me any value from 0 to 1 but more than 0.3 hardly makes much sence.
	local icon_offset_X = 0.5  -- Horizontal position of the shown texture (0 - shows the leftmost part, 1 shows the rightmost part)
	local icon_offset_Y = 0.5  -- Vertical position of the shown texture (0 - shows the topmost part, 1 shows the bottommost part)

	local length_X = (1 - icon_crop) * (X / math_max(X,Y)) 
	local length_Y = (1 - icon_crop) * (Y / math_max(X,Y)) 
	local axis_X = (icon_crop + length_X) * 0.5 + icon_offset_X * (1 - icon_crop - length_X)   
	local axis_Y = (icon_crop + length_Y) * 0.5 + icon_offset_Y * (1 - icon_crop - length_Y) 
	local X1 = axis_X - length_X * 0.5 
	local X2 = axis_X + length_X * 0.5 
	local Y1 = axis_Y - length_Y * 0.5 
	local Y2 = axis_Y + length_Y * 0.5 

	return X1, X2, Y1, Y2
end

local function sNamePlates_FrameOnUpdate(self, elapsed)
	self.elapsed = self.elapsed + elapsed
	if self.elapsed >= 0.025 then

		--Health Format
		self:FormatHealthText()	
		
		self.castbar:Hide()
		self.castbarIcon:Hide()

		if ACD.OpenFrames["sNamePlates"] then

			--Healthbar
			self.healthbar:SetStatusBarTexture(FetchStatusbar(sNamePlates.db.profile.nameplateTexture))
			self.healthbar:SetHeight(sNamePlates.db.profile.nameplateHeight)
			self.healthbar:SetWidth(sNamePlates.db.profile.nameplateWidth)

			--Nameplate Coloring
			self.healthbar:SetStatusBarColor(sNamePlates_NameplateColoring(self.r, self.g, self.b, self.a))
			
			self.hpBackground:SetTexture(FetchStatusbar(sNamePlates.db.profile.backgroundTexture))
			self.hpBackground:SetVertexColor(sNamePlates.db.profile.backgroundNameplateColor.r, sNamePlates.db.profile.backgroundNameplateColor.g, sNamePlates.db.profile.backgroundNameplateColor.b, sNamePlates.db.profile.backgroundNameplateColor.a)

			--Highlight
			self.highlight:SetTexture(FetchStatusbar(sNamePlates.db.profile.highlightTexture))
			self.highlight:SetVertexColor(sNamePlates.db.profile.highlightColor.r, sNamePlates.db.profile.highlightColor.g, sNamePlates.db.profile.highlightColor.b, sNamePlates.db.profile.highlightColor.a)
			self.highlight:ClearAllPoints()
			self.highlight:SetAllPoints(self.healthbar) 

			--Healthbar Name
			self.name:SetFont(FetchFont(sNamePlates.db.profile.nameFont), sNamePlates.db.profile.nameFontSize, sNamePlates.db.profile.nameOutline)
			self.name:SetTextColor(sNamePlates.db.profile.nameColor.r, sNamePlates.db.profile.nameColor.g, sNamePlates.db.profile.nameColor.b)
			if sNamePlates.db.profile.nameToggle then 
				self.name:Show()
			else
				self.name:Hide()
			end	 

			--Health Percent and Health Ammount
			self.hpPercent:SetFont(FetchFont(sNamePlates.db.profile.healthPercentFont), sNamePlates.db.profile.healthPercentFontSize, sNamePlates.db.profile.healthPercentOutline)
			self.hpText:SetFont(FetchFont(sNamePlates.db.profile.healthAmmountFont), sNamePlates.db.profile.healthAmmountFontSize, sNamePlates.db.profile.healthAmmountOutline)
			self.hpPercent:SetTextColor(sNamePlates.db.profile.healthPercentColor.r, sNamePlates.db.profile.healthPercentColor.g, sNamePlates.db.profile.healthPercentColor.b, sNamePlates.db.profile.healthPercentColor.a)
			self.hpText:SetTextColor(sNamePlates.db.profile.healthAmmountColor.r, sNamePlates.db.profile.healthAmmountColor.g, sNamePlates.db.profile.healthAmmountColor.b, sNamePlates.db.profile.healthAmmountColor.a)
			
			--Raid Icon
			self.raidIcon:SetHeight(sNamePlates.db.profile.RIheight)
			self.raidIcon:SetWidth(sNamePlates.db.profile.RIwidth)
			self.raidIcon:ClearAllPoints()
			self.raidIcon:SetPoint("CENTER", self.healthbar, "CENTER", sNamePlates.db.profile.RIXOffset, sNamePlates.db.profile.RIYOffset)

			--Cast Bar
			self.castbar:SetHeight(sNamePlates.db.profile.castbarHeight)
			self.castbar:SetWidth(sNamePlates.db.profile.nameplateWidth)
			self.castbar:SetStatusBarTexture(FetchStatusbar(sNamePlates.db.profile.castbarTexture))
			self.castbar:ClearAllPoints()
			self.castbar:SetPoint("TOP", self.healthbar, "BOTTOM", 0, -sNamePlates.db.profile.separationValue)

			self.cbBackground:SetTexture(FetchStatusbar(sNamePlates.db.profile.castbarBackgroundTexture))
			self.cbBackground:SetVertexColor(sNamePlates.db.profile.backgroundCastbarColor.r, sNamePlates.db.profile.backgroundCastbarColor.g, sNamePlates.db.profile.backgroundCastbarColor.b, sNamePlates.db.profile.backgroundCastbarColor.a)

			self.castbar.cbTime:SetFont(FetchFont(sNamePlates.db.profile.castbarFont), sNamePlates.db.profile.castbarFontSize, sNamePlates.db.profile.castbarFontOutline)
    		self.castbar.cbTime:SetTextColor(sNamePlates.db.profile.castbarTimeColor.r, sNamePlates.db.profile.castbarTimeColor.g, sNamePlates.db.profile.castbarTimeColor.b, sNamePlates.db.profile.castbarTimeColor.a)
			self.castbar.cbName:SetFont(FetchFont(sNamePlates.db.profile.castbarFont), sNamePlates.db.profile.castbarFontSize, sNamePlates.db.profile.castbarFontOutline)
    		self.castbar.cbName:SetTextColor(sNamePlates.db.profile.castbarNameColor.r, sNamePlates.db.profile.castbarNameColor.g, sNamePlates.db.profile.castbarNameColor.b, sNamePlates.db.profile.castbarNameColor.a)
			if sNamePlates.db.profile.castbarFontToggle then
				self.castbar.cbTime:Show()
				self.castbar.cbName:Show()
			else
				self.castbar.cbTime:Hide()
				self.castbar.cbName:Hide()
			end	

			--Cast Bar Icon
			self.castbarIcon:SetHeight(sNamePlates.db.profile.nameplateHeight + sNamePlates.db.profile.castbarHeight + sNamePlates.db.profile.separationValue)
			self.castbarIcon:SetWidth(sNamePlates.db.profile.nameplateHeight + sNamePlates.db.profile.castbarHeight + sNamePlates.db.profile.separationValue)
			self.castbarIcon:SetPoint("BOTTOMLEFT", self.castbar, "RIGHT", sNamePlates.db.profile.separationValue, -(sNamePlates.db.profile.castbarHeight/2))

			--Glow
			self.hpGlow:SetBackdropBorderColor(sNamePlates.db.profile.healthbarBorderColor.r, sNamePlates.db.profile.healthbarBorderColor.g, sNamePlates.db.profile.healthbarBorderColor.b, sNamePlates.db.profile.healthbarBorderColor.a)
			self.cbGlow:SetBackdropBorderColor(sNamePlates.db.profile.castbarBorderColor.r, sNamePlates.db.profile.castbarBorderColor.g, sNamePlates.db.profile.castbarBorderColor.b, sNamePlates.db.profile.castbarBorderColor.a)
			self.cbIconGlow:SetBackdropBorderColor(sNamePlates.db.profile.castbarIconBorderColor.r, sNamePlates.db.profile.castbarIconBorderColor.g, sNamePlates.db.profile.castbarIconBorderColor.b, sNamePlates.db.profile.castbarIconBorderColor.a)
	
			--Target Indicator
			self.rightIndicator:SetTexture(sNamePlates:TargetIndicatorGrabRight())
			self.leftIndicator:SetTexture(sNamePlates:TargetIndicatorGrabLeft())
			if sNamePlates.db.profile.inverseSelect then 
				self.leftIndicator:SetRotation(-3.1416)
				self.rightIndicator:SetRotation(3.1416)
			else
				self.leftIndicator:SetRotation(0)
				self.rightIndicator:SetRotation(0)
			end
			self.rightIndicator:SetWidth(sNamePlates.db.profile.TIWidth)
			self.rightIndicator:SetHeight(sNamePlates.db.profile.TIHeight)
			self.leftIndicator:SetWidth(sNamePlates.db.profile.TIWidth)
			self.leftIndicator:SetHeight(sNamePlates.db.profile.TIHeight)

			self.rightIndicator:SetPoint("LEFT", self.healthbar, "RIGHT", -sNamePlates.db.profile.TIXOffset, sNamePlates.db.profile.TIYOffset)
			self.leftIndicator:SetPoint("RIGHT", self.healthbar, "LEFT", sNamePlates.db.profile.TIXOffset, sNamePlates.db.profile.TIYOffset)

			self.rightIndicator:SetVertexColor(sNamePlates.db.profile.TIColor.r, sNamePlates.db.profile.TIColor.g, sNamePlates.db.profile.TIColor.b, sNamePlates.db.profile.TIColor.a)
			self.leftIndicator:SetVertexColor(sNamePlates.db.profile.TIColor.r, sNamePlates.db.profile.TIColor.g, sNamePlates.db.profile.TIColor.b, sNamePlates.db.profile.TIColor.a)
		end

	    --Healthbar
		self.healthbar:ClearAllPoints()
		self.healthbar:SetPoint("CENTER", self.healthbar:GetParent(), sNamePlates.db.profile.nameplateXOffset, sNamePlates.db.profile.nameplateYOffset)
	
		if sNamePlates.db.profile.healthPercentToggle and sNamePlates.db.profile.healthAmmountToggle then
			self.hpText:SetPoint("CENTER", (sNamePlates.db.profile.nameplateWidth - self.hpText:GetWidth())/2 , 0)
			self.hpPercent:SetPoint("CENTER", (-sNamePlates.db.profile.nameplateWidth + self.hpPercent:GetWidth())/2 , 0)
			self.hpPercent:Show()
			self.hpText:Show()
		elseif sNamePlates.db.profile.healthPercentToggle and not sNamePlates.db.profile.healthAmmountToggle then 
			self.hpPercent:SetPoint("CENTER", 0, 0)
			self.hpPercent:Show()
			self.hpText:Hide()
		elseif not sNamePlates.db.profile.healthPercentToggle and sNamePlates.db.profile.healthAmmountToggle then
			self.hpText:SetPoint("CENTER", 0, 0)
			self.hpPercent:Hide()
			self.hpText:Show()
		else
			self.hpPercent:Hide()
			self.hpText:Hide()
		end  

		self.castbar.cbName:SetPoint("LEFT", self.castbar, "LEFT", -2, -2-(sNamePlates.db.profile.castbarHeight + self.castbar.cbTime:GetHeight())/2) 
		self.castbar.cbTime:SetPoint("RIGHT", self.castbar, "RIGHT", 2, -2-(sNamePlates.db.profile.castbarHeight + self.castbar.cbTime:GetHeight())/2)

	--[[ 		
		--Raid Icon Color                                               **pending
		if self.castbar then		
			newr, newg, newb = 0.7, 0.06, 0.84
			self.healthbar:SetStatusBarColor(newr, newg, newb)
			self.r, self.g, self.b = newr, newg, newb
			print("diamond")
		else
			print("not diamond")
		end 
	]]

	--[[ 	if config.tankMode then
			sNamePlates_TankMode(self)
		else
			--Threat
			if not self.oldglow:IsShown() then
				self.hpGlow:SetBackdropBorderColor(0,0,0)
				self.cbGlow:SetBackdropBorderColor(0,0,0)
				self.cbIconGlow:SetBackdropBorderColor(0,0,0)
			else
				self.hpGlow:SetBackdropBorderColor(self.oldglow:GetVertexColor())
				self.cbGlow:SetBackdropBorderColor(self.oldglow:GetVertexColor())
				self.cbIconGlow:SetBackdropBorderColor(self.oldglow:GetVertexColor())
			end
		end
	]]

		--On target
		if targetExist and self:GetAlpha() == 1 then	
			self.highlight:Hide()
			if sNamePlates.db.profile.tarIndicatorToggle then
				self.leftIndicator:Show()
				self.rightIndicator:Show()
			else
				self.leftIndicator:Hide()
				self.rightIndicator:Hide()
			end
			
			if UnitChannelInfo("target") or UnitCastingInfo("target") then
				self.castbar:Show()
				self.castbarIcon:Show()
			end 
		else
		 	self.leftIndicator:Hide()
			self.rightIndicator:Hide() 

			if targetExist then
				if sNamePlates.db.profile.alphaToggle then
				self:SetAlpha(sNamePlates.db.profile.alphaValue)
				end	
			end
		end 
		self.elapsed = 0
	end
end

local function sNamePlates_UpdateFrame(self)
	--Nameplate Coloring
	self.r, self.g, self.b, self.a = self.healthbar:GetStatusBarColor()
	--print(self.r.." - "..self.g.." - "..self.b.." - "..self.a)
	self.healthbar:SetStatusBarColor(sNamePlates_NameplateColoring(self.r, self.g, self.b, self.a))

 	self.castbar:Hide()
	self.castbarIcon:Hide()

 	self.leftIndicator:Hide()
	self.rightIndicator:Hide()  

 	--Healthbar
	self.healthbar:SetStatusBarTexture(FetchStatusbar(sNamePlates.db.profile.nameplateTexture))
	self.healthbar:SetHeight(sNamePlates.db.profile.nameplateHeight)
	self.healthbar:SetWidth(sNamePlates.db.profile.nameplateWidth)
	self.healthbar:ClearAllPoints()
	self.healthbar:SetPoint("CENTER", self.healthbar:GetParent(), sNamePlates.db.profile.nameplateXOffset, sNamePlates.db.profile.nameplateYOffset)

	--Highlight
	self.highlight:SetTexture(FetchStatusbar(sNamePlates.db.profile.highlightTexture))
	self.highlight:SetVertexColor(sNamePlates.db.profile.highlightColor.r, sNamePlates.db.profile.highlightColor.g, sNamePlates.db.profile.highlightColor.b, sNamePlates.db.profile.highlightColor.a)
	self.highlight:ClearAllPoints()
	self.highlight:SetAllPoints(self.healthbar) 

	--Healthbar Name
	self.name:SetFont(FetchFont(sNamePlates.db.profile.nameFont), sNamePlates.db.profile.nameFontSize, sNamePlates.db.profile.nameOutline)
	self.name:SetTextColor(sNamePlates.db.profile.nameColor.r, sNamePlates.db.profile.nameColor.g, sNamePlates.db.profile.nameColor.b)
	self.name:SetText(self.oldname:GetText())
	self.name:SetPoint("BOTTOMLEFT", self.healthbar, "TOPLEFT", -2, 3)
	self.name:SetPoint("RIGHT", self.healthbar, -18, 3)
	if sNamePlates.db.profile.nameToggle then 
		self.name:Show()
	else
		self.name:Hide()
	end	 

	--Health Percent and Health Ammount
	self.hpPercent:SetFont(FetchFont(sNamePlates.db.profile.healthPercentFont), sNamePlates.db.profile.healthPercentFontSize, sNamePlates.db.profile.healthPercentOutline)
	self.hpText:SetFont(FetchFont(sNamePlates.db.profile.healthAmmountFont), sNamePlates.db.profile.healthAmmountFontSize, sNamePlates.db.profile.healthAmmountOutline)
	self.hpPercent:SetTextColor(sNamePlates.db.profile.healthPercentColor.r, sNamePlates.db.profile.healthPercentColor.g, sNamePlates.db.profile.healthPercentColor.b, sNamePlates.db.profile.healthPercentColor.a)
	self.hpText:SetTextColor(sNamePlates.db.profile.healthAmmountColor.r, sNamePlates.db.profile.healthAmmountColor.g, sNamePlates.db.profile.healthAmmountColor.b, sNamePlates.db.profile.healthAmmountColor.a)
	if sNamePlates.db.profile.healthPercentToggle and sNamePlates.db.profile.healthAmmountToggle then
		self.hpText:SetPoint("CENTER", (sNamePlates.db.profile.nameplateWidth - self.hpText:GetWidth())/2 , 0)
		self.hpPercent:SetPoint("CENTER", (-sNamePlates.db.profile.nameplateWidth + self.hpPercent:GetWidth())/2 , 0)
		self.hpPercent:Show()
		self.hpText:Show()
	elseif sNamePlates.db.profile.healthPercentToggle and not sNamePlates.db.profile.healthAmmountToggle then 
		self.hpPercent:SetPoint("CENTER", 0, 0)
		self.hpPercent:Show()
		self.hpText:Hide()
	elseif not sNamePlates.db.profile.healthPercentToggle and sNamePlates.db.profile.healthAmmountToggle then
		self.hpText:SetPoint("CENTER", 0, 0)
		self.hpPercent:Hide()
		self.hpText:Show()
	else
		self.hpPercent:Hide()
		self.hpText:Hide()
	end 

	--Raid Icon
	self.raidIcon:SetHeight(sNamePlates.db.profile.RIheight)
	self.raidIcon:SetWidth(sNamePlates.db.profile.RIwidth)
	self.raidIcon:ClearAllPoints()
	self.raidIcon:SetPoint("CENTER", self.healthbar, "CENTER", sNamePlates.db.profile.RIXOffset, sNamePlates.db.profile.RIYOffset)
	

--[[ 	--Threat
	if not self.oldglow:IsShown() then
		self.hpGlow:SetBackdropBorderColor(0,0,0)
		self.cbGlow:SetBackdropBorderColor(0,0,0)
		self.cbIconGlow:SetBackdropBorderColor(0,0,0)
	else
		self.hpGlow:SetBackdropBorderColor(self.oldglow:GetVertexColor())
		self.cbGlow:SetBackdropBorderColor(self.oldglow:GetVertexColor())
		self.cbIconGlow:SetBackdropBorderColor(self.oldglow:GetVertexColor())
	end ]]

	--Glow
	self.hpGlow:SetBackdropBorderColor(sNamePlates.db.profile.healthbarBorderColor.r, sNamePlates.db.profile.healthbarBorderColor.g, sNamePlates.db.profile.healthbarBorderColor.b, sNamePlates.db.profile.healthbarBorderColor.a)
	self.cbGlow:SetBackdropBorderColor(sNamePlates.db.profile.castbarBorderColor.r, sNamePlates.db.profile.castbarBorderColor.g, sNamePlates.db.profile.castbarBorderColor.b, sNamePlates.db.profile.castbarBorderColor.a)
	self.cbIconGlow:SetBackdropBorderColor(sNamePlates.db.profile.castbarIconBorderColor.r, sNamePlates.db.profile.castbarIconBorderColor.g, sNamePlates.db.profile.castbarIconBorderColor.b, sNamePlates.db.profile.castbarIconBorderColor.a)

	--Target Indicator
	if sNamePlates.db.profile.inverseSelect then 
		self.leftIndicator:SetRotation(-3.1416)
		self.rightIndicator:SetRotation(3.1416)
	else
		self.leftIndicator:SetRotation(0)
		self.rightIndicator:SetRotation(0)
	end

	self.rightIndicator:SetWidth(sNamePlates.db.profile.TIWidth)
	self.rightIndicator:SetHeight(sNamePlates.db.profile.TIHeight)
	self.leftIndicator:SetWidth(sNamePlates.db.profile.TIWidth)
	self.leftIndicator:SetHeight(sNamePlates.db.profile.TIHeight)

	self.rightIndicator:SetPoint("LEFT", self.healthbar, "RIGHT", -sNamePlates.db.profile.TIXOffset, sNamePlates.db.profile.TIYOffset)
	self.leftIndicator:SetPoint("RIGHT", self.healthbar, "LEFT", sNamePlates.db.profile.TIXOffset, sNamePlates.db.profile.TIYOffset)

	self.rightIndicator:SetVertexColor(sNamePlates.db.profile.TIColor.r, sNamePlates.db.profile.TIColor.g, sNamePlates.db.profile.TIColor.b, sNamePlates.db.profile.TIColor.a)
	self.leftIndicator:SetVertexColor(sNamePlates.db.profile.TIColor.r, sNamePlates.db.profile.TIColor.g, sNamePlates.db.profile.TIColor.b, sNamePlates.db.profile.TIColor.a)

	local level, elite, mylevel = tonumber(self.level:GetText()), self.elite:IsShown(), UnitLevel("player")
	self.level:ClearAllPoints()
	self.level:SetPoint("BOTTOMRIGHT", self.healthbar, "TOPRIGHT", 3, 3)

	if self.boss:IsShown() then
		self.level:SetText("B")
		self.level:SetTextColor(1, 0, 0)
		self.level:Show()
	elseif not elite and level == mylevel then
		self.level:Hide()
	else
		self.level:SetText(level..(elite and "+" or ""))
	end 
end

local function sNamePlates_OnHide(self)
	self.highlight:Hide()
	--self.hpGlow:SetBackdropBorderColor(0,0,0)
end

local function sNamePlates_CreateFrame(frame)
	if frame.done then
		return
	end

	frame.nameplate = false

	local healthBar, castBar = frame:GetChildren()
	local glowRegion, overlayRegion, shieldedRegion, castbarOverlay, spellIconRegion, highlightRegion, nameTextRegion, levelTextRegion, bossIconRegion, raidIconRegion, stateIconRegion = frame:GetRegions()

	frame.oldname = nameTextRegion
	frame.oldname:Hide()

	frame.glow = glowRegion
	
	local newNameRegion = frame:CreateFontString()
	newNameRegion:SetJustifyH("LEFT")
	newNameRegion:SetPoint("BOTTOM", healthBar, "TOP", 0, 2)
	newNameRegion:SetShadowOffset(1.25, -1.25)
	frame.name = newNameRegion

	frame.level = levelTextRegion
	frame.level:SetFont(FetchFont(sNamePlates.db.profile.levelFont), sNamePlates.db.profile.levelFontSize, sNamePlates.db.profile.levelOutline)
	frame.level:SetShadowOffset(1.25, -1.25)
	frame.level:SetJustifyH("RIGHT")
    frame.level:SetJustifyV("BOTTOM")

	glowRegion:SetTexture(nil)
	overlayRegion:SetTexture(nil)
	castbarOverlay:SetTexture(nil)
	stateIconRegion:SetTexture(nil)
	bossIconRegion:SetTexture(nil)
	shieldedRegion:SetTexture(nil)

	frame.highlight = highlightRegion
	frame.highlight:SetTexture(FetchStatusbar(sNamePlates.db.profile.highlightTexture))
	frame.highlight:SetVertexColor(sNamePlates.db.profile.highlightColor.r, sNamePlates.db.profile.highlightColor.g, sNamePlates.db.profile.highlightColor.b, sNamePlates.db.profile.highlightColor.a)

	frame.healthbar = healthBar
	frame.healthbar:SetStatusBarTexture(FetchStatusbar(sNamePlates.db.profile.nameplateTexture))
	frame.healthbar:ClearAllPoints()
	frame.healthbar:SetPoint("CENTER", healthBar:GetParent())

	raidIconRegion:ClearAllPoints()
	raidIconRegion:SetHeight(sNamePlates.db.profile.RIheight)
	raidIconRegion:SetWidth(sNamePlates.db.profile.RIwidth)
	raidIconRegion:SetPoint("CENTER", frame.healthbar, "CENTER", sNamePlates.db.profile.RIXOffset, sNamePlates.db.profile.RIYOffset)

	frame.castbar = castBar
	frame.castbar:SetStatusBarTexture(FetchStatusbar(sNamePlates.db.profile.nameplateTexture))
 	frame.castbar:HookScript("OnSizeChanged", function(self)
		self:SetHeight(sNamePlates.db.profile.castbarHeight)
		self:SetWidth(sNamePlates.db.profile.nameplateWidth)
		self:ClearAllPoints()
			self:SetPoint("TOP", frame.healthbar, "BOTTOM", 0, -sNamePlates.db.profile.separationValue)
	end) 
	frame.castbar:HookScript("OnValueChanged", sNamePlates_CBOnValueChanged)
	frame.castbar:SetHeight(sNamePlates.db.profile.castbarHeight)
	frame.castbar:SetWidth(sNamePlates.db.profile.nameplateWidth)
	frame.castbar:ClearAllPoints()
	frame.castbar:SetPoint("TOP", frame.healthbar, "BOTTOM", 0, -sNamePlates.db.profile.separationValue)

	frame.castbarIcon = spellIconRegion
	frame.castbarIcon:SetHeight(sNamePlates.db.profile.nameplateHeight + sNamePlates.db.profile.castbarHeight + sNamePlates.db.profile.separationValue)
	frame.castbarIcon:SetWidth(sNamePlates.db.profile.nameplateHeight + sNamePlates.db.profile.castbarHeight + sNamePlates.db.profile.separationValue)
	frame.castbarIcon:SetTexCoord(CastbarIconScaling(frame.castbarIcon:GetWidth(),frame.castbarIcon:GetHeight()))
	frame.castbarIcon:SetPoint("BOTTOMLEFT", frame.castbar, "RIGHT", sNamePlates.db.profile.separationValue, -(sNamePlates.db.profile.castbarHeight/2))

	frame.hpBackground = healthBar:CreateTexture(nil, "BORDER")
	frame.hpBackground:SetAllPoints(healthBar)
	frame.hpBackground:SetTexture(FetchStatusbar(sNamePlates.db.profile.backgroundTexture))
	frame.hpBackground:SetVertexColor(sNamePlates.db.profile.backgroundNameplateColor.r, sNamePlates.db.profile.backgroundNameplateColor.g, sNamePlates.db.profile.backgroundNameplateColor.b, sNamePlates.db.profile.backgroundNameplateColor.a)

	frame.cbBackground = castBar:CreateTexture(nil, "BORDER")
	frame.cbBackground:SetAllPoints(castBar)
	frame.cbBackground:SetTexture(FetchStatusbar(sNamePlates.db.profile.castbarBackgroundTexture))
	frame.cbBackground:SetVertexColor(sNamePlates.db.profile.backgroundCastbarColor.r, sNamePlates.db.profile.backgroundCastbarColor.g, sNamePlates.db.profile.backgroundCastbarColor.b, sNamePlates.db.profile.backgroundCastbarColor.a)

	frame.hpGlow = CreateFrame("Frame", nil, frame.healthbar)
	frame.hpGlow:SetPoint("TOPLEFT", frame.healthbar, "TOPLEFT", -5, 5)
	frame.hpGlow:SetPoint("BOTTOMRIGHT", frame.healthbar, "BOTTOMRIGHT", 5, -5)
	frame.hpGlow:SetBackdrop(backdrop)
	frame.hpGlow:SetBackdropColor(sNamePlates.db.profile.healthbarBorderColor.r, sNamePlates.db.profile.healthbarBorderColor.g, sNamePlates.db.profile.healthbarBorderColor.b, sNamePlates.db.profile.healthbarBorderColor.a)
	frame.hpGlow:SetBackdropBorderColor(sNamePlates.db.profile.healthbarBorderColor.r, sNamePlates.db.profile.healthbarBorderColor.g, sNamePlates.db.profile.healthbarBorderColor.b, sNamePlates.db.profile.healthbarBorderColor.a)

	frame.cbGlow = CreateFrame("Frame", nil, frame.castbar)
	frame.cbGlow:SetPoint("TOPLEFT", frame.castbar, "TOPLEFT", -5, 5)
	frame.cbGlow:SetPoint("BOTTOMRIGHT", frame.castbar, "BOTTOMRIGHT", 5, -5)
	frame.cbGlow:SetBackdrop(backdrop)
	frame.cbGlow:SetBackdropColor(sNamePlates.db.profile.castbarBorderColor.r, sNamePlates.db.profile.castbarBorderColor.g, sNamePlates.db.profile.castbarBorderColor.b, sNamePlates.db.profile.castbarBorderColor.a)
	frame.cbGlow:SetBackdropBorderColor(sNamePlates.db.profile.castbarBorderColor.r, sNamePlates.db.profile.castbarBorderColor.g, sNamePlates.db.profile.castbarBorderColor.b, sNamePlates.db.profile.castbarBorderColor.a)

	local castbarIconGlow = CreateFrame("Frame", nil, castBar)
	castbarIconGlow:SetPoint("TOPLEFT", frame.castbarIcon, "TOPLEFT", -5, 5)
	castbarIconGlow:SetPoint("BOTTOMRIGHT", frame.castbarIcon, "BOTTOMRIGHT", 5, -5)
    castbarIconGlow:SetBackdrop(backdrop)
    castbarIconGlow:SetBackdropColor(sNamePlates.db.profile.castbarIconBorderColor.r, sNamePlates.db.profile.castbarIconBorderColor.g, sNamePlates.db.profile.castbarIconBorderColor.b, sNamePlates.db.profile.castbarIconBorderColor.a)
    castbarIconGlow:SetBackdropBorderColor(sNamePlates.db.profile.castbarIconBorderColor.r, sNamePlates.db.profile.castbarIconBorderColor.g, sNamePlates.db.profile.castbarIconBorderColor.b, sNamePlates.db.profile.castbarIconBorderColor.a)
    frame.cbIconGlow = castbarIconGlow

	frame.castbar.cbTime = frame.castbar:CreateFontString(nil, "ARTWORK")
    frame.castbar.cbTime:SetPoint("RIGHT", frame.castbar, "RIGHT", 0, 0)
    frame.castbar.cbTime:SetFont(FetchFont(sNamePlates.db.profile.castbarFont), sNamePlates.db.profile.castbarFontSize, sNamePlates.db.profile.castbarFontOutline)
    frame.castbar.cbTime:SetTextColor(sNamePlates.db.profile.castbarTimeColor.r, sNamePlates.db.profile.castbarTimeColor.g, sNamePlates.db.profile.castbarTimeColor.b, sNamePlates.db.profile.castbarTimeColor.a)
    frame.castbar.cbTime:SetShadowOffset(1.25, -1.25)

	frame.castbar.cbName = frame.castbar:CreateFontString(nil, "ARTWORK")
    frame.castbar.cbName:SetPoint("LEFT", frame.castbar, "LEFT", 0, 0)
    frame.castbar.cbName:SetFont(FetchFont(sNamePlates.db.profile.castbarFont), sNamePlates.db.profile.castbarFontSize, sNamePlates.db.profile.castbarFontOutline)
    frame.castbar.cbName:SetTextColor(sNamePlates.db.profile.castbarNameColor.r, sNamePlates.db.profile.castbarNameColor.g, sNamePlates.db.profile.castbarNameColor.b, sNamePlates.db.profile.castbarNameColor.a)
	frame.castbar.cbName:SetShadowOffset(1.25, -1.25)

 	local hp = CreateFrame("Frame", nil, frame.healthbar)
    hp:SetHeight(1)
    hp:SetFrameLevel(frame.healthbar:GetFrameLevel() + 1)
	hp:SetPoint("CENTER", 0, 0)
    hp.text = hp:CreateFontString(nil, "OVERLAY")
	hp.text:SetPoint("CENTER")
    hp.text:SetFont(FetchFont(sNamePlates.db.profile.healthAmmountFont), sNamePlates.db.profile.healthAmmountFontSize, sNamePlates.db.profile.healthAmmountOutline)
    hp.text:SetTextColor(sNamePlates.db.profile.healthAmmountColor.r, sNamePlates.db.profile.healthAmmountColor.g, sNamePlates.db.profile.healthAmmountColor.b, sNamePlates.db.profile.healthAmmountColor.a)
    hp.text:SetShadowOffset(1.25, -1.25)
    hp.text:SetJustifyH("CENTER")
    hp.text:SetJustifyV("MIDDLE")
    hp.text:Hide()
    frame.hpText = hp.text 

	local percent = CreateFrame("Frame", nil, frame.healthbar)
    percent:SetHeight(1)
	percent:SetFrameLevel(frame.healthbar:GetFrameLevel() + 1)
	percent:SetPoint("CENTER", 0, 0)
    percent.text = percent:CreateFontString(nil, "OVERLAY")
    percent.text:SetPoint("CENTER")
    percent.text:SetFont(FetchFont(sNamePlates.db.profile.healthPercentFont), sNamePlates.db.profile.healthPercentFontSize, sNamePlates.db.profile.healthPercentOutline)
    percent.text:SetTextColor(sNamePlates.db.profile.healthPercentColor.r, sNamePlates.db.profile.healthPercentColor.g, sNamePlates.db.profile.healthPercentColor.b, sNamePlates.db.profile.healthPercentColor.a)
    percent.text:SetShadowOffset(1.25, -1.25)
    percent.text:SetJustifyH("CENTER")
    percent.text:SetJustifyV("MIDDLE")
    percent.text:Hide()
    frame.hpPercent = percent.text

	frame.FormatHealthText = sNamePlates_FormatHealthText

	hp:SetWidth(hp.text:GetWidth())
    percent:SetWidth(percent.text:GetWidth())

	local right = frame:CreateTexture(nil, "BACKGROUND")
	right:SetWidth(20)
	right:SetHeight(20)
	right:SetTexture(sNamePlates:TargetIndicatorGrabRight())
    right:SetPoint("LEFT", frame.healthbar, "RIGHT", -3, 0)
    right:Hide()

    local left = frame:CreateTexture(nil, "BACKGROUND")
	left:SetWidth(20)
	left:SetHeight(20)
	left:SetTexture(sNamePlates:TargetIndicatorGrabLeft())
    left:SetPoint("RIGHT", frame.healthbar, "LEFT", 3, 0)
    left:Hide()

	frame.rightIndicator = right
    frame.leftIndicator = left 
 
	frame.oldglow = glowRegion
	frame.elite = stateIconRegion
	frame.boss = bossIconRegion
	frame.raidIcon = raidIconRegion

	frame.done = true

	sNamePlates_UpdateFrame(frame)

	frame.elapsed = 0

	frame:SetScript("OnShow", sNamePlates_UpdateFrame)
	frame:SetScript("OnHide", sNamePlates_OnHide)
	frame:SetScript("OnUpdate", sNamePlates_FrameOnUpdate)
end

function sNamePlates_OnUpdate(self, elapsed)
    lastUpdate = lastUpdate + elapsed
	if lastUpdate > 0.025 then
        lastUpdate = 0
		for i = 1, select("#", WorldFrame:GetChildren()) do
			frame = select(i, WorldFrame:GetChildren())
			if sNamePlates_IsValidFrame(frame) then
				--table.insert(createdFrames, frame)
				sNamePlates_CreateFrame(frame)
			end
		end	
    end  
end

function FetchFont(fontkey)
	return LSM:Fetch("font", fontkey)
end 	

function FetchStatusbar(statuskey)
	return LSM:Fetch("statusbar", statuskey)
end 	

function sNamePlates:PLAYER_TARGET_CHANGED() 
	targetExist = UnitExists("target")
end

function sNamePlates:PLAYER_REGEN_DISABLED()
end

function sNamePlates:PLAYER_REGEN_ENABLED()
end

function sNamePlates:OpenOptions(win)
	ACD:SetDefaultSize("sNamePlates", 570, 500)

	if not ACD:Close("sNamePlates") then
		ACD:Open("sNamePlates")
	end
end

function sNamePlates:RNamePlateColors()
	sNamePlates.db.profile.pvpFlaggedColor = {["r"] = 0, ["g"] = 1, ["b"] = 0, ["a"] = 1}
	sNamePlates.db.profile.nonpvpFlaggedColor = {["r"] = 0, ["g"] = 0, ["b"] = 1, ["a"] = 1}
	sNamePlates.db.profile.neutralColor = {["r"] = 1, ["g"] = 1, ["b"] = 0, ["a"] = 1}
	sNamePlates.db.profile.hostileColor = {["r"] = 1, ["g"] = 0, ["b"] = 0, ["a"] = 1}
end

function sNamePlates:RTextColors()
	sNamePlates.db.profile.nameColor = {["r"] =  0.84, ["g"] = 0.75, ["b"] =0.65, ["a"] = 1}
	sNamePlates.db.profile.healthPercentColor = {["r"] =  0.84, ["g"] = 0.75, ["b"] =0.65, ["a"] = 1}
	sNamePlates.db.profile.healthAmmountColor = {["r"] =  0.84, ["g"] = 0.75, ["b"] =0.65, ["a"] = 1}
	sNamePlates.db.profile.castbarNameColor = {["r"] =  0.84, ["g"] = 0.75, ["b"] =0.65, ["a"] = 1}
	sNamePlates.db.profile.castbarTimeColor = {["r"] =  0.84, ["g"] = 0.75, ["b"] =0.65, ["a"] = 1}
end

function sNamePlates:RHighlightColors()
	sNamePlates.db.profile.highlightColor = {["r"] = 0.25, ["g"] = 0.25, ["b"] = 0.25, ["a"] = 1}
end

function sNamePlates:RBackgroundColors()
	sNamePlates.db.profile.backgroundNameplateColor = {["r"] = 0.25, ["g"] = 0.25, ["b"] = 0.25, ["a"] = 1}
	sNamePlates.db.profile.backgroundCastbarColor = {["r"] = 0.25, ["g"] = 0.25, ["b"] = 0.25, ["a"] = 1}
end	

function sNamePlates:RBorderColors()
	sNamePlates.db.profile.healthbarBorderColor = {["r"] = 0, ["g"] = 0, ["b"] = 0, ["a"] = 1}
	sNamePlates.db.profile.castbarBorderColor = {["r"] = 0, ["g"] = 0, ["b"] = 0, ["a"] = 1}
	sNamePlates.db.profile.castbarIconBorderColor = {["r"] = 0, ["g"] = 0, ["b"] = 0, ["a"] = 1}
end

function sNamePlates:RTIColors()
	sNamePlates.db.profile.TIColor = {["r"] = 1, ["g"] = 1, ["b"] = 1, ["a"] = 1}
end

function sNamePlates:TargetIndicatorGrabLeft()
	local c = sNamePlates.db.profile.tarIndicatorSelect
	if c == 1 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowDoubleLeft]]	
	elseif c == 2 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowCompositeLeft]]
	elseif c == 3 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowBrokenLeft]]
	elseif c == 4 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowFullLeft]]
	elseif c == 5 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowThinLeft]]
	elseif c == 6 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\BracketLeft]]
	elseif c == 7 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\BracketThinLeft]]
	end	
end

function sNamePlates:TargetIndicatorGrabRight()
	local c = sNamePlates.db.profile.tarIndicatorSelect
	if c == 1 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowDoubleRight]]
	elseif c == 2 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowCompositeRight]]
	elseif c == 3 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowBrokenRight]]
	elseif c == 4 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowFullRight]]
	elseif c == 5 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\ArrowThinRight]]
	elseif c == 6 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\BracketRight]]
	elseif c == 7 then
		return [[Interface\AddOns\sNamePlates\Media\Textures\TargetIndicator\BracketThinRight]]
	end	
end