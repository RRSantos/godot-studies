extends CanvasLayer

signal transitioned
	
func transition():
	$AnimationPlayer.play("fade_in")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_in":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_out")
		
