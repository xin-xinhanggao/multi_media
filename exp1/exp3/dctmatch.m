function [ best, cost ] = dctmatch(img, base, pos, rate)
	SIZE = 16;
	SRANGE = 20;
    H = size(img);
    W = H(2);
    H = H(1);
    best = [1,1];
    bestv = 1e8;
    mask = ones(SIZE, SIZE);
  	mask(SIZE / rate + 1 : SIZE, 1 : SIZE) = 0;
  	mask(1 : SIZE, SIZE /rate + 1 : SIZE) = 0;

	u = max(pos(1) - SRANGE, 1);
	d = min(pos(1) + SRANGE, H);
	l = max(pos(2) - SRANGE, 1);
	r = min(pos(2) + SRANGE, W);

	basedct = dct2(base);

	for i = u : 1 : d
		for j = l : 1 : r
			tmp = dct2(img(i: i + SIZE - 1, j : j + SIZE - 1));
			cost = sum(sum((tmp - basedct) .* (tmp - basedct) .* mask));
			if cost < bestv
				bestv = cost;
				best = [i,j];
			end
		end 
    end
   
    cost = img(best(1) : best(1) + SIZE - 1, best(2) : best(2) + SIZE - 1);
	cost = base - cost;
	cost = sum(sum(cost .* cost));
end

