#version 150 core

in vec2 a_Pos;
in vec2 a_Uv;

in vec4 a_Src;
in vec4 a_TCol1;
in vec4 a_TCol2;
in vec4 a_TCol3;
in vec4 a_TCol4;
in vec4 a_Color;

layout (std140) uniform Globals {
    mat4 u_MVP;
};

out vec2 v_Uv;    // coordinates in texture space
out vec4 v_Color;

// 1. compute gl_Position
// 2. compute any special outputs needed by the fragment(pixel) shader
// can caluclate any date you want in frag shader, or calc in vertex and pass it to the frag shader
// frag shader runs more times than the vertex shader
void main() {
    v_Uv = a_Uv * a_Src.zw + a_Src.xy;    // doing the texture coord calc
    v_Color = a_Color;  // passing color straight through to vertex shader (a is a per vertex attribute)
    mat4 instance_transform = mat4(a_TCol1, a_TCol2, a_TCol3, a_TCol4);
    vec4 position = instance_transform * vec4(a_Pos, 0.0, 1.0);

    // gl_Position = u_MVP * position;   // special var, where the transformed vertex is
    gl_Position = vec4(a_Pos, 0.0, 1.0);
    // z - 0
    // homogenous coord - add w component that is used somehow to make projections work. 1 is the normal value

}
