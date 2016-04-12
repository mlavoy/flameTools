//*****************************************************************************/
// 
// Filename: ImageLighting.1.glsl
//
// Copyright (c) 2013 Autodesk, Inc.
// All rights reserved.
// 
// This computer source code and related instructions and comments are the
// unpublished confidential and proprietary information of Autodesk, Inc.
// and are protected under applicable copyright and trade secret law.
// They may not be disclosed to, copied or used by any third party without
// the prior written consent of Autodesk, Inc.
//*****************************************************************************/

uniform float adsk_result_w, adsk_result_h;
uniform sampler2D front;
uniform vec2 lightAxis;
uniform vec3 lightColor;
uniform float lightIntensity;
uniform float lightDecay;



void main()
{
   vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
   
   //We set the Front RGB input into a vec3 to apply the light to it.
   vec3 resultColor = texture2D(front, coords).rgb;
   
   //We apply the light Axis(vec2), Color(vec3), Intensity(float) and Decay(float) to the input texture.
   resultColor = resultColor *
                 pow(1.0-clamp(length(coords-lightAxis),0.0,1.0),
                     lightDecay) *
                 lightColor * lightIntensity;
   

   //Here we combine the resulting RGB channels to a white matte, in order to get an RGBA output.
   gl_FragColor = vec4(resultColor, 1.0);
}
