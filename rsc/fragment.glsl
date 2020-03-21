#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;

float get_area_rectangle(vec2 p0, vec2 p1) {
  float w = p0.x + p1.x;
  float h = p0.y + p1.y;
  return w * h;
}

float get_area_triangle(float p0, float p1) {
  return 0.5 * p0 * p1;
}

float get_sum_triangles(float t0, float t1, float t2, float t3) {
  return t0 + t1 + t2 + t3;
}

void main() {
  vec4 color1 = vec4(0.5, 0.2, 1.0, 1.0); // RGBA color
  vec4 color2 = color1.abgr;

  vec2 a = vec2(0.0, 0.0);
  vec2 b = vec2(0.5, 0.0);
  vec2 c = vec2(0.5, 0.5);
  vec2 d = vec2(0.0, 0.5);

  float area_rectangle = get_area_rectangle(a, c);
  float abp = get_area_triangle(length(a - uv), length(b - uv));
  float bcp = get_area_triangle(length(b - uv), length(c - uv));
  float cdp = get_area_triangle(length(c - uv), length(d - uv));
  float dap = get_area_triangle(length(d - uv), length(a - uv));

  float sum_tri = get_sum_triangles(abp, bcp, cdp, dap);

  if (sum_tri < area_rectangle) {
    Target0 = vec4(color2.bgr  * (cos(time) * 0.5 + 0.5), 0.5);
  } else {
    Target0 = color1;
  }

  // vec2 a = vec2(0.3, 0.7);
  // if (uv.x > a.x) {
  //   Target0 = color1;
  // } else {
  //   Target0 = vec4(color2.bgr  * (cos(time) * 0.5 + 0.5), 0.5);
  // }
  //
  // vec2 c = vec2(0.5, 0.5);
  // float radius = 0.1;
  // float dist = length(uv - c);
  // if (dist > radius) {
  //   Target0 = color1;
  // } else {
  //   Target0 = vec4(color2.bgr  * (cos(time) * 0.5 + 0.5), 0.5);
  // }
}
