#version 330 core
 in vec3 aPos;
 in ivec4 boneIds; 
 in vec4 weights;

 uniform mat4 lightSpaceMatrix;
 uniform mat4 model;
 uniform int type;

const int MAX_BONES = 100;
const int MAX_BONE_INFLUENCE = 4;
uniform mat4 boneTransforms[MAX_BONES];

void main()
{
    vec4 updatedPosition = vec4(0.0f);
    vec3 updatedNormal = vec3(0.0f);

    if(type == 5) {
        for(int i = 0 ; i < MAX_BONE_INFLUENCE ; i++)
        {
            // Current bone-weight pair is non-existing
            if(boneIds[i] == -1) 
                continue;

            // Ignore all bones over count MAX_BONES
            if(boneIds[i] >= MAX_BONES) 
            {
                updatedPosition = vec4(aPos,1.0f);
                break;
            }
            // Set pos
            vec4 localPosition = boneTransforms[boneIds[i]] * vec4(aPos,1.0f);
            updatedPosition += localPosition * weights[i];
        }
    } else {
        updatedPosition = vec4(aPos, 1.0f);
    }
    gl_Position = lightSpaceMatrix * model * updatedPosition;
}