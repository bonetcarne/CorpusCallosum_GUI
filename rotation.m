function [p,rotation_points] = rotation (X,hh,ellipse)

nrows = size(X,1); 
ncols = size (X,2);


if ellipse % Ellipse selection
        
    [h,api]=imRectRot('hParent',hh.axes1,'ellipse',1,'rotate',1);
    pause
    api.setStyle('-',2,'r')
                
    position = api.getPos();  
    angle_deg = position (5);
    angle_rad =angle_deg*pi/180;
    
    % ellipse eq
    
    t = 0:pi/20:2*pi;
    if position(4)<position(3)
        r_min = position (4)/2;
        r_max = position (3)/2;
    else
        r_min = position (3)/2;
        r_max = position (4)/2;
        
    end
       
    % calculate the center of the rectangle
    Ax=( position(3)/2+ position(1));
    Ay=( position(4)/2+ position(2));
    % calculate points of the ellipse
    x = r_min*cos(t)+Ax;
    y = r_max*sin(t)+Ay;
    % rotate the points
    mat_rotation = [cos(angle_rad),-sin(angle_rad);sin(angle_rad),cos(angle_rad)];
    
else % Rectangle selection
   
    [h,api]=imRectRot('hParent',hh.axes1,'rotate',1,'ellipse',0);

    pause
    api.setStyle('-',2,'r')
       
     
    position = api.getPos();
    angle_deg = position (5);
    angle_rad =angle_deg*pi/180;
    % rectangle points
    x(1) = position(1);
    x(2) = position (1)+position(3);
    x(4) = position(1);
    x(3) = position(1)+position(3);

    y(1) = position (2); 
    y(2) = position (2);
    y(4) = position(2)+ position(4);
    y(3) = position(2)+ position(4);

    % calculate the center of the rectangle
    Ax=( position(3)/2+ position(1));
    Ay=( position(4)/2+ position(2));
    
    % rotate the points
    mat_rotation = [cos(angle_rad),-sin(angle_rad);sin(angle_rad),cos(angle_rad)];
 end

% % rotate the points
% mat_rotation = [cos(angle_rad),-sin(angle_rad);sin(angle_rad),cos(angle_rad)];
    
for i=1:length(x)
    rotation_points(:,i) = mat_rotation*[x(i)-Ax;y(i)-Ay]+[Ax;Ay];
end
    
rotation_points = rotation_points';
    
% pixel units
ydata = double([1 nrows]);
xdata = double([1 ncols]);

roix = axes2pix(ncols,xdata,rotation_points(:,1));
roiy = axes2pix(nrows,ydata,rotation_points(:,2));
    
% close the polygon
roix = [roix;roix(1)];
roiy = [roiy; roiy(1)];

% create a mask
p = poly2mask(roix,roiy,nrows,ncols);

% area = número de pixeles que forman la mascara
% numel_pix = regionprops (p,'Area');
% area=resX*resY*numel_pix.Area;

 






