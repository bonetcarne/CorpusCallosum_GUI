% fill_fields_matlab_image

set(h1.uipanel1,'Visible','on');
set(h1.uipanel5,'Visible','on');
%set(h1.axes2,'Visible','off');
set(h1.roi_button,'enable','Off');
set(h1.fixRect_button,'enable','off');
%set(h1.orientation_button,'enable','off');
set(h1.calculate_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961]);
set(h1.saveIm_button,'Enable','off');
set(h1.saveRoi_button,'Visible','on');
set(h1.selectIm_button,'Enable','on');
set(h1.type_div_popup,'Visible','off');


set(h1.nhc_edit,'String',delineated.NHC);

%set(h1.group_menu,'String',delineated.Group);

set(h1.height1_edit,'String',num2str(delineated.Hofer_2002.Height1));
set(h1.height2_edit,'String',num2str(delineated.Hofer_2002.Height2));
set(h1.height3_edit,'String',num2str(delineated.Hofer_2002.Height3));
set(h1.height4_edit,'String',num2str(delineated.Hofer_2002.Height4));

set(h1.length_edit,'String',num2str(delineated.Hofer_2002.TotalLength));

set(h1.VHigh1_edit,'String',num2str(delineated.Hofer_2002.VHigh1));
set(h1.VHigh2_edit,'String',num2str(delineated.Hofer_2002.VHigh2));

set(h1.area1_edit,'String',num2str(delineated.Hofer_2002.Area1));
set(h1.area2_edit,'String',num2str(delineated.Hofer_2002.Area2));
set(h1.area3_edit,'String',num2str(delineated.Hofer_2002.Area3));
set(h1.area4_edit,'String',num2str(delineated.Hofer_2002.Area4));
set(h1.area5_edit,'String',num2str(delineated.Hofer_2002.Area5));

set(h1.TotalArea1_edit,'String',num2str(delineated.Hofer_2002.TotalArea));

    %% put data in the boxes WS 1989
    set(h1.height11_edit,'String',num2str(delineated.Witelson_1989.Height1));
    set(h1.height12_edit,'String',num2str(delineated.Witelson_1989.Height2));
    set(h1.height13_edit,'String',num2str(delineated.Witelson_1989.Height3));
    set(h1.height14_edit,'String',num2str(delineated.Witelson_1989.Height4));
    set(h1.height15_edit,'String',num2str(delineated.Witelson_1989.Height5));
    set(h1.height16_edit,'String',num2str(delineated.Witelson_1989.Height6));
    set(h1.length12_edit,'String',num2str(delineated.Witelson_1989.TotalLength));

    set(h1.VHigh12_edit,'String',num2str(delineated.Witelson_1989.VHigh1));
    set(h1.VHigh22_edit,'String',num2str(delineated.Witelson_1989.VHigh2));

    set(h1.area11_edit,'String',num2str(delineated.Witelson_1989.Area1));
    set(h1.area12_edit,'String',num2str(delineated.Witelson_1989.Area2));
    set(h1.area13_edit,'String',num2str(delineated.Witelson_1989.Area3));
    set(h1.area14_edit,'String',num2str(delineated.Witelson_1989.Area4));
    set(h1.area15_edit,'String',num2str(delineated.Witelson_1989.Area5));
    set(h1.area16_edit,'String',num2str(delineated.Witelson_1989.Area6));
    set(h1.area17_edit,'String',num2str(delineated.Witelson_1989.Area7));

   
    set(h1.TotalArea12_edit,'String',num2str(delineated.Witelson_1989.TotalArea));



% pintamos la ROI 

if strcmp(Ai.Modality,'MR') % pintamos imagen de resonancia
    
    imagesc(double(A)+1000.*delineated.ROI,'Parent',h1.axes1);
    
else % pintamos imagen US
    imagesc(double(delineated.Image(:,:,1))+ 100.*delineated.ROI,'Parent',h1.axes1);

end
 
 set(h1.axes1,'Visible','off')