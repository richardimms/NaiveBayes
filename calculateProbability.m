function probability = calculateProbability(x,u,var)

    %Convert the variance to the square root. 
    %This could be done at an earlier stage then passed through.
    o = sqrt(var);
    
    %Calculate the probability of something occuring using a gaussian
    %distribution.
    probability = (1/sqrt(2*pi*(o.^2))*exp(-((x-u).^2)/(2*(o.^2))));

end