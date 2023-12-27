shader_type spatial;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/03-death.gdshaderinc"

void vertex() {}

void fragment() {
	vec2 fUV = vec2(UV.x, 1.0 - UV.y);
	vec2 rUV = ratio(fUV, vec2(9, 16));
	ALBEDO.rgb = tarot_draw(rUV);
}