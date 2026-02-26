// GlitchVFX.hx - Custom shader for Psych Engine V0.7.0 source code specifically.
// You may need to change some code for other versions.
// Script written by EchoingOverfreeze.

// Instructions:
// Put this file in source/shaders.
// Run the shader in any state you wish using FlxG.camera.setFilter.

// You should read the HaxeFlixel, Lime, and OpenFL documentation to clearly understand what to do.

package shaders;

import flixel.system.FlxAssets.FlxShader;

class ScanlinesShader extends FlxShader
{
    @:glFragmentSource("
        // Author: EchoingOverfreeze
        // Title: BasicScanlineShader

        #pragma header

        uniform float u_time;

        void main() {
            vec2 uv = openfl_TextureCoordv;
            
            vec4 col = flixel_texture2D(bitmap, uv);
            
            float speed = 5.0;
            float freq = 500.0;
            
            float scanline = sin(uv.y * freq + u_time * 10.0);
            
            float intensity = smoothstep(-1.0, 1.0, scanline);
            intensity = mix(0.8, 1.0, intensity);
            
            gl_FragColor = col * intensity;
        }
    ")

    public function new()
    {
        super();
    }
}
