shader_type spatial;

#include "res://shaders/tarot-includes/01-justice.gdshaderinc"

void fragment() {
	vec2 fUV = vec2(UV.x, 1.0 - UV.y);
	ALBEDO.rgb = tarot_draw(fUV);
}