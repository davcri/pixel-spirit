#include "res://shaders/utils/utils.gdshaderinc"

// hyp: edge1 < edge2
float step_square(float edge1, float edge2, float x) {
	return step(edge1, x) * (1.0 - step(edge2, x));
}

vec3 tarot_draw(vec2 uv, float line_width, float r) {
	float s = line_width;
	float d = 0.25;

	// central square dot
	vec3 col = vec3(0.);
	col += step(.5-s*1.5, uv.x);
	col -= step(.5+s*1.5, uv.x);
	col *= step(.5-s*1.5, uv.y) - step(.5+s*1.5, uv.y);

	// outer squared ring
	vec3 outerCol = vec3(.0);
	float verticalSlice = step_square(0.5-d-s, 0.5+d+s, uv.y);
	// left edge
	outerCol += verticalSlice * (step_square(d-s, d+s, uv.x));
	float rightEdge = 1.-d;
	outerCol += verticalSlice * (step_square(rightEdge - s, rightEdge + s, uv.x));

	// bottom edge
	float hSlice = step_square(.5-d-s, .5+d+s, uv.x);
	outerCol += hSlice * step_square(d-s, d+s, uv.y);
	// top edge
	outerCol += hSlice * step_square(d-s, d+s, 1.0 - uv.y);
	col += outerCol;

	return clamp(col, 0.0, 1.0);
}