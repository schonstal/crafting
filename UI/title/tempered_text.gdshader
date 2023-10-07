shader_type canvas_item;

uniform float fade_progress : hint_range(0., 1., 0.1);

void fragment() {
  COLOR = texture(TEXTURE, UV);
  COLOR.a = COLOR.a * smoothstep(0.2, 0.3, 1. - UV.x + 2. * fade_progress - 1.);
}
