function [ output ] = choose_max_coe_block(proportion, coe)
    blocks = mat2cell(coe, ones(512/8, 1) * 8, ones(512/8, 1) * 8);
    order = floor(8 * 8 * proportion);
    for i = 1 : 1 : 512/8
        for j = 1 : 1 : 512/8
            vec = blocks{i, j}';
            vec = abs(vec(:));
            vec = sort(vec, 'descend');
            order_value = vec(order);

            for row = 1 : 1 : 8
                for col = 1 : 1 : 8
                    if abs(blocks{i, j}(row, col)) < order_value
                        blocks{i, j}(row, col) = 0;
                    end
                end
            end
            temp{i, j} = idct2(blocks{i, j});
        end
    end
    output = cell2mat(temp);
end


