global cubicSamp3;
global S;
global K;
global lambda;
load('orisample.mat');
set(handles.edit_state,'string','读取测试数据......')
drawnow
% img = double(imsho);
% %img=double(imread('1.jpg'));
% if isempty(img)
%     msgbox('请先选择一张图片！') 
%   
% end
% cubicSamp3 = downSample(img,5,'cubic');
ori_img = double(cubicSamp3);
im = reshape(ori_img,1,size(ori_img,1)*size(ori_img,2));
feax = im;
genx = 1;
feas = [feax;fea];
gens = [genx;gen];
set(handles.edit_state,'string','进行数据整合......')
drawnow
pause(1);
train_ori_data=fea';
train_ori_labels=gen';
test_ori_data=feas';
test_ori_labels=gens';

%  load('Indiana200.mat');
%  Indiana_data=fea';
%  Indiana_labels=labels';
% load('Indiana_200.mat');
% data_ori = Indiana_data(find(Indiana_labels ~= 0), :)';
% labels = Indiana_labels(find(Indiana_labels ~= 0), :)';

%  lyl=[2,3,5,6,8,10,11,12,14];
%  data_ori =[];
%  labels=[];
%  for j=1:9
%  data_ori =[data_ori,Indiana_data(find(Indiana_labels == lyl(j)), :)' ];
%  labels = [labels ,repmat(j,1,length(Indiana_labels(find(Indiana_labels == lyl(j)), :)'))];
%  end

%数据归一化
train_data = normalize_data(train_ori_data);
test_data = normalize_data(test_ori_data);
train_label = train_ori_labels;
test_label = test_ori_labels;
set(handles.edit_state,'string','数据归一化......')
drawnow
%对原始数据进行LDA映射降到30维，用于后面的cdKNN
[T,ZZ]=lda(train_ori_data', train_ori_labels', 30);   %T是映射矩阵，Z是降维后的数据T'*X
Z=ZZ';

[T1,YY]=lda(test_ori_data', test_ori_labels', 30);   %T是映射矩阵，Z是降维后的数据T'*X
Y=YY';
set(handles.edit_state,'string','进行LDA降维......')
drawnow
pause(1);
% [T,Z]=LFDA(data_ori, labels, 30);   %T是映射矩阵，Z是降维后的数据T'*X

%选取训练样本和测试样本
%select_train_data.m用来按比例选择训练样本
%select_train_data1.m用来按个数选择训练样本
%  percent = 0.3; %每类样本中训练样本比例 
%N = 10;    %每类取N个作为训练样本
%  [train_index, test_index] = select_train_data(labels, 0.3);
% [train_index, test_index] = select_train_data1(labels, 30);

%用于cdOMP的归一化后数据
%  train_data = data(:, train_index);
%  train_label = labels(train_index);
%  test_data = data(:, test_index);
%  test_label = labels(test_index);

%用于cdKNN的降维数据
train_data_ori = Z;
test_data_ori = Y;

X = train_data;
% S = 10;
% K = 1;
% lambda = 0.1;
% S = 10;
% K = 10;
% lambda = 0.0001;
c = max(train_label);

%cdOMP迭代程序，得到【类别数*测试样本个数】大小的矩阵residual
residual = zeros(max(train_label), length(test_label));
distance = zeros(size(residual));
for i = 1:max(train_label)
    X1 = X(:, find(train_label == i));
    A= OMP(X1, test_data, S);
    nor = sqrt(sum((X1 * A - test_data).^2));
    residual(i, :) = nor;
end
set(handles.edit_state,'string','进行cdOMP迭代程序......')
drawnow
pause(1);
%cdKNN程序，得到【类别数*测试样本个数】大小的矩阵distance
distance = cdKNN(train_data_ori, test_data_ori, train_label, K);
set(handles.edit_state,'string','进行cdKNN迭代程序......')
drawnow
pause(1);
%整合相关度信息和欧氏距离信息
w = residual + lambda * distance;
set(handles.edit_state,'string','整合相关度信息和欧氏距离信息......')
drawnow
pause(1);
%计算正确率
result = zeros(1, length(test_label));
for i = 1:length(test_label)
    result(i) = find(w(:, i) == min(w(:, i)));
end
% save result.mat result
set(handles.edit_state,'string','结果显示......')
drawnow
a = result(1);
set(handles.edit5,'string',a);
drawnow
load('identifyresult.mat');
id=identifyresult(a,1);
set(handles.edit_result,'string',id);
drawnow



% tic;
% %result = zeros(1, 1000);
% w = zeros(1, length(test_label));   %w用来保存新的类标
% for i = 1:length(test_label)
%     residual = cdOMP(X, test_data(:, i), train_label, S);   %差值，y关于每类的相关性度量
%     distance = cdKNN(X, test_data(:, i), train_label, K);  %距离，y关于每类的欧氏距离性度量
%     W = residual + lambda * distance;
%     w(i) = find(W == min(W));
% end 
% %a = test_label(1:1000);
% per = length(find(test_label == w))
% %percent = lenght(find(w == test_label(1:100)))/100;
% toc;