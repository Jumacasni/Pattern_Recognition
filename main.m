% Load train data
    [digit_zones trainclass] = load_train_data('training_data');

% Load the directory
    file = dir('training_data');

% Initialize leave-one-out approach
    leave_one_out = 1;

% Number of iterations of the leave-one-out approach
    for k = 1:20

    % Initialize the counter for success and failure
        number_of_samples = 0;
        ok = 0;
        fail = 0;
    
    % Extract the first file that is a file, not a directory
        for i=1:size(file)
            while((file(leave_one_out).isdir == 1) && (leave_one_out < size(file,1)))
                leave_one_out = leave_one_out + 1;
            end
        
        % If the file is not a directory and it is not the test data that
        % we are going to test
            if(file(i).isdir == 0 && strcmp(file(leave_one_out).name, file(i).name) == 0)
                name = file(i).name;
                folder = file(i).folder;
                data = strcat(folder,'\',name);
                
            % Remove the test data from the training data
                aux_digit_zones = digit_zones;
                aux_digit_zones(:,:,leave_one_out) = [];
                
            % Classify the test data
                digit = digit_classify(data, digit_zones, trainclass);

            % Verificate the success of the classifier
                number_of_samples = number_of_samples + 1;
                if(digit == trainclass(number_of_samples))
                    ok = ok + 1;

                else
                    fail = fail + 1;
                end
            end
        end

    % Calculate the percentage of success and error
        success = ok/number_of_samples*100
        error = fail/number_of_samples*100
    
    % Choose another test data
        leave_one_out = leave_one_out + 50;
    end