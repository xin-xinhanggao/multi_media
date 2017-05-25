function [ dis ] = seqdis( namea, nameb )
%SDIS Summary of this function goes here
%   Detailed explanation goes here

[stream_a, a_sample_rate] = audioread(namea);
[stream_b, b_sample_rate] = audioread(nameb);

max_a = max(stream_a);
max_b = max(stream_b);
stream_a = stream_a / max_a;
stream_b = stream_b / max_b;


lena = size(stream_a,1);
lenb = size(stream_b,1);

minlen = lena;
if(lena > lenb)
    t = stream_a;
    stream_a = stream_b;
    stream_b = t;
    minlen = lenb;
end


minMSE = inf;
for i = 1 : abs(lena - lenb)+1
    MSE=sum((stream_a(1:minlen) - stream_b(i:i+minlen-1)).^2)/(minlen);  
    if MSE < minMSE
        minMSE = MSE;
    end
end

%MSE=sum((fft_a - fft_b).^2)/(asrate);     
%PSNR=10*log10((255*255)/abs(MSE))      

dis = minMSE;

end

