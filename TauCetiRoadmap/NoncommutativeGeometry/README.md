# Roadmap: cyclic cohomology, spectral triples and noncommutative tori

**Summary.** Build the differential and cyclic theory of smooth operator algebras, its
Fredholm-module Chern characters and index pairings, and the spectral-triple
Hochschild-class theorem. Develop the logarithmic trace ideal and Dixmier
traces with their actual generalized-limit hypotheses. The smooth two-torus
is a complete example: its differential calculus, periodic cyclic cohomology,
Fourier spectral triple and Heisenberg-module index connect these constructions. Its end theorems are
matrix Morita invariance of cyclic cohomology in N1, the character index
theorem of N3, the Hochschild-class theorem of N5, the torus differential
calculus and periodic cyclic cohomology of N6 and the Heisenberg-module
index and trace/Chern values of N7.

## Scope and ownership

The independent N1.Tensor prefix concerns Hausdorff locally convex
vector spaces over 𝕜=ℝ or ℂ (`RCLike 𝕜`), with the same targets for both
fields; from N1.Cyclic on the scalars of every algebra, cochain and
spectral triple are complex. The two scalar-comparison maps between real
and complex tensors, the complexification isomorphism
`(E⊗̂_(π,ℝ) F)_ℂ ≃ E_ℂ⊗̂_(π,ℂ) F_ℂ` and the balancing quotient
`E_ℝ⊗̂_(π,ℝ) F_ℝ → (E⊗̂_(π,ℂ) F)_ℝ`, are stated by
SmoothBanachRepresentations §7.2a and are not planned here. Completed
projective tensors over complete nonarchimedean fields belong to
PadicLocalLanglandsForGL2Qp §0.1 for discretely valued fields and to
LocallyAnalyticDistributions §0.0 in general.
N1.Tensor is the generic locally convex tensor supplier of the library and
uses nothing from the cyclic theory; N1.Cyclic owns the universal forms,
the cyclic and mixed complexes, the SBI sequence and periodic cyclic
cohomology; ordinary derived categories belong to the existing
homological-algebra developments.

The selected character theory is finite summability and the Dixmier-trace
Hochschild class. Entire cyclic cohomology and fixed-temperature θ-summable
characters are outside scope, as are foliations, the full local index formula,
geometric elliptic-symbol calculus and Standard Model constructions.
[IndexTheory](../IndexTheory/README.md) owns closed-manifold elliptic index
and the Atiyah–Singer theorem; no such theorem is a prerequisite for the
abstract or torus index computations here.

C*-algebraic K-theory is not an input here. The K-groups K₀(A) and K₁(A)
of a C*-algebra, Bott periodicity, the comparison of the K-theory of a
dense inverse-closed Fréchet subalgebra with that of its completion, the
replacement of idempotents by projections and of invertibles by
unitaries in a C*-algebra, Kasparov cycles and products, and the
Pimsner–Voiculescu computation of `K_*(A_θ)` with its trace range
`ℤ+θℤ` belong to OperatorKTheory. N2 states its pairings on idempotents and invertibles of the
smooth algebra and on the pinned algebraic K-groups; N3 defines its
Hilbert-space Fredholm modules directly and takes the index of a
compression from Mathlib's Fredholm theory. N6 alone owns the rotation
C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ, built on Tau Ceti's full
crossed product and rotation action, with OperatorAlgebraDynamics D1's
universal property and D2's expectation: its universal presentation by
two unitaries with `uv=exp(2πiθ)vu`, the injectivity of its coordinate
copy of C(𝕋) and its faithful tracial state `τ=∫_𝕋∘E`, which
OperatorKTheory's Pimsner–Voiculescu computation consumes. N6 builds
no twisted group C*-algebra: the identification of A_θ with the twisted
group C*-algebra of ℤ² for the factor set
`c((m,n),(m′,n′))=exp(2πiθnm′)`, the phase
`TauCeti.SmoothNoncommutativeTorus.twist θ` of the pinned smooth torus,
sending `U₁^mU₂^n` to the canonical unitary `W_(m,n)`, is
OperatorKTheory 7.5's. N6 replaces
each idempotent matrix over the smooth torus 𝒜_θ by a similar projection
inside `M_n(𝒜_θ)` itself, by its spectral invariance, and N7 computes the
trace and the Chern pairing of the two K₀ classes it constructs.
Matrices over a C*-algebra, the continuous functional calculus and
representations are Mathlib's `CStarMatrix`, `cfc` and star
homomorphisms; the structure theory of C*-algebras (ideals, approximate
units, the Calkin algebra, multipliers) belongs to CStarAlgebras and is
not an input here.

N7 consumes HilbertModules H1–H3 for the generic Hilbert-module
constructions on its Heisenberg module: the completion of a pre-Hilbert
module over a dense *-subalgebra (H1), finite Parseval frames with their
Gram-matrix projection (H2), and the induced Hilbert space of a module
tensored with a representation, which at the GNS representation of a
state is the localization of the module at that state (H3). N7 owns the
Heisenberg module itself: its inner product with its positivity, its
smooth frames and Powers–Rieffel projection of trace θ, its connections
and the identification of its localization at τ with the scalar L²(ℝ)
model. The regular unbounded module operators of HilbertModules H6 and
their bounded transform are not an input here: N5's bounded transform of
a self-adjoint operator with compact resolvent is an instance of N5's own
Borel calculus. The canonical trace Tr on the trace-class operators of B(H),
with its basis independence, `Tr|T|=‖T‖₁`, its cyclicity against
bounded operators and the trace-class duality of B(H), is
VonNeumannAlgebras V4.Core's and is consumed in N3–N4. Tracial Lp
spaces over a semifinite trace belong to NoncommutativeIntegration, and
N3–N4 consume them at M=B(H) with its usual trace Tr: the Schatten
quasi-ideals S_p for 0<p<1 as Lp(B(H),Tr), with their p-triangle
inequality, ideal and adjoint bounds and complete p-metric (§1.3, §1.5);
Hölder's inequality with constant one for all positive exponents and the
log-submajorization of the singular values of a product (§1.4); the weak
Schatten classes and the weak trace class `S_(1,∞)` as weak Lp(B(H),Tr),
with their quasi-norm, adjoint and ideal bounds (§1.6); and the trace
cyclicity `Tr(ST)=Tr(TS)` for S∈S_p, T∈S_q with 1/p+1/q=1 (§2.1).
N3 adds the inclusions S_p⊆S_q for p≤q, which are particular to
B(H), and N4 the partial-sum norms of the weak classes and their
comparison with the logarithmic ideal.
Von Neumann algebras, preduals and normal functionals belong to
VonNeumannAlgebras, of which N3–N4 consume only V4.Core on B(H). N6 owns the identification of
the smooth two-torus with the smooth vectors of its gauge action, the
comparison of its rapid-decay and derivative seminorms and the spectral
invariance of `M_n(𝒜_θ)`; SmoothBanachRepresentations Layer 8 states the
generic smooth-algebra theorems for Banach-algebra actions and no torus
estimate, and its generic inverse closure is not an input here. The
algebraic K₀ of finitely generated projective modules, the group
K₁=`GL_∞(A)/E_∞(A)` and Whitehead's lemma are Tau Ceti's `ExactK0` of
the exact category of finitely generated projective modules and its
`AlgebraicK1`, the abelianization of `StableGeneralLinearGroup`, and
AlgebraicKTheory owns their further theory; N2 states its pairings on
idempotents and invertibles and consumes their descent to these groups
from the pin. What the pinned Tau Ceti already proves of N1, N2, N4, N5
and N6 is consumed by name in the Tau Ceti contract below and is not
planned again.

## Conventions

N1.Tensor works over 𝕜=ℝ or ℂ; from N1.Cyclic on, algebras, cochains and
Hilbert spaces are complex, except where a statement names its ground
ring, as matrix Morita invariance in N1.Cyclic does (every commutative
ℚ-algebra R with coefficients in an R-module M). The algebraic cyclic theory begins for associative
unital algebras, with nonunital algebras handled by forced unitization and
relative complexes; analytic statements use continuous cochains on complete Hausdorff
locally convex algebras, and smooth dense Fréchet star subalgebras of
C*-algebras. A Fréchet algebra has a complete metrizable locally convex
complex topology with continuous multiplication; its inclusion into the
C*-algebra is injective, continuous and dense. Spectral-invariance and
summability hypotheses are stated separately. Spectral triples here have
separable complex Hilbert space, a self-adjoint densely defined closed D,
compact resolvent and bounded commutators on the specified smooth algebra.

Hilbert products conjugate the first variable. The integer Fredholm index is
kernel dimension minus cokernel dimension. Even grading γ has γ*=γ, γ²=1,
commutes with the representation and anticommutes with F or D; the even
compression goes from the positive to the negative grading. Odd compression
uses `P=(1+F)/2`, and its index is `ind(Pπ(u)P)`. Fix
`√(2i)=1+i` in the odd cyclic pairing and character constants.
Operators multiply in composition order, with the rightmost acting first.
Universal forms have degree one differential and Koszul signs.

Representations of bounded Fredholm modules can be nonunital. Normalize
their compact defects by the doubling construction in N3 before extending
to the forced unitization by `π̃(a,λ)=π(a)+λI`; use relative cyclic/K
classes for nonunital algebras. For a unital algebra represented nonunitally,
the even unit pairing compresses to π(1)H, and the odd unitary is represented
by `π(u)+I−π(1)`. The doubled, unitized cycle defines the index map;
prove agreement with the original compression wherever that compression
is already Fredholm. A compact defect relative to π(A) alone does not
define a compression index on every unitization class.
Full cyclic cochains and the normalized Hochschild mixed complex have the
same cyclic cohomology; normalization removes degeneracies, not the
degree-zero scalar cochain or its even periodicity images.
For unital A the Hochschild and mixed complexes are those of A itself.
For nonunital A use the kernel of restriction from the cochain complexes
of A⁺ to those of ℂ along its scalar-unit inclusion; the algebra
augmentation supplies a splitting in the contravariant direction.
The SBI assertion concerns this relative Hochschild theory. No
H-unitality or comparison with the naive nonunital bar complex is assumed.

## Exact supplier contracts

### From Mathlib

Hilbert C*-modules are Mathlib's `CStarModule`, and `L²(A,τ)` with its
left regular representation is Mathlib's `PositiveLinearMap.GNS` with
`gnsStarAlgHom`. Cochains are native `MultilinearMap` and continuous
multilinear maps; Mathlib `Derivation` serves the commutative
specialization; complexes use `ChainComplex`/`CochainComplex` with their
kernels, quotients and cohomology APIs. Fredholm theory is
`ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage`
and `IsFredholm.index_comp`, with the native integer index
`LinearMap.index`, the kernel dimension minus the cokernel dimension of
the underlying linear map; closed operator domains are never replaced by total
linear maps, nor Fredholmness by an opaque extra predicate. Matrices over
a C*-algebra are `CStarMatrix`, the continuous functional calculus of a
normal element is `cfc`, and representations are star homomorphisms
`StarAlgHom` into bounded operators. N1.Tensor
consumes `TensorProduct`, `Seminorm`, `WithSeminorms`,
`UniformSpace.Completion`, `PiTensorProduct` and the Hahn–Banach
theorem `exists_dual_vector''` over `RCLike` fields; N2 `Matrix.GeneralLinearGroup`
and `Matrix.transvection`; N5 `LinearPMap` closed operators and the compact
self-adjoint spectral theorem.

### From Tau Ceti

Every declaration named here is at the pinned Tau Ceti, in the module
named with it under `TauCeti/`; the layers consume these and do not
rebuild them.

- Noncommutative derivations: `derivationLieAlgebra ℂ A`
  (`Algebra/Lie/Derivation/Basic`), the Lie subalgebra of native
  `Module.End` with the associative Leibniz rule; the A-bimodule-valued
  universal-derivation comparison is constructed in N1.Cyclic using
  commuting left/right actions.
- Completed projective tensors (N1.Tensor), over every normed field 𝕜:
  `CompletedProjectiveTensorProduct`,
  the separated `UniformSpace.Completion` of the projective topology of a
  finite family of spaces with given seminorm families, with its continuous
  pure-tensor map, the extension `lift` of seminorm-bounded multilinear
  maps, the completed tensor `map` of bounded linear maps with its
  identity and composition laws `CompletedProjectiveTensorProduct.map_id`
  and `CompletedProjectiveTensorProduct.map_comp`
  (`Analysis/Normed/Module/PiTensorProduct/Projective/Completion`), first
  countability of the algebraic projective topology for countable seminorm
  families over a nontrivially normed field (`…/Projective/Topology`), the
  relabelling `reindex`, which for two factors is the completed tensor flip,
  with `CompletedProjectiveTensorProduct.reindex_refl`,
  `CompletedProjectiveTensorProduct.reindex_trans` and its naturality
  `CompletedProjectiveTensorProduct.map_comp_reindex`
  (`…/PiTensorProduct/Reindex/Completion`), and, over a nontrivially
  normed field, the universal properties
  `liftEquiv` of the algebraic projective tensor and
  `CompletedProjectiveTensorProduct.liftEquiv` of its completion for
  continuous multilinear maps into complete Hausdorff targets
  (`…/PiTensorProduct/UniversalProperty`). For the family seminorms
  the pin bounds a pure tensor only from above,
  `PiTensorProduct.projectiveSeminormOf_tprod_le`
  (`…/PiTensorProduct/Projective/Seminorm`).
- Banach projective tensors (N1.Tensor), for seminormed spaces over a
  normed field: the binary projective seminorm
  `TensorProduct.projectiveSeminorm`, the infimum of `Σ‖x_i‖‖y_i‖` over
  finite decompositions, on the copy `TauCeti.ProjectiveTensor 𝕜 E F` of
  `E⊗F`, with its universal bound
  `TensorProduct.apply_le_mul_projectiveSeminorm`
  (`Analysis/Normed/Module/TensorProduct/ProjectiveSeminorm`), and over
  `RCLike` fields its cross property `TensorProduct.projectiveSeminorm_tmul`,
  `π(x⊗y)=‖x‖‖y‖` for seminormed factors (`…/TensorProduct/InjectiveSeminorm`);
  over a nontrivially normed field its completion
  `TauCeti.CompletedProjectiveTensor 𝕜 E F`, a Banach space, with the
  operators `TauCeti.CompletedProjectiveTensor.mapL` of norm at most
  `‖f‖‖g‖` and the isometric universal property
  `TauCeti.CompletedProjectiveTensor.liftIsometry`,
  `(E→L F→L G)≃ₗᵢ(E⊗̂_π F→L G)` for every Banach space G, which at G=𝕜
  identifies the dual with the bounded bilinear forms
  (`…/TensorProduct/Completion`); and the symmetry, scalar-unit and
  associativity isometries `TauCeti.ProjectiveTensor.comm`,
  `TauCeti.ProjectiveTensor.lid` and `TauCeti.ProjectiveTensor.assoc` of
  algebraic tensors with their pure-tensor equations, and the completed
  symmetry and scalar unit `TauCeti.CompletedProjectiveTensor.comm` and
  `TauCeti.CompletedProjectiveTensor.lid` (`…/TensorProduct/Associator`).
  The pin has no comparison of the binary projective norm with the
  finite-family `PiTensorProduct` projective norm; BanachSpaceTheory B4
  supplies it.
- Universal forms (N1.Cyclic): `UniversalForms k A n`, the words
  `x da₁⋯da_n` of `A⁺⊗A^⊗n` with their differential and cochain complex
  (`NoncommutativeGeometry/UniversalDifferential/Complex`), Connes' product
  with the graded Leibniz rule (`…/Product`), the differential graded
  algebra `⨁ n, Ωⁿ` with the inclusion `UniversalForms.ι` of A as
  zero-forms (`…/DGAlgebra`), the universal one-forms as the kernel of
  multiplication with their derivation universal property and
  functoriality (`…/OneForms`, `…/TensorCoordinates`, `…/Map`), cycles
  with closed graded traces `IsClosedGradedTrace` and their characters
  `cycleCocycle` (`RingTheory/CyclicCohomology/Cycle`), the realization of
  every cyclic cocycle by the universal-form cycle it defines
  (`…/UniversalDifferential/Cycle`), and the exterior product
  `exteriorProductCocycle` of cyclic cocycles as the character of the
  Koszul-signed tensor product of their cycles
  (`…/UniversalDifferential/ExteriorProduct`, `RingTheory/CyclicCohomology/TensorCycle`).
- Cyclic cohomology (N1.Cyclic): the Hochschild coboundary with the sign
  pinned in N1.Cyclic and the cyclic cochains
  (`RingTheory/CyclicCohomology/Cochain`); the cyclic operator, cyclic
  norm, bar coboundary, unit contraction and Connes' `B` with `B²=0` and
  `bB+Bb=0` (`…/ConnesOperator`); `cyclicCocycles`, `cyclicCohomology` with
  its class map and pullback along nonunital homomorphisms
  (`…/Cohomology`); the Hochschild complex and `hochschildCohomology`
  (`RingTheory/HochschildCohomology/Complex`) with `I` and `B` on
  cohomology (`…/CyclicCohomology/Hochschild`); the cyclic bicomplex, its
  total complex and the quasi-isomorphism from the cyclic-cochain complex
  over a ℚ-algebra (`…/Bicomplex`, `…/RowExactness`); the periodicity
  map `S` of the bicomplex as the column shift and the SBI sequence exact
  at every term (`…/Periodicity`, `…/ExactSequence`);
  `periodicCyclicCohomology`, the same-parity direct limit under `S`, with
  its 2-periodicity (`…/PeriodicCohomology`); for the ground ring,
  `HC^(2k+1)(R;M)=0`, `HC^0(R;M)≅M`, and `HC^(2k)(R;M)≅M` for `k≥1` when
  multiplication by 2 is injective on `M` (in general `HC^(2k)(R;M)≅M⧸M[2]`
  for `k≥1`, with `M[2]` the 2-torsion) (`…/GroundRing`); reduced and
  relative cyclic cohomology (`…/Reduced`, `…/Relative`); normalized
  cochains and chains with `b`, `B` and the even Chern chains with
  `(b+B)ch=0` (`…/Normalized/Basic`, `…/Normalized/Chains`,
  `…/Normalized/Chern/Even`); the trace–derivation cocycles
  `traceDerivationCocycle` and `traceDerivationPairCocycle`
  (`…/Derivation`); and continuous cyclic cochains with their operators,
  `continuousCyclicCohomology` with its quotient topology, the relative
  continuous complex and the continuous matrix extension
  (`…/Continuous/Basic`, `…/OperatorTopology`, `…/Continuous/Cohomology`,
  `…/Continuous/Relative`, `…/Continuous/Matrix`).
