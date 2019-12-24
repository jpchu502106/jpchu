function [N_L, N_G] = Euler_method_LG(x, yL0, yG0)
    disp('Euler_method')
    % Declare variables and matrixs
    b_G = 1.1;
    b_L = 0.00025;
    d_G = 0.0005;
    d_L = 0.7;
    h = x(2)-x(1);
    n = size(x,2);

    N_G = zeros(1, n);
    N_L = zeros(1, n);
    N_G(1) = yG0;
    N_L(1) = yL0;

    NLdt = @(N_L, N_G) b_L * N_L * N_G - d_L * N_L;
    NGdt = @(N_L, N_G) b_G * N_G - d_G * N_G * N_L;

    % Main program
    for i = 1:n-1
        N_L(i+1) = N_L(i) + NLdt(N_L(i), N_G(i)) * h;
        N_G(i+1) = N_G(i) + NGdt(N_L(i), N_G(i)) * h;

        if N_L(i+1)<0
            N_L(i+1) = 0;
        end

        if N_G(i+1)<0
            N_G(i+1) = 0;
        end
    end
end