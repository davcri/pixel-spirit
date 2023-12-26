shader_type canvas_item;

void vertex() {}

void fragment() {
	COLOR.rgb = step(0.5, UV.x) * vec3(1.0, 1.0, 1.0);
	COLOR.a = 1.0;
}