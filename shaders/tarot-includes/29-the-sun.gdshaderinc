#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	col += fill(starSDF(uv.yx, 8, 0.08), .88);
	col += fill(starSDF(rotate(uv.xy, radians(22.)), 8, 0.07), .8);

	// center black hex
	col *= flip(
		stroke(hexSDF(uv), .08, .02),
		1.
	);

	// black triangles
	for (int i = 0; i < 8; i++) {
		float angle = TAU / 8. * float(i);

		vec2 ofst = .2 * vec2(
			cos(angle),
			sin(angle)
		);
		vec2 uvRot = rotate(uv + ofst, angle + radians(90.));

		// draw triangle
		col *= flip(
			stroke(polySDF(uvRot, 3), 0.18, .02),
			1.
		);
	}

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float bg = starSDF(uv, 16, .1);
	col += fill(bg, 1.3);

	float l = 0.;
	for (float i=0.; i< 8.; i++) {
		vec2 xy = rotate(uv, PI * 0.25 * i);
		xy.y -= .3;
		float tri = polySDF(xy, 3);
		col += fill(tri, .3);
		l += stroke(tri, .3, .03);
	}
	col *= 1. - l;
	float c = polySDF(uv, 8);
	col -= stroke(c, .15, .04);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

