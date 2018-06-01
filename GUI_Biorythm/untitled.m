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
% 팝업메뉴1
choice = get(handles.popupmenu1,'String');      % 선택된 팝업메뉴1의 스트링 가져오기
choice_loc = get(handles.popupmenu1,'Value');   % 선택된 팝업메뉴1의 위치 값 가져오기
handles.year=choice{choice_loc}     % 년도 handles.year에 저장
guidata(hObject,handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu2_Callback(hObject, eventdata, handles)
% 팝업메뉴2
choice = get(handles.popupmenu2,'String');      % 선택된 팝업메뉴2의 스트링 가져오기
choice_loc = get(handles.popupmenu2,'Value');   % 선택된 팝업메뉴2의 위치 값 가져오기
handles.month=choice{choice_loc}     % 월 handles.month에 저장
guidata(hObject,handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu3_Callback(hObject, eventdata, handles)
% 팝업메뉴3
choice = get(handles.popupmenu3,'String');      % 선택된 팝업메뉴3의 스트링 가져오기
choice_loc = get(handles.popupmenu3,'Value');   % 선택된 팝업메뉴3의 위치 값 가져오기
handles.day=choice{choice_loc}     % 일 handles.day에 저장
guidata(hObject,handles)

function popupmenu3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
today = fix(now);      % 오늘
birth=datenum(str2num(handles.year),str2num(handles.month),str2num(handles.day));    % 생일
diff_date = today - birth   % 오늘 - 생일 차이 일수

data = [23,28,33,38];   % 바이오리듬 지수(신체지수 감성지수 지성지수 지각지수')
t = diff_date-14:1:diff_date+14;    % 14-차이일수+14

% 바이오리듬 지수 계산
for i = 1:4
    res(i) = round(sin((diff_date / data(i))*2*3.141592654)*100)
end

% 바이오리듬 지수 계산 행렬로 값 저장
res2_1 = round(sin((t / data(1))*2*3.141592654)*100)
res2_2 = round(sin((t / data(2))*2*3.141592654)*100)
res2_3 = round(sin((t / data(3))*2*3.141592654)*100)
res2_4 = round(sin((t / data(4))*2*3.141592654)*100)

% edit에 계산된 지수 스트링 설정
set(handles.edit1,'string',num2str(res(1)));
set(handles.edit2,'string',num2str(res(2)));
set(handles.edit3,'string',num2str(res(3)));
set(handles.edit4,'string',num2str(res(4)));
% 태어난지 edit에 차이 일수 설정
set(handles.text8,'string',num2str(diff_date));

% 그래프
plot(t,res2_1,t,res2_2,t,res2_3,t,res2_4);
xlabel('일수');ylabel('지수')
% 축설정 (x축은 차이일수 -14 ~ 차이일수+14, y축은 -100~100)
axis([diff_date-14,diff_date+14,-100,100]);
% 범례 표시
legend('신체지수','감성지수','지성지수','지각지수')
% 가운데 확인 축 텍스트로 생성
for i = -100:100
    text(diff_date,i,"l");
end
% 확인 축 옆에 일수 표시
text(diff_date+1,30,num2str(diff_date));



