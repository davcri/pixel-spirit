@tool
extends MeshInstance3D
class_name Card3D

func _ready():
	material_override = ShaderMaterial.new()


func _process(delta):
	if material_override is ShaderMaterial:
		material_override.set_shader_parameter("u_size", Vector2(mesh.size.x * scale.x, mesh.size.y * scale.y))
