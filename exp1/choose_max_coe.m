function [ output ] = choose_max_coe(proportion, coe)
    size = 512;
    order = floor(size * size * proportion);
    vec = coe';
    vec = abs(vec(:));
    vec = sort(vec, 'descend');
    order_value = vec(order);

    for i = 1 : size 
        for j = 1 : size
        	value = coe(i, j);
            if abs(value) < order_value 
                value = 0;
            end
            output(i, j) = value;
        end
    end
end


