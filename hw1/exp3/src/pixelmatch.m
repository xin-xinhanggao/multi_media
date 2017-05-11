function [ best, cost ] = pixelmatch(img, base, pos, rate)
	SIZE = 16;
	SRANGE = 20;
    H = size(img);
    W = H(2);
    H = H(1);
    best = [1,1];
    bestv = 1e8;
    mask = zeros(SIZE, SIZE);

    for i = 1 : 1 : SIZE / rate
	    for j = 1 : 1 : SIZE / rate
	        mask(i * rate,j * rate) = 1; 
	    end
	end

	u = max(pos(1) - SRANGE, 1);
	d = min(pos(1) + SRANGE, H);
	l = max(pos(2) - SRANGE, 1);
	r = min(pos(2) + SRANGE, W);

	for i = u : 1 : d
		for j = l : 1 : r
			tmp = img(i: i + SIZE - 1, j : j + SIZE - 1);
			cost = sum(sum((tmp - base) .* (tmp - base) .* mask));
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

