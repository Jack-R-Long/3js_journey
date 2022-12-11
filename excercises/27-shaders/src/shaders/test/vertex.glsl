uniform vec2 uFrequency;
uniform float uTime;
uniform vec3 uColor;

varying vec2 vUv;
varying float vElevation;


void main()
{
    vec4 modelPosition = vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    modelPosition.y *= 0.66;

    // modelPosition.z += elevation;

    vec4 viewPosition = viewMatrix * modelPosition;

    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;
    vUv = uv;

    vElevation = elevation;

}
