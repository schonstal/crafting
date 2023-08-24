shader_type canvas_item;

uniform float force = 0.026;
uniform float speed = 1;
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {
  float mask = texture(TEXTURE, UV + TIME * speed).r;
  vec2 disp = normalize(UV) * force * mask;
  COLOR = texture(screen_texture, SCREEN_UV - disp);
}
