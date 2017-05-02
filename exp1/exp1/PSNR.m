function [ psnr ] = PSNR(input, output)
    mse =  sum(sum((input - output).^2));
    mse = mse / (512 * 512);
    psnr = 10 * log10(255 * 255 / mse);
end

