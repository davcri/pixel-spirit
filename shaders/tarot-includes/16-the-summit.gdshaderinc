#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float triangle = triangleSDF(uv + vec2(0.0, 0.18));
	float triangleSize = 0.4;
	col += stroke(circleSDF(uv), 0.5, 0.075);
	col += fill(triangle, triangleSize);
	col *= flip(stroke(triangle, triangleSize, 0.1), 1.0);
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

