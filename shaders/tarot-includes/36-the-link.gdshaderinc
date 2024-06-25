#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	// top and bottom rhomb decorations
	col += fill(rhombSDF(uv + vec2(0., 0.45)), .12);
	col += fill(rhombSDF(uv - vec2(0., 0.45)), .12);

	uv = uv.yx;
	uv.x = mix(1.- uv.x, uv.x, step(.5, uv.y));

	float left = rectSDF(rotate(uv+ vec2(.1, 0.), radians(45.)) , vec2(.5));
	col += stroke(left, .5, .1);
	float right = rectSDF(rotate(uv + vec2(-.1, 0.), radians(45.)), vec2(.5));
	col = bridge(col, right, .5, .1);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	// https://github.com/patriciogonzalezvivo/PixelSpiritDeck/blob/master/LICENSE
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	//col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
