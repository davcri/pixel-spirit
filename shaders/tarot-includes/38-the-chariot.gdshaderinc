#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float w = .1;
	float r1 = rectSDF(uv, vec2(1.));
	float r2 = rectSDF(rotate(uv, radians(45.)), vec2(1.));
	float diag = step(.5, (uv.x + uv.y) * .5);
	diag = flip(diag, step(.5, .5 + (uv.x - uv.y) * .5));
	col += stroke(r1, .5, w) + stroke(r2, .5, w);
	col = bridge(col, mix(r1, r2, diag), .5, w);
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	// https://github.com/patriciogonzalezvivo/PixelSpiritDeck/blob/master/LICENSE
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
