#include "res://shaders/utils/utils.gdshaderinc"


vec3 myImpl(vec2 uv, vec3 col) {
	uv += vec2(-0.06, 0.0);
	uv = rotate(uv, -0.5);
	col += fill(triangleSDF(uv), 0.5);
	col -= fill(triangleSDF(uv * vec2(0.4, 1.0) + vec2(0.3, 0.2)), 0.3);
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	uv = rotate(uv, radians(-25.));
	float sdf = triangleSDF(uv);
	sdf /= triangleSDF(uv + vec2(0.0, 0.2));
	col += fill(abs(sdf), 0.56);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

