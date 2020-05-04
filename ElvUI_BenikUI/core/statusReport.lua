local BUI, E, L, V, P, G = unpack(select(2, ...))

local GetAddOnEnableState = GetAddOnEnableState
local GetAddOnInfo = GetAddOnInfo
local GetNumAddOns = GetNumAddOns

local function AreOtherAddOnsEnabled()
	local name
	for i = 1, GetNumAddOns() do
		name = GetAddOnInfo(i)
		if ((name ~= "ElvUI" and name ~= "ElvUI_OptionsUI" and name ~= "ElvUI_BenikUI") and E:IsAddOnEnabled(name)) then --Loaded or load on demand
			return "Yes"
		end
	end
	return "No"
end

local function CreateStatusFrame()
	local StatusFrame = ElvUIStatusReport

	-- style
	StatusFrame.backdrop:Style('Outside')
	StatusFrame.PluginFrame.backdrop:Style('Outside')
	-- hide the logo. Sorry Elv :P
	StatusFrame.TitleLogoFrame.LogoTop:SetTexture(nil)
	StatusFrame.TitleLogoFrame.LogoBottom:SetTexture(nil)

	-- create the report title
	StatusFrame.TitleLogoFrame.Title = StatusFrame.TitleLogoFrame:CreateFontString(nil, "ARTWORK")
	StatusFrame.TitleLogoFrame.Title:FontTemplate(nil, 18, "OUTLINE")
	StatusFrame.TitleLogoFrame.Title:Point("BOTTOM", 0, 7)
	StatusFrame.TitleLogoFrame.Title:SetJustifyH("CENTER")
	StatusFrame.TitleLogoFrame.Title:SetJustifyV("MIDDLE")
	StatusFrame.TitleLogoFrame.Title:SetFormattedText("|cfffe7b2c- ElvUI Status Report -|r")

	-- Content lines
	local versiontext = StatusFrame.Section1.Content.Line1.Text:GetText()
	versiontext = versiontext..", BenikUI "..format(" |cff4beb2cv%s|r", BUI.Version)

	StatusFrame.Section1.Content.Line1.Text:SetFormattedText(versiontext)
	StatusFrame.Section1.Content.Line2.Text:SetFormattedText("Other AddOns Enabled: |cff4beb2c%s|r", AreOtherAddOnsEnabled())
end

hooksecurefunc(E, "UpdateStatusFrame", CreateStatusFrame)