local BUI, E, _, V, P, G = unpack(select(2, ...))
local L = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale or 'enUS');

local tinsert, tsort, tconcat, format = table.insert, table.sort, table.concat, string.format

local StaticPopup_Show = StaticPopup_Show

local DONATORS = {
	'Cawkycow',
	'Chilou',
	'Judicator',
	'Hilderic',
	'Kevinrc',
	'Merathilis',
	'Sumidian (twice!)',
	'Justin',
	'Scott C.',
	'Edward F.',
	'Marcus G.',
	'Michael W.',
	'Ara M.',
	'CHRONiC',
	'Tlareg',
	'Nizz',
	'CremeEgg',
	'Louis S.',
	'Frisko',
	'Robert D.',
	'Shannon B.',
	'Joseph L.',
	'Valentina K.',
	'Max T.',
	'Kevin G.',
	'Ahmed A.',
	'Christopher S-C.',
	'George McC.',
	'Christian S.',
	'Ric F.',
}
tsort(DONATORS, function(a, b) return E:StripString(a) < E:StripString(b) end)
local DONATOR_STRING = tconcat(DONATORS, ", ")

local PATRONS = {
	'thurin',
	'Matt D.',
}
tsort(PATRONS, function(a, b) return E:StripString(a) < E:StripString(b) end)
local PATRONS_STRING = tconcat(PATRONS, ", ")

local CODING = {
	'Elv',
	'Tukz',
	'Blazeflack',
	'Azilroka',
	'Darth Predator',
	'Sinaris',
	'Hydra',
	'Merathilis',
	'NihilisticPandemonium',
	'Repooc',
	'Pristie',
	'|cffff005athurin|r',
}
tsort(CODING, function(a, b) return E:StripString(a) < E:StripString(b) end)
local CODING_STRING = tconcat(CODING, ", ")

local NITRO = {
	'Runew0lf',
}
tsort(NITRO, function(a, b) return E:StripString(a) < E:StripString(b) end)
local NITRO_STRING = tconcat(NITRO, ", ")

local TESTERS = {
	'Kringel',
	'Roxanne',
	'BuG',
	'Semprini',
	'Vxt',
	'V4NT0M',
	'Obscurrium',
	'ElvUI community'
}
tsort(TESTERS, function(a, b) return E:StripString(a) < E:StripString(b) end)
local TESTERS_STRING = tconcat(TESTERS, ", ")

	StaticPopupDialogs["BENIKUI_CREDITS"] = {
		text = BUI.Title,
		button1 = OKAY,
		hasEditBox = 1,
		OnShow = function(self, data)
			self.editBox:SetAutoFocus(false)
			self.editBox.width = self.editBox:GetWidth()
			self.editBox:Width(280)
			self.editBox:AddHistoryLine("text")
			self.editBox.temptxt = data
			self.editBox:SetText(data)
			self.editBox:HighlightText()
			self.editBox:SetJustifyH("CENTER")
		end,
		OnHide = function(self)
			self.editBox:Width(self.editBox.width or 50)
			self.editBox.width = nil
			self.temptxt = nil
		end,
		EditBoxOnEnterPressed = function(self)
			self:GetParent():Hide();
		end,
		EditBoxOnEscapePressed = function(self)
			self:GetParent():Hide();
		end,
		EditBoxOnTextChanged = function(self)
			if(self:GetText() ~= self.temptxt) then
				self:SetText(self.temptxt)
			end
			self:HighlightText()
			self:ClearFocus()
		end,
		OnAccept = E.noop,
		timeout = 0,
		whileDead = 1,
		preferredIndex = 3,
		hideOnEscape = 1,
	}

local function Info()
	E.Options.args.benikui.args.info = {
		order = 2000,
		type = 'group',
		name = L['Information'],
		args = {
			name = {
				order = 1,
				type = 'header',
				name = BUI:cOption(L['Information']),
			},
			support = {
				order = 2,
				type = 'group',
				name = BUI:cOption(L['Support']),
				guiInline = true,
				args = {
					tukui = {
						order = 1,
						type = 'execute',
						name = L['Tukui.org'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://www.tukui.org/forum/viewforum.php?f=33") end,
						},
					git = {
						order = 2,
						type = 'execute',
						name = L['Git Ticket tracker'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://git.tukui.org/Benik/ElvUI_BenikUI/issues") end,
					},
					discord = {
						order = 3,
						type = 'execute',
						name = L['Discord Server'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://discord.gg/8ZDDUem") end,
					},
				},
			},
			download = {
				order = 3,
				type = 'group',
				name = BUI:cOption(L['Download']),
				guiInline = true,
				args = {
					tukui = {
						order = 1,
						type = 'execute',
						name = L['Tukui.org'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://www.tukui.org/addons.php?id=11") end,
					},
					curse = {
						order = 2,
						type = 'execute',
						name = L['Curseforge'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://www.curseforge.com/wow/addons/benikui-v3") end,
					},
					beta = {
						order = 3,
						type = 'execute',
						name = L['Beta versions'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://git.tukui.org/Benik/ElvUI_BenikUI/repository/archive.zip?ref=development") end,
					},
				},
			},
			coding = {
				order = 4,
				type = 'group',
				name = BUI:cOption(L['Coding']),
				guiInline = true,
				args = {
					str = {
						order = 1,
						type = 'description',
						fontSize = 'medium',
						name = format('|cffffd200%s|r', CODING_STRING),
					},
				},
			},
			testing = {
				order = 5,
				type = 'group',
				name = BUI:cOption(L['Testing & Inspiration']),
				guiInline = true,
				args = {
					test = {
						order = 1,
						type = 'description',
						fontSize = 'medium',
						name = format('|cffffd200%s|r', TESTERS_STRING),
					},
				},
			},
			donors = {
				order = 6,
				type = 'group',
				name = BUI:cOption(L['Donations']),
				guiInline = true,
				args = {
					patreon = {
						order = 1,
						type = 'description',
						fontSize = 'medium',
						name = format('|cffff005aPatrons: |r|cffffd200%s\n|r', PATRONS_STRING)
					},
					paypal = {
						order = 2,
						type = 'description',
						fontSize = 'medium',
						name = format('|cff009fffPayPal: |r|cffffd200%s\n|r', DONATOR_STRING)
					},
					nitro = {
						order = 3,
						type = 'description',
						fontSize = 'medium',
						name = format('|cfff47fffDiscord Nitro Booster: |r|cffffd200%s|r', NITRO_STRING)
					},
				},
			},
			addons = {
				order = 7,
				type = 'group',
				name = BUI:cOption(L['My other Addons']),
				guiInline = true,
				args = {
					locplus = {
						order = 1,
						type = 'execute',
						name = L['LocationPlus for ElvUI'],
						desc = L['Adds player location, coords + 2 Datatexts and a tooltip with info based on player location/level.'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "http://www.curse.com/addons/wow/elvui-location-plus") end,
					},
					nuts = {
						order = 2,
						type = 'execute',
						name = L['Nuts & Bolts for ElvUI'],
						desc = L['ElvUI Nuts & Bolts is a compilation of my addons hosted at tukui.org/Twitch plus some features that are moved from BenikUI'],
						func = function() StaticPopup_Show("BENIKUI_CREDITS", nil, nil, "https://www.curseforge.com/wow/addons/elvui-nutsandbolts") end,
					},
				},
			},
		},
	}
end
tinsert(BUI.Config, Info)
