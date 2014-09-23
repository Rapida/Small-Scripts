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
tBitmap = "Z:\sceneassets\images\Textures\Colors\lingerie-skin-tone-chart.jpg" --select an bitamFile
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