shader_type canvas_item;

uniform float progress: hint_range(0.0, 1.0) = 0.0;
// How jagged each band of melting pixels are
uniform float meltiness: hint_range(0.0, 16.0) = 1.0;
uniform vec3 color: source_color = vec3(0.133, 0.125, 0.212);
uniform float mix_value: hint_range(0.0, 1.0) = 1.0;

float psuedo_rand(float x) {
	return fract(x * 2048103.0 + cos(x * 1912.0));
}

void fragment() {
	vec2 uv = UV;

	// Move pixels near the top faster
	uv.y -= progress / UV.y;

	// Created jagged edges for each pixel on the x-axis
	uv.y -= progress * meltiness * psuedo_rand(UV.x - mod(UV.x, TEXTURE_PIXEL_SIZE.x));

	COLOR = texture(TEXTURE, uv);

	vec3 bnw = vec3((COLOR.x + COLOR.y + COLOR.z) / 3.0);
	vec3 new_color = mix(color, bnw, 0.15);
	COLOR.rgb = mix(COLOR.rgb, new_color, mix_value);
	// "delete" pixels out of range
	if (uv.y <= 0.0) {
		COLOR.a = 0.0;
	}
}
