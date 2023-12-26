//shader_type canvas_item;

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
