function varargout = untitled(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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



function untitled_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);



function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)


function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)


function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu1_Callback(hObject, eventdata, handles)
% �˾��޴�1
choice = get(handles.popupmenu1,'String');      % ���õ� �˾��޴�1�� ��Ʈ�� ��������
choice_loc = get(handles.popupmenu1,'Value');   % ���õ� �˾��޴�1�� ��ġ �� ��������
handles.year=choice{choice_loc}     % �⵵ handles.year�� ����
guidata(hObject,handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu2_Callback(hObject, eventdata, handles)
% �˾��޴�2
choice = get(handles.popupmenu2,'String');      % ���õ� �˾��޴�2�� ��Ʈ�� ��������
choice_loc = get(handles.popupmenu2,'Value');   % ���õ� �˾��޴�2�� ��ġ �� ��������
handles.month=choice{choice_loc}     % �� handles.month�� ����
guidata(hObject,handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu3_Callback(hObject, eventdata, handles)
% �˾��޴�3
choice = get(handles.popupmenu3,'String');      % ���õ� �˾��޴�3�� ��Ʈ�� ��������
choice_loc = get(handles.popupmenu3,'Value');   % ���õ� �˾��޴�3�� ��ġ �� ��������
handles.day=choice{choice_loc}     % �� handles.day�� ����
guidata(hObject,handles)

function popupmenu3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
today = fix(now);      % ����
birth=datenum(str2num(handles.year),str2num(handles.month),str2num(handles.day));    % ����
diff_date = today - birth   % ���� - ���� ���� �ϼ�

data = [23,28,33,38];   % ���̿����� ����(��ü���� �������� �������� ��������')
t = diff_date-14:1:diff_date+14;    % 14-�����ϼ�+14

% ���̿����� ���� ���
for i = 1:4
    res(i) = round(sin((diff_date / data(i))*2*3.141592654)*100)
end

% ���̿����� ���� ��� ��ķ� �� ����
res2_1 = round(sin((t / data(1))*2*3.141592654)*100)
res2_2 = round(sin((t / data(2))*2*3.141592654)*100)
res2_3 = round(sin((t / data(3))*2*3.141592654)*100)
res2_4 = round(sin((t / data(4))*2*3.141592654)*100)

% edit�� ���� ���� ��Ʈ�� ����
set(handles.edit1,'string',num2str(res(1)));
set(handles.edit2,'string',num2str(res(2)));
set(handles.edit3,'string',num2str(res(3)));
set(handles.edit4,'string',num2str(res(4)));
% �¾�� edit�� ���� �ϼ� ����
set(handles.text8,'string',num2str(diff_date));

% �׷���
plot(t,res2_1,t,res2_2,t,res2_3,t,res2_4);
xlabel('�ϼ�');ylabel('����')
% �༳�� (x���� �����ϼ� -14 ~ �����ϼ�+14, y���� -100~100)
axis([diff_date-14,diff_date+14,-100,100]);
% ���� ǥ��
legend('��ü����','��������','��������','��������')
% ��� Ȯ�� �� �ؽ�Ʈ�� ����
for i = -100:100
    text(diff_date,i,"l");
end
% Ȯ�� �� ���� �ϼ� ǥ��
text(diff_date+1,30,num2str(diff_date));



