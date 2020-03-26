#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;

bool left(vec2 v) {
  return v.x < 0.5;
}

bool right(vec2 v) {
  return v.x > 0.5;
}

bool lower(vec2 v) {
  return v.y < 0.5;
}

bool upper(vec2 v) {
  return v.y > 0.5;
}

void main() {
  vec4 color1 = vec4(0.5, 0.2, 1.0, 1.0); // RGBA color
  vec4 color2 = color1.abgr;

  if (left(uv) && lower(uv)) {
    // Point is on the inside
    Target0 = color1;
  } else if (right(uv) && upper(uv)) {
    // Point is on the outside
    Target0 = color1;
  } else {
    // Point is on the outside
    Target0 = color2;
  }
}
