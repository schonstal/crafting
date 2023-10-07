shader_type canvas_item;

uniform vec4 heat_color : source_color = vec4(1.);
uniform vec4 background_color : source_color = vec4(0.);
uniform float progress : hint_range(0., 1., 0.01);

void fragment() {
  COLOR.rgb = mix(heat_color.rgb, background_color.rgb, 1. - UV.y + 2. * progress - 1.);
  COLOR.a = background_color.a;
}
