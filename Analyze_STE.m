function index = Analyze_STE( ste_vector )
%Analyze_STE returns the index of the element from ste_vector that has the
%raport between him and his neighbour greater than 1; if there is no such
%raport then return 0

vector_length = length(ste_vector);
for i = 2 : vector_length-1
    if ((ste_vector(i) / ste_vector(i+1) > 50))
        index = i;
        return
    end
end

index = 0;

end

