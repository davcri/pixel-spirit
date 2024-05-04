#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float rays = fill(raysSDF(rotate(uv.xy, degrees(PI * 0.7)), 40), .1);
	col += rays;

	// outer vesica mask (bigger)
	col *= step(vesicaSDF(uv, .3), 1.);

	// inner vesica mask (smaller)
	col *= step(0.9, vesicaSDF(rotate(uv, radians(90)), .6));

	col += stroke(vesicaSDF(rotate(uv, radians(90)), .6), .9, .03);
	col += stroke(circleSDF(uv + vec2(0., -.08)), .3, .03) * step(vesicaSDF(rotate(uv, radians(90)), .6), .9);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	//col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
