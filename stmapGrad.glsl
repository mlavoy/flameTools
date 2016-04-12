uniform float adsk_result_w;
uniform float adsk_result_h;

void main(void){
	vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );

	// Just blank out the B chan to prevent garbage
	gl_FragColor.b = 0.0;

	//gl_FragColor.r = gl_FragColor.x / adsk_result_w;
	//gl_FragColor.g = gl_FragColor.y / adsk_result_h;

	gl_FragColor.rg=coords;
}