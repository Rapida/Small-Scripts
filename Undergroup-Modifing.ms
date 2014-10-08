for i in selection do 
(
	if isKindOf i Dummy do 
	(
		excl_array = #()
		for c in i.children do 
		(
			if findString c.name "Glass" != undefined or findString c.name "Tile" != undefined do 
			(
				appendIfUnique excl_array c
			)
		)
		for o in i.children do 
		(
			if isKindOf o Omnilight do (o.excludeList = excl_array )
		)
		print excl_array
	)
)


for i in selection do 
	(
		if isKindOf i Dummy do
		(
		print i.name
		old_pos = i.pos
		for o in objects  do 
		( 
			if (findString o.name "Holder" != undefined) and o.pos == old_pos do
			(
				i.parent = o
			)
		)
	)
)

for d in objects do 
(
	if isKindOf d Dummy and findString d.name "GRP" != undefined do 
	(
		for c in d.children do
		(
			if isKindOf c Omnilight do 
			(
				--print "omni"
				c.multiplier = 1
				c.DecayRadius =20
			)
		)
	)
)	