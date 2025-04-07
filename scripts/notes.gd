extends Node2D

@onready var label: RichTextLabel = $RichTextLabel
@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent

var in_range: bool

func _ready() -> void:
	interactable_component.interactable_entered.connect(on_interactable_entered)
	interactable_component.interactable_exited.connect(on_interactable_exited)
	interactable_label_component.hide()
	label.hide()


func on_interactable_entered() -> void:
	interactable_label_component.show()
	in_range = true


func on_interactable_exited() -> void:
	interactable_label_component.hide()
	in_range = false

func _unhandled_input(event: InputEvent) -> void:
	if in_range:
		if event.is_action_pressed("interact"):		
			label.show()
			Global.church_locked = false
		
