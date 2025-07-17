shader_type canvas_item;

uniform float progress: hint_range(0.0, 1.0, 0.05) = 0.0;
uniform float pixel_size = 10.0;

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}


void fragment() {
	vec2 uv = UV * pixel_size;
	vec2 ipos = floor(uv);
	if (COLOR.a != 0.0){
		COLOR.a = step(progress, random(ipos));
	}
}
