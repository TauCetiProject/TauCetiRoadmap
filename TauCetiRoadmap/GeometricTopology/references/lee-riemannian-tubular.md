# Lee: the normal-exponential tubular neighbourhood theorem

Source: J. M. Lee, *Introduction to Riemannian Manifolds*, second edition,
Springer GTM 176 (2018), Theorem 5.25, printed pp. 133–135 (physical PDF
pages 145–147 of the supplied copy). This is a statement and proof summary.
It supports GeometricTopology Layer 1.

Every embedded submanifold P of a Riemannian manifold M admits a tube on
which the normal exponential is a diffeomorphism onto an open neighbourhood.
Compact P admits a positive constant radius. Neither closedness of P nor
completeness of M is required.

Equation (5.21) defines the tube by |v|_g<δ(x), with δ positive continuous.
The differential on the zero section identifies the tangent and normal
summands with their direct sum in T_xM, so the inverse function theorem gives
local diffeomorphisms. Equation (5.22) uses neighbourhoods V_r(x) with base
points at Riemannian distance less than r from x and fibre norm less than r.
Equation (5.23) takes Δ(x) to be the supremum of admissible radii at most 1
on which the normal exponential is a diffeomorphism. Local invertibility
makes Δ positive; nested unions give injectivity on V_Δ(x)(x).

The triangle inequality compares V_r(x) with V_(r−d(x,x′))(x′).
Equation (5.24) and its reverse imply |Δ(x)−Δ(x′)|≤d(x,x′), hence continuity.
For vectors of length less than Δ/2 with equal exponential images, their
base distance is at most the sum of their lengths, using the two radial
geodesics. Choosing the base with the larger Δ puts both vectors in one
V_Δ neighbourhood, so they coincide. The normal exponential is an injective
local diffeomorphism on the tube, hence a diffeomorphism onto its open image.
On compact P, Δ/2 attains a positive minimum, giving a uniform tube.

For disconnected M, use the Riemannian extended distance. Finite-distance
comparisons are within components and its topology is the manifold topology.
In flat Euclidean space the normal exponential is (x,v)↦x+v.
