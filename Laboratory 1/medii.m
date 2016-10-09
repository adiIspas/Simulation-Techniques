% Functia calculeaza media aritmetica si media geometrica
function [ A, G ] = medii(V)
    A = sum(V)/size(V,2);
    G = nthroot(prod(V), size(V,2));
end



