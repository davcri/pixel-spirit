#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	vec2 st = rotate(uv, radians(45.));
	float rsize = 0.2; // r size
	float rsw= 0.05; // stroke width
	float gap = 0.07;
	float halfGap = gap * 0.5;

	for (int i = -2; i < 2; i++) {
		st = rotate(uv + vec2(halfGap + gap * float(i), 0.), radians(45.));
		float r = rectSDF(st, vec2(1.));
		col += stroke(r, rsize, rsw);
	}

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	//col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

