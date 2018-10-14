%This script solves the BVP u''(x)=10sin(20x)+cos(x^5) on (0,1) with u(0)=0
%and u(1)=1 by a finite difference method
%The function will be approximated at N+2 equally spaced points on (0,1)

%Set up the boundary conditions and forcing function of the ODE
fun= @(x) 10*sin(20*x)+cos(x.^5); %The forcing function of the ODE
u0=0;
u1=0.1;


N=1000; %determines the number of interior points in the mesh on (0,1)

h=1/(N+1); %The gap between points in the mesh
mesh=h*(1:N)'; %column vector of all points in interior of mesh

%Calculate RHS of linear system
f=fun(mesh);
%These two lines incorporate the boundary conditions into linear approximation
f(1)=f(1)-(1/h^2)*u0;
f(N)=f(N)-(1/h^2)*u1;

%Calculate the matrix arrising from discretation of u'' by
%(u_{n+1}-2u_n+u_{n-1})/h^2
A=(1/h^2)*spdiags([ones(N,1), -2*ones(N,1), ones(N,1)], -1:1, N, N );

u=A\f;%Solve Au=f to get approximation of u(x) at x_1, x_2,....,x_N

%Visulisation of the results including boundary points
plot([0;mesh;1],[u0;u;u1])
title('Plot of u(x)');
xlabel('x');
ylabel('u(x)');
axis([0,1,-0.12,0.12])