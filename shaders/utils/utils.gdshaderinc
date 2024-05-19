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

// create outline
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

float crossSDF(vec2 uv, float s) {
	vec2 size = vec2(0.25, s);
	return min(rectSDF(uv, size.xy), rectSDF(uv, size.yx));
}

// pct: percentage/amount
float flip(float v, float pct) {
	return mix(v, 1.0 - v, pct);
}

// https://en.wikipedia.org/wiki/Vesica_piscis
float vesicaSDF(vec2 uv, float w) {
	vec2 offset = vec2(w * 0.5, 0.0);
	return max( circleSDF(uv - offset), circleSDF(uv + offset));
}

// equirectangular triangle
float triangleSDF(vec2 uv) {
	vec2 st = (uv * 2.0 - 1.0) * 2.0;
	return max(abs(st.x) * 0.866025 + st.y * 0.5, -st.y * 0.5);
}

float rhombSDF(vec2 st) {
	return max(
		triangleSDF(st),
		triangleSDF(vec2(st.x,1.-st.y)
	));
}

vec2 rotate(vec2 st, float angle) {
	mat2 m = mat2(
		vec2(cos(angle), -sin(angle)),
		vec2(sin(angle), cos(angle))
	);
	st = m * (st - vec2(0.5, 0.5));
	return st + vec2(0.5, 0.5);
}

float polySDF(vec2 uv, int V) {
	uv = uv *2. - 1.;
	float a = atan(uv.x, uv.y) + PI;
	float r = length(uv);
	float v = TAU / float(V);
	return cos(floor(.5 + a/v) * v-a)*r;
}

float hexSDF(vec2 uv) {
	uv = abs(uv * 2. - 1.);
	return max(abs(uv.y), uv.x * 0.866025 + uv.y * 0.5);
}

float raysSDF(vec2 uv, int N) {
	uv -= .5;
	return fract(atan(uv.y, uv.x)/ TAU * float(N));
}

float starSDF(vec2 uv, int V, float s) {
	uv = uv * 4. - 2.;
	float a = atan(uv.y, uv.x) / TAU;
	float seg = a * float(V);
	a = ((floor(seg) + 0.5) / float(V) +
		mix(s, -s, step(.5, fract(seg)))) * TAU;
	return abs(dot(vec2(cos(a), sin(a)), uv));
}

float heartSDF(vec2 uv) {
	uv -= vec2(.5, .8);
	float r = length(uv) * 5.;
	uv = normalize(uv);
	return r - ((uv.y * pow(abs(uv.x), 0.67)) /
		(uv.y + 1.5) - 2.0 * uv.y + 1.26);
}