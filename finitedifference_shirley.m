%This script solves the BVP u''(x)=10sin(20x)+cos(x^5) on (0,1) with u(0)=0
%and u(1)=0.1 by a finite difference method
%The function will be approximated at N+2 equally spaced points on (0,1)

%Set up the boundary conditions and forcing function of the ODE
fun= @(x) 10*sin(20*x)+cos(x.^5); %The forcing function of the ODE
u0=0; % BC u(0)=0
u1=0.1; % BC u(1)=0.1


N=100; %determines the number of interior points in the mesh on (0,1)

h=1/(N+1); %The gap between points in the mesh
mesh=h*(1:N)'; %column vector of all points in interior of mesh

%Calculate RHS of linear system, incorporating the Dirichlet BCs into linear approximation
f=[u0; fun(mesh); u1]; 

%Calculate the matrix arrising from discretation of u'' by
%(u_{n+1}-2u_n+u_{n-1})/h^2
A=(1/h^2)*spdiags([ones(N+2,1), -2*ones(N+2,1), ones(N+2,1)], -1:1, N+2, N+2 );

%Need to implement the Dirichlet BCs into A as well
A(1,1)=1; A(1,2)=0;
A(end,end)=1; A(end, end-1)=0;

u=A\f;%Solve Au=f to get approximation of u(x) at x_1, x_2,....,x_N

%Visulisation of the results including boundary points
plot([0;mesh;1],u)
title('FD solution of u"(x) =10sin(20x)+cos(x^5) with u(0)=0 and u(1)=0.1 ');
xlabel('x');
ylabel('u(x)');
axis([0,1,-0.12,0.12])
shg % brings figure to front