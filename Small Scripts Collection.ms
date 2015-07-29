-- Doors insert to Open.
for i in selection do
(
	if classOf i == pivot do
	(
		frW = i.framewidth
		oldW = i.width
		oldH = i.height
		newW = oldw - frW
		newH = oldH - frW/2
		i.width = newW
		i.height = newH
		in coordsys local move i [frW/2, 0, 0]
	)
)

-- Doors without frame
for i in selection do
(
	i.Panel_Type = 0
)
-- Doors Leaf Thickness
for i in selection do
(
	i.Leaf_Thickness = 3.5
)

--random numbers
rndArr = #()
while (selection.count - rndArr.count)>0  do
	(
		appendIfUnique rndArr (random 1 99)
	)
a = 0
for i in selection do
(
	a += 1
	i.baseObject.text = rndArr[a] as string
	print rndArr[a]
)

-- Display Bitmap Image in VFB
tBitmap = "Z:\sceneassets\images\Shwartz\Colors.jpg" --select an bitamFile
vBit = openBitMap tBitmap --open it
vBit.width -- now you can access to his properties
display vBit --display it in VFB

-- change materia type to vray material
fn changeMatType mat =
(
	oldMat = mat --define old material
	if mat.diffusemap != undefined then 
		(
			oldDifMap = mat.diffusemap
			oldDifCol = mat.diffuse
			oldName = mat.name
		)
	else
		(
			oldName = mat.name
			oldDifCol = mat.diffuse
		)
	newMat = VRayMtl diffuse:oldDifCol texmap_diffuse:oldDifMap showInViewport:true name:oldName
)
for m in selection do 
(
	mat = m.material
	newMat = changeMatType mat
	m.material = newMat
	print mat.diffusemap
	print mat.showInViewport
)

--Display Web Url
rollout webbrowser_rollout "Web Picker" width:1200 height:800
(
edittext edt_url "URL:" text:"http://www.tambour.co.il/%D7%A7%D7%95%D7%9C%D7%A7%D7%A6%D7%99%D7%AA_%D7%92%D7%95%D7%95%D7%A0%D7%99%D7%9D_%D7%91%D7%94%D7%99%D7%A8%D7%99%D7%9D.aspx"
dotNetControl wb "System.Windows.forms.WebBrowser" pos:[10,22] width:1180 height:750
fn openURL urlString = (
wb.url = dotNetObject "System.Uri" urlString )
on edt_url entered txt do openURL txt
on webbrowser_rollout open do openURL edt_url.text
)
createdialog webbrowser_rollout

--Alling verts in splines
for s in selection do
(
	knt = getKnotPoint s 1 4
	in_vec = getInVec s 1 4
	out_vec = getOutVec s 1 4
	in coordsys world knt.z = in_vec.z = out_vec.z = -4.755
	setInVec s 1 4 in_vec
	setOutVec s 1 4 in_vec
	setKnotPoint s 1 4 knt
	updateshape s
)
-- Sin scketch
x = 0
for g in selection do 
(
y = (sin(x*10))*5.5
--print (abs y)
rot_sw = eulerAngles (y) 0 0
--rotate g rot_sw
print rot_sw
x +=1
)

--Sin scketch 2
x = 0 
c = random 6 8
b = 5.5
fn rot_fn i ang =
(
	rot_i = EulerAngles ang 0 0
	rotate i rot_i
	--print ang
)
for g in selection do 
(
	y = (sin(x*c)*b)
	rot_fn g y
	x += 1
	if x > 1 do 
	(
		a1 = (sin((x-1)*c))*b
		a2 = (sin((x+1)*c))*b
		a3 = (sin((x+2)*c))*b
		if a1<0 and a2>0 do 
		(
			c += (random -2 2)
			c -= 1
			b1 = (sin((1)*c))*b
			n = (abs(a2) + b1)/2
			rot_fn g (n)
			x = 0
			print ("???????? ?? : " + g.name)
			print c
		)
	)
)



--Modifi spline
in coordsys world for i in selection do
(
	new_z = 0.205
	new_y = -2.991
	knt = getKnotPoint i 1 4
	in_vec = getInVec i 1 4
	out_vec = getOutVec i 1 4
	knt.z = in_vec.z = out_vec.z = new_z
	knt.y = in_vec.y = out_vec.y = new_y
	setInVec i 1 4 in_vec
	setOutVec i 1 4 out_vec
	(setKnotPoint i 1 4 knt)
	updateShape i
)

--cos copy 
x = -75+7.5
start_pos = [0,-118.359,0]
i = $'Cross-001'
s = 15
print "--"
while (y = cos(x))>=0.2 do 
(
	new_i = instance i
	new_i.scale = [y,y,y]
	new_i_bb = new_i.max - new_i.min
	new_y = new_i_bb.y/2+5
	new_pos = start_pos + [0,new_y,0]
	start_pos = new_pos
	new_i.pos = new_pos
	new_i.name = uniquename "Cross_Copy_"
	print ("y="+(y as string)+" "+"x=" + (x as string))
	start_pos += [0,new_y,0]
	x += s
)
print "--"

--Add CustAttributes to the Dummy
weaponDataCA= attributes sunData
(
parameters main rollout:params
(
windowsLight type:#float ui:wLights default:1.0
multiPl type:#float ui:multiP default:100
-- sound type:#string
)
 
rollout params "Day Time"
(
slider wLights "Night Day" range:[0.0,1.0,1.0] type: #float 
spinner multiP "Cost" type: #float
-- dropdownlist sound_dd "Sound" items:# ("boom","sparkle","zap","fizzle")
 
-- on sound_dd selected i do sound = sound_dd.items [i]
)
)

--manipulate submaterials
mArr = $.material
for m in mArr do (
	--m.texmap_reflection_multiplier = (random 12.0 15.0)
	m.option_traceReflection = on
	m.option_traceRefraction = off
	m.hilight_glossiness = (random 0.90 0.95)
	m.reflection_fresnel = on
	m.reflection_lockIOR = off
	m.reflection_ior = (random 2.5 3.6)
	--m.texmap_diffuse.opacity[2] = (random 10.0 12.0)
	--m.texmap_bump_on = off
)

-- search and manipulate all objects
for o in objects do
(
	scl = superClassOf o
	cl = classOf o
	if scl == GeometryClass and cl != Targetobject then
	(
		mName = o.material.name
		if mName == "Material #36" do
		(
			modArr = o.modifiers
			for m in modArr do
			(
				if classOf m == Uvwmap do m.height = m.length = m.width = 50
			)
		)
	)
)