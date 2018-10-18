% This scipt was used to plot performances

y=zeros(6,15);
mod_vec={'PSK';'PSK';'PSK';'QAM';'QAM';'QAM'};
ord_vec=[2,4,8,8,16,64];
MC=500;
tic
for i=1:length(mod_vec)
    
        y(i)= testPerform(MC,char(mod_vec(i)),ord_vec(i),15);
    
    i
end
% figure (4)
% plot(-12:3:30,y(1,:))
% hold on
% plot(-12:3:30,y(2,:))
% plot(-12:3:30,y(3,:))
% plot(-12:3:30,y(4,:))
% plot(-12:3:30,y(5,:))
% plot(-12:3:30,y(6,:))
% toc