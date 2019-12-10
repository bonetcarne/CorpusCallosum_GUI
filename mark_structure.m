% mark_structure

function metadata=mark_structure(B,h2)


nrows = size(B,1);
ncols = size(B,2);
x = [1 ncols];
y = [1 nrows];
Bx=double(B);
% p=roipoly(B);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%figure(1);
%image(B),
%title(nmess)

%display(B)

[xi,yi] = getline(h2.axes1,'Parent','closed');
line(xi,yi,'color','yellow')

xi = double(xi);
yi = double(yi);
xdata = double(x);
ydata = double(y);
num_rows= double(nrows);
num_cols = double(ncols);

% Make sure polygon is closed.
if (~isempty(xi))
    if ( xi(1) ~= xi(end) || yi(1) ~= yi(end) )
        xi = [xi;xi(1)]; 
        yi = [yi;yi(1)];
    end
end
% Transform xi,yi into pixel coordinates.
roix = axes2pix(num_cols, xdata, xi);
roiy = axes2pix(num_rows, ydata, yi);

p = poly2mask(roix, roiy, num_rows, num_cols);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
 
metadata.ROI=p;
metadata.B=B;
metadata.Contour =[xi,yi];




