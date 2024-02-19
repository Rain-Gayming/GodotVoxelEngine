extends Node

@export var fpsText : Label

func _process(delta):
	fpsText.text = str(Engine.get_frames_per_second())
