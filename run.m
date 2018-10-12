%     Rotation_bl=[0.999997317791, -0.0012618949404, -0.00204181019217;
% 0.00126225803979, 0.999999344349, 0.000176606932655;
% 0.00204157968983, -0.000179146139999, 0.999997913837];
%     Translation_bl=[-0.275269329548; -1.00935471058; 0.496799409389];
%  
%     Rotation_tr=[0.99918627739, -0.0184239987284, 0.0358853265643;
% 0.0203666649759, 0.998304545879, -0.0545434169471;
% -0.0348195880651, 0.0552297234535, 0.997866511345];
%     Translation_tr=[-1.25259315968; -0.101401604712; -0.332054823637];
%  
%     Rotation_br=[0.998996973038, -0.00567072350532, 0.0444314330816;
% 0.00510009098798, 0.999903202057, 0.0129451556131;
% -0.0445005595684, -0.0127057237551, 0.998928368092];
%     Translation_br=[-1.22157287598; -1.01184976101; 0.381609588861];
%    
%      Rotation_tl=[0.998992323875, -0.0252048708498, -0.0371429137886;
% 0.0231364183128, 0.998213231564, -0.0551012866199;
% 0.0384653992951, 0.0541863106191, 0.997789859772];
%     Translation_tl=[-0.312863647938; -0.134268149734; -0.0673762187362];

% 
% 
%    Rotation_tl=[0.999871850014, 0.00737577583641 0.0142005495727;
% -0.00785240065306, 0.999397158623, 0.0338071770966;
% -0.0139425145462, -0.0339143797755, 0.999327659607];
%     Translation_tl=[0.161779895425 ;1.40575885773; 0.265985548496];
% 
%     Rotation_tr=[0.999230027199 ,-0.0391049347818 -0.00310821156017;
% 0.0391988009214 ,0.998410642147, 0.0404822304845;
% 0.00152025429998 ,-0.0405728928745, 0.99917536974];
%     Translation_tr=[-1.24767386913; 1.4411329031; 0.29074215889];
% 
%     Rotation_bl=[0.999849081039, 0.0114023685455 ,0.0130988126621;
% -0.0119665917009, 0.998966813087, 0.043834451586;
% -0.0125853801146, -0.043984554708, 0.998952865601];
%     Translation_bl=[0.242426380515; 0.156100153923; 0.321060448885];
%     
%      Rotation_br=[0.999944925308, -0.0104154888541 -0.000792871345766;
% 0.0104146664962, 0.999944508076, -0.00109819113277;
% 0.000804319221061, 0.00108986883424, 0.999999165535];
%     Translation_br=[-1.20989656448; 0.0538916774094; 0.408168435097];


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
