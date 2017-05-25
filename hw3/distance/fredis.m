function [ dis ] = fredis( namea, nameb )
%SDIS Summary of this function goes here
%   Detailed explanation goes here

[stream_a, a_sample_rate] = audioread(namea);
[stream_b, b_sample_rate] = audioread(nameb);

max_a = max(stream_a);
max_b = max(stream_b);
stream_a = stream_a / max_a;
stream_b = stream_b / max_b;

%选取较低的采样频率
if a_sample_rate > b_sample_rate
    a_sample_rate = b_sample_rate;
else
    b_sample_rate = a_sample_rate;
end

fft_a = abs(fft(stream_a,a_sample_rate));
x = 1:floor(length(fft_a) / 2);
fft_a = fft_a(1:floor(length(fft_a) / 2));
subplot(1,2,1);
plot(x,fft_a);title('frequency axis of a');

fft_b = abs(fft(stream_b,b_sample_rate));
x = 1:floor(length(fft_b) / 2);
fft_b = fft_b(1:floor(length(fft_b) / 2));
subplot(1,2,2);
plot(x,fft_b);title('frequency axis of b');

%minlen = (min(size(fft_a,2),size(fft_b,2)));
%MSE=sum((stream_a(1:minlen) - stream_b(1:minlen)).^2)/(minlen);  

%MSE=sum((fft_a - fft_b).^2)/(asrate);     
%PSNR=10*log10((255*255)/abs(MSE))      ;

dis = sum((fft_a - fft_b).^2);

end

