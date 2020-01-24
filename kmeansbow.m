function [pred, C,sumsquares,t] = kmeansbow(X, k)
[n,d] = size(X);
prev = zeros(n,1);
C = randi([0 255],k,size(X,2));
for t = 1:20
    for i = 1:size(X,1)
        min1 = Inf;
        for j = 1:k
             sqdist = sqrt((X(i,:)-C(j,:))*(X(i,:)-C(j,:))');
            if sqdist<min1
                min1 = sqdist;
                pred(i,1)=j;
            end
        end
    end
    %This is the convergence condition
    if pred ==prev
        break
    end
    prev = pred;
    sumsquares =0;
    C = zeros(k,d);
    for j=1:k
        C(j,:) = mean(X(pred==j,:));
    end  
    sumsquares = sumsquaresval(X,C,k);
end

function [sumsq] = sumsquaresval(X,C,k)
sumsq=0;
[n,d] = size(X);
for i = 1:n
        minimum =Inf;
        for j =1:k
            distance = X(i,:)-C(j,:);
            sq = distance *distance';
            if sq<minimum
                minimum = sq;
            end
        sumsq = minimum+sumsq;
        end
end


