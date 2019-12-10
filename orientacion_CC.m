function posicion = orientacion_CC(ROI, line_long, rectangle)


    nrows = size(ROI,1); 
    ncols = size (ROI,2);
    ydata = double([1 nrows]);
    xdata = double([1 ncols]);


    area_sup_lim=[line_long(1,:);rectangle(1:2,:);line_long(2,:)];
    area_inf_lim=[line_long(1,:);rectangle(4,:);rectangle(3,:);line_long(2,:)];


    roix = axes2pix(ncols,xdata,area_sup_lim(:,1));
    roiy = axes2pix(nrows,ydata,area_sup_lim(:,2));

    mask_sup = poly2mask(roix,roiy,nrows,ncols).*ROI;
    
    clear roix roiy
    
    roix = axes2pix(ncols,xdata,area_inf_lim(:,1));
    roiy = axes2pix(nrows,ydata,area_inf_lim(:,2));


    mask_inf = poly2mask(roix,roiy,nrows,ncols).*ROI;

    if (sum(sum(mask_sup)) > sum(sum(mask_inf)))
        
        %si la posicion es 1 indica que la linea pto1-2 del rectangulo es
        %desde donde salen las divisiones (
        
        posicion = 1;
        
    else
         %si la posicion es 0 indica que la linea pto3-4 del rectangulo es
        %desde donde salen las divisiones 
        posicion = 0;
    end
        
end


