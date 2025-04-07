extends Node2D

var player_start_posx = 600
var player_start_posy = 730
var player_exit_wirt_posx = 600
var player_exit_wirt_posy = 730
var player_exit_shack_posx = 1700
var player_exit_shack_posy = 510


func _ready() -> void:
	if Global.left_wirt:
		$ySort/player.position.x = player_exit_wirt_posx
		$ySort/player.position.y = player_exit_wirt_posy
		Global.left_wirt = false
	elif Global.left_shack:
		$ySort/player.position.x = player_exit_shack_posx
		$ySort/player.position.y = player_exit_shack_posy
		Global.left_shack = false
	else:
		$ySort/player.position.x = player_start_posx
		$ySort/player.position.y = player_start_posy
	Global.shack_locked=false
