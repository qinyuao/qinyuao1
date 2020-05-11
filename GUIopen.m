global imsho
[filename,pathname]=uigetfile({'*.jpg';'*.pgm';'*.tif';'*.*'},'请选择一张用于识别的照片');
if filename==0
    msgbox('请选择一张照片文件')
else
    filepath=[pathname,filename];
    imsho = imread(filepath);
    %img=double(imread('1.jpg'));
    axes(handles.axes_ori);
    imshow(imsho);
end