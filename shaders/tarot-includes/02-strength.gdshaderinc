vec3 tarot_draw(vec2 uv) {
	return step(0.5 + 0.15 * cos(uv.y * 4.0), uv.x) * vec3(1.0, 1.0, 1.0);
}