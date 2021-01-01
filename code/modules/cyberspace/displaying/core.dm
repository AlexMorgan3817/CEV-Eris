/mob/var/SeeCyberSpace = FALSE //bool only
/mob/proc/Set_SeeCyberSpace(value)
	SeeCyberSpace = value
	if(client)
		client.UpdateCyberSpaceVision()

/mob/Initialize()
	. = ..()
	Set_SeeCyberSpace(SeeCyberSpace)

/mob/Login()
	. = ..()
	Set_SeeCyberSpace(SeeCyberSpace)

/mob/Move()
	. = ..()
	SScyberspace.CyberSpaceViewUpdate()

/client/proc/UpdateCyberSpaceVision()
	if(mob)
		if(mob.SeeCyberSpace)
			if(!isnum(view))
				CRASH("Warning, View isn't number, cyberspace won't be displaying for [src](\ref[src]).")
			SScyberspace.ShowAtomsTo(mob)
			SScyberspace.CyberSpaceViewers |= mob
		else
			SScyberspace.CyberSpaceViewers -= mob
