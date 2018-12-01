% Choosing Lenet model as Baseline model


% Specify files to import 
protofile = 'lenet.prototxt'; 
datafile = 'lenet_iter_10000.caffemodel'; 


% Import network 
net = importCaffeNetwork(protofile,datafile)


%Splitting dataset into training & testing data
XTrain = loadMNISTImages('train-images.idx3-ubyte');
YTrain = loadMNISTLabels('train-labels.idx1-ubyte');


%Reshaping the data set 
XTrain = reshape(XTrain,28,28,1,60000);


%Converting Labels into Categorical type
YTrain = categorical(YTrain);


%Training Parameters
layers = net.Layers;
options = trainingOptions('sgdm', ...
	'InitialLearnRate', 0.001, ...
	'Verbose', false, ...
	'Plots','training-progress');


%Training the model
net = trainNetwork(XTrain,YTrain,layers,options);


%Loading the test data
XTest = loadMNISTImages('t10k-images.idx3-ubyte');
YTest = loadMNISTLabels('t10k-labels.idx1-ubyte');


%Reshaping the test data
XTest = reshape(28,28,1,10000);


%Converting Test data into Categorical
YTest = categorical(YTest);


%Prediction
YPred = classify(net,XTest);


%Accuracy
accuracy = sum(YPred == YTest)./numel(YTest);


