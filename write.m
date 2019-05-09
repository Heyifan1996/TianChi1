
Y=jieguo(result);
submit=cell(size(Y));
for i=1:size(Y,1)
   submit{i,1}=['inst_',num2str(Y(i,1))];
   submit{i,2}=['machine_',num2str(Y(i,2))];
end
unique(Y(:,1));
unique(Y(:,2));

xlswrite('C:\Users\hyf\Desktop\社交网络\submit_20180813.xlsx',submit);
xlswrite('C:\Users\hyf\Desktop\社交网络\天池\submit_20180813.xlsx','#',1,'A68220');
xlswrite('C:\Users\hyf\Desktop\社交网络\天池\submit_20180813.xlsx',submit,1,'A68221');


xlsread('C:\Users\hyf\Desktop\社交网络\submit_20180813.csv');