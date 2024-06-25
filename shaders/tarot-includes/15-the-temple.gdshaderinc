#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	col += fill(triangleSDF(1. - uv), .6);
	col -= fill(triangleSDF(uv - vec2(0. , .15)), .3);
	// https://github.com/patriciogonzalezvivo/PixelSpiritDeck/blob/master/LICENSE
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

