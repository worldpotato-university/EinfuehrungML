function Ypred = svmPredict( w, w0, Xunknownsamples, Xmodel, kernelFunction )
% This function runs an SVM.
% w, w0:            the weights of the SVM
% Xunknownsamples:  the samples which need to be classified
% kernelFunction:   only needed for non-linear SVMs. Should be 'linear' 
%                   (default), 'gaussian' or a handle to a function.
% Xmodel:           only needed for non-linear SVMs. Defines the model data
%                   used for the kernel
%                                                   (c) Alfred Schöttl 2015
if nargin < 5
    kernelFunction = 'linear';
    if nargin < 4
        Xmodel = [];
    end
end
nmod = size(Xmodel,1);
nsamp = size(Xunknownsamples,1);

if ischar(kernelFunction) && strcmpi(kernelFunction, 'linear')
    Ypred = single( Xunknownsamples*w+repmat(w0,nsamp,1)>0);
elseif ischar(kernelFunction) && strcmpi( kernelFunction, 'gaussian' )
    K = zeros(nsamp,nmod);
    sigma = 1;
    for i = 1:nsamp
        for j = 1:nmod
             K(i,j) = exp( - (Xmodel(j,:)-Xunknownsamples(i,:))*(Xmodel(j,:)-Xunknownsamples(i,:))'/2/sigma^2 );
        end
    end
    Ypred = single(K*w+repmat(w0,nsamp,1)>0);
else    
    K = zeros(nsamp,nmod);
    for i = 1:nsamp
        for j = i:nmod
             K(i,j) = kernelFunction(Xmodel(i,:)', Xunknownsamples(j,:)');
             K(j,i) = K(i,j); %the matrix is symmetric
        end
    end
    Ypred = single(K*w+repmat(w0,nsamp,1)>0);
end

