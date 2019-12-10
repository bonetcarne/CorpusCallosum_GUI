%save_image_png

[nom,ruta]=uiputfile({'*.png'},'Save image');
fName = fullfile(ruta,nom);


aux = get(h1.axes1,'Children');

figure
axes
axis off
%copyobj(aux(end-20),gca);

imagesc(A)


% añadimos los ajustes de la imagen seleccionada de contraste, iluminación
% y zoom si los tiene
colormap gray
set(gca,'CLim',get(h1.axes1,'CLim'))
set(gca,'YDir','reverse')
% set(gca,'XLim',get(h1.axes1,'XLim'))
% set(gca,'YLim',get(h1.axes1,'YLim'))

saveas(gcf,fName,'png');
close 
clear aux



% if exist('F') % tenemos una copia guardada
%     figure (), axis off  
%     
%     kkk = get(h1.axes1);
%     CLim = kkk.CLim;
%     
%     hm=imagesc(F.cdata);
%     
% 
%     saveas(gcf,fName,'png');
%     close gcf
% else
%     F = getframe(h1.axes1);
%     figure (), axis off  
%     image(F.cdata);
%     saveas(gcf,fName,'png');
%     close gcf
% end


clear  fName nom ruta
