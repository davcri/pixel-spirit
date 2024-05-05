#include "res://shaders/utils/utils.gdshaderinc"

uniform vec2 u_size; // size of the quad mesh

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);

	// top circles
	for (float i = 0.; i < 5.; i++) {
		col += stroke(circleSDF(uv + vec2(i * 0.185 - .365, 0.3)), .06, .04);
	}

	// vertical rects
	vec2 rectsize = vec2(.03, .55);
	vec2 rectsizeSmall = rectsize - vec2(0., .05);
	float topOfst = -.08;
	float topOfstSmall = topOfst + .05 * 0.5;
	// horizontal rect top
	col += fill(rectSDF(uv + vec2(0., .29 + topOfst), vec2(.86, .03)), 1.);
	// vertical rects left
	col += fill(rectSDF(uv + vec2(.415, topOfst), rectsize), 1.);
	col += fill(rectSDF(uv + vec2(.315, topOfstSmall), rectsizeSmall), 1.);
	// vertical rects right
	col += fill(rectSDF(uv + vec2(-.415, topOfst), rectsize), 1.);
	col += fill(rectSDF(uv + vec2(-.315, topOfstSmall), rectsizeSmall), 1.);
	// horizontal rect middle
	col += fill(rectSDF(uv + vec2(0., .15 + topOfst), vec2(.86, .03)), 1.) *
		step(.2, abs(distance(uv.x, 0.5)));

	// central symbols
	col += stroke(rhombSDF(rotate((uv + vec2(0., .16)) * vec2(1., 0.8), radians(90.))), .5, .1); // top
	col += stroke(rhombSDF(rotate((uv + vec2(0., -.07)) * vec2(1., 0.8), radians(90.))), .5, .1); // bottom
	col *= flip(fill(rectSDF(uv + vec2(0., -.1), vec2(rectsize.x, .7)), 1.), 1.);

	// cut diagonals
	vec2 diagonalRectSize = vec2(.03, .2);
	vec2 uvFlipX = vec2(1.-uv.x, uv.y);
	float diagonalTopOfset1 = 0.185;
	float diagonalTopOfst2 = 0.1;
	float diagonalTopOfst3 = -.32; //
	float diagonal = fill(rectSDF(rotate(uv + vec2(.35, diagonalTopOfst3), radians(60.)), diagonalRectSize), 1.); // bottom left diagonal
	diagonal += fill(rectSDF(rotate(uvFlipX + vec2(.35, diagonalTopOfst3), radians(60.)), diagonalRectSize), 1.); // bottom right diagonal
	diagonal += stroke(rhombSDF(rotate((uv + vec2(0., .16)) * vec2(1., 0.8), radians(90.))), .60, .1) * step(uv.y, .5) * step(.25, uv.y) * (step(.2, uv.x) * step(uv.x, .8));

	col *= flip(diagonal, 1.);
	//col += diagonal;

	return clamp(col, 0.0, 1.0);
}

