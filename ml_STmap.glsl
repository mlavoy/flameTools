uniform float adsk_result_w;
uniform float adsk_result_h;
uniform sampler2D front;
uniform sampler2D back;

void main(void){
	vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
	vec3 uvImage = vec3(0.0);
	uvImage=texture2D(front,coords).rgb;
	vec3 texture = vec3(0.0);
	texture=texture2D(back,uvImage.rg);
	gl_FragColor= vec4(texture,0.0);
}