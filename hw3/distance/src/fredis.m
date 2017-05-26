function [ dis ] = fredis( namea, nameb )

[stream_a, a_sample_rate] = audioread(namea);
[stream_b, b_sample_rate] = audioread(nameb);

max_a = max(stream_a);
max_b = max(stream_b);
stream_a = stream_a / max_a;
stream_b = stream_b / max_b;

if a_sample_rate > b_sample_rate
    a_sample_rate = b_sample_rate;
else
    b_sample_rate = a_sample_rate;
end

fft_a = abs(fft(stream_a,a_sample_rate));
x = 1:floor(length(fft_a) / 2);
fft_a = fft_a(1:floor(length(fft_a) / 2));
fft_a_max = max(fft_a);
fft_a = fft_a / fft_a_max;

fft_b = abs(fft(stream_b,b_sample_rate));
x = 1:floor(length(fft_b) / 2);
fft_b = fft_b(1:floor(length(fft_b) / 2));
fft_b_max = max(fft_b);
fft_b = fft_b / fft_b_max;

dis = sum((fft_a - fft_b).^2);

end

