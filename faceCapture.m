%���Ȳɼ���Ҫ��ʶ���˵�������ÿ�˲�ȡ10�ţ�ͳһ��ʽ��С�������������ݿ��У�
%������Ƶ����
vid = videoinput('winvideo', 1, 'YUY2_160x120');
%��������ֵ���������ϻ�ȡͼ��
vid.FramesPerTrigger = Inf;
%������ͷ
start(vid);
faceDetector = vision.CascadeObjectDetector; 
count = 0;
while count<30
    frame = getsnapshot(vid);%ץȡͼ��
    I = ycbcr2rgb(frame);%ycbcr��ɫ�ʿռ��һ�֣������ҵļ������ȡͼ�������ָ�ʽ������ת��Ϊrgb��ת��Ϊgray
    I = rgb2gray(I);
    bboxes = step(faceDetector, I);
    I = imcrop(I,bboxes);
    I = imresize(I,[112,92]);
    imshow(I);
    path = strcat('faceCapture\',num2str(count),'.pgm');
    imwrite(I,path);
    count = count + 1;    
end
stop(vid)