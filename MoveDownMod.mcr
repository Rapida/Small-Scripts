macroScript DownMod
	category:"Rapida Scripts"
	toolTip:"Move Down Modifiers Panel"
(
	if selection.count == 1 do 
		(
			if $.modifiers.count > 0 then
			(
				if modPanel.getCurrentObject() == undefined do (max modify mode)
				m_count = $.modifiers.count
				m_array = $.modifiers
				current_m = modPanel.getCurrentObject()
				current_mi = findItem m_array current_m
				down = current_mi + 1
				fn move_down = 
				(
					if m_count == current_mi do m_pos = "Last"
					if m_count != current_mi do m_pos = "Not Last"
						print m_pos
						if m_pos == "Not Last" then
						(
							modPanel.setCurrentObject $.modifiers[down]
						) else 
						(
							modPanel.setCurrentObject $.baseObject
						)
				)
				move_down()
			) else ( max modify mode )
		)
)