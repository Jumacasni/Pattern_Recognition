function C = digit_classify(testdata, digit_zones, trainclass)

%% Preprocessing test data

size(digit_zones);
stroke = load(testdata);
struct = struct2array(stroke);
digit = preprocessing(struct);

%% Feature extraction test data

z = feature_extraction(digit);
test_zones(:,:,1) = z;

%% Classification

C = knn(trainclass, digit_zones, test_zones, 5);

end
