% This scipt was used to plot performances of the cascade configuration
y=zeros(6,15);
mod_vec={'PSK';'PSK';'PSK';'QAM';'QAM';'QAM'};
ord_vec=[2,4,8,8,16,64];
MC=500;
tic
for i=1:length(mod_vec)
    
    parfor j=1:8
        y(i,j)= testPerformCascade(MC,char(mod_vec(i)),ord_vec(i),j*6-18);
    end
    toc
end
X = -12:3:30;
plot(X,y(1,:))
hold on
plot(X,y(2,:))
plot(X,y(3,:))
plot(X,y(4,:))
plot(X,y(5,:))
plot(X,y(6,:))


Xi = -12:1:30;
for i=1:6
    yi(i,:) = pchip(X,y(i,:),Xi);
end
figure(5)
plot(Xi,yi(1,:))
hold on
plot(Xi,yi(2,:))
plot(Xi,yi(3,:))
plot(Xi,yi(4,:))
plot(Xi,yi(5,:))
plot(Xi,yi(6,:))
