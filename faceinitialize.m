

[train_faceContainer,train_label] = ReadFace(41,0);
set(handles.editface,'string','读取测试数据......')
drawnow

[pcaA ,V]=fastPCA(train_faceContainer,20);
set(handles.editface,'string','训练数据PCA降维......')
drawnow


[ scaledface] = scaling( pcaA,-1,1 );
set(handles.editface,'string','训练数据归一化......')
drawnow

model = svmtrain(train_label,scaledface,'-t 0 ');
set(handles.editface,'string','SVM样本训练......')
drawnow

[test_faceContainer,test_label]=ReadFace(40,1);
set(handles.editface,'string','读取测试数据......')
drawnow

load 'PCA.mat'
testData = (test_faceContainer - repmat(meanVec,200,1)) * V;
set(handles.editface,'string','测试数据pca降维......')
drawnow

scaled_testData = testscaling( testData,-1,1);
set(handles.editface,'string','测试数据归一化......')
drawnow

[predict_label,accuracy,prob_estimates]=svmpredict(test_label,scaled_testData,model);
set(handles.editface,'string','初始化结束......')
drawnow