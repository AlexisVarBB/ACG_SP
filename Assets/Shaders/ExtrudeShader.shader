Shader "ACG/ExtrudeShader"
{
    Properties{
        _MainTex("Texture", 2D) = "white" {}
        _ExtrudeAmount("Extrude Amplitude", Range(0, 1)) = 0.05
        _Speed("Breathing Speed", Range(0, 10)) = 3.0
    }

    SubShader{
        CGPROGRAM
            #pragma surface surf Lambert vertex:vert

            struct Input{
                float2 uv_MainTex;
            };

            struct appdata{
                float4 vertex: POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0; 
            };

            float _ExtrudeAmount;
            float _Speed;
            sampler2D _MainTex;

            void vert(inout appdata v){
                float respiracion = sin(_Time.y * _Speed);
                v.vertex.xyz += v.normal * (respiracion * _ExtrudeAmount);
            }

            void surf(Input IN, inout SurfaceOutput o){
                o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            }
        ENDCG
    }
}