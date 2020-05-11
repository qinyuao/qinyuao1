%AΪ�������󣬽��併��kά��ľ���ΪpcaA,VΪ���ɷַ���
function [pcaA ,V]=fastPCA(A,k)

[m,n]=size(A);
%������ֵ,������еľ�ֵ
meanVec=mean(A); 
 
%����Э��������ת�� covMatT
%�����������Ļ���ÿһά�ȼ�ȥ��ά�ȵľ�ֵ��ʹ��ÿһά�ȵľ�ֵΪ0
%repmat:Replicate Matrix���ƺ�ƽ�̾���
Z= ( A-repmat(meanVec,m,1)  );  
                                
covMatT =Z*Z'; %����PCA
%����covMatT��ǰk������ֵ����������
[V, ~]=eigs(covMatT,k);  %VΪm*k, k����������
 
%�õ�Э�������(covMatT')����������
V=Z'*V;
 
%����������һ��Ϊ�õ���λ��������
for i=1:k
    V(:,i)=V(:,i)/norm(V(:,i));  %norm Ϊ������Ĭ��Ϊ2����(��������ƽ���� �ٿ�����)
end
 
%ͶӰ��ά��kά
pcaA=Z*V;
 
%����任����V��ƽ������meanVec
save('PCA.mat','V','meanVec');
