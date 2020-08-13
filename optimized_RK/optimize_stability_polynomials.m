% You must have RK-opt/polyopt in the path of matlab.

solvers = {'sedumi', 'sdpt3'};
tol_bisect = 1.e-7;

%  run_optimization(1, 3, 20, solvers, tol_bisect, 'monomial');
run_optimization(2, 3, 20, solvers, tol_bisect, 'monomial');
run_optimization(3, 3, 20, solvers, tol_bisect, 'monomial');


function run_optimization(p, N, max_s, solvers, tol_bisect, basis)
    min_s = p+1;
    if max_s < min_s
        error('max_s is too small.');
    end

    load(sprintf('spectrum_p%d.mat', N), 'lambda_convex');

    io = fopen(sprintf('optimized_stability_polynomials_p%d_N%d.txt', p, N), 'w');
    fprintf(io, '#stability poly.\n');
    fprintf(io, '%d\n', max_s - min_s + 1);
    fprintf(io, '\n');
    fprintf(io, '#stage\t order\t free params.\t h\t\t h/s\t\t iter\t\t poly. coeffs.\n');
    fprintf(io, '\n');

    for s = min_s:max_s
        [h, polycoeff] = opt_poly_bisect(lambda_convex, s, p, basis, ...
                                         'solvers', solvers, ...
                                         'tol_bisect', tol_bisect, ...
                                         'h_max', 10);
        fprintf(io, '%d\t %d\t %d\t\t %.16f\t %.16f\t 00\t\t', s, p, s-p, h, h/s);
        for i = 1:length(polycoeff)
            fprintf(io, '%.16e\t', polycoeff(i));
        end
        fprintf(io, '\n');
    end

    fclose(io);
end
