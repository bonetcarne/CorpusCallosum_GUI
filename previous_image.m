%previous_image

idxFLM = idxFLM-1;

if mode==1
    clear_screen;
end

if idxFLM == 1 % está al principio del directorio

    set(h1.backward_button,'enable','off');
    set(h1.forward_button,'enable','on');
    read_files_on_folder

else  
     set(h1.forward_button,'enable','on');
     read_files_on_folder
end
