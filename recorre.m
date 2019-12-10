function [mode,origin_dir,N] =recorre(direccion)

n_dcm=dir(strcat(direccion,'*.dcm'));

    if isempty(n_dcm)

        n_ima=dir(strcat(direccion,filesep,'*.IMA'));

        if isempty (n_ima)
            n_review=dir(strcat(direccion,filesep,'*.mat'));

            if isempty(n_review)
                outmessage({'There are NO dicom nor MRI nor matlab files in this folder'})
                return
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