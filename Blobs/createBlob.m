function x = createBlob()

blob1 = randn(1000,3) - 1;
blob2 = randn(1000,3) +  50;
blob3 = randn(1000,3) + 2;

x = [blob1;...
    blob2;...
    blob3];

end