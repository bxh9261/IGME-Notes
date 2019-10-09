//can be changed to cubes instead of cones (line 39 in AppClass -- AddCubeToRenderList)

/*
Bug in the engine:

on SetPositionTargetAndUpward (line 121 in MyCamera)

in one function it adds position, in another (CalculateViewMatrix line 132) it subtracts. in accessors it's only set

just make the up a vector going up

functions can be added ye
*/

int main() 
{
	int rocks;

	rocks++;
}






/*
class framework
	init variables
	...

math
	vectors -- 2d, 3d, 4d

	matrices -- scale, transform, rotate, euler, rodriguez, axis, angle

	quaternions
	gimbal lock
	vector spaces
	interpolation
		LERP
		SLERP

anything from DSA 1????

time-based programming
*/