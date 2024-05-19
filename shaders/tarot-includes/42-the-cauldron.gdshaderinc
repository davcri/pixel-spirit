#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float n = 12.;
	float a = TAU / n;

	for (float i = 0.; i < n; i++) {
		vec2 xy = rotate(uv, a * i);
		xy.y -= .189;
		float vsc = vesicaSDF(xy, .3);
		col *= 1. - stroke(vsc, .45, 0.1) *
			step(.5, xy.y);
		col += stroke(vsc, .45, .05);
	}

	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
