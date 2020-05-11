global imsho
global cubicSamp3
img = double(imsho);
 %img=double(imread('1.jpg'));
 if isempty(img)
     msgbox('请先选择一张图片！') 
   
 end
 cubicSamp3 = downSample(img,5,'cubic');
 axes(handles.axes_downsampled);
imshow(cubicSamp3);
