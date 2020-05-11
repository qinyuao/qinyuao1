

[train_faceContainer,train_label] = ReadFace(41,0);
set(handles.editface,'string','��ȡ��������......')
drawnow

[pcaA ,V]=fastPCA(train_faceContainer,20);
set(handles.editface,'string','ѵ������PCA��ά......')
drawnow


[ scaledface] = scaling( pcaA,-1,1 );
set(handles.editface,'string','ѵ�����ݹ�һ��......')
drawnow

model = svmtrain(train_label,scaledface,'-t 0 ');
set(handles.editface,'string','SVM����ѵ��......')
drawnow

[test_faceContainer,test_label]=ReadFace(40,1);
set(handles.editface,'string','��ȡ��������......')
drawnow

load 'PCA.mat'
testData = (test_faceContainer - repmat(meanVec,200,1)) * V;
set(handles.editface,'string','��������pca��ά......')
drawnow

scaled_testData = testscaling( testData,-1,1);
set(handles.editface,'string','�������ݹ�һ��......')
drawnow

[predict_label,accuracy,prob_estimates]=svmpredict(test_label,scaled_testData,model);
set(handles.editface,'string','��ʼ������......')
drawnow