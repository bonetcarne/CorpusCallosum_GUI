%choose_dir


% data_path='/mnt/davinci/studiesdata/human-fetal-lung-us/raw-images/';

%data_path='/mnt/davinci/gui/Matlab/for_Linux_Windows/20150603_fetalbrain_CC/files';
data_path='/home/connectomics/Desktop/CC_Images/';
origin_path=uigetdir(data_path,'Pick a Directory');

specific_path=origin_path(length(data_path)+1:end);

%output path!!!!!!!!!!!!
% output_save_path=strcat(data_path,'delineated',filesep,specific_path);
%output_save_path = '/mnt/davinci/gui/Matlab/for_Linux_Windows/20150603_fetalbrain_CC/mats';
output_save_path = strcat(pwd,filesep,'mats/');

% clear specific_path;

%% initial configuration
set(h1.axes1,'Visible','off');
set(h1.uipanel1,'Visible','off');

set(h1.uipanel5,'Visible','off');
set(h1.backward_button,'Visible','off');
set(h1.forward_button,'Visible','off');
set(h1.selectIm_button,'Visible','off');
set(h1.saveIm_button,'backgroundColor',[ 0.9922 0.9176 0.7961],'enable','off');
set(h1.saveRoi_button,'backgroundColor',[ 0.9922 0.9176 0.7961],'enable','off');
set(h1.save_change_button,'Visible','off');
set(h1.validate_button,'Enable','off','backgroundColor',[ 0.9922 0.9176 0.7961]);
set(h1.cancel_button,'Enable','off','BackgroundColor',[ 0.9922 0.9176 0.7961]);
set(h1.discard_button,'Visible','off','BackgroundColor',[ 0.9922 0.9176 0.7961]);



%cal_aux = 0;
clear_screen;

%% 

if  origin_path == 0
    
    %break
    return
else
    
    n_aux = dir(strcat(origin_path,filesep,'*.*'));
    
    if length(n_aux)>=3
                
        n_dcm=dir(strcat(origin_path,filesep,'*.dcm'));

        if isempty(n_dcm)

            n_ima=dir(strcat(origin_path,filesep,'*.IMA'));

            if isempty (n_ima)
                n_review=dir(strcat(origin_path,filesep,'*.mat'));

                if isempty(n_review)
                    outmessage({'Tere are NO dicom nor MRI nor matlab files in this folder'})
                    return
                    %break
                else   %review = 1

                    outmessage({'You are starting to REVIEW labeled images'})
                    N=length(n_review);
                    origin_dir= n_review;
                    mode=1;

                end
            else
                outmessage ({'You are starting to LABEL MRI images'})
                N=length(n_ima);
                origin_dir= n_ima;
                mode=2; 

            end

        else %new images = 0  
            outmessage({'You are starting to LABEL DICOM images'})
            N=length(n_dcm);
            origin_dir= n_dcm;
            mode=0; 

        end
        
    else
         % Son imagenes sin .dcm o .IMA
         n_aux = dir(strcat(origin_path,filesep));
         N=length(n_aux(3:end));
         origin_dir= n_aux(3:end);
           
        if isdicom (strcat(origin_path,filesep,origin_dir(1).name))
                   
            A = dicominfo (strcat(origin_path,filesep,origin_dir(1).name));
        
            if strcmp( A.Modality,'MR')
                outmessage ({'You are starting to LABEL MRI images'})      
                mode=2; 
            elseif strcmp (A.Modality,'US')
                 outmessage({'You are starting to LABEL DICOM images'})
                 mode = 0;
            else
                 outmessage({'There are NO dicom nor MRI nor matlab files in this folder'})
                 %break
                 return
            end
        else
            outmessage({'There are NO dicom nor MRI nor matlab files in this folder'})
            %break
            return
        end
        
    
    end

    
    
end

idxFLM=1; %we start with the first image

read_files_on_folder;

set(h1.backward_button,'Visible','on','Enable','off');
if idxFLM == N
    set(h1.forward_button,'Visible','on','Enable','off');
else 
    set(h1.forward_button,'Visible','on','Enable','on');
end

set(h1.selectIm_button,'Enable','on');
set (h1.total_edit,'String',num2str(N));
set(h1.contrast_button,'enable','on');
set(h1.ilumination_button,'enable','on');
set(h1.restore_button,'Enable','on');
set(h1.fixRect_button,'Enable','off');
set(h1.roi_button,'Enable','off');


clear n_aux n_dcm n_ima
