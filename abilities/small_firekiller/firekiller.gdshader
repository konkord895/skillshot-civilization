shader_type canvas_item;

uniform float slider: hint_range(0.0, 100.0) = 0.0;

void fragment() {
	if (UV.x > slider)
	{
		COLOR.a = 0.0;
	}
}
