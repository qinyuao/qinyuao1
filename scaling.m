function [ scaledface] = scaling( faceMat,lTargB,uTargB )  
%�������ݹ淶�� ����Ϊ��Ϊ���ڲ�ͬ�����ԣ��������һ���ǲ����бȽ��Եģ����߲���һ��������
%faceMat��Ҫ���й淶����ͼ�����ݣ�  
[m,n]=size(faceMat);  
scaledface=zeros(m,n); 
upVec=zeros(1,n);  %������
lowVec=zeros(1,n);

 for i=1:n
     lowVec(i)=min( faceMat(:,i) );
     upVec(i)=max( faceMat(:,i) );   
     scaledface(:,i)=(faceMat(:,i) - lowVec(i) )/( upVec(i)- lowVec(i))*(uTargB-lTargB)+lTargB;   
 end
 save('scaling.mat','upVec','lowVec');


