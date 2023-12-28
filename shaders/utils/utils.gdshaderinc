float pwave(float x) {
	return (1.0 + cos(x)) * 0.5;
}

// https://lygia.xyz/space/aspect
vec2 aspect(vec2 st, vec2 s) {
    st.x = st.x * (s.x / s.y);
    return st;
}

// https://lygia.xyz/space/ratio
vec2 ratio(in vec2 v, in vec2 s) {
    return mix( vec2((v.x*s.x/s.y)-(s.x*.5-s.y*.5)/s.y,v.y),
                vec2(v.x,v.y*(s.y/s.x)-(s.y*.5-s.x*.5)/s.x),
                step(s.x,s.y));
}

// hyp: edge1 < edge2
float step_square(float edge1, float edge2, float x) {
	return step(edge1, x) * (1.0 - step(edge2, x));
}

float stroke(float v, float from, float width) {
	float d = step(from, v + 0.5 * width) - step(from, v - 0.5 * width);
	return clamp(d, 0.0, 1.0);
}

float fill(float x, float size) {
	return 1.0 - step(size, x);
}

float circleSDF(vec2 uv) {
	return length(uv - 0.5) * 2.0;
}

float rectSDF(vec2 uv, vec2 s) {
	uv = uv * 2.0 - 1.0;
	return max(abs(uv.x/s.x), abs(uv.y/s.y));
}

