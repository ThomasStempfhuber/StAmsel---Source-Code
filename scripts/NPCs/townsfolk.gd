extends Node2D

var balloon_scene = preload("res://dialogue/game_dialogue_balloon.tscn")

@onready var interactable_component = $InteractableComponent
@onready var interactable_label_component = $InteractableLabelComponent

var in_range: bool

func _ready() -> void:
	interactable_component.interactable_entered.connect(on_interactable_entered)
	interactable_component.interactable_exited.connect(on_interactable_exited)
	interactable_label_component.hide()


func on_interactable_entered() -> void:
	interactable_label_component.show()
	in_range = true


func on_interactable_exited() -> void:
	interactable_label_component.hide()
	in_range = false

func _unhandled_input(event: InputEvent) -> void:
	if in_range:
		if event.is_action_pressed("interact"):
			var balloon: BaseGameDialogueBalloon = balloon_scene.instantiate()
			get_tree().current_scene.add_child(balloon)
			Global.in_dialogue = true
			balloon.start(load("res://dialogue/conversations/townsfolk.dialogue"), "start")
		
