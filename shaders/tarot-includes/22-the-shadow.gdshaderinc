#include "res://shaders/utils/utils.gdshaderinc"


vec3 myImpl(vec2 uv, vec3 col) {
	vec2 s = vec2(.45, .45); // size
	float ofst = 0.06;
	// rhomboid
	col += fill(rectSDF(rotate(uv + vec2(0., ofst), radians(-45)), s), 1.0);
	col += stroke(rectSDF(rotate(uv + vec2(0., -ofst), radians(-45)),s), 1.0, .04);
	col -= fill(rectSDF(rotate(uv + vec2(0., -ofst), radians(-45)), s - 0.009), 1.0);

	return clamp(col, vec3(0.), vec3(1.));;
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

