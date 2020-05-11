function varargout = srcmain(varargin)
% SRCMAIN MATLAB code for srcmain.fig
%      SRCMAIN, by itself, creates a new SRCMAIN or raises the existing
%      singleton*.
%
%      H = SRCMAIN returns the handle to a new SRCMAIN or the handle to
%      the existing singleton*.
%
%      SRCMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SRCMAIN.M with the given input arguments.
%
%      SRCMAIN('Property','Value',...) creates a new SRCMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before srcmain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to srcmain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help srcmain

% Last Modified by GUIDE v2.5 13-Apr-2020 18:15:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @srcmain_OpeningFcn, ...
                   'gui_OutputFcn',  @srcmain_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before srcmain is made visible.
function srcmain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to srcmain (see VARARGIN)
h = handles.figure_src;
newIcon = javax.swing.ImageIcon('图标.jpg'); %读取图片文件
figFrame = get(h,'JavaFrame');
figFrame.setFigureIcon(newIcon);
set(gcf,'name','主页面'); %第三个参数为界面名称
% Choose default command line output for srcmain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes srcmain wait for user response (see UIRESUME)
% uiwait(handles.figure_src);


% --- Outputs from this function are returned to the command line.
function varargout = srcmain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_send_Callback(hObject, eventdata, handles)
% hObject    handle to edit_send (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_send as text
%        str2double(get(hObject,'String')) returns contents of edit_send as a double


% --- Executes during object creation, after setting all properties.
function edit_send_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_send (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_accept_Callback(hObject, eventdata, handles)
% hObject    handle to edit_accept (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_accept as text
%        str2double(get(hObject,'String')) returns contents of edit_accept as a double


% --- Executes during object creation, after setting all properties.
function edit_accept_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_accept (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_serial.
function pushbutton_serial_Callback(hObject, eventdata, handles)
com_ceshi


function edit_state_Callback(hObject, eventdata, handles)
% hObject    handle to edit_state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_state as text
%        str2double(get(hObject,'String')) returns contents of edit_state as a double


% --- Executes during object creation, after setting all properties.
function edit_state_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
GUIopen;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
downsample_ori;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
cdSRC;


% --- Executes on button press in pushbutton_drop.
function pushbutton_drop_Callback(hObject, eventdata, handles)
close;


% --- Executes on button press in pushbutton_dispose.
function pushbutton_dispose_Callback(hObject, eventdata, handles)
Main_Interface;



function edit_result_Callback(hObject, eventdata, handles)
% hObject    handle to edit_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_result as text
%        str2double(get(hObject,'String')) returns contents of edit_result as a double


% --- Executes during object creation, after setting all properties.
function edit_result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_return.
function pushbutton_return_Callback(hObject, eventdata, handles)
    delete( gcf ); % 关闭当前的用户登录界面
    UserLogIn_Interface;


% --- Executes on button press in pushbutton_canshu.
function pushbutton_canshu_Callback(hObject, eventdata, handles)
delete( gcf ); 
untitled;



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
