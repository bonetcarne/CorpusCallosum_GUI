%read_files_on_folder

clear Ai;
clear A;

if  mode==0 %new dicom image mode
    clear delineated
       
    Ai=dicominfo([origin_path filesep origin_dir(idxFLM).name]);
    A=dicomread([origin_path filesep origin_dir(idxFLM).name]);
    
    %Takes first frame of the video
    if ndims(A)>3
        A=squeeze(A(:,:,:,1));
    end
    %DICOM plot
    imagesc(rgb2gray(A),'Parent',h1.axes1);
    colormap(h1.axes1,gray);
    set(h1.axes1,'Visible','off');
    set(h1.saveIm_button,'Visible','on','backgroundColor',[0.9922 0.9176 0.7961],'enable','off');
    set(h1.save_change_button,'Visible','off','backgroundColor',[0.9922 0.9176 0.7961],'enable','off');
    
    hold off
elseif mode ==1 %review image
    
    % configuration
    set(h1.contrast_button,'Enable','off');
    set(h1.ilumination_button,'Enable','off');
    set(h1.restore_button,'Enable','off');
    
    clear delineated A Ai aux
   
    load ([origin_path filesep origin_dir(idxFLM).name])
    A=delineated.Image;    
    Ai=delineated.dcminfo;
    
    aux = origin_dir(idxFLM).name;
    %plot
   
    if strcmpi (aux(1:6),'cc_Us_')
         imagesc(rgb2gray(A),'Parent',h1.axes1); %dibuja imagen Us
    else 
         imagesc(A,'Parent',h1.axes1); %dibuja imagen MRI
    end
     
    colormap(h1.axes1,gray);
    set(h1.axes1,'Visible','off');
    axes(h1.axes1), hold off;
    set(h1.saveIm_button,'enable','off','BackgroundColor',[0.9922 0.9176 0.7961]);
    set(h1.validate_button,'enable','off','BackgroundColor',[0.9922 0.9176 0.7961]);
    fill_fields_matlab_image;
    set(h1.restore_button,'Enable','off');

else %new mri image mode
    clear delineated
    
    Ai=dicominfo([origin_path filesep origin_dir(idxFLM).name]);
    A=dicomread([origin_path filesep origin_dir(idxFLM).name]);
       
    %DICOM plot
    imagesc(A,'Parent',h1.axes1);
    colormap(h1.axes1,gray);
    set(h1.axes1,'Visible','off');
    set(h1.saveIm_button,'Visible','on','backgroundColor',[0.9922 0.9176 0.7961],'enable','off');
    set(h1.save_change_button,'Visible','on','backgroundColor',[0.9922 0.9176 0.7961],'enable','off');
    hold off
        
end



set(h1.selectIm_button,'Visible','on');
set(h1.num_edit,'String',num2str(idxFLM));
set(h1.name_edit,'string',origin_dir(idxFLM).name);
