%��������cdKNN�õ�ŷ�Ͼ�����Ϣ
%
%function distance = cdKNN(X, y, train_label, K)
function distance = cdKNN(train_data_ori, test_data_ori, train_label, K)

%inputs:
%           train_data_ori: �ܵ�ԭʼѵ����������
%           test_data_ori: ԭʼ����������
%           train_label: ѵ��������Ӧ�����
%outputs:
%           distance: y��ÿ���K���ھ���

[m, n] = size(test_data_ori);
distance = zeros(max(train_label), n);

for p = 1:n
    y = test_data_ori(:, p);
    for i = 1:max(train_label)
        X1 = train_data_ori(:, find(train_label == i));
%         d = [];
%         for j = 1:size(X1, 2)
%             d(j) = norm(y - X1(:, j));  %d�б���y��i��ÿ��������ľ���
%         end
        d = sqrt(sum((repmat(y, 1, size(X1, 2)) - X1).^2));
        
        %��ȡǰK����С���벢ȡ��ֵ
        sort_d = sort(d, 'ascend'); %d����������
        distance(i, p) = sum(sort_d(1:K)) / K; %K����С����ľ�ֵ��Ϊy�Ե�i��ľ�����Ϣ����
    end
end

end
    