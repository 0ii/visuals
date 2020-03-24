#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;

float rand2D(in vec2 co){
      return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float rand3D(in vec3 co){
      return fract(sin(dot(co.xyz ,vec3(12.9898,78.233,144.7272))) * 43758.5453);
}


bool left(vec2 v) {
  return v.x < 0.5;
}

bool lower(vec2 v) {
  return v.y < 0.5;
}

void main() {
  vec4 color1 = vec4(0.5, 0.2, 1.0, 1.0); // RGBA color
  vec4 color2 = color1.abgr;

  float test = rand2D(uv);
  // Target0 = vec4(test, color1.rg, 1.0);

  vec2 v = mod(uv * time, 1.0);
  vec3 t = vec3(test, color1.rg);
  if (left(v) && lower(v)) {
    // Point is on the inside
    Target0 = vec4(t, 0.5);
  } else {
    // Point is on the outside
    Target0 = vec4(test, color1.rg, 1.0);
    // Target0 = color1;
  }
}
