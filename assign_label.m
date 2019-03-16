function class_label = assign_label(a_probability,b_probability)

    for i = 1:length(a_probability)
        if(a_probability(i) >= b_probability(i))
            class_label(i,1) = 1;
        else
            class_label(i,1) = -1;
        end
    end
    
end