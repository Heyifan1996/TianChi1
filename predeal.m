[~,~,DataCell]=xlsread('C:\Users\hyf\Desktop\社交网络\天池\scheduling_preliminary_b_app_interference_20180726.csv');
for i=1:length(DataCell)
    for j=1:2
 A= DataCell{i,j};     
 a=A(5:end);
 DataCell{i,j}=str2double(a);
    end
end
app2k=cell2mat(DataCell);
clear a A  DataCell i j;
[~,~,DataCell]=xlsread('C:\Users\hyf\Desktop\社交网络\天池\scheduling_preliminary_b_app_resources_20180726.csv');
app_res=zeros(length(DataCell),201);
for i=1:length(DataCell) 
 A= DataCell{i,1};     
 a=A(5:end);
 app_res(i,1)=str2double(a); 
end
for i=1:length(DataCell)
    temp=DataCell{i,2};
    temp1=strsplit(temp,'|');
    temp=zeros(1,length(temp1));
    for j=1:length(temp1)
        temp(1,j)=str2double(temp1{j});
    end
    app_res(i,2:99)=temp;
end
for i=1:length(DataCell)
    temp=DataCell{i,3};
    temp1=strsplit(temp,'|');
    temp=zeros(1,length(temp1));
    for j=1:length(temp1)
        temp(1,j)=str2double(temp1{j});
    end
    app_res(i,100:197)=temp;
end
for i =1:length(DataCell)
    for j=198:201
        app_res(i,j)=DataCell{i,j-194};
    end
end
clear temp temp1;
[~,~,DataCell]=xlsread('C:\Users\hyf\Desktop\社交网络\天池\scheduling_preliminary_b_instance_deploy_20180726.csv');
L=length(DataCell);
inst=zeros(size(DataCell));
for i =1:L
    temp1=DataCell{i,1};
    temp2=DataCell{i,2};
    temp3=DataCell{i,3};
    inst(i,1)=str2double(temp1(6:end));
    inst(i,2)=str2double(temp2(5:end));
    if isnan(temp3)
        inst(i,3)=0;
    else
        inst(i,3)=str2double(temp3(9:end));
    end
end
clear temp1 temp2 temp3 L i;
[~,~,DataCell]=xlsread('C:\Users\hyf\Desktop\社交网络\天池\scheduling_preliminary_b_machine_resources_20180726.csv');
L=length(DataCell);
for i =1:L
    temp=DataCell{i,1};
   DataCell{i,1}=str2double(temp(9:end)); 
end
mach=cell2mat(DataCell);
save dataB app2k app_res inst mach;
clear;
