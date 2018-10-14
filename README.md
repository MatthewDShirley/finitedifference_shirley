# finitedifference_shirley
Matlab code to solve a Boundary Value Problem using a finite difference method

The code is  to solve the BVP u''(x) = 10sin(20x) + cos(x^5) with u(0)=0 and 
u(1)=0.1

The script will calculate solution for a mesh with N+2 points and will plot
the solution.

The size of the mesh can be altered by changing N,
The boundary values can be changed by altering u0 and u1,
A different forcing function can also be added by changing the definition of fun.

