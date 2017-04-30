img = imread('lena.bmp');
img = imresize(img, [512,512]);
img_gray = rgb2gray(img);
imwrite(img_gray, 'gray.bmp');
img_gray = double(img_gray);

tic;
%1-DCT First row then column 
row_encode = dct(img_gray'); %row
col_encode = dct(row_encode'); %column
encode1 = col_encode;

%recover the 1-DCT
col_decode = idct(col_encode);
row_decode = idct(col_decode');
recover = row_decode';
recover_img = mat2gray(recover);
toc;
psnr = PSNR(img_gray, recover);
disp(psnr);
imwrite(recover_img, 'recover1DCT.bmp');

tic;
%encode 2D-DCT
encode = dct2(img_gray);
encode2 = encode;
%decode 2D-DCT
decode = idct2(encode);
recover_img = mat2gray(decode);
toc;
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, 'recover2DCT.bmp');

%encode 8 * 8 2D-DCT
tic;
blocks = mat2cell(gray, ones(512 / 8, 1) * 8, ones(512 /8, 1) * 8);
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        temp{i, j} = dct2(blocks{i, j});
    end
end
encode = cell2mat(temp);
encode3 = encode;
%decode 8 * 8 cell
de_blocks = mat2cell(encode, ones(512 / 8, 1) * 8, ones(512 / 8, 1) * 8);
for i = 1 : 1 : 512/8
    for j = 1 : 1 : 512/8
        de_temp{i, j} = idct2(de_blocks{i, j});
    end
end
decode = cell2mat(de_temp);
recover_img = mat2gray(decode);
toc;
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, 'recover8*82DCT.bmp');

coe = choose_max_coe(1/4, encode1);
decode = idct(coe);
decode = idct(decode');
decode = decode';
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '1D_reserve_0.25.bmp');

coe = choose_max_coe(1/16, encode1);
decode = idct(coe);
decode = idct(decode');
decode = decode';
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '1D_reserve_0.0625.bmp');

coe = choose_max_coe(1/64, encode1);
decode = idct(coe);
decode = idct(decode');
decode = decode';
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '1D_reserve_0.015625.bmp');

coe = choose_max_coe(1/4, encode2);
decode = idct2(coe);
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '2D_reserve_0.25.bmp');

coe = choose_max_coe(1/16, encode2);
decode = idct2(coe);
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '2D_reserve_0.0625.bmp');

coe = choose_max_coe(1/64, encode2);
decode = idct2(coe);
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '2D_reserve_0.015625.bmp');

decode = choose_max_coe_block(1 / 4, encode3);
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '2D8*8_reserve_0.25.bmp');

decode = choose_max_coe_block(1 / 16, encode3);
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '2D8*8_reserve_0.0625.bmp');

decode = choose_max_coe_block(1 / 64, encode3);
recover_img = mat2gray(decode);
psnr = PSNR(img_gray, decode);
disp(psnr);
imwrite(recover_img, '2D8*8_reserve_0.015625.bmp');