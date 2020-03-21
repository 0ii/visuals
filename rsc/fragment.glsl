#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;

void main() {
  vec2 c = vec2(0.5, 0.5);
  float radius = 0.1;
  float dist = length(uv - c);
  if (dist > radius) {
    Target0 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    Target0 = vec4(uv, 1.0, 1.0);
  }
}
