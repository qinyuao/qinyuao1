global imsho
[filename,pathname]=uigetfile({'*.jpg';'*.pgm';'*.tif';'*.*'},'��ѡ��һ������ʶ�����Ƭ');
if filename==0
    msgbox('��ѡ��һ����Ƭ�ļ�')
else
    filepath=[pathname,filename];
    imsho = imread(filepath);
    %img=double(imread('1.jpg'));
    axes(handles.axes_ori);
    imshow(imsho);
end