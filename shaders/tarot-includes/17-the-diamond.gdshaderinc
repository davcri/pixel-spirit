#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float triangle = triangleSDF(uv + vec2(0.0, 0.18));
	float rhomb = rhombSDF(uv);
	col += stroke(rhomb, 0.8, 0.04);
	col += stroke(rhomb, 0.7, 0.04);
	col += fill(rhomb, 0.6);
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

