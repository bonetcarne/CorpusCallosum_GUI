%eliminate_image

delete (strcat(output_save_path,filesep,n_review(idxFLM).name));

n_review=dir(strcat(origin_path,filesep,'*.mat'));
N=length(n_review);
origin_dir= n_review;

if (idxFLM==1 && N==0)
     outmessage ({'There is no labeled image'});
     initial_labeling_FBrain;
     break

elseif (idxFLM==1 && N==1)
    set(h1.backward_button,'Enable','off');
    set(h1.forward_button,'Enable','off')

elseif (idxFLM == 1)
    set(h1.forward_button,'Enable','on')
    set(h1.backward_button,'Enable','off');
    
elseif (idxFLM == N+1)
    idxFLM = idxFLM -1;
    set(h1.forward_button,'Enable','off')
    set(h1.backward_button,'Enable','off');
    
elseif (idxFLM == N)
    set(h1.forward_button,'Enable','on')
    set(h1.backward_button,'Enable','off');
    
else
    set(h1.forward_button,'Enable','on')
    set(h1.backward_button,'Enable','on');
end

% if (idxFLM == N+1 && idxFLM == 1)
%     outmessage ({'There is no labeled image'});
%     initial_labeling_FBrain;
% %    axes(h1.axes1); cla reset
% %    
% %   set(h1.axes1,'Visible','off')
% %    set(h1.area1_edit,'String','')
% %     set(h1.area1_edit,'String','')
% %     set(h1.area1_edit,'String','')
% %        set(h1.area1_edit,'String','')
% %         set(h1.area1_edit,'String','')
% %          set(h1.area1_edit,'String','')
% 
%     break
%     
% elseif (idxFLM == N+1 && N==1)
%         idxFLM = idxFLM-1;
%          set(h1.backward_button,'Enable','off');
%         set(h1.forward_button,'Enable','off')
% elseif idxFLM == N
%     idxFLM;
%     set(h1.backward_button,'Enable','off');
%     set(h1.forward_button,'Enable','off')
% elseif idxFLM == 1
%     set(h1.backward_button,'Enable','off');
%     set(h1.forward_button,'Enable','on')
% else 
%         idxFLM;
%     set(h1.backward_button,'Enable','on');
%     set(h1.forward_button,'Enable','on')
% end

read_files_on_folder;
set(h1.total_edit,'String',num2str(N));

set(h1.discard_button,'Enable','off','BackgroundColor',[0.9922 0.9176 0.7961]);
set(h1.save_change_button,'Enable','off','BackgroundColor',[0.9922 0.9176 0.7961]);
set(h1.cancel_button,'Enable','off','BackgroundColor',[0.9922 0.9176 0.7961]);
