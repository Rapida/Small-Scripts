macroScript RAlign
category:"Rapida Scripts" 
buttonText:"RAlign"
toolTip:"Create Helpers Tool for Align Not Linear objects"
(
	d = Dummy pos:[0,0,0] isSelected:off boxsize:[20,20,20]\
		name:(uniqueName "Align-Dummy-00") wirecolor:blue
	p1 = Point pos:[0,0,0] isSelected:off size:25 axistripod:on cross:off\
		name:(uniqueName "Align-Point1-00") wirecolor:red
	p2 = Point pos:[50,0,0] isSelected:off size:15 axistripod:off cross:on\
		box:on name:(uniqueName "Align-Point2-00") wirecolor:red
	LA = LookAt_Constraint target_axis:0 upnode_axis:2 StoUp_axis:2
	LA.upnode_world = off
	LA.pickUpNode = d
	LA.appendTarget p2 50
	p1.parent = d
	p2.parent = d
	p1.rotation.controller = LA
)