uniform sampler2D frontTex;
uniform float adsk_result_w, adsk_result_h;
uniform float blurAmount;


void main()
{
   vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
   float blurValue = blurAmount;
   int intPart = int( blurValue );
   vec3 accu = vec3(0);
   float energy = 0.0;

   vec3 finalColor = vec3(0.0);   

   accu = vec3(0);
   energy = 0.0;
   for( int x = -intPart; x <= intPart; x++)
   {
      for(int y=-intPart; y<=intPart; y++)
      {
	vec2 currentCoord = vec2(coords.x+float(x)/adsk_result_w,coords.y+float(y)/adsk_result_h);
	vec3 aSample = texture2D(frontTex, currentCoord).rgb;
	float asEnergy = 1.0 - length(vec2(float(x),float(y)))/blurValue;
	energy += asEnergy;
	accu += aSample * asEnergy;
      }
   }
   finalColor = accu/energy;


   gl_FragColor = vec4(finalColor,0.0);
   

}