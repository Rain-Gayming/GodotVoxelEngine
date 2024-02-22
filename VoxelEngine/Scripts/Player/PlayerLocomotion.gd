extends Node

enum EMovementType
{
	crouch,
	walk,
	run,
	sprint,
}

@export_category("References")
@export var rigidBody : RigidBody3D
@export var cameraObject : Node3D
@export var inputManager : InputManager

@export_category("Movement Speed")
@export var currentMoveSpeed : float
@export var movementMultiplier : float = 1
@export var walkSpeed : float
@export var runSpeed : float
@export var sprintSpeed : float

@export_category("Movement Info")
@export var currentMoveType : EMovementType
@export var moveDirection : Vector3
@export var movementVelocity : Vector3


@export_category("Jumping")

@export_category("Falling")

@export_category("Rotation")

func _ready():
	setMoveType(EMovementType.run)

func _process(delta):
	handleMovement()
	handleFallingAndLanding()
	handleRotation()

func setMoveType(moveType : EMovementType):
	if moveType == EMovementType.walk:
		currentMoveSpeed = walkSpeed
	
	if moveType == EMovementType.run:
		currentMoveSpeed = walkSpeed
	
	if moveType == EMovementType.sprint:
		currentMoveSpeed = sprintSpeed

func handleMovement():
	#camera rotation
	var cameraAim = cameraObject.basis
	#forward movement
	moveDirection = cameraAim.z * inputManager.movement.y
	#side movement
	moveDirection = moveDirection + -cameraAim.x * inputManager.movement.x
	#no speed change on diagonal
	moveDirection.normalized()
	moveDirection.y = 0
	
	#set speed
	movementVelocity = moveDirection * currentMoveSpeed * movementMultiplier
	rigidBody.linear_velocity = movementVelocity

func handleJump():
	pass

func handleFallingAndLanding():
	pass

func handleRotation():
	pass
