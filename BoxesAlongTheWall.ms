bBox_heigth = $.max.z-$.min.z
bBox_length = distance [$.max.x,$.max.y,0] [$.min.x,$.min.y,0]
wLength = bBox_length
wHeight = bBox_heigth
wPivotTM = WorkingPivot.getTM()
fn createRow PoXYZ stZ Len=
(
	myBox = box length:(random 2.0 3.0) height:3.5 width:(random 20.0 40.0) transform:wPivotTM
	oldWidth = myBox.width/2
	PoXYZ += [myBox.width/2,-myBox.length/2,0]
	in coordsys wPivotTM myBox.pos = PoXYZ
	Len = Len - myBox.width
	
	while Len > 40.1 do
		(
			myBox = box length:(random 2.0 3.0) height:3.5 width:(random 20.0 40.0) transform:wPivotTM
			PoXYZ.x += oldWidth + myBox.width/2
			PoXYZ.y = -myBox.length/2
			PoXYZ.z = stZ
			oldWidth = myBox.width/2
			in coordsys wPivotTM myBox.pos = PoXYZ
			Len = Len - myBox.width
			--print PoXYZ
		)
		
	myBox = box length:(random 2.0 3.0) height:3.5 width:Len transform:wPivotTM
	PoXYZ.x += oldWidth + myBox.width/2
	PoXYZ.y = -myBox.length/2
	PoXYZ.z = stZ
	oldWidth = myBox.width/2
	in coordsys wPivotTM myBox.pos = PoXYZ
	--print PoXYZ
)
	myZ = 0
cO = (((abs wHeight)/3.5) as integer)
for i = 1 to cO do
(
	if i == 1 do (createRow [0,0,0] myZ wLength) 
	if i > 1 do (createRow [0,0,myZ] myZ wLength)
	wHeight -= 3.5
	myZ += 3.5
)

