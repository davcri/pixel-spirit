@tool
extends Node

@export_range(0, 50) var tarot: int = 0: set = set_tarot
@export_node_path("Node") var target_node_path

const shader_spatials = "res://shaders/spatials/"
const shader_canvas_items = "res://shaders/canvas_item/"

var tarot_list: Array[String] = []
var shader = Shader.new()

func _ready():
	await get_tree().process_frame
	update_shader()

func set_tarot(t: int):
	tarot = t
	update_shader()

func update_shader():
	if (!target_node_path):
		push_warning("No target node specified")
		return

	# update tarot list
	tarot_list = []
	var includes = DirAccess.get_files_at(shader_canvas_items)
	for i in includes:
		tarot_list.push_back(i)

	# check if out of bounds
	if tarot > tarot_list.size() - 1:
		set_tarot(clamp(tarot, 0, tarot_list.size() - 1))
		return
	print("Setting ", tarot)

	# assign shader
	var target_node = get_node(target_node_path)
	if target_node is Card3D:
		var shader_code_file = shader_spatials + tarot_list[tarot]
		target_node.material_override.shader = load(shader_code_file) as Shader
	elif target_node is Card2D:
		var shader_code_file = shader_canvas_items + tarot_list[tarot]
		target_node.material.shader = load(shader_code_file) as Shader
	else:
		push_error("Node not supported")
