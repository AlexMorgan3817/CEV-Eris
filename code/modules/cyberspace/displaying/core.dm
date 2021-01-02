/mob/var/SeeCyberSpace = FALSE //bool only
/mob/proc/Set_SeeCyberSpace(value)
	if(SeeCyberSpace != value)
		SeeCyberSpace = value
		UpdateCyberSpaceVision()

/mob/proc/UpdateCyberSpaceVision()
	if(client)
		client.UpdateCyberSpaceVision()

/mob/Login()
	. = ..()
	if(client)
		client.UpdateCyberSpaceVision()

/mob/Move()
	. = ..()
	SScyberspace.CyberSpaceViewUpdate()

/client/proc/UpdateCyberSpaceVision()
	if(mob)
		if(mob.SeeCyberSpace)
			if(!isnum(view))
				CRASH("Warning, View isn't number, cyberspace won't be displaying for [src](\ref[src]).")
			SScyberspace.ShowAtomsTo(mob)
		else
			SScyberspace.HideAtomsFrom(mob)
