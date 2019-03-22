function varargout = score(varargin)
% SCORE MATLAB code for score.fig
%      SCORE, by itself, creates a new SCORE or raises the existing
%      singleton*.
%
%      H = SCORE returns the handle to a new SCORE or the handle to
%      the existing singleton*.
%
%      SCORE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCORE.M with the given input arguments.
%
%      SCORE('Property','Value',...) creates a new SCORE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before score_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to score_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help score

% Last Modified by GUIDE v2.5 11-Jul-2018 17:21:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @score_OpeningFcn, ...
                   'gui_OutputFcn',  @score_OutputFcn, ...
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


% --- Executes just before score is made visible.
function score_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to score (see VARARGIN)

% Choose default command line output for score
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes score wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = score_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_data.
function load_data_Callback(hObject, eventdata, handles)
% hObject    handle to load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename , pathname]=uigetfile({'*.txt'},'请选择所要输入的文件');
fin=[pathname filename];
[name, ID, chengji]=textread(fin,'%s %s %f','delimiter',' ');
handles.name=name;
handles.ID=ID;
handles.chengji=chengji;
a=strcat(handles.name,'的学号是');
b=strcat(a,handles.ID);
set(handles.show_text,'string',b);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function show_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in max_pushbutton.
function max_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to max_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[MAX , i ] = max(handles.chengji);

a=strcat('最高成绩为：',num2str(MAX));
b=strcat(a,'分，');
c=strcat(b,handles.ID(i))
d=strcat(c,handles.name(i));
set(handles.show_info_text,'string',d);
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function show_info_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_info_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in min_pushbutton.
function min_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to min_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[MIN , u ] = min(handles.chengji);
e=strcat('最低成绩为：',num2str(MIN));
f=strcat(e,'分，');
g=strcat(f,handles.ID(u))
h=strcat(g,handles.name(u));
set(handles.show_info_text,'string',h);
guidata(hObject, handles);


% --- Executes on button press in average_pushbutton.
function average_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to average_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
average = mean(handles.chengji);
a=strcat('平均分为：',num2str(average));
b=strcat(a,'分，');
set(handles.show_info_text,'string',b);
guidata(hObject, handles);


% --- Executes on button press in std_pushbutton.
function std_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to std_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
STD = std(handles.chengji);
a=strcat('标准方差为：',num2str(STD));
set(handles.show_info_text,'string',a);
guidata(hObject, handles);


% --- Executes on button press in pic_pushbutton.
function pic_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pic_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c1=0;c2=0;c3=0;c4=0;c5=0;c6=0;c7=0;c8=0;c9=0;c10=0;
i=length(handles.chengji);
for j=1:i
    if(handles.chengji(j)>=90)
        c1=c1+1;
    elseif((handles.chengji(j)>=80)&&(handles.chengji(j)<90))
        c2=c2+1;
    elseif((handles.chengji(j)>=70)&&(handles.chengji(j)<80))
        c3=c3+1;
    elseif((handles.chengji(j)>=60)&&(handles.chengji(j)<70))
        c4=c4+1;
    elseif((handles.chengji(j)>=50)&&(handles.chengji(j)<60))
        c5=c5+1;
    elseif((handles.chengji(j)>=40)&&(handles.chengji(j)<50))
        c6=c6+1;
    elseif((handles.chengji(j)>=30)&&(handles.chengji(j)<40))
        c7=c7+1;
    elseif((handles.chengji(j)>=20)&&(handles.chengji(j)<30))
        c8=c8+1;
    elseif((handles.chengji(j)>=10)&&(handles.chengji(j)<20))
        c9=c9+1;
    elseif((handles.chengji(j)<10))
        c10=c10+1;
    end
end
Y = [c10,c9,c8,c7,c6,c5,c4,c3,c2,c1];
X = [5:10:95];
bar(X,Y);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in sort_pushbutton.
function sort_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to sort_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


X =[];
P =length(handles.chengji);
for i = 1:P
    X = [X,handles.ID(i),handles.name(i),handles.chengji(i);];
end
A =reshape(X,[3,P]);
B = A';
C = sortrows(B,-3);

sortID = C(:,1);
sortNAME = C(:,2);
sortSCORE = C(:,3);
 for i = 1:P
    a(:,i)=[sortID(i),sortNAME(i),sortSCORE(i)];
 end

 

set(handles.sort_text,'string',a);      
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function sort_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sort_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
