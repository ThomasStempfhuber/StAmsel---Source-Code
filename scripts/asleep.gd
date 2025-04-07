extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect
@onready var timer: Timer = $Timer

func _ready() -> void:
	animation_player.play("Fade")


func _on_timer_timeout() -> void:
	Global.start_night()


func _on_timer_2_timeout() -> void:
	animation_player.play_backwards("Fade")
	timer.start()
