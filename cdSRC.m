global cubicSamp3;
global S;
global K;
global lambda;
load('orisample.mat');
set(handles.edit_state,'string','��ȡ��������......')
drawnow
% img = double(imsho);
% %img=double(imread('1.jpg'));
% if isempty(img)
%     msgbox('����ѡ��һ��ͼƬ��') 
%   
% end
% cubicSamp3 = downSample(img,5,'cubic');
ori_img = double(cubicSamp3);
im = reshape(ori_img,1,size(ori_img,1)*size(ori_img,2));
feax = im;
genx = 1;
feas = [feax;fea];
gens = [genx;gen];
set(handles.edit_state,'string','������������......')
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

%���ݹ�һ��
train_data = normalize_data(train_ori_data);
test_data = normalize_data(test_ori_data);
train_label = train_ori_labels;
test_label = test_ori_labels;
set(handles.edit_state,'string','���ݹ�һ��......')
drawnow
%��ԭʼ���ݽ���LDAӳ�併��30ά�����ں����cdKNN
[T,ZZ]=lda(train_ori_data', train_ori_labels', 30);   %T��ӳ�����Z�ǽ�ά�������T'*X
Z=ZZ';

[T1,YY]=lda(test_ori_data', test_ori_labels', 30);   %T��ӳ�����Z�ǽ�ά�������T'*X
Y=YY';
set(handles.edit_state,'string','����LDA��ά......')
drawnow
pause(1);
% [T,Z]=LFDA(data_ori, labels, 30);   %T��ӳ�����Z�ǽ�ά�������T'*X

%ѡȡѵ�������Ͳ�������
%select_train_data.m����������ѡ��ѵ������
%select_train_data1.m����������ѡ��ѵ������
%  percent = 0.3; %ÿ��������ѵ���������� 
%N = 10;    %ÿ��ȡN����Ϊѵ������
%  [train_index, test_index] = select_train_data(labels, 0.3);
% [train_index, test_index] = select_train_data1(labels, 30);

%����cdOMP�Ĺ�һ��������
%  train_data = data(:, train_index);
%  train_label = labels(train_index);
%  test_data = data(:, test_index);
%  test_label = labels(test_index);

%����cdKNN�Ľ�ά����
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

%cdOMP�������򣬵õ��������*����������������С�ľ���residual
residual = zeros(max(train_label), length(test_label));
distance = zeros(size(residual));
for i = 1:max(train_label)
    X1 = X(:, find(train_label == i));
    A= OMP(X1, test_data, S);
    nor = sqrt(sum((X1 * A - test_data).^2));
    residual(i, :) = nor;
end
set(handles.edit_state,'string','����cdOMP��������......')
drawnow
pause(1);
%cdKNN���򣬵õ��������*����������������С�ľ���distance
distance = cdKNN(train_data_ori, test_data_ori, train_label, K);
set(handles.edit_state,'string','����cdKNN��������......')
drawnow
pause(1);
%������ض���Ϣ��ŷ�Ͼ�����Ϣ
w = residual + lambda * distance;
set(handles.edit_state,'string','������ض���Ϣ��ŷ�Ͼ�����Ϣ......')
drawnow
pause(1);
%������ȷ��
result = zeros(1, length(test_label));
for i = 1:length(test_label)
    result(i) = find(w(:, i) == min(w(:, i)));
end
% save result.mat result
set(handles.edit_state,'string','�����ʾ......')
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
% w = zeros(1, length(test_label));   %w���������µ����
% for i = 1:length(test_label)
%     residual = cdOMP(X, test_data(:, i), train_label, S);   %��ֵ��y����ÿ�������Զ���
%     distance = cdKNN(X, test_data(:, i), train_label, K);  %���룬y����ÿ���ŷ�Ͼ����Զ���
%     W = residual + lambda * distance;
%     w(i) = find(W == min(W));
% end 
% %a = test_label(1:1000);
% per = length(find(test_label == w))
% %percent = lenght(find(w == test_label(1:100)))/100;
% toc;