shader_type canvas_item;

uniform float progress : hint_range(-1.0,2.0) = 0.0;
uniform float width : hint_range(0.0,2.0) = 1;

uniform sampler2D noise_texture;
uniform sampler2D colorCurve;
uniform float angle = 1.0;

varying vec2 FULL_UV;

float inverse_lerp(float a, float b, float v){
  return (v-a)/(b-a);
}

void vertex() {
  FULL_UV = UV;
}

void fragment() {
  vec2 full_uv = UV;
  
  float noise = texture(noise_texture, FULL_UV).y;
  float mask = inverse_lerp(
    1.0 - progress,
    (1.0 + width) - progress,
    FULL_UV.y
  );
  float value = clamp(mask + noise, 0.0, 1.0);
  
  vec4 curve_value = texture(colorCurve,vec2(value));
  COLOR = mix(COLOR, curve_value, value);
  COLOR.a = min(texture(TEXTURE,UV).a,COLOR.a);
}