%next_image

idxFLM = idxFLM + 1;

if mode == 1 %review
    clear_screen;
    set(h1.axes1,'visible','off')
end

if idxFLM == N %vemos la última imagen
    
  read_files_on_folder
  set(h1.backward_button,'enable','on');
  set(h1.forward_button,'enable','off');

elseif idxFLM > N
   idxFLM = idxFLM-1;
   read_files_on_folder
   set(h1.backward_button,'enable','on'); 
            
else 
  read_files_on_folder
  set(h1.backward_button,'enable','on');
  set(h1.forward_button,'enable','on');
            
end
    
    


