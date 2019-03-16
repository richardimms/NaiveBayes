    %Set the sample sizes========================================================
    trainingSamples = 1000;
    testingSamples = 10000;
    %Create the training and target sets.
    [trainingData,trainingTarget] = GenerateGaussianData(trainingSamples);
    [testingData,testingTarget] = GenerateGaussianData(testingSamples);
    %==============================================================================
                       %Transpose the trainingData to plot.
    %==============================================================================
    trainingData = trainingData';
    testingData = testingData';
    
    %Split the data into the first class for training - 1 0 
    class1 = trainingData(1:1000,1:2);
    %Split the data into the second class for training - 0 1
   class2 = trainingData(1001:end,1:2);
    %Split the data into the first class for training - 1 0 
    trainclass1 = testingData(1:1000,1:2);
    %Split the data into the second class for training - 0 1
    trainclass2 = testingData(1001:end,1:2);

