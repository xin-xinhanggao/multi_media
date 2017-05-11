function [ best, cost ] = haarmatch(img, base, pos)
	SIZE = 16;
	SRANGE = 20;
    H = size(img);
    W = H(2);
    H = H(1);
    best = [1,1];
    bestv = 1e8;

	u = max(pos(1) - SRANGE, 1);
	d = min(pos(1) + SRANGE, H);
	l = max(pos(2) - SRANGE, 1);
	r = min(pos(2) + SRANGE, W);

	[a0,h0,v0,d0] = haart2(base);

	for i = u : 1 : d
		for j = l : 1 : r
			[ta,th,tv,td] = haart2(img(i: i + SIZE - 1, j : j + SIZE - 1));
			cost = abs(a0 - ta);
			%deltah = abs(th{1,1} - h0{1,1});
			%cost = cost + sum(sum(deltah));
			cost = cost + abs(th{1,2} - h0{1,2});

			%deltav = abs(tv{1,1} - v0{1,1});
			%cost = cost + abs(sum(sum(deltav)));
			cost = cost + abs(tv{1,2} - v0{1,2});

			%deltad = abs(td{1,1} - d0{1,1});
			%cost = cost + abs(sum(sum(deltad)));
			cost = cost + abs(td{1,2} - d0{1,2});

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

