# Elliptic index theory and the Atiyah–Singer theorem

Build the analytic and topological index maps for elliptic operators on closed
smooth manifolds, their equivariant versions and the embedding proof that they
agree. Develop the symbol, support, naturality and normalization interfaces before
deriving Gauss–Bonnet, the signature theorem, holomorphic Riemann–Roch and the
twisted spin Dirac formula. The aim includes the functional-analytic connectors
and concrete examples that make these theorems usable.

## Scope, conventions and suppliers

Manifolds are finite-dimensional smooth Hausdorff second-countable manifolds
without boundary; index assertions concern compact bases. Bundles are smooth
finite-rank complex bundles, with locally constant ranks. Real differential
operators enter by complexification, whose complex index equals the real index.
Equivariant statements use smooth actions of compact Lie groups and smooth bundle
actions. Continuous parameters have their stated Sobolev operator topology.
No orientation or spin assumption is imposed on the general index theorem.

Use Mathlib's `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`,
`ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage`,
`LinearMap.index`, paths and homotopies. The cotangent fibre is the continuous
real dual of Mathlib's `TangentSpace`; finite dimension identifies it with the
algebraic dual through a proved equivalence. Do not define cotangent vectors as
an unrelated Euclidean tuple type. Identify tangent and cotangent only through
a chosen metric musical isomorphism, and prove choice independence.

The integer index is source kernel minus target cokernel. Complexes have even
source minus odd target Euler class. Fourier symbols use PDO's convention
`σ_F(∂_j)=iξ_j`, equivalent to Mathlib's multiplier `2πiζ_j` with ξ=2πζ.
A geometric differential symbol gains i^m in order m. Multiplication is
composition with the rightmost operator acting first. Hilbert inner products
are conjugate-linear in the first variable; quotient cokernels are identified
with formal-adjoint kernels only through the supplied closed-range/duality maps.

On a real vector space V identify TV=V_x⊕V_v with V⊗ℂ by z=v−ix. This fixes
the complex orientation on the cotangent total space after metric/connection
transport. For an oriented n-manifold its comparison with base-first coordinates
(x₁,…,x_n,ξ₁,…,ξ_n) has sign (−1)^(n(n−1)/2). The complex structure itself
is auxiliary; its orientation is canonical on T*M and independent of choices,
including when M is nonorientable. Products retain the explicit coordinate
permutation and graded signs.

The cotangent embedding pushforward uses TopologicalKTheory's **exterior-wedge**
Thom class `w_E=(−1)^r det(E)·u^dual_E`, where u^dual_E is its dual Koszul class.
On V⊗ℂ for a real representation V of dimension n, w has analytic index1;
the dual class has equivariant index `(−1)^n det(V_ℂ)`. In rank1 without
action, w=β=[O(−1)]−1 and u^dual=−β. The first-to-second disc transition
for β is z. Keep both Thom conventions and their conversion in the API;
they are not interchangeable generators. Cohomological Thom and Chern characters use
CharacteristicClasses' positive complex orientation. Its periodic coefficient
is written u_per=β of degree−2, with ch(u_per)=−v_per; this is distinct
from the dual Thom class. In ordinary compact-support cohomology
ch_c(β)=−U_ℂ, where U_ℂ is the positive complex Thom class. Degree0 formulae
use CC C6's explicit periodic-degree fold.

