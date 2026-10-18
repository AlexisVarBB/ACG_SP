Shader "ACG/HologramShader"{
Properties{
    _rimColor("Rim Color", Color) = (1,1,1,1)
    _rimPower("Rim Power", Range(0,10)) = 0.5
}

SubShader{
    Tags{
        "Queue" = "Transparent"
    }
    CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        float4 _rimColor;
        fixed _rimPower;

        struct Input{
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o){
            half rim = 1 - dot(normalize(IN.viewDir), o.Normal);
            o.Emission = _rimColor.rgb * pow(rim, _rimPower);
            o.Alpha = pow(rim, _rimPower);
        }
        ENDCG
    }
    Fallback "Diffuse"
}