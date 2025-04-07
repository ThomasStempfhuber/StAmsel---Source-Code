extends Node2D


func _on_exit_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.leave_wirt()
	
