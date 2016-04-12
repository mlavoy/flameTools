uniform float adsk_result_w;
uniform float adsk_result_h;
uniform sampler2D lay0RGB,lay0A,lay1RGB,lay1A,lay2RGB,lay2A;

uniform vec3 sample1Color;
uniform vec3 sample2Color;
uniform vec3 sample3Color;
uniform vec3 sample4Color;
uniform vec3 sample5Color;
uniform vec3 sample6Color;
uniform vec3 sample7Color;
uniform vec3 sample8Color;
uniform vec3 sample9Color;
uniform vec3 sample10Color;
uniform vec3 sample11Color;
uniform vec3 sample12Color;
uniform vec3 sample13Color;
uniform vec3 sample14Color;
uniform vec3 sample15Color;

uniform float sample1Mult;
uniform float sample2Mult;
uniform float sample3Mult;
uniform float sample4Mult;
uniform float sample5Mult;
uniform float sample6Mult;
uniform float sample7Mult;
uniform float sample8Mult;
uniform float sample9Mult;
uniform float sample10Mult;
uniform float sample11Mult;
uniform float sample12Mult;
uniform float sample13Mult;
uniform float sample14Mult;
uniform float sample15Mult;

uniform int channelSelect1;
uniform int channelSelect2;
uniform int channelSelect3;
uniform int channelSelect4;
uniform int channelSelect5;
uniform int channelSelect6;
uniform int channelSelect7;
uniform int channelSelect8;
uniform int channelSelect9;
uniform int channelSelect10;
uniform int channelSelect11;
uniform int channelSelect12;
uniform int channelSelect13;
uniform int channelSelect14;
uniform int channelSelect15;

uniform int sampColor1;

uniform bool showRGB;


vec3 getChannel(int ChannelSel)
{
	vec3 chanColor= vec3(0.0);
	if( ChannelSel == 0)    
		chanColor = vec3(1.0);
	else if ( ChannelSel == 1)
		chanColor = vec3(1.0,0.0,0.0);
	else if ( ChannelSel == 2)
		chanColor = vec3(0.0,1.0,0.0);
	else if ( ChannelSel == 3)
		chanColor = vec3(0.0,0.0,1.0);
		
	return chanColor;
}

vec3 samplerResult(vec3 sampRGB, vec3 layer0RGB, float layer0A, vec3 layer1RGB, float layer1A, vec3 layer2RGB, float layer2A, float sampMult)
{
	vec3 result=vec3(0.0); 
	vec3 chanColor=vec3(0.0);
	if(sampRGB.r>0.0)
		result = (sampRGB.r == layer0RGB.r) ? vec3(layer0RGB.g) : vec3(0.0);
		result += (sampRGB.r == layer0RGB.b) ? vec3(layer0A) : vec3(0.0);
		result += (sampRGB.r == layer1RGB.r) ? vec3(layer1RGB.g) : vec3(0.0);
		result += (sampRGB.r == layer1RGB.b) ? vec3(layer1A) : vec3(0.0);
		result += (sampRGB.r == layer2RGB.r) ? vec3(layer2RGB.g) : vec3(0.0);
		result += (sampRGB.r == layer2RGB.b) ? vec3(layer2A) : vec3(0.0);
		result *= sampMult;
		return vec3(result.r);
}

void main(void){
	vec2 coords = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h );
	vec3 startImage = vec3(0.0);
	float matteColor = 0.0;
	vec3 result1 = vec3(0.0);
	vec3 result2 = vec3(0.0);
	vec3 result3 = vec3(0.0);
	vec3 result4 = vec3(0.0);
	vec3 result5 = vec3(0.0);
	vec3 result6 = vec3(0.0);
	vec3 result7 = vec3(0.0);
	vec3 result8 = vec3(0.0);
	vec3 result9 = vec3(0.0);
	vec3 result10 = vec3(0.0);
	vec3 result11 = vec3(0.0);
	vec3 result12 = vec3(0.0);
	vec3 result13 = vec3(0.0);
	vec3 result14 = vec3(0.0);
	vec3 result15 = vec3(0.0);

	vec3 front = vec3(0.0);
	vec3 layer0RGB = vec3(0.0);
	float layer0A = 0.0;
	vec3 layer1RGB = vec3(0.0);
	float layer1A = 0.0;
	vec3 layer2RGB = vec3(0.0);
	float layer2A = 0.0;	
	float outR = 0.0;	
	float outG = 0.0;
	float outB = 0.0;
	float outA = 0.0;
	float sum=0.0;
	vec3 outRGB = vec3(0.0);

	layer0RGB=texture2D(lay0RGB,coords).rgb;
	layer0A=texture2D(lay0A,coords).r;
	layer1RGB=texture2D(lay1RGB,coords).rgb;
	layer1A=texture2D(lay1A,coords).r;
	layer2RGB=texture2D(lay2RGB,coords).rgb;
	layer2A=texture2D(lay2A,coords).r;


	if(showRGB)
		startImage=texture2D(lay0RGB,coords).rgb;
	else
		startImage=vec3(0.0);

	result1=samplerResult(sample1Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample1Mult);
	result2=samplerResult(sample2Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample2Mult);
	result3=samplerResult(sample3Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample3Mult);
	result4=samplerResult(sample4Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample4Mult);
	result5=samplerResult(sample5Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample5Mult);
	result6=samplerResult(sample6Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample6Mult);
	result7=samplerResult(sample7Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample7Mult);
	result8=samplerResult(sample8Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample8Mult);
	result9=samplerResult(sample9Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample9Mult);
	result10=samplerResult(sample10Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample10Mult);
	result11=samplerResult(sample11Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample11Mult);
	result12=samplerResult(sample12Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample12Mult);
	result13=samplerResult(sample13Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample13Mult);
	result14=samplerResult(sample14Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample14Mult);
	result15=samplerResult(sample15Color, layer0RGB, layer0A, layer1RGB, layer1A, layer2RGB, layer2A, sample15Mult);

	sum=result1.r + result2.r + result3.r + result4.r + result5.r + result6.r + result7.r + result8.r + result9.r + result10.r + result11.r + result12.r + result13.r + result14.r + result15.r;

	result1*= getChannel(channelSelect1);
	result2*= getChannel(channelSelect2);
	result3*= getChannel(channelSelect3);
	result4*= getChannel(channelSelect4);
	result5*= getChannel(channelSelect5);
	result6*= getChannel(channelSelect6);
	result7*= getChannel(channelSelect7);
	result8*= getChannel(channelSelect8);
	result9*= getChannel(channelSelect9);
	result10*= getChannel(channelSelect10);
	result11*= getChannel(channelSelect11);
	result12*= getChannel(channelSelect12);
	result13*= getChannel(channelSelect13);
	result14*= getChannel(channelSelect14);	
	result15*= getChannel(channelSelect15);			

	outRGB=result1 + result2 + result3 + result4 + result5 + result6 + result7 + result8 + result9 + result10 + result10 + result11 + result12 + result13 + result14 + result15 + startImage * (1.0-sum);

	//gl_FragColor = vec4(outR , outG , outB , outA);
	gl_FragColor = vec4(outRGB , sum);

}
