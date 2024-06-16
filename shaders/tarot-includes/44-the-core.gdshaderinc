#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float star = starSDF(uv, 8, .063);
	col += fill(star, 1.22);
	float n = 8.;
	float a = TAU / n;

	for (float i = 0.; i < n; i++) {
		vec2 xy = rotate(uv, 0.39+a*i);
		xy = scale(xy, vec2(1., .72));
		xy.y -= .125;
		col *= step(.235, rhombSDF(xy));
	}
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
