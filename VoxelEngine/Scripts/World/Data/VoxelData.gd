extends Node

class_name VoxelData

static var voxelVerts : Array[Vector3] = [
	-Vector3(0, 0, 0),
	-Vector3(1, 0, 0),
	-Vector3(1, 1, 0),
	-Vector3(0, 1, 0),
	-Vector3(0, 0, 1),
	-Vector3(1, 0, 1),
	-Vector3(1, 1, 1),
	-Vector3(0, 1, 1),
]

static var voxelIndices : Array[int] = [
	#top
	3, 7, 2,
	2, 7, 6,
	
	#bottom
	1, 5, 0, 
	0, 5, 4,
	#left
	4, 7, 0, 
	0, 7, 3,
	
	#right
	1, 2, 5, 
	5, 2, 6,
	
	#front
	5, 6, 4, 
	4, 6, 7,
	
	#back
	0, 3, 1, 
	1, 3, 2
]

static var voxelNormals : Array[Vector3] = [
	#top
	Vector3(0, 1, 0),
	
	#bottom
	Vector3(0, -1, 0),
	
	#left
	Vector3(-1, 0, 0),
	
	#right
	Vector3(1, 0, 0),
	
	#front
	Vector3(0, 0, 1),
	
	#back
	Vector3(0, 0, -1),
	
	Vector3(0, 0, 0),	
	Vector3(0, 0, 0),
]

static var voxelUvs : Array[Vector2] = [

	Vector2 (0, 0),
	Vector2 (0, 1),
	Vector2 (1, 0),
	Vector2 (1, 0),
	Vector2 (0, 1),
	Vector2 (1, 1)
]
