function output = EMGprocessor(input, fs, fcut)

fnyq = fs/2;

input = abs(input);

[b, a] = butter(6, fcut/fnyq, 'low');
output = filter(b, a, input);

end