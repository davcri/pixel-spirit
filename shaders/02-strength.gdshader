shader_type canvas_item;

void vertex() {}

float pwave(float x) {
	return (1.0 + cos(x)) * 0.5;
}

void fragment() {
	COLOR.rgb = step(0.5, UV.x - 0.15 * cos(UV.y * 4.0)) * vec3(1.0, 1.0, 1.0);
	COLOR.a = 1.0;
}