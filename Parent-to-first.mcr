macroScript RParent
category:"Rapida Scripts" 
buttonText:"RParent"
toolTip:"Parent selected to first in selection"
(
	if selection.count < 2 then
	(
		print "Select more objects"
	)
	else
	(
		n = 1
		test = $[n]
		sArr = selection as array
		fi = findItem sArr test.parent
		print fi
		if test.parent != undefined and fi > 0 do
		(
			test.parent = udefined
		)
	for i = 2 to selection.count do
		(
			$[i].parent = $[1]
		)
	)
)