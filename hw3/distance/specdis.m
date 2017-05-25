function [ dis ] = specdis( namea, nameb )
%SDIS2 Summary of this function goes here
%   Detailed explanation goes here

[stream_a, a_sample_rate] = audioread(namea);
[stream_b, b_sample_rate] = audioread(nameb);


max_a = max(stream_a);
max_b = max(stream_b);
stream_a = stream_a / max_a;
stream_b = stream_b / max_b;

[Sa,Fa,Ta,Pa] = spectrogram(stream_a,256,128,1024,a_sample_rate);
[Sb,Fb,Tb,Pb] = spectrogram(stream_b,256,128,1024,b_sample_rate);

%Sa = real(Sa)
%Sb = real(Sb);

widtha = size(Sa,2);
[height , widthb] = size(Sb);

minwid = widtha;
if(widtha > widthb)
    t = Sa;
    Sa = Sb;
    Sb = t;
    minwid = widthb;
end
%Sa - Sb(:,1:1+minwid-1)

minMSE = inf;
for i = 1 : abs(widtha - widthb)+1
    MSE=sum(sum(abs(Sa - Sb(:,i:i+minwid-1))))/(height * minwid);     %???
    %PSNR=10*log10((255*255)/abs(MSE));           %?????
    if MSE < minMSE
        minMSE = MSE;
    end
end

subplot(1,2,1);
specgram(stream_a, 256, a_sample_rate);title('spectogram axis of a');
subplot(1,2,2);
specgram(stream_b, 256, b_sample_rate);title('spectogram axis of b');

dis = minMSE;

end

