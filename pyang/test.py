import pyang as pyang

pyang.precalculate_binomials()

#<2*j1, 2*m1, 2*j2, 2*m2 | 2*j, 2*m>
CG = pyang.cleb(5,5,3,1,8,6)
print(CG)

#<5/2, 5/2, 3/2, 1/2 | 4, 3> = sqrt(3/8)
print((3/8)**0.5)
