extends XRToolsPickable

var amunicja = 12
	
	
func action():
	if $RayCast3D.is_colliding():
		var raycast_cel = $RayCast3D.get_collider()
			#$DEBUG/Sprite3D/SubViewport/label_cel.text = (str(raycast_cel))
		if raycast_cel.is_in_group("enemy"):
			$AudioStreamPlayer.play()
			raycast_cel.zgon()
			
	#var pocisk = load("res://pocisk.tscn")
	#var p = pocisk.instantiate()
	#p.global_transform.origin = $Marker3D.global_transform.origin
	#get_parent().add_child(p)
	#p.apply_impulse(-self.global_transform.basis.z * 5)
	amunicja -= 1
	$GPUParticles3D.emitting = true
	$ekranik_uspik/Sprite3D/SubViewport/Label.text = str(amunicja)
	#$AudioStreamPlayer.play()
	$OmniLight3D.visible = true
	$AnimationPlayer.play("uspik_strzal")
	await get_tree().create_timer(0.1).timeout
	$OmniLight3D.visible = false
	
	
		


func _on_snap_zone_kolimator_body_entered(body):
	if body.is_in_group("kolimator_pistolet"):
		$uspik2/SnapZone_kolimator/celon.visible = true
	else:
		$uspik2/SnapZone_kolimator/celon.visible = false
