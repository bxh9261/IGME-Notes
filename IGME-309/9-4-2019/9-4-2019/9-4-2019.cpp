
#include <iostream>

int main()
{
    std::cout << "Hello World!\n";
}

/*
*make your code readable*
in glm::vec3 we will use x,y,z and r,g,b (point location and what colour is it)
it also has p,s,t but we probably won't use that
x=r=p
y=g=s
z=b=t
it's a union, data location of shown variables is the same
look up vertex shader and fragment shader we'll be using them

Vertex shader code:

#version 330

in vec3 positionBuffer;

void main(){

	gl_position = vec4(positionBuffer, 1.0);

}

Fragment shader code:

#version 330

out vec4 fragment

void main(){

fragment = vec4(0.0,1.0,0.0,1.0);
return;

}
//this runs on EVERY pixel

#version 330
layout (location = 0) in vec3 Position_b;
layout (location = 1) in vec3 Color_b;
out vec3 Color;
void main(){
	gl_Position = vec4(Position_b, 1);
	Color = Color_b;
}
*/