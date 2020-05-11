%创建视频对象
vid = videoinput('winvideo', 1, 'YUY2_320x240');
%设置属性值，持续不断获取图像
% vid.FramesPerTrigger = 1;
vid.FramesPerTrigger = Inf;
vid.ReturnedColorspace = 'rgb';
%打开摄像头
start(vid);
 
while 1

    frame = getsnapshot(vid);%抓取图像
    I = ycbcr2rgb(frame);%ycbcr是色彩空间的一种，由于我的计算机获取图像是这种格式所以先转换为rgb再转换为gray
    I = rgb2gray(frame);
    I = imresize(I,[112,92]);%尺寸归一化
    %inshow（I）；
    axes(handles.axesface);
    imshow(I);
    stop(vid);    
    break;
end
    [faceContainer,label]=ReadFace(41,0);
    [pcaA ,V]=fastPCA(faceContainer,20);
    [ scaledface] = scaling( pcaA,-1,1 ); 
    model = svmtrain(label,scaledface,'-t 0 ');
    load 'PCA.mat'
    container = zeros(1,112*92);%一定要和训练时一样先初始化定义一个人脸容器，使其数据类型一样，而不能直接转化成double型
    container(1,:) = I(:)';
    faceData = (container - meanVec)*V;%在训练数据的特征向量中降维
    faceData = testscaling( faceData,-1,1 );%测试数据归一化
    [predict_label,accuracy,prob_estimates]=svmpredict(41,faceData,model);
    if predict_label == 41
       set(handles.editface,'string','识别正确：小秦......')
       drawnow
       pause(3);
       delete( gcf ); % 关闭当前的用户登录界面
    untitled; 
    else
       set(handles.editface,'string','识别错误......')
       drawnow
    
    end
%     
%     if strcmp(get(gcf,'SelectionType'),'alt')%右键鼠标事件
%         break;
%     end


  


