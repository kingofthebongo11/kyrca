clear
a = -10;
b = 30;
pm = 0.3;
N = 40;
H = rand(N, 1)*(b-a)+a;
it = 25;
fun = @(x)-4*x+7*x.^2-11/3*x.^3+25;
for k=1:it
    h=H;
    y=fun(h);
    p = randint(N,1,[1 N]);
    hh = h(p)
    pc = rand(N/2, 1);
    for i=1:N/2
        hh(2*i-1:2*i)=[hh(2*i-1)*pc(i)+hh(2*i)*(1-pc(i)) hh(2*i-1)*(1-pc(i))+hh(2*i)*pc(i)];
        hh(2*i-1:2*i);
    end
    P01 = rand(N,1);
    I = find(P01<=pm);
    hh(I) = rand(numel(I), 1)*(b-a)+a;
    yy=fun(hh);
    h_hh = [h; hh];
    y_yy = [y; yy];
    [so soi] = sort(y_yy);
    so';
    soi';
    for i=1:2*N
      end
    H=h_hh(soi(1:N));
end

fprintf('Number of iterations = %i\n', it)
fprintf('X_min = %.6f\n', H(1))
fprintf('f_min = %.6f\n', fun(H(1)))