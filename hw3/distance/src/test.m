clear;

addpath(genpath('tools'));
fs = 16000;

guodegang_0 = fxrapt(audioread('material/guodegang/guodegang.wav'), fs); 
guodegang_1 = fxrapt(audioread('material/guodegang/guodegang_2.028.wav'), fs);
guodegang_2 = fxrapt(audioread('material/guodegang/guodegang_1.1251.wav'), fs);
guodegang_3 = fxrapt(audioread('material/guodegang/guodegang_1.5336.wav'), fs);
guodegang_result =[
      meandis(guodegang_0, guodegang_1), meandis(guodegang_0, guodegang_2), meandis(guodegang_0, guodegang_3);
      prodis(guodegang_0, guodegang_1), prodis(guodegang_0, guodegang_2), prodis(guodegang_0, guodegang_3);
      fredis('material/guodegang/guodegang.wav','material/guodegang/guodegang_2.028.wav'), fredis('material/guodegang/guodegang.wav','material/guodegang/guodegang_1.1251.wav'), fredis('material/guodegang/guodegang.wav','material/guodegang/guodegang_1.5336.wav');
      ];

disp('guodegang_result');
disp(guodegang_result);


shantianfang_0 = fxrapt(audioread('material/shantianfang/shantianfang.wav'), fs); 
shantianfang_1 = fxrapt(audioread('material/shantianfang/shantianfang_2.028.wav'), fs);
shantianfang_2 = fxrapt(audioread('material/shantianfang/shantianfang_2.2914.wav'), fs);
shantianfang_3 = fxrapt(audioread('material/shantianfang/shantianfang_0.629.wav'), fs);
shantianfang_result =[
      meandis(shantianfang_0, shantianfang_1), meandis(shantianfang_0, shantianfang_2), meandis(shantianfang_0, shantianfang_3);
      prodis(shantianfang_0, shantianfang_1), prodis(shantianfang_0, shantianfang_2), prodis(shantianfang_0, shantianfang_3);
      fredis('material/shantianfang/shantianfang.wav','material/shantianfang/shantianfang_2.028.wav'), fredis('material/shantianfang/shantianfang.wav','material/shantianfang/shantianfang_2.2914.wav'), fredis('material/shantianfang/shantianfang.wav','material/shantianfang/shantianfang_0.629.wav');
      ];

disp('shantianfang_result');
disp(shantianfang_result);



sen6000_0 = fxrapt(audioread('material/sen6000/Asen6000.wav'), fs);
sen6000_1 = fxrapt(audioread('material/sen6000/newAsen6000.wav'), fs);
sen6000_2 = fxrapt(audioread('material/sen6000/Bsen6000.wav'), fs);

sen6015_0 = fxrapt(audioread('material/sen6015/Asen6015.wav'), fs);
sen6015_1 = fxrapt(audioread('material/sen6015/newAsen6015.wav'), fs);
sen6015_2 = fxrapt(audioread('material/sen6015/Bsen6015.wav'), fs);

sen6028_0 = fxrapt(audioread('material/sen6028/Asen6028.wav'), fs);
sen6028_1 = fxrapt(audioread('material/sen6028/newAsen6028.wav'), fs);
sen6028_2 = fxrapt(audioread('material/sen6028/Bsen6028.wav'), fs);

sen6044_0 = fxrapt(audioread('material/sen6044/Asen6044.wav'), fs);
sen6044_1 = fxrapt(audioread('material/sen6044/newAsen6044.wav'), fs);
sen6044_2 = fxrapt(audioread('material/sen6044/Bsen6044.wav'), fs);

sen6147_0 = fxrapt(audioread('material/sen6147/Asen6147.wav'), fs);
sen6147_1 = fxrapt(audioread('material/sen6147/newAsen6147.wav'), fs);
sen6147_2 = fxrapt(audioread('material/sen6147/Bsen6147.wav'), fs);

mean_result =[
            meandis(sen6000_0, sen6000_2), meandis(sen6000_1, sen6000_2);
            meandis(sen6015_0, sen6015_2), meandis(sen6015_1, sen6015_2);
            meandis(sen6028_0, sen6028_2), meandis(sen6028_1, sen6028_2);
            meandis(sen6044_0, sen6044_2), meandis(sen6044_1, sen6044_2);
            meandis(sen6147_0, sen6147_2), meandis(sen6147_1, sen6147_2);
      ];

disp('mean_dis');
disp(mean_result);

pros_result =[
            prodis(sen6000_0, sen6000_2), prodis(sen6000_1, sen6000_2);
            prodis(sen6015_0, sen6015_2), prodis(sen6015_1, sen6015_2);
            prodis(sen6028_0, sen6028_2), prodis(sen6028_1, sen6028_2);
            prodis(sen6044_0, sen6044_2), prodis(sen6044_1, sen6044_2);
            prodis(sen6147_0, sen6147_2), prodis(sen6147_1, sen6147_2);
      ];

disp('pros_dis');
disp(pros_result);

fre_result =[
            fredis('material/sen6000/Asen6000.wav', 'material/sen6000/Bsen6000.wav'), fredis('material/sen6000/newAsen6000.wav', 'material/sen6000/Bsen6000.wav');
            fredis('material/sen6015/Asen6015.wav', 'material/sen6015/Bsen6015.wav'), fredis('material/sen6015/newAsen6015.wav', 'material/sen6015/Bsen6015.wav');
            fredis('material/sen6028/Asen6028.wav', 'material/sen6028/Bsen6028.wav'), fredis('material/sen6028/newAsen6028.wav', 'material/sen6028/Bsen6028.wav');
            fredis('material/sen6044/Asen6044.wav', 'material/sen6044/Bsen6044.wav'), fredis('material/sen6044/newAsen6044.wav', 'material/sen6044/Bsen6044.wav');
            fredis('material/sen6147/Asen6147.wav', 'material/sen6147/Bsen6147.wav'), fredis('material/sen6147/newAsen6147.wav', 'material/sen6147/Bsen6147.wav');
      ];

disp('fre_dis');
disp(fre_result);


seq_result =[
            seqdis('material/sen6000/Asen6000.wav', 'material/sen6000/Bsen6000.wav'), seqdis('material/sen6000/newAsen6000.wav', 'material/sen6000/Bsen6000.wav');
            seqdis('material/sen6015/Asen6015.wav', 'material/sen6015/Bsen6015.wav'), seqdis('material/sen6015/newAsen6015.wav', 'material/sen6015/Bsen6015.wav');
            seqdis('material/sen6028/Asen6028.wav', 'material/sen6028/Bsen6028.wav'), seqdis('material/sen6028/newAsen6028.wav', 'material/sen6028/Bsen6028.wav');
            seqdis('material/sen6044/Asen6044.wav', 'material/sen6044/Bsen6044.wav'), seqdis('material/sen6044/newAsen6044.wav', 'material/sen6044/Bsen6044.wav');
            seqdis('material/sen6147/Asen6147.wav', 'material/sen6147/Bsen6147.wav'), seqdis('material/sen6147/newAsen6147.wav', 'material/sen6147/Bsen6147.wav');
      ];

disp('seq_dis');
disp(seq_result);