baseX = 100;
baseY = 250;
SIZE = 16;
SRANGE = 50;

ori_img = imread('img/0.png');
img = rgb2gray(ori_img);
img = double(img);

base = img(baseX : baseX + SIZE - 1, baseY : baseY + SIZE - 1);
ori_img(baseX : baseX + SIZE - 1, baseY : baseY + SIZE - 1, 1 : 3) = 0;
imwrite(ori_img, 'result/base.png');

cnt = 1;

for rate = [1, 2, 4, 8]
	MSE  = 0;
	pos = [baseX, baseY];
	for i = 1 : 1 : 9
		ori_img = imread(strcat('img/',num2str(i),'.png'));
		img = rgb2gray(ori_img);
		img = double(img);
		[pos,cost] = pixelmatch(img, base, pos, rate);
		MSE = MSE + cost;
		if rate == 1
			mse_err(cnt) = cost;
			cnt = cnt + 1;
			ori_img(pos(1) : pos(1) + SIZE - 1, pos(2) : pos(2) + SIZE - 1, 1 : 3) = 0;
			imwrite(ori_img, strcat('result/pixelmatch',num2str(i),'.png'));
		end
	end 
	disp(strcat(num2str(rate * rate), ' pixel match : ', num2str(MSE / 9 / SIZE / SIZE)));
end

mse_err = mse_err / SIZE / SIZE;
figure()
a = 1 : 1 : 9;
plot(a, mse_err);

cnt = 1;
for rate = [1, 2, 4, 8]
	MSE  = 0;
	pos = [baseX, baseY];
	for i = 1 : 1 : 9
		ori_img = imread(strcat('img/',num2str(i),'.png'));
		img = rgb2gray(ori_img);
		img = double(img);
		[pos,cost] = dctmatch(img, base, pos, rate);
		MSE = MSE + cost;
		if rate == 1
			mse_err(cnt) = cost;
			cnt = cnt + 1;
			ori_img(pos(1) : pos(1) + SIZE - 1, pos(2) : pos(2) + SIZE - 1, 1 : 3) = 0;
			imwrite(ori_img, strcat('result/dctmatch',num2str(i),'.png'));
		end
	end 
	disp(strcat(num2str(rate * rate), ' dct match : ', num2str(MSE / 9 / SIZE / SIZE)));
end

mse_err = mse_err / SIZE / SIZE;
figure()
plot(a, mse_err);

MSE  = 0;
pos = [baseX, baseY];
for i = 1 : 1 : 9
	ori_img = imread(strcat('img/',num2str(i),'.png'));
	img = rgb2gray(ori_img);
	img = double(img);
	[pos,cost] = haarmatch(img, base, pos);
	MSE = MSE + cost;
	ori_img(pos(1) : pos(1) + SIZE - 1, pos(2) : pos(2) + SIZE - 1, 1 : 3) = 0;
	imwrite(ori_img, strcat('result/haarmatch',num2str(i),'.png'));
end 
disp(strcat(num2str(rate * rate), ' haar match : ', num2str(MSE / 9 / SIZE / SIZE)));