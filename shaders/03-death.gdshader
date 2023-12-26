shader_type canvas_item;

#include "utils.gdshaderinc"

void vertex() {}

void fragment() {
	vec2 rUV = ratio(UV, vec2(9, 16));

	COLOR.rgb = step(1.0 - rUV.x, rUV.y) * vec3(1.0, 1.0, 1.0);
	COLOR.a = 1.0;
}