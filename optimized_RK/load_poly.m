function poly_coeff = load_poly(input_file_name,stages)
%function poly_coeff = load_poly(input_file_name,stages)
%
% input_file_name: name of the file where the coefficients of the stability 
%                  polynomial function can be found. This file must have a
%                  specific header. For instance:
%   
%                  #stability poly.
%                  xxx
%
%                  #stage	 order	 free params. h	 h/s  iter poly. coeffs.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Load and read the file containing the stability polynomial coefficients
[read_fid,number_stab_poly]= read_header(input_file_name);

% Loop over the stability polynomials
for i_stab_poly = 1:number_stab_poly

    % Read number of stages and order of accuracy
    [s,p,fp,d]= read_data(read_fid);
        
    % Set tall tree numbers (indices) and tall tree values that will be 
    % used to enforce the stability coefficients. 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    % Polynomial coefficients indices
    poly_coeff_ind = p+1:s;

    % Polynomial coefficients values
    poly_coeff = d(7+p+1:length(d));

    if s==stages
        return
    end
    
end

disp('No coefficients found for specified number of stages.')
end
% =========================================================================


% =========================================================================

function [read_fid,number_stab_poly]= read_header(input_file_name)
%function [read_fid,number_stab_poly]= read_header(input_file_name)
%
% Read name of the variables saved in the file

read_fid = fopen(input_file_name,'r');

% Header
tline = fgets(read_fid); 

% Read number of stability polynomial written in the file 
tline = fgets(read_fid);

% Convert string to floating numbers
d = sscanf(tline,'%f');
number_stab_poly = sscanf(tline,'%f');
number_stab_poly = floor(number_stab_poly);

% Read white line
tline = fgets(read_fid);
 
% Header
tline = fgets(read_fid);

% Read white line
tline = fgets(read_fid);

end
% =========================================================================


% =========================================================================

function [s,p,fp,d]= read_data(read_fid)
%function [s,p,fp]= read_data(read_fid)
%
% Read number of stage and order of accuracy of the method

% Read information
tline = fgets(read_fid);
    
% Convert string to floating numbers
d = sscanf(tline,'%f');
    
% Number of stages:
s = floor(d(1));
    
% Order of accuracy:
p = floor(d(2));
    
% Free parameters in the stability function
fp = floor(d(3));

end
% =========================================================================


