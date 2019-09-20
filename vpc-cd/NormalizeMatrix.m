function B = NormalizeMatrix(A)

B = (A - min((A(:))))/(max(A(:)) - min(A(:)));

end