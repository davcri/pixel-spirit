#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	col += fill(floverSDF(uv, 5), .25);
	col -= step(.95, starSDF(rotate(uv, 0.628), 5, .1));
	col = clamp(col, 0., 1.);
	float circle = circleSDF(uv);
	col -= stroke(circle,.1,.05);
	col += stroke(circle, .8, .07);

	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
