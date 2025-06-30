shader_type canvas_item;

uniform vec3 color: source_color = vec3(0.0);
uniform float mixness: hint_range(0.0, 1.0, 0.1) = 0.5;

void fragment() {
	vec3 bnw = vec3((COLOR.x + COLOR.y + COLOR.z) / 3.0);
	vec3 new_color = mix(color, bnw, mixness);
	COLOR.rgb = new_color;
}
