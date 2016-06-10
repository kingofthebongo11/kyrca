clear all

w = rand(3,1)*2-1;
x = [0 0 1 1; 0 1 0 1; 1 1 1 1]';
d = [0 0 0 1]';
y = zeros(4,1);
eps = zeros(4,1);
eta = 0.2
cyc = 0;
epohs = 100000; 
tic
while true
    for ij=1:4
        S=x(ij,:)*w;
        y(ij)=1/(1+exp(-S));
        delta=(d(ij)-y(ij))*y(ij)*(1-y(ij));
        w=w+eta*delta*x(ij,:)';
        eps(ij)=1/2*(d(ij)-y(ij))^2;
    end
    cyc=cyc+1; 
    if ((cyc>epohs)||(sum(eps)<0.0001)), break, end
    
end
w, cyc, d, y, toc