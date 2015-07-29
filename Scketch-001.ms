iesArr = for l in Lights where classOf l == VRayIES collect l
-- 	startIes = $VRayIES001
for i in iesArr where i != $VRayIES001  do 
(
-- 	newP = i.parent
-- 	newT = i.transform
-- 	newIes = instance startIes
-- 	newIes.transform = newT
-- 	newIes.parent = i.parent
	hDummy = i.parent.parent
	iDummy = i.parent
		excl_array = #()
		for c in hDummy.children do 
		(
			if findString c.name "Glass" != undefined or findString c.name "Tile" != undefined do 
			(
				appendIfUnique excl_array c
			)
		)
				for c in iDummy.children do 
		(
			if findString c.name "Glass" != undefined or findString c.name "Tile" != undefined do 
			(
				appendIfUnique excl_array c
			)
		)
		i.excludeList = excl_array 
		print excl_array
)
