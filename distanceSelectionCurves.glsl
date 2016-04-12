float adsk_getLuminance ( vec3 rgb );
float adskEvalDynCurves( int curve, float x );
uniform int lumaCurve; 

uniform float adsk_result_w;
uniform float adsk_result_h;
uniform sampler2D front;
uniform vec2 axis;
uniform float lightDecay;
uniform float radius;
uniform float globalMultiplier;
uniform vec3 worldScale;
uniform bool showSampleColor;
uniform bool useRGB;
uniform vec3 sampleRGB;
uniform vec3 offsetRGB;



void main(void){
	vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
	vec3 sampleColor = vec3(0.0);
	vec3 position = vec3(0.0);
	float distLength=0.0;
	float dist=0.0;
	float size=0.0;
	float result=0.0;
	vec3 lumaResult=vec3(0.0);

	if(useRGB)
		sampleColor=sampleRGB+offsetRGB;
	else
		sampleColor=texture2D(front, axis).rgb;

	position=texture2D(front,coords).rgb - sampleColor;
	position/=worldScale;
	dist=sqrt((position.x*position.x)+(position.y*position.y)+(position.z*position.z));
	size=1.0-(dist/globalMultiplier/radius);
	result=max(size,0.0);
	lumaResult=vec3(result);

	// Extract Luminance from source using API function
	float lum = adsk_getLuminance(lumaResult);

	// Here I'm evluating the single Luma curve widget
	float newLum = adskEvalDynCurves(lumaCurve,lum);


	lumaResult *= lum > 0.0 ? newLum / lum : 0.0;

	gl_FragColor = vec4(lumaResult,lumaResult.r);

	if(showSampleColor)
		gl_FragColor = vec4(sampleColor,0.0);






}