% Devan Harnett
% 100998173 

% ELEC 4700 Harmonic Wave Equation in 2D FD and Modes 

global C 

Q = 1.60217653e-19;             % electron charge
hb = 1.054571596e-34;           % Dirac constant
h = hb * 2 * pi;                % Planck constant
Em = 9.10938215e-31;            % electron mass
Kb = 1.3806504e-23;             % Boltzmann constant
Eps = 8.854187817e-12;          % vacuum permittivity
mu = 1.2566370614e-6;           % vacuum permeability
C = 299792458;                  % speed of light
g = 9.80665;                    %metres (32.1740 ft) per s²

nx = 50; 
ny = 50; 

dx = 1;
dy = 1;
G = sparse(nx*ny,nx*ny);        %sparse matrix     
    
for i=1:nx
    for j=1:ny
        n=j+(i-1)*ny;
        if i==1 || j==1|| i==nx || j==ny
            G(n,n)=1;
        else
        n=j+(i-1)*ny;
        nxm=j+(i-2)*ny;
        nxp=j+i*ny;
        nym=(j-1)+(i-1)*ny;
        nyp=(j+1)+(i-1)*ny;
    G(n,n) = -4;
    G(n,nxm) = 1;
    G(n,nxp) = 1;
    G(n,nym) = 1;
    G(n,nyp) = 1; 
        end
    end
end

figure(1)
spy(G)
title ('Spy Plot of G values')
[E,D] = eigs(G,9,'SM');
figure(2)
eigenvalues = diag(D);
plot(eigenvalues)
title ('Eigenvalues')
eigenfunction = zeros(nx,ny,9);

for i = 1:nx
    for j = 1:ny
        n = j +(i-1)*ny;
        eigenfunction(i,j,:) = E(n,:);
    end
end

for i = 1:9
    figure(i+2)
    surf(eigenfunction(:,:,i))
end


