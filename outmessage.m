
function outmessage(mss);

figure(1)
pos = [10 10 400 10];
h = uicontrol('Style','Text','Position',pos);

posp=[444   517   454    82];
hp=get(h,'Parent');
set(hp,'Position',posp);

[outstring,newpos] = textwrap(h,mss);
pos(4) = newpos(4);
set(h,'String',outstring,'Position',[pos(1),pos(2),pos(3)+10,pos(4)])
pause
close(hp)