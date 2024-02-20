extends Camera3D

@export_category("References")
@export var worldManager : WorldManager

@export_category("Movement")
@export var acceleration = 25.0;
@export var moveSpeed = 5.0;

@export_category("Looking")
@export var mouseSensitivity = 300.0;

var velocity = Vector3.ZERO;
var lookAngles = Vector2.ZERO;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	lookAngles.y = clamp(lookAngles.y, PI / -2, PI / 2)
	set_rotation(Vector3(lookAngles.y, lookAngles.x, 0))
	var direction = updateDirection()
	
	if direction.length_squared() > 0:
		velocity += direction * acceleration * delta
	if velocity.length() > moveSpeed:
		velocity = velocity.normalized() * moveSpeed
	
	translate(velocity * delta);
	

func _input(event):
	if event is InputEventMouseMotion:
		lookAngles -= event.relative / mouseSensitivity;

func updateDirection():
	var dir = Vector3()
	if Input.is_action_pressed("moveForward"):
		dir += Vector3.FORWARD
	if Input.is_action_pressed("moveBackward"):
		dir += Vector3.BACK
	if Input.is_action_pressed("moveLeft"):
		dir += Vector3.LEFT
	if Input.is_action_pressed("moveRight"):
		dir += Vector3.RIGHT
	if Input.is_action_pressed("crouch"):
		dir += Vector3.DOWN
	if Input.is_action_pressed("jump"):
		dir += Vector3.UP
	
	if dir == Vector3.ZERO:
		velocity = Vector3.ZERO;
		
	return dir.normalized()
