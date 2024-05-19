#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
    uv.y = 1.-uv.y;

    float s = .25;
    float t1 = polySDF(uv+vec2(.0,.175),3);
    float t2 = polySDF(uv+vec2(.1,.0),3);
    float t3 = polySDF(uv-vec2(.1,.0),3);

    col += stroke(t1, s, .08) +
		stroke(t2, s, .08) +
		stroke(t3, s, .08);

    float bridges = mix(mix(t1,t2,step(.5,uv.y)),
                        mix(t3,t2,step(.5,uv.y)),
                        step(.5,uv.x));

    col = bridge(col, bridges, s, .08);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
