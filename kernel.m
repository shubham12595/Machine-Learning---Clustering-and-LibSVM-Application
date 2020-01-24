%Chi-square Implementation
[trainK,testK]=cmpExpX2Kernel(trd.trD',tstd.tstD',25);

function [trainK, testK] = cmpExpX2Kernel(trainD, testD, gamma)
for i =1:size(trainD,1)
    trainK(i, 1) = i;
    for j = 1 :size(trainD,1)
        [kernel] = compker(trainD(i,:)',trainD(j,:)',gamma);
        trainK(i,j+1) = kernel;
    end
end

for i =1:size(testD,1)
    testK(i, 1) = i;
    for j = 1 :size(trainD,1)
        [kernel] = compker(testD(i,:)',trainD(j,:)',gamma);
        testK(i,j+1) = kernel;
    end
end
end

function [kernel] = compker(tr,test,gamma)
    numerator = (tr - test).^2;
    denominator = tr +test + 0.00001;
    value = (sum(numerator./denominator)/gamma);
    kernel = exp(-1*value);
end
    


