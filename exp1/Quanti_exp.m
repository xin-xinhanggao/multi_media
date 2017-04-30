Q = [16, 11, 10, 16, 24, 40, 51, 61;
     12, 12, 14, 19, 26, 58, 60, 55;
     14, 13, 16, 24, 40, 57, 69, 56;
     14, 17, 22, 29, 51, 87, 80, 62;
     18, 22, 37, 56, 68, 109, 103, 77;
     24, 35, 55, 64, 81, 104, 113, 92;
     49, 64, 78, 87, 103, 121, 120, 101;
     72, 92, 95, 98, 112, 100, 103, 99];
 
Cannon = [1, 1, 1, 2, 3, 6, 8, 10; 
        1, 1, 2, 3, 4, 8, 9, 8; 
        2, 2, 2, 3, 6, 8, 10, 8; 
        2, 2, 3, 4, 7, 12, 11, 9; 
        3, 3, 8, 11, 10, 16, 15, 11; 
        3, 5, 8, 10, 12, 15, 16, 13; 
        7, 10, 11, 12, 15, 17, 17, 14; 
        14, 13, 13, 15, 15, 14, 14, 14];

Nikon = [2, 1, 1, 2, 3, 5, 6, 7; 
        1, 1, 2, 2, 3, 7, 7, 7;  
        2, 2, 2, 3, 5, 7, 8, 7; 
        2, 2, 3, 3, 6, 10, 10, 7; 
        2, 3, 4, 7, 8, 13, 12, 9; 
        3, 4, 7, 8, 10, 12, 14, 11; 
        6, 8, 9, 10, 12, 15, 14, 12; 
        9, 11, 11, 12, 13, 12, 12, 12];

img = imread('lena.bmp');
img = imresize(img, [512,512]);
img_gray = rgb2gray(img);
imwrite(img_gray, 'gray.bmp');
img_gray = double(img_gray);

blocks = mat2cell(img_gray, ones(512/8, 1)*8, ones(512/8, 1)*8);
origin_encode = blocks;
encode_Q = blocks;
recover_cell = blocks;

for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        origin_encode{i, j} = dct2(blocks{i, j});
    end
end

% Using Q to adjust the encode
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        encode_Q{i, j} = round(origin_encode{i, j}./Q).*Q;
    end
end

psnr = 0;
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        recover_cell{i,j} = idct2(encode_Q{i,j});
        psnr = psnr + PSNR(recover_cell{i,j}, blocks{i,j});
    end
end

recover = cell2mat(recover_cell);
disp(PSNR(recover, img_gray));
recover = mat2gray(recover);
imwrite(recover, 'Qrecover.bmp');
disp(psnr / 64 / 64);

%calculate a * Q here
cnt = 1;
for a = 0.1 : 0.1 : 2
    for i = 1 : 1 : 512/8
        for j = 1 : 1 : 512/8
            encode_Q{i, j} = round(origin_encode{i, j}./(a*Q)).*(a*Q);
        end
    end
    for i = 1 : 1 : 512/8
        for j = 1 : 1 : 512/8
            recover_cell{i,j} = idct2(encode_Q{i,j});
        end
    end
    recover = cell2mat(recover_cell);
    psnr_arr(cnt) = PSNR(img_gray, recover);
    cnt = cnt + 1;
end

figure()
a = 0.1 : 0.1 : 2;
plot(a, psnr_arr);


% Using Cannon to adjust the encode
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        encode_Cannon{i, j} = round(origin_encode{i, j}./Cannon).*Cannon;
    end
end

psnr = 0;
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        recover_cell{i,j} = idct2(encode_Cannon{i,j});
        psnr = psnr + PSNR(recover_cell{i,j}, blocks{i,j});
    end
end

recover = cell2mat(recover_cell);
disp(PSNR(recover, img_gray));
recover = mat2gray(recover);
imwrite(recover, 'Cannonrecover.bmp');
disp(psnr / 64 / 64);

% Using Nikon to adjust the encode
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        encode_Nikon{i, j} = round(origin_encode{i, j}./Nikon).*Nikon;
    end
end

psnr = 0;
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        recover_cell{i,j} = idct2(encode_Nikon{i,j});
        psnr = psnr + PSNR(recover_cell{i,j}, blocks{i,j});
    end
end

recover = cell2mat(recover_cell);
disp(PSNR(recover, img_gray));
recover = mat2gray(recover);
imwrite(recover, 'Nikonrecover.bmp');
disp(psnr / 64 / 64);