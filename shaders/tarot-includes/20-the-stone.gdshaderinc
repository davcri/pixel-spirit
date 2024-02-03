#include "res://shaders/utils/utils.gdshaderinc"


vec3 myImpl(vec2 uv, vec3 col) {
	uv = rotate(uv, radians(45));
	float square = fill(rectSDF(uv, vec2(1.0)), 0.5);
	float lineSDF = abs(uv.x - 0.5);
	float lineSDF2 = abs(uv.y - 0.5);
	float lineWidth = 0.015;
	float lines = fill(lineSDF, lineWidth) + fill(lineSDF2, lineWidth);
	lines *= square;
	col += flip(square, lines);
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	uv = rotate(uv, radians(45.0));
	col += fill(rectSDF(uv, vec2(1.0)), 0.4);
	col *= 1.0 - stroke(uv.x, 0.5, 0.02);
	col *= 1.0 - stroke(uv.y, 0.5, 0.02);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

