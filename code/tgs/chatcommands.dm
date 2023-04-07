var/static/list/tgsAdmins = list("347047448985862144", "233272073928179722", "735861400085200957")

/datum/tgs_chat_command/status
	name = "status"
	help_text = "shows the status of the server"
	admin_only = FALSE

/datum/tgs_chat_command/status/Run(datum/tgs_chat_user/sender, params)
	var/n = 0
	var/roundstatus = ""
	var/mills = world.time // 1/10 of a second, not real milliseconds but whatever
	var/mins = (mills % 36000) / 600
	var/hours = mills / 36000

	for(var/client/C in clients)
		n++

	switch(ticker.current_state)
		if(GAME_STATE_PREGAME)
			roundstatus = "Story in Lobby."
		if(GAME_STATE_FINISHED)
			roundstatus = "Your fortress has been abandoned."
		else
			roundstatus = "Story has started."
	return "<byond://193.223.107.13:34673> [n] players online - Round Duration: [round(hours)]h [round(mins)]m - [roundstatus]"

/datum/tgs_chat_command/hr
	name = "hr"
	help_text = "hard restart"
	admin_only = FALSE

/datum/tgs_chat_command/hr/Run(datum/tgs_chat_user/sender, params)
	if (!tgsAdmins.Find(sender.id))
		return "You are not an admin"
	
	world.Reboot("Discord hard restart")
	return "Reboot requested"
		
/datum/tgs_chat_command/invite
	name = "invite"
	help_text = "invite"
	admin_only = FALSE

/datum/tgs_chat_command/invite/Run(datum/tgs_chat_user/sender, params)
	if (!tgsAdmins.Find(sender.id))
		return "You are not an admin"

	params = trim(params)
	if(!params)
		return "Insufficient parameters"
	
	var/DBQuery/queryInsert = dbcon.NewQuery("INSERT INTO playersfarweb (ckey, invitedby, reason) VALUES (\"[ckey(params)]\", \"[sender.friendly_name]\", \"DISCORD INVITE\")")
	if(!queryInsert.Execute())
		world.log << queryInsert.ErrorMsg()
		queryInsert.Close()
		return
	queryInsert.Close()
	ckeywhitelistweb.Add(ckey(invitee))

	return "[ckey(params)] whitelist'e eklendi"