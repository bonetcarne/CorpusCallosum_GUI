%cancel
clear_screen
if N == 1
   set(h1.backward_button,'Enable','off');
   set(h1.forward_button,'Enable','off');
   set(h1.selectIm_button,'Enable','on');
   
elseif idxFLM == N
  set(h1.backward_button,'Enable','on');
elseif idxFLM ==1
  set(h1.forward_button,'Enable','on');
else
  set(h1.backward_button,'Enable','on'); 
  set(h1.forward_button,'Enable','on');
end
set(h1.selectIm_button,'Enable','on');
set(h1.contrast_button,'Enable','on');
set(h1.ilumination_button,'enable','on');

%mostramos la imagen
set(h1.total_edit,'String',num2str(N));
read_files_on_folder

clear rectangle mask_ROI ncols nrows F ROI area contour distancia intersection lines long maska roix roiy rot_pto sum_ROI sum_mask xdata ydata

if mode == 1 %review
    set(h1.cancel_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961])
    set(h1.save_change_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961])
    set(h1.discard_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961])
end

set(h1.roi_button,'Enable','off');
set(h1.validate_delineation_button,'Visible','off');
set(h1.calculate_button,'Visible','off');
   set(h1.fixRect_button,'Enable','off'); 