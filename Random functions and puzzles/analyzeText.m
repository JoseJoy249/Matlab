function [numWords, maxWordLength, maxNumVowels] = analyzeText(text)

flag = 1;
numWords = 1;
templ = [];
tempv = [];

while flag
    [token,remain] = strtok(text);
    
    if isempty(remain)
        flag = 0;
        break;
    end
    
    numWords = numWords + 1;
    templ = [templ, length(token)];
    tempv = [tempv, length(regexpi(token, 'a|e|i|o|u'))];
    text = remain;
    
end

maxWordLength = max(templ);
maxNumVowels = max(tempv);

end
    
    
    
    