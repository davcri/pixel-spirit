#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float n = 3.;
	float a = TAU / n;
	for (float i =0.; i < n * 2.; i++) {
		vec2 xy = rotate(uv, a * i);
		xy.y -= 0.09;
		float vsc = vesicaSDF(xy, .3);
		col = mix(col + stroke(vsc, .5, .1), mix(col, bridge(col, vsc, .5, .1), step(xy.x, .5)- step(xy.y, .4)), step(3., i));
	}
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
