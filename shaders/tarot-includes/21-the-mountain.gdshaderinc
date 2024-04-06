#include "res://shaders/utils/utils.gdshaderinc"

const float OUTLINE_WIDTH = 0.02;

vec3 myImpl(vec2 uv, vec3 col) {
	vec2 rotUv = rotate(uv, radians(45));

	float romboSDF = rectSDF(rotUv, vec2(1.0));
	float square = fill(romboSDF, .3);
	float squareStroke = stroke(romboSDF, .3, OUTLINE_WIDTH);

	float dist = 0.14;
	// square L
	rotUv = rotate(uv + vec2(dist, 0.0), radians(45));
	float squareL = fill(rectSDF(rotUv, vec2(1.0)), .2);

	// square R
	rotUv = rotate(uv - vec2(dist, 0.0), radians(45));
	float squareR = fill(rectSDF(rotUv, vec2(1.0)), .2);

	col += clamp(square + squareL + squareR, 0., 1.);
	col = clamp(col - squareStroke, 0., 1.);
	//col = vec3(squareStroke);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	//col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

