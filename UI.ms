--Shrink the doors to match the open, half of frame width of the door.
fn shrinkTheDoors = ( for i in selection do
(if classOf i == pivot then
	(	frW = i.framewidth
		oldW = i.width
		oldH = i.height
		newW = oldw - frW
		newH = oldH - frW/2
		i.width = newW
		i.height = newH
		in coordsys local move i [frW/2, 0, 0] )
	else (print "No doors in selection") ) )

rollout dt "Doors Tools" width:230 height:350
(
	button shrinkDoors "Shrink" pos:[10,10] width:60 height:25 toolTip:"Shrink the doors to match open size"
	button removeFrame "Remove Frame" pos:[80,10] width:80 height:25  toolTip:"Remove the frames from all doors in selection"
	
	on dt open do
	(
		)
	on dt close do
	(
		
		)
	on shrinkDoors pressed  do(	shrinkTheDoors () )
	on removeFrame pressed do (
		for i in selection do
		( if classOf i == pivot do
			(
				i.Panel_Type = 0
			)
		)
		
	)
)
rollout newR "Doors Tools" ( )
SSC = newRolloutFloater "Small Scripts Collection" 250 600
addRollout dt SSC rolledUp:false border:true 
