%Author: Matthew Mansell
function [MFCCcollection]=splitMFCC(MFCCarr, Enarr, threshold)
%Apply moving average filter
kernel = ones(15,1);
EnarrFiltered = filter(kernel,1,Enarr);

MFCCcollection = {2,2,2}; %Return array
indx = 1;
word = 0; %The number of words found
while indx < length(EnarrFiltered)
    %loop until word detected
    if(EnarrFiltered(indx) > threshold)
        word = word + 1; 
        wordLength = 1;
        %find the length of the word
        while(EnarrFiltered(indx + wordLength) > threshold && (indx+wordLength) < length(EnarrFiltered))
            wordLength = wordLength + 1;
        end
        %append word to the cell array
        MFCCcollection{word} = MFCCarr(indx:(indx+wordLength),1:12);
        indx = indx + wordLength; %continue search after this word
    end
    indx = indx + 1;
end
end

