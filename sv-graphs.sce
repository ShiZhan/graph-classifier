//stacksize(40000000)
location = 'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\'
edgelists = [
  'er-8-8.csv',
  'er-9-8.csv',
  'er-10-8.csv',
  'er-11-8.csv',
//  'er-12-8.csv',
  'ba-8-8.csv',
  'ba-9-8.csv',
  'ba-10-8.csv',
  'ba-11-8.csv',
//  'ba-12-8.csv',
  'sw-8-8.csv',
  'sw-9-8.csv',
  'sw-10-8.csv',
  'sw-11-8.csv',
//  'sw-12-8.csv',
  'rmat-8-8.csv',
  'rmat-9-8.csv',
  'rmat-10-8.csv',
  'rmat-11-8.csv'
//  'rmat-12-8.csv'
]

for i = 1:size(edgelists, 1)
  edges = fscanfMat(location + edgelists(i))
  for e = 1:size(edges, 1)
    u = edges(e, 1)
    v = edges(e, 2)
    m(u + 1, v + 1) = 1
  end
  sv = svd(m)
  clear edges m e u v
  mprintf("% 16s %16f %16f %16f\n", edgelists(i), sv(1:3)')
end
