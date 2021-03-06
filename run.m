    Rotation_bl=[0.99927264452, -0.0289367809892, 0.024869857356;
0.028361491859, 0.99932974577, 0.0231843013316;
-0.0255241896957, -0.0224619600922, 0.99942189455];
    Translation_bl=[0.807284832001; -1.04869294167; 0.0647575259209];
 
    Rotation_tr=[0.99911159277, -0.0408159717917, -0.0106130642816;
0.0410202592611, 0.998963117599, 0.0197971314192;
0.00979386270046, -0.0202146954834, 0.999748051167];
    Translation_tr=[0.151046738029; -0.467341184616; -0.0102523230016];
 
    Rotation_br=[0.999335110188, -0.032772693783, 0.016012551263;
0.0318792536855, 0.998076379299, 0.0531817823648;
-0.0177247226238, -0.0526358895004, 0.998456716537];
    Translation_br=[0.146521434188; -1.04768192768; 0.0506705641747];
   
     Rotation_tl=[0.997388064861, -0.0475127883255, -0.0544119812548;
0.0481992922723, 0.998773634434, 0.0113741224632;
0.053804654628, -0.0139671145007, 0.99845379591];
    Translation_tl=[0.753482580185; -0.442443430424; 0.0520484931767];



    camera{1} = [Rotation_tl,Translation_tl];
    camera{2} = [Rotation_tr,Translation_tr];
    camera{3} = [Rotation_bl,Translation_bl];
    camera{4} = [Rotation_br,Translation_br];
    
scale=1;
BASE = scale*([0 1 0 0 0 0;
               0 0 0 1 0 0;
               0 0 0 0 0 1]);
figure('units','normalized','outerposition',[0 0 1 1])
plot3(BASE(1,:),BASE(3,:),-BASE(2,:),'b-','linewidth',2);
hold on;
axis equal;
rotate3d on;
grid on;

for i=1:size(camera,2)

M=camera{i};
R=M(:,1:3);T=M(:,4);


% 有�?�能需�?加入下�?�的代�?,都�?�以试试看
%  R = R';
%  T = -R*T;
%  M(:,1:3) = R; M(:,4) = T;


% ShowCam(R,T,scale,'y-');
Hd = [M;0,0,0,1];
f_3Dcamera(Hd,'r',0.1);  % here!!!
f_3Dframe(Hd,'r',0.5,['_{camera}',num2str(i)])

Zc= [0,0,2]';
Zc1 = R*Zc+T;
Oc = [0,0,0]';
Oc1 = R*Oc+T;
plot3([Oc1(1),Zc1(1)],[Oc1(2),Zc1(2)],[Oc1(3),Zc1(3)],'--g')
text(Zc1(1),Zc1(2),Zc1(3),strcat('camera',['_{',num2str(i),'}']) );

end

%%
Hd = [eye(3),[1;0;-0.2];0,0,0,1];
f_3Dcamera(Hd,'g',0.04)
