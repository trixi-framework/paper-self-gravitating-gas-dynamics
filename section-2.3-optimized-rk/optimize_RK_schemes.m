% You must have RK-opt/RK-coeff-opt in the path of matlab.

% 
num_starting_points = 20;

do_optimization(1, 3,  5, num_starting_points)
do_optimization(2, 3,  5, num_starting_points)
do_optimization(3, 3,  5, num_starting_points)



function do_optimization(p, N, s, num_starting_points)
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n')
fprintf('p = %d, N = %d, s = %2d, num_starting_points = %d:\n  %s\n', ...
        p, N, s, num_starting_points, datestr(now, 'yyyy-mm-ddTHH-MM-SS'));

% 'interior-point' needs more time than 'sqp' but fails less often
algorithm = 'interior-point';

poly_coeff_high = load_poly(sprintf('optimized_stability_polynomials_p%d_N%d.txt', p, N), s);
rk_opt(s, p, '3Sstar', 'acc', 'poly_coeff_ind', p+1:s, 'poly_coeff_val', poly_coeff_high, ...
       'num_starting_points', num_starting_points, 'algorithm', algorithm, ...
       'np', feature('numcores'), 'suppress_warnings', true);

end
