@tool
extends MeshInstance3D

@export_range(0, 5) var tarot: int = 0: set=set_tarot

var tarot_list: Array[String] = []
var shader = Shader.new()


func _init():
	tarot_list = []
	var includes = DirAccess.get_files_at("res://shaders/spatials/")
	for i in includes:
		tarot_list.push_back(i)


func _ready():
	material_override = ShaderMaterial.new()
	material_override.shader = shader


func set_tarot(t: int):
	tarot = t
	update_shader()


func update_shader():
	var shader_code_file = "res://shaders/spatials/{0}".format([tarot_list[tarot]])
	material_override.shader = load(shader_code_file) as Shader


func __update_shader():
	var tarot_shader = tarot_list[tarot]
	shader.code = """shader_type spatial;
	#include "res://shaders/tarot-includes/{0}"

	void vertex() {}

	void fragment() {
		vec2 rUV = vec2(UV.x, 1.0 - UV.y);
		ALBEDO.rgb = tarot_draw(rUV);
	}
	""".format([tarot_shader])

