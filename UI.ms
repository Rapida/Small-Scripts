rollout dt "Doors Tools" --width:(SSC.size[1]-20) height:(SSC.size[2]-250)
(

	on dt open  do
(
	print "dt open"
	)
	on dt close  do
(
	
	)
)
rollout newR "Doors Tools" ( )
SSC = newRolloutFloater "Small Scripts Collection" 250 600
addRollout dt SSC rolledUp:false border:true 
