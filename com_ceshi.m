%https://blog.csdn.net/u010177286/article/details/45872365
global baudrate;
global DataBits;
global StopBits;
object=serial('COM4','baudrate',baudrate,'DataBits',DataBits,'StopBits',StopBits,'Parity','even');
%9600 波特率 ， 8 位数据， 1 位停止位， 偶校验
object.InputBufferSize = 1024;%设置输入缓冲区大小 1024
object.OutputBufferSize = 1024;%设置输出缓冲区大小 1024
object.Timeout = 1;
% object.BytesAvailableFcnMode = 'byte';
% object.BytesAvailableFcn = @fcntion_callback;
fopen(object);
% % fwrite(objct,255);
% numori = 'O5';   
% num = hex2dec(numori);
% fprintf(object,num);
Str = '05h';     %字符串定义需要发送的十六进制内容
set(handles.edit_send,'string',Str)
drawnow
% D = sscanf(Str, '%2x'); %将字符串转换成十六进制数据
fprintf(object, Str);%对定义的串口s发送该数据
data = fscanf(object);
set(handles.edit_accept,'string',data)
drawnow
% fwrite(object, D, 'uint8') %对定义的串口s发送该数据
% data1 = fread(object);
% % fprintf(object,'05H');
% % data = fscanf(object);
fclose(object);
delete(object);
clc
%    BaudRate  波特率；DataBits 数据位 ； FlowControl 流量控制 ；
%    Parity 校验 StopBits 停止位