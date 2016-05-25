Data = load('yaseminLeftBody.csv'); %load 'Data'
startingIndices = find(Data(:,1)==1);
s = Data(startingIndices(1):startingIndices(2)-1,2:10);
t = Data(startingIndices(2):startingIndices(3)-1,2:10);
%i = 1;
% for n=1:length(startingIndices)
%     signalMat(:,:,i) = Data(startingIndices(n):startingIndices(n+1)-1,:);
% end
%signalMat
d = dtw(s,t,1)