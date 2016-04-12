#version 120

uniform sampler2D frontTex,adsk_results_pass1;
uniform float adsk_result_w, adsk_result_h;
uniform float blurAmount;


vec3 GaussianBlur(sampler2D tex0, vec2 centreUV, vec2 pixelOffset)
{
   vec3 colOut = vec3(0,0,0);
   const int stepCount =2;
   //const float gWeights[stepCount]= 0.44908,0.05092};
   float gWeights[stepCount]=float[](0.44908,0.05092);
   float gOffsets[stepCount]=float[](0.53805,2.06278);

   for(int i =0;i<stepCount;i++)
   {
      vec2 texCoordOffset= gOffsets[i]*pixelOffset;
      vec3 col = texture2D(tex0,centreUV+texCoordOffset).xyz + texture2D(tex0, centreUV - texCoordOffset).xyz;
      colOut+= gWeights[i]*col;
   }
   return colOut;
}


void main()
{  
   vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
   float blurValue = blurAmount;


   vec3 finalColor = vec3(0.0);   

   finalColor=GaussianBlur(adsk_results_pass1,coords,vec2(0.0,blurValue));




   gl_FragColor = vec4(finalColor,0.0);
   

}
