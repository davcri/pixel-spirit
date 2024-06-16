shader_type canvas_item;

// https://tympanus.net/codrops/2024/06/12/shape-lens-blur-effect-with-sdfs-and-webgl/

uniform vec2 u_size;
uniform vec2 u_mouse;
uniform float u_mouse_inertia;
uniform float u_time;

float sdRoundRect(vec2 p, vec2 b, float r) {
  vec2 d = abs(p - 0.5) * 4.2 - b + vec2(r);
  return min(max(d.x, d.y), 0.0) + length(max(d, 0.0)) - r;
}
/* Signed distance drawing methods from lygia shader library:
- https://lygia.xyz/draw/fill
- https://lygia.xyz/draw/stroke
 */
float stroke(float x, float size, float w, float edge) {
    float d = smoothstep(size - edge, size + edge, x + w * 0.5) - smoothstep(size - edge, size + edge, x - w * 0.5);
    return clamp(d, 0.0, 1.0);
}
float fill(float x, float size, float edge) {
    return 1.0 - smoothstep(size - edge, size + edge, x);
}

float sdCircle(in vec2 st, in vec2 center) {
  return length(st - center) * 2.0;
}

void fragment() {
    float circleSize = 0.52;
    float circleEdge = 0.3;
	float size= 1.;
	float roundness = .2;
	float borderSize = .1;

    float sdfCircle = fill(
        sdCircle(UV, u_mouse),
        circleSize,
        circleEdge
    );

	float sdf = sdRoundRect(UV, vec2(size), roundness);
	sdf = stroke(sdf, 0.0, borderSize, sdfCircle * (.2 + 0.05 * cos(u_time * 0.003))) * 4.;

	COLOR.rgb = vec3(sdf);
	COLOR.a = 1.;
}
