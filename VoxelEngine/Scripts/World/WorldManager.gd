extends Node

@export_category("References")
@export var player : Node3D

@export_category("Settings")
@export var renderDistance = 16

@export_category("World")
@export var chunkScene : PackedScene
@export var chunks : Array[Node3D] = []

func _ready():
	for i in renderDistance:
		addChunk(Vector3(0, 0, 0));


func addChunk(position : Vector3):
	var newChunk = chunkScene.instantiate()
	newChunk.name = "chunk " + str((chunks.size() + 1))
	chunks.append(newChunk);
	add_child(newChunk)
