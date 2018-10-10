function CS6640_Week6
%

BASE = 25;

% Set up an example function: 
%    sin of frequency 1

Fs = 8;
T = 1/Fs;
L = 8;
t = (0:L-1)*T;
f = sin(2*pi*t);

W = zeros(8,8);

% For u = 0, for x = 0:7
%   get [e^(-j*2*pi*0*x/8)
W(1,:) = CS6640_basis_FT1D(0,8);

% For u = 1, for x = 0:7
%   get [e^(-j*2*pi*1*x/8)
W(2,:) = CS6640_basis_FT1D(1,8);

W(3,:) = CS6640_basis_FT1D(2,8);
W(4,:) = CS6640_basis_FT1D(3,8);
W(5,:) = CS6640_basis_FT1D(4,8);
W(6,:) = CS6640_basis_FT1D(5,8);
W(7,:) = CS6640_basis_FT1D(6,8);
W(8,:) = CS6640_basis_FT1D(7,8);

figure(1);
clf
plot([0:7],f);
hold on
plot([0:7],f,'ro');
axis equal

figure(2);
clf
plot(0,0,'w.');
hold on
plot([0:7],BASE+W(1,:));
plot([0:7],BASE+W(1,:),'ko');

plot([0:7],BASE-2+real(W(2,:)));
plot([0:7],BASE-2+real(W(2,:)),'ko');
plot([0:7],BASE-2+imag(W(2,:)),'r');
plot([0:7],BASE-2+imag(W(2,:)),'ro');

plot([0:7],BASE-5+real(W(3,:)),'k');
plot([0:7],BASE-5+real(W(3,:)),'ko');
plot([0:7],BASE-5+imag(W(3,:)),'r');
plot([0:7],BASE-5+imag(W(3,:)),'ro');

plot([0:7],BASE-8+real(W(4,:)),'k');
plot([0:7],BASE-8+real(W(4,:)),'ko');
plot([0:7],BASE-8+imag(W(4,:)),'r');
plot([0:7],BASE-8+imag(W(4,:)),'ro');

plot([0:7],BASE-11+real(W(5,:)),'k');
plot([0:7],BASE-11+real(W(5,:)),'ko');
plot([0:7],BASE-11+imag(W(5,:)),'r');
plot([0:7],BASE-11+imag(W(5,:)),'ro');

plot([0:7],BASE-14+real(W(6,:)),'k');
plot([0:7],BASE-14+real(W(6,:)),'ko');
plot([0:7],BASE-14+imag(W(6,:)),'r');
plot([0:7],BASE-14+imag(W(6,:)),'ro');

plot([0:7],BASE-17+real(W(7,:)),'k');
plot([0:7],BASE-17+real(W(7,:)),'ko');
plot([0:7],BASE-17+imag(W(7,:)),'r');
plot([0:7],BASE-17+imag(W(7,:)),'ro');

plot([0:7],BASE-20+real(W(8,:)),'k');
plot([0:7],BASE-20+real(W(8,:)),'ko');
plot([0:7],BASE-20+imag(W(8,:)),'r');
plot([0:7],BASE-20+imag(W(8,:)),'ro');

figure(3);
clf
pv = (f.*W(2,:))';
v = zeros(8,1);
plot(-1,-1,'w.');
hold on
plot(1,5,'w.');
for s = 2:8
    v(s) = v(s-1) + pv(s);
    plot([real(v(s-1)),real(v(s))],[imag(v(s-1)),imag(v(s))],'k');
    tch = 0;
end
plot(real(v(8)),imag(v(8)),'ro');
text(real(v(8))-0.4,imag(v(8))+0.5,'0.0 + 4.0i','color','blue');
F = zeros(8,1);
for p = 1:8
    F(p) = sum((f.*W(p,:))');
end

Ffft = fft(f)'

figure(4);
clf
plot([0:7],sqrt(real(F).^2+imag(F).^2));
hold on
plot([0:7],sqrt(real(F).^2+imag(F).^2),'ko');

% 2D

figure(5);
clf

W = CS6640_basis_FT(0,1,8,8);

imshow(imresize(mat2gray(real(W)),[101,101]));
imshow(imresize(mat2gray(imag(W)),[101,101]));

tch = 0;

