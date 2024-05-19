#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float tri = polySDF(rotate(uv, radians(180)) - vec2(.13, .09), 3);
	float triR = polySDF(uv - vec2(.13, .09), 3);

	col += stroke(tri, .25, .08);
	col += stroke(triR, .25, .08);

	//col = bridge(col, triR, .1, .2);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	uv = rotate(uv, radians(-60.));
	uv.y = flip(uv.y, step(.5, uv.x));
	uv.y += .25;
	float down = polySDF(uv, 3);
	uv.y = 1.5 - uv.y;
	float top = polySDF(uv, 3);
	col += stroke(top, .4, .15);
	col = bridge(col, down, .4, .15);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
