 %addpath 'C:\Users\Abdul Basit\Documents\MATLAB\netlab3_3'
%load the testingSet.dat file using the import function
%load the trainingSet.dat file using the import function
load predicted.output
trainingSet = importfile_training('trainingSet.dat', 1, 118);   %function call
testingSet = importfile_testing('testingSet.dat', 1, 60);      %function call
%pred_in = predicted;
testslabels = testingSet(:,1);     
predictedlabel = predicted(:,1);     
testingdata = testingSet(:,2:end);  

  errorFound = sum (predictedlabel ~= testslabels);        %returns count by adding missing labels between predlabel and tstlabel
errorRate = errorFound/size(testslabels,1);       %to match dimensions we use 1   
missedValues = find(predictedlabel ~= testslabels);                  %return missing index values
%missedValuesC = label2rgb(missedValues, 'r', 'y');
trainlabel = trainingSet(:,1);
traindata = trainingSet(:,2:end);

meandata = mean(traindata);
stdData = std(traindata);
normtrn = (traindata-meandata) ./ (stdData);

normtst= (testingdata - meandata)./(stdData);

[pcvals, pcvec] = pca(normtrn);

PC1 = normtst * pcvec(:,1:2);
figure(2);
hold on;
plot(PC1(testslabels== 1,1),PC1(testslabels==1,2), 'bo');
 plot(PC1(testslabels== 2,1),PC1(testslabels==2,2), 'go');
 plot(PC1(testslabels== 3,1),PC1(testslabels==3,2), 'yo');
 plot(PC1 (missedValues,1),PC1(missedValues,2),'k+' ,'Markersize', 10); %mark + on PC1(mis_index) where 1 is x and y 2