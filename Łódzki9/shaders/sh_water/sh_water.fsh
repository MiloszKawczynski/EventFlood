//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelH;
uniform float pixelW;
uniform float time;
uniform float fizzle;

void main()
{
	vec2 p = v_vTexcoord;
	floa py = 1.0 - p.y;
	float pixelIsIn = (p.x / pixelW);
	p.y = p.y + ((sin((pixelIsIn*0.1) + time)*(1.5*pixelH)) * py);
	p.y = p.y + ((sin((pixelIsIn*0.15) - time*1.2)*(1.5*pixelH)) * py);
	p.y = max(p.y,0.0);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, p );
}
