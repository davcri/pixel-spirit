shader_type canvas_item;

#include "utils.gdshaderinc"

uniform float thickness: hint_range(0.0, 1.0, 0.01) = 0.2;

void vertex() {}

void fragment() {
	vec2 rUV = ratio(UV, vec2(9, 16));
	float d = abs(rUV.x - 0.5);

	COLOR.rgb = (1.0 - step(thickness, d)) * vec3(1.0, 1.0, 1.0);
	COLOR.a = 1.0;
}