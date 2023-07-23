
NetherBot = {
	Locales = {},
}

local _usedLocale
function NetherBot.InitLocale()
	_usedLocale = NetherBot.Locales[GetLocale()]
end

function NetherBot.I18n(text)
	if _usedLocale then
		return _usedLocale[text] or text
	else
		return text
	end
end
