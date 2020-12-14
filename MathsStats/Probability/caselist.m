%Check number type
x = input('Enter a real number: ');
switch x
	case {-inf,inf}
		disp('Plus or minus infinity') 
	case 0
		disp('Zero') 
	otherwise
		disp('Nonzero and finite') 
end
