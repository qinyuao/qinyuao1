%https://blog.csdn.net/u010177286/article/details/45872365
global baudrate;
global DataBits;
global StopBits;
object=serial('COM4','baudrate',baudrate,'DataBits',DataBits,'StopBits',StopBits,'Parity','even');
%9600 ������ �� 8 λ���ݣ� 1 λֹͣλ�� żУ��
object.InputBufferSize = 1024;%�������뻺������С 1024
object.OutputBufferSize = 1024;%���������������С 1024
object.Timeout = 1;
% object.BytesAvailableFcnMode = 'byte';
% object.BytesAvailableFcn = @fcntion_callback;
fopen(object);
% % fwrite(objct,255);
% numori = 'O5';   
% num = hex2dec(numori);
% fprintf(object,num);
Str = '05h';     %�ַ���������Ҫ���͵�ʮ����������
set(handles.edit_send,'string',Str)
drawnow
% D = sscanf(Str, '%2x'); %���ַ���ת����ʮ����������
fprintf(object, Str);%�Զ���Ĵ���s���͸�����
data = fscanf(object);
set(handles.edit_accept,'string',data)
drawnow
% fwrite(object, D, 'uint8') %�Զ���Ĵ���s���͸�����
% data1 = fread(object);
% % fprintf(object,'05H');
% % data = fscanf(object);
fclose(object);
delete(object);
clc
%    BaudRate  �����ʣ�DataBits ����λ �� FlowControl �������� ��
%    Parity У�� StopBits ֹͣλ