#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	uv -= .5;
	float r = dot(uv, uv);
	float a = (atan(uv.y, uv.x) / PI);
	vec2 st = vec2(a, r);
	vec2 grid = vec2(5., log(r) * 20.);
	vec2 uv_i = floor(st * grid);
	st.x += .5 * mod(uv_i.y, 2.);
	vec2 uv_f = fract(st * grid);
	float shape = rhombSDF(uv_f);
	col += fill(shape, .9) * step(.75, 1.-r);

	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
