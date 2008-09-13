varying vec3 vNormal;
varying vec3 vLightDirection;
varying float distance;
varying vec3 vPos;

//This vertex shader is meant to perform the per vertex operations of per pixel lighting
//using a single directional light source.
void main()
{
   const float MAX_DISTANCE = 750.0;

   // make normal and light dir in world space like the gl_vertex
   vNormal = normalize(gl_Normal);
   vLightDirection = normalize(vec3(gl_ModelViewMatrixInverse * gl_LightSource[0].position));   

   //Pass the texture coordinate on through.
   gl_TexCoord[0] = gl_MultiTexCoord0;   

   //Calculate the distance from this vertex to the camera.
   vec4 ecPosition = gl_ModelViewMatrix * gl_Vertex;
   vec3 ecPosition3 = vec3(ecPosition) / ecPosition.w;
   distance = length(ecPosition3);      

   //Compute the final vertex position in clip space.
   gl_Position = ftransform();  
}