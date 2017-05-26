function y = prodis(wav1, wav2)
	histogram1 = zeros(500/20, 1);
	for i = 1:length(wav1)
		tmp = ceil(wav1(i)/20);
		histogram1(tmp) = histogram1(tmp) + 1;
	end
	histogram1 = histogram1 / sum(histogram1);
	histogram2 = zeros(500/20, 1);
	for i = 1:length(wav2)
		tmp = ceil(wav2(i)/20);
		histogram2(tmp) = histogram2(tmp) + 1;
	end
	histogram2 = histogram2 / sum(histogram2);
	y = norm(histogram1 - histogram2);
end

