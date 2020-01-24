trd=load('trD.mat');
tstd=load('tstD.mat');
[trIds, trLbs] = ml_load('D:\Subjects\ML\hw5data\bigbangtheory_v3\train.mat','imIds', 'lbs');
model=svmtrain(trLbs,x_train,'-t 4 -c 500 -g 1');
[pred,acc,prob]=svmpredict(ones(1600,1),x_test,model);
csvwrite('pred3.csv',pred);
