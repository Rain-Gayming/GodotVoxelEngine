
extends MeshInstance3D

func _ready():
	generateChunk()

func generateChunk():
	var meshData = []
	meshData.resize(ArrayMesh.ARRAY_MAX)
	meshData[ArrayMesh.ARRAY_VERTEX] = PackedVector3Array(VoxelData.voxelVerts)
	meshData[ArrayMesh.ARRAY_INDEX] = PackedInt32Array(VoxelData.voxelIndices)
	meshData[ArrayMesh.ARRAY_NORMAL] = PackedVector3Array(VoxelData.voxelNormals)
	
	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshData)
