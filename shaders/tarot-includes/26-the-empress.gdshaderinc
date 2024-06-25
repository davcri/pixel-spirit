#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	vec2 flippedUv = rotate(uv, radians(180.));
	float sdf = polySDF(uv, 5);
	float flippedSdf = polySDF(flippedUv, 5);

	float start_range = 0.8;
	col += fill(sdf, start_range + 0.02);
	float space = 0.12;
	col -= stroke(sdf, start_range - 1.4 * space, space);
	col -= stroke(sdf, start_range - 3.5 * space, space);
	col -= stroke(sdf, start_range - 5. * space, space * 0.7);
	col -= stroke(flippedSdf, .5, space * 0.7);
	col -= stroke(flippedSdf, .3, space * 0.8);
	col -= fill(flippedSdf, 0.15);

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

