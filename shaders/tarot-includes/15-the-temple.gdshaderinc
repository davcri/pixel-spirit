#include "res://shaders/utils/utils.gdshaderinc"

vec3 psImpl(vec2 uv, vec3 col) {
	float triangle = triangleSDF(vec2(uv.x, 1.0 - uv.y));
	float innerTriangle = triangleSDF(vec2(uv.x, uv.y - 0.125));
	col += fill(triangle, 0.5);
	col -= fill(innerTriangle, 0.255);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

