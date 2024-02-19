extends Node

class_name WorldManager

@export_category("References")
@export var player : Node3D

@export_category("Settings")
@export var renderDistance = 16

@export_category("World")
@export var chunkScene : PackedScene
@export var chunks : Array[Node3D] = []

func addChunk(position : Vector3):
	var newChunk = chunkScene.instantiate()
	newChunk.name = "chunk " + str((chunks.size() + 1))
	chunks.append(newChunk);
	print("Adding chunk at " + str(position));
	add_child(newChunk)