- Hochschild cochains (N1.Cyclic): for a possibly nonunital normed
  algebra A over a nontrivially normed field and a bounded bimodule E
  with bounded bilinear left and right actions, the bounded Hochschild
  coboundary `ContinuousLinearMap.hochschildBimoduleCoboundary` on the
  cochains `ContinuousMultilinearMap 𝕜 (fun _ : Fin n ↦ A) E`,
  `(δT)(a₀,…,a_n)=a₀·T(a₁,…,a_n)+Σ_(j<n)(−1)^(j+1)T(a₀,…,a_ja_(j+1),…,a_n)+(−1)^(n+1)T(a₀,…,a_(n−1))·a_n`,
  with `‖δ‖≤‖L‖+n+‖R‖` for the action maps L and R
  (`ContinuousLinearMap.norm_hochschildBimoduleCoboundary_le`), δ²=0
  for associative commuting actions
  (`ContinuousLinearMap.hochschildBimoduleCoboundary_hochschildBimoduleCoboundary`),
  the central elements as degree-zero cocycles and the bounded
  derivations as degree-one cocycles
  (`ContinuousLinearMap.hochschildBimoduleCoboundary_constOfIsEmpty_eq_zero_iff`,
  `ContinuousLinearMap.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero_iff`)
  (`Analysis/Normed/Algebra/HochschildCohomology/Coboundary`), and
  naturality in bounded bimodule maps of the coefficients,
  `ContinuousLinearMap.hochschildBimoduleCoboundary_compContinuousMultilinearMap`
  (`…/HochschildCohomology/Coefficients`); for a bounded bimodule E with
  left action L and right action R, the dual actions
  `ContinuousLinearMap.dualAction` on `StrongDual 𝕜 E`, the left action
  `(a·φ)(x)=φ(x·a)` being `dualAction R` and the right action
  `(φ·a)(x)=φ(a·x)` being `dualAction L`, with their bimodule laws for
  associative commuting L and R,
  `ContinuousLinearMap.dualAction_mul_apply_of_right`,
  `ContinuousLinearMap.dualAction_mul_apply_of_left` and
  `ContinuousLinearMap.dualAction_apply_dualAction_apply_comm` and their
  weak-star continuity in the dual variable
  `ContinuousLinearMap.continuous_toWeakDual_dualAction`
  (`Analysis/Normed/Module/Dual/Bimodule`); for an algebra A over a
  commutative semiring R and an R-module N, the dual bimodule
  `A →ₗ[R] N` with `(x·f)(y)=f(yx)` and `(f·x)(y)=f(xy)`, which for N=R
  is `(aφb)(y)=φ(bya)`, and `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`:
  currying the first argument, `TauCeti.multilinearCurryFirstEquiv`,
  carries the coboundary b of N-valued cochains in n+1 arguments to the
  Hochschild coboundary of the `A →ₗ[R] N`-valued cochains in n
  arguments (`RingTheory/HochschildCohomology/Dual`). The pin has no
  cohomology groups of bounded cochains and no bounded form of the
  currying comparison; BanachAlgebras A6 supplies both.
- Pairings (N2): the matrix extension `φ#Tr` and
  `cyclicCohomology.matrixExtension` (`…/Matrix`);
  `cyclicCohomology.evenPairing` with Connes' formula, additivity on direct
  sums, conjugation, polynomial-homotopy and Murray–von Neumann invariance
  and its descent `evenPairingK0` to `ExactK0` of finitely generated
  projective modules (`…/EvenPairing/Basic`, `…/EvenPairing/Invariance`,
  `…/EvenPairing/AlgebraicK0`); `cyclicCohomology.oddPairing` with Connes'
  formula, direct sums, stabilization, the product law, conjugation,
  polynomial homotopy, vanishing on elementary matrices and commutators
  and its descent `AlgebraicK1.oddPairing` (`…/OddPairing/Basic`,
  `…/OddPairing/Invariance`, `…/OddPairing/AlgebraicK1`).
- Operator ideals and Dixmier traces (N3–N4): the Schatten families
  `OperatorIdealFamily.schatten` for 1≤p<∞ and
  `OperatorIdealFamily.traceClass`, on the zero-indexed approximation
  numbers, with completeness and the inclusions S_p⊆S_q for 1≤p≤q
  (`Analysis/OperatorIdeal/Family/Schatten`, `…/TraceClass`); the
  logarithmic ideal `OperatorIdealFamily.logarithmic` with its gauge,
  ideal laws, completeness, adjoint invariance, compactness of its members
  and the trace-class inclusion (`…/Logarithmic`); `GeneralizedLimit` with
  `IsDilationInvariant`, its unfolding
  `TauCeti.GeneralizedLimit.IsDilationInvariant.map_dilate`,
  `ω(n↦f(⌊n/k⌋))=ω(f)` for dilation-invariant ω, every bounded f and
  k≥1, and the existence of dilation-invariant generalized limits
  (`Analysis/Normed/Order/GeneralizedLimit`); `dixmierTrace` with its
  positivity, positive homogeneity, subadditivity
  `Tr_ω(S+T)≤Tr_ω(S)+Tr_ω(T)` on `L^(1,∞)`, ideal bound, invariance under
  adjoints and unitaries, vanishing on trace class and the value 1 on
  `diag(1/(j+1))` (`…/DixmierTrace`); and the Ky Fan superadditivity
  `ContinuousLinearMap.IsPositive.kyFanGauge_add_kyFanGauge_le`,
  `K_k(S)+K_l(T)≤K_(k+l)(S+T)` for positive S, T on a Hilbert space, with
  `K_k` the sum of the first k approximation numbers
  (`Analysis/OperatorIdeal/ApproximationNumber/Positive`). The pin has no
  additivity of `dixmierTrace` on positive operators; N4 proves it from
  these two inputs. The pins have the
  trace only in finite dimension (Mathlib's `LinearMap.trace`, Tau Ceti's
  `TauCeti.traceCLM`) and no trace functional on trace-class operators,
  which VonNeumannAlgebras V4.Core supplies; N4 builds the linear Dixmier
  trace on `L^(1,∞)`.
- Fredholm perturbation (N3, N5, N7), for bounded operators between
  Banach spaces over ℂ: Riesz–Schauder, `TauCeti.isFredholm_one_add`,
  that 1+K is Fredholm for compact K; Atkinson's compact perturbation,
  `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` and
  `ContinuousLinearMap.index_add_of_isCompactOperator`, that T+C is
  Fredholm with the index of T when T is Fredholm and C compact
  (`Analysis/Fredholm/CompactPerturbation`); stability of Fredholmness and
  the index near a Fredholm operator,
  `ContinuousLinearMap.IsFredholm.eventually_isFredholm_and_index_eq`
  (`…/SmallPerturbation`); and constancy of the index along a continuous
  family of Fredholm operators over a preconnected parameter space,
  `Continuous.index_eq_of_preconnectedSpace` and `Path.index_eq`
  (`…/ContinuousFamily`). The index in these statements is Mathlib's
  `LinearMap.index` of the underlying linear map.
- Compact resolvent (N5): for a self-adjoint `LinearPMap`, compactness of
  the resolvent at one nonreal point and at every nonreal point are
  equivalent, `K=(1+D²)⁻¹=R(i)*R(i)` is positive and injective, its
  eigenspaces for nonzero eigenvalues are finite-dimensional, D-invariant
  and densely spanning, and `D` has a complete orthonormal eigenbasis with
  real eigenvalues (`Analysis/InnerProductSpace/LinearPMap/CompactResolvent`,
  `…/Eigenbasis`).
- The smooth torus (N6): `SmoothNoncommutativeTorus θ` for every real θ,
  modelled by rapidly decreasing coefficient functions on ℤ², with the
  twisted convolution product, the star, the unitaries `U₁`, `U₂`, the
  relation `U₂U₁=exp(2πiθ)U₁U₂`, the ordered multiplier `exp(2πiθnm′)`
  and the faithful trace `trace` (`NoncommutativeGeometry/SmoothTorus/Basic`);
  it carries no topology and no derivations at the pin.
- Resolvent integrals (N6): for an element a of a complex Banach algebra,
  f holomorphic on an open U and cycles Γ₁, Γ₂ in U∖σ(a), null-homologous
  in U, with the same winding number about every point of σ(a), the
  integrals `∫_Γ f(z)(z1−a)⁻¹dz` over Γ₁ and Γ₂ agree,
  `TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq`
  (`Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Cycle`). The
  pin has no theorem producing such a cycle around a compact set, and no
  holomorphic calculus as an algebra homomorphism; BanachAlgebras A2
  supplies both.
- Crossed products (N6): the pullback `TauCeti.CStarAction.comp` of an
  action along a continuous homomorphism (`Analysis/CStarAlgebra/Action/Basic`);
  the rotation action `TauCeti.CStarAction.rotation` of the real line
  on `C(Circle, ℂ)`, with `TauCeti.CStarAction.rotation_apply_apply`,
  `rotation t f z = f(exp(it)⁻¹z)` (`…/Action/ContinuousMap`), and the
  coordinate unitary `Circle.coordinate` with
  `Circle.coordinate_mem_unitary` (`Analysis/Complex/Circle`); for a
  point-norm continuous action α of a locally compact group with a left
  Haar measure μ, the full crossed product
  `TauCeti.CStarAction.FullCrossedProduct α μ`, the completion of the
  twisted convolution algebra `(f⋆g)(s)=∫f(r)α_r(g(r⁻¹s))dμ(r)` on
  compactly supported continuous functions in the supremum of the norms
  of the integrated forms of covariant Hilbert-space representations, a
  nonunital C*-algebra, with the dense map
  `TauCeti.CStarAction.FullCrossedProduct.of`, its injectivity
  `TauCeti.CStarAction.FullCrossedProduct.of_injective` when the
  coefficients have a faithful representation and μ is inner regular,
  uniqueness `TauCeti.CStarAction.FullCrossedProduct.starAlgHom_ext`,
  the extension `TauCeti.CStarAction.FullCrossedProduct.lift` of
  *-homomorphisms bounded by that supremum, and the integrated forms
  `TauCeti.CStarAction.CovariantRepresentation.integratedFull` of
  covariant pairs on Hilbert spaces (`…/Action/CrossedProduct/Full`);
  the coefficient map i_A,
  `TauCeti.CStarAction.FullCrossedProduct.coefficientMultiplier`, and the
  unitary group map i_G,
  `TauCeti.CStarAction.FullCrossedProduct.groupMultiplier`, into the
  multiplier algebra, acting on the left by `(i_A(a)f)(s)=a·f(s)` and
  `(i_G(r)f)(s)=α_r(f(r⁻¹s))`, with the covariance
  `TauCeti.CStarAction.FullCrossedProduct.groupMultiplier_mul_coefficientMultiplier`,
  `i_G(r)i_A(a)=i_A(α_r a)i_G(r)` (`…/CrossedProduct/Multiplier`). The
  pin has no unit for a discrete group, no universal property for
  covariant pairs in an arbitrary C*-algebra, no reduced crossed product
  or conditional expectation and no dual action.

### From TauCetiRoadmap roadmaps

| Supplier | Interface consumed here |
| --- | --- |
| [BanachAlgebras A2, A6](../BanachAlgebras/README.md) | A2's holomorphic functional calculus of a unital Banach algebra, `f(a)=(2πi)⁻¹∫_Γ f(z)(z1−a)⁻¹dz` for f holomorphic near σ(a), with the existence of cycles Γ in U∖σ(a) null-homologous in U and winding once around σ(a), consumed by N6 for `M_n(A_θ)`; A6's cohomology groups `Hⁿ=Zⁿ/Bⁿ` of bounded Hochschild cochains and the compatibility of the bounded coboundary with currying into the Banach dual, consumed by N1.Cyclic. The bounded coboundary and the dual actions `ContinuousLinearMap.dualAction`, `(a·φ)(x)=φ(xa)` and `(φ·a)(x)=φ(ax)`, are Tau Ceti's. N1 owns its resolution comparisons. |
| [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) | Native `LinearPMap` closed operators, adjoints, spectral calculus and graph norms. N5 constructs the compact-resolvent/summability consequences. |
| [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) | Compact operators, singular values with their mixed-index sum and product inequalities (OI-A17, OI-A22), the two-sided ideal inequality (OI-A20) and adjoint invariance `aₙ(T†)=aₙ(T)` (OI-A30), Schatten spaces S_p for 1≤p≤∞ and the trace-class norm. N3 adds the B(H) inclusions of the quasi-ideals into the Schatten scale; N4 the singular traces. |
| [NoncommutativeIntegration §1.3–§1.6, §2.1](../NoncommutativeIntegration/README.md) | At M=B(H) with its usual trace Tr, where `μ_t(T)=a_⌊t⌋(T)` with the zero-indexed approximation numbers (§1.5): the Schatten quasi-ideals S_p for 0<p<1 as Lp(B(H),Tr), with the p-triangle inequality `‖S+T‖_p^p≤‖S‖_p^p+‖T‖_p^p`, the ideal bound `‖ATB‖_p≤‖A‖‖T‖_p‖B‖`, adjoint invariance and completeness of the p-metric (§1.3, §1.5); Hölder's inequality `‖ST‖_r≤‖S‖_p‖T‖_q` with constant one for p,q,r>0 and 1/r=1/p+1/q, and the log-submajorization of the singular values of a product (§1.4); the weak Schatten classes `sup_j(j+1)^(1/p)μ_j(T)<∞`, with the weak trace class `S_(1,∞)` at p=1, and their quasi-norm, adjoint and ideal bounds (§1.6); the cyclicity `Tr(ST)=Tr(TS)` for S∈S_p, T∈S_q with 1/p+1/q=1, 1≤p<∞ (§2.1). N3 consumes the quasi-ideals, Hölder and the cyclicity for its characters, N4 Hölder and the weak classes. |
| [VonNeumannAlgebras V4.Core](../VonNeumannAlgebras/README.md) | The canonical trace `Tr(T)=Σ_j⟨e_j,Te_j⟩` on the trace class S₁(H) of OI-B29–B30, its independence of the orthonormal basis, `Tr|T|=‖T‖₁`, the cyclicity of trace-class products against bounded operators and of Hilbert–Schmidt pairings, and the isometric identification of B(H) with the dual of S₁(H) under `(x,h)↦Tr(xh)`, so that the ultraweakly continuous functionals on B(H) are the `T↦Tr(ρT)` with ρ trace class. N3 consumes the trace for its characters, N4 for the Tauberian bridge and the singularity of Dixmier traces. |
| [HilbertModules H1–H3](../HilbertModules/README.md) | In Mathlib's right-module convention `CStarModule Aᵐᵒᵖ E`: H1's completion of a pre-Hilbert module, including a module over a dense *-subalgebra whose positivity and norm are measured in its C*-completion, with the extension of the action to that completion; H2's rank-one operators `z↦x⟨y,z⟩`, finite Parseval frames `Σ_i x_i⟨x_i,z⟩=z` with their analysis and synthesis maps and Gram-matrix projection `(⟨x_i,x_j⟩)_(i,j)` in `M_n(A)`, and, for unital A, the existence of a finite Parseval frame on a complete module exactly when it is finitely generated projective; H3's induced Hilbert space `E⊗_A H_π` of a nondegenerate representation π, and for a state ω its identification with the completion of E modulo `{x:ω(⟨x,x⟩)=0}` and with `E⊗_A H_ω`. N7 consumes them at A=A_θ and ω=τ for the Heisenberg module. |
| [BanachSpaceTheory B4](../BanachSpaceTheory/README.md) | The norm-preserving comparison, by the identity on pure tensors, of the binary projective norm on `E⊗F` with the finite-family `PiTensorProduct` projective norm of the pair (E,F), for normed spaces over ℝ and ℂ, consumed by N1.Tensor for its comparison with the pinned Banach projective tensor. That tensor, its cross property, universal property and symmetry, unit and associativity isometries are Tau Ceti's. |
| [OperatorAlgebraDynamics D1–D2,D4](../OperatorAlgebraDynamics/README.md) | D1's universal property of the full crossed product for nondegenerate covariant pairs in multiplier algebras, hence in any unital C*-algebra; D2's generator formulas for G=ℤ, the equality of full and reduced crossed products for amenable groups and the faithful conditional expectation of a discrete crossed product with its Fourier coefficient maps; D4's dual action of the circle. The full crossed product, its canonical multipliers and the rotation action are Tau Ceti's; N6 constructs the two-torus gauge action. |

## How to read the build

N1 consumes Tau Ceti's completed locally convex and Banach projective
tensors and adds the coherence laws and Fréchet comparison of the former
and its comparison with the latter (N1.Tensor), and consumes its
universal forms, cyclic complexes, bounded Hochschild coboundary, SBI sequence and
periodic cyclic cohomology, adding the normalizations and comparisons,
homotopy and Morita invariance and the continuous theory on completed
tensors (N1.Cyclic). N2 consumes the pinned pairings of cyclic cocycles
with idempotents and invertibles and calibrates the pairing constants,
Chern chains and smooth-homotopy transport. N3 builds bounded
Fredholm modules and, on NoncommutativeIntegration's Schatten
quasi-ideals and Hölder inequality and VonNeumannAlgebras' trace on
B(H), the finitely summable character with its index theorem. N4
compares NoncommutativeIntegration's weak Schatten classes with the
pinned logarithmic ideal and builds the linear Dixmier trace on that
ideal and the Tauberian bridge. N5
builds spectral triples, their Borel calculus and bounded transform on the
pinned eigenbasis, and the Hochschild-class theorem. N6 builds the
rotation C*-algebra on Tau Ceti's full crossed product, the Fréchet topology,
derivations and differential calculus of the pinned smooth two-torus
and its cyclic cohomology, and N7 its
Fourier spectral triple, the product of two circle Hardy classes at θ=0,
its Heisenberg module on HilbertModules' completions and the index
computations. Each
section ends with its examples and with the sections and suppliers it
needs; the sections are cited as N1–N7.

## N1. Universal differential forms and cyclic complexes

### N1.Tensor. Completed locally convex projective tensors

