%contrast_change

clear kk;

kk=get(h1.axes1);
CLim=kk.CLim;

switch mode 
    
    case 0 %dicom image
                
        CLim(1)=CLim(1)+10;
        CLim(2)=CLim(2)-10;
        
        
         if or(isnan(CLim(1)),isnan(CLim(2)))
            CLim=kk.CLim;
         end
         
    case 1 %review
         clear aux
         aux = get(h1.name_edit,'String');
        
         if strcmpi (aux(1:6),'cc_Us_')
             CLim(1)=CLim(1)+10;
             CLim(2)=CLim(2)-10;
             if or(isnan(CLim(1)),isnan(CLim(2)))
                CLim=kk.CLim;
            end
         else
              CLim(1)=CLim(1)+100;
              CLim(2)=CLim(2)-100;
        
              if or(isnan(CLim(1)),isnan(CLim(2)))
                CLim=kk.CLim;
              end   
         end
        
             
    case 2 %mri image
        
        CLim(1)=CLim(1)+100;
        CLim(2)=CLim(2)-100;
        
        if or(isnan(CLim(1)),isnan(CLim(2)))
            CLim=kk.CLim;
        end      
    
end
set(h1.axes1,'CLim',CLim); 

clear   CLim