| Supplier | Interface consumed here |
|---|---|
| [OperatorTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorTheory/README.md) | OperatorIdeals OI-A25–A30 compact approximation/adjoints; PolarDecomposition's Hilbert polar decomposition; SelfAdjointSpectralTheory Part B bounded Borel calculus, and its partial-operator/adjoint conventions. |
| [OperatorKTheory K4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3074b6af30d26ccb4702a3c5bd02786edeb1d5de/TauCetiRoadmap/OperatorKTheory/README.md#k4-fredholm-indices-and-extensions) | Calkin algebra, compact parametrices, Atkinson theorem and comparison with native Fredholm/index APIs. [CStarAlgebras C1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/587574799eedc51fb10500f7f661a463014356de/TauCetiRoadmap/CStarAlgebras/README.md#c1-ideals-hereditary-subalgebras-and-multipliers) supplies closed star ideals and C*-quotients; [HilbertModules H2,H5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ef56509c5200f50533617e50774a88018b67785c/TauCetiRoadmap/HilbertModules/README.md) supplies the ℂ specialization, rank-one/compact comparison and finite-rank endomorphism-bundle section C*-algebra. |
| [SmoothBundlesConnections B1–B4,B6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c45ab4061b483b832b5d54f597dc69afd3f97a5/TauCetiRoadmap/SmoothBundlesConnections/README.md) | Smooth bundle morphisms, metrics, L² sections, frame/principal/associated bundles, compatible connections and B6's line cocycle/curvature normalization. |
| [ComplexKahlerGeometry K1–K2,K4–K7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) | Complex/type/Dolbeault and sheaf comparison; shared all-real compact-bundle H^s Hilbert/distribution scale; real de Rham and complex Dolbeault Hodge theory, Serre duality and projective examples. K5's static Laplace theory is independent of this index theorem. |
| [PseudodifferentialOperators P1–P7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/063cf517a1dcc4d929e0602c6e6f585953aceab8/TauCetiRoadmap/PseudodifferentialOperators/README.md) | Differential/jet symbols, classical calculus and continuous quantization, all-order estimates, parameter continuity, parametrices/Fredholmness, spectral powers and change of order. P7 owns corrected external products and their Hilbert-tensor/kernel comparison, plus common-order elliptic-complex Hodge theory; consume these rather than repeat their analysis. |
| [TopologicalKTheory T1–T6,T7.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4825a006bd717abd58f3a1699d8ddf738c505047/TauCetiRoadmap/TopologicalKTheory/README.md) | Actual finite-rank bundle category, relative triples retaining σ, compact supports, exact/MV sequences, smoothing, complex Bott/Thom, compact-Lie representation ring and equivariant descent/products. T6's minimal projective-family stabilization proves equivariant Thom independently of Atiyah–Singer. T7.5 owns the sphere Koszul reflection homotopy; this roadmap computes its analytic index. |
| [CharacteristicClasses C1–C7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/01224fe30cf811f9e6d239b75f4003bb8c0b685a/TauCetiRoadmap/CharacteristicClasses/README.md) | Local-coefficient orientations, compact-support Thom/Gysin, finite-dimensional evaluation, Chern character/Thom correction, Chern/Pontryagin/Euler/Stiefel–Whitney classes, universal rings, Todd/L/Â and coefficients. Ordinary cohomology and cup/excision are supplied by [AlgebraicTopology Stages 6,8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/77caf227f456d6da938674a1ac50e309d47c476a/TauCetiRoadmap/AlgebraicTopology/README.md), de Rham/PD/integration by [DifferentialGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f2c41bace7640366666d72c8939784696e8e3888/TauCetiRoadmap/DifferentialGeometry/README.md). |
| [GeometricTopology Layers1,3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d17fb6107d1a002e25cd09f3e23a9b2b6a06222d/TauCetiRoadmap/GeometricTopology/README.md) and [HopfRinow Layer1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c99f962c0293ea860da45c79356d70d8bd53414/TauCetiRoadmap/HopfRinow/README.md) | Smooth compact embeddings, normal/tubular geometry and Levi–Civita connection. I3 constructs the induced complex normal identification for Tf. |
| [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7192fba83d83d28a87ff6fed01404e2579ed9377/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md), [LieGroups L6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/85f49c01009d5df11d3a6e8935fe7b14ed21c1cd/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md) and [ClassicalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md) | Haar averaging, continuous finite-dimensional representations, Peter–Weyl/character detection and connected compact torus theory. I5 owns the real orthogonal block normal form and its disconnected restriction detector. |
| [SpinGeometry G1–G6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7ec54b66335f774b6587ecbb96ec3b261dfe838c/TauCetiRoadmap/SpinGeometry/README.md) | Negative-metric Clifford modules, Γ/Hodge-star dictionary, spin structures, spinors/half-spin roots, chiral Dirac operators and their exported compact-support symbol class; G6.7 supplies the untwisted dimension-four quaternionic kernel parity. Numerical index formulae are proved here. |

Use existing native Mathlib Fredholm composition, openness and index local
constancy, including `IsFredholm.index_comp`, `eventually_nhds_index_eq` and
`index_continuousOn_isFredholm`, and Tau Ceti's compact perturbation/path/adjoint
comparison APIs. Build connectors in this roadmap against that vocabulary.
Its geometric symbol-index API does not require the KK product, UCT or a general
variable-fibre family-index theorem. OperatorKTheory owns those operator-algebra
constructions in their own specified scope. [Suggested.lean](Suggested.lean)
tests representative native interfaces; this README is definitive.

## I1. Hilbert Fredholm connectors and index exercises

1. Compare the native Fredholm package with orthogonal decompositions by
   ker T, range T and ker T*. Its quasi-inverse is continuous **modulo finite-rank
   errors**, not itself a finite-rank map. Consume K4 Atkinson on endomorphisms
   and obtain rectangular two-sided compact-parametrix equivalence by the
   corners of B(H₀⊕H₁)/K(H₀⊕H₁), keeping the two corner identities.
   Export rectangular parametrix composition, finite blocks, adjoints,
   compact-perturbation transport and uniqueness modulo compact maps by
   the corner error identities, deriving inverse-index sign through the
   native composition law. Give
   the concrete orthogonal-package comparison. Consume native/Tau Ceti
   `index_equiv_comp`, `index_comp_equiv`, `index_prodMap`, `index_smul`,
   `index_adjoint`, `cokerEquivKerAdjoint` and
   `range_adjoint_eq_orthogonal_ker_of_isClosed_range`; transport them to the
   supplied section realizations. Export index statements using
   `(T : E →ₗ[𝕜] F).index` for 𝕜=ℝ or ℂ; compare Tau Ceti's `ContinuousLinearMap.index`
   through `ContinuousLinearMap.index_def`. Build complexification of real defect
   spaces and prove equality of real and complexified indices. For complex
   Fredholm T prove realification is Fredholm and
   `index (T.restrictScalars ℝ)=2 * index T`, by the kernel/quotient
   restriction-of-scalars identifications and real dimension of a complex
   finite-dimensional space. Derive the
   range(T*T)=range(T*)=ker(T)^⊥ comparison from those closed-range
   identities, keeping source and target subspaces typed.
   For a fixed Fredholm T₀ export the operator-norm neighbourhood normal
   form in these fixed decompositions: E=X⊕K with K=ker T₀, X=K^⊥ and
   F=R⊕C with R=range T₀ and C=ker T₀*. Write a nearby T as
   `[[A,B],[C₁,D]]`, where A:X→R, B:K→R, C₁:X→C and D:K→C.
   Construct the native `IsFredholm.fredholmPackage` using the orthogonal
   topological complements, and compare its codomain projection with the
   orthogonal projection onto R. Consume
   `FredholmPackage.eventually_nhds_isInvertible` for A.
   Pin A(T)⁻¹ by transporting A(T) through A(T₀)⁻¹ to the Banach algebra
   X→L X and applying `Ring.inverse`; use `NormedRing.inverse_continuousAt`
   at units for norm continuity. The following explicit parameterized
   factorization and defect isomorphisms are new exported targets; compare
   their block order with Tau Ceti SmallPerturbation's existing private
   existential factorization K×X→R×C, promoting/generalizing that single
   construction with its swap rather than adding another independent copy.
   Construct the continuous invertible triangular changes on source and
   target reducing T to `diag(A,D−C₁ A⁻¹B)`. Export their norm-continuous
   dependence, the resulting kernel and cokernel isomorphisms with those
   of the finite-dimensional map K→C, and its index dim K−dim C.
   Compare this model with native openness and index local constancy.
   Also export the transverse-subspace lemma: for finite V with
   V∩ker T₀=0, the map V⊕(T₀V)^⊥→F, (v,w)↦Tv+w, stays invertible
   near T₀. It gives V∩ker T=0 and F=T(V)⊕(T₀V)^⊥. Obtain closedness
   of the whole range T independently from native Fredholm openness.
   For the infinite-dimensional version assume V closed finite-codimensional
   and T₀|V a continuous linear equivalence onto a closed finite-codimensional
   range; prove the corresponding neighbourhood statement. In that neighbourhood
   prove V∩ker T=0 and F=T(V)⊕(T₀V)^⊥. Since T(V) is closed and
   finite-codimensional, prove range T closed and T Fredholm directly, and
   export `dim ker T ≤ codim V`, `dim coker T ≤ dim (T₀V)^⊥`, and
   `dim ker T₀−dim ker T = dim coker T₀−dim coker T`.
   This version applies to X=ker(T₀)^⊥ without calling X finite-dimensional.
2. For a commuting diagram of continuous linear maps between two **split
   topologically exact** short sequences of Hilbert spaces construct the
   six-term kernel/cokernel snake sequence using native
   `CategoryTheory.ShortComplex.SnakeInput` and `SnakeInput.snake_lemma`
   on the corresponding `ModuleCat ℂ` objects. Prove continuity where it is
   claimed and independence of splittings. For bounded maps in short exact
   Hilbert sequences derive the required topological splittings from
   algebraic exactness: images are the closed kernels of the next maps,
   and open mapping plus orthogonal complements gives the continuous
   inverses on complements. If two vertical maps are Fredholm,
   prove the third's kernel and algebraic cokernel finite by the snake
   sequence. Consume `ContinuousLinearMap.isClosed_range_of_finite_coker`
   and `IsFredholm.of_finite_ker_coker` from Tau Ceti ClosedRange to obtain
   native Fredholmness: completeness and boundedness are the hypotheses
   of that closed-range inference. Derive
   `ind T_middle=ind T_left+ind T_right` by exact-sequence dimensions.
   Give the composition snake diagram as a comparison with native index_comp.
   Compare the triangular-block compact-parametrix description with this result.
3. Consume Tau Ceti Criteria's `bijective_of_surjective_of_index_eq_zero`
   and derive its injective counterpart from `index_of_injective` and finite
   cokernel rank0 for the index0 alternative. Extend its
   solvability API for every Hilbert Fredholm map: its image is the common
   zero set of `dim ker T* = dim coker T` independent continuous linear
   compatibility functionals from an adjoint-kernel basis. Prove that their
   number is minimal: every finite family of linear functionals, continuous
   or not, with common kernel range T has at least dim coker T members,
   and one attaining that number is independent. Prove the analogous
   cardinal bound for an arbitrary family under the same finite-cokernel
   hypothesis. Prove this minimal number equals dim ker T if and only if
   `(T : E→ₗ[ℂ]F).index=0`, and retain that equality in the corresponding
   Fredholm-alternative statement.
   The weaker disjunction “bijective or nonzero kernel” alone does not imply
   index0; distinguish it from the assertion including the minimal-count equality.
   On infinite-dimensional ℓ²(ℕ) construct the backward unilateral shift
   `(Bu)_n=u_(n+1)`: it is surjective with one-dimensional kernel and index+1,
   and satisfies that weaker disjunction. This is the required counterexample.
   For an integral equation `(Id+K)u=f` with continuous finite-rank
   separable kernel `k(x,y)=Σa_j(x)b_j(y)` on a compact finite-measure space,
   prove boundedness, finite rank and the finite matrix reduction, including
   real/complex slot conventions and the exact solvability conditions.
   Use the identity-plus-compact alternative and index0 APIs, with every
   integrability/continuity hypothesis stated.
   Include the source's L² separable-kernel case on a finite interval:
   for f_j,g_j∈L²[a,b], set `Ku=Σ_j ⟨g_j,u⟩f_j` with the conjugate-first
   inner product. Prove this agrees almost everywhere with integration
   against `Σ_j f_j(x)conjugate(g_j(y))`, is bounded with norm at most
   `Σ_j ‖f_j‖₂‖g_j‖₂`, and has finite rank. For `u+Ku=h`, put
   `c_i=⟨g_i,u⟩` and prove equivalence with
   `c_i+Σ_j⟨g_i,f_j⟩c_j=⟨g_i,h⟩`, reconstructing `u=h−Σ_j c_jf_j`.
   Derive the alternative and compatibility conditions without imposing
   continuity of the L² factors or of this kernel.
4. Specialize the Calkin quotient norm and composition inequality from C1/K4.
   Prove `‖π(Id_H)‖=1` for infinite-dimensional H using compactness and an
   orthonormal sequence or Riesz separation; for finite-dimensional H the
   quotient is zero and the norm is0. Include zero H. Consume K4's compact
   star ideal and its OI approximation/adjoint comparison.
5. For complex Hilbert H construct a bounded self-adjoint A with
   `U=exp(iA)` for every unitary U by applying the bounded Borel argument
   function to its spectrum. Prove the exponential identity by uniform
   polynomial/series approximation and Borel-calculus multiplicativity/norm
   control; a continuous principal logarithm need not exist on the spectrum.
   The path `t↦exp(itA)` is continuous in operator norm. Combine this with
   the positive invertible factor in polar decomposition and the linear path
   from Id to that factor to prove GL(H) norm-path connectedness.
6. For all complex Hilbert H₀,H₁ prove two Fredholm maps are joined by
   a norm-continuous Fredholm path iff their native indices agree. Define
   Hilbert dimension as the cardinality of a complete orthonormal basis
   (`HilbertBasis`), proving existence and independence of the basis. This
   is not the Hamel dimension of the underlying algebraic module. Prove
   invariance under unitary equivalence and then continuous linear equivalence
   by its polar-decomposition unitary, and prove its orthogonal-direct-sum
   cardinal law, including finite-dimensional additions to an infinite space.
   For two Fredholm maps construct
   the path as follows. In finite
   dimensions every map is Fredholm and the linear path suffices. Otherwise
   use the Fredholm package and pair a kernel/cokernel basis vector by a
   finite-rank path until only the signed index defect remains. For two
   resulting maps, extend finite-subspace orthonormal changes to unitaries
   on the ambient spaces by a finite-dimensional rotation on their span and
   identity on its orthogonal complement. Their kernels and ranges can then
   be aligned. Deform the remaining essential isomorphism through item5's
   GL paths and extend by the finite zero blocks. Every intermediate map is
   Fredholm by native finite-rank perturbation, and local constancy supplies
   the converse. This argument requires no separability of the ambient spaces.
   Determine the image of index explicitly. When both spaces are
   infinite-dimensional of the same Hilbert dimension κ, identify them with
   ℓ²(κ) and use a countably infinite orthogonal summand for shift/adjoint
   powers, extended by the identity on its complement, to realize every integer.
   Thus index bijects norm-path components with ℤ without separability.
   When both spaces are finite-dimensional its image is the singleton
   `{dim H₀−dim H₁}`. When exactly one is finite-dimensional, or their
   infinite Hilbert dimensions differ, prove the Fredholm locus empty using
   the finite-defect orthogonal decompositions.

## I2. Symbol classes and the analytic index map

1. On a closed M construct the cotangent disc/sphere bundles for a metric and
   identify `K(D(T*M),S(T*M))` with `K_c(T*M)`. Compare actual relative triples,
   bounded bundle complexes exact off zero and the folded even/odd map.
   Pin support as a closed subset outside which the map is invertible; distinguish
   this subset from support of a section or a kernel. An elliptic order-m
   homogeneous symbol defines `(π*E,π*F,σ)` exact off the zero section.
   Normalize it on the unit cosphere and extend radially; multiplying it by
   positive |ξ| powers changes its representative through an explicit
   invertible homotopy and preserves its class. Constant complex phases also
   give invertible homotopies.
2. Prove **every** class in K_c(T*M) is represented by a stabilized smooth
   homogeneous order0 elliptic symbol pulled back from bundles on M.
   Contract the disc fibres to pull its two bundles back to the base using
   T1's homotopy classification, retain/transport the boundary isomorphism,
   smooth the bundle/isomorphism on the compact cosphere and extend by
   degree0 homogeneity with a frequency cutoff. In dimension0, the cosphere
   is empty and arbitrary unequal-rank point triples are allowed. Quantize
   by PDO P4's square partition and continuous symbol lift. Prove the cosphere and relative-triple
   constructions agree in K-theory and operator topology; arbitrary
   ordinary partitions used symmetrically are not square partitions.
3. Define `ind_a:K_c(T*M)→ℤ` by the native Fredholm index of an order0
   realization on the shared L² bundle spaces. Show equal symbols differ by
   order−1, hence compact, and that symbol homotopies lift to norm-continuous
   elliptic families. Degenerate triples realize isomorphisms of index0;
   stabilization/direct sums have the required index laws. Handle changes of
   base bundle by smoothing the specified isomorphisms and transporting the
   Hilbert realization. Thus the map is an additive homomorphism independent
   of representative, partition, smoothing and quantization choices.
   Compare an order-m realization `H^(s+m)(E)→H^s(F)` with this map using
   PDO P7's genuine elliptic power isomorphisms. Spectral existence of a
   square root alone is not its pseudodifferential order theorem.
4. Export class/metric/Sobolev-order invariance, diffeomorphism naturality,
   orientation independence, direct sums, formal adjoint sign, invertible and
   finite-dimensional cases. For a finite common-order elliptic complex,
   identify the folded symbol/index with alternating cohomology dimensions
   through PDO P7's Hodge decomposition. Ellipticity of the de Rham symbol complex means exactness
   away from the zero section; it does not assert ellipticity of its individual
   arrows. In dimension at least two the usual arrows have noninvertible symbols,
   while in dimension one d:Ω⁰→Ω¹ is itself elliptic. Compare the existing
   de Rham/Dolbeault Laplace realizations by their proved uniqueness maps.
5. Construct analytic-index excision: for an open U⊂M and compactly supported
   class a∈K_c(T*U), define its local index by extension to a closed ambient
   manifold and prove independence of that ambient manifold. Build representatives
   equal to an identified identity bundle map outside a relatively compact
   neighbourhood, using the support triple/stabilization and bundle extension
   APIs. Localize their properly supported quantizations so the operator is
   exactly Id on the outside block and has no cross terms across a smaller
   support neighbourhood. Prove the resulting block decomposition of L² and
   the kernel/cokernel comparison between two ambients; discarded smooth
   kernels give compact perturbations. Use nested cutoffs and collars to
   justify the block separation for the nonlocal operator. Prove additivity for disjoint supports, naturality for
   open embeddings and composition of open extensions. Work on support classes
   over arbitrary U admitting the specified compact ambient embeddings.
   Build the local difference class for two elliptic symbol triples with
   specified identifications and symbol homotopy outside a compact subset
   of an embedded disc D. Construct `d∈K_c(T*D)` by relative clutching and
   prove `[σ′]−[σ]=ext_D(d)`. Retain the outside identification/homotopy
   as part of the data; prove dependence only on its restriction to the
   disc with a boundary collar, and compatibility with orientation-preserving
   coordinate identifications. Excision gives the corresponding difference
   of analytic indices as the ambient-independent local index of d.
   Realize the difference by the direct sum of the σ′ triple and the
   inverse triple `(F,E,σ⁻¹)`; prove the latter homotopic to `(F,E,σ*)`
   by the positive polar factor. On the cosphere over the outside use the
   specified homotopy, polar-unitarize the invertible symbol, and apply the block rotation
   `[[cos(t)σ,−sin(t)Id],[sin(t)Id,cos(t)σ*]]`, 0≤t≤π/2,
   to trivialize the symbol plus its inverse. A base cutoff splices this
   nullhomotopy across a collar inside the base support neighbourhood;
   no polar unitarization at a zero covector is required. Prove the resulting supported triple
   represents d and retains the original difference class.

   Own the operator cut-and-paste index theorem for compact pieces with
   identified boundary and compatible collars, consuming GT Layer1's
   smooth full-boundary gluing construction. Write
   `M₁=A∪B`, `M₂=C∪D`, `M₃=A∪D`, `M₄=C∪B`, with fixed collar gluing
   maps. Fix common model bundles E_N,F_N on a collar N≃Y×(−1,1),
   and identifications with the bundles on each piece; glue every M_i
   using exactly these identifications. Require all restriction/gluing
   squares to commute, so all four collar comparisons have one common
   fibre and satisfy the cocycle condition. Choose compatible metrics
   and densities there. For elliptic differential operators P_i of the
   same positive order m, require one common transported principal part
   on EACH shared piece, including the collar; differences on that piece
   have order at most m−1 with smooth coefficients. Construct Sobolev isomorphisms W_E,W_F between
   the two direct-sum realizations by the collar rotation
   `u₃=φu₁+ψu₂`, `u₄=φu₂−ψu₁`, with
   φ=cos(πχ/2), ψ=sin(πχ/2) for a smooth cutoff χ equal to0 near
   the A/C end and1 near the B/D end. Use the piecewise identity/swap with the
   indicated minus sign outside the collar, and prove gluing and inverse
   compatibility on every H^s. Prove
   `W_F(P₁⊕P₂)W_E⁻¹−(P₃⊕P₄)` has order at most m−1, from the collar
   commutators and any lower-order discrepancies. K5a Rellich makes it
   compact H^m→L², so I1's equivalence/compact-perturbation laws give
   `ind P₁+ind P₂=ind P₃+ind P₄`. This compares operators on the four
   manifolds without decomposing their K-classes into open-support classes.

6. Build the **norm closure** of the order0 classical endomorphism algebra
   Ψ⁰(M;E) in B(L²(E)), using PDO's actual operator realization and adjoint.
   Its smoothing ideal has closure K(L²(E)): smooth-section rank-one kernels
   are smoothing, smooth L² density approximates arbitrary finite-rank maps,
   and OI approximability identifies their closure. Construct the continuous
   principal-symbol map and prove the exact C*-sequence
   `0→K(L²(E))→closure Ψ⁰→C(S*M;End(π*E))→0`.
   The final algebra is the continuous-section C*-algebra of the finite
   Hermitian endomorphism bundle supplied by HilbertModules H5, with the
   pointwise adjoint/composition and supremum operator norm; compare its
   carrier with TKT/SBC's actual Hom bundle rather than a fixed-fibre C(X,A).
   Prove the essential-norm identity
   `‖π_Calkin(P)‖=sup_(S*M)‖σ₀(P)‖`. For the lower bound use normalized
   compact-chart high-frequency wave packets converging weakly to0 and PDO's
   principal-symbol asymptotic on them. For the upper bound take C strictly
   above the supremum, construct the smooth matrix square root of
   C²Id−σ₀(P)*σ₀(P) by a power series converging in every C^k seminorm:
   the uniform strict spectral gap gives geometric coefficient decay after
   each finite derivative. Extend it degree0 off zero and insert a smooth
   cutoff at zero to obtain a classical order0 symbol; quantize it,
   and use composition/adjoint modulo compact operators and positivity in
   the Calkin algebra. Then pass C to the supremum. Smooth symbol density
   on the compact cosphere and the quotient isometry prove surjectivity;
   the zero-symbol kernel is exactly the compact ideal. Give norm/topology,
   restriction of bundle isomorphisms, finite blocks, adjoints, quotient
   functional calculus and equivariant transport APIs. Dimension0 has empty
   cosphere and finite L², so both quotient and symbol algebra are zero.
   For continuous off-zero homogeneous symbols define their realizations
   through this completion, prove Fredholmness iff the quotient symbol is
   invertible and independence modulo compacts. For the reverse implication
   consume CStarAlgebras C1's spectral permanence for the unital closed
   quotient-symbol subalgebra inside the Calkin algebra: a Calkin-invertible
   image is invertible in that subalgebra. Smooth invariant approximants
   uniformly preserve invertibility and give the same index. This connector
   supplements PDO's classical calculus; no second classical calculus is built.

## I3. Cotangent pushforwards and the topological index

1. For a smooth closed embedding f:M→N construct the normal exact sequence
   of Tf:TM→TN, identified over TM with two copies of π*ν_f after choosing
   metric connections and splitting the tangent sequence. Prove this through
   chart derivatives and the horizontal/vertical tangent identifications,
   including the connection-dependent off-diagonal terms. The horizontal
   base-normal copy is x and the vertical cotangent-normal copy is v; this
   order fixes z=v−ix rather than its conjugate. Transport to T*M
   and T*N by musical maps. The normal complex structure is z=v−ix on
   π*ν_f⊕π*ν_f, naturally identified with π*(ν_f⊗ℂ). Prove all choices
   are joined by compatible splittings/metrics and induce the same compact-
   support K-map. The tubular neighbourhood may be shrunk over the noncompact
   cotangent base; prove extension preserves the compact support of each class.
2. Define `f_!^T:K_c(T*M)→K_c(T*N)` by **consuming** TKT T5.5's
   complex-normal pushforward for the bundle E=π*(ν_f⊗ℂ) of item1 and
   converting its dual convention through the unit
   `(−1)^r[det E]`, r=dim N−dim M. Thus the Thom multiplier is w_E.
   Derive identity, composition, isotopy/stabilization, open-extension,
   products and module laws from TKT T5.4–5, proving that the unit conversion
   commutes with each diagram. For composition use the normal-sequence sum
   comparison of item1 and determinant multiplicativity; the remaining
   support/tubular theorem is the existing supplier's target. No orientation
   on ν_f is needed. Export the cotangent-specific dictionary and geometric
   choice independence, without another general K-pushforward construction.
3. For an embedding j:M→V=ℝ^N define
   `ind_t(a)=Bott_V⁻¹(j_!^T a)`, where Bott_V sends1 to w_(V_ℂ) on T*V.
   Prove additivity and independence of embedding/dimension: for two embeddings
   use `(cos t·j₀,sin t·j₁)` in V₀⊕V₁ for t∈[0,π/2], which is an
   embedding throughout, and endpoint stabilization by a trivial normal
   space. Derive independence of metrics, connections, tubular neighbourhoods
   and musical maps, and the corresponding topological open-excision and diffeomorphism laws.
   Product comparison with the analytic index is I4–I5. Verify value1 on
   the point's wedge-Koszul pushforward in every real ambient dimension,
   and value+1 on β and−1 on the dual class in complex rank1.
4. For a compact Lie G acting on closed M construct a finite-dimensional
   real orthogonal G-representation V and a smooth G-equivariant embedding
   M→V. Starting with a smooth finite coordinate embedding, approximate its
   translates by finite Peter–Weyl sums in C¹ norm, uniformly on compact M;
   prove derivative convergence using differentiation under Haar integration
   and smooth coefficient estimates. Assemble the finite matrix coefficients
   into an equivariant vector-valued map and preserve injectivity/immersion by the compact C¹ stability comparison:
   extract its immersion/separation estimates from CC C2.5's compact-stage
   general-position construction, then prove stability for the finite
   Peter–Weyl approximants here. Apply TKT T6.1's compact-group Banach-
   representation density to the C¹-section norm after building the
   strongly continuous action and the differentiation bounds. Average the
   representation metric. Prove equivariant tubular/normal comparisons by
   averaging connections and invariant metrics, then define
   `ind_t^G:K_G,c(T*M)→R(G)` through equivariant wedge Thom/Bott on V⊗ℂ.
   Prove choice independence by the same direct-sum embedding homotopy,
   restriction to closed subgroups, R(G)-linearity and ordinary forgetful
   compatibility. Use T6's actual continuous finite-dimensional representation
   category and its SplitK0 ring, including disconnected G.
5. Prove uniqueness for additive integer-valued assignments on
   K_c(T*M) for **closed** smooth M, respecting cotangent closed-embedding
   pushforward and taking1 at the point. Embed M in V and then its
   representation sphere V∪∞; the point pushforward is a Bott isomorphism
   on the open V chart, so its image determines the assignment after the
   embedding comparison. For a compact Lie G prove the same theorem for
   R(G)-linear additive assignments on K_(G,c)(T*M) for closed G-manifolds,
   respecting equivariant closed embeddings and giving1 at the point.
   Use item4's equivariant embedding M→V and the smooth representation
   sphere S(V⊕ℝ). Compare the embeddings M→S(V⊕ℝ) and point→S(V⊕ℝ)
   through the open V chart and the equivariant Bott isomorphism. This proves
   both uniqueness statements on these exact domains. I2's compact-supported
   open-extension comparison supplies their local-index version.

## I4. Equivariant analytic indices and associated fibres

1. Let T intertwine strongly continuous unitary compact-Lie actions on complex
   Hilbert spaces and be Fredholm. Define `ind_G(T)` as PDO P7's virtual
   kernel/cokernel class in T6.2's continuous-representation SplitK0 ring,
   consuming its restriction/quotient continuity theorem.
   Prove additivity, adjoint sign, pullback along continuous homomorphisms of compact Lie
   groups (including noninjective ones), subgroup restriction/forgetful, tensoring a finite
   representation and conjugation by equivariant Hilbert isomorphisms.
   Consume PDO P7's generic equivariant Fredholm local-constancy and homotopy
   theorem for this same class. This does not require the
   individual kernel dimension to be locally constant.
2. First prove the equivariant representability/smoothing version of I2.2,
   including an equivariant radial disc contraction: construct its bundle
   transport from the invariant Hermitian projected connection after smoothing,
   so both disc bundles come from their zero-section restrictions. Retain the
   transported boundary isomorphism through this step.
   Embed each continuous finite-rank G-bundle over compact M in a finite
   unitary G-representation using TKT T6.1. Smooth its equivariant selfadjoint
   projection matrix by chart approximation followed by Haar averaging and
   spectral projection across the uniform gap at1/2. Prove the resulting
   nearby projections have equivariantly isomorphic image bundles and are
   joined by an equivariant homotopy. For boundary isomorphisms, smooth and
   average in the Hom bundle, use uniform invertibility on the compact
   cosphere, and preserve specified collar data by invariant cutoffs.
   Give relative and compact-parameter versions using the same uniform gap;
   parameters are continuous and smoothing is only in the manifold variables.
   This realizes every K_(G,c)(T*M) class by a smooth invariant homogeneous
   elliptic symbol, including the O(n)-sphere point classes used in I5.
   Choose invariant metrics/connections and quantize, then Haar-average the
   operator. Consume PDO P5's seminorm/Bochner topology comparison to prove
   it remains classical with the same principal symbol and depends continuously
   on compact parameters. Obtain `ind_a^G:K_(G,c)(T*M)→R(G)` with
   equivariant homotopy/direct-sum/adjoint/diffeomorphism laws and R(G)-linearity.
   Prove equivariant analytic excision explicitly: for an invariant open U
   with compactly supported symbol and equivariant closed ambients, use
   invariant neighbourhoods, cutoffs and collars in I2.5's construction.
   Haar averaging preserves the exact identified identity operator outside
   the invariant support neighbourhood. Prove the kernel/cokernel extension
   maps are equivariant isomorphisms, so ambient independence and open-
   extension composition hold in R(G), not only after taking dimensions.
   Consume TKT T6.1 and P7's unitary strongly continuous L² and graph-H¹
   actions. For other real Sobolev orders and invariant connection data, use
   P7's spectral norms and commutation of powers with G to obtain unitary
   actions; compare them to K5a's chart norms. Prove strong continuity
   first on smooth sections, then by density and uniform bounds. Averaging
   symbol coefficients and norm continuity of operator parameter families are
   distinct comparisons; the G action itself need only be strongly continuous.
3. Consume PDO P7's corrected graded external-product symbol/operator comparison,
   completed Hilbert tensor and jointly commuting square-operator expansions.
   Prove the equivariant version by transporting every construction through
   product actions, obtaining
   `ind_(G×H)(a⊠b)=ind_G(a)⊠ind_H(b)`.
   Keep row/column order and grading explicit: odd blocks anticommute after
   inserting Γ in the second factor, so their square is the positive tensor
   sum and its kernel is the graded tensor of the factor kernels. Naively
   lifting separate ψDO symbols near ξ=0 or η=0 need not define a joint
   symbol; the PDO cutoffs/homotopy comparison are part of the dependency.
   Prove compatibility of this product index with compact-supported open
   extensions, including different compact ambients of the common product
   chart, by TKT's product/support diagram and item2's equivariant excision.
4. Prove the **fixed associated-fibre** product theorem. Let P→M be a smooth
   principal H-bundle with commuting G-action, F a closed (G×H)-manifold
   and Q a fixed (G×H)-equivariant graded elliptic operator on F. Thus
   b=[σ_Q] lies in K_(G×H,c)(T*F), identified with TKT T6.8's TF
   through the invariant fibre metric. G acts diagonally on Z=P×_H F and on
   all associated bundles. Choose invariant base/fibre metrics and an
   invariant H-connection, with the horizontal/vertical product metric on Z;
   its density is the product density in unitary principal trivializations.
   The index comparison is independent of this chosen metric by I2/I4.
   For a base symbol a, the result is
   `ind_a^G(a·[P×_H ker Q⁺])−ind_a^G(a·[P×_H ker Q⁻])`,
   where Q⁺/Q⁻ denote the even/odd kernel spaces of its selfadjoint odd
   block. The associated kernel bundles carry both the principal H descent
   and the residual G action. Construct this proof through the following
   explicitly owned operator realization and comparison.

   Normalize Q and a chosen base odd block to order1 by PDO P7's positive
   powers; retain kernel, equivariance and principal-class comparison. For
   Q²'s discrete eigenvalues λ let E_λ be the finite-dimensional graded
   eigenspace, with its commuting G×H representation and Q action. Define
   the dense vertical core on Z to be the algebraic direct sum of smooth
   base sections of the finite bundles P×_H E_λ, with the base coefficient
   bundles included. Prove its L² completion is L² of the external associated
   coefficient bundle on Z by local Fubini and the vertical eigen-expansion.
   Construct A_λ by lifting the same localized base odd operators in
   principal trivializations, conjugating by the finite H-representation
   transitions, patching with a square partition and averaging over G.
   On finite tensor sections the flat lift acts as P_base⊗Id. Principal
   trivializations are L²-unitary for the chosen density/metrics, so these
   odd patched operators are formally selfadjoint. Prove restriction of the
   completed horizontal operator A to each finite-spectral smooth block
   equals A_λ exactly; averaging commutes with this restriction since G
   commutes with Q² and its spectral projections. Multiplication, transitions and each flat local lift intertwine Q;
   prove exact commutation on every λ block. These are ordinary base
   ψDOs twisted by P×_H E_λ, with their full lower-order terms retained.
   Compare the choice with a connection-based quantization through its
   principal-symbol homotopy; a tensor of global kernels is not the construction.
   Bound infinitesimal H-actions by
   `‖dρ(X)v‖_(H^s)≤C_X‖v‖_(H^(s+1))` from their vertical differential
   expression and PDO P5. Translate this into polynomial eigenvalue bounds
   through P7 and prove the corresponding mixed chart/connection/symbol
   estimates uniform in λ. These estimates are targets here and control the
   unbounded vertical generators in the horizontal connection.

   Define D_λ=A_λ+Γ_base Q|E_λ on its base H¹ domain. Prove it is selfadjoint,
   odd and `D_λ²=A_λ²+λ`, with the equality first on the smooth core and
   then as closed operators/forms. Define D as their Hilbert direct sum with
   **specified domain**
   `{(u_λ):u_λ∈Dom D_λ, Σ‖u_λ‖²<∞ and Σ‖D_λu_λ‖²<∞}`.
   Construct its closed graph, adjoint/resolvent by the block resolvents and
   prove the finite-spectral smooth core is a core. Compactness of each base
   resolvent and the bound (1+λ)^(-1/2) on the tail give compact resolvent
   for D; finite vertical spectra and zero complements are treated directly.
   Its bounded transform B=D(1+D²)^(-1/2) is a bounded Fredholm odd map.
   For λ>0 the positive square gives no kernel; λ=0 compresses exactly to
   the base operators twisted by the finite ker Q bundles. This proves its
   representation-valued kernel/index formula on actual domain objects.

   Define the operator class used for the comparison: Op¹(E,F) is the
   space of bounded maps H¹(E)→L²(F) whose distributional formal adjoint
   is also bounded H¹(F)→L²(E), with the sum of those operator norms.
   Construct zero/addition, scalar action (cP,conjugate(c)P†), the
   conjugate-linear adjoint involution, extensionality from dense smooth
   sections, norm bounds and completeness as the closed formal-adjoint
   relation in the product of the two bounded-map Banach spaces. Give
   transport through Sobolev isomorphisms and restriction/localization APIs.
   The smooth approximants have their specified action on sections. Define the
   completed first-order class as the closure there of PDO's classical
   order1 maps, with their continuous homogeneous principal symbols on the
   cosphere. Prove symbol continuity by localized high-frequency tests.
   Construct the local positive-order lift into this closure: on product
   charts regularize the joint symbol by a smooth homogeneous cutoff in
   |ξ|≤ε|η| and a low-frequency cutoff with radius R. Its error has
   compact-chart x/y derivative bounds
   `‖∂_(x,y)^α error(ξ,η)‖≤C_α(ε+R⁻¹)〈(ξ,η)〉`.
   Choose R≥ε⁻¹ before passing ε to0, yielding a uniform O(ε) bound
   for the finite derivative orders needed by weighted Fourier-Schur estimates. Prove those estimates
   in H¹→L² from PDO P5's Fourier-Schur method; no frequency-derivative
   bound uniform in ε is assumed. Apply the same argument to the formal
   adjoint. This gives convergence in Op¹, not merely pointwise symbols.
   Transport through smooth principal charts using K5a's coordinate bounds,
   patch and average; prove continuity of the G-conjugation action on this
   closure from classical density and uniform Sobolev action bounds.

   Show the resulting completed horizontal odd map A has continuous joint
   symbol α₁(ξ,η), acts only in the base coefficient grading and reduces
   to a₁(ξ) when the vertical covector η is zero. Construct the vertical
   lift likewise. Thus D=A+Γ_base Q is in the completed first-order class.
   The joint symbol is elliptic: for η≠0 the positive vertical square is
   invertible, and for η=0 the base symbol is invertible. After a chosen
   invariant splitting, homotope α₁ to the pure horizontal a₁(ξ_h) while
   retaining its selfadjoint odd base action; the same square argument
   preserves ellipticity throughout. This identifies the class with TKT
   T6.8's associated product, including different chart/splitting choices.

   Let Λ=(1+∇*∇)^(1/2) on the total coefficient bundle, using PDO P7.
   Multiplying the Op¹ approximants by Λ⁻¹ gives operator-norm convergence
   in L² into I2.6's closure Ψ⁰; its quotient symbol is D₁(ζ)/|ζ|.
   I2.6 and Atkinson therefore give Fredholmness on the actual H¹ domain
   and index equality with any sufficiently close smooth elliptic symbol.
   Prove that H¹ domain equals the spectral direct-sum graph domain above:
   on principal charts its norm is equivalent to the L² norm plus vertical
   Q norm and horizontal first-derivative norms; fixed-fibre ellipticity
   and K5a/PDO localization give these comparisons. Finite Q² truncations
   commute with the horizontal connection derivatives and converge in this
   norm. For the patched A, use the Fredholm bound and its smooth finite
   λ=0 kernel to obtain the converse graph estimate
   `‖u‖_(H¹)≤C(‖Du‖_(L²)+‖u‖_(L²))` on the common core.
   Complete the core in both norms to identify domains, formal adjoints
   and defect spaces. This also compares the bounded transform B's index
   with the H¹→L² realization, without presuming its ψDO membership.
   Export choice, G-equivariance, twisting, base change and support laws,
   and compare the trivial-principal case with PDO P7's product realization.
   This is a fixed-fibre construction; arbitrary varying fibre operators
   remain outside its hypotheses.

## I5. Equivariant Bott index and the embedding theorem

1. On S(V)=V∪∞ with O(V) acting by the linear action compute the de Rham
   representation-valued index as `1+(−1)^n det(V)` for n>0, by Hodge and
   the actual action on top cohomology. The top representation is determinant
   in every positive n. Consume T7.5's two-disc reflection/Koszul homotopy
   to get `ρ_S=q₀+κ*q∞`, κ(x,ξ)=(x,−ξ), with compact support and
   the fixed z=v−ix convention. Compare q₀,q∞ with the wedge cotangent
   point-pushforwards, retaining TKT's dual/wedge conversion. Prove
   `κ*w_(V_ℂ)=(−1)^n det(V_ℂ)·w_(V_ℂ)` in R(O(V))-linear Thom coordinates, through
   conjugation of the real exterior complex and its determinant twist.
   Carry the inversion-coordinate transformation at infinity and its symbol
   orientation through the local excision comparison.
2. Construct the circle Fourier projection P_≥0 on the normalized L² basis
   e^(ikx), show its principal branches are1 for ξ>0 and0 for ξ<0, and
   realize it as a classical order0 ψDO by comparing a smooth frequency
   multiplier with the exact projection (their low-frequency difference is
   finite rank). For `A=e^(ix)P_≥0+(1−P_≥0)`, prove ker A=0 and coker A
   is the missing constant mode, so ordinary index−1. Use a smooth compact-
   support symbol representative and explicit clutching homotopy to show
   its ordinary local class is −w_(ℝ⊗ℂ). Reflection swaps positive/negative
   modes; A is not asserted to be an O(1)-intertwiner of the same trivial
   action. This ordinary calculation and equivariant sphere identity together
   determine the genuine O(1) Bott index: if b=a+c·sgn, then
   `(1−sgn)b=1−sgn` and dim b=1 force a=1,c=0.
3. For SO(2) on S², the sphere equation is2b=2 in R(SO(2)); its torsion-free
   abelian group implies b=1. Use I4 products to compute Bott index1 on
   each block product O(1)^a×SO(2)^b, acting on ℝ^(a+2b). Prove that
   restriction to all such block subgroups detects R(O(n)): every orthogonal
   matrix is conjugate to a block of ±1 real lines and planar rotations,
   by an owned real orthogonal block theorem: complexify the orthogonal
   operator, use its finite spectral decomposition from the bounded normal
   calculus, pair conjugate nonreal eigenspaces and take normalized real/
   imaginary parts to obtain orthonormal rotation planes; its ±1 eigenspaces
   give real lines. Prove that construction and its conjugacy matrix. Equal
   restrictions give
   equal characters at every element, then Peter–Weyl character orthogonality
   gives equal virtual representations. Restriction only to SO(n)'s connected
   maximal torus would not detect the determinant representation.
   Deduce the O(n)-equivariant point Bott class has index1, including n=0
   by the point computation. Restrict to any orthogonal H-representation V
   to obtain the same identity in R(H).
4. For f:M→N use a compact normal disc neighbourhood, compactify its fibres
   to S(ν⊕1)=P_O(ν)×_O(n) Sⁿ, and compare its cotangent symbol with the
   associated product of the base symbol and w_(ℝⁿ⊗ℂ). Consume TKT T6.9's
   associated Koszul/folding naturality and carry the wedge conversion with
   `det(ν_ℂ)=P_O(ν)×_O(n)det(ℂⁿ)`. Prove the vertical tangent
   splitting and complex normal identification match I3, and use the fixed
   associated-fibre theorem and Bott index1. Open excision gives
   `ind_a(f_!^T a)=ind_a(a)`. For equivariant embeddings the G-action
   commutes with the frame O(n)-action, so the same proof yields equality
   in R(G). Prove all support extensions through the sphere compactification,
   not just equality of restrictions at the zero section.
5. Apply I3 uniqueness to prove `ind_a=ind_t` and its compact-Lie equivariant
   version `ind_a^G=ind_t^G`. Export the theorem for operators, complexes,
   relative symbol classes and twisting. Compare ordinary and equivariant
   point normalizations, formal adjoints, products and restriction through a
   single commutative diagram. Neither Bott periodicity nor the prerequisite
   Thom theorem is proved by using this equality.

## I6. Cohomological formula and universal symbol calculations

1. On the canonically oriented cotangent total space prove
   `ind(P)=(−1)^n ∫_(T*M) ch_c([σ_P])·π*Td(TM⊗ℂ)`.
   The pairing evaluates degree2n compact-support cohomology; lower degrees
   contribute zero. Apply CC C6's wedge-Koszul Thom–character formula to I3's
   embedding map, identify normal complexification and use
   `TM⊗ℂ⊕ν⊗ℂ≃trivial` to cancel the Todd normal correction. The normal rank N−n gives factor
   (−1)^(N−n); its determinant is the complexification of a real sign line,
   so its rational Chern character is1. Euclidean wedge Thom evaluation is
   (−1)^N, fixing the surviving factor (−1)^n. Compare the canonical
   orientation to base-first orientation with (−1)^(n(n−1)/2), giving the
   complete base-first index prefactor (−1)^(n(n+1)/2), and
   to compact-support de Rham integration via CC C2. Define this top-degree
   evaluation through the inverse compact-support Thom map for T*M→M,
   followed by evaluation on the **compact** base's ordinary fundamental
   class with orientation local coefficients. Multiply by
   (−1)^(n(n−1)/2) to convert its base-first bundle orientation to the
   canonical complex orientation. This supplies the displayed integral
   without a locally finite homology carrier. Keep the density/Thom/de Rham
   comparisons explicit. No formula divides by e(TM) on the given manifold.
2. For a compact G-structure, representation V of real dimension n and a
   G-equivariant homogeneous elliptic model symbol between specified finite
   representation fibres W₀,W₁, associate its bundle/symbol data to the
   **universal vector bundle** EG×_G V, not BG×_G V. Its support is the
   zero section and is fibrewise, not compact over the infinite BG.
   On each compact finite-dimensional smooth classifying approximation B_m,
   form the actual relative disc/sphere symbol class; prove compatibility
   under inclusions and degreewise cohomological stabilization. These compatible
   finite-level classes define the universal Thom-cohomology calculation;
   no unbuilt K_c(BG) carrier is presumed. Pull back to each compact
   manifold's classifying approximation and prove equality with its actual
   symbol, retaining all association intertwiners. Use CC's stable range
   and Thom-character diagram to descend the resulting universal identities.
3. For any compact Lie G and even-dimensional oriented real representation V
   with a fixed G-invariant orientation (the action factors through SO(V))
   for which e(V) is a non-zero-divisor in H*(BG;ℚ), compute the universal
   fibre integral by restriction to the zero section and cancellation there.
   Prove any auxiliary flag/torus restriction used is injective and retains
   the fixed invariant orientation. Then pull back the polynomial
   identity; Euler may vanish or be a zero divisor on M. For odd rank its
   rational Euler class is0, so this cancellation is unavailable. Treat
   the specific differential-symbol vanishing theorem separately in I7.
   Verify the displayed non-zero-divisor hypothesis for SO(2ℓ), U(n),
   Spin(2ℓ)×U(k) and SO(2ℓ)×U(k) through CC's torus injection and
   their explicit nonzero Euler-root products, using SpinGeometry's weight
   dictionary for the spin covering. This supplies the actual application
   hypotheses, not an unverified assumption about their classifying rings.
4. Export rational integrality conclusions: the characteristic pairing equals
   an integer index for each specified elliptic symbol, with its twisting and
   orientation conventions. Universal completed classes are evaluated degreewise
   on finite-dimensional bases; λ_(−1) is used on actual finite-rank bundles,
   not by substituting−1 into an arbitrary virtual infinite λ-series.

## I7. Euler, signature, Dolbeault and spin applications

1. For the parity grading of complex exterior forms identify the de Rham
   symbol and analytic index with χ(M) by K5's Hodge/singular comparison.
   Compute its universal exterior-root character and I6 pairing to obtain
   Gauss–Bonnet `χ(M)=⟨e(TM),[M]⟩` on oriented even-dimensional M; compare
   CC's zero-locus/diagonal proof and de Rham Pfaffian normalization. Give the
   nonorientable local-orientation/density statement via the orientation
   double cover. Prove its Euler number and Euler characteristic are both
   twice those on the base: Thom/local-system pullback and fundamental-class
   transfer give the number comparison; a finite smooth good cover and
   Mayer–Vietoris Euler additivity give the characteristic comparison, since
   every lifted contractible intersection is two copies. Descend the oriented
   formula and compare the twisted Pfaffian density. Give odd-dimensional χ=0.
   Verify the exterior derivative/codifferential symbols, star square and
   `d*=(−1)^(m(k+1)+1)*d*` on k-forms in real dimension m, with the right
   star interpreted on its actual output degree.
2. For Γ on forms from SpinGeometry G2 use its exact complex-linear star
   identity `Γ|Λ^p=i^(p(p−1)+ℓ)*` in real dimension2ℓ. The chiral
   operator d+d* has index equal to the signature of the middle cup pairing
   in dimension4k; prove complementary-degree harmonic cancellation and the
   ± eigenspace comparison with the real intersection form. In dimension4k+2
   the middle pairing is alternating and the chiral index is0. Compute the
   universal oriented-plane roots and obtain the Hirzebruch theorem
   `sign(M)=⟨L(TM),[M]⟩`. The expression ∏x coth(x/2) agrees with ∏x/tanh x
   only in the required top degree by root-degree scaling, not as a full
   characteristic series. In dimension4 verify sign(M)=⟨p₁(TM)/3,[M]⟩.
3. For a holomorphic Hermitian E on a compact complex n-fold use the
   Dolbeault symbol ξ^(0,1) wedge and its adjoint folding, K2's exact symbol
   complex and K5's sheaf/harmonic comparison. Compute its universal Chern
   roots with the real-to-complex cotangent dictionary and establish
   `Σ_q(−1)^q dim_ℂ H^q(M;E)=⟨ch(E)Td(T^(1,0)M),[M]⟩`.
   No Kähler condition is required. Prove independence of the Hermitian metric
   and compatibility with duality, direct sums and tensor twisting.
4. On a connected compact Riemann surface consume CKG K7's genus/Betti/Dolbeault dictionary g=b₁/2=dim H^(0,1),
   with its integral intersection-form comparison. Define degree of a line by ⟨c₁(L),[M]⟩, so Td curve gives
   `ind ∂̄_L=deg L+1−g`. Build the divisor/analytic-degree bridge: local
   zero/pole order, meromorphic line sections, transition winding and the integral Chern class using
   CC C1.5/C4's comparison with SBC B6. The ordinary character associated
   line L=P×_(e^(iθ))ℂ satisfies c₁(L)=−c₁_B6(P), since B6's principal
   convention represents the dual-character line; prove and use this sign
   in the winding, curvature and divisor maps. Prove divisor
   degree agrees with this integral. Construct the holomorphic divisor line
   O(D) with frames e_inside=z^(-m)e_outside (so the canonical section
   has coefficient z^m inside), its tensor/addition and canonical
   meromorphic section, then use I7.3's HRR curve specialization on L(kp) for large
   k to obtain a nonzero section and thus a meromorphic section of any L.
   This provides the existence step without assuming it in the divisor bridge.
   Prove deg K_M=2g−2 through c₁(T^(1,0)M)
   and Euler=2−2g. Use K5 Serre duality to derive
   `h⁰(L)−h⁰(K_M⊗L⁻¹)=deg L+1−g` and its vector-bundle version.
   Consume CC C1.5's normalization of tautological c₁ to degree−1 on
   complex-oriented ℂP¹, including its comparison with CKG's finite
   projective carrier. Construct the smooth bundle isomorphism identifying
   K7.2's holomorphic O(−1) with that tautological line under the carrier
   comparison, using the local spanning vectors `(z,1)` and `(1,w)`.
   Consume K7.2's projective-chart construction of `K_(ℂP¹)≃O(−2)` and
   H⁰(O(−1))=H¹(O(−1))=0; O(−1) on CP¹ has index0 and degree−1.
   The equal-dimension conclusion already follows from Serre duality and
   `K⊗O(−1)*≃O(−1)`, without assuming either vanishing in that argument.
   For the trivial line also construct the course's explicit comparison
   with the real parity-graded de Rham operator. Use the complex orientation,
   its Riemannian volume form vol and `*dx=dy`, `*dy=−dx` in every oriented
   conformal coordinate, including a metric λ²(dx²+dy²). Equip real even forms with the complex structure
   `I(f,b vol)=(b,−f vol)` and real one-forms with I=*. Define
   `A(f+ig)=(f,−g vol)` and `B(η)=2 Re η` for η∈Ω^(0,1).
   Prove these are bounded complex-linear isomorphisms on the relevant
   Sobolev spaces and `(d+d*)A=B∂̄`, using the usual ∂̄ convention
   `∂̄u=(∂_x u+i∂_y u)(dx−i dy)/2` in a holomorphic coordinate.
   Check the metric factors in conformal coordinates. Thus the operator
   with these complex structures has complex index1−g, while its underlying
   real operator has index2−2g; prove this factor by the kernel/cokernel
   complex structures and Hodge theory, rather than identifying the two indices.
   Compare it with complexification of the real de Rham operator: that
   complexification has complex index2−2g and splits into the Dolbeault
   operator and its conjugate. It is different from the complex operator
   defined by I on the original real bundles.
   Give a second proof of the degree formula by I2.5's local difference
   class. For every Σ, holomorphic line L and point p, compare L with L(p)
   in a holomorphic coordinate and frame by the transition
   `e_inside=z⁻¹e_outside`. Prove the resulting local
   difference class is universal, independent of Σ,L,p and the chosen
   holomorphic disc coordinates, so `ind ∂̄_(L(p))−ind ∂̄_L=δ` for one
   integer δ. Retain the relative boundary identification and winding sign;
   no surjection from the two K-groups of an open cover is assumed.
   Before using this step, prove `deg O(p)=+1` directly by its transition
   winding and the sign `c₁=−c₁_B6`, and
   `deg L(p)=deg L+1` by CC C1.5's tensor Chern-class law. Neither
   calculation uses meromorphic-section existence or Riemann–Roch.
   Consume GT Layer1's closed-surface CW model and K7's integral
   fundamental-class pairing `H²(Σ;ℤ)≃ℤ`. By CC C1.6's classification
   and C1.4's smoothing of isomorphisms, equal-degree holomorphic lines
   are smoothly isomorphic;
   prove their transported ∂̄ operators differ by order0 and hence have
   equal indices. The trivial-line Hodge calculation gives1−g for every
   genus, and the degree−1 sphere case forces δ=1. Deduce the formula
   for all positive and negative degrees, independently of the HRR proof.
   Also supply the homework's model-and-excision proof for the trivial
   line: compute index1 on ℂP¹ by projective-chart/Laurent cohomology and
   index0 on a flat complex torus by Fourier series, with constants as
   kernel and cokernel. For connected sums prove the precise cut-and-paste
   identity `i(Σ_g#Σ_h)+i(ℂP¹)=i(Σ_g)+i(Σ_h)`, where i is the trivial-line
   Dolbeault index. Identify the two removed discs and boundary collars,
   the holomorphic annular transition z=1/w and both symbol-bundle
   identifications satisfying I2.5's common-collar cocycle condition.
   Consume GT Layer1's smooth gluing and construct the holomorphic atlas
   from the two punctured-surface atlases and that annular transition;
   take the GT boundary collars from these coordinate annuli, with radial
   parameter log|z| and the corresponding log|w|, reversed by z=1/w.
   Prove that the resulting holomorphic charts induce precisely GT's glued
   smooth structure, as well as compatibility on every overlap.
   Identify the fourth regluing
   biholomorphically with K7.1's ℂP¹ by its two reciprocal charts.
   Apply I2.5's operator cut-and-paste theorem to
   the two original surfaces and their regluings, the connected sum and
   sphere. Prove b₁ additivity by Mayer–Vietoris and use GT Layer1's
   smooth surface classification to identify the genus and compare with
   any given surface of that genus by a smooth diffeomorphism f. If it
   reverses orientation, replace its transported complex structure J′ by
   −J′. For the trivial line prove that complex conjugation on functions
   and forms intertwines ∂̄_(−J′) with ∂̄_J′ by antilinear Sobolev
   isomorphisms; thus their complex kernel/cokernel dimensions and indices
   agree. Join the resulting orientation-compatible structure
   and the given complex structure through their contractible
   fibre, producing elliptic-symbol bundle families over Σ×[0,1];
   integrability of intermediate structures is not needed. Prove metric
   changes give the same continuous elliptic-symbol homotopies.
   The two model values and handle induction give1−g by this route as well.
   Compare both proofs with HRR and the established genus dictionary.
5. For a closed even-dimensional spin M, SpinGeometry's Γ labels have D⁺:
   S⁺→S⁻ and S⁻=(S⁺)* for a real oriented two-plane, with S⁺²=E* for the positively oriented
   complex two-plane E. Compute the half-spin root difference and dual-Koszul
   symbol Thom comparison in these labels, obtaining
   `ind D_W⁺=⟨Â(TM)ch(W),[M]⟩` for every Hermitian twist W.
   Keep chosen spin structures, intertwining maps, phase homotopy and graded
   direct-sum products in the proof. Compare the full self-adjoint Dirac index0
   with the potentially nonzero chiral index. Deduce the Â integrality and
   positive-scalar-curvature obstruction from G6 Lichnerowicz, including the
   twisted curvature version in its stated positivity range. In dimension0
   distinguish signed orientation/Γ from the canonical empty-frame choice.
   In dimension4 specialize to the **untwisted** operator and consume
   SpinGeometry G6.7's actual quaternionic kernels and index α. Prove
   `eight_mul_untwistedSpinFourIndex_eq_neg_signature` by the degree-four
   term Â₄=−p₁/24 and I7.2's σ=⟨p₁,[M]⟩/3, keeping the same orientation
   and Γ labels. Its statement is the integral equality
   `8 * ind_ℂ D⁺ = −σ(M)`. Combine it with G6.7's complex index=2α to
   obtain `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex`,
   the integral equality `σ(M)=−16α`, and export
   `rokhlin_signature_dvd_sixteen` for every closed oriented smooth spin
   four-manifold. Retain independence of metric, spin-isometry naturality
   and orientation reversal. TangentialBordism's single geometric KO-index
   comparison consumes these analytic identities and supplies the
   KO-genus/ABS orientation comparison; this theorem requires no bordism
   classification or FourManifolds example. Arbitrary Hermitian twists retain
   the general index formula above, with no parity conclusion from G6.7.
6. On any closed **odd-dimensional** M prove the index of an elliptic
   differential operator or common-order differential complex vanishes.
   Covector negation changes an order-m homogeneous polynomial symbol by
   (−1)^m, which is phase-homotopic to the original symbol. On the canonical
   cotangent orientation it has degree(−1)^n=−1, so I6 gives index=−index,
   hence0. Extend to complexified real operators. This conclusion does not
   cover arbitrary classical ψDO symbols: I5's circle operator has index−1.

## I8. Holomorphic fixed-map Lefschetz traces

1. For a compact boundaryless complex manifold M and a finite-rank holomorphic vector bundle E, construct the Dolbeault complex and its actual I7.3 Hodge comparison. For a holomorphic map f:M→M and holomorphic bundle map φ:f*E→E, construct the cochain map φ∘f* and the induced endomorphisms on H^q(M,E), with identity, composition, bundle-isomorphism and direct-sum laws. No global invertibility of f or L²-boundedness of its unsmoothed pullback is assumed.
2. Construct the analytic fixed-map trace proof. From the existing elliptic calculus construct positive-time smoothing kernels for the Dolbeault Laplacians, their trace-class estimates and the cohomological alternating-trace identity for φ∘f* composed with the heat operator. Prove independence of time by the actual cochain/homotopy and trace-class commutator argument; the bundle map need not commute with a chosen adjoint or metric. For a nonisometric f, prove smoothing before pullback gives the required bounded trace-class composite. Construct the local graph/diagonal asymptotic and show the contribution away from their intersection tends to zero.
3. Suppose every fixed point x is isolated and det_ℂ(1−df_x)≠0. Prove finiteness of the fixed set and
   Σ_q (−1)^q tr(H^q(φ∘f*)) = Σ_(f(x)=x) tr(φ_x)/det_ℂ(1−df_x).
   The fibre φ_x is an endomorphism only at a fixed point. Differential pullback on holomorphic covectors has the same eigenvalues as df_x (matrix transpose), not automatically the inverse eigenvalues of an independently defined group-action dual. Prove the coordinate/metric/trivialization independence and the rank-zero, point and no-fixed-point cases.
4. For a holomorphic group action with the section convention (g·s)(x)=g_E s(g^−1x), specialize with f=g^−1 and the actual fibre map φ=g_E. Prove the eigenvalue/character dictionary before using this formula in homogeneous examples. This generic fixed-map construction consumes elliptic/Dolbeault analysis, not algebraic Schubert splitting, standard monomial theory, vanishing or a flag-character formula. The flag and word-space character specializations are SchubertGeometry applications.

   As a convention check on the projective line, take f(z)=qz with q≠0,1
   and the O(1) lift whose fixed-fibre values at0 and∞ are1 andq. The
   multipliers of df are q and q⁻¹, so the local sum is
   `1/(1−q)+q/(1−q⁻¹)=1+q`, matching pullback on the two linear sections.
   The trivial line gives `1/(1−q)+1/(1−q⁻¹)=1`.
   The representative `Suggested.lean` records these local matrix
   and rank-one scalar interfaces; it does not replace the manifold,
   bundle, heat-kernel or cohomology construction above.

Reference: M. F. Atiyah and R. Bott, *A Lefschetz fixed point formula for
elliptic complexes. II. Applications*, Annals of Mathematics88(1968),
451–491, Theorem4.12, [DOI10.2307/1970721](https://doi.org/10.2307/1970721).

## Acceptance calculations and source exercises

- I1 must verify the finite-dimensional index formula, finite-rank identity
  perturbation, the minimal compatibility-constraint formulation and the
  infinite-dimensional Calkin norm, along with the nilpotent 2×2 range
  counterexample. Same-index paths must be constructed, not inferred from
  local constancy alone.
- I2 must work out curl, the Laplacian, scalar commutators and matrix-leading
  commutators through PDO's exact order rules, then de Rham/Dolbeault
  exact-off-zero symbol complexes. Consume PDO P6's nonlinear elliptic
  regularity example, K5a's strict Sobolev thresholds and compact embeddings,
  and PDO P5's determinant1 shear counterexample through their named APIs.
- For finite n≥1 verify sphere de Rham representation index
  `1+(−1)^n det`, the reflection homotopy, circle shift index−1 and
  O(1)/SO(2)/O(n) Bott index1. Check all compact support and smoothing
  corrections explicitly and the associated-fibre theorem on nontrivial
  kernel bundles as well as a trivial product.
- Verify topological index embedding stabilization and homotopy, point Thom
  evaluation, β↦+1 and dual class↦−1 and the universal dual/wedge Thom-character distinction.
  Include a symbol which is invertible outside a specified compact set and
  the tensor/exterior association compatibility on a nontrivial principal
  bundle.
- Compute Euler and signature indices on spheres and CP², Dolbeault χ(O)=1
  and χ(O(k)) on CPⁿ using K7's actual projective sections/Serre comparison,
  the genus/degree curve model, and twisted rank2 spin characters with G5's
  fixed square-root convention. Verify Td₁=c₁/2, L₁=p₁/3 and Â₁=−p₁/24.
- Check Hodge-star/codifferential signs in every degree, corrected signature
  exponent+ℓ, adapted Fock √2 scaling, graded tensor chirality and all
  chiral source/target blocks through SpinGeometry's exported identities.
  The scalar Clifford volume, Hodge Γ and the half-spin weight label are
  compared through those maps rather than renamed as identical data.

## Order and references

I1 consumes the general operator suppliers; I2 consumes PDO/TKT; I3 consumes
TKT and geometry. I4 follows I1–I2 and TKT6. I5 follows I3–I4 and the sphere
symbol comparison; I6 follows I5 and CC's Thom-character theorem. I7 follows
I6 and the stated Hodge/spin suppliers. The minimal projective-family theory
proving equivariant Thom is earlier TKT work, independent of this sequence.

- Thomas Mark's index-theory course notes and homework: functional analysis,
  symbols, embedding proof, equivariant sphere normalization and applications.
  The milestones include the finite-dimensional, support, symmetry and sign
  hypotheses needed by those examples.
- Atiyah–Singer, [*The index of elliptic operators I*](https://math.uchicago.edu/~shmuel/tom-readings/ASI.pdf), Ann.Math.87 (1968), §§3–4,6,8–9, for analytic/topological index, multiplicativity, embedding and normalization. The analytic support, domain and associated-bundle comparisons are specified in I2/I4.
- Atiyah, [*Bott periodicity and the index of elliptic operators*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/atiyah003.pdf), §§2,4, for the finite cokernel stabilization comparison consumed from TKT6.
- The [Fredholm API discussion](https://leanprover.zulipchat.com/#narrow/channel/144837-PR-reviews/topic/.2341189.3A.20define.20Fredholm.20operators.20between.20TVSs/near/609444718) and [Mathlib Fredholm work](https://github.com/leanprover-community/mathlib4/pull/39274) fix the native vocabulary. Adopt it for any required additions and refactor to Mathlib's API when supplied; build the specified mathematics in Tau Ceti without waiting for publication.
