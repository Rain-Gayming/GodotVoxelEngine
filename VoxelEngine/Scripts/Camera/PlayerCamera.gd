extends Node3D

@export_category("References")
@export var inputManager : InputManager
@export var target : Node3D
@export var cameraTransform : Node3D
@export var cameraPivot : Node3D

@export_category("Camera Speeds")
@export var cameraFllowSpeed : float =  0.2;
@export var lookSpeed : float
@export var pivotSpeed : float

@export_category("Camera Rotation")
@export var lookAngle : float
@export var pivotAngle : float

@export_category("Camera Collision")

@export_category("Camera Info")
@export var defaultPosition : float
@export var cameraVectorPosition : Vector3
@export var cameraFollowVelocity : Vector3

func _ready():
	defaultPosition = cameraTransform.position.z

func _process(delta):
	followTarget()
	rotateCamera()

func followTarget():
	var targetPosition = position + (target.position - position) * 1
	
	position = targetPosition

func rotateCamera():
	lookAngle = lookAngle + (inputManager.mouseDelta.x  * lookSpeed)
	pivotAngle = pivotAngle - (inputManager.mouseDelta.y * pivotSpeed)
	
	pivotAngle = clampf(pivotAngle, -45, 45)
	
	var rot = Vector3.ZERO
	rot.y = lookAngle
	var targetRot = quaternion.from_euler(rot)
	rotation = targetRot
	
	rot = Vector3.ZERO
	rot.x = pivotAngle
	targetRot = quaternion.from_euler(rot)
	cameraPivot.rotation = targetRot
	
