macroScript RParentL
category:"Rapida Scripts" 
buttonText:"RParentL"
toolTip:"Parent selected to last in selection"
(
	if selection.count < 2 then
	(
		print "Select more objects"
	)
	else
	(
		n = selection.count
		test = $[n]
		sArr = selection as array
		fi = findItem sArr test.parent
		print fi
		if test.parent != undefined and fi > 0 do
		(
			test.parent = udefined
		)
		for i = 1 to (n - 1)  do
			(
				$[i].parent = $[n]
			)
	)
)