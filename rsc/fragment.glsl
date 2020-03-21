#version 150 core

layout (std140) uniform Dim {
    float time;
};

out vec4 Target0;

void main() {
  // ignore everything about color and use white
  Target0 = vec4(vec3(1.0, 1.0, 1.0)  * (cos(time) * 0.5 + 0.5), 1.0);
}
