function similarity=compareArrays(digitModel, input)
[dist, mapModel, mapInput] = dtw(digitModel.', input.');
%newModel = [];
%newInput = [];
%for i=1:1:length(mapModel)
%    newModel(i) = digitModel(mapModel(i));
%    newInput(i) = input(mapInput(i));
%end

inputResized = imresize(input, [length(digitModel) 12]);

similarity = immse(digitModel, inputResized) + dist;
end
