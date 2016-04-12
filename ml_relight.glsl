uniform float adsk_result_w;
uniform float adsk_result_h;
uniform sampler2D point;
uniform sampler2D norm;
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
	vec3 normals = vec3(0.0);
	vec3 dirVec = vec3(0.0);

	float distLength=0.0;
	float dist=0.0;
	float size=0.0;
	float result=0.0;
	float dotProduct = 0.0;


	if(useRGB)
		sampleColor=sampleRGB+offsetRGB;
	else
		sampleColor=texture2D(point, axis).rgb +offsetRGB ;

	position=texture2D(point,coords).rgb - sampleColor;
	normals=texture2D(norm,coords).rgb;
	position/=worldScale;
	dist=sqrt((position.x*position.x)+(position.y*position.y)+(position.z*position.z));
	dirVec=position/vec3(dist);
	dotProduct=(normals.r*dirVec.r)+(normals.g*dirVec.g)+(normals.b*dirVec.b);
	size=pow(1.0-(dist/globalMultiplier),radius)*(1.0-dotProduct);
	result=max(size,0.0);
	gl_FragColor = vec4(result);

	if(showSampleColor)
		gl_FragColor = vec4(sampleColor-offsetRGB,0.0);






}