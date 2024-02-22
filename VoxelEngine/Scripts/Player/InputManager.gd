extends Node

class_name InputManager

@export_category("Keyboard Inputs")
@export var movement : Vector2

@export_category("Mouse Inputs")
@export var mouseDelta : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("moveForward"):
		movement.y = 1
	elif Input.is_action_pressed("moveBackward"):
		movement.y = -1
	else:
		movement.y = 0
		
	if Input.is_action_pressed("moveRight"):
		movement.x = 1
	elif Input.is_action_pressed("moveLeft"):
		movement.x = -1
	else:
		movement.x = 0

func _input(event):
	if event is InputEventMouseMotion:
		mouseDelta += event.relative
