extends CharacterBody2D

const speed = 90
const diag_speed = (1/sqrt(2))*speed

var current_dir = "down"
var idle = true


func _ready():
	play_animation()

func _physics_process(delta):	
	player_movement(delta)
	play_animation()
	current_camera()

func player_movement(delta):
	
	idle = false
	if Global.in_dialogue:
		idle = true
		velocity.x = 0
		velocity.y = 0
	elif Input.is_action_pressed("move_right") and Input.is_action_pressed("move_down"):
		current_dir="right"
		velocity.x = diag_speed
		velocity.y = diag_speed
	elif Input.is_action_pressed("move_right") and Input.is_action_pressed("move_up"):
		current_dir="right"
		velocity.x = diag_speed
		velocity.y = -diag_speed
	elif Input.is_action_pressed("move_left") and Input.is_action_pressed("move_down"):
		current_dir="left"
		velocity.x = -diag_speed
		velocity.y = diag_speed
	elif Input.is_action_pressed("move_left") and Input.is_action_pressed("move_up"):
		current_dir="left"
		velocity.x = -diag_speed
		velocity.y = -diag_speed
	elif Input.is_action_pressed("move_right"):
		current_dir="right"
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("move_left"):
		current_dir="left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("move_down"):
		current_dir="down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("move_up"):
		current_dir="up"
		velocity.x = 0
		velocity.y = -speed
	else:
		idle = true
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_animation():
	var anim = $AnimatedSprite2D
	
	if current_dir == "left":
		anim.flip_h = false
		if idle == true:
			anim.play("Idle_Side")
		else:
			anim.play("Walk_Side")
	elif current_dir == "right":
		anim.flip_h = true
		if idle == true:
			anim.play("Idle_Side")
		else:
			anim.play("Walk_Side")
	elif current_dir == "down":
		anim.flip_h = false
		if idle == true:
			anim.play("Idle_Down")
		else:
			anim.play("Walk_Down")
	elif current_dir == "up":
		anim.flip_h = false
		if idle == true:
			anim.play("Idle_Up")
		else:
			anim.play("Walk_Up")


func current_camera():
	if Global.current_scene == "villageDay":
		$villageCamera.enabled = true
		$freeCamera.enabled = false
	else:
		$villageCamera.enabled = false
		$freeCamera.enabled = true


func player():
	null
