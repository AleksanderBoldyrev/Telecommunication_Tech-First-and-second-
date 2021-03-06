x = [0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0];
y = [1 0 1];

xx = x;
yy = [];
for i = 1:length(y)
    if (y(i) == 1)
        yy(i) = 1;
    else
        yy(i) = -1;
    end
end

for i = 1:length(x)
    if(i > length(y))
       yy(i) = 0;
    end
end

R = [];
BR = [];

tic
for i = 1:length(xx)
    R(i) = sum(xx .* circshift(yy, i-1, 2)) / length(xx);
end
toc

tic
xx = fft(xx);
yy = fft(yy);
xx = conj(xx);
BR = ifft(xx .* yy)/length(xx);
toc