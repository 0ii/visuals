#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;


bool left(vec2 v) {
  return v.x < 0.5;
}

bool lower(vec2 v) {
  return v.y < 0.5;
}

void main() {
  vec4 color1 = vec4(0.5, 0.2, 1.0, 1.0); // RGBA color
  vec4 color2 = color1.abgr;

  if (left(uv) && lower(uv)) {
    // Point is on the inside
    Target0 = vec4(color2.bgr  * (cos(time) * 0.5 + 0.5), 0.5);
  } else {
    // Point is on the outside
    Target0 = color1;
  }
}
