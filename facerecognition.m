%������Ƶ����
vid = videoinput('winvideo', 1, 'YUY2_320x240');
%��������ֵ���������ϻ�ȡͼ��
% vid.FramesPerTrigger = 1;
vid.FramesPerTrigger = Inf;
vid.ReturnedColorspace = 'rgb';
%������ͷ
start(vid);
 
while 1

    frame = getsnapshot(vid);%ץȡͼ��
    I = ycbcr2rgb(frame);%ycbcr��ɫ�ʿռ��һ�֣������ҵļ������ȡͼ�������ָ�ʽ������ת��Ϊrgb��ת��Ϊgray
    I = rgb2gray(frame);
    I = imresize(I,[112,92]);%�ߴ��һ��
    %inshow��I����
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
    container = zeros(1,112*92);%һ��Ҫ��ѵ��ʱһ���ȳ�ʼ������һ������������ʹ����������һ����������ֱ��ת����double��
    container(1,:) = I(:)';
    faceData = (container - meanVec)*V;%��ѵ�����ݵ����������н�ά
    faceData = testscaling( faceData,-1,1 );%�������ݹ�һ��
    [predict_label,accuracy,prob_estimates]=svmpredict(41,faceData,model);
    if predict_label == 41
       set(handles.editface,'string','ʶ����ȷ��С��......')
       drawnow
       pause(3);
       delete( gcf ); % �رյ�ǰ���û���¼����
    untitled; 
    else
       set(handles.editface,'string','ʶ�����......')
       drawnow
    
    end
%     
%     if strcmp(get(gcf,'SelectionType'),'alt')%�Ҽ�����¼�
%         break;
%     end


  


