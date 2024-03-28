extends StaticBody3D


signal label_clicked()
func pointer_event(event:XRToolsPointerEvent):
	if event.event_type==XRToolsPointerEvent.Type.RELEASED:
		emit_signal("label_clicked")
