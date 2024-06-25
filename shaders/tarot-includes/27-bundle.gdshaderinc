#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float d = polySDF(rotate(uv, radians(90)), 6);
	col += stroke(d, 0.6, 0.1);
	float ofst = 0.085;
	float size = 0.14;
	vec2 uvr = rotate(uv, radians(90));
	col += fill(polySDF(rotate(uv+ vec2(ofst , ofst * .8), radians(90)) , 6), size);
	col += fill(polySDF(rotate(uv+ vec2(-ofst, ofst * .8), radians(90)) , 6), size);
	col += fill(polySDF(rotate(uv+ vec2(0., -ofst), radians(90)) , 6), size);
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

