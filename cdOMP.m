%cdOMP.m �� gradient_descent.m�����ݶ��½������cdOMP�е��Ż���ʽ���������������������ã�����ʵ���ܳ�����û���ɾ
function residual = cdOMP(X, y, train_label, S)


residual = zeros(max(train_label), 1);
for i = 1:max(train_label)
    X1 = X(:, find(train_label == i));
    LAMBDA = [];
    r = y;
    for m = 1:S
        nei_ji = r' * X1;            %�ڻ�
        lambda = find(nei_ji == max(nei_ji));
        LAMBDA = [LAMBDA, lambda];
        X2 = X1(:, LAMBDA);             %X2: ��i��ѵ�������вμӱ�ʾ����������
        alpha = zeros(size(X2, 2), 1);                %alpha: ��X2�ع�yʱ�Ĳ�������
        
        %�ݶ��½�����alpha��r
        a = 0.5;
        num_iters = 100;
        [alpha, r] = gradient_descent(X2, y, alpha, a, num_iters);               %a��alpha������ʽ�еĲ�����num_iters������������
    end
    
    residual(i) = norm(r);
end

end