shader_type spatial;

#include "res://shaders/extra/01-feba.gdshaderinc"

void fragment() {
	vec2 fUV = vec2(UV.x, 1.0 - UV.y);
	vec2 rUV = ratio(fUV, u_size);
	ALBEDO.rgb = tarot_draw(rUV);
	ALPHA = ALBEDO.r;
}
