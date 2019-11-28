function err = calcErr(imgs,lbls,W1,W2)
% 1. Assess the performance of your net. Put in the given images and
% count how many are classified correctly. Calculate the error, which is 
% the percentage of wrongly classified images.
% TODO: Add code. Hint: the command [~,ndx] = max(M,[],2); assigns a vector
% ndx which contains the index of the biggest element per row in the matrix
% M.
%%


    
    class = predict(imgs, W1, W2 );
    
    
    
    
    [~,ndx] = max(class, [], 2);
    
    temp = (ndx-1) - lbls;
    
    indexOfCorrect = find(temp == 0);
    
    

err = 1 - length(indexOfCorrect)/size(imgs,1);

%%
end
