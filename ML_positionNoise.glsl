uniform sampler2D frontTex;
uniform float adsk_result_w, adsk_result_h;
uniform float noiseScale;


void main()
{
   vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
   float ns = noiseScale;
   coords*=ns;
   vec3 noiseValue = noise3(coords,ns).rgb;


   gl_FragColor = vec4(noiseValue,0.0);
   

}