function run_classifier

    %Set the sample sizes========================================================
    trainingSamples = 1000;
    testingSamples = 10000;
    %Create the training and target sets.
    [trainingData,trainingTarget] = GenerateGaussianData(trainingSamples);
    [testingData,testingTarget] = GenerateGaussianData(testingSamples);
    disp(size(testingData));
    %==============================================================================
                       %Transpose the trainingData to plot.
    %==============================================================================
    trainingData = trainingData';
    testingData = testingData';
    %==============================================================================
    %Split the data into the first class for training - 1 0 
    class1 = trainingData(1:1000,1:2);
    %Split the data into the second class for training - 0 1
    class2 = trainingData(1001:end,1:2);
    %Split the data into the first class for training - 1 0 
    trainclass1 = testingData(1:10000,1:2);
    %Split the data into the second class for training - 0 1
    trainclass2 = testingData(10001:end,1:2);
    %==============================================================================
 
    %==============================================================================
                              %Training: Calculate Probability 1
    %==============================================================================
   
    a = calculateProbability(trainingData(:,1),mean(class1(:,1)),var(class1(:,1)));
    b = calculateProbability(trainingData(:,2),mean(class1(:,2)),var(class1(:,2)));
    c = calculateProbability(trainingData(:,1),mean(class2(:,1)),var(class2(:,1)));    
    d = calculateProbability(trainingData(:,2),mean(class2(:,2)),var(class2(:,2)));
    
    a_probability = (a .* b);
        
    b_probability = (c .* d);
    
    class_label = assign_label(a_probability , b_probability);

    
    %==============================================================================
    %                          Testing : Calculate Probability
    %==============================================================================
    test_a = calculateProbability(testingData(:,1),mean(trainclass1(:,1)),var(trainclass1(:,1)));
    test_b = calculateProbability(testingData(:,2),mean(trainclass1(:,2)),var(trainclass1(:,2)));
    test_c = calculateProbability(testingData(:,1),mean(trainclass2(:,1)),var(trainclass2(:,1)));
    test_d = calculateProbability(testingData(:,2),mean(trainclass2(:,2)),var(trainclass2(:,2)));
    %==============================================================================
% 
%     
    %==============================================================================
    %                              Testing : Calculate Class Label
    %==============================================================================
    test_a_probability = (test_a .* test_b);
    
    test_b_probability = (test_c .* test_d);

    test_class_label = assign_label(test_a_probability , test_b_probability);
        
%     
    %==============================================================================
    %                              Training : Plot the training set
    %==============================================================================
    x1 = trainingData(:,1);
    x2 = trainingData(:,2);
    
    %Plot the graph.
    figure(1);hold on;
    title('Raw Data');
    xlabel('x-value');
    ylabel('y-value');
    scatter(x1(class_label == 1), x2(class_label == 1), 120, 'b', '.');
    scatter(x1(class_label == -1), x2(class_label == -1), 120, 'r', '.');
    
    %==============================================================================
    %                              Testing : Plot the testing set
    %==============================================================================
    
    x1 = testingData(:,1);
    x2 = testingData(:,2);
    
    figure(2);hold on;
    title('Raw Data');
    xlabel('x-value');
    ylabel('y-value');
    scatter(x1(test_class_label == 1), x2(test_class_label == 1), 120, 'b', '.');
    scatter(x1(test_class_label == -1), x2(test_class_label == -1), 120, 'r', '.');

end 
