extends Node

var current_scene = "villageDay"

var in_dialogue = false

var left_wirt = false
var left_shack = false

var wirt_locked = false
var church_locked = true
var shack_locked = true

var tried_church = false
var tried_shack = false


var day_notDone = true

var note_pfarrer  = false
var note_bell  = false
var note_clapper = false
var note_diving = false
var note_diving_helper = false


func start_Dusk():
	day_notDone = false

func start_day():
	get_tree().change_scene_to_file("res://scenes/village_day.tscn")

func fall_asleep():
	get_tree().change_scene_to_file("res://scenes/Asleep.tscn")

func start_night():
	get_tree().change_scene_to_file("res://scenes/village_night.tscn")
	wirt_locked = true

func ending():
	get_tree().change_scene_to_file("res://scenes/Ending.tscn")

func enter_wirt():
	get_tree().change_scene_to_file("res://scenes/wirtshaus.tscn")
	current_scene = "wirt"

func enter_shack():
	get_tree().change_scene_to_file("res://scenes/shack.tscn")
	current_scene = "shack"

func enter_church():
	get_tree().change_scene_to_file("res://scenes/bell_tower.tscn")
	current_scene = "bell"

func leave_wirt():
	left_wirt = true
	get_tree().change_scene_to_file("res://scenes/village_day.tscn")
	current_scene = "villageDay"
	
	

func leave_shack():
	left_shack = true
	get_tree().change_scene_to_file("res://scenes/village_night.tscn")
	current_scene = "villageNight"
	
