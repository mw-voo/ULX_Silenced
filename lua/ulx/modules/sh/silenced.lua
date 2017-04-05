local CATEGORY_NAME = "Chat"
function ulx.silenced(calling_ply)
	if not IsValid(calling_ply) and calling_ply == "Console" then 
		calling_ply = "Console"
	end
	local gagged = {}
	local muted = {}
	for _ , v in pairs(player.GetAll()) do
		if IsValid(v) then
			if v.ulx_gagged then table.insert(gagged,v) end
			if v.gimp == 2 then table.insert(muted,v) end
		end
	end


	if #gagged >= 1 then
		ulx.fancyLogAdmin( calling_ply, true, "The following players are gagged: #T", gagged)
	else

		ULib.tsayError(calling_ply,"No one is currently gagged.",true)
	end


	if #muted >= 1 then
		ulx.fancyLogAdmin( calling_ply, true, "The following players are muted: #T", muted)
	else
		ULib.tsayError(calling_ply,"No one is currently muted.",true)
	end

end
local silenced = ulx.command( CATEGORY_NAME, "ulx silenced", ulx.silenced, "!silenced", true )
silenced:defaultAccess( ULib.ACCESS_ALL )
silenced:help( "Prints out a list of who is silenced by gag or mute." )