#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(.0);

	float rect = rectSDF(uv, vec2(0.5, 1.0));
	float lineSDF = (uv.x + uv.y) * 0.5;
	float centralRect = fill(rect, 0.6);
	float diag = stroke(lineSDF, .5, .01);

	col += flip(diag, centralRect);

	return clamp(col, 0.0, 1.0);
}

vec3 myImpl(vec2 uv, vec3 col) {
	// white rect
	float rect = rectSDF(uv, vec2(1.0, 2.0));
	col += fill(rect, 0.35);

	// diagonal
	float lineSDF = 1.0 - uv.x - uv.y;
	float diagonal = stroke(lineSDF, 0., 0.02);
	float inRect = step(0.01, col.x);
	col += inRect * (-1.0) * diagonal + (1.0 - inRect) * diagonal;
	return col;
}