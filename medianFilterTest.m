%median filter
function filteredSignalMat = medianFilterTest(Data)
%Data = load('yaseminLeftBody.csv');
startingIndices = find(Data(:,1)==1);
demoCount = length(startingIndices);
numberOfDemos = length(startingIndices);
signalMat = cell(numberOfDemos,1);
i = 1;
minDemoLength = realmax;
for n=1:length(startingIndices)
    if n < length(startingIndices)
        signalMat{i,1} = Data(startingIndices(n):startingIndices(n+1)-1,:);
    else
        signalMat{i,1} = Data(startingIndices(n):end,:);
    end
    if size(signalMat{i,1},1) < minDemoLength
        minDemoLength = size(signalMat{i,1},1);
    end
    i = i + 1;
end
minDemoLength
filteredSignalMat = zeros(demoCount*minDemoLength,10);

for n=1:length(startingIndices)
    demoLen = size(signalMat{n,1},1);
    curSig = signalMat{n,1};
    startIndex = ((n-1)*minDemoLength)+1;
    endIndex = minDemoLength*n;
    filteredSignalMat(startIndex:endIndex,1) = 1:minDemoLength;
    
    if demoLen == minDemoLength
        filteredSignalMat(startIndex:endIndex,2:end) = curSig(:,2:end);
    else
        windowSize = demoLen-minDemoLength;
        k = 1;
        for m=startIndex:endIndex
            filteredSignalMat(m,2:end) = median(curSig(k:k+windowSize,2:end));
            k = k+1;
        end
    end
end
end


