#include "res://shaders/utils/utils.gdshaderinc"


vec3 myImpl(vec2 uv, vec3 col) {
	float s = 1.0;
	float r = rectSDF(rotate(uv, radians(45.0)), vec2(0.5));
	col += fill(r, s);

	vec2 ofst = vec2(0., 0.2901);
	float s2 = 0.22;
	float s3 = 0.6;
	col -= fill(rectSDF(rotate(uv + ofst, radians(45.0)), vec2(0.5)), s * s2);
	ofst.y *= -1.0;
	col -= fill(rectSDF(rotate(uv + ofst, radians(45.0)), vec2(0.5)), s * s2);
	col -= fill(rectSDF(rotate(uv, radians(45)), vec2(0.5)), s3);
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	vec2 st = rotate(uv, radians(-45.));
	vec2 s = vec2(1.);
	float o = 0.05;

	col += flip(
		fill(rectSDF(st - o, s), .4),
		fill(rectSDF(st + o, s), .4)
	);

	col += fill(rectSDF(st - o, s), .4);
	col += fill(rectSDF(st + o, s), .4);

	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

