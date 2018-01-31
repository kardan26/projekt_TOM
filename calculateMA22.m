function [ rozwiazanie,bald,iteracje ] = calculateMA22( A,G, errorSize)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    F1 = [1.5; 1.5];
    p = 0.8;
    tempBlad = [0; 0];
    rozwiazanie(1,:) = F1;

    error = 1;
    i=1;
    while error>errorSize
        for j=1:1:size(F1,1)
            f2_1 = F1(j,1) * (G(j,1) / (A(j,:) * F1)) ^ p;
            tempBlad(i,j) = G(j,1) - (A(j,:) * F1);
            F1(j,1) = f2_1;
        end
        error = tempBlad(i,j);    
        rozwiazanie(i+1,:) = F1;
        i=i+1;
    end
    iteracje = 1:i-1;
    bald = sqrt((tempBlad(:,1)).^2+ (tempBlad(:,2)).^2);

end
