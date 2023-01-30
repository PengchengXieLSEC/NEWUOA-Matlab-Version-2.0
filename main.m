%NEWUOA-Matlab-Version-2.0
%Copyright: Pengcheng Xie 
%Connect: xpc@lsec.cc.ac.cn

N = 20;
IPRINT = 0;
MAXFUN = 5000;
RHOEND = 1.0e-6;
X = zeros(N, 1);
Xs = zeros(N, 94);
NFs = zeros(94, 1);
infos = zeros(94, 1);
probs = textread('problems', '%s');
res2 = zeros(1, 94);
for i = 1:1
  NPT = 2 * N + 1;
  F_test = @(n, x)(TestProblemF(x, n, probs{i}));
  [X, RHOBEG, ~, infos(i)] = setuptest(probs{i}, N);
  [Xs(:, i), NFs(i)] = newuoa (F_test, N, NPT, X, RHOBEG, RHOEND, IPRINT, MAXFUN);
end

for i = 1:1
  F_test = @(x)(TestProblemF(x, N, probs{i}));
  res2(i) = F_test(Xs(:, i));
end
disp(res2)
