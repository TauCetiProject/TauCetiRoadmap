# Cotangent bundles and Lagrangian geometry

Develop the smooth geometry of canonical phase spaces and Lagrangian submanifolds. The cotangent
bundle should be usable intrinsically, in charts, under diffeomorphisms and products; generating
functions should produce actual local canonical transformations with domains and inverse formulas.
Neighborhood theorems identify precisely what data determine a symplectic germ along a submanifold.

## Conventions and prerequisites

Use the [family conventions](../README.md). Base manifolds are real finite-dimensional smooth,
boundaryless, Hausdorff and second countable. A submanifold is given by a smooth embedding with an
induced manifold structure, not just a subset. Compactness of the embedded submanifold is required
for the uniform neighborhood conclusions below. Symplectic germs/local transformations are maps
between specified open neighborhoods; no theorem asserts a globally defined map from a local implicit
function. The conormal of Q⊂M uses covectors in T*_qM annihilating the image of T_qQ.

Consume Tau Ceti's `SymplecticForm.IsIsotropic`, `IsCoisotropic`, `IsLagrangian`, linear cotangent
form and Liouville identity. Consume ordinary Darboux and compact-manifold Moser with a given smooth symplectic path from
[HeegaardFloer](https://github.com/TauCetiProject/TauCetiRoadmap/pull/957), F2.1. Generic differential-form calculus belong to
[DifferentialGeometry](../../DifferentialGeometry/README.md); generic tubular neighborhoods belong to
[GeometricTopology](../../GeometricTopology/README.md); bundle duals and smooth operations belong
to [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887). The missing instances or
lemmas needed to connect these interfaces are explicit work here or there, not assumptions.

## C1. Intrinsic cotangent phase space

1. Define T*M as Mathlib `Bundle.TotalSpace (E →L[ℝ] ℝ) (fun x ↦ TangentSpace I x →L[ℝ] ℝ)` with
   model `I.prod 𝓘(ℝ,E →L[ℝ] ℝ)`. Use the existing continuous-linear-map bundle charts and prove
   projection smooth with `Manifold.IsSubmersion`; zero section and smooth one-form sections; local transition
   formula `(q,p)↦(φ(q),p∘(dφ_q)⁻¹)`; fiberwise addition/scaling and vector-bundle laws.
2. Construct λ(v)=p(dπ(v)) as a globally smooth one-form. Establish naturality, pullback by a section
   s_α gives α, and chart formula Σpᵢdqᵢ. Construct ω=−dλ, prove closed and nondegenerate,
   and identify it with `strongDualCotangentSymplecticForm` in charts. This chart identification is
   required evidence that no convention has changed.
3. A diffeomorphism f:M→N has cotangent lift `(q,p)↦(f(q),p∘(df_q)⁻¹)`.
   Prove identity/composition/inverse, preservation of λ and ω, equivariance for group actions.
   Define cotangent pullback along a general map as a relation over the map, rather than a false
   total map T*M→T*N when derivatives are not invertible.
4. Prove open-restriction identification T*U ≅ π⁻¹(U) with Liouville and symplectic forms.
   Identify T*(M×N) with T*M×T*N smoothly, including λ sum and ω product.
   Fiber translation by a one-form α changes λ by π*α and ω by −π*dα; it is symplectic iff dα=0.
   Fiber negation changes λ and ω signs. All formulas hold on arbitrary open restrictions.

## C2. Embedded Lagrangians and basic examples

Define symplectic tangent images by disjointness from their symplectic orthogonal and nondegenerate
restriction, then define symplectic/isotropic/coisotropic/Lagrangian embeddings through tangent images using existing
linear predicates. Prove independence of parametrization, transport by symplectomorphisms, dimension
bounds/equalities, products and restriction to open sets. Nonzero real rescaling of a
symplectic form preserves all four tangent-subspace predicates; prove its form and primitive API. A Lagrangian immersion is a separate notion;
define its `Manifold.IsImmersion` and tangent-isotropy/half-dimension predicate and prove its
transport/product API without replacing self-intersections by an embedded submanifold.

For a finite-dimensional real symplectic vector space and any subspace W, reuse
`SymplecticForm.orthogonal`, `mem_orthogonal_iff'`, `finrank_orthogonal`,
`orthogonal_orthogonal`, `isIsotropic_iff`, `IsIsotropic.two_mul_finrank_le`,
`IsLagrangian.two_mul_finrank` and `IsIsotropic.isLagrangian_of_finrank` from
`TauCeti.Geometry.Symplectic.Lagrangian.Basic`. Export their tangent-image
specializations rather than duplicate those definitions or proofs. Derive the
additive identity `dim W + dim W^ω = dim V`. For the restriction and splitting
equivalences, consume Mathlib's
`LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal` and
`isCompl_orthogonal_iff_disjoint`: restricted nondegeneracy,
`W ∩ W^ω = 0`, and the internal direct sum `V = W ⊕ W^ω` are equivalent.
These two comparisons need only a reflexive bilinear form in finite dimension;
use the existing alternating form's reflexivity. Prove Lagrangian iff
`Maximal ω.IsIsotropic W`, using extension by an isotropic line when an
isotropic W is properly contained in W^ω. Include the coisotropic dimension
bound. In finite dimension, ambient nondegeneracy gives the complementary
dimension identity and the isotropic bound `2 * finrank W ≤ finrank V`.
For `B : LinearMap.BilinForm ℝ V` on finite-dimensional V with `B.IsRefl`,
use `B.orthogonal W`: the general dimension formula gives
`finrank W + finrank (B.orthogonal W) ≥ finrank V`; hence inclusion
`B.orthogonal W ≤ W` gives `2 * finrank W ≥ finrank V`, without assuming B
nondegenerate. Specialize this to `ω.toBilinForm` for the bundled symplectic case. The maximal-isotropic
equivalence uses alternation without that extra hypothesis. Include
zero-dimensional cases.

### C2.0. Elementary matrix polar package

This package is independent of LieGroups Layers 7 and 9. Own the elementary
finite-dimensional matrix polar decomposition over ℝ and ℂ: for invertible A,
construct the unique positive-definite self-adjoint `P=(AA*)^(1/2)` and
orthogonal/unitary U with `A=PU`, using Mathlib's Hermitian spectral theorem
and continuous functional calculus. Prove that matrix logarithm is the global inverse
`PD_n→Sym_n` to the symmetric exponential `Sym_n→PD_n`, with the corresponding
positive Hermitian version over ℂ. Prove both `log(exp X)=X` on `Sym_n` and
`exp(log P)=P` on `PD_n`. The continuous functional calculus gives a continuous logarithm and the
latter inverse identity; prove smoothness by the inverse function theorem, using the positive
divided-difference formula for the invertible derivative of `exp` on symmetric
(respectively Hermitian) matrices. Prove
uniqueness, smooth dependence on A,
unitary left/right equivariance, and the contraction `A↦P^(1−t)U` to the
unitary factor, fixing that factor. For SL(n,ℂ), prove detP=detU=1 and that
every positive real power of P still has determinant 1. For SL(2,ℂ), prove
equivariance under the central ±I action before PSL(2,ℂ) descent in HF F2.6h. This is the complete C2.0 polar package consumed by HF. Export both smooth
ambient polar coordinate diffeomorphisms for real invertible matrices
(`A=PU=U(UᵀPU)`, with orthogonal `U` and positive symmetric factors) and complex
invertible matrices (`A=PU=U(U*PU)`, with unitary `U` and positive Hermitian
factors). Prove the inverse maps, smoothness, equivariance and determinant-one
restrictions already specified above. LieGroups Layers 7 and 9 consume these
ambient polar maps; each layer proves preservation for its own stated closed
subgroups. C2.1 proves the Sp-specific polar-factor preservation needed for its
Sp application. For the GL_n(ℝ) orthogonal-left example use `A=U(UᵀPU)` and
the symmetric logarithm of `UᵀPU`. The positive spectral functional calculus
and inverse-function argument above supply both inverse identities and
smoothness over real symmetric and complex Hermitian matrices.

### C2.1. Compact intersections and group applications

Use Mathlib's native matrix submonoids `Matrix.symplecticGroup (Fin n) ℝ`,
`Matrix.orthogonalGroup (Fin n ⊕ Fin n) ℝ`, and
`Matrix.unitaryGroup (Fin n) ℂ`, together with the units carriers
`GL_R := (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ` and
`GL_C := (Matrix (Fin n) (Fin n) ℂ)ˣ`. Work on the real index
`Fin n ⊕ Fin n` with `Matrix.J (Fin n) ℝ`; when `Fin (2*n)` is needed,
use `finSumFinEquiv` to reach `Fin (n+n)` and then the equivalence
`finCongr (two_mul n).symm` to reach `Fin (2*n)`, proving the
`Matrix.reindex` identities. Identify `(x,y)` with
`x+iy`, so multiplication by i is `J=[[0,−I],[I,0]]`.

Build the injective ℝ-algebra homomorphism
`realify(X+iY)=Matrix.fromBlocks X (−Y) Y X`. Prove its image is exactly
the matrices commuting with J and that it sends conjugate transpose to
transpose. The induced map on units `GL_C → GL_R` is a topological group
isomorphism onto the commuting-J subgroup: its inverse extracts the two real
blocks, and `realify(A⁻¹)=realify(A)⁻¹`. Prove this image is closed in `GL_R`.
Do not use `Matrix.UnitaryGroup.embeddingGL` as a topological embedding; its
comparison through matrix-to-linear-map equivalence is algebraic only.

Use the native monoid homomorphism `Unitary.toUnits`, specialized to
`Matrix (Fin n) (Fin n) ℂ`, for the inclusion `U(n)→GL_C`.
Consume `SymplecticGroup.mem_iff`, `mem_iff'`, and `transpose_mem_iff` for
`AJAᵀ=J` and `AᵀJA=J`, and `Matrix.mem_orthogonalGroup_iff` and
`mem_orthogonalGroup_iff'` for orthogonality. For invertible real A, prove
`AJ=JA ↔ AJA⁻¹=J`; combine these comparisons to derive the pairwise
intersection identities below. In particular, commutation with J turns the
symplectic identity into `AAᵀ=1`, and orthogonality gives the converse.

In the single ambient group `GL_R`, define `Sp_R` and `O_R` by inverse-image
membership under `Units.val` in the native symplectic and orthogonal
submonoids, and define `C_R` as the realified image of `GL_C` (equivalently,
the units commuting with J). Prove each is a subgroup; prove the native
matrix-subspace topology agrees with the units-subgroup topology, using
continuity of `Units.val` and the inverse map, with the explicit matrix inverse
formulas on invertible matrices: consume
`SymplecticGroup.inv_eq_symplectic_inv` and `coe_inv'` for
`A⁻¹=−J AᵀJ` on `Sp_R`, and `Matrix.UnitaryGroup.inv_val` for
`A⁻¹=Aᵀ` on `O_R` and `U⁻¹=U*` on U(n). The realification inverse
above gives the corresponding topology comparison for `C_R`, with
`realify(A⁻¹)=realify(A)⁻¹`. Prove these are closed subgroups
of `GL_R` by their defining polynomial matrix identities, and identify all
three pairwise intersections `Sp_R∩C_R`, `Sp_R∩O_R`, and `C_R∩O_R` with the
same realified image of native `U(n)` by topological group isomorphisms.

For compactness of U(n), use `isClosed_unitary` and
`entry_norm_bound_of_unitary` to place the native carrier in the finite
product of closed unit discs; that product is compact, so the closed unitary
carrier is compact. Transport compactness to its units image by the proven
homeomorphism. Avoid relying on a global matrix norm instance.

First prove that the C2.0 polar factors of a symplectic matrix are themselves symplectic. For A=P U∈Sp_R, use the native membership/transpose identities and functional calculus to prove `JPJ⁻¹=P⁻¹`, hence `JP^sJ⁻¹=P^(−s)` for every real s. Thus every P^s is symplectic and U=P⁻¹A belongs to Sp_R∩O_R, the realified U(n). The positive-factor path contracts P to id.

Prove U(n) connected by diagonalizing each unitary matrix, choosing eigenvalue phases, and writing it as exp(iH) for a Hermitian H; t↦exp(tiH) is a path from id. This constructs a path for each matrix, not a globally continuous unitary logarithm. Complex polar decomposition then proves GL(n,ℂ) and its realified group C_R connected: combine a path to U with the positive Hermitian path P^t. The preceding symplectic polar preservation gives the analogous path inside Sp_R and proves Sp(2n,ℝ) connected. For n=0 all these groups are trivial.

Prove directly that U(n) is maximal compact in GL(n,ℂ). If compact K contains U(n), and A=P U∈K is the complex polar factorization, then P=A U⁻¹∈K. If P≠1, some positive eigenvalue λ differs from1, so replace P by P⁻¹ if necessary and take λ>1. The continuous real trace is bounded on K, whereas `Re(tr(P^k))=Σ_i λ_i^k≥λ^k` is unbounded. Hence P=1 for every A∈K and K=U(n). This proof consumes C2.0 and the compact/intersection identities above, with no generic maximal-compact theorem as a premise. LieGroups Layer7 retains the general compact-complexification theorem.

Prove directly that the realified U(n)=Sp_R∩O_R is maximal compact in Sp_R. For compact K≤Sp_R containing it, write A=P U using C2.0 and the Sp-preservation theorem. Then P=A U⁻¹∈K. Positive symplectic P≠1 has an eigenvalue larger than1 after inversion; `Re tr(P^k)=Σ_i λ_i^k≥λ^k` contradicts bounded trace on K. Thus P=1 and A∈U(n). Treat n=0 separately as the trivial case. Apply LieGroups Layer2's generic closed-subgroup structure theorem to the explicitly defined closed matrix subgroups and identify their embedded structures through the established topological group equivalences.

Construct the required separate Sp structural and adjoint-model comparison. For n≥1 prove its real Lie algebra semisimple, its group center `{±I}`, and that `θ(A)=A⁻ᵀ` is a smooth involutive automorphism preserving Sp_R. Compute `dθ(X)=−Xᵀ` and `B(X,Y)=(2n+2)tr(XY)`, so `−B(X,dθ(X))=(2n+2)tr(XXᵀ)>0` for X≠0. Use LieGroups Layer9's generic adjoint-model construction with this actual positive Cartan metric and finite center. Identify its compact adjoint subgroup with Ad(U(n)) and prove `Ad⁻¹(Ad(U(n)))=U(n)`, using the central kernel `{±I}⊂U(n)`. Give the matrix comparison: if A=P U and Ad(A) is orthogonal for the Cartan metric, Ad(P) is both positive self-adjoint and orthogonal, hence id; positivity and the central-kernel calculation force P=1. These structural, Killing and adjoint comparisons are required targets; they are not hypotheses of the two preceding trace-growth proofs.

Finally give the separate LieGroups Layer9 matrix-model specializations for H=C_R and H=Sp_R, both with π=id. Prove closedness and transpose stability in GL_(2n)(ℝ), use the connectedness just established, and identify `K_H=H∩O(2n)` with realified U(n). Apply the generic matrix-model theorem and compare its polar/maximality maps with the direct proofs. No semisimple or finite-center hypothesis is imposed on GL(n,ℂ). The construction order is C2.0, these concrete matrix/preservation/connectedness results and direct maximality proofs, followed by the separate generic matrix and Sp-adjoint comparisons. Generic LieGroups Layer9 owns its theorems and uses C2.0 for its own subgroup arguments; C2.1's primary results do not depend on that later comparison.

### C2.2. Exact Lagrangians and basic examples

An exact symplectic manifold carries a chosen smooth one-form λ with ω=−dλ; an embedded
Lagrangian i is exact when i*λ=df for a specified smooth f. Prove primitive uniqueness on connected
components and behavior under exact symplectomorphisms. The zero section is exact Lagrangian. The graph of a smooth one-form α is Lagrangian iff dα=0;
its pulled-back Liouville primitive exists iff α is exact. For compact Q
with at least two points, prove that the graph of df meets the zero section
in at least two distinct points: use the minimum and maximum of f when f
is nonconstant, and all of Q when f is constant. Construct the conormal N*Q as a smooth
vector subbundle over an embedded Q, its inclusion as an embedded submanifold of T*M, dimension dim M,
and λ|N*Q=0; conclude exact Lagrangian. For a symplectic diffeomorphism φ, its graph is Lagrangian in
(M×N,ω_M−ω_N). Conversely, for equal-dimensional manifolds a smooth **diffeomorphism** has Lagrangian
graph iff symplectic. A Lagrangian relation whose two projections are diffeomorphisms yields this
canonical transformation; local diffeomorphic projections yield it only on open neighborhoods.

Build the Liouville field Z by **ι_Zω=−λ** (more generally ι_Zω=−θ when ω=−dθ), so its
cotangent flow is `(q,p)↦(q,e^t p)` and its Lie derivative satisfies L_Zω=ω. Prove local-flow
rescaling and that θ-preserving symplectomorphisms commute with local Liouville flow. On the full
cotangent total space, including the zero section, prove every smooth λ-preserving symplectomorphism
is the cotangent lift of a unique base diffeomorphism. Use smoothness at the zero section and dilation
to show fiberwise linearity; no such classification is asserted just on the punctured bundle. Provide oriented surfaces with nowhere-zero area forms (automatic closedness in dimension two) and
cotangent tori with zero-section/closed-nonexact graph tests and a Kodaira–Thurston compact symplectic non-Kähler example: construct its
Heisenberg-lattice quotient times a circle as a smooth manifold using
SmoothBundlesConnections B1’s free proper discrete quotient charts; identify the
universal cover and deck group using
[UniversalCovers](../../../Completed/UniversalCovers/README.md), and compute π₁
through its covering/fundamental-group correspondence, then
H₁=π₁^ab using SmoothBundlesConnections B6.1’s degree-one comparison, and identify b₁=3 using
DifferentialGeometry’s de Rham comparison. Construct its closed nondegenerate form and odd first
Betti number obstruction using the compact Kähler
Hodge parity theorem: consume the degree-one Kähler harmonic/type decomposition and conjugation symmetry of
[ComplexKahlerGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/pull/953), including its explicit Hodge
parity theorem. That parity theorem is not a consequence of de Rham theory alone.

For a Riemannian Q of positive dimension, build its unit cosphere and consume
[ContactGeometry CG1](../ContactGeometry/README.md#cg1--contact-distributions-contact-line-and-cooriented-forms)'s contact-form predicate. Prove the boundary form
`α_b=−λ_can|S*Q` is contact, where `ι_Zω_can=−λ_can` for the outward radial
Liouville field. Its negative `α_g=+λ_can|S*Q` defines the opposite coorientation
and has the forward unit cogeodesic Reeb flow; `R_(α_b)=−R_(α_g)`. Prove these
flow identifications using the kinetic Hamiltonian and its derivative.
Positive radial identification between two metrics pulls each of these forms
back to a positive multiple of the corresponding form, preserving its contact
hyperplanes and coorientation. [ContactGeometry CG4](../ContactGeometry/README.md#cg4--symplectization-and-contactization)
and [CG5](../ContactGeometry/README.md#cg5--isotropic-and-legendrian-neighborhoods) consume this application.

## C3. Correspondences and generating functions

A correspondence L:M⇝N is a Lagrangian embedding into M×N¯, with form ω_M−ω_N. Define transpose, diagonal, product
and composition. Prove composition L₁₂×_(M₂) L₂₃→M₁×M¯₃ is Lagrangian under transverse fiber-product
and embedding hypotheses. For clean intersections specify the excess tangent kernel and reduction by
it; only assert embedded composition when the quotient is a smooth manifold and its projected map is
an embedding. Associativity is proved when all intermediate products/quotients satisfy these hypotheses.
There is no ordinary category of all Lagrangian correspondences with unrestricted composition.

For S:Q×Q'→R, graph dS in T*(Q×Q') is exact Lagrangian. After reversing the second fiber it is
`p=d_qS, P=−d_QS`. For equal base dimensions the nondegenerate mixed Hessian at a point supplies
local diffeomorphic projections by the implicit function theorem, hence a local symplectomorphism.
Pin source/target open sets, uniqueness of the chosen branch and the exact primitive
λ_source−φ*λ_target=d(S restricted to that branch). For the other three charts work in open subsets of finite-dimensional vector spaces, with
q,Q positions and p,P covectors: F₂(q,P)=S+⟨P,Q⟩ gives p=∂qF₂, Q=∂PF₂;
F₃(p,Q)=S−⟨p,q⟩ gives q=−∂pF₃, P=−∂QF₃;
F₄(p,P)=S−⟨p,q⟩+⟨P,Q⟩ gives q=−∂pF₄, Q=∂PF₄.
Build partial Legendre transforms with their nondegenerate projection/Hessian conditions and prove
these transition identities. The intrinsic mixed Hessian of S at (q,Q) is d_q(d_QS), a bilinear
map T_qQ×T_QQ′→R; define it through the product derivatives and prove coordinate independence. Treat families S(q,Q,a) with ∂_aS=0: when the fiber derivative ∂aS is transverse to the zero section,
the critical set defines an immersed Lagrangian; embeddedness is an additional hypothesis. Composition uses S₁₃=S₁₂+S₂₃ evaluated at a solution of ∂_(q₂)(S₁₂+S₂₃)=0,
with nondegenerate q₂-Hessian giving the unique local elimination branch.

Acceptance: S(q,Q)=−‖q−Q‖²/(2t), t≠0, generates `(q,p)↦(q+tp,p)` on Euclidean cotangent space.
This is the time-t flow of H=‖p‖²/2. F₂(q,P)=⟨q,P⟩+t‖P‖²/2 generates it for every t,
including the identity at zero. For the oscillator use
S_t(q,Q)=(2qQ−(q²+Q²)cos t)/(2sin t), t∉πZ; its transformation is
(q,p)↦(q cos t+p sin t,−q sin t+p cos t). Its type-one projection fails at t∈πZ
although the flow remains smooth. The cotangent relation of R→R/(2πZ) illustrates local
invertibility without a global inverse.

### C3.1. Discrete action, iterates and convex billiards

**Fixed points and finite iterates.** Let S be a smooth generating function
on an open W⊂Q×Q whose relation `p=d_1S(q,Q), P=−d_2S(q,Q)` is the graph
of a specified symplectomorphism between open cotangent domains. On
`{q : (q,q)∈W}`, put ψ(q)=S(q,q). Prove
`dψ_q=d_1S(q,q)+d_2S(q,q)` and the bijection between its critical points
and fixed phase points with base pair in W, sending q to `(q,d_1S(q,q))`.
For N≥2, define the cyclic action
`A_N(q_0,…,q_(N−1))=Σ_i S(q_i,q_(i+1 mod N))`
on the open configuration domain where every edge lies in W. Its critical
equations are the matching-covector equations at each vertex. Prove the
bijection with marked phase points fixed by the Nth iterate, retaining the
domains on which all intermediate iterates are defined. The least period
may divide N; cyclic shifts change the starting collision, and must be
accounted for before counting unmarked periodic orbits.

For fixed endpoints q_0,q_N, use the open-chain action
`F_N=Σ_(i=0)^(N−1) S(q_i,q_(i+1))`. At a stationary internal configuration
with invertible full Hessian in `(q_1,…,q_(N−1))`, apply the implicit
function theorem to construct a smooth local critical branch and evaluate
F_N there to obtain S_N(q_0,q_N). Prove the endpoint derivative formulas,
the mixed-Hessian nondegeneracy and the identification of its generating
relation with the Nth iterate on the resulting cotangent domains. Give
N=2 and N=3 explicitly. A global generating function requires the
corresponding global uniqueness and graph-projection hypotheses; local
elimination alone supplies a local branch. The cyclic critical-point
correspondence does not require eliminating the internal variables or
assuming nondegeneracy of the periodic orbit.

**Convex planar billiards.** Let χ:ℝ/(Lℤ)→ℝ² be a smooth positively oriented
arclength embedding, L>0, bounding a bounded strictly convex table: every
tangent support line meets its boundary only at its point of tangency.
Use [I2.0's positive-period circle](../IntegrableSystems/README.md#i20-positive-period-circles-and-families)
and define the collision phase space
`P=(ℝ/(Lℤ))×(−1,1)`, where v is the unit outgoing velocity's component
along χ′(s). Construct the next-collision map by the straight chord and
specular reflection. Prove existence, uniqueness, smoothness and the smooth
inverse on this open phase space. Tangent collisions v=±1 are excluded.

On distinct boundary pairs put `S(s,t)=−‖χ(t)−χ(s)‖`. For lifts with
`s<t<s+L`, derive `v=∂_sS` and `w=−∂_tS` for the next state (t,w).
Prove `∂_s∂_tS<0` from strict convexity and the non-tangency of each chord,
so `∂t/∂v<0` on the lifted return map. The generating function is invariant
under changing either boundary parameter by L; its smooth domain excludes
the diagonal. Set λ=v ds and ω=ds∧dv. If ℓ(s,v) is the chord length of the
next collision, prove `β*λ−λ=dℓ`, hence `β*ω=ω`, for the return map β:P→P. Construct the corresponding invariant
Borel area measure `ds dv`, of total mass 2L, by product of the period-L
circle's length measure with Lebesgue measure on (−1,1). Supply the
change-of-variables and quotient-chart comparisons establishing actual
`MeasureTheory.MeasurePreserving` for this measure. Under the period-one
coordinate u=s/L, the canonical covector is p=Lv, so λ=p du and
ω=du∧dp. Carry this factor through the area and generating formulas.

Use the cyclic action above to identify critical inscribed N-gons with
marked N-periodic billiard states. Its negative is perimeter. Require
consecutive vertices to be distinct, allow nonconsecutive repetitions and
periods dividing N, and prove the equal-angle law at every vertex. For each
N≥2, maximize perimeter on the compact full configuration space
`(ℝ/(Lℤ))^N`. Show that a maximizer has no consecutive coincident vertices:
move a repeated vertex off the chord between its neighbors and use the
strict triangle inequality to increase perimeter. The maximum therefore
lies in the smooth collision domain and gives a periodic billiard state
whose least period divides N. As an explicit test, for the circle of
radius R and L=2πR derive
`β(s,v)=(s+2R arccos(v) mod L,v)`, together with its rational-rotation
periodicity criterion and the chord-length primitive formula.

**Finite-volume recurrence.** Consume Mathlib's
`MeasureTheory.MeasurePreserving.conservative`,
`Conservative.ae_mem_imp_frequently_image_mem` and
`Conservative.ae_frequently_mem_of_mem_nhds` from
`Mathlib.Dynamics.Ergodic.Conservative`. For a symplectomorphism preserving
a specified finite Borel measure of full support, prove the neighborhood
return formulation: every nonempty open U contains a point returning to U
after a positive number of iterates. On a second-countable space, also
retain the native almost-everywhere conclusion of infinitely many returns
to every neighborhood of the starting point. Apply both statements to the
billiard area measure above. For higher-dimensional symplectic systems,
consume the Liouville measure and symplectomorphism-invariance theorem from
[ConvexityToric T4](../ConvexityToric/README.md#t4-liouville-and-duistermaatheckman),
requiring finite total measure for this recurrence application. Only T4's
orientation/integration-based Liouville construction is used here; its
reduction and Duistermaat–Heckman theorems are separate prerequisites for
their own applications.

## C4. Relative symplectic germs

Build the relative Poincaré lemma from fiber scaling in a tubular neighborhood
and DifferentialGeometry Layer 5.4's homotopy operator. On a fiberwise
star-shaped tube, or an adapted coordinate box, let i:Q→M be the zero-section
inclusion and r the retraction. For a closed form η of positive degree, construct
β with `dβ=η−r*(i*η)` and with β zero as a full ambient tensor along Q.
In particular, `i*η=0` gives `dβ=η`, even when η does not vanish as a full
ambient tensor along Q. Full ambient vanishing is a stronger hypothesis that
also gives the zero-first-jet primitive used below. Consume HeegaardFloer F2.1’s local smooth-parameter primitive selection
and time-dependent pullback differentiation identity. Build the relative, parameter-preserving
version by tubular fiber scaling and the homotopy operator, ensuring primitives vanish
along the fixed submanifold. Consume HeegaardFloer F2.1's domain-local Moser
lemma and prove its submanifold-fixing refinement from these relative primitives.

Prove relative Moser on the same ambient M: if two closed symplectic forms agree as bilinear forms on **all ambient tangent
fibers along a compact embedded Q**, there are neighborhoods and a diffeomorphism fixing Q pointwise
which pulls one form back to the other. The relative Poincaré primitive vanishes on Q; the affine
interpolation is symplectic on a uniform neighborhood of Q, and the time-dependent flow stays there
after shrinking. State the symplectic-path hypothesis explicitly in every global comparison theorem; equality of
endpoint cohomology classes alone does not imply such a path.

Under the full ambient-form equality along compact Q, strengthen this relative theorem
to an ambient first-jet identity: the neighborhood diffeomorphism fixes Q and its
differential is the identity on `TM|Q`. Prove that tubular fiber scaling applied to
`η=ω₁−ω₀` gives a primitive β whose value and first jet vanish along Q: contraction
contributes one normal factor and the tensor η contributes another. Formulate this
as β having zero first jet, equivalently β and its covariant derivative vanishing
there for any auxiliary smooth connection. The affine path is symplectic on a common
shrunk neighborhood; `ι_(Y_t)ω_t=−β` then gives Y_t with zero first jet along Q.
Use the variational equation for its flow to obtain the ambient differential identity.
This strengthening requires full ambient tensor equality, not merely equality of
the pulled-back forms on TQ.

<a id="c4-relative-darboux-point-germs"></a>
For an arbitrary embedded submanifold Q and p∈Q, prove the point-germ relative
Darboux theorem: two symplectic forms on an ambient manifold of the same
dimension with equal pullbacks to Q have symplectomorphic germs at p by a map
fixing Q as a germ. The restricted two-form may have varying rank. First extend
the identity of T_pQ to an ambient symplectic linear isomorphism. Own the
finite-dimensional symplectic Witt-extension lemma used here: any linear isomorphism preserving the restricted forms
between arbitrary subspaces of equal-dimensional symplectic vector spaces,
including degenerate subspaces, extends to a symplectic linear isomorphism.
Prove it as follows. For a subspace W, put R=rad(W) and choose a complement W₀ with
W=R⊕W₀; the restricted form on W₀ is nondegenerate. In W₀^ω choose an isotropic dual R′
paired nondegenerately with R, so R⊕R′ is symplectic. Then
V=(R⊕R′⊕W₀)⊕(R⊕R′⊕W₀)^ω. Do the same for the target, carry matched bases of R, R′ and
W₀ by the given isometry and the induced dual/symplectic bases, and extend by Darboux bases of the
symplectic complements. This extends the isometry on W even when W is degenerate. Realize it by a local diffeomorphism fixing Q in
adapted submanifold coordinates. The adjusted forms agree on the full ambient
tangent space at p. Their affine path is symplectic on a common neighborhood of
p for all t∈[0,1]. Apply the relative radial homotopy to their difference:
the resulting one-form vanishes as a full covector along Q. Its Moser field
vanishes on Q, and the stationary trajectory at p gives a full-parameter flow
on a smaller neighborhood. This local theorem uses no global normal-bundle
identification along all of Q. The compact-submanifold global germ theorems
below retain their specified normal-bundle data.

[RelativeDarbouxTargets.lean](RelativeDarbouxTargets.lean) gives suggested
linear extension signatures using Tau Ceti's symplectic-form carrier.

<a id="c4-full-ambient-bundle-germs"></a>
**Neighborhood germs with prescribed ambient derivative.** Let
`i:Q→(M,ω_M)` and `j:Q′→(N,ω_N)` be smooth embeddings of compact
submanifolds, and let f:Q→Q′ be a diffeomorphism. Given a smooth symplectic
vector-bundle isomorphism `A:i*TM→j*TN` over f satisfying
`A_q ∘ di_q = dj_(f(q)) ∘ df_q`, construct open neighborhoods U of i(Q)
and V of j(Q′) and a symplectomorphism Φ:U→V with
`Φ ∘ i = j ∘ f` and `dΦ_(i(q)) = A_q`. Conversely, differentiation of
any such symplectomorphism gives these bundle data. No constant-rank
hypothesis on the pulled-back two-form is required when A is supplied.

Construct the extension of the prescribed derivative before applying Moser.
Choose tubular splittings `TM|Q = TQ ⊕ ν_M` and `TN|Q′ = TQ′ ⊕ ν_N`.
Write `A_q(v,n) = (df_q(v)+B_q(n), C_q(n))`; C is a normal-bundle
isomorphism over f. On the source normal bundle, set
`q′ = exp_(f(q))(B_q(n))` using an auxiliary metric on Q′, and transport
`C_q(n)` in ν_N along `t↦exp_(f(q))(t B_q(n))`. Compose this map into ν_N
with the target tubular map. Prove that its derivative along the zero
section is A. The inverse function theorem, embeddedness and compactness
then give a diffeomorphism of neighborhoods extending f. Its pulled-back
form agrees with ω_M on all ambient tangent fibers along Q. Apply the
full-ambient relative Moser theorem above; its zero-first-jet refinement
preserves the derivative A.

Define neighborhood germs by agreement after shrinking around the whole
submanifold. Prove restriction, identity, inverse and composition laws, with
prescribed derivatives composing as bundle maps. Two extensions obtained
from the same (f,A), including those using different tubular maps, metrics
or connections, differ by a symplectic germ fixing Q pointwise with full
ambient derivative the identity. The point-germ theorem needs only an
extension at one point; this compact-submanifold theorem requires the
specified smooth bundle isomorphism along all of Q. Recover the
symplectic and Lagrangian neighborhood theorems below by constructing their
compatible ambient bundle isomorphisms from the stated normal data.

For a compact symplectic submanifold, construct its symplectic normal bundle TQ^ω and prove the
symplectic neighborhood theorem: a symplectic normal-bundle isomorphism over a symplectomorphism of
submanifolds extends to a symplectomorphism of neighborhood germs. Construct a smooth compatible J/complement along the submanifold and a symplectic connection
from SmoothBundlesConnections B2–B4 by preserving the fiber form. Build its model closed form,
nondegenerate on a neighborhood of the zero section, and show the germ is independent of connection. For a compact Lagrangian Q,
identify the normal quotient with T*Q by `[n]↦ω(·,n)|TQ` and prove Weinstein's neighborhood theorem with zero-section
restriction fixed. Distinguish pullback agreement on TQ from agreement on the ambient tangent bundle;
the linear extension/tubular realization is the step connecting them.

For an abstract compact presymplectic Q with closed constant-rank σ, build its kernel smooth
distribution, prove involutivity with the closed-form formula and construct its characteristic
foliation using DifferentialGeometry Layer 4. Construct the coisotropic embedding model near the
zero section of (ker σ)* and prove nondegeneracy there. Prove uniqueness: two coisotropic embeddings
inducing the same σ have symplectomorphic neighborhood germs relative to Q. For already embedded
coisotropics the kernel rank equals codimension automatically. This is
consumed by regular reduction/DH, with compactness only for uniform neighborhoods, not for fiberwise
linear statements. Develop the kernel/leaf/quotient tangent API used by R3 and T4.

## Acceptance and dependencies

C1 precedes C2/C3; C4 consumes C2.2, tubular realization and relative forms.
C3.1 consumes C3's generating relations and I2.0's independent positive-period
circle construction. Its recurrence application consumes only T4's generic
Liouville-measure construction and Mathlib's finite-measure recurrence. Verify conormal examples for
points, all of M and coordinate submanifolds; graphs of closed nonexact torus one-forms; product/transpose
signs; free-particle generating function; compact Lagrangian zero-section neighborhood and symplectic
normal germ. Reuse chart formulas for every intrinsic construction. Floer theory, quantum invariants
and contact topology remain with their existing owners; C1/C2.2 supply cotangent forms, exact Lagrangians and graph/zero-section examples to HeegaardFloer F3.
The cosphere acceptance test uses C2.2's two explicitly signed forms and
[CG1](../ContactGeometry/README.md#cg1--contact-distributions-contact-line-and-cooriented-forms)'s
single contact predicate; its metric-radial comparison belongs to C2.2.

## References

Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
§§2–8 (cotangent forms, Lagrangians, Darboux–Moser–Weinstein), §11 (contact example).
Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, Adv. Math. 6 (1971), 329–346.
