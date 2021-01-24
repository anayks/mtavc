float4 gNitroColor = float4(0,0,0,0);
float gTime : TIME;
float gSpeed = 1;


float4x4 gWorld : WORLD;
float4x4 gView : VIEW;
float4x4 gProjection : PROJECTION;


texture gTexture0           < string textureState="0,Texture"; >;


sampler texsampler = sampler_state
{
    Texture = (gTexture0);
};


struct VertexShaderInput
{
    float3 Position : POSITION0;
    float4 Diffuse : COLOR0;
    float2 TexCoords : TEXCOORD0;
};

struct PixelShaderInput
{
    float4 Position  : POSITION;
    float4 Diffuse : COLOR0;
    float2 TexCoords : TEXCOORD0;
};


PixelShaderInput VertexShaderFunction(VertexShaderInput In)
{
	PixelShaderInput Out = (PixelShaderInput)0;
	
	float4 posWorld = mul(float4(In.Position,1), gWorld);
	float4 posWorldView = mul(posWorld, gView);
	Out.Position = mul(posWorldView, gProjection);
	Out.TexCoords = In.TexCoords;
	
	float4 Color = gNitroColor;
	
	Color.a = 0;
	
	Out.Diffuse = saturate(Color);
	
	return Out;
}


float4 PixelShaderFunction(PixelShaderInput In) : COLOR0
{
	float4 texel = tex2D(texsampler, In.TexCoords);
	
	float4 finalColor = texel * In.Diffuse;
		
	finalColor *= 0.23;
	
	return finalColor;
}



technique nitro
{
    pass P0
    {
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader  = compile ps_2_0 PixelShaderFunction();
    }
}


technique fallback
{
    pass P0
    {
    }
}