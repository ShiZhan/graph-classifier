location = 'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\'
cdf1_file = 'inDegC.ba-12-8.txt.tab'
cdf2_file = 'inDegC.ba-11-8.txt.tab'

mode(-1)

cdf_raw = fscanfMat(location + cdf1_file)
l = size(cdf_raw, 1), i_last = 1
for r = 1:l
  i = cdf_raw(r, 1), v = cdf_raw(r, 2)
  for j = i_last:i, cdf1(j) = v, end
  i_last = i
end

clear cdf_raw

cdf_raw = fscanfMat(location + cdf2_file)
l = size(cdf_raw, 1), i_last = 1
for r = 1:l
  i = cdf_raw(r, 1), v = cdf_raw(r, 2)
  for j = i_last:i, cdf2(j) = v, end
  i_last = i
end

clear cdf_raw l r i i_last j v

cdf1=gsort(cdf1, 'g', 'i')
cdf2=gsort(cdf2, 'g', 'i')

i1 = 1, fn1 = 0, l1 = size(cdf1, 1)
i2 = 1, fn2 = 0, l2 = size(cdf2, 1)
d = 0
while (i1 <= l1) & (i2 <= l2)
  d1 = cdf1(i1)
  d2 = cdf2(i2)
  if d1 <= d2 then i1 = i1 + 1, fn1 = i1 / l1; end
  if d2 <= d1 then i2 = i2 + 1, fn2 = i2 / l2; end
  d0 = abs(fn2 - fn1)
  if d0 > d then d = d0; end
end

clear i1 i2 fn1 fn2 d0 d1 d2

en = sqrt(l1 * l2/(l1 + l2))

alam = (en + 0.12 + 0.11 / en) * d
eps1 = 0.001, eps2 = 1.0e-8, fac = 2, s = 0, term_bf = 0, ks_significance = 1
a2 = -2.0 * alam * alam
for i = 1:100
  term = fac * exp(a2 * i * i)
  s = s + term
  if (abs(term) <= eps1 * term_bf) | (abs(term) <= eps2 * s) then
    ks_significance = s
    break
  end
  fac = -fac
  term_bf = abs(term)
end

clear en l1 l2 alam eps1 eps2 fac s term_bf a2 i term

mode(0)

mprintf("%s -- %s: %f %f%c\n", cdf1_file, cdf2_file, d, ks_significance * 100, '%')

clear cdf1_file cdf2_file
