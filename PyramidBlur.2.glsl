float adskEvalDynCurves( int curve, float x );
uniform int lumaCurve; 

uniform sampler2D frontTex,adsk_results_pass1;
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
   for( int y = -intPart; y <= intPart; y++)
   {
      vec2 currentCoord = vec2(coords.x, coords.y+float(y)/adsk_result_h);
      vec3 aSample = texture2D(adsk_results_pass1, currentCoord).rgb;
      float anEnergy =   adskEvalDynCurves(lumaCurve,1.0 - ( abs(float(y)) / blurValue ));
      float asEnergy = 1.0 - ( abs(float(y)) / blurValue );
      energy += asEnergy;
      accu += aSample * (anEnergy/asEnergy);
   }
   finalColor = accu/energy;

                     
   gl_FragColor = vec4(finalColor,0.0);
}
