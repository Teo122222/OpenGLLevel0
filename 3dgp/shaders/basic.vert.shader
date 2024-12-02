// VERTEX SHADER

#version 330

uniform mat4 matrixProjection;
uniform mat4 matrixModelView;
uniform vec3 material;

in vec3 aVertex;
in vec3 aNormal;

out vec4 color;

void main(void) 
{
  vec4 pos = matrixProjection * matrixModelView * vec4(aVertex, 1.0);
  gl_Position = pos;

  vec4 lightdir = vec4(1.0, 0.5, 1.0, 0.0);
  vec4 ambient = vec4(0.2, 0.2, 0.2, 1.0);

  vec3 N = normalize(mat3(matrixModelView) * aNormal);
  vec3 L = normalize(lightdir).xyz;
  float NdotL = max(dot(N, L), 0.0);
  color = vec4(material, 1) * (ambient + NdotL);
}
