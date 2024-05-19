#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float rightCircle = stroke(circleSDF(uv - vec2(0.15, .0)), .4, .06);
	col += rightCircle;
	// gap
	col -= step(uv.y, .5) * rightCircle * stroke(circleSDF(uv + vec2(0.15, .0)), .4, .12);

	float leftCircle = stroke(circleSDF(uv + vec2(0.15, .0)), .4, .06);
	col += leftCircle;
	// gap
	col -= step(0.5, uv.y) * leftCircle * stroke(circleSDF(uv - vec2(0.15, .0)), .4, .12);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	uv.x = flip(uv.x, step(.5, uv.y));
	vec2 offset = vec2(.15, .0);
	float left = circleSDF(uv + offset);
	float right = circleSDF(uv - offset);
	col += stroke(left, .4, .075);
	col = bridge(col, right, .4, .075);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
