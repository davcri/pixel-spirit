@tool
extends MeshInstance2D
class_name Card2D

@onready var shader: ShaderMaterial = material

func _ready():
	pass


func get_size() -> Vector2:
	return (mesh as QuadMesh).size * scale


func _process(delta):
	shader.set_shader_parameter("u_size", get_size()) # TODO: set uniform only when size changes
