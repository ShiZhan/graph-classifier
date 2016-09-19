mode(-1)

//stacksize(40000000)
location = 'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\'
edgelists = [
  'er-8-8.txt',
  'er-9-8.txt',
  'er-10-8.txt',
  'er-11-8.txt',
//  'er-12-8.txt',
  'ba-8-8.txt',
  'ba-9-8.txt',
  'ba-10-8.txt',
  'ba-11-8.txt',
//  'ba-12-8.txt',
  'sw-8-8.txt',
  'sw-9-8.txt',
  'sw-10-8.txt',
  'sw-11-8.txt',
//  'sw-12-8.txt',
  'rmat-8-8.txt',
  'rmat-9-8.txt',
  'rmat-10-8.txt',
  'rmat-11-8.txt'
//  'rmat-12-8.txt'
]

for i = 1:size(edgelists, 1)
  edges = fscanfMat(location + edgelists(i))
  for e = 1:size(edges, 1)
    u = edges(e, 1)
    v = edges(e, 2)
    m(u + 1, v + 1) = 1
  end
  sv = svd(m)
  mprintf("% 16s %16f %16f %16f\n", edgelists(i), sv(1:3)')
  clear edges m e u v sv
end

mode(0)
