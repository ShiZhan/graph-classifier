// load edge lists
edgelists=[
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\er-8-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\er-9-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\er-10-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\ba-8-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\ba-9-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\ba-10-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\sw-8-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\sw-9-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\sw-10-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\rmat-8-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\rmat-9-8.csv',
  'C:\cygwin\home\Zhan\repository\graph-classifier\dataset\rmat-10-8.csv'
]

edge_list_total=size(edgelists,1)
for i=1:edge_list_total
  edges=fscanfMat(edgelists(i))
  edge_total=size(edges,1)
  for e=1:edge_total
    u=edges(e,1)
    v=edges(e,2)
    m(u+1,v+1)=1
  end
  sv=svd(m)
  clear edges m
  disp(sv(1:3))
end
