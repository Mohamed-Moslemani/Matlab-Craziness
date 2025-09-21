function plot_solutions()
    % Create folder if not exists
    if ~exist('plots','dir')
        mkdir('plots');
    end

    % Mesh sizes to test
    hvals = [1/10, 1/16, 1/20];

    for k = 1:length(hvals)
        h = hvals(k);
        [U,X,~] = Solve1D(h);    % numerical solution
        uex = (1+X).*sin(X);     % exact solution

        % ===== Plot 1: exact vs numerical along x =====
        figure;
        plot(X, uex, 'r-', 'LineWidth', 2); hold on;
        plot(X, U, 'bo--', 'LineWidth', 1.5);
        xlabel('x'); ylabel('u(x)');
        legend('Exact solution','Numerical solution');
        title(sprintf('Exact vs Numerical, h = 1/%d', round(1/h)));
        grid on;
        saveas(gcf, fullfile('plots', sprintf('uex_vs_U_h%d.png', round(1/h))));

        % ===== Plot 2: U vs uex (scatter, line y=x) =====
        figure;
        plot(uex, U, 'bo', 'MarkerSize', 6, 'LineWidth', 1.5); hold on;
        plot([min(uex), max(uex)], [min(uex), max(uex)], 'r--', 'LineWidth', 2);
        xlabel('Exact solution u_{ex}');
        ylabel('Numerical solution U');
        title(sprintf('U vs u_{ex}, h = 1/%d', round(1/h)));
        grid on;
        saveas(gcf, fullfile('plots', sprintf('U_vs_uex_h%d.png', round(1/h))));
    end
end
