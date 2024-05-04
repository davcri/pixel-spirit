#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	// rays
	float rays = fill(raysSDF(rotate(uv.xy, degrees(PI * 0.7)), 8), .2);
	vec2 cuv = uv * 2. - vec2(1.);
	float mask1 = fill(hexSDF(uv), .6);
	float mask2 = fill(hexSDF(uv), .2);
	col += rays;

	// polygon sdf
	float poly = polySDF(uv, 8);

	// external stroked polygon
	col += stroke(poly, .7, .12);
	// inner stroked polygon
	col += stroke(poly, .27, .05);

	// erase unneeded parts
	col *= flip(fill(poly, .25), 1.);
	col *= flip(stroke(poly, .3, .05), 1.);
	col *= flip(stroke(poly, .62, .05), 1.);
	col *= flip(fill(poly, .75), 0.);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float sdf = polySDF(uv.yx, 8);
	col += fill(sdf, .5);
	col *= stroke(raysSDF(uv, 8), .5, .2);
	col *= step(.27, sdf);
	col += stroke(sdf, .2, .05);
	col += stroke(sdf, .6, .1);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
