shader_type canvas_item;

uniform sampler2D screen : hint_screen_texture;

vec4 overlay(vec4 base, vec4 blend){
  vec4 limit = step(0.5, base);
  return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

vec4 desaturate(vec3 color, float factor)
{
	vec3 lum = vec3(0.299, 0.587, 0.114);
	vec3 gray = vec3(dot(lum, color));
	return vec4(mix(color, gray, factor), 1.0);
}


void fragment()
{
  vec4 blend = texture(TEXTURE, UV);
  vec4 base = texture(screen, SCREEN_UV);
  vec4 result = overlay(base, desaturate(blend.rgb, 1.0) * 0.6);

  COLOR = result;
}