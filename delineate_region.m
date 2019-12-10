%delineated_region

function [ROI,contour]=delineate_region(A,h1)

%  
%     imagesc(A,'Parent',h1.axes1);
%     hold on
%       
%     axes(h1.axes1)
%     
    metadata=mark_structure(A,h1);
    ROI=metadata.ROI;
    contour = metadata.Contour;
    clear metadata;
end
