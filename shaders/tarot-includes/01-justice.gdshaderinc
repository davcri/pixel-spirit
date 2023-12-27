vec3 tarot_draw(vec2 uv) {
	return step(0.5, uv.x) * vec3(1.0, 1.0, 1.0);
}