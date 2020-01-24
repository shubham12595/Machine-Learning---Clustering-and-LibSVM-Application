%For question 2.1 and 2.2
K = [2,4,6];
for k = K
    [pred,C,sumsquares,t] = kmeans(digit,k);
    [p1,p2,p3]=paircount(pred,labels);
    p1 = p1*100;
    p2 = p2*100;
    p3 = p3*100;
    fprintf("For K=[%d] Iterations=[%d] SumOfSquares=[%f] p1=[%f] p2=[%f] p3=[%f]\n",k, t ,sumsquares, p1, p2, p3)
end

%For question 2.3 and question 2.4

K = [2,3,4,5,6,7,8,9,10];
averagep3 = 0;
averagep2=0;
averagep1=0;
sumli = [];
p1li = [];
p2li=[];
p3li = [];
for k = K
    SquareSum=0;
    sump1=0;
    sump2=0;
    sump3=0;
    for i = 1:20
        [pred,C,sumsquares,t] = kmeans(digit,k);
        [p1,p2,p3]=paircount(pred,labels);
        SquareSum = SquareSum +sumsquares;
        sump1= sump1+p1;
        sump2 = sump2 +p2;
        sump3 = sump3 +p3;
    end
    averagesum = SquareSum/20;
    averagep1 = (sump1/20)*100;
    averagep2 = (sump2/20)*100;
    averagep3 = (sump3/20)*100;
    sumli = [sumli,averagesum];
    p1li = [p1li,averagep1];
    p2li = [p2li,averagep2];
    p3li = [p3li,averagep3];
end

 figure
 plot(K, sumli);
 title('Sum of Squares over different values of K');
 xlabel('k values');
 ylabel('Sum of Squares');

 figure
 x1 = plot(K, p1li,'-r');
 hold on;
 
 x2 = plot(K, p2li,'-b');
 hold on;
 
 x3 = plot(K, p3li,'-g');
 
 title('P values over different values of K');
 xlabel('k values');
 ylabel('P values');
 hold off

