function [zones trainclass] = load_train_data(training_data)

% Extract the files from the directory
% k is the counter of training classes
% m is the index of training classes vector
    file = dir(training_data);
    k = 0;
    number_of_samples = 0;
    m = 1;

% For each file of the directory
    for i=1:size(file)

        % If the file is not a directory, extract the training class,
        % preprocess the data and extract the features
        if(file(i).isdir == 0)
            name = file(i).name;
            folder = file(i).folder;
            data = strcat(folder,'\',name);

            stroke = load(data);
            struct = struct2array(stroke);
            digit = preprocessing(struct);
            z = feature_extraction(digit);
            zones(:,:,m) = z;
            trainclass(m) = k;

            number_of_samples = number_of_samples + 1;
            if(number_of_samples == 100)
                number_of_samples = 0;
                k = k + 1;
            end

            m = m+1;
        end
    end

end