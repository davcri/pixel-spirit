#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(.0);
	float rectSDF = rectSDF(uv, vec2(1.));
	float crossSDF = crossSDF(uv, 1.0);

	col += fill(rectSDF, 0.5); // draw a white square
	col *= step(0.5, fract(crossSDF * 4.0)); // draw the L shaped line patterns
	col *= step(1.0, crossSDF); // clear the internal part
	col += fill(crossSDF, 0.5); // draw the internal white cross
	col += stroke(rectSDF, .65, .05); // draw the inner bounding rect stroke
	col += stroke(rectSDF, .75, .025); // draw the outer bounding rect stroke

	return clamp(col, 0.0, 1.0);
}

vec3 myTarotImpl(vec2 uv) {
	// central cross
	vec3 centralCross = vec3(0.);
	float cw = 0.13; // cross width
	float cl = 0.25; // cross length
	centralCross += stroke(uv.x, 0.5, cw) * step_square(0.5 - cl, 0.5 + cl, uv.y);
	centralCross += stroke(uv.y, 0.5, cw) * step_square(0.5 - cl, 0.5 + cl, uv.x);

	// rect outlines
	float rect = rectSDF(uv, vec2(1.));
	vec3 outlines = vec3(0.);
	outlines += stroke(rect, 0.68, 0.015);
	outlines += stroke(rect, 0.6, 0.04);

	// deco: L-shaped lines
	float s = 0.013; // size
	float m = s * 2.; // margin
	vec2 dist = vec2(0.26, 0.26);
	vec3 deco = vec3(0.);

	vec2 corners[4] = {
		vec2(uv.x, uv.y),
		vec2(1.0 - uv.x, uv.y),
		vec2(1.0 - uv.x, 1.0 - uv.y),
		vec2(uv.x, 1.0 - uv.y)
	};

	for (int c = 0; c < 4; c++) {
		vec2 sUv = corners[c]; // simmetric UV
		// bottom left
		for (int i = 0; i < 4; i++) {
			float fi = float(i);
			float ll = s * (1.0 + 2. * fi); // line length
			float bot = dist.y - s * 0.5;
			float top = dist.y + ll - s * 0.5;
			// vertical stroke
			deco += stroke(sUv.x, dist.x + m * float(i), s) * step_square(bot, top, sUv.y);
			// h stroke
			deco += stroke(sUv.y, dist.y + m * float(i), s) * step_square(bot, top, sUv.x);
		}
	}
	return outlines + centralCross + deco;
}
