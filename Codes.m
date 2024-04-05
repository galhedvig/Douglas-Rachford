%Standard Douglas-Rachford using company's Bid-Ask Spread:

getd = @(p)path(p,path);
getd('toolbox_signal/');
getd('toolbox_general/');
n = 100;
p = round(n/4);
A = randn(p,n) / sqrt(p);
s = 17;
sel = randperm(n);
x0 = zeros(n,1); x0(sel(1:s))=1;
y = A*x0;
proxF = @(x,gamma)max(0,1-gamma./max(1e-15,abs(x))).*x;
t = linspace(-1,1);
plot(t, proxF(t,.3));
axis('equal');
pA = A'*(A*A')^(-1);
proxD = @(x,y)x + pA*(y-A*x);
mu = 1;
gamma = 1;
rproxF = @(x,lambda)2*proxF(x,lambda)-x;
rproxD = @(x,y)2*proxD(x,y)-x;
x = [0.02, 0.05, 0.03, 0.02, 0.04, 0.02, 0.05, 0.06, 0.01, 0.06];
y=[0.01, 0.01, 0.01 , 0.01, 0.01, 0.01, 0.01 , 0.01, 0.01 0.01];
niter = 500;
lun = []; err = [];
tx = zeros(n,1);
for i=1:niter
    tx = (1-mu/2)*tx + mu/2*rproxF( rproxD(tx,y),gamma );
    x = proxD(tx,y);
    lun(i) = norm(x,1);
    err(i) = norm(y-A*x);
end
clf;
plot(lun);
axis tight;


%The reversal version is when we interchange the order and instead of F
%and D, the order will be D and F:%

getd = @(p)path(p,path);
getd('toolbox_signal/');
getd('toolbox_general/');
n = 100;
p = round(n/4);
A = randn(p,n) / sqrt(p);
s = 17;
sel = randperm(n);
x0 = zeros(n,1); x0(sel(1:s))=1;
y = A*x0;
proxD = @(x,gamma)max(0,1-gamma./max(1e-15,abs(x))).*x;
t = linspace(-1,1);
plot(t, proxD(t,.3));
axis('equal');
pA = A'*(A*A')^(-1);
proxF = @(x,y)x + pA*(y-A*x);
mu = 1;
gamma = 1;
rproxD = @(x,lambda)2*proxD(x,lambda)-x;
rproxF = @(x,y)2*proxF(x,y)-x;
x = [0.02, 0.05, 0.03, 0.02, 0.04, 0.02, 0.05, 0.06, 0.01, 0.06];
y=[0.01, 0.01, 0.01 , 0.01, 0.01, 0.01, 0.01 , 0.01, 0.01 0.01];
niter = 500;
lun = []; err = [];
tx = zeros(n,1);
for i=1:niter
    tx = (1-mu/2)*tx + mu/2*rproxD( rproxF(tx,y),gamma );
    x = proxF(tx,y);
    lun(i) = norm(x,1);
    err(i) = norm(y-A*x);
end
clf;
plot(lun);
axis tight;


%Standard Douglas Rachford Algorithm for Foreign Exchange Rate (AUD/EUR):%
getd = @(p)path(p,path);
getd('toolbox_signal/');
getd('toolbox_general/');
n = 100;
p = round(n/4);
A = randn(p,n) / sqrt(p);
s = 17;
sel = randperm(n);
x0 = zeros(n,1); x0(sel(1:s))=1;
y = A*x0;
proxF = @(x,gamma)max(0,1-gamma./max(1e-15,abs(x))).*x;
t = linspace(-1,1);
plot(t, proxF(t,.3));
axis('equal');
pA = A'*(A*A')^(-1);
proxD = @(x,y)x + pA*(y-A*x);
mu = 1;
gamma = 1;
rproxF = @(x,lambda)2*proxF(x,lambda)-x;
rproxD = @(x,y)2*proxD(x,y)-x;
x = [0.000400, 0.000800, 0.001600, 0.000200, 0.001100, 0.002500, 0.001100, 0.001500, 0.000300, 0.000800];
y=[0.001, 0.001, 0.001 , 0.001, 0.001, 0.001, 0.001 , 0.001, 0.001 0.001];
niter = 1000;
lun = []; err = [];
tx = zeros(n,1);
for i=1:niter
    tx = (1-mu/2)*tx + mu/2*rproxF( rproxD(tx,y),gamma );
    x = proxD(tx,y);
    lun(i) = norm(x,1);
    err(i) = norm(y-A*x);
end
clf;
plot(lun);
axis tight;

%Reversed Douglas Rachford Algorithm for Foreign Exchange Rate (AUD/EUR):%
getd = @(p)path(p,path);
getd('toolbox_signal/');
getd('toolbox_general/');
n = 100;
p = round(n/4);
A = randn(p,n) / sqrt(p);
s = 17;
sel = randperm(n);
x0 = zeros(n,1); x0(sel(1:s))=1;
y = A*x0;
proxD = @(x,gamma)max(0,1-gamma./max(1e-15,abs(x))).*x;
t = linspace(-1,1);
plot(t, proxD(t,.3));
axis('equal');
pA = A'*(A*A')^(-1);
proxF = @(x,y)x + pA*(y-A*x);
mu = 1;
gamma = 1;
rproxD = @(x,lambda)2*proxD(x,lambda)-x;
rproxF = @(x,y)2*proxF(x,y)-x;
x = [0.000400, 0.000800, 0.001600, 0.000200, 0.001100, 0.002500, 0.001100, 0.001500, 0.000300, 0.000800];
y=[0.001, 0.001, 0.001 , 0.001, 0.001, 0.001, 0.001 , 0.001, 0.001 0.001];
niter = 1000;
lun = []; err = [];
tx = zeros(n,1);
for i=1:niter
    tx = (1-mu/2)*tx + mu/2*rproxD( rproxF(tx,y),gamma );
    x = proxF(tx,y);
    lun(i) = norm(x,1);
    err(i) = norm(y-A*x);
end
clf;
plot(lun);
axis tight;


