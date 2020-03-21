#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;

void main() {
  vec4 color1 = vec4(0.5, 0.2, 1.0, 1.0); // RGBA color
  vec4 color2 = color1.abgr;
  vec2 c = vec2(0.5, 0.5);
  float radius = 0.1;
  float dist = length(uv - c);
  if (dist > radius) {
    Target0 = color1;
  } else {
    Target0 = vec4(color2.bgr  * (cos(time) * 0.5 + 0.5), 0.5);
  }
}
