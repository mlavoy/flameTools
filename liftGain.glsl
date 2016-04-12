uniform float adsk_result_w;
uniform float adsk_result_h;
uniform sampler2D input1;

uniform	float lift;
uniform float gain;

void main(void){
	vec2 st;
	st.x = gl_FragColor.x / adsk_result_w;
	st.y = gl_FragColor.y / adsk_result_h;

	gl_FragColor = (texture2D(input1,st) * gain) + lift;
}