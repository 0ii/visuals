#version 150 core

layout (std140) uniform Uniforms {
    float time;
};

in vec2 uv;
out vec4 Target0;


float rectangle_area(vec2 a, vec2 b, vec2 d) {
  float w = distance(a, b);
  float h = distance(a, d);
  return w * h;
}

float triangle_area(vec2 a, vec2 b, vec2 p) {
  float base = distance(a, b);
  float height = sqrt( pow(distance(a, p), 2) - pow(0.5 * base, 2) );
  return 0.5 * base * height;
}


void main() {
  vec4 color1 = vec4(0.5, 0.2, 1.0, 1.0); // RGBA color
  vec4 color2 = color1.abgr;

  float side_len = 0.1;
  vec2 a = vec2(0.0, 0.0);
  vec2 b = vec2(side_len, 0.0);
  vec2 c = vec2(side_len, side_len);
  vec2 d = vec2(0.0, side_len);
  float area_ABCD = rectangle_area(a, b, d);

  float area_ABP = triangle_area(a, b, uv);
  float area_BCP = triangle_area(b, c, uv);
  float area_CDP = triangle_area(c, d, uv);
  float area_DAP = triangle_area(d, a, uv);

  float triangle_area_sum = area_ABP + area_BCP + area_CDP + area_DAP;


  float err = 0.01;
  if (abs(triangle_area_sum - area_ABCD) < err) {
    // Point is on the inside
    Target0 = vec4(color2.bgr  * (cos(time) * 0.5 + 0.5), 0.5);
  } else {
    // Point is on the outside
    Target0 = color1;
  }
}
