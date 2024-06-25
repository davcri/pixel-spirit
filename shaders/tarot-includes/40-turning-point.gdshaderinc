#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float tri = polySDF(rotate(uv, radians(180)) - vec2(.13, .09), 3);
	float triR = polySDF(uv - vec2(.13, .09), 3);
	float triUp = step(.55, rotate(uv, radians(60.)).y);
	//col += triUp;

	col += stroke(tri, .25, .08);
	//col += stroke(triR, .25, .08);

	col = bridge(col, triUp * triR, .1, .3);

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
