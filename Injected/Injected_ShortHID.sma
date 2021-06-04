#include <AMXModX>

#pragma semicolon 1

#define PluginName "[Injected] Short-HID Authorize"
#define PluginVersion "1.0"
#define PluginAuthor "Ali 13"

#define KickReason "Get Injected Anti Cheat -> www.ToosGame.ir"

new const ShortHIDKey[] = "*HID";

new BlockUnAuthorizeCvar;

public plugin_init()
{
	register_plugin(PluginName, PluginVersion, PluginAuthor);

	BlockUnAuthorizeCvar = register_cvar("amx_injected_sha", "1", FCVAR_PROTECTED);
}

public client_authorized(id)
{	
	if(get_pcvar_num(BlockUnAuthorizeCvar) && !is_user_bot(id) && !is_user_hltv(id))
	{
		new GetShortHID[10];
		get_user_info(id, ShortHIDKey, GetShortHID, charsmax(GetShortHID));

		new GetUserID = get_user_userid(id);

		if(!GetShortHID[0] || GetShortHID[0] == '0')
			server_cmd("kick #%d ^"%s^"", GetUserID, KickReason);
	}
}