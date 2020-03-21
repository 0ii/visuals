#version 150 core

layout (std140) uniform Dim {
    float u_Rate;
};

out vec4 Target0;

void main() {
  // ignore everything about color and use white
  Target0 = vec4(vec3(1.0, 1.0, 1.0)  * u_Rate, 1.0);
}
