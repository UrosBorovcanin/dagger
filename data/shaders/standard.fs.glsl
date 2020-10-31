#version 330 core
#extension GL_ARB_bindless_texture : enable
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_explicit_uniform_location : enable

layout (bindless_sampler, location = 10) uniform sampler2D textures[255];

in vec2 v_TextureCoord;
in vec4 v_QuadColor;
flat in float v_Image;

out vec4 o_FragColor;

void main()
{
	vec4 tex = texture(textures[int(v_Image)], v_TextureCoord);
	if(tex.a < 1) discard;

	o_FragColor = tex * v_QuadColor;
}