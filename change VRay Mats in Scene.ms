fn reflectSubdivs mat subdivs:8 =
(
	mat.reflection_subdivs = subdivs
	mat.reflection_maxDepth = 8
)
fn refractSubdivs mat subdivs:8 =
(
	mat.refraction_subdivs = subdivs
	mat.refraction_maxDepth = 8
)
for sM in sceneMaterials do
(
	if isKindOf sM VRayMtl do
		(
			reflectSubdivs sM
			refractSubdivs sM
		)
	if isKindOf sM Multimaterial do
		(
			sM_List = sM.materialList
			for m in sM_List do 
			(
				if isKindOf m VRayMtl do
				(
				reflectSubdivs m
				refractSubdivs m
				)
			)
			--print theMat.reflection_subdivs
		)
	if isKindOf sM VRayBlendMtl do
		(
			if isKindOf sM.baseMtl VRayMtl do
			(
				reflectSubdivs sM.baseMtl
				refractSubdivs sM.baseMtl
			)
			for a in sM.coatMtl do
			(
				if isKindOf a VRayMtl do
				(
				reflectSubdivs a
				refractSubdivs a
				)
			)
		)
)
