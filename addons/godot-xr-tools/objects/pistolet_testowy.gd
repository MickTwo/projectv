extends XRToolsPickable

func action():
	$AudioStreamPlayer.play()
	$OmniLight3D.visible = true
	$AnimationPlayer.play("uspik_strzal")
	await get_tree().create_timer(0.1).timeout
	$OmniLight3D.visible = false