This is the generic locally convex tensor supplier of the library; it
uses nothing from the cyclic theory below. Fix 𝕜=ℝ or ℂ (`RCLike 𝕜`);
every statement of this section is made for both fields. Work on
Hausdorff locally convex 𝕜-spaces E,F whose topologies are given by
seminorm families (`WithSeminorms`), without assigning a fictitious
norm to a nonnormable space. The completed projective tensor E⊗̂_π F is
the pinned `CompletedProjectiveTensorProduct` of the family (E,F): the
algebraic `TensorProduct 𝕜 E F` with the topology generated by the
projective seminorms `π_(p,q)(t)=inf_(t=Σx_i⊗y_i)Σp(x_i)q(y_i)` of finite
suprema p, q of the defining seminorms, followed by its separated
`UniformSpace.Completion` (Grothendieck 1952, Chapter I, n° 1, Théorème 1,
p. 76, and the completed product, p. 77). Its canonical continuous bilinear map with
dense algebraic image, the extension `lift` of seminorm-bounded bilinear
maps, the completed tensor `map` of bounded linear maps with its identity
and composition laws, the flip `reindex` with its naturality in `map`,
and the universal property `CompletedProjectiveTensorProduct.liftEquiv`
for jointly continuous 𝕜-bilinear maps into complete Hausdorff locally
convex 𝕜-spaces, with uniqueness on pure tensors, are consumed from
the pin. Prove here the cross property `π_(p,q)(x⊗y)=p(x)q(y)` for the
family seminorms, the pin giving only ≤ there
(`PiTensorProduct.projectiveSeminormOf_tprod_le`), from functionals f, g
with |f|≤p, f(x)=p(x), |g|≤q, g(y)=q(y) supplied by Hahn–Banach over 𝕜
(Mathlib's `exists_dual_vector''` on E with the seminorm p). For two
seminormed factors the binary equality is the pinned
`TensorProduct.projectiveSeminorm_tmul`, and for normed factors the
argument is the pinned isometric identification
`TauCeti.CompletedProjectiveTensor.liftIsometry` at G=𝕜 of bounded
bilinear forms with the dual of the projective tensor (Grothendieck 1952,
Chapter I, Théorème 1, p. 76) applied to the form (x,y)↦f(x)g(y). Then
prove associativity, the scalar unit `𝕜⊗̂_π E≃E` and compatibility with
finite direct sums (Grothendieck 1952, Chapter I, n° 1, p. 77, for
products and direct sums), with their pure-tensor equations and
coherence; their normed binary case on algebraic tensors is pinned as
the isometries `TauCeti.ProjectiveTensor.assoc` and
`TauCeti.ProjectiveTensor.lid`. Establish Fréchet completeness and
metrizability when E,F are Fréchet (Grothendieck 1952, Chapter I, n° 1,
p. 77); no nuclearity or approximation
hypothesis is imposed for this construction. For normed factors compare
with the pinned Banach completed projective tensor
`TauCeti.CompletedProjectiveTensor 𝕜 E F` over the same 𝕜 by the identity
on pure tensors (for normed factors the projective topology is that of
the norm `inf Σ‖x_i‖‖y_i‖` and the completion is a Banach space,
Grothendieck 1952, Chapter I, n° 1, pp. 76–77): the completed tensor of
the pair (E,F), each with the one-seminorm family of its norm, is
linearly homeomorphic to `TauCeti.CompletedProjectiveTensor 𝕜 E F` by a
map that is the identity on pure tensors and carries the extended
projective seminorm to the Banach norm; under it
`CompletedProjectiveTensorProduct.liftEquiv` and
`TauCeti.CompletedProjectiveTensor.liftIsometry` agree for Banach
targets, and the completed `map` of two bounded maps is
`TauCeti.CompletedProjectiveTensor.mapL`. The equality of the two
seminorms on `E⊗F` is BanachSpaceTheory B4's norm-preserving comparison
of the binary projective norm with the finite-family `PiTensorProduct`
projective norm, which the pin lacks; nothing else of B4 enters, in
particular not its approximation-property or nuclear-operator results.

**Checks.**

- On ℓ¹⊗̂_π ℓ¹, over either field, the projective norm of a pure tensor
  x⊗y is ‖x‖‖y‖, the cross property:
  the one-term representation gives the upper bound, and norming
  functionals f,g with f(x)=‖x‖, g(y)=‖y‖ give
  `‖x‖‖y‖=Σf(x_i)g(y_i)≤Σ‖x_i‖‖y_i‖` for every representation. The
  representation `e₀⊗e₀=(e₀+e₁)⊗e₀−e₁⊗e₀` has sum of products 3, so the
  value 1 is the infimum and a quantity read off one fixed representation is
  not a function of the tensor.
- Pure tensors do not fix the norm of the Banach comparison. On
  ℓ¹₂⊗ℓ¹₂, with ℓ¹₂ the plane with the ℓ¹ norm, the tensor
  `u=e₀⊗e₀+e₀⊗e₁+e₁⊗e₀−e₁⊗e₁` has projective norm 4, the ℓ¹ norm of its
  coefficient matrix, since ℓ¹₂⊗̂_π ℓ¹₂ is ℓ¹ of the four index pairs, over
  either field. Its injective norm, the supremum of
  `|f₀(g₀+g₁)+f₁(g₀−g₁)|` over `|f_i|,|g_j|≤1`, is the maximum over g of
  `|g₀+g₁|+|g₀−g₁|`: 2 over ℝ, and 2√2 over ℂ, attained at g₀=1, g₁=i. Both norms
  are cross norms, so a comparison that only matches pure tensors could
  land in the injective norm; the comparison with the Banach projective
  tensor must give 4.
- On ℓ²⊗̂_π ℓ² the element `Σ_(i<n) e_i⊗e_i` has projective norm n (as a
  trace-class operator it is a rank-n projection, of trace norm n) while its
  Hilbert tensor norm is √n. The comparison map to the Hilbert tensor product
  is continuous and not an isometry; a construction yielding the injective or
  Hilbert norm would give √n.
- The universal property is for 𝕜-bilinear maps, and the field is part of
  the data. Over 𝕜=ℂ, on ℂ⊗̂_π ℂ=ℂ the map
  (x,y)↦xy induces the identity, while (x,y)↦x·ȳ, additive in each
  variable and ℂ-linear only in x, induces no map at all: the pure tensors
  1⊗i and i⊗1 are both i·(1⊗1), equal in the complex tensor, but the two
  values are −i and i. Over 𝕜=ℝ, with ℂ regarded as a real space, the
  tensor ℂ⊗̂_π ℂ has real dimension 4 and keeps 1⊗i and i⊗1 apart, and
  (x,y)↦x·ȳ induces a real-linear map.
- The scalar unit 𝕜⊗̂_π E ≃ E sends λ⊗x to λx: for a continuous seminorm
  p on E, `π_(|·|,p)(Σλ_i⊗x_i)=p(Σλ_ix_i)`, the triangle inequality giving
  ≥ and the one-term representation `1⊗Σλ_ix_i` giving ≤. With p=0 the
  seminorm `π_(|·|,0)` vanishes identically, so no single seminorm of the
  family separates points; the family separates the points of 𝕜⊗E exactly
  because the continuous seminorms of the Hausdorff space E separate its
  points. With E={0} the completed tensor is {0}.

*Needs:* Tau Ceti `CompletedProjectiveTensorProduct` with its `lift`, `map`, `CompletedProjectiveTensorProduct.map_id`, `CompletedProjectiveTensorProduct.map_comp`, `reindex` and `CompletedProjectiveTensorProduct.liftEquiv`, `PiTensorProduct.projectiveSeminormOf_tprod_le`, `TauCeti.CompletedProjectiveTensor` with `TauCeti.CompletedProjectiveTensor.mapL` and `TauCeti.CompletedProjectiveTensor.liftIsometry`, and `TensorProduct.projectiveSeminorm_tmul`; Mathlib `TensorProduct`, `Seminorm`, `WithSeminorms`, `UniformSpace.Completion`, `PiTensorProduct` and `exists_dual_vector''`; BanachSpaceTheory B4's comparison of the binary and finite-family projective norms.

### N1.Cyclic. Universal forms and complexes

Build completed bar resolutions and their continuous contracting
homotopies for unital complex algebras. Identify continuous multilinear cochains with continuous
functionals on the completed tensors by the universal property, using
uniform convergence on products of bounded sets for the cochain topology
on both sides, and prove compatibility of the differentials. In the smooth
circle example prove `C^∞(S¹)⊗̂_π C^∞(S¹)≃C^∞(𝕋²)` using
rapid Fourier decay, including both topologies and inverse-closedness.

Universal forms are the pinned `UniversalForms`: for every associative A
its forced unitization A⁺ is used, even when A already has a unit; the
degree-n forms are the words `x da₁⋯da_n` of `A⁺⊗A^⊗n`, the differential
of such a word is `1_ext d(x₊)da₁⋯da_n` with x₊ the part of x in A, and
degree one is the kernel of `multiplication:A⁺⊗A⁺→A⁺` with
`da=1_ext⊗a−a⊗1_ext` and the derivation universal property. Connes'
product, the graded Leibniz rule, d²=0, the tensor-word relations,
functoriality and the differential graded algebra `⨁ n, Ωⁿ` with the
inclusion of A as zero-forms, which need not preserve an existing unit,
are at the pin. A cycle has an algebra map ρ:A→Ω⁰ which need not preserve
an existing unit, and a closed graded trace; the pin proves that every
cycle gives a cyclic cocycle via
`φ(a₀,…,a_n)=∫ρ(a₀)dρ(a₁)⋯dρ(a_n)`
and that every cyclic cocycle is the character of the universal-form
cycle it defines (Connes III.1, Propositions 3–4, pp. 190–191).
Construct the A-bimodule-valued universal-derivation comparison through
`derivationLieAlgebra ℂ A` using commuting left/right actions.
For unital A separately construct the normalized form quotient
`A⊗(A/ℂ1_A)^⊗n`, its comparison with the pinned normalized Hochschild
chains and the comparison of the normalized and the full cochain
complexes on cohomology. Do not replace the full cycle construction by
this quotient: `φ(a,b,c)=abc` on ℂ is a cyclic 2-cocycle nonzero on
(1,1,1), requiring a possibly nonunital cycle map and the forced
unitization.

For unital A the degree-n cochains are multilinear maps A^(n+1)→ℂ.
For nonunital A the pinned relative complex of A⁺, the kernel of
restriction to the scalars, is the complex specified above. A cyclic cochain
satisfies `φ(a_n,a₀,…,a_(n−1))=(−1)^nφ(a₀,…,a_n)`, and the pinned
Hochschild coboundary is

`(bφ)(a₀,…,a_(n+1))`
`=Σ_(j=0)^n(−1)^j φ(a₀,…,a_j a_(j+1),…,a_(n+1))`
` +(−1)^(n+1)φ(a_(n+1)a₀,a₁,…,a_n)`,

with b²=0, preservation of the cyclic subcomplex, cochain pullbacks,
cyclic cocycles, coboundaries and `cyclicCohomology`, and with the
Hochschild cohomology with coefficients in the algebraic dual, its
comparison map I and Connes' B on cohomology, all at the pin. For unital
A, currying the first argument identifies the scalar (n+1)-cochains with
n-cochains valued in the algebraic dual A*, with the bimodule structure
`(aφb)(x)=φ(bxa)`, and carries b to the Hochschild coboundary with
coefficients in A*; this comparison is the pinned
`TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`. In the
Banach/bounded specialization the cochains are Mathlib's
`ContinuousMultilinearMap`, and the bounded Hochschild coboundary with
coefficients in a bounded bimodule, with its norm bound, δ²=0 and
coefficient naturality, is the pinned
`ContinuousLinearMap.hochschildBimoduleCoboundary`; BanachAlgebras A6
supplies the cohomology groups of bounded cochains and the compatibility
of that coboundary with currying into the Banach dual under the pinned
dual actions `ContinuousLinearMap.dualAction`, and this roadmap supplies the Fréchet
extensions and their comparison.
For locally convex A the pinned continuous multilinear cochains carry
the topology of uniform convergence on products of bounded sets, the
finite multiplication/permutation/degeneracy formulas preserve continuity,
and `continuousCyclicCohomology` is the algebraic quotient of continuous
cocycles by continuous coboundaries with its quotient topology; boundaries are
not replaced by their closure, and these quotients need not be Hausdorff.
Prove here the comparison with continuous-dual formulations on the
completed tensors above.

The cyclic operator, the faces, the unit contraction s, b′, the cyclic
norm N and Connes' B with `B²=0` and `bB+Bb=0` are at the pin, together with the
normalized cochains and chains, on which B is

`Σ_(i=0)^n(−1)^(ni) 1⊗bar a_i⊗⋯⊗bar a_n⊗bar a₀⊗⋯⊗bar a_(i−1)`,

the full cyclic bicomplex with its total complex, the quasi-isomorphism
from the cyclic-cochain complex over a ℚ-algebra, the periodicity map of
the bicomplex as its column shift, the SBI sequence with `I:HC^n→HH^n`,
`B:HH^n→HC^(n−1)` and `S:HC^(n−1)→HC^(n+1)` exact at every term
(Connes III.1, Theorem 26, p. 208), the
periodic cohomology `HP^n` as the same-parity direct limit under S with
`HP^(n+2)≅HP^n`, the computation `HC^(2k)(ℂ)=ℂ`, `HC^(2k+1)(ℂ)=0`, the
reduced theory (kernel of restriction along A's own unit inclusion
ℂ→A, zero for ℂ) and the relative forced-unitization theory recovering
the full theory of a unital A; the zero algebra has zero complexes.
Prove descent through degenerate chains, the comparison of normalized
and full cohomology, and construct the finite-column truncations of the
total complex. Normalize S as the exterior product with the scalar cyclic
2-cocycle `σ₁(a₀,a₁,a₂)=a₀a₁a₂` under the pinned `exteriorProductCocycle`
and the identification A⊗ℂ≅A, and prove that this S agrees on cohomology
with the column shift: construct the comparison maps using the
b′ contraction inserting the unit and the cyclic norm N, then normalize
them by the scalar and circle calibrations below; inclusion in a
single unnormalized (b,B) column is not the comparison map. Then
`HC^(2k)(ℂ)` is generated by `S^k[τ]`.
Prove the comparison of periodic cohomology with the direct-sum cochain
totalization of the stabilized (b,B) bicomplex: representatives have
finitely many nonzero components. Pin the scalar comparison: the cyclic
degree-2m class represented by `σ_m(a₀,…,a_(2m))=m!∏_j a_j` on ℂ maps to
the degree-zero functional z↦z in this totalization. Prove its
compatibility with S. The homogeneous column comparison sends a
normalized cyclic n-cocycle φ to `c_nφ`, with the scalars
`c_(2m)=(−1)^m/(2m)!` in even degree and
`c_(2k+1)=(−1)^k/((1+i)sqrt(π)(2k+1)!)` in odd degree.
Prove these maps agree with the full cyclic-bicomplex comparison,
including its lower unit columns; the scalars `c_n` fix the comparison
in every degree, odd ones included. Prove naturality and periodic homotopy invariance for
polynomial algebra homotopies, and for continuous homomorphisms
`A→C^∞([0,1],B)` in the locally convex theory, with continuous derivatives
and the smooth-function seminorms; construct their transgressions.
Prove matrix Morita invariance: for a unital algebra A over a
commutative ℚ-algebra R, coefficients in an R-module M and a nonempty
finite index set ι, the pinned matrix extension `φ↦φ#Tr`
(`cyclicCohomology.matrixExtension`) induces
a bijection `HC^n(A;M)→HC^n(M_ι(A);M)` in every degree n
(`bijective_matrixExtension`). Connes 1985, Part II, Corollary 24,
p. 113, applied to the bimodule ℰ=A^ι, is the case R=M=ℂ: Part II works
with complex algebras and complex-valued cochains (p. 94). A route for
general R and M: restriction of Hochschild cochains to a diagonal corner
`a↦aE_rr` is a left inverse of `φ↦φ#Tr` (the pinned
`matrixCochainExtension_single`), and an explicit chain homotopy between
the identity of the Hochschild cochains of M_ι(A) and corner restriction
followed by `φ↦φ#Tr`, built from the matrix units of the unital A, makes
the two maps mutually inverse between `HH^n(A,Hom_R(A,M))` and
`HH^n(M_ι(A),Hom_R(M_ι(A),M))`. Since `φ↦φ#Tr`
commutes with every Hochschild coface, the cyclic operator, the cyclic
norm, the unit insertion and Connes' B
(`matrixCochainExtension_hochschildCoface`,
`matrixCochainExtension_cyclicOperator`,
`matrixCochainExtension_cyclicNorm`,
`matrixCochainExtension_barContraction`,
`matrixCochainExtension_connesB`), it is a map of cyclic bicomplexes
compatible with I, B and S in the pinned SBI sequence. The five lemma
along that sequence, by induction on the degree from `H^0(Tot)≅HH^0`,
gives a bijection on the total cohomology in every degree, and the pinned
quasi-isomorphism `quasiIsoAt_cyclicCochainComplexToTotal` over a
ℚ-algebra carries it to cyclic cohomology. The exterior product of cycles, with
`(ω⊗η)(ω′⊗η′)=(−1)^(deg η deg ω′)ωω′⊗ηη′` and
`d(ω⊗η)=dω⊗η+(−1)^(deg ω)ω⊗dη`, and the exterior product of cyclic
cocycles through it are at the pin (Connes III.1, Theorem 12, p. 197).
Prove the cochain shuffle
comparison, including `[φ#ψ]=binom(p+q,p)[φ]∨[ψ]` for the
Hochschild cup comparison, graded commutativity sign `(−1)^(pq)` and compatibility
with S and the K-theory exterior product. Work out
ℂ, finite matrix algebras and traces as degree-zero cocycles, and compare
commutative differential-form cycles with their cyclic characters.

**Checks.**

- The periodicity normalization on ℂ: with τ(z)=z the degree-zero trace
  and S the exterior product with σ₁, `S^mτ(1,…,1)=m!=σ_m(1,…,1)`, so
  `S^mτ=σ_m` on ℂ (Connes III.1, Lemma 14, p. 198; III.3, Proposition 2,
  p. 229, gives `Sφ(e,…,e)=(m+1)φ(e,…,e)` for a cyclic 2m-cocycle φ and an
  idempotent e). The value m! is the Koszul-signed count of orderings of m
  pairs of anticommuting degree-one generators, `∏_(k≤m)[2k,2]_(q=−1)=m!`:
  at m=2 the six orderings of two pairs carry the signs +,−,+,+,−,+ and sum
  to 2. An exterior product without the sign `(−1)^(deg η deg ω′)` would
  give 6 at m=2, and the even pairing of [1] with `S²τ` would be 6/2!=3
  instead of the value 1 that compatibility with S requires.
- The last coboundary term: in degree zero `(bφ)(a₀,a₁)=φ(a₀a₁)−φ(a₁a₀)`,
  so the 0-cocycles are the traces. On M₂(ℂ), `(b Tr)(e₁₂,e₂₁)=Tr(e₁₁)−Tr(e₂₂)=0`,
  while the matrix-entry functional `φ(a)=a₁₁` has `(bφ)(e₁₂,e₂₁)=1−0=1`.
  With the sign +1 in place of `(−1)^(n+1)` the coboundary of the trace on
  ℂ would take the value 2 at (1,1), and no trace would be a cocycle.
- The dual-bimodule convention under currying: a scalar 1-argument
  cochain φ curries to f=φ in A*, and the Hochschild coboundary of the
  constant cochain f is `a₁↦a₁f−fa₁`, whose value at a₀ under
  `(aφb)(x)=φ(bxa)` is `φ(a₀a₁)−φ(a₁a₀)=(bφ)(a₀,a₁)`. On M₂(ℂ) with
  `φ(a)=a₁₁`, a₀=e₁₂ and a₁=e₂₁ both sides are `φ(e₁₁)−φ(e₂₂)=1`. The
  opposite actions `(aφb)(x)=φ(axb)` give `φ(a₁a₀)−φ(a₀a₁)=−1`, so the
  currying comparison would hold only up to a sign. In degree one the
  three terms `φ(a₀a₁,a₂)`, `−φ(a₀,a₁a₂)` and `φ(a₂a₀,a₁)` of
  `(bφ)(a₀,a₁,a₂)` are the left action, the inner face and the right
  action of the curried cochain.
- The cyclic sign: a cyclic 1-cochain satisfies `φ(a₁,a₀)=−φ(a₀,a₁)`; on
  the smooth circle `ψ(a₀,a₁)=(2πi)⁻¹∫a₀da₁` has `ψ(z⁻¹,z)=1` and
  `ψ(z,z⁻¹)=(2πi)⁻¹∫z·(−z⁻²)dz=−1`. A convention with the sign +1 in odd
  degree would force ψ=0. On ℂ a cyclic n-cochain is its value c at
  (1,…,1); the sign makes every odd cyclic cochain vanish, so
  `HC^(2k+1)(ℂ)=0`, while every even cochain is a cocycle, since
  `(bc)(1,…,1)=c(Σ_(j=0)^(2k)(−1)^j+(−1)^(2k+1))=c(1−1)=0`, so
  `HC^(2k)(ℂ)=ℂ`.
- The nonunital cycle: `φ(a,b,c)=abc` on ℂ is cyclic, `φ(c,a,b)=cab=abc`,
  and a cocycle, `(bφ)(a,b,c,d)=abcd−abcd+abcd−dabc=0`, with `φ(1,1,1)=1`.
  A unital cycle, with ρ(1) the unit of Ω and d1=0, has
  `∫ρ(1)dρ(1)dρ(1)=0`, and the normalized quotient `A⊗(A/ℂ1)^⊗n` kills
  every chain with a unit in a positive slot; so neither realizes this
  cocycle, which is why cycles are built on the forced unitization with a
  possibly nonunital ρ.

*Needs:* N1.Tensor; Tau Ceti `UniversalForms`, `cycleCocycle`, `exteriorProductCocycle`, `cyclicCohomology`, `cyclicCohomology.matrixExtension`, `periodicCyclicCohomology`, `continuousCyclicCohomology`, `derivationLieAlgebra ℂ A`, `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`, `ContinuousLinearMap.hochschildBimoduleCoboundary` and `ContinuousLinearMap.dualAction`; Mathlib `MultilinearMap`, `ContinuousMultilinearMap`, `ChainComplex`, `CochainComplex` and their homology APIs; BanachAlgebras A6.

### Examples

The rank-n projection `Σ_(i<n)e_i⊗e_i` in ℓ²⊗̂_πℓ² has projective norm n and
Hilbert norm √n. On ℂ the classes `S^mτ=σ_m`, with `σ_m(1,…,1)=m!`, span
`HC^(2m)(ℂ)` and the odd cyclic cochains vanish. On the smooth circle
`ψ(a₀,a₁)=(2πi)⁻¹∫a₀da₁` has `ψ(z⁻¹,z)=1=−ψ(z,z⁻¹)`.

### Dependencies

N1.Tensor: Tau Ceti's completed locally convex and Banach projective
tensors with the binary cross property; Mathlib tensor, seminorm and
completion APIs; BanachSpaceTheory B4's comparison of the binary and
finite-family projective norms. N1.Cyclic: N1.Tensor; Tau Ceti's
universal forms, cyclic, periodic and continuous cyclic cohomology,
bounded Hochschild coboundary, Banach dual actions, dual-bimodule
currying comparison and `derivationLieAlgebra ℂ A`; Mathlib complexes and
their homology APIs; BanachAlgebras A6.

## N2. Cyclic pairings with K-theory

The pinned matrix extension
`(φ#Tr)(a₀,…,a_n)=Σ_(i₀,…,i_n)φ((a₀)_(i₀i₁),…,(a_n)_(i_ni₀))`
is cyclic, commutes with b, B and the cyclic operators and descends to
cyclic cohomology; prove its compatibility with S and the trace
normalizations. For a cyclic cocycle of degree 2m and an idempotent e
the pinned even pairing is

`⟨[e],[φ]⟩=(m!)⁻¹(φ#Tr)(e,…,e)`,

and for odd n and invertible u the pinned odd pairing is

`⟨[u],[φ]⟩=(1+i)⁻¹ 2^(−n) Γ(n/2+1)⁻¹`
` ·(φ#Tr)(u⁻¹−1,u−1,…,u⁻¹−1,u−1)`.

There are n+1 alternating arguments. Both pairings are stated at the pin
on representatives, idempotents e∈M_n(A) and invertibles u∈GL_n(A) for
every n (Mathlib's `Matrix.GeneralLinearGroup`), with the relations of
the algebraic K-groups proved before any topology is imposed:
independence of the cocycle representative, invariance under the
stabilizations e↦diag(e,0) and u↦diag(u,1) and under conjugation by
GL_n(A), additivity on the block sums diag(e,f) and diag(u,v), the product
law `⟨[uv],[φ]⟩=⟨[u],[φ]⟩+⟨[v],[φ]⟩`
(Connes III.3, Propositions 2–3, pp. 229–230), hence vanishing on every
commutator and on every elementary matrix `1+aE_ij`, i≠j (Mathlib's
`Matrix.transvection`), polynomial homotopy invariance, Murray–von Neumann
invariance of the even pairing, and the descent of the even pairing to
the K₀ of finitely generated projective modules and of the odd pairing to
`AlgebraicK1`. Prove here the complex-relative unitization versions on
the kernels of the augmentation through the pinned relative complex,
smooth homotopy invariance, the compatible periodicity normalization and
the product formula fixing the odd constant.

**Checks.**
- On an elementary matrix u=`1+aE_ij`, i≠j, every odd pairing is zero
  before any relation is used: `u⁻¹−1=−aE_ij`, `u−1=aE_ij`, and a product
  of two or more multiples of `E_ij` vanishes, so each term of `φ#Tr` is
  zero.
- For the degree-zero trace cocycle on ℂ and an idempotent e∈M_n(ℂ) the
  even pairing is `Tr(e)=rank e`: additive on block sums, unchanged by
  conjugation and by diag(e,0); the scalar multiple `c·Tr` pairs to
  `c·rank e`, not an integer for c=1/2 on [1].
- On the circle, with the winding unitary z and the cocycle
  `ψ(a₀,a₁)=(2πi)⁻¹∫a₀da₁`, the odd pairing gives
  `⟨[z^k],[ψ]⟩=k/((1+i)sqrt(π))`: `ψ(z^(−k),z^k)=k` and the three terms
  with a constant argument vanish, so `⟨[z²]⟩=2⟨[z]⟩` and `⟨[z⁻¹]⟩=−⟨[z]⟩`,
  as the product law requires; a pairing without the (1+i)⁻¹ factor would
  not square to `1/(2πi)` on the Bott class.
- The smooth Bott class: for the tautological projection
  `Tr(p dp∧dp)=2i(1+|z|²)⁻² ds∧dt`, so
  `⟨β,[φ_B]⟩=(2πi)⁻¹·2i·2π∫_0^∞ r(1+r²)⁻² dr=+1`; the orientation dt∧ds,
  or the complementary projection 1−p, gives −1, because
  `Tr(dp∧dp)=0` forces `Tr((1−p)dp dp)=−Tr(p dp dp)`; the constant
  projection p(∞) pairs to 0.

For a Fréchet algebra and continuous cocycles prove both pairings
continuous in the idempotent or invertible and invariant under smooth
homotopies. A smooth path e_t of idempotents satisfies `e′=[x,e]` with
`x=[e′,e]`, so it is the conjugate `u_t e₀ u_t⁻¹` of e₀ by the solution
of `u′=xu`, u₀=1, whenever that linear equation is solvable, as it is in
every Banach algebra and in every Fréchet algebra whose topology is
given by submultiplicative seminorms; the even case then reduces to
conjugation invariance. The odd pairing is constant along a smooth path
of invertibles by the transgression used for the product law (Connes
III.3, Proposition 3, proof, pp. 230–231). Nonunital pairings use the
relative forced-unitization complex and the kernels of the augmentation
on the pinned K-groups. Prove functoriality under continuous
homomorphisms.

Pin comparison with the normalized mixed complex by its closed periodic
Chern chains. The even components `ch₀(e)=e` and, for k≥1,
`ch_(2k)(e)=(−1)^k(2k)!/k! · (e−1/2)⊗bar e^⊗(2k)`,
with `b ch_(2k+2)+B ch_(2k)=0`, are at the pin on normalized chains;
construct the odd components
`ch_(2k+1)(u)=(−1)^k k! · u⁻¹⊗bar u⊗bar u⁻¹⊗⋯⊗bar u`,
with 2k+2 factors, and prove `(b+B)ch=0` for them, the product
totalization of both families, the relative-unitization
versions and invariance under stabilization and homotopy. Pair a
finite-support periodic cochain with these chains by the finite sum,
and prove the cyclic-to-mixed comparison gives exactly the displayed
N2 pairings.
The mixed image of a normalized cyclic n-cocycle φ is `c_nφ`, with
N1.Cyclic's column scalars `c_n`; full cyclic cochains use
N1.Cyclic's comparison with its lower unit columns, and the scalar σ_m
class keeps the degree-zero component fixed there. Prove that
evaluating `c_nφ` on the displayed Chern chains gives the factors
`(m!)⁻¹` and `(1+i)⁻¹2^(−n)Γ(n/2+1)⁻¹` of the pinned pairings: in
even degree `c_(2m)·(−1)^m(2m)!/m!=1/m!`, and in odd degree n=2k+1
`c_(2k+1)·(−1)^k k!=k!/((1+i)sqrt(π)(2k+1)!)=(1+i)⁻¹2^(−n)Γ(k+3/2)⁻¹`.
In odd parity calibrate on the circle cocycle
`ψ(a₀,a₁)=(2πi)⁻¹∫_(S¹)a₀ da₁`: its normalized mixed image
has degree-one component `ψ/((1+i)sqrt(π))`, so its pairing with
the positive winding class is `1/((1+i)sqrt(π))`.

Pin the smooth Bott class of the two-torus: with coordinates (x,y) in
that order, let q be a smooth map of 𝕋² onto the oriented two-sphere
that collapses a neighbourhood of the two coordinate circles to the
point at infinity and has degree +1, and let q*β∈M₂(C^∞(𝕋²)) be the
pullback of the smooth Bott projection β defined below. The product
circle cocycle ψ₁#ψ₂, the pinned exterior product, has coefficient
`(2πi)⁻²` on dx∧dy; compute its value on q*β as `1/(2πi)`, equal to the
square of `1/((1+i)sqrt(π))`, and its value on the pullback by the
coordinate flip as `−1/(2πi)`. This calibrates the odd pairing constant
and the exterior product together, including the ordered suspension
sign.

An arbitrary complex cyclic class need not pair integrally. N3 proves
integrality for the normalized Fredholm Chern character. Give the trace
pairing and a scalar multiple of it that has a noninteger value on [1].
Include N1.Cyclic's matrix Morita invariance and the point normalization. For Bott
use the inverse-closed dense Fréchet algebra `𝒮(ℝ²)⊂C₀(ℝ²)` with
ordered coordinates (s,t), orientation ds∧dt and the cyclic cocycle
`φ_B(f₀,f₁,f₂)=(2πi)⁻¹∫_ℝ² f₀ df₁∧df₂`.
Build its continuity and inverse-closedness. Take the tautological
projection of the sphere, `p(z)=(1+|z|²)⁻¹[[|z|²,z],[z̄,1]]` with
z=s+it, the rank-one projection onto the line through (z,1), with
`p(∞)=diag(1,0)`, and define the smooth Bott projection β in
`M₂(𝒮(ℝ²)⁺)` as its pullback by a smooth radial map of the plane into
the sphere that is the identity on a disk, sends the complement of a
larger disk to ∞ and has degree +1, so that β equals p(∞) off a compact
disk and its difference from p(∞) has Schwartz entries. Compute
`⟨β,[φ_B]⟩=+1` and the scalar constant-projection contribution zero.
These formulas fix the sign of the smooth Bott class and keep it
distinct from a separately chosen geometric Chern–Weil convention.

### Examples

The elementary matrix `1+aE_ij` pairs to zero with every odd cocycle; the
trace on ℂ pairs an idempotent of M_n(ℂ) to its rank; the circle cocycle ψ
pairs `[z^k]` to `k/((1+i)sqrt(π))`; the Bott projection pairs to +1 with
φ_B and the product circle cocycle takes the value `1/(2πi)` on q*β.

### Dependencies

*Needs:* N1.Cyclic; Tau Ceti `cyclicCohomology.matrixExtension`, `cyclicCohomology.evenPairing`, `cyclicCohomology.oddPairing`, `evenPairingK0`, `AlgebraicK1.oddPairing` and the even Chern chains; Mathlib `Matrix.GeneralLinearGroup`, `Matrix.transvection`, `CStarMatrix` and `cfc`.

## N3. Fredholm modules and their finite characters

A Fredholm cycle over A is a representation π of A on a Hilbert space H
with a bounded operator F such that `[F,π(a)]`, `(F²−1)π(a)` and
`(F−F*)π(a)` are compact for every a. For such a cycle construct the
self-adjoint replacement `(F+F*)/2` and its class-preserving
compact-perturbation homotopy.
Define even
and odd Fredholm modules with bounded representation π, F*=F,
`[F,π(a)]` compact and `(F²−1)π(a)` compact; even modules carry the
specified γ. In the unital normalized case an even cycle on a separable
Hilbert space is a self-adjoint involution F, odd for a self-adjoint
involutive grading commuting with π, with every `[F,π(a)]` compact.
Develop unitary equivalence, direct sums, degenerate cycles,
compact perturbation, homotopy and the Fredholm compressions `π(e)Fπ(e)`
(Mathlib `ContinuousLinearMap.IsFredholm`). Build
normalization to F²=1 by first applying functional calculus to replace F
by the self-adjoint contraction `sin(πF/2)`, preserving the essential
values ±1 and its cycle class, and then doubling
on H⊕H with representation π⊕0 and operator
`F′=[[F,sqrt(1−F²)],[sqrt(1−F²),−F]]`.
In even parity use grading `diag(γ,−γ)`. Prove the off-diagonal
terms multiplied by π(a) compact, the cycle homotopy, F′²=1 and
agreement of the index with the original compression wherever that
compression is Fredholm. Extend this normalized cycle to the
forced unitization. Finite-dimensional augmentation suffices when the
defect has finite rank, including the finite kernel in N5; it is not
the general normalization construction. Define the index pairing of a
normalized module with an idempotent in even parity and with an
invertible in odd parity as the Fredholm index of the compressions
below, with the unitization conventions fixed here: the even
compression acts on π(1)H and the odd extension of a unitary is by the
identity on the complement of π(1)H.

The Hilbert-space objects every trace, character and Dixmier-trace
statement below uses live on B(H), with OperatorIdeals' singular values
μ_j, which are the zero-indexed approximation numbers of the pinned
operator-ideal families, and its Schatten classes S_p, 1≤p≤∞, the
pinned `OperatorIdealFamily.schatten` and `OperatorIdealFamily.traceClass`
for p<∞. For 0<p<1 the quasi-ideal `S_p={T compact : Σ_j μ_j(T)^p<∞}`
with `‖T‖_p=(Σ_j μ_j(T)^p)^(1/p)` is NoncommutativeIntegration's
Lp(B(H),Tr), by its identification `μ_t(T)=a_⌊t⌋(T)` (§1.5), and its
p-triangle inequality `‖S+T‖_p^p≤‖S‖_p^p+‖T‖_p^p` (Fack–Kosaki,
Theorem 4.9(iii), p. 295), the ideal bounds `‖ATB‖_p≤‖A‖‖T‖_p‖B‖`,
adjoint invariance `‖T*‖_p=‖T‖_p` and completeness of the p-metric
`(S,T)↦‖S−T‖_p^p` are its §1.3 at M=B(H). Hölder's inequality
`‖ST‖_r≤‖S‖_p‖T‖_q` for 0<p,q≤∞ with 1/r=1/p+1/q and constant one
(Fack–Kosaki, Theorem 4.2(i), p. 286) is its §1.4 at M=B(H), the cases
with p or q infinite being the ideal bound; the log-submajorization of
§1.4 (Fack–Kosaki, Theorem 4.2(ii)), read at the integer t=n, is the
multiplicative majorization `∏_(j<n)μ_j(ST)≤∏_(j<n)μ_j(S)μ_j(T)` for
compact S, T, while the mixed-index inequality `μ_(j+k)(ST)≤μ_j(S)μ_k(T)`
of OI-A22 alone gives only the constant `2^(1/r)`. Deduce from Hölder,
by induction on k≥1, `S_(p₁)⋯S_(p_k)⊆S_p` for 1/p=Σ_j 1/p_j, with
`‖T₁⋯T_k‖_p≤‖T₁‖_(p₁)⋯‖T_k‖_(p_k)`. Prove the inclusions S_p⊆S_q for
0<p≤q with `‖T‖_q≤‖T‖_p`, from `μ_j(T)≤‖T‖_p` for every j; the pin has
them for 1≤p≤q (`OperatorIdealFamily.gauge_schatten_le_of_le`,
`OperatorIdealFamily.finiteSubmodule_schatten_le_of_le`). These inclusions are particular to B(H), whose minimal
projections have trace one, and NoncommutativeIntegration §1.5 asserts
none for an infinite trace. The trace
`Tr(T)=Σ_j⟨e_j,Te_j⟩` of a trace-class operator, its independence of the
orthonormal basis, `Tr|T|=‖T‖₁`, hence `Tr T=Σ_j μ_j(T)` for positive T,
the bound `|Tr T|≤‖T‖₁`, which is the norm identity `‖x↦Tr(xT)‖=‖T‖₁`
evaluated at x=1, and `Tr(AT)=Tr(TA)` for bounded A and trace-class T
are VonNeumannAlgebras V4.Core's; `Tr(T*)=conj(Tr T)` holds termwise in
the defining series. The cyclicity `Tr(ST)=Tr(TS)` for S∈S_p, T∈S_q
with 1/p+1/q=1 and 1<p<∞ (Connes IV.1, p. 300), which the cyclicity of
the characters below uses, is NoncommutativeIntegration §2.1 at M=B(H),
the cases p=1 and p=∞ being V4.Core's.

**Checks.**
- `diag((j+1)^(−3))` lies in S_p exactly when p>1/3: in S_(1/2), not in
  S_(1/3); summing μ_j in place of μ_j^p would make every S_p with p<1
  equal to S_1.
- For p=1/2, S=diag(1,0) and T=diag(0,4): `‖S‖_(1/2)=1`, `‖T‖_(1/2)=4`,
  `‖S+T‖_(1/2)=(1+2)²=9>5`, so the triangle inequality fails, while the
  p-th powers give `3≤1+2` with equality: the constant one in the
  p-triangle inequality is attained.
- Multiplicative, not termwise: S=diag(2,1), T=[[1,1],[0,1]] has
  `μ(T)=((1+sqrt 5)/2,(sqrt 5−1)/2)≈(1.618,0.618)` and
  ST=[[2,2],[0,1]] has `μ(ST)²=(9±sqrt 65)/2`, `μ(ST)≈(2.921,0.685)`;
  `μ_1(ST)=0.685>0.618=μ_1(S)μ_1(T)`, so `μ_j(ST)≤μ_j(S)μ_j(T)` is
  false, while `μ_0(ST)≤3.236` and the products are both 2, the
  determinants.
- Hölder with constant one: S=diag(2,1), T=diag(1,2) give
  `‖ST‖₁=4≤‖S‖₂‖T‖₂=5`, and S=T=I₂ gives `‖I₂‖₁=2=sqrt 2·sqrt 2`, so the
  constant is attained and `2^(1/r)` is not the sharp bound.
- Direction of the inclusions: T=diag(1,1) has `‖T‖_(1/2)=(1+1)²=4`,
  `‖T‖₁=2` and `‖T‖₂=sqrt 2`, decreasing in p, and `diag((j+1)^(−2))`
  lies in S₁, with trace `π²/6`, but not in S_(1/2), since
  `Σ_j(j+1)^(−1)` diverges: the inclusion runs from small to large p, and
  `S_q⊆S_p` for p<q is false.
- For S=T=diag(1/(j+1)), each in S_p exactly when p>1, the product
  `ST=diag(1/(j+1)²)` lies in S_r exactly when r>1/2. The ideal property
  alone places ST in S_p for p>1 only; Hölder with p=q↓1 gives every
  r>1/2, and r=1/2 itself fails, so the exponent law is sharp on this
  example.
- Cyclicity on dual Schatten classes beyond V4.Core's cases: on ℓ²(ℕ)
  let `Se_j=(j+1)^(−2/5)e_(j+1)` and `Te_(j+1)=(j+1)^(−7/10)e_j`, `Te₀=0`.
  The singular values of S are `(j+1)^(−2/5)`, so S∈S₃∖S₂, and those of T
  are `(j+1)^(−7/10)`, so T∈S_(3/2)∖S₁; neither factor is trace class and
  S is not Hilbert–Schmidt. Then `ST=diag(0,1,2^(−11/10),3^(−11/10),…)`
  and `TS=diag(1,2^(−11/10),3^(−11/10),…)` are different operators with
  the same trace `ζ(11/10)≈10.584`. The exponent condition cannot be
  weakened: with 1/p+1/q=2/3, replacing the weights of T by `(j+1)^(−2/5)`
  puts T in S₃, and ST has diagonal `(j+1)^(−4/5)`, which is not summable.
- Cyclicity needs a trace-class factor: for the unilateral shift S on
  ℓ²(ℕ), `S*S−SS*` is the rank-one projection onto e₀, of trace 1, so
  `Tr(AB)=Tr(BA)` fails for bounded A, B whose commutator is trace
  class; this is why the conditional trace Tr′ below is not Tr.
- The odd character on the circle fixes the sign of λ_n. On ℓ²(ℤ) with
  `ze_k=e_(k+1)` and F=2P_Hardy−1, P_Hardy the projection onto the span
  of the e_k with k≥0, the commutator `[F,z]` is the rank-one map
  `e_(−1)↦2e_0`, so `τ₁(z⁻¹−1,z−1)=Tr(z⁻¹[F,z])−Tr([F,z])=2−0=2`.
  With the odd `λ₁=−(1+i)Γ(3/2)=−(1+i)sqrt(π)/2` and N2's pinned odd
  factor `(1+i)⁻¹2⁻¹Γ(3/2)⁻¹`, `⟨[z],Ch₁⟩=−1=ind(P_Hardy z P_Hardy)`,
  the forward shift having zero kernel and cokernel spanned by e_0.
  With the same pinned factor, the coefficient
  `sqrt(2i)Γ(3/2)=(1+i)sqrt(π)/2` printed in Connes IV.1, Definition 3,
  p. 302, gives +1, which is `ind(P_Hardy z⁻¹ P_Hardy)`.
- The index pairing runs from π(e)H⁺ to π(e)H⁻. On the even module
  ℂ²⊕ℂ² over M₂(ℂ) with π=id⊕0, γ=diag(1,−1) and F the swap, the
  idempotent `e=[[1,a],[0,0]]`, a≠0, has e²=e≠e* and range the first
  coordinate line; its compression maps that line to π(e)H⁻=0, with
  index 1=`Tr′(γπ(e))`=Tr e, while the compression from π(e)H⁻ to
  π(e)H⁺ has index −1. The projection diag(1,0), similar to e, gives the
  same index 1.
- The domain of Tr′ is larger than the trace class. On ℓ²(ℤ) with
  F=2P_Hardy−1, the unitary `Te_k=e_(−k−1)` exchanges the spectral
  subspaces of F, so `FT+TF=0` and `Tr′(T)=½Tr(F·0)=0`, although T is not
  compact; a conditional trace defined as Tr on S₁ only would leave T
  outside its domain.
- The doubling must reverse F in the second corner. For the scalar
  contraction F=1/2 on ℂ, `F′=[[1/2,sqrt(3)/2],[sqrt(3)/2,−1/2]]` has
  F′²=1 and trace 0, so (1+F′)/2 is a projection of rank one; with +F in
  the lower corner the square has off-diagonal entries `sqrt(3)/2≠0`. The
  sine replacement keeps the essential values: if F=±1 on two
  infinite-dimensional summands and F=3 on a finite-rank one, then
  `sin(πF/2)` is ±1 on the first two and −1 on the third, so
  `sin(πF/2)²−1=0`, while the rescaled contraction F/3 has
  `(F/3)²−1=−8/9` on an infinite-dimensional subspace, which is not
  compact.

For normalized F and a chosen dense smooth algebra require
`[F,π(a)]∈S_p` for every a (Connes IV, introduction, Definition 3,
p. 296, for p≥1), and continuity of this commutator map
into its Schatten norm or quasi-norm. Prove matrix, sum, algebra-product,
dagger and perturbation estimates. Construct the conditional trace
`Tr′(T)=½Tr(F(FT+TF))` when FT+TF is trace class (Connes IV.1, p. 299).
Establish its
linearity and the graded commutator identities on its precise domain.
For integer n with the correct parity and n+1≥p define

`τ_n(a₀,…,a_n)=Tr′(π(a₀)[F,π(a₁)]⋯[F,π(a_n)])`,

with γ inserted before π(a₀) in even parity. For the displayed operator
T prove FT+TF trace-class by Hölder and the n+1-commutator identity;
T itself need not be trace-class. Establish
continuity, cyclicity and bτ_n=0, through the cycle of Connes IV.1,
Proposition 1, p. 299. Construct transgressions between
same-parity degrees and smooth homotopies. Normalize the periodic
character by `Ch_n=λ_n τ_n`, where

`λ_n=(−1)^(n(n−1)/2)Γ(n/2+1)` in even parity (Connes IV.1, Definition 3, p. 302),

and multiply this by −(1+i) in odd parity. With N2's positive odd
pairing factor, this sign makes the character agree with the index of
compression by P=(1+F)/2. Pin the degree-one calibration on the circle:
for F=2P_Hardy−1 and the positive winding unitary u,
`τ₁(u⁻¹−1,u−1)=2`, while `ind(P_Hardy u P_Hardy)=−1`,
so `⟨[u],Ch₁⟩=−1`. Prove independence of the
sufficiently large same-parity representative and compatibility with S
(Connes IV.1, Proposition 2, p. 300).
For nonexact self-adjoint contraction cycles impose explicitly
`[F,π(a)]∈S_p` and `sqrt(1−F²)π(a), π(a)sqrt(1−F²)∈S_p`,
continuously in a. Prove these bounds give p-summable doubled cycles.
These are additional summability hypotheses, distinct from the compact
defects of an arbitrary Fredholm cycle.
Also prove that the usual bounds `[F,π(a)]∈S_p` and
`(F²−1)π(a)∈S_p`, with their adjoint/continuity bounds, give an
S_(2p)-summable doubled cycle by square-root estimates. Prove the
power-series commutator bounds for the sine replacement, using
p-subadditivity when p<1, before applying these square-root estimates.
Use a sufficiently large same-parity degree n+1≥2p in that case.

Prove the character index theorem on idempotents, with no replacement
of idempotents by projections: for an idempotent e of `M_q(Ã)`, with
e²=e and possibly e≠e*, and the amplified module `(H⊗ℂ^q, F⊗1, π⊗id)`,
the even pairing with e is the index of `π(e)F⁺π(e):π(e)H⁺→π(e)H⁻`, a
map between the closed ranges of the bounded idempotent π(e) on the two
gradings whose quasi-inverse is the compression of F from π(e)H⁻ back to
π(e)H⁺ (Connes 1985, Part I, Appendix 2, Proposition 5, p. 91; Connes
IV.1, Proposition 4, p. 303, whose proof represents the class by an
idempotent, with the amplification of Connes IV, introduction,
Proposition 2, which Connes cites as Proposition 0.2, p. 295); the odd
pairing with an invertible u is `ind(Pπ̃(u)P)` on PH, with P=(1+F)/2
and forced unitization where needed. For a unital algebra acting
nonunitally replace π(u) by `π(u)+I−π(1)`. Construct the trace index
identity and its perturbation/finite-kernel argument before proving
integrality; the index is Mathlib's `LinearMap.index` of the
compression, and its compact-perturbation and homotopy invariance are
the pinned Fredholm perturbation theorems of the Tau Ceti contract.
Work out point
cycles, among them the even module ℂ²⊕ℂ² over M₂(ℂ) with π=id⊕0, γ=diag(1,−1) and F the
swap of the two summands, on which the idempotent `e=[[1,a],[0,0]]`,
a≠0, compresses from the line eℂ² to π(e)H⁻=0 with index 1, equal to
`Tr′(γπ(e))=Tr e=1` and to the index of the projection diag(1,0); the
circle Hardy/shift compression with index −1 for the forward
shift and +1 for its adjoint, a finite matrix
amplification and a nonsummable compact-commutator cycle. Summability
is a condition on the specified smooth algebra, not automatically on
the whole C*-completion.

### Examples

The point cycle, with the idempotent `[[1,a],[0,0]]` of M₂(ℂ) of
compression index 1; the circle Hardy compression with
`ind(P_Hardy u P_Hardy)=−1` and `⟨[u],Ch₁⟩=−1`; a nonsummable
compact-commutator cycle; the half-exchanging unitary on ℓ²(ℤ) with
`Tr′=0` outside the trace class; the doubling of F=1/2. On B(H):
`diag((j+1)^(−3))` in S_p exactly for
p>1/3, `diag(1/(j+1))²` in S_r exactly for r>1/2, `diag((j+1)^(−2))` in
S₁ but not in S_(1/2), Hölder attained on `I₂`, the weighted shifts in
S₃ and S_(3/2) whose products ST≠TS have the same trace `ζ(11/10)`, and
the shift with `Tr(S*S−SS*)=1`.

### Dependencies

*Needs:* N1.Cyclic, N2; OperatorTheory/OperatorIdeals Parts A–B (OI-A17, OI-A20, OI-A22, OI-A30, OI-B29–B30); Tau Ceti `OperatorIdealFamily.schatten` and `OperatorIdealFamily.traceClass`, `TauCeti.isFredholm_one_add`, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator`, `ContinuousLinearMap.index_add_of_isCompactOperator`, `ContinuousLinearMap.IsFredholm.eventually_isFredholm_and_index_eq`, `Continuous.index_eq_of_preconnectedSpace` and `Path.index_eq`; VonNeumannAlgebras V4.Core (the trace on trace class and its cyclicity against bounded operators); NoncommutativeIntegration §1.3–§1.5 and §2.1 at M=B(H) (the quasi-ideals S_p for 0<p<1, Hölder's inequality with the multiplicative majorization, and the cyclicity on dual Schatten classes); Mathlib `ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage`, `IsFredholm.index_comp`, `LinearMap.index` and `cfc`.

## N4. Weak ideals, generalized limits and Dixmier traces

The Marcinkiewicz logarithmic trace ideal

`L^(1,∞)={T compact : sup_(N≥1) (log(1+N))⁻¹ Σ_(j<N)μ_j(T)<∞}`,

on OperatorIdeals' singular values, is the pinned
`OperatorIdealFamily.logarithmic`, with its quasi-norm, ideal laws,
completeness, adjoint and unitary invariance, compactness of its members
and the finite-rank and trace-class inclusions. Distinguish it from the
weak trace class `S_(1,∞)={T: sup_(j≥0)(j+1)μ_j(T)<∞}`, defined from
the same singular values, which is NoncommutativeIntegration's weak
L¹(B(H),Tr) (§1.6), and construct a diagonal operator in the former but
not the latter. For p>1 the weak Schatten ideal `L^(p,∞)`, given by
`sup_(j≥0)(j+1)^(1/p)μ_j(T)<∞`, is NoncommutativeIntegration's weak
Lp(B(H),Tr) (§1.6), with its quasi-norm, adjoint and ideal bounds. Prove
its equivalent partial-sum description
`sup_(N≥1)N^(1/p−1)Σ_(j<N)μ_j(T)<∞`, which is a Banach norm (Connes IV,
Appendix C, p. 453), with the comparison constants `p/(p−1)` one way and
1 the other, and compare its power/product estimates with the logarithmic
ideal. In particular `T∈L^(n,∞)` implies `|T|^n∈L^(1,∞)`, since
`μ_j(|T|^n)=μ_j(T)^n≤C^n/(j+1)`.
For n=1 use the logarithmic ideal itself. Do not replace the logarithmic p=1
ideal by the smaller pointwise singular-value condition.

Positive generalized limits on bounded real sequences which extend
ordinary limits, their invariance under integer dilations, including
duplicating entries, and the existence of dilation-invariant ones by
positive extension and an invariant-mean argument are the pinned
`GeneralizedLimit` and `IsDilationInvariant`; develop restrictions,
rescalings and complex linear extension. For positive T the pinned
`dixmierTrace` is Dixmier's trace (Connes IV.2, Definition 2, p. 312)

`Tr_ω(T)=Lim_ω((log(1+N))⁻¹ Σ_(j<N)μ_j(T))`,

with its positivity, positive homogeneity, subadditivity, the bound
`Tr_ω(ATB)≤‖A‖Tr_ω(T)‖B‖`, unitary and adjoint invariance and vanishing
on trace class; on a non-positive T it takes the value `Tr_ω(|T|)`.
Prove that, for a dilation-invariant ω, Tr_ω is additive on the positive
part of `L^(1,∞)`: `Tr_ω(S+T)=Tr_ω(S)+Tr_ω(T)` for positive S, T in
`L^(1,∞)` (Connes IV.2, p. 312, after Definition 2, from the inequalities
and the duplication condition (γ) on p. 311). The pinned subadditivity
gives ≤. For ≥, Ky Fan superadditivity with k=l=N gives
`σ_N(S)+σ_N(T)≤σ_(2N)(S+T)`; dividing by `log(1+N)`, the right side is
`(log(1+2N)/log(1+N))·m(2N)` for the means
`m(N)=σ_N(S+T)/log(1+N)`, and `log(1+2N)/log(1+N)→1` with m bounded. It
remains to show `ω(N↦m(2N))=ω(m)`: the dilation by 2 of `N↦m(2N)` is
`n↦m(2⌊n/2⌋)`, which differs from m by at most one consecutive difference
`m(n)−m(n−1)`, and these tend to 0 since `μ_N≤σ_N/N` and m is bounded;
a generalized limit vanishes on null sequences, and dilation invariance
(`TauCeti.GeneralizedLimit.IsDilationInvariant.map_dilate`) identifies
the two. Membership and positivity are both needed for the pinned
functional: for positive S outside `L^(1,∞)` and `T=diag(1/(j+1))`,
S+T lies outside `L^(1,∞)` and `Tr_ω(S+T)=0≠0+1`; for
`S=diag(1/(j+1))` and T=−S, `Tr_ω(S+T)=0≠1+1`. For dilation-invariant ω
construct here the linear Dixmier trace, the complex-linear functional on
L^(1,∞) that agrees with `dixmierTrace` on positive operators, and prove
`Tr_ω(AT)=Tr_ω(TA)` for bounded A (Connes IV.2, Proposition 3(b),
p. 312) and its boundedness. From here on, Tr_ω of an operator that is
not positive means this linear functional for a dilation-invariant ω,
not the pinned value `Tr_ω(|T|)`.
Prove that, for infinite-dimensional H, no Dixmier trace is the
restriction to `L^(1,∞)` of a normal (ultraweakly continuous) functional
on B(H), which by the trace-class duality of VonNeumannAlgebras V4.Core
is `T↦Tr(ρT)` for a trace-class ρ: such a functional vanishing on every
rank-one operator `ξ⊗η*:x↦⟨η,x⟩ξ` has `Tr(ρ(ξ⊗η*))=⟨η,ρξ⟩=0` for all
ξ, η, hence ρ=0, while Tr_ω vanishes on the finite-rank operators and
takes the value 1 on `diag(1/(j+1))` in an orthonormal sequence. On a
finite-dimensional H every operator has finite rank, so Tr_ω=0 is the
restriction of the normal functional with ρ=0.
A general positive extension of limits
without dilation invariance is not asserted to give an additive trace.
Call T measurable when all Tr_ω with dilation-invariant ω agree; prove
ordinary convergence of the logarithmic means a sufficient condition.

**Checks.** Write `N_k=2^(2^k)`, so that `log N_(k+1)=2 log N_k`, and
`σ_N(T)=Σ_(j<N)μ_j(T)`.
- For `T=diag(1/(j+1))`, `σ_N=H_N=log N+γ+o(1)`, so
  `σ_N/log(1+N)→1` and `Tr_ω(T)=1` for every ω; T is measurable and not
  trace class. For any finite-rank R, `Tr_ω(T+R)=Tr_ω(T)=1`, since Tr_ω
  vanishes on trace class; a functional of the form `Tr(ρ·)` would see R.
- Additivity needs the doubled index: on ℓ²⊕ℓ² let `S=diag(1/(j+1))⊕0`
  and `T=0⊕diag(1/(j+1))`. Then S+T has each value 1/(j+1) twice, so
  `σ_N(S)+σ_N(T)=2H_N=σ_(2N)(S+T)` while `σ_(2M)(S+T)=2H_M`; at
  N=10⁶ the first is 28.786 and `σ_N(S+T)` is 27.399, strictly smaller,
  with logarithmic means 2.084 and 1.983, both tending to 2. So
  `Tr_ω(S+T)=2=Tr_ω(S)+Tr_ω(T)`, which a comparison of `σ_N(S+T)` with
  `σ_N(S)+σ_N(T)` at the same N cannot reach: superadditivity holds only
  with 2N on the right. Here the means converge, so the equality holds
  for every ω; in general the passage from 2N back to N uses dilation
  invariance.
- Linear against pinned on operators that are not positive: for
  `T=−diag(1/(j+1))` the linear Dixmier trace is −1, while the pinned
  value `Tr_ω(|T|)` is 1 for T and for −T, so the pinned functional is not
  linear. For `T=diag(1/(j+1))⊕(−diag(1/(j+1)))` on ℓ²⊕ℓ², the linear
  value is `1−1=0` for every dilation-invariant ω. The pinned value is 2,
  since |T| takes each value 1/(j+1) twice and `σ_(2M)(|T|)=2H_M`.
- The diagonal operator with `μ_j=1` for j<4 and, for k≥1, `μ_j=k/N_k` on
  `[N_k,2N_k)` and `μ_j=(k+1)/N_(k+1)` on `[2N_k,N_(k+1))` is
  non-increasing, has `(j+1)μ_j=2k` at `j=2N_k−1`, hence lies outside
  `S_(1,∞)`, while `σ_N≤4+Σ_(i≤k)(2i+1)≤(k+2)²` for `N<N_(k+1)` and
  `log(1+N)≥2^k log 2` for `N≥N_k`, so `σ_N/log(1+N)` is bounded and T
  lies in `L^(1,∞)`: the two ideals differ, and a definition of `L^(1,∞)`
  by the pointwise condition would exclude this T.
- For `T=diag(1/((j+2)log(j+2)))`, `σ_N=log log N+O(1)` while
  `Σ_j μ_j=∞`: T is not trace class, yet `Tr_ω(T)=0` for every ω.
- Dependence on ω: let `μ_j=1/(j+1)` on `[N_(2k),N_(2k+1))`,
  `μ_j=1/(2(j+1))` on `[N_(2k+1),N_(2k+2))`, replaced on
  `[N_(2k+2),2N_(2k+2))` by the constant `1/(2N_(2k+2))` so that the
  sequence is non-increasing, with `μ_0=μ_1=1`. With `r_k=σ_(N_k)/log N_k`
  and `c_k=1` for even k, `1/2` for odd k, one has `r_(k+1)=(r_k+c_k)/2+o(1)`,
  so `r_(2k)→2/3` and `r_(2k+1)→5/6`: the logarithmic means do not converge.
  Composing the logarithmic Cesàro mean `M` with a generalized limit along
  `N_(2k)`, respectively `N_(2k+1)`, gives two dilation-invariant ω, and
  the block integrals `∫_(L)^(2L)(r L+c(t−L))/t dt=(r−c)L log 2+cL` give
  `Tr_ω(T)=2/3+(log 2)/9≈0.744` for the first and
  `5/6−(log 2)/9≈0.756` for the second. T lies in `L^(1,∞)` and is not
  measurable; a definition of Tr_ω by an ordinary limit would be undefined
  on it.

Prove the logarithmic Hardy–Littlewood/Karamata Tauberian bridge used
here, including its monotonicity/positivity and summation-by-parts
estimates: for positive T∈L^(1,∞),
`lim_(s↓1)(s−1)Tr(T^s)=L` iff the logarithmic partial-sum means
converge to L (Connes IV.2, Proposition 4, p. 313). Deduce Tr_ω(T)=L
and the simple-pole residue formula.
This elementary Tauberian theorem is built here; the Wiener–Ikehara
supplier in ArithmeticDirichletSeries is not a substitute. Work out
the diagonal sequence 1/(j+1) and finite-rank perturbations. N7 owns
the Fourier lattice example using this Tauberian bridge. No general pseudodifferential residue
formula is imposed on arbitrary members of this ideal.

### Examples

`diag(1/(j+1))` with `Tr_ω=1` for every ω; the pair
`diag(1/(j+1))⊕0`, `0⊕diag(1/(j+1))` with `σ_N(S)+σ_N(T)=σ_(2N)(S+T)` and
`Tr_ω(S+T)=2`; the block-diagonal operator in
`L^(1,∞)∖S_(1,∞)`; `diag(1/((j+2)log(j+2)))` with `Tr_ω=0` and divergent
trace; the non-measurable operator with Dixmier traces `2/3+(log 2)/9` and
`5/6−(log 2)/9`.

### Dependencies

*Needs:* NoncommutativeIntegration §1.4 and §1.6 at M=B(H) (Hölder's inequality, the weak Schatten classes and the weak trace class `S_(1,∞)` with their quasi-norm, adjoint and ideal bounds); VonNeumannAlgebras V4.Core (the trace on trace class and the trace-class duality of B(H)); Tau Ceti `OperatorIdealFamily.logarithmic`, `GeneralizedLimit`, `IsDilationInvariant`, `TauCeti.GeneralizedLimit.IsDilationInvariant.map_dilate`, `dixmierTrace` and `ContinuousLinearMap.IsPositive.kyFanGauge_add_kyFanGauge_le`; OperatorTheory/OperatorIdeals Part A (OI-A17, OI-A20, OI-A22, OI-A30) and Part B.

## N5. Spectral triples and the Hochschild class

For a self-adjoint `LinearPMap` D, compact resolvent means that its
bounded inverse `(D−i)⁻¹` is compact; the pin compares this with the
native `(i−D)⁻¹` convention and proves compactness of one nonreal
resolvent equivalent to compactness at all nonreal parameters, that
`K=(1+D²)⁻¹=((D−i)⁻¹)* (D−i)⁻¹` is compact, positive and injective,
that its nonzero eigenspaces are finite-dimensional, contained in
Dom(D²) and invariant under D, and, diagonalizing D on each of them,
that D has a complete orthonormal eigenbasis with real eigenvalues.
Prove every bounded interval contains only finitely many eigenvalues,
counting multiplicity, and give the graph-domain series criterion
`Σ_j(1+|λ_j|²)|ξ_j|²<∞`.
In this basis define f(D) on
`{ξ:Σ_j |f(λ_j)|²|ξ_j|²<∞}` for Borel f, proving domain,
closedness, adjoint and composition laws and independence of the
eigenbasis. Compare its spectral projections with the spectral measure of
SelfAdjointSpectralTheory SA-E.
This supplies |D|, sign D, heat operators and inverse powers, including
their kernel conventions, for the compact-resolvent triples here.

A unital spectral triple on a separable Hilbert space consists of a
self-adjoint `LinearPMap` D whose resolvent at i is compact, whose domain
π(A) preserves, with `[D,π(a)]` agreeing on that domain with a bounded
operator depending linearly on a.
Develop spectral triples (𝒜,H,D), their even/odd versions, operator-domain
invariance, bounded commutator extension, graph-norm estimates and
unitary/smooth-algebra transport. Build `[D,ab]=[D,a]b+a[D,b]`
and dagger identities on the common domain before extending boundedly.
Construct the bounded transform `F_D=D(1+D²)^(−1/2)` from this
calculus, `F_Dξ_j=λ_j(1+λ_j²)^(−1/2)ξ_j` on the eigenbasis: a self-adjoint
contraction with `1−F_D²=(1+D²)⁻¹` compact. Prove `[F_D,π(a)]` compact for
every a, so that (H,F_D), with γ in the even case, is a Fredholm module of
N3, and compare the resulting Fredholm class with N3; prove the Schatten
bounds `[F_D,π(a)]∈S_p` from stated spectral summability.

**Checks.**
- For D=diag(0,1,−1), `F_D=diag(0,1/√2,−1/√2)` and
  `1−F_D²=diag(1,1/2,1/2)=(1+D²)⁻¹`; the phase `sign D=diag(0,1,−1)` has
  `1−(sign D)²=diag(1,0,0)`, the kernel projection, so it is not the
  bounded transform.
- On the same D, `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)` and
  `((D−i)⁻¹)*(D−i)⁻¹=diag(1,1/2,1/2)=(1+D²)⁻¹`; the native `(i−D)⁻¹` is
  its negative and gives the same K. For D=diag(j), j∈ℕ, the eigenvalues
  of K are `1/(1+j²)`, each simple, and ker K=0, since `Kξ=0` forces
  `‖(D−i)⁻¹ξ‖²=⟨ξ,Kξ⟩=0`.
- Compact resolvent against bounded D: for D=diag(j) on ℓ²(ℕ) the interval
  [−R,R] contains ⌊R⌋+1 eigenvalues and `(D−i)⁻¹` has singular values
  `(1+j²)^(−1/2)→0`, so it is compact; for the bounded self-adjoint
  D=diag(1−1/(j+1)) every eigenvalue lies in [0,1] and `(D−i)⁻¹` has
  singular values `|1−1/(j+1)−i|⁻¹→1/√2`, so it is not compact; for D=0
  on an infinite-dimensional H, `(D−i)⁻¹=iI` is not compact. No bounded
  D on an infinite-dimensional space has compact resolvent, and a
  definition of compact resolvent by compactness of `(D−i)⁻¹` on the
  eigenvectors alone would not exclude these.
- The graph-domain criterion for D=diag(j): `ξ_j=1/(j+1)` has
  `Σ_j(1+j²)/(j+1)²=∞`, so ξ∈ℓ² is not in Dom(D), while
  `ξ_j=1/(j+1)²` has `Σ_j(1+j²)/(j+1)⁴<∞` and lies in Dom(D). The form
  criterion `Σ_j|λ_j||ξ_j|²<∞` is weaker: `ξ_j=(j+1)^(−3/2)` has
  `Σ_j j/(j+1)³<∞` but `Σ_j(1+j²)/(j+1)³=∞`, and `Dξ=(j(j+1)^(−3/2))_j`
  is not in ℓ².

Develop resolvent, heat-functional-calculus and truncation
estimates needed for these assertions without invoking manifold
elliptic theory.

Let δ(T) be the bounded extension of `[|D|,T]` for operators preserving
Dom|D|. Define its closed derivation domain, iterated domains and smooth
intersection; prove completeness for graph seminorms, Leibniz, star,
inverse and matrix rules and functional-calculus stability, with
`δ(T*)=−δ(T)*` and the corresponding iterated signs. Regularity
requires both π(a) and `[D,π(a)]` in every δ-domain, with continuous
maps from the selected Fréchet algebra. Establish the commutator and
resolvent estimates used in the character comparison; regularity is
not only smoothness of π(a).

For integer n≥1 of the module's parity, initially invertible D, assume
D⁻¹∈L^(n,∞), F=sign D, and the preceding regularity and bounded
commutators. Prove finite summability in every larger exponent and
construct N3's character. Prove the Hochschild-class theorem: for every
dilation-invariant generalized limit ω, with N4's linear Dixmier trace
Tr_ω, and

`φ_ω(a₀,…,a_n)=λ_n Tr_ω(π(a₀)[D,π(a₁)]⋯[D,π(a_n)]|D|⁻n)`,

with γ inserted in even parity and N3's λ_n, prove bφ_ω=0 and equality
with the Chern-character evaluation on every Hochschild n-cycle
(Connes IV.2, Theorem 8, p. 315, for the limits of IV.2, p. 312, a
positive functional at infinity composed with the logarithmic Cesàro
mean M, which are dilation invariant; Carey–Rennie–Sukochev–Zanin,
Theorem 16, p. 9, for every dilation-invariant ω).
Develop the trace-ideal/domain estimates, resolvent transgression and
finite truncations that prove the comparison. The cochain can depend
on ω, while its cycle evaluation is the same for every dilation-invariant
ω. State the
character as a periodic cyclic class and its Hochschild image; do not
identify arbitrary representatives as equal cochains.

Extend to finite-dimensional kernel by defining |D|⁻n to be zero on
the kernel and constructing the finite-dimensional augmentation and
character comparison explicitly. Pin the finite-rank corrections and
index contribution; simply writing sign(0)=0 does not make F²=1.
Compare diagonal spectral models with different summability exponents.
This is the Hochschild class of the index character, not the full
local index formula.

**Checks.**
- The circle, n=1. On ℓ²(ℤ) with `ze_k=e_(k+1)` let `D=diag(k+1/2)`,
  invertible, with sign D=2P_Hardy−1, N3's circle F. Then `[D,z]=z`, and
  δ(z)=[|D|,z] is the weighted shift with weights 1 for k≥0, 0 for k=−1
  and −1 for k≤−2, whose powers δ^m(z) have weights in {0,1,−1}, so z,
  z⁻¹ and their commutators with D lie in every δ-domain. The singular
  values of `|D|⁻¹` are 2,2,2/3,2/3,2/5,…, with
  `σ_(2M)(|D|⁻¹)=4(H_(2M)−H_M/2)=2log M+O(1)`, so D⁻¹∈L^(1,∞) and
  `Tr_ω(|D|⁻¹)=2` for every ω. On the Hochschild cycle z⁻¹⊗z, a cycle
  since `b(z⁻¹⊗z)=z⁻¹z−zz⁻¹=0`, `φ_ω(z⁻¹,z)=λ₁Tr_ω(|D|⁻¹)=2λ₁`, and
  N3's character gives `λ₁τ₁(z⁻¹,z)=λ₁Tr(z⁻¹[F,z])=2λ₁`: the two
  agree, as the theorem requires.
- The absolute value in `|D|⁻ⁿ` is needed: on the same D the positive
  and negative parts of D⁻¹ each have singular values 2,2/3,2/5,…, with
  Dixmier trace 1, so for every dilation-invariant ω the linear Tr_ω
  gives `Tr_ω(z⁻¹[D,z]D⁻¹)=1−1=0`,
  and a cocycle built with D⁻ⁿ would vanish on z⁻¹⊗z while the character
  does not. Replacing D by cD for c>0 changes neither `[D,a]|D|⁻¹` nor
  the value 2.

### Examples

D=diag(0,1,−1) with `F_D=diag(0,1/√2,−1/√2)` and `K=diag(1,1/2,1/2)`;
D=diag(j) on ℓ²(ℕ) with compact resolvent, ⌊R⌋+1 eigenvalues in [−R,R]
and the graph-domain witnesses `1/(j+1)∉Dom(D)`, `1/(j+1)²∈Dom(D)`; the
bounded D=diag(1−1/(j+1)) without compact resolvent; the circle
D=diag(k+1/2) on ℓ²(ℤ) with `Tr_ω(|D|⁻¹)=2` and
`φ_ω(z⁻¹,z)=2λ₁=λ₁τ₁(z⁻¹,z)`.

### Dependencies

*Needs:* N3, N4; Tau Ceti `LinearPMap.HasCompactResolvent`, the compact-resolvent eigenbasis and the Fredholm perturbation theorems of the Tau Ceti contract; OperatorTheory/SelfAdjointSpectralTheory SA-E and its `LinearPMap` closed operators; Mathlib's compact self-adjoint spectral theorem.

## N6. Smooth noncommutative two-tori and differential calculus

For every real θ let α be the action of ℤ, with its discrete topology,
on `C(Circle, ℂ)=C(𝕋)` obtained from the pinned rotation by
`TauCeti.CStarAction.comp` along the continuous homomorphism `n↦−2πθn`
into the real line; by `TauCeti.CStarAction.rotation_apply_apply` the
generator acts by `α(f)(z)=f(exp(−2πiθ)⁻¹z)=f(exp(2πiθ)z)`. Fix a Haar
measure μ on ℤ, so μ is c times counting measure with `c=μ({0})>0`, and
define the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` as the pinned
`TauCeti.CStarAction.FullCrossedProduct α μ`. Let v be the image of
`Circle.coordinate` under the coefficient map i_A,
`TauCeti.CStarAction.FullCrossedProduct.coefficientMultiplier`, and u
the image of the generator 1 under the group map i_G,
`TauCeti.CStarAction.FullCrossedProduct.groupMultiplier`; the pinned
covariance gives `uvu*=α(v)=exp(2πiθ)v`, so that `uv=exp(2πiθ)vu`;
set `U₁=v`, `U₂=u`. At the pin A_θ is a nonunital C*-algebra and u, v
are unitary multipliers of it. Prove that A_θ is unital, by D2's
generator formulas for G=ℤ on the pinned carrier: the image under
`TauCeti.CStarAction.FullCrossedProduct.of` of `c⁻¹` times the point
mass at 0 with value 1 is a two-sided unit, and the image of `c⁻¹`
times the point mass at n with value `z^m` is `v^m u^n`, since left
convolution by that function is the left action of the multiplier
`i_A(z^m)i_G(n)`. Hence the canonical map of A_θ into its multiplier
algebra is a *-isomorphism, u and v are unitaries of A_θ, and A_θ is a
unital C*-algebra (Mathlib's `CStarAlgebra`).
Prove, with no irrationality restriction, that A_θ is universal for
pairs of unitaries satisfying this relation: a unitary V of a unital
C*-algebra B gives a representation of C(𝕋) by Mathlib's `cfc`, a
unitary U of B with `UVU*=exp(2πiθ)V` makes the pair covariant, and
D1's universal property integrates it to a unital *-homomorphism
`A_θ→B` sending u to U and v to V, unique by
`TauCeti.CStarAction.FullCrossedProduct.starAlgHom_ext`. The pinned
`TauCeti.CStarAction.FullCrossedProduct.lift` and
`TauCeti.CStarAction.CovariantRepresentation.integratedFull` give this
extension only for homomorphisms already bounded by the full seminorm
and for covariant pairs on Hilbert spaces. The coordinate copy
`f↦i_A(f)` of C(𝕋) is injective by
`TauCeti.CStarAction.FullCrossedProduct.of_injective`, applied to the
GNS representation (Mathlib's `gnsStarAlgHom`) of the Haar state of
C(𝕋), which is faithful because Haar measure charges every nonempty
open set. Since ℤ is amenable the full and reduced products agree (D2),
so D2's faithful conditional expectation gives `E:A_θ→C(𝕋)` with
`E(f u^n)=δ_(n0)f`. Define the trace `τ=∫_𝕋∘E` and prove it is a
faithful tracial state.
Construct the commuting coordinate-rotation and D4 dual actions, giving
`β_(z₁,z₂)(U_j)=z_j U_j`, and prove their joint strong continuity.
The smooth torus 𝒜_θ, the rapidly decreasing Fourier series
`Σ_(m,n∈ℤ) a_mn U₁^m U₂^n` with
`U₂U₁=exp(2πiθ)U₁U₂`, is the pinned `SmoothNoncommutativeTorus θ`,
modelled by its coefficient functions on ℤ², with the ordered product
multiplier `exp(2πiθ n m′)`, the star multiplier obtained by reversing
the word, the unitaries `U₁`, `U₂` and Fourier coefficient uniqueness.
Develop its rapid-decay seminorms, convergence, complete Fréchet
star-algebra structure and the injective dense map into A_θ. Identify 𝒜_θ with the smooth vectors of the two-torus gauge
action β: the elements a of A_θ for which `z↦β_z(a)` is a smooth map into
A_θ, with the derivative seminorms `P_m(a)=Σ_(|w|≤m)‖∂^w a‖` over words
w in the two coordinate generators of the action. Compare the two
seminorm families by explicit finite-order estimates in both directions:
for `Q_k(a)=sup_(r,s)(1+|r|+|s|)^k|a_(r,s)|` prove `Q_k≤C_k P_k` and
`P_m≤D_m Q_(m+3)`, with constants independent of a and θ. The first
uses contractive Fourier coefficient extraction, `|a_(r,s)|≤‖a‖`, applied
to the derivatives with their actual 2πi multipliers; the second uses the
absolute summability of `(1+|r|+|s|)^(−3)` over ℤ². These establish the
same Fréchet topology, not equality of individual seminorms: at θ=0,
a=1+U₁ gives Q_0=1 and P_0=2. Prove spectral invariance in all matrix
levels by differentiating inverses, `δ_j(a⁻¹)=−a⁻¹δ_j(a)a⁻¹` and its
iterates, so that `M_n(𝒜_θ)` is closed under inversion in `M_n(A_θ)`
(Mathlib's `CStarMatrix`) and inversion is continuous on its invertible
elements for the Fréchet topology. Deduce that `M_n(𝒜_θ)` is closed
under the holomorphic functional calculus of the unital Banach algebra
`M_n(A_θ)` (BanachAlgebras A2): for a∈M_n(𝒜_θ), f holomorphic on an open
U⊇σ(a) and a cycle Γ in U∖σ(a), null-homologous in U and winding once
around each point of σ(a), the resolvent `z↦(z1−a)⁻¹` is a continuous
map of the trace of Γ into `M_n(𝒜_θ)`, so `(2πi)⁻¹∫_Γ f(z)(z1−a)⁻¹dz`
converges in the complete algebra `M_n(𝒜_θ)`, and its image in `M_n(A_θ)`
is the pinned resolvent integral, independent of Γ by
`TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq`.
Completeness is used: the restrictions to 𝕋 of rational functions with
poles off 𝕋 form an inverse-closed subalgebra of C(𝕋) that contains z
and not its holomorphic image `exp(z)`.
Deduce the projection replacement inside `M_n(𝒜_θ)`. For an idempotent
e there put `z=1+(e−e*)*(e−e*)`; since z≥1 it is invertible in
`M_n(A_θ)`, hence in `M_n(𝒜_θ)`. Prove `ez=ze=ee*e`, so that z commutes
with e and e*, and that `p=ee*z⁻¹` is a projection of `M_n(𝒜_θ)` with
`ep=p` and `pe=e`; then `s=e+(1−p)(1−e)` is invertible there, with
inverse `p+(1−e)(1−p)`, and `ses⁻¹=p`. Hence every class of the pinned
K₀ of finitely generated projective 𝒜_θ-modules is represented by
projections over 𝒜_θ, and `τ(Tr e)=τ(Tr(pe))=τ(Tr(ep))=τ(Tr p)≥0` is
real for every idempotent e.

On 𝒜_θ the trace restricts to the pinned `trace`, τ(a)=a_00, tracial
and faithful; construct the derivations
`δ_j(U₁^mU₂^n)=2πi n_j U₁^mU₂^n`, n₁=m,n₂=n.
Prove continuity, Leibniz, star compatibility, commuting derivations and
τδ_j=0. Construct the two-dimensional differential calculus, orientation,
closed graded trace and its character

`φ(a₀,a₁,a₂)=(2πi)⁻¹ τ(a₀(δ₁a₁ δ₂a₂−δ₂a₁ δ₁a₂))`.

The pinned `traceDerivationPairCocycle` makes
`τ(a₀(δ₁a₁δ₂a₂−δ₂a₁δ₁a₂))` a cyclic 2-cocycle for any trace τ on a
unital algebra killed by two commuting derivations of
`derivationLieAlgebra ℂ A`, and `traceDerivationCocycle` makes
`τ(a₀δ(a₁))` a cyclic 1-cocycle for one such derivation; φ is `(2πi)⁻¹`
times the former on the torus trace and derivations, and the odd classes
φ_j below are the latter. Prove continuity of these cocycles on 𝒜_θ and
gauge/parameter-isomorphism transport. Build
connections on finite projective smooth right modules: ∇_j(ξa)=
(∇_jξ)a+ξδ_j(a), curvature `[∇₁,∇₂]`, Hermitian compatibility,
change of connection and gauge transformation. For a projection e
construct its Grassmann connection and prove the curvature-trace
formula equals `(φ#Tr)(e,e,e)`, including the (2πi)⁻¹ normalization.
Prove independence of connection by transgression. N7 supplies its
identification with an integer Fredholm index; cyclicity alone does not.

**Checks.**
- The ordered product multiplier: from `U₂U₁=exp(2πiθ)U₁U₂`,
  `U₂^n U₁^(m′)=exp(2πiθnm′)U₁^(m′)U₂^n`, so
  `(U₁^mU₂^n)(U₁^(m′)U₂^(n′))=exp(2πiθnm′)U₁^(m+m′)U₂^(n+n′)`. On the
  witness `(m,n)=(0,1)`, `(m′,n′)=(1,0)` this is the defining relation
  `U₂U₁=exp(2πiθ)U₁U₂`; the reversed multiplier `exp(2πiθmn′)` gives
  `U₂U₁=U₁U₂` there and is wrong for every θ∉ℤ.
- τ is a trace: `τ((U₁^mU₂^n)(U₁^(m′)U₂^(n′)))` is `exp(2πiθnm′)` when
  `(m′,n′)=(−m,−n)` and 0 otherwise, and the reversed product gives
  `exp(2πiθn′m)=exp(2πiθnm′)` in the same case; at `θ=1/2`, `m=n=1`,
  both equal −1. The functional `a↦a_(0,1)` is not a trace: for a=U₁ and
  `b=U₂U₁⁻¹`, `ab=exp(−2πiθ)U₂` while `ba=U₂`.
- The trace on A_θ: `τ(v^m u^n)=∫_𝕋 E(v^m u^n)dz=δ_(n0)∫_𝕋 z^m dz`, which
  is 1 for (m,n)=(0,0) and 0 otherwise, so τ restricts to a_00 on the
  Fourier series. Evaluation at 1∈𝕋 after E is a state but not a trace
  for θ∉ℤ: it takes the value `exp(2πiθ)` on `uvu*=exp(2πiθ)v` and 1 on
  `vu*u=v`.
- The direction of the rotation: pulled back along `n↦−2πθn`, the
  pinned `rotation t f z=f(exp(it)⁻¹z)` sends the coordinate function
  to `exp(2πiθ)` times itself, so `uvu*=exp(2πiθ)v`, which is `iv` at
  θ=1/4. Pulling back along `n↦2πθn` instead gives `uvu*=−iv` at θ=1/4,
  the algebra `A_(−θ)`; the two agree only for θ∈½ℤ.
- The unit of A_θ: for the point mass δ₀ at 0 with value 1,
  `(c⁻¹δ₀⋆g)(s)=c·c⁻¹·g(s)=g(s)` and
  `(g⋆c⁻¹δ₀)(s)=c·g(s)·α_s(c⁻¹)=g(s)`, while `δ₀⋆δ₀=cδ₀`, so δ₀ itself
  is c times the unit and is not idempotent unless c=1.
- `τδ_j=0`: `δ_j(U₁^mU₂^n)=2πin_jU₁^mU₂^n` has zero (0,0)-coefficient
  unless `(m,n)=(0,0)`, where `n_j=0`; so `τδ_j=0` on every monomial and,
  by continuity, on 𝒜_θ. The functional `a↦a_(1,0)` is not killed by
  δ₁: it takes the value 2πi on `δ₁(U₁)=2πiU₁`.
- The seminorm families: at θ=0 the element `a=1+U₁` has `Q_0=1` and
  `P_0=‖a‖=2`, so the two families define the same topology without
  being equal.
- The projection replacement on the idempotent `e=[[1,a],[0,0]]` of
  `M₂(𝒜_θ)`, a≠0: `(e−e*)*(e−e*)=diag(aa*,a*a)` and `ee*=diag(1+aa*,0)`,
  so `z=diag(1+aa*,1+a*a)` and p=diag(1,0), with ep=p, pe=e and
  `τ(Tr e)=τ(1)=1=τ(Tr p)`; for a=U₁, z=2. The self-adjoint part
  `(e+e*)/2` is not idempotent (at a=1 its square is
  `[[5/4,1/2],[1/2,1/4]]`), and at a=1 the element ee*=diag(2,0) is not
  a projection, so neither replaces e.

Compute continuous periodic cyclic cohomology for all θ:
`HP^even(𝒜_θ)≃ℂ²` with classes Sτ,φ, and
`HP^odd(𝒜_θ)≃ℂ²` with classes
`φ_j(a₀,a₁)=τ(a₀δ_j(a₁))`, j=1,2, with their periodic comparison
(Connes III.2, Theorem 7, p. 218).
Construct the Fourier resolutions, invariant/noninvariant cochain
contractions and comparisons proving completeness and independence.
Keep periodic cohomology distinct from fixed-degree ordinary cyclic
cohomology. Construct a continuous two-step bimodule resolution and its
comparison with the completed bar resolution, including the continuous
splittings needed to compute cohomology with continuous-dual coefficients.
For irrational θ set `λ=exp(2πiθ)`. The Diophantine condition is that
there exist C>0 and k∈ℕ with `|1−λ^n|⁻¹≤C(1+|n|)^k` for every
nonzero integer n. Prove
`dim H^j(𝒜_θ,𝒜_θ*)=1,2,1,0` for j=0,1,2,≥3 (Connes III.2,
Proposition 5(a)–(b), p. 217, for j≤2) under this
condition, where 𝒜_θ* is the continuous dual. Without this condition
prove H¹ and H² infinite-dimensional and non-Hausdorff (Proposition 5(c)) in N1's
quotient topology; H⁰ remains ℂ and the two-step resolution gives
vanishing above degree two.
Do not apply the Diophantine hypothesis to the periodic result.

### Examples

The multiplier witness `U₂U₁=exp(2πiθ)U₁U₂` at `(m,n)=(0,1)`,
`(m′,n′)=(1,0)`; the rotation direction `uvu*=iv` at θ=1/4 and the
unit `c⁻¹δ₀` of A_θ; the trace at θ=1/2 with both products equal to −1 on
`U₁U₂·U₁⁻¹U₂⁻¹`; the seminorm witness `1+U₁` at θ=0 with `Q₀=1`, `P₀=2`;
the torus character φ as `(2πi)⁻¹` times the pinned trace–derivation
2-cocycle of τ, δ₁, δ₂; the idempotent `[[1,a],[0,0]]` replaced by the
projection diag(1,0), both of trace 1.

### Dependencies

*Needs:* N1.Cyclic, N2; OperatorAlgebraDynamics D1–D2, D4; BanachAlgebras A2; Mathlib `cfc`, `CStarMatrix`, `CStarAlgebra` and `gnsStarAlgHom`; Tau Ceti `SmoothNoncommutativeTorus`, `traceDerivationCocycle`, `traceDerivationPairCocycle` and `derivationLieAlgebra ℂ A`; Tau Ceti `TauCeti.CStarAction.comp`, `TauCeti.CStarAction.rotation`, `TauCeti.CStarAction.rotation_apply_apply`, `Circle.coordinate`, `TauCeti.CStarAction.FullCrossedProduct` with `TauCeti.CStarAction.FullCrossedProduct.of`, `TauCeti.CStarAction.FullCrossedProduct.of_injective`, `TauCeti.CStarAction.FullCrossedProduct.starAlgHom_ext`, `TauCeti.CStarAction.FullCrossedProduct.coefficientMultiplier`, `TauCeti.CStarAction.FullCrossedProduct.groupMultiplier` and `TauCeti.CStarAction.FullCrossedProduct.groupMultiplier_mul_coefficientMultiplier`; Tau Ceti `TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq`.

## N7. Fourier spectral triples and Heisenberg indices

Take L²(A_θ,τ) to be Mathlib's GNS space `τ.GNS` of the trace τ, with
inner product `⟪a,b⟫=τ(a*b)` and left regular representation
`τ.gnsStarAlgHom`; identify it with ℓ²(ℤ²) by the ordered Fourier basis,
orthonormal because `τ((U₁^mU₂^n)*U₁^(m′)U₂^(n′))=δ_(mm′)δ_(nn′)`, and use
left multiplication for π. On its tensor product with ℂ² take
`D=−i(σ₁δ₁−σ₂δ₂)`, `γ=σ₃`, with the usual Pauli matrices.
Thus D⁺=−i(δ₁−iδ₂); this pins the orientation of the index and φ.
Construct the closed domain, self-adjointness, compact resolvent,
bounded smooth commutators and regularity. Prove |D| has nonzero
Fourier eigenvalues `2πsqrt(m²+n²)`, with spin multiplicity two per
lattice point and a two-dimensional kernel at (0,0). Combine lattice
points of equal radius when computing eigenvalue multiplicities.
Prove p-summability for p>2 and failure
at p=2. Build the lattice-counting estimates and derive
`Tr_ω(|D|⁻²)=1/(2π)`, with zero on the kernel. More generally prove,
for every dilation-invariant ω and N4's linear Dixmier trace,
`Tr_ω(π(a)|D|⁻²)=τ(a)/(2π)`. For a spin matrix M∈M₂(𝒜_θ),
prove `Tr_ω(π₂(M)|D|⁻²)=τ(Tr₂ M)/(4π)`.
Construct the gauge implementing unitaries commuting with |D|; unitary
invariance makes the trace of every nonzero Fourier mode vanish.
Use `|Tr_ω(AT)|≤‖A‖Tr_ω(T)` for positive T and rapid Fourier
convergence to pass from polynomials to smooth a and spin matrices.
Use N5's
λ₂=−1 and this orientation to compute the Hochschild character φ;
compare the periodic character using N6's basis and its value on [1].

At θ=0, construct both ordered reductions of the external product of two
copies of N3's smooth circle Hardy module in the Clifford model
`e₁=σ₁`, `e₂=−σ₂` of Cl₂ on ℂ² with grading σ₃. Write x⊠_u y for the
unswapped Clifford tensor/Morita reduction `e⊗1↦e₁`, `1⊗e↦e₂`, and
x⊠_s y for the swapped period reduction `e⊗1↦e₂`, `1⊗e↦e₁`. Represent
each Hardy class by the unbounded circle operator `D_j=−iδ_j` on ℓ²(ℤ),
with eigenvalue 2πm on e_m, whose phase with the zero mode sent to +1 is
`2P_Hardy−1`. With these matrices on ℓ²(ℤ)⊗ℓ²(ℤ)⊗ℂ², x⊠_u y is
represented by `D₁⊗1⊗σ₁−1⊗D₂⊗σ₂=−i(σ₁δ₁−σ₂δ₂)` with grading σ₃, which
is D above at θ=0, and x⊠_s y by `−D₁⊗1⊗σ₂+1⊗D₂⊗σ₁` with grading σ₃.
The odd self-adjoint unitary `(σ₁−σ₂)/√2` conjugates σ₁ to −σ₂ and σ₂
to −σ₁, so it carries the second operator to the first with grading
−σ₃. The bounded tensor `F₁⊗1⊗σ₁−1⊗F₂⊗σ₂` is not a Fredholm module for
C(𝕋²): its commutator with z₁ is `[F₁,z₁]⊗1⊗σ₁`, rank one tensored with
the identity of ℓ²(ℤ), hence not compact; the product is formed from
the unbounded operators and N5's bounded transform. For the Hardy
classes, each with circle index −1, identify x⊠_u y with the Fourier
triple at θ=0 and x⊠_s y with its reversed grading. Prove
`Ch(x⊠_u y)=Ch(x)#Ch(y)` and `Ch(x⊠_s y)=−Ch(x)#Ch(y)`, distinguishing
the two reductions throughout the graded index-interchange comparison.
For N2's fixed positive ordered smooth Bott class q*β of the torus,
calculate the pairings +1 and −1 respectively; the positive Fourier
Dirac operator has the first value. The arithmetic is: `τ₁=2ψ` on the
circle and N3's `λ₁=−(1+i)sqrt(π)/2`, so `Ch(x)=−(1+i)sqrt(π)ψ₁`; N2's
value `1/(2πi)` of ψ₁#ψ₂ on q*β gives
`⟨q*β,Ch(x)#Ch(y)⟩=((1+i)sqrt(π))²/(2πi)=+1`. Directly,
`Tr₂(σ₃[D,a][D,b])=2i(δ₁aδ₂b−δ₂aδ₁b)`, and N5's λ₂=−1 with the spin
factor 1/(4π) above gives the Hochschild class
`(−1)(2i)/(4π)·τ(⋯)=φ`, which pairs +1 with q*β. The matrices
e₁=σ₁, e₂=−σ₂, the two reductions and N2's Bott orientation are the
conventions of this computation, and a point factor contributes no
additional sign. It concerns these explicitly finitely summable circle
products: a general KK product is not assumed to have a finitely
summable representative on the given smooth algebra.

For 0<θ<1 construct the smooth Heisenberg right module on 𝒮(ℝ) with
`(ξU₁)(s)=ξ(s+θ)` and `(ξU₂)(s)=exp(2πis)ξ(s)` (Connes IV.6, pp. 356–357,
where θ ranges over ]0,1]).
Build its A_θ-valued inner product `⟨ξ,η⟩`, conjugate-linear in ξ and
right A_θ-linear in η, and prove its positivity and definiteness, so that
with `op(a)•ξ=ξa` the module is a `CStarModule` over the opposite algebra
of A_θ in Mathlib's convention `⟪ξ,a•η⟫=a⟪ξ,η⟫`; its inner products lie
in 𝒜_θ, and HilbertModules H1 completes it for the module norm
`‖⟨ξ,ξ⟩‖^(1/2)` measured in A_θ, to a Hilbert A_θ-module E. Build finite
Parseval frames of E with Schwartz entries (HilbertModules H2) and the
identification of their Gram-matrix projection with a smooth
Powers–Rieffel projection of trace θ. Prove the frame/trace dictionary:
the trace `τ(Tr e)` of a frame projection e is θ, independent of the
frame. Construct
`∇₁ξ=−2πis ξ/θ`, `∇₂ξ=dξ/ds` (Connes IV.6, p. 357), prove the right Leibniz and
Hermitian laws, and curvature `2πi/θ`. Form the localization
`E⊗_(A_θ)L²(A_θ,τ)` of E at τ (HilbertModules H3), identify it with the
scalar L²(ℝ) model with its correct norm, and construct the closed
coupled Dirac operator on its tensor product with ℂ².
Its chiral part is `−i(∇₁−i∇₂)=−d/ds−2πs/θ`. Prove its
Gaussian kernel is one-dimensional, adjoint kernel zero and range
closed using the harmonic-oscillator estimates. Thus its index is +1.
Establish the comparison of this coupled compression with N3's index
pairing and with the curvature trace, giving φ(generator)=1 and
φ([1])=0. This explicit calculation fixes the sign; changing the
second Clifford generator reverses the orientation.

Conclude that the joint trace/Chern map
`[e]↦(τ(Tr e),⟨[e],[φ]⟩)`, given on idempotents e∈M_n(𝒜_θ) and
descending through the pinned `evenPairingK0` to the pinned K₀ of
finitely generated projective 𝒜_θ-modules, is a homomorphism to ℝ×ℤ.
Its first coordinate is real on every idempotent by N6's projection
replacement, `τ(Tr e)=τ(Tr p)`. Its second coordinate is an integer on
every class, with no replacement of e by a projection: the periodic
character of the Fourier triple is the class of φ, by its values on [1]
and on the Heisenberg module in N6's basis, and N3's index theorem
evaluates its pairing with every idempotent as a Fredholm index. Prove
that the map takes `[1]↦(1,0)` and the Heisenberg module to `(θ,1)`, and
that its image contains the lattice `{(m+nθ,n):m,n∈ℤ}`. Compute the odd
cyclic pairings on U₁,U₂ with N2's constants: the rescaled classes
`ν_j=((1+i)sqrt(π)/(2πi))φ_j` pair as `ν_j(U_k)=δ_jk`.
Construct the two odd Fredholm modules on ℓ²(ℤ): write Se_k=e_(k+1),
`V_±e_k=exp(±2πikθ)e_k`, and let P_H be the projection onto k≥0.
Set `ρ₁(U₁)=S`, `ρ₁(U₂)=V_+`, `ρ₂(U₁)=V_-`,
`ρ₂(U₂)=S` and F=1−2P_H in both modules. Verify the defining
rotation relation, extend the representations to A_θ, and prove the
smooth commutators are Schatten-class using finite-rank shift
commutators and rapid Fourier decay. The positive F-projection is
1−P_H, so compression of S has index +1; the diagonal unitary has
index zero. Compare their periodic characters with ν₁,ν₂ by these
pairings and N6's cohomology basis; since `ν_j(U_k)=δ_jk`, the classes
`[U₁]`, `[U₂]` are linearly independent in the pinned `AlgebraicK1` of
𝒜_θ.
Treat θ=0 as the ordinary smooth torus and compare
with its Fourier/de Rham calculations. Rational parameters retain the
periodic cyclic theorem, the Fourier triple and, for 0<θ<1, the
Heisenberg module and its index; only N6's Diophantine Hochschild
computation is restricted to irrational θ.

**Checks.**
- The opposite-algebra dictionary: for a C*-algebra A as a right module
  over itself with `⟨x,y⟩=x*y`, the matrix units x=e₁₂, y=e₁₁ of M₂(ℂ)
  give `⟨x,y⟩=e₂₁`, while Mathlib's self-module instance `⟪x,y⟫=y x*`
  gives 0; the transport `⟪x,y⟫=op(x*y)` satisfies
  `⟪x,op(a)•y⟫=op(x*ya)=op(a)·op(x*y)`, Mathlib's law, whereas keeping
  `⟪x,y⟫=x*y` in A with `a•y=ya` gives `⟪x,a•y⟫=⟪x,y⟫a`, the wrong side
  for noncommutative A.
- Orthonormality of the ordered Fourier basis: `(U₁^mU₂^n)*=U₂^(−n)U₁^(−m)`
  and the ordered multiplier gives
  `U₂^(−n)U₁^(m′−m)=exp(−2πiθn(m′−m))U₁^(m′−m)U₂^(−n)`, so
  `τ((U₁^mU₂^n)*U₁^(m′)U₂^(n′))=exp(−2πiθn(m′−m))τ(U₁^(m′−m)U₂^(n′−n))`,
  which is 1 when (m,n)=(m′,n′) and 0 otherwise. The reversed word is a
  different unit vector: `⟪U₂^nU₁^m,U₁^mU₂^n⟫=exp(−2πiθnm)`, equal to −1
  at θ=1/2, m=n=1, so the identification with ℓ²(ℤ²) depends on the
  ordering of the words.
- On the Fourier mode `(m,n)⊗ℂ²` the Dirac operator is `2π(mσ₁−nσ₂)`,
  with square `4π²(m²+n²)`; its kernel is the mode (0,0) tensored with
  ℂ², of dimension 2, and `D⁺=−i(δ₁−iδ₂)` acts on the mode by
  `2π(m−in)`, so `ind(D⁺)=1−1=0`, the pairing of [1] with the Fourier
  triple. The multiplicities of |D| at `2πr` for `r²=0,1,2,5,25` are
  `2,8,8,16,24`, the lattice-point counts `1,4,4,8,12` doubled by spin.
  With `N(R)≈2πR²` eigenvalues of |D| in [0,2πR] and
  `σ_(N(R))(|D|⁻²)≈(1/π)log R`, the logarithmic mean is
  `(1/π)/2=1/(2π)`; counting each lattice point once gives `1/(4π)`.
- The odd modules satisfy the rotation relation:
  `(V₊S)e_k=exp(2πi(k+1)θ)e_(k+1)=exp(2πiθ)(SV₊)e_k`, so
  `ρ₁(U₂)ρ₁(U₁)=exp(2πiθ)ρ₁(U₁)ρ₁(U₂)`, and
  `(SV₋)e_k=exp(−2πikθ)e_(k+1)=exp(2πiθ)(V₋S)e_k`, so ρ₂ satisfies the
  same relation; with V₊ in place of V₋ in ρ₂ the relation would carry
  `exp(−2πiθ)`. The compression of S to the range of 1−P_H, the span of
  the e_k with k<0, kills e₋₁ and maps e_k to e_(k+1) for k≤−2, so it has
  kernel of dimension 1 and cokernel 0: index +1; the diagonal V_±
  compress to unitaries of index 0.
- The Heisenberg chiral operator `−d/ds−2πs/θ` annihilates `exp(−πs²/θ)`,
  Schwartz for θ>0, while its adjoint `d/ds−2πs/θ` annihilates only
  `exp(πs²/θ)`, not in L²: kernel 1, cokernel 0, index +1. Reversing the
  second Clifford generator gives `−d/ds+2πs/θ`, whose kernel
  `exp(πs²/θ)` is not in L² while its adjoint has the Gaussian kernel:
  index −1.

### Examples

The Fourier triple with |D|-multiplicities `2,8,8,16,24` at
`r²=0,1,2,5,25`, `ind(D⁺)=0` and `Tr_ω(|D|⁻²)=1/(2π)`; at θ=0 the product
of two Hardy classes, pairing +1 with q*β under the unswapped reduction
and −1 under the swapped one; the Heisenberg
module with curvature `2πi/θ` and chiral index +1; the two odd modules on
ℓ²(ℤ) with S compressed to index +1 and V_± to index 0; the matrix units
`e₁₂`, `e₁₁` separating the two inner-product conventions.

### Dependencies

*Needs:* N2–N6; HilbertModules H1–H3; Tau Ceti `ExactK0`, `evenPairingK0`, `AlgebraicK1` and `AlgebraicK1.oddPairing`, and the Fredholm perturbation theorems of the Tau Ceti contract; Mathlib `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `CStarModule` and `LinearMap.index`.

## Downstream consumers

- SmoothBanachRepresentations §7.3 consumes N1.Tensor's completed
  locally convex projective tensor at both fields for its smooth tensor
  comparison, its §7.2a owns only the two scalar-comparison maps between
  real and complex tensors, and its Layer 8 records N6 as the owner of
  the torus identification, seminorm comparisons and spectral invariance
  and consumes none of them; LocallyConvexDuality Layer 5 consumes
  N1.Tensor over ℝ and ℂ with its Banach comparison;
  AutomorphicSpectralTheory, AutomorphicSpectralTheoryPartII,
  GanGrossPrasadUnitaryGroups and RefinedTraceMethods consume N1's
  completed tensors and cyclic complexes.
- SpectralManifolds consumes N1–N2 and N4–N5; CompactQuantumMetricSpaces
  consumes N5's spectral triples, N6's rotation algebra A_θ with its gauge
  action, Fourier coefficients, faithful trace, smooth algebra 𝒜_θ and
  derivations δ₁, δ₂, and N7's trace-GNS space with its ordered Fourier
  basis and the Fourier Dirac operator;
  HilbertModules/HeisenbergImprimitivity consumes N6's rotation algebra
  A_θ with its smooth subalgebra and trace and N7's Heisenberg module with
  its frames and Powers–Rieffel projection, for its comparison §6.3.
- OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its
  universal presentation, the injectivity of its coordinate copy of C(𝕋)
  and its faithful trace τ; its Pimsner–Voiculescu computation of
  `K_*(A_θ)`, its Powers–Rieffel generator built from continuous circle
  functions and the trace range `ℤ+θℤ` (7.4), and the identification of
  A_θ with the twisted group C*-algebra of ℤ² for the factor set
  `exp(2πiθnm′)` (7.5), are its own.

## References

- Connes, [*Noncommutative Geometry*](https://alainconnes.org/wp-content/uploads/book94bigpdf.pdf).
  Chapter III §1: universal forms and the cycle characterization of cyclic
  cocycles, Propositions 3–4, pp. 190–191; the cup product, Theorem 12,
  p. 197; the periodicity operator S, Lemma 14, p. 198; the SBI exact
  triangle, Theorem 26, p. 208. III §2: the torus Hochschild and periodic
  computations, Proposition 5 and Theorem 7, pp. 217–218. III §3: the even
  and odd K-theory pairings, Propositions 2–3, pp. 229–230. Chapter IV,
  introduction: matrix amplification and the index map of a Fredholm
  module, Proposition 2 (cited in §1 as Proposition 0.2), p. 295;
  p-summability for p≥1 and the Hölder corollary, Definition 3, p. 296.
  IV §1: the trace cyclicity on dual Schatten classes, p. 300; the
  conditional trace and its cycle, Proposition 1, p. 299; compatibility
  with S, Proposition 2, p. 300; the character normalization, Definition 3, p. 302; the index
  theorem, Proposition 4, p. 303. IV §2: the Dixmier trace, Definition 2,
  p. 312; the properties of `Tr_ω`, Proposition 3, pp. 312–313; the
  Tauberian criterion, Proposition 4, p. 313; the
  Hochschild class, Theorem 8, p. 315. IV §6: the Heisenberg module and
  its connection, pp. 356–357; its elliptic index formula, pp. 358–361, is
  cited for comparison only. IV Appendix C: the partial-sum norms of
  `L^(p,∞)` and `L^(1,∞)`, p. 453.
- Connes, [*Non-commutative differential geometry*](http://www.numdam.org/item/PMIHES_1985__62__41_0/),
  Publ. Math. IHÉS 62 (1985), 41–144. Part I, Appendix 2, Proposition 5,
  p. 91: the index map of a Fredholm module on K₀, evaluated on every
  idempotent matrix by the compression of F between the ranges of the
  idempotent. Part II, Corollary 24, p. 113: the cyclic cohomology of
  complex algebras with complex-valued cochains (Part II, p. 94) is
  invariant under Morita equivalence of unital algebras through a
  bimodule finite projective on both sides; matrix Morita invariance
  with R=M=ℂ is the case of `A^ι`.
- A. L. Carey, A. Rennie, F. Sukochev and D. Zanin, [*Universal
  measurability and the Hochschild class of the Chern
  character*](https://arxiv.org/abs/1401.1860v1), arXiv:1401.1860v1
  (2014), numbering of that version; J. Spectral Theory 6 (2016), 1–41.
  Theorem 16, p. 9: for a smooth spectral triple with `(1+D²)^(−p/2)`
  in the logarithmic ideal and a Hochschild p-cycle `c=Σa₀⊗⋯⊗a_p`, the
  Dixmier trace of `Σγa₀[D,a₁]⋯[D,a_p](1+D²)^(−p/2)` is the
  Chern-character value of c for every dilation-invariant generalized
  limit (Definition 2 and the example after it, p. 4); with
  `(1+D²)^(−p/2)` in the weak trace class, every normalised trace on it
  gives that value.
- T. Fack and H. Kosaki, [*Generalized s-numbers of τ-measurable
  operators*](https://msp.org/pjm/1986/123-2/pjm-v123-n2-p03-s.pdf),
  Pacific J. Math. 123 (1986), 269–300. Theorem 4.2, p. 286: Hölder with
  constant one for all positive exponents and the multiplicative
  majorization of singular values; Theorem 4.9(iii), p. 295: the
  p-triangle inequality for 0<p<1. N3 uses only the case of B(H) with
  its trace, through NoncommutativeIntegration §1.3–§1.5.
- A. Grothendieck, [*Résumé des résultats essentiels dans la théorie des
  produits tensoriels topologiques et des espaces nucléaires*](http://www.numdam.org/item/AIF_1952__4__73_0/),
  Ann. Inst. Fourier 4 (1952), 73–112, stated there without proofs, for
  Hausdorff locally convex spaces. Chapter I, n° 1, Théorème 1, p. 76:
  the projective tensor topology, with the disked hulls of the sets U⊗V
  as basic neighbourhoods, characterized by its universal property for
  continuous bilinear maps, and for normed factors the projective norm
  `inf Σ‖x_i‖‖y_i‖` with its isometric bilinear correspondence; p. 77: the
  completed projective tensor product, a Banach space for normed factors
  and a Fréchet space for metrizable ones, its universal property into
  complete spaces, and its compatibility with products and direct sums.
- N3's odd character coefficient is minus the coefficient printed in
  Connes IV §1, Definition 3, p. 302, while N2's odd pairing constant is
  positive; the Hardy compression calculation fixes agreement with
  the kernel-minus-cokernel index.
- The ordered Fourier triple, its chosen second Clifford sign and its
  Gaussian chiral calculation in N7 specify the comparison required
  here; they are not left to a convention implicit in the elliptic
  formula of Connes IV §6.
- Mathlib's multilinear, derivation, homological-complex, compact-operator
  and Fredholm APIs fix the foundational vocabulary. Tau Ceti's
  `Algebra/Lie/Derivation/Basic` supplies the noncommutative derivation
  carrier and its Leibniz/inner/conjugation API; its
  `RingTheory/CyclicCohomology`, `NoncommutativeGeometry/UniversalDifferential`,
  `NoncommutativeGeometry/SmoothTorus`, `Analysis/CStarAlgebra/Action`,
  `Analysis/Complex/Circle`, `Analysis/OperatorIdeal/Family`,
  `Analysis/Normed/Order/GeneralizedLimit`,
  `Analysis/Normed/Algebra/HolomorphicFunctionalCalculus`,
  `Analysis/InnerProductSpace/LinearPMap`,
  `Analysis/Normed/Module/PiTensorProduct` and
  `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}`
  modules are the suppliers named in the Tau Ceti contract. Mathlib's
  `ContinuousLinearMap.IsFredholm`,
  `ContinuousLinearMap.FredholmPackage` and `IsFredholm.index_comp` in
  `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean` fix the native
  operator/index interface.
