%save_image_roi_png

%% GUARDA LA IMAGEN MOSTRADA EN AXIS, pero no lo que se ve, bueno 
%% para seleccionar la imagen idonea de un conjunto de imagenes (select_image)
% rgb = getimage(h1.axes1);
% [nom,ruta]=uiputfile({'*.png'},'guardar imagen');
% fName = fullfile(ruta,nom);
% imwrite(rgb,fName);

[nom,ruta]=uiputfile({'*.png'},'guardar imagen');
fName = fullfile(ruta,nom);
F = getframe(h1.axes1);
figure ()
image(F.cdata);
axis off
saveas(gcf,fName,'png');
close gcf