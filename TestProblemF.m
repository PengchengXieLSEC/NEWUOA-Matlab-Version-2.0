%NEWUOA-Matlab-Version-2.0
%Copyright: Pengcheng Xie 
%Connect: xpc@lsec.cc.ac.cn

function [fun] = TestProblemF(x, n, name)
    %% TestProblemF

    % 输入：x自变量,n是问题的维数，name是使用目标函数的名称，需要以字符串输入，如'arglina'
    % 输出： fun是函数值，info表示的是是否正常使用，info=0表示正常。
    %%
    INFINITY = 1.0e308;
    f = INFINITY;
    info = 0; % info = 0 means successful evaluation
    y = zeros(n + 2, 1);
    y(0 + 1) = 0.0e0;
    y(n + 1 + 1) = 0.0e0;

    for i = 1:n
        y(i + 1) = x(i);
    end

    ychebq = zeros(n + 1, n);
    ysrf = zeros(ceil(sqrt(n)), ceil(sqrt(n)));
    ytmp = zeros(n, 1);
    par = zeros(n, 1);
    t = zeros(n, 1);
    MST = zeros(n, n);
    MaS = zeros(2 * n, n);
    MaC = zeros(2 * n, n);
    sinx = zeros(n, 1);
    cosx = zeros(n, 1);
    so = zeros(n, 1);
    co = zeros(n, 1);
    d = zeros(2 * n, 1);
    f1 = 0;
    f2 = 0;
    f3 = 0;
    f4 = 0;
    f5 = 0;
    name = lower(name);
    %%
    if (strcmp(name, 'arglina'))
        %% see j. more, 1981, testing unconstrained optimization software,;
        % problem 32, also cuter.;
        m = fix(2 .* n);
        tmp = 0.0e0;

        for i = 1:n
            tmp = tmp + y(i + 1);
        end

        f = 0.0e0;

        for i = 1:n
            f = f + (y(i + 1) - 2.0e0 ./ real(m) .* tmp - 1.0e0).^2;
        end

        for i = n + 1:m
            f = f + (-2.0e0 ./ real(m) .* tmp - 1.0e0).^2;
        end
    end

    fun = f;

end
