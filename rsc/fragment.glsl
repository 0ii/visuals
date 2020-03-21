#version 150 core

uniform sampler2D t_Texture;
in vec2 v_Uv;
in vec4 v_Color;
out vec4 Target0;

layout (std140) uniform Globals {
    mat4 u_MVP;
};

layout (std140) uniform Dim {
    float u_Rate;
};

void main() {
  //texture function takes a
  //  1. sampler - thing that holds a texture that you can read pixels out of it
  //  2. u,v coord - coord to read out of that texture
  // v_Color - input from vertex shader
  // u Rate - a uniform, it is a uniform input that is the same for all vertices. a constant
  // each frame gets a new u_Rate, but is constant on a per frame basis
    Target0 = texture(t_Texture, v_Uv) * v_Color * u_Rate;
    Target0.a = 1.0;
}

// a candidate or potential pixel
// pixels are rgb values in the buffer
// your going to get fragments and combine them int eh buffer by the compositor
// the alpha value determines how the compositor, blends that frag into a final actual pixel
