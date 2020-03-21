#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;

void main() {
  if (uv.x > 0.5) {
    Target0 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    Target0 = vec4(uv, 1.0, 1.0);
  }
}
