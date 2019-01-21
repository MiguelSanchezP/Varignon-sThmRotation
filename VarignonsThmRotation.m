%Obtenció dels punts
punts=[];
valorsX=[];
valorsY=[];
for i=1:4
  printf("P%d's X:", i);
  tempX=input(' ');
  printf("P%d's Y:", i);
  tempY=input(' ');
  tempPunt = [tempX tempY];
  punts = [punts;tempPunt];
  valorsX=[valorsX tempX];
  valorsY=[valorsY tempY];
endfor
for lambda=0:0.01:1
%Representació de les unions entre punts sobre el pla
hold off;
for i=1:3
  axis off;
  hold on;
  plot([punts(i,1) punts((i+1),1)],[punts(i,2) punts((i+1),2)],'k')
endfor
hold on;
axis off;
plot([punts(4,1) punts(1,1)],[punts(4,2) punts(1,2)],'k')

  %Càlcul dels punts mitjans dels segments
  puntsAct = [];
  for i=1:3
    tempPuntX=(punts((i+1),1)-punts(i,1));
    tempPuntY=(punts((i+1),2)-punts(i,2));
    meitatX=tempPuntX*lambda;
    meitatY=tempPuntY*lambda;
    nouPunt=[meitatX meitatY];
    puntsAct = [puntsAct;nouPunt];
  endfor
  tempPuntX=(punts(1,1)-punts(4,1));
  tempPuntY=(punts(1,2)-punts(4,2));
  meitatX=tempPuntX*lambda;
  meitatY=tempPuntY*lambda;
  nouPunt=[meitatX meitatY];
  puntsAct = [puntsAct;nouPunt];
  %Càlcul de la posició dels punts respecte dels corresponents vectors
  puntsDef=[];
  for i=1:4
    valorX=punts(i,1)+puntsAct(i,1);
    valorY=punts(i,2)+puntsAct(i,2);
    nouPunt=[valorX valorY];
    puntsDef=[puntsDef;nouPunt];
  endfor
  %Representació del paral·lelogram comprès dins la figura quadrangular
  for i=1:3
    axis off;
    hold on;
    plot([puntsDef(i,1) puntsDef((i+1),1)],[puntsDef(i,2) puntsDef((i+1),2)],'g')
  endfor
  axis off;
  hold on;
  plot([puntsDef(4,1) puntsDef(1,1)],[puntsDef(4,2) puntsDef(1,2)],'g')
  %text(['Nombre de radis: '])
  %annotation('textbox', [0.5, 0.2, 0.1, 0.1], 'String', "hi")
  text(max(valorsX)*1.05,max(valorsY),['valor de Lambda: ',num2str(lambda)])
  pause(0.5)
endfor