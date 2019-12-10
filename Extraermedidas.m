function varargout = Extraermedidas(varargin)
% EXTRAERMEDIDAS MATLAB code for Extraermedidas.fig
%      EXTRAERMEDIDAS, by itself, creates a new EXTRAERMEDIDAS or raises the existing
%      singleton*.
%
%      H = EXTRAERMEDIDAS returns the handle to a new EXTRAERMEDIDAS or the handle to
%      the existing singleton*.
%
%      EXTRAERMEDIDAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXTRAERMEDIDAS.M with the given input arguments.
%
%      EXTRAERMEDIDAS('Property','Value',...) creates a new EXTRAERMEDIDAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Extraermedidas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Extraermedidas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Extraermedidas

% Last Modified by GUIDE v2.5 16-Jun-2015 12:18:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Extraermedidas_OpeningFcn, ...
                   'gui_OutputFcn',  @Extraermedidas_OutputFcn, ...
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


% --- Executes just before Extraermedidas is made visible.
function Extraermedidas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Extraermedidas (see VARARGIN)

% Choose default command line output for Extraermedidas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Extraermedidas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Extraermedidas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Pedir que seleccione el directorio de .mats
data_path = pwd;
origin_path=uigetdir(data_path,'Pick a Directory');
files = dir (strcat (origin_path,filesep,'*.mat'));

if isempty (files)
    outmessage ({'This folder does not contain any matlab file. Please select another folder'})
    
else
    M = length(files); %incluimos la primera línea con la cabecera.
    N = 1+13+17;
    mat_final = cell (M,N);
    col_cont = 1;

    for i=1:M
       col_cont = 1;
       
       %a =load(strcat(origin_path,filesep,files(i).name));

        a =load(strcat(origin_path,filesep,files(i).name)); %se carga la variable para leer la cabecer
        files(i).name
        %NHC
        if i == 1
           mat_final{i,col_cont} = 'NHC';
           mat_final{i+1,col_cont} = a.delineated.NHC;
       else 
           mat_final{i+1,col_cont} = a.delineated.NHC;
          
        end
      
       %Variables de Hoffer
       var_hof = fieldnames(a.delineated.Hofer_2002);
       for j=1:length(var_hof)

           var = var_hof{j};
           
           if size(a.delineated.Hofer_2002.(var)) == 1

               if i==1
                   col_cont = col_cont+1;
                   mat_final {i,col_cont} = strcat('hof_',var);
                   mat_final {i+1,col_cont} = a.delineated.Hofer_2002.(var);
               else
                   col_cont = col_cont+1;
                   mat_final {i+1,col_cont} = a.delineated.Hofer_2002.(var);

               end

           end
           clear var
       end
       
       var_wit = fieldnames(a.delineated.Witelson_1989);
       for j=1:length(var_wit)

           var = var_wit{j};
           
           if size(a.delineated.Witelson_1989.(var)) == 1
               if i==1
                   col_cont = col_cont+1;
                   mat_final {i,col_cont} = strcat('Wit_',var);
                   mat_final {i+1,col_cont} = a.delineated.Witelson_1989.(var);
               else
                   col_cont = col_cont+1;
                   mat_final {i+1,col_cont} = a.delineated.Witelson_1989.(var);
               end
           end
           clear var
       end 
       
      
           
       %Escribimos NHC
       
       
%        if i == 1
%            mat_final{i,col_cont} = 'NHC';
%            a =load(strcat(origin_path,filesep,files(i).name)); %se carga la variable para leer la cabecera
%            files(i).name
%        else 
%            mat_final{i,col_cont} = a.delineated.NHC;
%            a =load(strcat(origin_path,filesep,files(i-1).name));
%            files(i-1).name
%        end
% 
%        % Leemos las variables de Hofer_2002
%        var_hof = fieldnames(a.delineated.Hofer_2002);
% 
%        for j=1:length(var_hof)
% 
%            var = var_hof{j};
%            
%            if size(a.delineated.Hofer_2002.(var)) == 1
% 
%                if i==1
%                    col_cont = col_cont+1;
%                    mat_final {i,col_cont} = strcat('Hof_',var);
%                else
%                    col_cont = col_cont+1;
%                    mat_final {i,col_cont} = a.delineated.Hofer_2002.(var);
% 
%                end
% 
%            end
%            clear var
%        end
% 
%        % Leemos las variables de Witelson
%        var_wit = fieldnames(a.delineated.Witelson_1989);
%        for j=1:length(var_wit)
% 
%            var = var_wit{j};
%            
%            if size(a.delineated.Witelson_1989.(var)) == 1
%                if i==1
%                    col_cont = col_cont+1;
%                    mat_final {i,col_cont} = strcat('Wit_',var);
%                else
%                    col_cont = col_cont+1;
%                    mat_final {i,col_cont} = a.delineated.Witelson_1989.(var);
%                end
%            end
%            clear var
%        end 
% 
%     end
    end
    
    file_name = handles.filename;
    if isempty (strfind (file_name,'.csv'))
        file_name = strcat(file_name,'.csv');
    end
    

    output_path = handles.output_path;
    cell2csv(strcat(output_path,filesep,file_name),mat_final);
    outmessage ({'Export is completed'})
    
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data_path = strcat(pwd,filesep,'Exports');
handles.output_path=uigetdir(data_path,'Pick a Directory where saving the file');

guidata(hObject,handles);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

handles.filename = get (hObject,'String');
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.filename = strcat(datestr(date,'yyyymmdd'),'_Export_CC_information.csv');
set (hObject,'String',handles.filename);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
I1=imread('logo_tmb2.bmp');
i1=imresize(I1, [50 175]);

imshow(i1,'Parent',hObject);


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.output_path = strcat(pwd,filesep,'/Exports/');
guidata (hObject,handles);