# Roadmap: elliptic index theory and the Atiyah–Singer theorem

**Summary.** Build the analytic and topological index maps for elliptic operators on closed
smooth manifolds, their compact-Lie equivariant versions and the embedding proof that they agree
(Atiyah–Singer I, Theorem 6.7; Freed, Theorem 4.18). The analytic side starts from Mathlib's
Fredholm maps and Tau Ceti's Fredholm index calculus, adds the Hilbert-space connectors that index
theory needs (normal forms, snake sequences, compatibility conditions and the classification of
Fredholm maps up to norm paths) and realizes symbol classes in `K_c(T*M)` by pseudodifferential
operators. The topological side pushes symbol classes forward along cotangent embeddings and
inverts Bott periodicity on a Euclidean space. The end theorems are `ind_a = ind_t`, its
cohomological form, the de Rham, signature, Dolbeault and twisted spin Dirac index formulas with
Rokhlin's theorem, Riemann–Roch on compact Riemann surfaces, the vanishing of the index of
differential operators in odd dimensions, and the holomorphic Lefschetz fixed-map formula.

## Scope and ownership

This roadmap owns, by layer:

- **Layer 1.** Hilbert-space Fredholm connectors on top of the native Fredholm API: the
  orthogonal Fredholm package, the norm-continuous triangular normal form near a Fredholm map
  and the transverse-subspace lemma, the six-term snake sequence for Fredholm maps of split
  exact Hilbert sequences, minimal compatibility conditions and the index-zero alternative, the
  unitary logarithm and norm-path connectedness of `GL(H)`, and the classification of Fredholm
  maps between complex Hilbert spaces up to norm paths by their index.
- **Layer 2.** Compactly supported symbol classes on cotangent bundles, their representation by
  homogeneous elliptic symbols, the analytic index `ind_a : K_c(T*M) → ℤ`, analytic excision,
  local difference classes, the operator cut-and-paste index theorem, and the norm closure of the
  order-zero classical algebra with its symbol exact sequence.
- **Layer 3.** The normal complex structure on the tangent map of an embedding, the cotangent
  pushforward `f_!^T`, the topological index `ind_t`, equivariant embeddings in representations,
  the equivariant topological index and the uniqueness of normalized index assignments.
- **Layer 4.** The equivariant analytic index of Fredholm intertwiners and of invariant symbols,
  equivariant excision, external products, and the fixed associated-fibre product theorem with
  its explicitly built operator realization.
- **Layer 5.** The representation-valued de Rham index of a sphere, the O(1), SO(2) and O(n)
  Bott index computations, embedding invariance of the analytic index and the Atiyah–Singer
  equality `ind_a = ind_t`, ordinary and equivariant.
- **Layer 6.** The cohomological index formula on the canonically oriented cotangent bundle and
  the universal symbol calculations that turn it into characteristic-class formulas.
- **Layer 7.** The index-theoretic applications: the de Rham operator, the signature operator
  and Hirzebruch's theorem, Hirzebruch–Riemann–Roch for the Dolbeault operator, Riemann–Roch on
  compact Riemann surfaces, the twisted spin Dirac formula with `8 · ind D⁺ = −σ(M)`,
  `σ(M) = −16α` and Rokhlin's theorem, and vanishing in odd dimensions.
- **Layer 8.** The holomorphic Lefschetz fixed-map formula for a holomorphic self-map with
  nondegenerate fixed points and a holomorphic bundle lift.

It leaves to other roadmaps, by section:

- Atkinson's theorem, in rectangular form between two Hilbert spaces, and the Calkin-algebra
  reading of the index: **OperatorKTheory** K4.1 (`isFredholm_iff_exists_isCompactOperator_comp_sub_one`).
  The KK product, the universal coefficient theorem and general variable-fibre families index
  theory are OperatorKTheory's in its own scope; the symbol-index API here uses none of them.
- The compact ideal and the Calkin algebra of a Hilbert space, closed star ideals, C*-quotients
  and spectral permanence: **CStarAlgebras** C1.3 and C1.6. The ℂ specialization of module
  compact operators and the continuous-section C*-algebra of a Hermitian endomorphism bundle:
  **HilbertModules** H2 and H5.
- Hilbert dimension, its basis independence and the unitary classification of Hilbert spaces by
  it: **BanachSpaceTheory** B5.
- The index `−1` of the forward shift on the Hardy space and the winding-number index formula
  for continuous Toeplitz symbols: **OperatorTheory/ToeplitzOperators** T3.
- The identity `⟨e(TM),[M]⟩ = χ(M)` on closed oriented manifolds: **CharacteristicClasses** C2
  item 3. Layer 7.1 proves only the index statements and the symbol evaluation.
- The smooth classification of compact surfaces: **GeometricTopology**, under the contract
  `gap:smooth-surface-classification` of the supplier contracts. Layer 7.4 consumes it for the
  diffeomorphism between a model surface and a Riemann surface of the same genus.
- Equivariant Thom isomorphisms in K-theory, proved by projective-family stabilization
  independently of index theory, and the sphere Koszul reflection homotopy: **TopologicalKTheory**
  T6 and T7.5.
- The pseudodifferential calculus, Sobolev mapping estimates, elliptic parametrices, positive
  powers, product indices and common-order elliptic-complex Hodge theory:
  **PseudodifferentialOperators** P1–P7. No second calculus is built here.
- Static Laplace-type Hodge theory, Serre duality and the projective examples:
  **ComplexKahlerGeometry** K5, K5a and K7.
- Spin structures, spinor bundles, chiral Dirac operators, Lichnerowicz and the untwisted
  four-dimensional quaternionic kernel symmetry: **SpinGeometry** G1–G6 and G6.7.
- The flag-variety and word-space specializations of the holomorphic Lefschetz formula:
  **SchubertGeometry**.
- The KO-genus and Atiyah–Bott–Shapiro orientation comparison: **TangentialBordism**, which
  consumes Layers 7.2 and 7.5.

## Conventions

Manifolds are finite-dimensional smooth Hausdorff second-countable manifolds without boundary;
index assertions concern compact bases. Bundles are smooth finite-rank complex bundles with
locally constant ranks. Real differential operators enter by complexification, whose complex
index equals the real index. Equivariant statements use smooth actions of compact Lie groups and
smooth bundle actions. Continuous parameters carry the stated Sobolev operator topology. No
orientation or spin assumption is imposed on the general index theorem.

The cotangent fibre is the continuous real dual of Mathlib's `TangentSpace`; finite dimension
identifies it with the algebraic dual through a proved equivalence. Cotangent vectors are never an
unrelated Euclidean tuple type. Tangent and cotangent vectors are identified only through a chosen
metric musical isomorphism, and every construction proves independence of that choice.

The integer index is `dim ker − dim coker`, source kernel minus target cokernel. A complex has
index the even-source minus odd-target Euler class. Fourier symbols use PseudodifferentialOperators'
convention `σ_F(∂_j) = iξ_j`, equivalent to Mathlib's multiplier `2πiζ_j` with `ξ = 2πζ`; a
geometric differential symbol gains `i^m` in order m. Multiplication is composition with the
rightmost operator acting first. Hilbert inner products are conjugate-linear in the first
variable. Quotient cokernels are identified with formal-adjoint kernels only through the supplied
closed-range and duality maps.

On a real vector space V identify `TV = V_x ⊕ V_v` with `V ⊗ ℂ` by `z = v − ix`. This fixes the
complex orientation of the cotangent total space after metric and connection transport. For an
oriented n-manifold its comparison with base-first coordinates `(x₁,…,x_n,ξ₁,…,ξ_n)` has sign
`(−1)^(n(n−1)/2)`. The complex structure is auxiliary; its orientation is canonical on `T*M` and
independent of choices, including when M is nonorientable. Products retain the explicit
coordinate permutation and graded signs.

The cotangent embedding pushforward uses TopologicalKTheory's **exterior-wedge** Thom class
`w_E = (−1)^r det(E) · u^dual_E`, where `u^dual_E` is its dual Koszul class and r the complex
rank. On `V ⊗ ℂ` for a real representation V of dimension n, w has analytic index 1, while the
dual class has equivariant index `(−1)^n det(V_ℂ)`. In complex rank 1 without action,
`w = β = [O(−1)] − 1` and `u^dual = −β`; the first-to-second disc transition for β is z. Both
Thom conventions and their conversion stay in the API; they are not interchangeable generators.
Cohomological Thom classes and Chern characters use CharacteristicClasses' positive complex
orientation. Its periodic coefficient is written `u_per = β`, of degree −2, with
`ch(u_per) = −v_per`; this is distinct from the dual Thom class. In ordinary compactly supported
cohomology `ch_c(β) = −U_ℂ`, where `U_ℂ` is the positive complex Thom class. Degree-zero formulae
use CharacteristicClasses C6's periodic-degree fold.

## Exact supplier contracts

### From Mathlib

- `ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage`,
  `IsFredholm.fredholmPackage`, `isFredholm_iff_exists_isQuasiInverse` and
  `LinearMap.IsQuasiInverse` (`Analysis/Normed/Operator/Fredholm/Basic.lean`); a quasi-inverse is
  an inverse modulo maps of finite rank, not modulo compact maps. `IsFredholm.index_comp`,
  `IsFredholm.add_hasFiniteRange` (same file).
- `FredholmPackage.eventually_nhds_isInvertible`, `isOpen_setOfPred_isFredholm`,
  `IsFredholm.eventually_nhds_index_eq` and `index_continuousOn_isFredholm`
  (`Analysis/Normed/Operator/Fredholm/Open.lean`): openness of the Fredholm locus and local
  constancy of the index between Banach spaces.
- `LinearMap.index`, `LinearMap.index_eq_finrank_sub`, `LinearMap.index_smul`
  (`Algebra/Module/LinearMap/Index.lean`).
- `Ring.inverse`, `NormedRing.inverse_continuousAt`; `CStarRing.norm_one`
  (`Analysis/CStarAlgebra/Basic.lean`): the unit of a nontrivial C*-ring has norm one.
- `selfAdjoint.expUnitary` (`Analysis/CStarAlgebra/Exponential.lean`): `exp(iA)` as a unitary of
  a unital C*-algebra for self-adjoint A, through `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint`
  (`Analysis/Normed/Algebra/Exponential.lean`). `Unitary.argSelfAdjoint`,
  `selfAdjoint.expUnitaryPathToOne`, `selfAdjoint.joined_one_expUnitary`, `Unitary.joined` and
  `Unitary.mem_pathComponentOne_iff` (`Analysis/CStarAlgebra/Unitary/Connected.lean`): the
  principal argument of a unitary through the continuous functional calculus (it is `0` on a
  unitary whose spectrum meets the negative real axis), the path `t ↦ expUnitary (t • A)` from `1`
  to `expUnitary A`, a path between unitaries at distance less than 2, and the path component of
  `1` as the finite products of exponentials of self-adjoint elements.
- `CategoryTheory.ShortComplex.SnakeInput` and `SnakeInput.snake_lemma`, on `ModuleCat ℂ`.
- `HilbertBasis`, `Path`, `IsCompactOperator`, `FiberBundle`, `VectorBundle`,
  `ContMDiffVectorBundle`, `TangentSpace`.

### From Tau Ceti

- `ContinuousLinearMap.index`, `ContinuousLinearMap.index_def`, `index_prodMap`, `index_smul`,
  `index_of_injective`, `index_eq_of_finiteDimensional`,
  `bijective_of_surjective_of_index_eq_zero`, `index_restrictScalars_real`
  (`TauCeti/Topology/Algebra/Module/ContinuousLinearMap/Index.lean`), and `index_equiv_comp`,
  `index_comp_equiv` (`TauCeti/Algebra/Module/LinearMap/Index.lean`).
- `ContinuousLinearMap.IsFredholm.restrictScalars`
  (`TauCeti/Analysis/Fredholm/Basic.lean`): the realification of a complex Fredholm map is
  Fredholm, and its index is twice the complex index.
- `ContinuousLinearMap.range_adjoint_eq_orthogonal_ker_of_isClosed_range`,
  `isClosed_range_adjoint_of_isClosed_range`, `cokerEquivKerAdjoint`, `index_adjoint`
  (`TauCeti/Analysis/Fredholm/Adjoint.lean`).
- `ContinuousLinearMap.isClosed_range_of_finite_coker`, `IsFredholm.of_finite_ker_coker`
  (`TauCeti/Analysis/Fredholm/ClosedRange.lean`): between Banach spaces, finite-dimensional
  kernel and cokernel give a Fredholm map.
- `ContinuousLinearMap.index_add_of_isCompactOperator`, `TauCeti.isFredholm_one_sub`
  (`TauCeti/Analysis/Fredholm/CompactPerturbation.lean`);
  `ContinuousLinearMap.index_add_of_hasFiniteRange` (`TauCeti/Analysis/Fredholm/FiniteRank.lean`);
  `ContinuousLinearMap.index_eq_zero_of_isSelfAdjoint` (`TauCeti/Analysis/Fredholm/SelfAdjoint.lean`);
  `Path.index_eq` (`TauCeti/Analysis/Fredholm/ContinuousFamily.lean`): the endpoints of a
  continuous Fredholm path have equal index.

### From TauCetiRoadmap.OperatorTheory

OperatorIdeals OI-A25–A30 (compact approximation and adjoints); PolarDecomposition (Hilbert polar
decomposition); SelfAdjointSpectralTheory Part B (bounded Borel calculus with its
partial-operator and adjoint conventions); ToeplitzOperators T3 (`index(T_a) = −wind(a,0)` for
continuous nonvanishing symbols, so the forward Hardy shift has index −1; its circle is
`UnitAddCircle` with `e_n = exp(2πint)`, matched here by `x = 2πt`).

### From TauCetiRoadmap.CStarAlgebras, HilbertModules and OperatorKTheory

CStarAlgebras C1.3 (closed star ideals, C*-quotients and spectral permanence for C*-subalgebras)
and C1.6 (the compact ideal and the Calkin algebra `B(H)/K(H)`). HilbertModules H2 (the ℂ
specialization and the rank-one/compact comparison) and H5 (the continuous-section C*-algebra of
a finite-rank Hermitian endomorphism bundle). OperatorKTheory K4.1: a bounded map `T : H₀ → H₁`
of complex Hilbert spaces is Fredholm exactly when some bounded `S : H₁ → H₀` makes `ST − 1` and
`TS − 1` compact, and for `H₀ = H₁` this is invertibility in the Calkin algebra.

### From TauCetiRoadmap.BanachSpaceTheory

B5: the Hilbert dimension of a complete inner-product space, the cardinality of any Hilbert basis
(`hilbertBasis_lift_mk_eq`), and the unitary classification
`nonempty_linearIsometryEquiv_iff_lift_mk_eq`. It is not the Hamel rank.

### From TauCetiRoadmap.SmoothBundlesConnections

[B1–B4 and B6](../SmoothBundlesConnections/README.md): smooth bundle morphisms, metrics, L²
sections, frame, principal and associated bundles, compatible connections and B6's line cocycle
and curvature normalization.

### From TauCetiRoadmap.ComplexKahlerGeometry

[K1–K2 and K4–K7](../ComplexKahlerGeometry/README.md): complex, type and Dolbeault calculus and
the sheaf comparison; K5a's shared all-real compact-bundle `H^s` Hilbert and distribution scale
with Rellich compactness; real de Rham and complex Dolbeault Hodge theory and Serre duality (K5);
the projective, torus and closed-surface examples, the closed-surface CW model and the
genus/Betti/Dolbeault dictionary (K7). K5's static Laplace theory is independent of the index
theorem.

### From TauCetiRoadmap.PseudodifferentialOperators

[P1–P7](../PseudodifferentialOperators/README.md): differential and jet symbols, the classical
calculus and continuous quantization (P1–P4, including P4.2's square partition), all-order and
Fourier–Schur estimates and the seminorm/Bochner topology comparison (P5), parametrices and
Fredholmness (P6), and P7's elliptic powers and change of order, graded external products with
their Hilbert-tensor and kernel comparison, the equivariant virtual kernel class with its local
constancy and homotopy theorem, and common-order elliptic-complex Hodge theory.

### From TauCetiRoadmap.TopologicalKTheory

[T1–T6 and T7.5](../TopologicalKTheory/README.md): the finite-rank bundle category and its
homotopy classification (T1), relative triples retaining σ, compact supports, exact and
Mayer–Vietoris sequences (T3), smoothing, complex Bott periodicity and Thom classes (T4–T5, with
T5.4–T5.5's complex-normal pushforward), the compact-Lie representation ring and its
continuous-representation SplitK0 ring, equivariant descent, the strongly continuous
continuous-section and L²-section actions and the finite equivariant embedding of a G-bundle
over a compact base, associated products and associated Koszul/folding naturality (T6, including
T6.1, T6.2, T6.8 and T6.9), and the sphere Koszul reflection homotopy (T7.5). The G-finite density
theorem that T6.1 applies is CompactGroups Layer 5's, consumed here under the same contract.

### From TauCetiRoadmap.CharacteristicClasses, AlgebraicTopology and DifferentialGeometry

[CharacteristicClasses C1–C7](../CharacteristicClasses/README.md): local-coefficient
orientations, compactly supported Thom and Gysin maps, finite-dimensional evaluation, the
Chern character and its Thom correction (C6), Chern, Pontryagin, Euler and Stiefel–Whitney
classes with C1.4–C1.6's line-bundle classification and smoothing, C2 item 3's Euler identity,
C2.5's compact-stage general position, universal rings and Todd, L and Â classes. Ordinary
cohomology, cup products and excision come from [AlgebraicTopology Stages 6 and
8](../AlgebraicTopology/README.md); de Rham cohomology, Poincaré duality and integration from
[DifferentialGeometry](../DifferentialGeometry/README.md).

### From TauCetiRoadmap.GeometricTopology and HopfRinow

[GeometricTopology](../GeometricTopology/README.md) Layer 1 (smooth collars, gluing along the
boundary, tubular neighbourhoods and the normal bundle) and Layer 3 (diffeomorphism groups and
isotopy extension). What GeometricTopology must provide (gap:smooth-surface-classification): the
smooth classification of compact surfaces, that every compact connected smooth surface is
diffeomorphic to exactly one standard model (the orientable surface of genus g with b boundary
components, or the non-orientable one with k ≥ 1 crosscaps and b boundary components), with
`rank H₁(F; ℚ) = 2g` for a closed orientable surface F of genus g.
[HopfRinow Layer 1](../../Completed/HopfRinow/README.md): the Levi-Civita connection.

### From TauCetiRoadmap.RepresentationTheory

[CompactGroups](../RepresentationTheory/CompactGroups/README.md), [LieGroups
Layer 6](../RepresentationTheory/LieGroups/README.md) and
[ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md): Haar averaging, continuous
finite-dimensional representations, Peter–Weyl and character detection, and connected compact
torus theory. What CompactGroups must provide (gap:banach-gfinite-density): for a compact
Hausdorff group acting on a complex Banach space by a representation whose orbit maps are
continuous, the G-finite vectors (those with finite-dimensional orbit span) are dense; this is
the Layer 5 contract that TopologicalKTheory T6.1 consumes for its section actions.

### From TauCetiRoadmap.SpinGeometry

[G1–G6](../SpinGeometry/README.md): negative-metric Clifford modules, the Γ/Hodge-star dictionary
(G2), spin structures, spinors and half-spin roots (G5), chiral Dirac operators, Lichnerowicz and
the exported compact-support symbol class (G6); G6.7's untwisted four-dimensional quaternionic
kernels with complex index `2α`. The numerical index formulae are proved here.

## How to read the build

Layer 1 adds the Hilbert-space connectors to the native Fredholm API. Layer 2 turns elliptic
symbols into classes in `K_c(T*M)` and defines the analytic index with excision and
cut-and-paste. Layer 3 defines the cotangent pushforward and the topological index and proves
that additivity, embedding compatibility and the point normalization determine an index.
Layer 4 builds equivariant indices, products and the associated-fibre theorem. Layer 5 computes
the Bott index, proves that the analytic index is embedding invariant and concludes
`ind_a = ind_t`. Layer 6 converts it into the cohomological formula and Layer 7 evaluates that
formula on the classical operators. Layer 8 builds the holomorphic Lefschetz formula from the
elliptic calculus of Layer 2. Other roadmaps cite Layer k as `Ik` and section k.n as `Ik.n`; the
labels in parentheses keep that correspondence. `Suggested.lean` states the headline theorems
that the pinned carriers can express.

## Layer 1: Hilbert Fredholm connectors (I1)

### 1.1 Orthogonal packages, normal forms and transverse subspaces (I1.1)

Compare the native Fredholm package with the orthogonal decompositions by `ker T`, `range T` and
`ker T*`. Its quasi-inverse is continuous and inverts T **modulo finite-rank errors**; it is not
itself a finite-rank map. Consume OperatorKTheory K4.1's rectangular Atkinson theorem and export
rectangular parametrix composition, finite blocks, adjoints, compact-perturbation transport and
uniqueness of a parametrix modulo compact maps from the two corner error identities, deriving the
inverse-index sign through the native composition law. Give the concrete orthogonal-package
comparison. Consume `index_equiv_comp`, `index_comp_equiv`, `index_prodMap`, `index_smul`,
`index_adjoint`, `cokerEquivKerAdjoint` and `range_adjoint_eq_orthogonal_ker_of_isClosed_range`,
and transport them to the section realizations of Layer 2. Index statements use
`(T : E →ₗ[𝕜] F).index` for `𝕜 = ℝ` or `ℂ`, compared with Tau Ceti's `ContinuousLinearMap.index`
through `ContinuousLinearMap.index_def`. Build the complexification of the real defect spaces and
prove that a real Fredholm map and its complexification have equal indices; the realification
direction is Tau Ceti's `index_restrictScalars_real`. Derive `range(T*T) = range(T*) = (ker T)^⊥`
from the closed-range identities, keeping source and target subspaces typed.

For a fixed Fredholm `T₀` export the operator-norm neighbourhood normal form in the fixed
decompositions `E = X ⊕ K` with `K = ker T₀`, `X = K^⊥`, and `F = R ⊕ C` with `R = range T₀`,
`C = ker T₀*`. Write a nearby T as `[[A, B], [C₁, D]]` with `A : X → R`, `B : K → R`,
`C₁ : X → C` and `D : K → C`. Construct the native `IsFredholm.fredholmPackage` from the
orthogonal topological complements and compare its codomain projection with the orthogonal
projection onto R. Consume `FredholmPackage.eventually_nhds_isInvertible` for A. Pin `A(T)⁻¹` by
transporting `A(T)` through `A(T₀)⁻¹` to the Banach algebra `X →L X` and applying `Ring.inverse`;
`NormedRing.inverse_continuousAt` gives norm continuity at units. Construct the continuous
invertible triangular changes of coordinates on source and target that reduce T to
`diag(A, D − C₁ A⁻¹ B)`, their norm-continuous dependence on T, and the resulting kernel and
cokernel isomorphisms with those of the finite-dimensional map `K → C`, whose index is
`dim K − dim C`. Compare this model with native openness and local constancy of the index.

Prove the transverse-subspace lemma (Atiyah–Singer I, pp. 519–520): for a finite-dimensional V
with `V ∩ ker T₀ = 0`, the map `V ⊕ (T₀V)^⊥ → F`, `(v, w) ↦ Tv + w`, stays invertible for T near
`T₀`, so `V ∩ ker T = 0` and `F = T(V) ⊕ (T₀V)^⊥`. Obtain closedness of `range T` independently
from native Fredholm openness. For the infinite-dimensional version assume V closed of finite
codimension and `T₀|V` a continuous linear equivalence onto a closed range of finite codimension;
in a neighbourhood of `T₀` prove `V ∩ ker T = 0` and `F = T(V) ⊕ (T₀V)^⊥`. Since `T(V)` is closed
of finite codimension, prove `range T` closed and T Fredholm directly, with
`dim ker T ≤ codim V`, `dim coker T ≤ dim (T₀V)^⊥` and
`dim ker T₀ − dim ker T = dim coker T₀ − dim coker T`. This version applies to `X = (ker T₀)^⊥`
without calling X finite-dimensional.

- For every Fredholm T the orthogonal package and the native package have the same kernel, the
  same range and codomain projections that agree after the orthogonal identification.
- The triangular normal form depends norm-continuously on T near `T₀`, and
  `ker T ≃ ker(D − C₁A⁻¹B)`, `coker T ≃ coker(D − C₁A⁻¹B)` as finite-dimensional spaces.
- In the transverse-subspace neighbourhood the three dimension relations above hold.

**Checks.**

- `T₀ = 0 : ℂ² → ℂ`: `K = ℂ²`, `X = 0`, `R = 0`, `C = ℂ`, the reduced map is `D = 0 : ℂ² → ℂ`
  and the index is `dim K − dim C = 2 − 1 = 1`; the reversed convention `dim C − dim K` gives −1.
- The nilpotent `T = [[0, 1], [0, 0]]` on ℂ² has `ker T = range T = span e₁`, so
  `range T ≠ (ker T)^⊥ = span e₂`, while `T*T = [[0, 0], [0, 1]]` and `T* = [[0, 0], [1, 0]]`
  both have range `span e₂ = (ker T)^⊥`: the identity holds for `T*T` and `T*`, not for T.
- `T₀ = diag(1, 0)` on ℂ² with `V = span e₁`: `T₀V = span e₁`, `(T₀V)^⊥ = span e₂`; for
  `T = diag(1, ε)`, `ε ≠ 0`, the kernel and cokernel vanish and
  `dim ker T₀ − dim ker T = 1 − 0 = dim coker T₀ − dim coker T`.

*Needs:* Mathlib Fredholm package, openness and `Ring.inverse`; Tau Ceti index and adjoint
API; OperatorKTheory K4.1.

### 1.2 Snake sequences of Fredholm maps (I1.2)

For a commuting diagram of continuous linear maps between two **split topologically exact** short
sequences of Hilbert spaces construct the six-term kernel/cokernel snake sequence using
`CategoryTheory.ShortComplex.SnakeInput` and `SnakeInput.snake_lemma` on the corresponding
`ModuleCat ℂ` objects. Prove continuity where it is claimed and independence of the splittings.
For bounded maps in short exact Hilbert sequences derive the topological splittings from
algebraic exactness: images are the closed kernels of the next maps, and the open mapping theorem
with orthogonal complements gives continuous inverses on complements. If two vertical maps are
Fredholm, the snake sequence makes the kernel and algebraic cokernel of the third finite, and
`isClosed_range_of_finite_coker` and `IsFredholm.of_finite_ker_coker` give native Fredholmness:
completeness and boundedness are the hypotheses of that closed-range inference. Derive
`ind T_middle = ind T_left + ind T_right` from exact-sequence dimensions. Give the composition
snake diagram as a comparison with `IsFredholm.index_comp`, and compare the triangular-block
parametrix description with this result.

- If two of the three vertical maps are Fredholm, so is the third, and the indices add.

**Checks.**

- On `0 → ℂ → ℂ² → ℂ → 0` with `i(x) = (x, 0)`, `p(x, y) = y`, the middle map
  `[[0, 1], [0, 0]]` covers `T_left = 0` and `T_right = 0`. All six snake terms are ℂ, the
  connecting map `ker T_right → coker T_left` is the identity, the map `ker T_middle → ker T_right`
  is zero, and the indices are `0 = 0 + 0`.
- On `0 → ℓ² → ℓ² ⊕ ℓ² → ℓ² → 0` with the forward shift S on the left, `S*` on the right and
  `S ⊕ S*` in the middle: `−1 + 1 = 0`.
- The middle map alone says nothing about the outer ones. On ℓ²(ℕ) let `a` send `δ_n` to
  `δ_(2n)` (kernel 0, infinite cokernel), `d(y) = (y₁, y₃, y₅, …)` (surjective, infinite kernel)
  and `b(y) = Σ_n y_(2n) δ_(2n+1)`. Then `(x, y) ↦ (ax + by, dy)` is invertible, of index 0, while
  neither a nor d is Fredholm; in its snake sequence the connecting map `ker d → coker a` is an
  isomorphism of infinite-dimensional spaces. Two of the three maps must be Fredholm.

*Needs:* Mathlib `SnakeInput.snake_lemma` and open mapping; Tau Ceti ClosedRange.

### 1.3 Compatibility conditions and the index-zero alternative (I1.3)

Consume Tau Ceti's `bijective_of_surjective_of_index_eq_zero` and derive its injective
counterpart from `index_of_injective` and the vanishing of a finite cokernel rank, for the
index-zero alternative. For every Hilbert Fredholm map, the image is the common zero set of
`dim ker T* = dim coker T` independent continuous linear compatibility functionals taken from an
adjoint-kernel basis. Their number is minimal: every finite family of linear functionals,
continuous or not, whose common kernel is `range T` has at least `dim coker T` members, and one
attaining that number is independent. Prove the analogous cardinal bound for an arbitrary family
under the same finite-cokernel hypothesis. This minimal number equals `dim ker T` if and only if
`(T : E →ₗ[ℂ] F).index = 0`, and the corresponding Fredholm-alternative statement retains that
equality. The weaker disjunction "bijective or nonzero kernel" alone does not imply index 0.

For an integral equation `(Id + K)u = f` with continuous finite-rank separable kernel
`k(x, y) = Σ_j a_j(x) b_j(y)` on a compact finite-measure space, prove boundedness, finite rank
and the finite matrix reduction, with the real and complex slot conventions and the exact
solvability conditions, using the identity-plus-compact alternative and the index-zero API with
every integrability and continuity hypothesis stated. For the L² separable kernel on a finite
interval: for `f_j, g_j ∈ L²[a, b]` set `Ku = Σ_j ⟨g_j, u⟩ f_j` with the conjugate-first inner
product. Prove that this agrees almost everywhere with integration against
`Σ_j f_j(x) conj(g_j(y))`, is bounded with norm at most `Σ_j ‖f_j‖₂ ‖g_j‖₂` and has finite rank.
For `u + Ku = h` put `c_i = ⟨g_i, u⟩` and prove equivalence with
`c_i + Σ_j ⟨g_i, f_j⟩ c_j = ⟨g_i, h⟩`, reconstructing `u = h − Σ_j c_j f_j`. Derive the
alternative and the compatibility conditions without assuming continuity of the L² factors or of
the kernel.

- `y ∈ range T` exactly when `⟨z, y⟩ = 0` for every z in `ker T*`, for every Fredholm T.
- A finite family of functionals with common kernel `range T` has at least `dim coker T`
  members; equality of this minimum with `dim ker T` is equivalent to index 0.

**Checks.**

- The backward shift `(Bu)_n = u_(n+1)` on ℓ²(ℕ) is surjective with kernel `span δ₀`, index +1;
  it satisfies "bijective or nonzero kernel" but not index 0, so that disjunction is not the
  alternative.
- `T = 0 : ℂ → ℂ²` has `dim coker T = 2`, so two compatibility functionals are needed and
  suffice; the minimum 2 differs from `dim ker T = 1`, matching index `1 − 2 = −1 ≠ 0`.
- On [0, 1] with `f = g = i` (constant): `Ku = ⟨i, u⟩ i = (−i ∫u) i = ∫u`, and `Id + K` sends the
  constant c to 2c, so it is injective. The bilinear slot convention would give `Ku = −∫u` and a
  kernel spanned by 1. With `f = 1`, `g = −1`: `1 + ⟨g, f⟩ = 0`, the kernel is `span 1` and
  `u + Ku = h` is solvable exactly when `∫h = 0`, one condition, index 0.

*Needs:* Tau Ceti Criteria and index API; Layer 1.1's adjoint comparison.

### 1.4 The Calkin quotient (I1.4)

Consume CStarAlgebras C1.6's Calkin algebra `Q(H) = B(H)/K(H)` with its quotient norm and
OperatorKTheory K4.1's reading of Fredholmness as Calkin invertibility. For infinite-dimensional
H the identity is not compact (Riesz's lemma), so `Q(H)` is a nonzero C*-algebra and
`CStarRing.norm_one` gives `‖π(Id_H)‖ = 1`; for finite-dimensional H, including `H = 0`, the
quotient is zero and the norm is 0. Specialize the quotient-norm composition inequality
`‖π(TS)‖ ≤ ‖π(T)‖ ‖π(S)‖` and the compact star ideal's OperatorIdeals approximation and adjoint
comparison. Layer 2.6 normalizes its essential-norm identity by these facts.

**Checks.**

- On ℓ²(ℕ), for any compact K, `‖(Id − K)δ_k‖ → 1` along the unit vectors, so
  `‖π(Id)‖ ≥ 1`, and `‖π(Id)‖ ≤ ‖Id‖ = 1`.
- On ℂ², `K(H) = B(H)` and `‖π(Id)‖ = 0`; a statement of norm one without the
  infinite-dimensional hypothesis is false here.
- The forward shift S on ℓ²(ℕ) has `π(S)*π(S) = π(1)` and `π(S)π(S)* = π(1 − e₀₀) = π(1)`, so
  `π(S)` is unitary, consistent with S Fredholm.

*Needs:* CStarAlgebras C1.6; OperatorKTheory K4.1; OperatorIdeals OI-A25–A30; Mathlib
`CStarRing.norm_one`.

### 1.5 Unitary logarithms and connectedness of `GL(H)` (I1.5)

For a complex Hilbert space H construct, for every unitary U, a bounded self-adjoint A with
`U = exp(iA)` by applying the bounded Borel argument function, with values in `(−π, π]`, to the
spectrum of U (SelfAdjointSpectralTheory Part B); a continuous principal logarithm need not exist
on the spectrum, and Mathlib's `Unitary.argSelfAdjoint` is `0` there. Prove the identity
`selfAdjoint.expUnitary A = U` by Borel-calculus multiplicativity against Mathlib's
`NormedSpace.exp` (uniform polynomial and series approximation and norm control). The path from
`1` to U is Mathlib's `selfAdjoint.expUnitaryPathToOne A`, so every unitary of H lies in the path
component of `1` and `Unitary.mem_pathComponentOne_iff` holds with a single factor; the local
path-connectedness of the unitary group and the path between unitaries at distance less than 2
(`Unitary.joined`) are Mathlib's and are not restated. Combine the path with the positive
invertible factor of the polar decomposition and the linear path from Id to that factor to prove
that `GL(H)` is norm-path-connected.

- Every unitary of a complex Hilbert space is `exp(iA)` for a bounded self-adjoint A with
  `‖A‖ ≤ π`.
- `GL(H)` is path-connected in the operator norm for every complex Hilbert space H.

**Checks.**

- `U = −1` on ℂ: the Borel argument gives `A = π` and `exp(iπ) = −1`; Mathlib's
  `Unitary.argSelfAdjoint` agrees here, since the principal argument is continuous on the singleton
  spectrum `{−1}`.
- The bilateral shift on ℓ²(ℤ) has spectrum the whole circle, so no continuous logarithm exists
  on its spectrum and `Unitary.argSelfAdjoint` returns `0`; the Borel argument still gives A with
  spectrum `[−π, π]`, so the Borel step is not a restatement of the Mathlib argument.
- Over ℝ the statement is false: `Id` and `−Id` on ℝ lie in different components of `GL(ℝ)`
  (determinant sign), so the complex scalars are used.

*Needs:* OperatorTheory SelfAdjointSpectralTheory Part B and PolarDecomposition.

### 1.6 Norm-path classification of Fredholm maps (I1.6)

Define `FredholmLocus` as the subtype `{T : E →L[ℂ] F // T.IsFredholm}` with the operator-norm
subspace topology. For all complex Hilbert spaces `H₀, H₁`, prove that two Fredholm maps are
joined by a norm-continuous path of Fredholm maps if and only if their indices agree (Freed,
display (3.13)). Consume BanachSpaceTheory B5's Hilbert dimension and unitary classification.
Prove invariance of Hilbert dimension under continuous linear equivalence, by the unitary of the
polar decomposition, and its orthogonal-direct-sum cardinal law, including finite-dimensional
additions to an infinite-dimensional space.

Construct the path as follows. In finite dimensions every map is Fredholm and the linear path
suffices. Otherwise use the Fredholm package and pair a kernel basis vector with a cokernel basis
vector by a finite-rank path until only the signed index defect remains. For two resulting maps,
extend finite-subspace orthonormal changes to unitaries on the ambient spaces by a
finite-dimensional rotation on their span and the identity on its orthogonal complement, so that
their kernels and ranges are aligned. Deform the remaining essential isomorphism through
Layer 1.5's paths in `GL` and extend by the finite zero blocks. Every intermediate map is
Fredholm by native finite-rank perturbation, and `Path.index_eq` supplies the converse. The
argument needs no separability of the ambient spaces.

Determine the image of the index. When both spaces are infinite-dimensional of the same Hilbert
dimension κ, identify them with `ℓ²(κ)` and use a countably infinite orthogonal summand for
powers of the shift and its adjoint, extended by the identity on the complement, to realize every
integer; so the index is a bijection from norm-path components onto ℤ without separability. When
both spaces are finite-dimensional the image is the singleton `{dim H₀ − dim H₁}`. When exactly
one is finite-dimensional, or their infinite Hilbert dimensions differ, the Fredholm locus is
empty, by the finite-defect orthogonal decompositions.

- `normPath_iff_index_eq`: for complex Hilbert spaces E and F and `S, T` in `FredholmLocus E F`,
  a path from S to T in the Fredholm locus exists exactly when S and T have the same index.
- `exists_index_eq`: if E and F are unitarily equivalent and infinite-dimensional, every integer
  is the index of some element of `FredholmLocus E F`.
- The Fredholm locus is nonempty exactly when both spaces are finite-dimensional or they have the
  same Hilbert dimension.

**Checks.**

- `E = ℂ²`, `F = ℂ`: every linear map is Fredholm of index 1, the locus is all of `B(ℂ², ℂ)` and
  the straight-line path joins any two maps; `exists_index_eq` does not apply and the image is
  `{1}`, not ℤ.
- `E = ℓ²(ℕ)`, `F = ℂ`: every map has infinite-dimensional kernel, so the locus is empty and
  `normPath_iff_index_eq` holds vacuously.
- `E = F = ℓ²(ℕ)`: Id, the forward shift S and `S*` have indices 0, −1, +1 and lie in three
  different components; `S^k` and `(S*)^k` realize every integer. On `ℓ²(ℝ)`, a shift on the
  closed span of a countable orthonormal family, extended by the identity, has index −1, so no
  separability is needed.
- `ℓ²(ℕ)` and `ℓ²(ℝ)` both have Hamel rank the continuum but Hilbert dimensions ℵ₀ and the
  continuum. There is no Fredholm map `ℓ²(ℕ) → ℓ²(ℝ)`: its closed range would have finite
  codimension, hence be nonseparable, yet it is the image of a separable space. A classification
  by Hamel rank would predict a nonempty locus.

*Needs:* Layer 1.1 package comparison and Layer 1.5; BanachSpaceTheory B5; OperatorTheory
PolarDecomposition; Tau Ceti `Path.index_eq`, `index_add_of_hasFiniteRange`.

### Examples

The finite matrices `0 : ℂ² → ℂ` and the 2×2 nilpotent, the forward and backward shifts on
ℓ²(ℕ), the shifts on ℓ²(ℝ), and the rank-one integral operators on [0, 1] cover each subsection.

### Dependencies

Mathlib's Fredholm and snake-lemma APIs; Tau Ceti's Fredholm index, adjoint, closed-range,
compact- and finite-rank-perturbation and path APIs; OperatorKTheory K4.1; CStarAlgebras C1.6;
BanachSpaceTheory B5; OperatorTheory OperatorIdeals, PolarDecomposition and
SelfAdjointSpectralTheory.

## Layer 2: Symbol classes and the analytic index (I2)

### 2.1 Supports and symbol triples (I2.1)

On a closed M construct the cotangent disc and sphere bundles for a metric and identify
`K(D(T*M), S(T*M))` with `K_c(T*M)`. Compare relative triples, bounded bundle complexes exact off
the zero section and the folded even/odd map. Define the support of a bundle map
`σ : π*E → π*F` as the closed subset outside which σ is invertible; it is distinct from the
support of a section or of a kernel. An elliptic homogeneous symbol of order m defines
`(π*E, π*F, σ)`, exact off the zero section. Normalize it on the unit cosphere and extend
radially; multiplying by positive powers of `|ξ|` changes its representative through an explicit
invertible homotopy and preserves its class, and constant complex phases give invertible
homotopies as well.

**Checks.**

- M a point: `T*M` is a point and the cosphere is empty, so the triple `(ℂ³, ℂ, 0)` is allowed
  and has class `3 − 1 = 2` in `K_c(pt) = ℤ`; a definition requiring equal ranks misses it.
- On `S¹` the symbol of `d/dx` is `iξ`, invertible for `ξ ≠ 0`, so its support is the zero
  section, compact; the identity bundle map has empty support and class 0, although its support
  as a section is all of `T*S¹`.
- `iξ|ξ|^t`, `t ∈ [0, 1]`, is invertible off the zero section throughout and joins `iξ` to
  `iξ|ξ|`; the degree-zero normalization of `iξ` is `i · sign(ξ)`.

*Needs:* TopologicalKTheory T3 relative triples and compact supports; SmoothBundlesConnections
B2–B3 metrics.

### 2.2 Representability of symbol classes (I2.2)

Prove that **every** class in `K_c(T*M)` is represented by a stabilized smooth homogeneous
order-zero elliptic symbol pulled back from bundles on M. Contract the disc fibres to pull the
two bundles back to the base by TopologicalKTheory T1's homotopy classification, retain and
transport the boundary isomorphism, smooth the bundles and the isomorphism on the compact
cosphere and extend by degree-zero homogeneity with a frequency cutoff. In dimension 0 the
cosphere is empty and arbitrary point triples of unequal ranks are allowed. Quantize by
PseudodifferentialOperators P4.2's square partition and continuous symbol lift. Prove that the
cosphere and relative-triple constructions agree in K-theory and in the operator topology; an
ordinary partition of unity used symmetrically is not a square partition.

**Checks.**

- On a point every class `a − b` is represented by `(ℂ^a, ℂ^b, 0)`.
- On `S¹` the class of `iξ` is represented by the degree-zero symbol `i · sign(ξ)` between
  trivial lines; its class is unchanged by the homogeneity rescaling of 2.1.
- A partition `{φ_i}` with `Σ φ_i = 1` but `Σ φ_i² ≠ 1` gives `Σ φ_i A φ_i` with principal
  symbol `(Σ φ_i²) σ ≠ σ`; the square partition `Σ φ_i² = 1` keeps σ.

*Needs:* TopologicalKTheory T1 and T4 smoothing; PseudodifferentialOperators P4.

### 2.3 The analytic index (I2.3)

Define `ind_a : K_c(T*M) → ℤ` by the native Fredholm index of an order-zero realization on the
shared L² bundle spaces (Atiyah–Singer I, (6.1)–(6.5), pp. 517–518). Show that two
quantizations of the same symbol differ by order −1, hence by a compact map, and that symbol
homotopies lift to norm-continuous elliptic families. Degenerate triples realize isomorphisms of
index 0, and stabilization and direct sums have the required index laws. Changes of base bundle
are handled by smoothing the specified isomorphisms and transporting the Hilbert realization. Thus
`ind_a` is an additive homomorphism independent of representative, partition, smoothing and
quantization. Compare an order-m realization `H^(s+m)(E) → H^s(F)` with `ind_a` through
PseudodifferentialOperators P7's elliptic power isomorphisms; spectral existence of a square root
alone is not the pseudodifferential order theorem.

**Checks.**

- M a point: `ind_a(ℂ^a, ℂ^b, 0) = a − b`; the opposite convention gives `b − a`.
- On `S¹`, `d/dx` has kernel the constants and range the mean-zero functions, so index
  `1 − 1 = 0`.
- The formal adjoint has the inverse class: `ind_a(F, E, σ*) = −ind_a(E, F, σ)`, as on a point
  `(ℂ^b, ℂ^a, 0)` gives `b − a`.

*Needs:* Layer 2.2; PseudodifferentialOperators P5–P7; Tau Ceti
`index_add_of_isCompactOperator` and `Path.index_eq`.

### 2.4 Naturality and elliptic complexes (I2.4)

Export invariance of `ind_a` under change of metric and Sobolev order, diffeomorphism
naturality, orientation independence, direct sums, the formal-adjoint sign and the invertible
and finite-dimensional cases. For a finite common-order elliptic complex identify the folded
symbol class and index with the alternating sum of cohomology dimensions through
PseudodifferentialOperators P7's Hodge decomposition (Atiyah–Singer I, §7, p. 520). Ellipticity of
the de Rham symbol complex means exactness away from the zero section; it does not assert
ellipticity of the individual arrows. In dimension at least two the arrows have noninvertible
symbols, while in dimension one `d : Ω⁰ → Ω¹` is itself elliptic. Compare the de Rham and
Dolbeault Laplace realizations by their proved uniqueness maps.

**Checks.**

- On `S²` the symbol `ξ ∧ ·` of `d : Ω⁰ → Ω¹` is injective but not surjective for `ξ ≠ 0`
  (rank 1 into rank 2), while the folded complex `Ω^even → Ω^odd` is invertible off zero.
- On `S¹` the de Rham complex has cohomology dimensions 1 and 1, folded index 0.
- Changing the metric on `S²` leaves the folded de Rham index `1 − 0 + 1 = 2`.

*Needs:* Layer 2.3; PseudodifferentialOperators P7; ComplexKahlerGeometry K5.

### 2.5 Excision, local difference classes and cut-and-paste (I2.5)

Construct analytic excision (Atiyah–Singer I, §8, axiom (B1), pp. 522–523): for an open
`U ⊂ M` and a compactly supported class `a ∈ K_c(T*U)` define its local index by extension to a
closed ambient manifold and prove independence of the ambient manifold. Build representatives
equal to an identified identity bundle map outside a relatively compact neighbourhood, using the
support-triple, stabilization and bundle-extension APIs. Localize their properly supported
quantizations so that the operator is exactly Id on the outside block and has no cross terms
across a smaller support neighbourhood. Prove the resulting block decomposition of L² and the
kernel and cokernel comparison between two ambients; discarded smooth kernels give compact
perturbations. Nested cutoffs and collars justify the block separation for the nonlocal
operator. Prove additivity for disjoint supports, naturality for open embeddings and composition
of open extensions, on support classes over every U admitting the specified compact ambient
embeddings.

Build the local difference class of two elliptic symbol triples with specified identifications
and a symbol homotopy outside a compact subset of an embedded disc D. Construct `d ∈ K_c(T*D)`
by relative clutching and prove `[σ′] − [σ] = ext_D(d)`. The outside identification and homotopy
are part of the data; d depends only on their restriction to the disc with a boundary collar and
is compatible with orientation-preserving coordinate identifications. Excision gives the
corresponding difference of analytic indices as the ambient-independent local index of d.
Realize the difference by the direct sum of the σ′ triple and the inverse triple `(F, E, σ⁻¹)`,
homotopic to `(F, E, σ*)` by the positive polar factor. On the cosphere over the outside use the
specified homotopy, polar-unitarize the invertible symbol and apply the block rotation
`[[cos(t)σ, −sin(t)Id], [sin(t)Id, cos(t)σ*]]`, `0 ≤ t ≤ π/2`, to trivialize the symbol plus its
inverse. A base cutoff splices this nullhomotopy across a collar inside the base support
neighbourhood; no polar unitarization at a zero covector is needed. The resulting supported
triple represents d.

Prove the operator cut-and-paste index theorem for compact pieces with identified boundary and
compatible collars, consuming GeometricTopology Layer 1's smooth full-boundary gluing. Write
`M₁ = A ∪ B`, `M₂ = C ∪ D`, `M₃ = A ∪ D`, `M₄ = C ∪ B` with fixed collar gluing maps. Fix common
model bundles `E_N, F_N` on a collar `N ≃ Y × (−1, 1)` and identifications with the bundles on
each piece, and glue every `M_i` with exactly these identifications. All restriction and gluing
squares commute, so the four collar comparisons have one common fibre and satisfy the cocycle
condition. Choose compatible metrics and densities there. For elliptic differential operators
`P_i` of the same positive order m, require one common transported principal part on **each**
shared piece, including the collar; differences on a piece have order at most `m − 1` with smooth
coefficients. Construct Sobolev isomorphisms `W_E, W_F` between the two direct-sum realizations
by the collar rotation `u₃ = φu₁ + ψu₂`, `u₄ = φu₂ − ψu₁`, with `φ = cos(πχ/2)`, `ψ = sin(πχ/2)`
for a smooth cutoff χ equal to 0 near the A/C end and 1 near the B/D end, using the piecewise
identity or swap with the indicated minus sign outside the collar, and prove gluing and inverse
compatibility on every `H^s`. Prove that `W_F(P₁ ⊕ P₂)W_E⁻¹ − (P₃ ⊕ P₄)` has order at most `m − 1`,
from the collar commutators and the lower-order discrepancies. ComplexKahlerGeometry K5a's Rellich
theorem makes it compact `H^m → L²`, so Layer 1's equivalence and compact-perturbation laws give
`ind P₁ + ind P₂ = ind P₃ + ind P₄`. This compares operators on the four manifolds without
decomposing their K-classes into open-support classes.

- The local index of `a ∈ K_c(T*U)` is independent of the closed ambient manifold, additive on
  disjoint supports and natural for open embeddings.
- `ind_a(σ′) − ind_a(σ)` is the local index of the difference class d.
- `ind P₁ + ind P₂ = ind P₃ + ind P₄` under the common-collar hypotheses.

**Checks.**

- At `t = π/2` the block rotation is `[[0, −Id], [Id, 0]]`, invertible and independent of σ, so
  `[σ] + [σ⁻¹] = 0`; at `t = 0` it is `diag(σ, σ*)`.
- Trivial line Dolbeault operators on `Σ_g # Σ_h`, `ℂP¹`, `Σ_g`, `Σ_h` (Layer 7.4):
  `(1 − g − h) + 1 = (1 − g) + (1 − h)`.
- If the principal parts `p₁, p₂` of `P₁, P₂` differ on the collar, conjugating `diag(P₁, P₂)` by
  the rotation `[[φ, ψ], [−ψ, φ]]` produces the off-diagonal principal term `φψ(p₂ − p₁)`; for
  `p₁ = d/dx` and `p₂ = 2 d/dx` it is `φψ d/dx`, of order 1 where `φψ ≠ 0` and not compact
  `H¹ → L²`, so the common-principal-part hypothesis is not removable.

*Needs:* Layers 2.1–2.3; GeometricTopology Layer 1 gluing and collars; ComplexKahlerGeometry
K5a; PseudodifferentialOperators P4 properly supported quantization.

### 2.6 The norm closure of the order-zero algebra (I2.6)

Build the **norm closure** of the order-zero classical endomorphism algebra `Ψ⁰(M; E)` in
`B(L²(E))`, using PseudodifferentialOperators' operator realization and adjoint. Its smoothing
ideal has closure `K(L²(E))`: smooth-section rank-one kernels are smoothing, smooth L² density
approximates arbitrary finite-rank maps and the OperatorIdeals approximation identifies their
closure. Construct the continuous principal-symbol map and prove the exact C*-sequence
`0 → K(L²(E)) → closure Ψ⁰ → C(S*M; End(π*E)) → 0`. The final algebra is HilbertModules H5's
continuous-section C*-algebra of the finite Hermitian endomorphism bundle, with pointwise adjoint
and composition and the supremum norm; compare its carrier with the Hom bundle of
TopologicalKTheory and SmoothBundlesConnections rather than a fixed-fibre `C(X, A)`. Prove the
essential-norm identity `‖π_Calkin(P)‖ = sup_(S*M) ‖σ₀(P)‖`. For the lower bound use normalized
compact-chart high-frequency wave packets converging weakly to 0 and the principal-symbol
asymptotics on them. For the upper bound take C strictly above the supremum, construct the smooth
matrix square root of `C² Id − σ₀(P)*σ₀(P)` by a power series converging in every `C^k`
seminorm (the uniform strict spectral gap gives geometric coefficient decay after each finite
derivative), extend it with degree-zero homogeneity off zero and a smooth cutoff at zero to a
classical order-zero symbol, quantize it, and use composition and adjoints modulo compact maps
and positivity in the Calkin algebra; then let C decrease to the supremum. Smooth symbol density
on the compact cosphere and the quotient isometry give surjectivity, and the zero-symbol kernel is
exactly the compact ideal. Export norm and topology, restriction of bundle isomorphisms, finite
blocks, adjoints, quotient functional calculus and equivariant transport. In dimension 0 the
cosphere is empty and L² finite, so both the quotient and the symbol algebra are zero.

For continuous off-zero homogeneous symbols define realizations through this completion and prove
Fredholmness if and only if the quotient symbol is invertible, with independence modulo compact
maps. For the reverse implication consume CStarAlgebras C1.3's spectral permanence for the unital
closed quotient-symbol subalgebra of the Calkin algebra: a Calkin-invertible image is invertible
in that subalgebra. Smooth invariant approximants preserve invertibility uniformly and give the
same index. This connector supplements PseudodifferentialOperators' classical calculus.

**Checks.**

- Multiplication by a continuous function a on `L²(S¹)` has `σ₀ = a(x)`, constant in ξ, and
  essential norm `sup |a|`.
- The Fourier projection `P_≥0` on `S¹` has `σ₀ = 1` for `ξ > 0` and 0 for `ξ < 0`; its essential
  norm is 1 = the supremum, and it is not compact.
- A compact operator has symbol 0 and essential norm 0; in dimension 0 every operator is compact
  and the sequence is `0 → B(L²) → B(L²) → 0 → 0`.

*Needs:* Layer 1.4; PseudodifferentialOperators P3–P6; HilbertModules H5; CStarAlgebras C1.3 and
C1.6; OperatorIdeals OI-A25–A30.

### Examples

Point triples, `d/dx` and `i · sign(ξ)` on `S¹`, the de Rham complex of `S²`, the circle Fourier
projection and the trivial-line Dolbeault operators on glued surfaces.

### Dependencies

Layer 1; TopologicalKTheory T1, T3 and T4; PseudodifferentialOperators P3–P7; ComplexKahlerGeometry
K5 and K5a; GeometricTopology Layer 1; HilbertModules H5; CStarAlgebras C1.3 and C1.6.

## Layer 3: Cotangent pushforwards and the topological index (I3)

### 3.1 The normal complex structure of the tangent map (I3.1)

For a smooth closed embedding `f : M → N` construct the normal exact sequence of
`Tf : TM → TN`, identified over TM with two copies of `π*ν_f` after choosing metric connections
and splitting the tangent sequence. Prove this through chart derivatives and the
horizontal/vertical tangent identifications, including the connection-dependent off-diagonal
terms. The horizontal base-normal copy is x and the vertical cotangent-normal copy is v; this
order fixes `z = v − ix` rather than its conjugate. Transport to `T*M` and `T*N` by musical maps.
The normal complex structure is `z = v − ix` on `π*ν_f ⊕ π*ν_f`, naturally identified with
`π*(ν_f ⊗ ℂ)`. All choices are joined by compatible splittings and metrics and induce the same
compactly supported K-map. The tubular neighbourhood may be shrunk over the noncompact cotangent
base; extension preserves the compact support of each class.

**Checks.**

- For `f = id`, `ν_f = 0` and the normal structure is the zero bundle.
- For `0 → ℝ` with `ν = ℝ`: `T(T*ℝ)` at the origin is `ℝ_x ⊕ ℝ_v` with `z = v − ix`, so
  `(x, v) = (1, 0)` has `z = −i` and `(0, 1)` has `z = 1`; the conjugate convention `v + ix`
  reverses the orientation of the normal plane.
- Two metric splittings of `TM → TN|M` differ by a map into the normal bundle and are joined by
  the linear path of splittings.

*Needs:* GeometricTopology Layer 1 tubular neighbourhoods; HopfRinow Layer 1; SmoothBundlesConnections
B3–B4.

### 3.2 The cotangent pushforward (I3.2)

Define `f_!^T : K_c(T*M) → K_c(T*N)` by **consuming** TopologicalKTheory T5.5's complex-normal
pushforward for the bundle `E = π*(ν_f ⊗ ℂ)` of 3.1 and converting its dual convention through
the unit `(−1)^r [det E]`, `r = dim N − dim M`, so that the Thom multiplier is `w_E`
(Atiyah–Singer I, §3, pp. 497–499). Derive identity, composition, isotopy and stabilization,
open-extension, product and module laws from TopologicalKTheory T5.4–T5.5, proving that the unit
conversion commutes with each diagram. For composition use the normal-sequence sum comparison of
3.1 and determinant multiplicativity. No orientation on `ν_f` is needed. Export the
cotangent-specific dictionary and geometric choice independence, without a second general
K-theory pushforward construction.

**Checks.**

- `f = id`: `r = 0`, the conversion unit is `(−1)^0 [det 0] = 1` and `f_!^T` is the identity.
- For a composite `g ∘ f` the normal bundle is `ν_f ⊕ f*ν_g`, and
  `(−1)^(r_f + r_g) det(ν_f ⊗ ℂ) det(f*ν_g ⊗ ℂ) = (−1)^(r_(g∘f)) det(ν_(g∘f) ⊗ ℂ)`.
- The point into ℝ: the wedge class is `β` and the dual class `−β`. Using the dual class without
  the conversion multiplies a pushforward by `(−1)^r det(ν_f ⊗ ℂ)`, a sign flip in odd codimension
  when `ν_f` is orientable and a twist by a nontrivial line otherwise.

*Needs:* Layer 3.1; TopologicalKTheory T5.4–T5.5.

### 3.3 The topological index (I3.3)

For an embedding `j : M → V = ℝ^N` define `ind_t(a) = Bott_V⁻¹(j_!^T a)`, where `Bott_V` sends 1
to `w_(V_ℂ)` on `T*V` (Atiyah–Singer I, §3, pp. 497–499). Prove additivity and independence of
embedding and dimension: for two embeddings use `(cos t · j₀, sin t · j₁)` in `V₀ ⊕ V₁` for
`t ∈ [0, π/2]`, an embedding throughout, and endpoint stabilization by a trivial normal space.
Derive independence of metrics, connections, tubular neighbourhoods and musical maps, and the
corresponding topological open-excision and diffeomorphism laws. The comparison with the analytic
index is Layers 4–5.

**Checks.**

- The point's wedge-Koszul pushforward into `ℝ^N` has `ind_t = 1` for every N.
- In complex rank 1, `ind_t(β) = +1` and `ind_t(u^dual) = −1`.
- `(cos t · j₀, sin t · j₁)` is injective for `t ∈ (0, π/2)` because each nonzero coordinate
  map is, and at `t = 0, π/2` it is `j₀` or `j₁` with a zero second component.

*Needs:* Layer 3.2; TopologicalKTheory T4 Bott periodicity.

### 3.4 Equivariant embeddings and the equivariant topological index (I3.4)

For a compact Lie group G acting on a closed M construct a finite-dimensional real orthogonal
G-representation V and a smooth G-equivariant embedding `M → V`. Start from a smooth finite
coordinate embedding, approximate its translates by finite Peter–Weyl sums in `C¹` norm uniformly
on compact M, and prove derivative convergence by differentiation under Haar integration and
smooth coefficient estimates. Assemble the finite matrix coefficients into an equivariant
vector-valued map and preserve injectivity and immersion by compact `C¹` stability: extract the
immersion and separation estimates from CharacteristicClasses C2.5's compact-stage general
position, then prove stability for the finite Peter–Weyl approximants. Apply CompactGroups
Layer 5's G-finite density theorem for Banach representations of compact groups (the contract
`gap:banach-gfinite-density`) to the `C¹`-section norm after building the strongly continuous
action and the differentiation bounds, as TopologicalKTheory T6.1 does for the sup and L² norms. Average the representation metric.
Prove equivariant tubular and normal comparisons by averaging connections and invariant metrics,
then define `ind_t^G : K_(G,c)(T*M) → R(G)` through equivariant wedge Thom and Bott classes on
`V ⊗ ℂ`. Prove choice independence by the same direct-sum embedding homotopy, restriction to
closed subgroups, `R(G)`-linearity and compatibility with the forgetful map, using T6's
continuous finite-dimensional representation category and its SplitK0 ring, including
disconnected G.

**Checks.**

- For the trivial group, `ind_t^G = ind_t`.
- O(1) acting on `S¹ ⊂ ℝ²` by `(x, y) ↦ (x, −y)` embeds equivariantly in `ℝ ⊕ ℝ_sgn`.
- Restricting `ind_t^G` along `{1} → G` gives the dimension of `ind_t^G(a)`.

*Needs:* Layer 3.3; RepresentationTheory CompactGroups Layer 5 (`gap:banach-gfinite-density`) and
LieGroups Layer 6; TopologicalKTheory T6 and T6.1; CharacteristicClasses C2.5.

### 3.5 Uniqueness of index assignments (I3.5)

Prove uniqueness for additive integer-valued assignments on `K_c(T*M)` for **closed** smooth M
that respect cotangent closed-embedding pushforward and take 1 at the point (Atiyah–Singer I,
§4, Proposition 4.1, p. 502). Embed M in V and then in its representation sphere `V ∪ ∞`; the
point pushforward is a Bott isomorphism on the open V chart, so its image determines the
assignment after the embedding comparison. For a compact Lie group G prove the same theorem for
`R(G)`-linear additive assignments on `K_(G,c)(T*M)` for closed G-manifolds, respecting
equivariant closed embeddings and giving 1 at the point: use 3.4's equivariant embedding
`M → V` and the smooth representation sphere `S(V ⊕ ℝ)`, and compare the embeddings
`M → S(V ⊕ ℝ)` and `pt → S(V ⊕ ℝ)` through the open V chart and the equivariant Bott
isomorphism. Layer 2.5's compactly supported open-extension comparison supplies the local-index
version.

**Checks.**

- The zero assignment and `2 · ind_t` are additive and respect pushforwards, but take values 0
  and 2 at the point; the normalization excludes them.
- On `M = pt` the assignment is determined by its value 1 on the generator.
- For `G = O(1)` on a point, `R(O(1)) = ℤ[sgn]/(sgn² − 1)` and the normalization fixes the value
  1, not `sgn`.

*Needs:* Layers 3.3–3.4; TopologicalKTheory T6 equivariant Bott isomorphism.

### Examples

The identity embedding, points in `ℝ^N`, the rank-one classes β and `u^dual`, and the reflection
action on `S¹`.

### Dependencies

Layer 2 for supports; TopologicalKTheory T4–T6; GeometricTopology Layer 1; HopfRinow Layer 1;
RepresentationTheory CompactGroups and LieGroups Layer 6; CharacteristicClasses C2.5.

## Layer 4: Equivariant analytic indices and associated fibres (I4)

### 4.1 The equivariant index of a Fredholm intertwiner (I4.1)

Let T intertwine strongly continuous unitary actions of a compact Lie group G on complex Hilbert
spaces and be Fredholm. Define `ind_G(T)` as PseudodifferentialOperators P7's virtual
kernel/cokernel class in TopologicalKTheory T6.2's continuous-representation SplitK0 ring,
consuming its restriction and quotient continuity theorem. Prove additivity, the adjoint sign,
pullback along continuous homomorphisms of compact Lie groups (including noninjective ones),
restriction to subgroups and the forgetful map, tensoring with a finite representation and
conjugation by equivariant Hilbert isomorphisms. Consume P7's equivariant Fredholm local-constancy
and homotopy theorem for this class; individual kernel dimensions need not be locally constant.

**Checks.**

- `0 : ℂ_χ → 0` for a character χ of U(1) has `ind_G = [χ]`; forgetting the action gives 1.
- `ind_G(T*) = −ind_G(T)`, since `coker T ≃ ker T*` as representations.
- Pullback along `G → {1}` sends n to n copies of the trivial representation.

*Needs:* PseudodifferentialOperators P7; TopologicalKTheory T6.2.

### 4.2 Equivariant symbols, quantization and excision (I4.2)

Prove the equivariant representability and smoothing version of 2.2, including an equivariant
radial disc contraction: construct its bundle transport from the invariant Hermitian projected
connection after smoothing, so that both disc bundles come from their zero-section restrictions,
and retain the transported boundary isomorphism. Embed each continuous finite-rank G-bundle over
compact M in a finite unitary G-representation by TopologicalKTheory T6.1. Smooth its equivariant
self-adjoint projection matrix by chart approximation, Haar averaging and spectral projection
across the uniform gap at 1/2; nearby projections have equivariantly isomorphic image bundles and
are joined by an equivariant homotopy. For boundary isomorphisms smooth and average in the Hom
bundle, use uniform invertibility on the compact cosphere and preserve specified collar data by
invariant cutoffs. Give relative and compact-parameter versions with the same uniform gap;
parameters are continuous and smoothing is only in the manifold variables. This realizes every
class of `K_(G,c)(T*M)` by a smooth invariant homogeneous elliptic symbol, including the O(n)
sphere point classes of Layer 5.

Choose invariant metrics and connections, quantize, then Haar-average the operator. Consume
PseudodifferentialOperators P5's seminorm/Bochner topology comparison to prove that it remains
classical with the same principal symbol and depends continuously on compact parameters. Obtain
`ind_a^G : K_(G,c)(T*M) → R(G)` with equivariant homotopy, direct-sum, adjoint and diffeomorphism
laws and `R(G)`-linearity. Prove equivariant analytic excision: for an invariant open U with
compactly supported symbol and equivariant closed ambients, use invariant neighbourhoods, cutoffs
and collars in 2.5's construction. Haar averaging preserves the exact identified identity
operator outside the invariant support neighbourhood. The kernel and cokernel extension maps are
equivariant isomorphisms, so ambient independence and open-extension composition hold in `R(G)`,
not only after taking dimensions. Consume T6.1 and P7's unitary strongly continuous L² and
graph-`H¹` actions; for other real Sobolev orders and invariant connection data use P7's spectral
norms and the commutation of powers with G to obtain unitary actions, compared with K5a's chart
norms. Prove strong continuity first on smooth sections, then by density and uniform bounds.
Averaging symbol coefficients and norm continuity of operator parameter families are distinct
comparisons; the G action itself need only be strongly continuous. The finite-cokernel
stabilization of an elliptic family (Atiyah, *Bott periodicity and the index of elliptic
operators*, §2) is consumed from TopologicalKTheory T6.

**Checks.**

- For trivial G, `ind_a^G = ind_a`.
- SO(2) acting on `S²` by rotation: the de Rham operator has `ind_a^G = 1 + 1 = 2` copies of the
  trivial representation (Layer 5.1 with `det = 1` on SO(2)).
- The spectral projection of a self-adjoint idempotent perturbed by norm less than 1/2 has the
  same rank; at distance exactly 1/2 the gap closes and the construction fails.

*Needs:* Layers 2.2–2.5 and 4.1; TopologicalKTheory T6.1; PseudodifferentialOperators P5 and P7;
ComplexKahlerGeometry K5a.

### 4.3 External products (I4.3)

Consume PseudodifferentialOperators P7's graded external-product symbol and operator comparison,
completed Hilbert tensor and jointly commuting square-operator expansions. Prove the equivariant
version by transporting every construction through product actions, obtaining
`ind_(G×H)(a ⊠ b) = ind_G(a) ⊠ ind_H(b)` (Atiyah–Singer I, §4, axiom (B3), p. 504). Keep row and
column order and grading explicit: odd blocks anticommute after inserting Γ in the second factor,
so their square is the positive tensor sum and its kernel is the graded tensor of the factor
kernels. Naively lifting separate symbols near `ξ = 0` or `η = 0` need not define a joint symbol;
the PseudodifferentialOperators cutoffs and homotopy comparison are part of the dependency. Prove
compatibility of the product index with compactly supported open extensions, including different
compact ambients of the common product chart, by TopologicalKTheory's product and support diagram
and 4.2's equivariant excision.

**Checks.**

- Point triples `(ℂ², ℂ, 0) ⊠ (ℂ, ℂ³, 0)`: even part `ℂ² ⊗ ℂ ⊕ ℂ ⊗ ℂ³` of dimension 5, odd part
  `ℂ² ⊗ ℂ³ ⊕ ℂ ⊗ ℂ` of dimension 7, index `5 − 7 = −2 = 1 · (−2)`.
- Without Γ in the second factor the odd blocks commute and the square acquires cross terms
  `2 A ⊗ B`, whose kernel is not the graded tensor product.
- `d/dx ⊠ d/dy` on `S¹ × S¹` has index `0 · 0 = 0`.

*Needs:* Layers 4.1–4.2; PseudodifferentialOperators P7; TopologicalKTheory T6.

### 4.4 The fixed associated-fibre product theorem (I4.4)

Prove the **fixed associated-fibre** product theorem (Atiyah–Singer I, §4, axiom (B3′), p. 504).
Let `P → M` be a smooth principal H-bundle with commuting G-action, F a closed (G×H)-manifold and
Q a fixed (G×H)-equivariant graded elliptic operator on F, so that `b = [σ_Q]` lies in
`K_(G×H,c)(T*F)`, identified with TopologicalKTheory T6.8's TF through the invariant fibre metric.
G acts diagonally on `Z = P ×_H F` and on all associated bundles. Choose invariant base and fibre
metrics and an invariant H-connection, with the horizontal/vertical product metric on Z; its
density is the product density in unitary principal trivializations. The index comparison is
independent of this metric by Layers 2 and 4. For a base symbol a the result is
`ind_a^G(a · [P ×_H ker Q⁺]) − ind_a^G(a · [P ×_H ker Q⁻])`, where `Q⁺, Q⁻` are the even and odd
kernel spaces of its self-adjoint odd block; the associated kernel bundles carry both the
principal H descent and the residual G action. The proof goes through the following operator
realization and comparison.

Normalize Q and a chosen base odd block to order 1 by PseudodifferentialOperators P7's positive
powers, retaining kernel, equivariance and principal-class comparison. For the discrete
eigenvalues λ of `Q²` let `E_λ` be the finite-dimensional graded eigenspace with its commuting
G×H representation and Q action. Define the dense vertical core on Z as the algebraic direct sum
of smooth base sections of the finite bundles `P ×_H E_λ`, with the base coefficient bundles
included, and prove that its L² completion is L² of the external associated coefficient bundle on
Z by local Fubini and the vertical eigen-expansion. Construct `A_λ` by lifting the same localized
base odd operators in principal trivializations, conjugating by the finite H-representation
transitions, patching with a square partition and averaging over G (Atiyah–Singer I, §9, p. 526).
On finite tensor sections the flat lift acts as `P_base ⊗ Id`. Principal trivializations are
L²-unitary for the chosen density and metrics, so these odd patched operators are formally
self-adjoint. The completed horizontal operator A restricts on each finite-spectral smooth block
to `A_λ` exactly; averaging commutes with this restriction since G commutes with `Q²` and its
spectral projections. Multiplication, transitions and each flat local lift intertwine Q, so the
commutation is exact on every λ block. These are ordinary base pseudodifferential operators
twisted by `P ×_H E_λ`, with their full lower-order terms. Compare the choice with a
connection-based quantization through its principal-symbol homotopy; a tensor product of global
kernels is not the construction. Bound infinitesimal H-actions by
`‖dρ(X)v‖_(H^s) ≤ C_X ‖v‖_(H^(s+1))` from their vertical differential expression and P5,
translate this into polynomial eigenvalue bounds through P7 and prove the mixed chart, connection
and symbol estimates uniformly in λ; these control the unbounded vertical generators in the
horizontal connection.

Define `D_λ = A_λ + Γ_base Q|E_λ` on its base `H¹` domain and prove it self-adjoint, odd and
`D_λ² = A_λ² + λ`, first on the smooth core and then as closed operators and forms. Define D as
their Hilbert direct sum with **specified domain**
`{(u_λ) : u_λ ∈ Dom D_λ, Σ‖u_λ‖² < ∞, Σ‖D_λ u_λ‖² < ∞}`. Construct its closed graph, adjoint and
resolvent from the block resolvents and prove that the finite-spectral smooth core is a core.
Compactness of each base resolvent and the bound `(1 + λ)^(−1/2)` on the tail give compact
resolvent for D; finite vertical spectra and zero complements are treated directly. Its bounded
transform `B = D(1 + D²)^(−1/2)` is a bounded odd Fredholm map. For `λ > 0` the positive square
gives no kernel, and `λ = 0` compresses exactly to the base operators twisted by the finite
`ker Q` bundles; this proves the representation-valued kernel and index formula on the domain
objects.

Define `Op¹(E, F)` as the space of bounded maps `H¹(E) → L²(F)` whose distributional formal
adjoint is also bounded `H¹(F) → L²(E)`, normed by the sum of the two operator norms. Construct
zero, addition, the scalar action `c · (P, P†) = (cP, conj(c) P†)`, the conjugate-linear adjoint
involution, extensionality from dense smooth sections, norm bounds and completeness as the closed
formal-adjoint relation in the product of the two bounded-map Banach spaces, with transport
through Sobolev isomorphisms and restriction and localization. Define the completed first-order
class as the closure there of PseudodifferentialOperators' classical order-one maps, with their
continuous homogeneous principal symbols on the cosphere, and prove symbol continuity by
localized high-frequency tests. Construct the local positive-order lift into this closure: on
product charts regularize the joint symbol by a smooth homogeneous cutoff in `|ξ| ≤ ε|η|` and a
low-frequency cutoff of radius R, whose error has compact-chart derivative bounds
`‖∂_(x,y)^α error(ξ, η)‖ ≤ C_α (ε + R⁻¹) ⟨(ξ, η)⟩`. Choosing `R ≥ ε⁻¹` before letting ε tend to 0
gives a uniform `O(ε)` bound for the finitely many derivative orders that the weighted
Fourier–Schur estimates need; prove those estimates `H¹ → L²` by P5's Fourier–Schur method, with
no frequency-derivative bound uniform in ε, and apply the same argument to the formal adjoint.
This gives convergence in `Op¹`, not merely of symbols. Transport through smooth principal charts
by K5a's coordinate bounds, patch and average, and prove continuity of the G-conjugation action
on the closure from classical density and uniform Sobolev action bounds.

The completed horizontal odd map A has continuous joint symbol `α₁(ξ, η)`, acts only in the base
coefficient grading and reduces to `a₁(ξ)` when the vertical covector η is zero; the vertical lift
is built likewise, so `D = A + Γ_base Q` is in the completed first-order class. The joint symbol
is elliptic: for `η ≠ 0` the positive vertical square is invertible, and for `η = 0` the base
symbol is invertible. After an invariant splitting homotope `α₁` to the pure horizontal `a₁(ξ_h)`
while retaining its self-adjoint odd base action; the same square argument preserves ellipticity
throughout. This identifies the class with TopologicalKTheory T6.8's associated product,
including different chart and splitting choices.

Let `Λ = (1 + ∇*∇)^(1/2)` on the total coefficient bundle, by P7. Multiplying the `Op¹`
approximants by `Λ⁻¹` gives operator-norm convergence in L² into 2.6's closure of `Ψ⁰`, with
quotient symbol `D₁(ζ)/|ζ|`; 2.6 and Atkinson's theorem give Fredholmness on the `H¹` domain and
index equality with any sufficiently close smooth elliptic symbol. Prove that this `H¹` domain is
the spectral direct-sum graph domain above: on principal charts its norm is equivalent to the L²
norm plus the vertical Q norm and the horizontal first-derivative norms, by fixed-fibre
ellipticity and K5a and P5 localization. Finite `Q²` truncations commute with the horizontal
connection derivatives and converge in this norm. For the patched A, the Fredholm bound and its
smooth finite `λ = 0` kernel give the converse graph estimate
`‖u‖_(H¹) ≤ C(‖Du‖_(L²) + ‖u‖_(L²))` on the common core. Complete the core in both norms to
identify domains, formal adjoints and defect spaces; this also compares the bounded transform B's
index with the `H¹ → L²` realization without presuming its pseudodifferential membership. Export
choice independence, G-equivariance, twisting, base change and support laws, and compare the
trivial principal case with P7's product realization. Arbitrary varying fibre operators are
outside these hypotheses.

- `ind_a^G(a · b) = ind_a^G(a · [P ×_H ker Q⁺]) − ind_a^G(a · [P ×_H ker Q⁻])` in `R(G)`.
- `Op¹(E, F)` is a Banach space with a conjugate-linear isometric adjoint involution.

**Checks.**

- F a point and Q the zero map `ℂ^p → ℂ^q`: `Z = M`, the kernel bundles are trivial of ranks p
  and q, and the formula reads `ind_a(a) · (p − q)`.
- `P = M × H` trivial: Z is `M × F` and the theorem is 4.3's product formula.
- The scalar action at `c = i` sends `(P, P†)` to `(iP, −iP†)`; a complex-linear action on the
  second slot would break the adjoint relation `⟨iPu, v⟩ = ⟨u, −iP†v⟩`.

*Needs:* Layers 2.6, 4.1–4.3; PseudodifferentialOperators P5 and P7; ComplexKahlerGeometry K5a;
TopologicalKTheory T6.8; OperatorKTheory K4.1; SmoothBundlesConnections B3–B4 principal and
associated bundles.

### Examples

Finite representations on a point, the rotation action on `S²`, products of circle operators
and the trivial principal bundle.

### Dependencies

Layers 1–3; PseudodifferentialOperators P5 and P7; TopologicalKTheory T6; ComplexKahlerGeometry
K5a; SmoothBundlesConnections B3–B4; OperatorKTheory K4.1.

## Layer 5: Equivariant Bott index and the embedding theorem (I5)

### 5.1 The representation-valued de Rham index of a sphere (I5.1)

On `S(V) = V ∪ ∞` with O(V) acting linearly, compute the representation-valued de Rham index as
`1 + (−1)^n det(V)` for `n > 0`, by Hodge theory and the action on top cohomology; the top
representation is the determinant in every positive n. Consume TopologicalKTheory T7.5's two-disc
reflection/Koszul homotopy to get `ρ_S = q₀ + κ*q∞`, `κ(x, ξ) = (x, −ξ)`, with compact support and
the fixed `z = v − ix` convention (Atiyah–Singer I, Lemma 3.2). Compare `q₀, q∞` with the wedge
cotangent point pushforwards, retaining the dual/wedge conversion, and prove
`κ*w_(V_ℂ) = (−1)^n det(V_ℂ) · w_(V_ℂ)` in `R(O(V))`-linear Thom coordinates, through conjugation
of the real exterior complex and its determinant twist. Carry the inversion-coordinate
transformation at infinity and its symbol orientation through the local excision comparison.

**Checks.**

- `S¹` with O(1): `1 + (−1) sgn = 1 − sgn`, of dimension 0 = `χ(S¹)`; with the trivial top
  representation instead of det the dimension would be 2.
- `S²` with O(2): `1 + det`, of dimension 2 = `χ(S²)`; restricted to SO(2) it is 2 trivial.
- `κ` reverses the sign of every fibre coordinate, so on `ℝⁿ ⊗ ℂ` it multiplies the wedge class by
  `(−1)^n det`, which is `−sgn` for `n = 1`.

*Needs:* TopologicalKTheory T7.5; ComplexKahlerGeometry K5; Layer 2.5.

### 5.2 The O(1) Bott class through the circle Toeplitz operator (I5.2)

Construct the circle Fourier projection `P_≥0` on the normalized L² basis `e^(ikx)` and show that
its principal branches are 1 for `ξ > 0` and 0 for `ξ < 0`; realize it as a classical order-zero
pseudodifferential operator by comparing a smooth frequency multiplier with the exact projection,
their low-frequency difference being of finite rank. For `A = e^(ix) P_≥0 + (1 − P_≥0)`, the
restriction to the Hardy space is the forward shift and A is the identity on its orthogonal
complement, so `ind A = −1` by OperatorTheory/ToeplitzOperators T3 (with `x = 2πt`). Use a smooth
compactly supported symbol representative and an explicit clutching homotopy to show that its
ordinary local class is `−w_(ℝ⊗ℂ)`. Reflection swaps positive and negative modes; A is not
asserted to intertwine the trivial O(1) action. This ordinary calculation and the equivariant
sphere identity of 5.1 determine the O(1) Bott index (Atiyah–Singer I, §4, axiom (B2′)): if
`b = a + c · sgn`, then `(1 − sgn) b = 1 − sgn` and `dim b = 1` force `a = 1`, `c = 0`.

**Checks.**

- `(1 − sgn)(a + c sgn) = (a − c)(1 − sgn)` in `R(O(1))`, so `(1 − sgn) b = 1 − sgn` gives
  `a − c = 1`, and with `a + c = 1` this is `a = 1`, `c = 0`.
- `A` sends `e^(ikx)` to `e^(i(k+1)x)` for `k ≥ 0` and fixes `e^(ikx)` for `k < 0`; its range
  misses exactly the constant mode `e^(i0x)`, its kernel is zero, index −1.
- The equation `(1 − sgn) b = 1 − sgn` alone allows `b = 1 + c(1 + sgn)` for every c; the
  dimension condition is what removes the `1 + sgn` ambiguity.

*Needs:* OperatorTheory/ToeplitzOperators T3; PseudodifferentialOperators P4; Layers 2.5 and 5.1.

### 5.3 The SO(2) and O(n) Bott index (I5.3)

For SO(2) on `S²` the sphere equation is `2b = 2` in `R(SO(2))`, a torsion-free abelian group, so
`b = 1`. Layer 4.3's products give Bott index 1 on each block product `O(1)^a × SO(2)^b` acting on
`ℝ^(a+2b)` (Atiyah–Singer I, §4, Proposition 4.4). Prove that restriction to all such block
subgroups detects `R(O(n))`: every orthogonal matrix is conjugate into a block of ±1 real lines
and planar rotations, by a real orthogonal block theorem owned here — complexify the orthogonal
operator, use its finite spectral decomposition from the bounded normal calculus, pair conjugate
nonreal eigenspaces and take normalized real and imaginary parts to obtain orthonormal rotation
planes, with the ±1 eigenspaces giving real lines; prove the construction and its conjugating
matrix. Equal restrictions give equal characters at every element, and Peter–Weyl character
orthogonality gives equal virtual representations. Deduce that the O(n)-equivariant point Bott
class has index 1, including `n = 0` by the point computation, and restrict to any orthogonal
H-representation V to obtain the same identity in `R(H)`.

**Checks.**

- The determinant of O(2) restricts trivially to SO(2) but to `sgn ⊗ sgn` on the diagonal
  `O(1) × O(1)`, so the block subgroups separate det from 1; SO(n)'s connected maximal torus
  alone would not.
- The rotation by θ on ℝ² has eigenvalues `e^(±iθ)`, eigenvectors `(1, ∓i)/√2`, and the real and
  imaginary parts of `(1, −i)` give the orthonormal basis `e₁, −e₂` of its rotation plane.
- `n = 0`: the group is trivial, the sphere is a point and the Bott index is 1.

*Needs:* Layers 4.3, 5.1–5.2; RepresentationTheory CompactGroups (Peter–Weyl) and ClassicalGroups;
OperatorTheory SelfAdjointSpectralTheory.

### 5.4 Embedding invariance of the analytic index (I5.4)

For `f : M → N` use a compact normal disc neighbourhood, compactify its fibres to
`S(ν ⊕ 1) = P_O(ν) ×_O(n) Sⁿ`, and compare its cotangent symbol with the associated product of the
base symbol and `w_(ℝⁿ⊗ℂ)`. Consume TopologicalKTheory T6.9's associated Koszul/folding naturality
and carry the wedge conversion with `det(ν_ℂ) = P_O(ν) ×_O(n) det(ℂⁿ)`. Prove that the vertical
tangent splitting and the complex normal identification match Layer 3, and use 4.4's fixed
associated-fibre theorem with Bott index 1. Open excision gives `ind_a(f_!^T a) = ind_a(a)`. For
equivariant embeddings the G-action commutes with the frame O(n)-action, so the same proof gives
equality in `R(G)`. All support extensions go through the sphere compactification, not only
equality of restrictions at the zero section.

**Checks.**

- `f = id`: `n = 0`, the fibre `S⁰` is two points, `S(ν ⊕ 1)` is two copies of M, and excision
  from the copy containing the open chart gives the trivial equality.
- `pt → ℝⁿ`: `ind_a(w_(ℝⁿ⊗ℂ)) = 1` by 5.3, matching `ind_a(1) = 1` on the point.
- Replacing `w` by `u^dual` would give `(−1)^n det` instead of 1 on the fibre, so the conversion
  is needed for the equality.

*Needs:* Layers 3.1–3.2, 4.4, 5.3; TopologicalKTheory T6.9; Layer 2.5.

### 5.5 The Atiyah–Singer theorem (I5.5)

Apply the uniqueness of 3.5 to prove `ind_a = ind_t` on `K_c(T*M)` for closed M, and its
compact-Lie equivariant version `ind_a^G = ind_t^G` on `K_(G,c)(T*M)` (Atiyah–Singer I,
Theorem 6.7; Freed, Theorem 4.18). Export the theorem for operators, complexes, relative symbol
classes and twisting. Compare ordinary and equivariant point normalizations, formal adjoints,
products and restriction through a single commutative diagram. Neither Bott periodicity nor the
prerequisite Thom theorem is proved by using this equality.

**Checks.**

- On a point both maps send `a − b` to `a − b`.
- 5.2's circle operator A has `ind_a = −1`, and its class is the extension of `−w_(ℝ⊗ℂ)` from a
  chart, whose topological index is −1 by 3.3's point normalization and open excision.
- Equivariantly on `S²` with SO(2): `ind_a^G` of the de Rham operator is 2 trivial
  representations, matching 5.1.

*Needs:* Layers 2.3, 3.3–3.5, 4.2, 5.4.

### Examples

The spheres `S¹` and `S²` with O(1), O(2) and SO(2) actions, the circle Toeplitz operator, block
rotations and the point.

### Dependencies

Layers 2–4; TopologicalKTheory T6.9 and T7.5; OperatorTheory/ToeplitzOperators T3;
RepresentationTheory CompactGroups and ClassicalGroups.

## Layer 6: The cohomological formula and universal symbol calculations (I6)

### 6.1 The cohomological index formula (I6.1)

On the canonically oriented cotangent total space prove
`ind(P) = (−1)^n ∫_(T*M) ch_c([σ_P]) · π*Td(TM ⊗ ℂ)` (Freed, Theorem 4.9, there with the
orientation absorbed in the Thom isomorphism). The pairing evaluates degree-2n compactly supported
cohomology; lower degrees contribute zero. Apply CharacteristicClasses C6's wedge-Koszul
Thom–character formula to Layer 3's embedding map, identify the normal complexification and use
`TM ⊗ ℂ ⊕ ν ⊗ ℂ ≃ trivial` to cancel the Todd normal correction. The normal rank `N − n` gives the
factor `(−1)^(N−n)`; its determinant is the complexification of a real sign line, so its rational
Chern character is 1. Euclidean wedge Thom evaluation is `(−1)^N`, which fixes the surviving
factor `(−1)^n`. Compare the canonical orientation with the base-first orientation by
`(−1)^(n(n−1)/2)`, giving the complete base-first prefactor `(−1)^(n(n+1)/2)`, and with compactly
supported de Rham integration via CharacteristicClasses C2. Define the top-degree evaluation
through the inverse compactly supported Thom map of `T*M → M`, followed by evaluation on the
**compact** base's ordinary fundamental class with orientation local coefficients, multiplied by
`(−1)^(n(n−1)/2)` to convert its base-first bundle orientation to the canonical complex
orientation. This supplies the displayed integral without a locally finite homology carrier. Keep
the density, Thom and de Rham comparisons explicit. No formula divides by `e(TM)` on the given
manifold.

**Checks.**

- `n = 0`: M a point, the formula reads `ind = ch(a − b) = a − b`.
- The three signs agree: `(−1)^n · (−1)^(n(n−1)/2) = (−1)^(n(n+1)/2)`, which is −1, −1, +1, +1
  for `n = 1, 2, 3, 4`.
- 5.2's circle operator: its class is `−w_(ℝ⊗ℂ)` from a chart, `Td(TS¹ ⊗ ℂ) = 1`, and in rank one
  `w = β` with `ch_c(β) = −U_ℂ`, so `∫ ch_c(−w) = +1` and the prefactor `(−1)^1` gives
  `−1 = ind A`; without the prefactor the formula would give +1.

*Needs:* Layers 3.3 and 5.5; CharacteristicClasses C2 and C6; DifferentialGeometry integration.

### 6.2 Universal symbols over classifying approximations (I6.2)

For a compact G-structure, a representation V of real dimension n and a G-equivariant
homogeneous elliptic model symbol between specified finite representation fibres `W₀, W₁`,
associate its bundle and symbol data to the **universal vector bundle** `EG ×_G V`, not
`BG ×_G V`. Its support is the zero section and is fibrewise, not compact over the infinite BG.
On each compact finite-dimensional smooth classifying approximation `B_m` form the relative disc
and sphere symbol class, and prove compatibility under inclusions and degreewise cohomological
stabilization. These compatible finite-level classes define the universal Thom-cohomology
calculation; no `K_c(BG)` carrier is presumed. Pull back to each compact manifold's classifying
approximation and prove equality with its own symbol, retaining all association intertwiners.
Use CharacteristicClasses' stable range and Thom-character diagram to descend the universal
identities.

**Checks.**

- G trivial: `EG ×_G V = V` over a point and the universal class is the point symbol class.
- For `G = SO(2)` and `V = ℝ²`, `B_m = ℂP^m` and the universal bundle restricts to the
  tautological plane; inclusions `ℂP^m → ℂP^(m+1)` preserve the class.
- BG carries no G-action, so `BG ×_G V` has no meaning; the universal bundle is
  `EG ×_G V → BG`, whose zero section BG is not compact for `G = SO(2)` (`BG = ℂP^∞`), which is
  why the finite approximations `ℂP^m` are used.

*Needs:* Layer 6.1; CharacteristicClasses C1 universal bundles and stable range.

### 6.3 Cancellation by the Euler class (I6.3)

For a compact Lie group G and an even-dimensional oriented real representation V with a fixed
G-invariant orientation (the action factors through `SO(V)`) for which `e(V)` is a non-zero-divisor
in `H*(BG; ℚ)`, compute the universal fibre integral by restriction to the zero section and
cancellation there. Any auxiliary flag or torus restriction used is injective and retains the
fixed invariant orientation. Then pull back the polynomial identity; the Euler class may vanish
or be a zero divisor on M. For odd rank the rational Euler class is 0 and this cancellation is
unavailable; the differential-symbol vanishing theorem is treated separately in 7.6. Verify the
non-zero-divisor hypothesis for `SO(2ℓ)`, `U(n)`, `Spin(2ℓ) × U(k)` and `SO(2ℓ) × U(k)` through
CharacteristicClasses' torus injection and their explicit nonzero Euler-root products, using
SpinGeometry's weight dictionary for the spin covering.

**Checks.**

- `SO(2)`: `H*(BSO(2); ℚ) = ℚ[e]`, and e is a non-zero-divisor.
- `SO(3)` acting on ℝ³: odd rank, `e = 0` rationally, so the hypothesis fails.
- `U(n)` on `ℂⁿ`: `e = c_n = x₁⋯x_n` in `ℚ[x₁,…,x_n]^(S_n)`, a non-zero-divisor in the
  polynomial ring.

*Needs:* Layer 6.2; CharacteristicClasses C5 universal rings and torus injection; SpinGeometry G5.

### 6.4 Integrality (I6.4)

Export rational integrality conclusions: the characteristic pairing equals an integer index for
each specified elliptic symbol, with its twisting and orientation conventions. Universal completed
classes are evaluated degreewise on finite-dimensional bases; `λ_(−1)` is used on finite-rank
bundles, not by substituting −1 into an arbitrary virtual infinite λ-series.

**Checks.**

- `Td₁ = c₁/2`: on a closed Riemann surface of genus g, `⟨c₁(T^(1,0)), [M]⟩ = 2 − 2g`, so the Todd
  number is `1 − g = χ(O)`, an integer; on `ℂP¹` it is 1.
- `L₁ = p₁/3`: on `ℂP²`, `p₁ = 3` and `L = 1`.
- `Â₁ = −p₁/24`: on K3, `p₁ = −48` and `Â = 2`.

*Needs:* Layers 6.1–6.3.

### Examples

The point, `ℂP¹`, `ℂP²`, K3, and the classifying approximations `ℂP^m` of `BSO(2)`.

### Dependencies

Layers 3 and 5; CharacteristicClasses C1, C2, C5 and C6; SpinGeometry G5; DifferentialGeometry.

## Layer 7: Euler, signature, Dolbeault and spin applications (I7)

### 7.1 The de Rham operator (I7.1)

For the parity grading of complex exterior forms identify the de Rham symbol and analytic index
with `χ(M)` by ComplexKahlerGeometry K5's Hodge and singular comparison (Freed, displays
(3.5)–(3.6)). Compute its universal exterior-root character and the Layer 6 pairing: on oriented
even-dimensional M the pairing is `⟨e(TM), [M]⟩`, which together with the index identity
re-derives CharacteristicClasses C2 item 3's `χ(M) = ⟨e(TM), [M]⟩`; compare the zero-locus and
diagonal proof there and the de Rham Pfaffian normalization. On nonorientable M the pairing is
the Euler number with orientation local coefficients: through the orientation double cover, its
Euler number and Euler characteristic are both twice those of the base, the number by Thom and
local-system pullback and fundamental-class transfer, the characteristic by a finite smooth good
cover and Mayer–Vietoris additivity, since every lifted contractible intersection is two copies.
Descend the oriented statement and compare the twisted Pfaffian density. In odd dimension both
sides vanish. Verify the exterior derivative and codifferential symbols, the star square and
`d* = (−1)^(m(k+1)+1) * d *` on k-forms in real dimension m, with the right star read on its
output degree.

**Checks.**

- `S²`: the de Rham index is `1 − 0 + 1 = 2 = ⟨e(TS²), [S²]⟩`.
- `ℝP²`: `χ = 1`, the twisted Euler number is 1, and the double cover `S²` has `2 = 2 · 1` for
  both.
- `d*` on 1-forms in dimension 2 is `(−1)^(2·2+1) * d * = −*d*`, so on `f dx` in ℝ² it gives
  `−∂_x f`; the sign `+*d*` would make `d*d` negative.

*Needs:* Layers 2.4 and 6.1; ComplexKahlerGeometry K5; CharacteristicClasses C2 item 3.

### 7.2 The signature operator (I7.2)

For Γ on forms from SpinGeometry G2 use its complex-linear star identity
`Γ|Λ^p = i^(p(p−1)+ℓ) *` in real dimension 2ℓ. The chiral operator `d + d*` has index equal to the
signature of the middle cup pairing in dimension 4k (Freed, display (3.7)); prove the
complementary-degree harmonic cancellation and the ± eigenspace comparison with the real
intersection form. In dimension `4k + 2` the middle pairing is alternating and the chiral index is
0. Compute the universal oriented-plane roots and obtain the Hirzebruch theorem
`sign(M) = ⟨L(TM), [M]⟩` (Freed, Theorem 2.11). The expression `∏ x coth(x/2)` agrees with
`∏ x / tanh x` only in the top degree, by root-degree scaling, not as a full characteristic
series. In dimension 4 verify `sign(M) = ⟨p₁(TM)/3, [M]⟩`.

**Checks.**

- `ℂP²`: `σ = 1` and `p₁ = 3h²`, so `⟨p₁, [ℂP²]⟩/3 = 1`.
- K3: `σ = −16` and `⟨p₁, [K3]⟩ = −48`, so `−48/3 = −16`.
- `S²` (dimension `4·0 + 2`): the middle pairing on `H¹ = 0` is alternating and the chiral index
  is 0; on `S⁴`, `σ = 0 = p₁/3`.

*Needs:* Layers 6.1–6.3; SpinGeometry G2; ComplexKahlerGeometry K5; CharacteristicClasses C5.

### 7.3 The Dolbeault operator and Hirzebruch–Riemann–Roch (I7.3)

For a holomorphic Hermitian bundle E on a compact complex n-fold use the Dolbeault symbol (wedge
with `ξ^(0,1)` and its adjoint, folded), ComplexKahlerGeometry K2's exact symbol complex and K5's
sheaf and harmonic comparison. Compute its universal Chern roots with the real-to-complex
cotangent dictionary and prove
`Σ_q (−1)^q dim_ℂ H^q(M; E) = ⟨ch(E) Td(T^(1,0)M), [M]⟩` (Freed, Theorem 2.7, there for projective
M). No Kähler condition is required. Prove independence of the Hermitian metric and compatibility
with duality, direct sums and tensor twisting.

**Checks.**

- `ℂPⁿ`, `E = O`: the top coefficient of `(h/(1 − e^(−h)))^(n+1)` is 1, so `χ(O) = 1`.
- `ℂP¹`, `E = O(k)`: `χ = k + 1`, matching `h⁰ = k + 1` for `k ≥ 0` and `h¹ = −k − 1` for
  `k ≤ −2`.
- `ℂP²`, `E = O(k)`: `χ = (k + 1)(k + 2)/2`, which is 0 for `k = −1, −2` as Serre duality and
  vanishing predict.

*Needs:* Layers 6.1–6.3; ComplexKahlerGeometry K2, K5 and K7.

### 7.4 Riemann–Roch on compact Riemann surfaces (I7.4)

On a connected compact Riemann surface consume ComplexKahlerGeometry K7's
genus/Betti/Dolbeault dictionary `g = b₁/2 = dim H^(0,1)`, with its integral intersection-form
comparison. Define the degree of a line bundle by `⟨c₁(L), [M]⟩`, so that the Todd class of a
curve gives `ind ∂̄_L = deg L + 1 − g`. Build the divisor and analytic-degree bridge: local zero
and pole orders, meromorphic sections of a line bundle, transition winding and the integral Chern
class through CharacteristicClasses C1.5 and C4's comparison with SmoothBundlesConnections B6.
The line associated with the ordinary character, `L = P ×_(e^(iθ)) ℂ`, satisfies
`c₁(L) = −c₁_B6(P)`, since B6's principal convention represents the dual-character line; prove and
use this sign in the winding, curvature and divisor maps, and prove that divisor degree agrees
with the integral. Construct the holomorphic divisor line `O(D)` with frames
`e_inside = z^(−m) e_outside`, so that the canonical section has coefficient `z^m` inside, its
tensor and addition laws and canonical meromorphic section, then use 7.3's curve specialization on
`L(kp)` for large k to obtain a nonzero section and hence a meromorphic section of every L. This
provides the existence step without assuming it in the divisor bridge. Prove `deg K_M = 2g − 2`
through `c₁(T^(1,0)M)` and Euler characteristic `2 − 2g`, and use K5's Serre duality to derive
`h⁰(L) − h⁰(K_M ⊗ L⁻¹) = deg L + 1 − g` and its vector-bundle version. Consume CharacteristicClasses
C1.5's normalization of the tautological `c₁` to degree −1 on complex-oriented `ℂP¹`, with its
comparison to ComplexKahlerGeometry's finite projective carrier; construct the smooth bundle
isomorphism identifying K7.2's holomorphic `O(−1)` with that tautological line under the carrier
comparison, through the local spanning vectors `(z, 1)` and `(1, w)`. Consume K7.2's
projective-chart construction of `K_(ℂP¹) ≃ O(−2)` and `H⁰(O(−1)) = H¹(O(−1)) = 0`, so `O(−1)` on
`ℂP¹` has index 0 and degree −1; the equal-dimension conclusion already follows from Serre duality
and `K ⊗ O(−1)* ≃ O(−1)`, without assuming either vanishing.

For the trivial line construct the explicit comparison with the real parity-graded de Rham
operator. Use the complex orientation, its Riemannian volume form vol and `*dx = dy`,
`*dy = −dx` in every oriented conformal coordinate, including a metric `λ²(dx² + dy²)`. Equip real
even forms with the complex structure `I(f, b vol) = (b, −f vol)` and real one-forms with
`I = *`. Define `A(f + ig) = (f, −g vol)` and `B(η) = 2 Re η` for `η ∈ Ω^(0,1)`. Prove that these
are bounded complex-linear isomorphisms on the relevant Sobolev spaces and `(d + d*)A = B∂̄`, with
`∂̄u = (∂_x u + i∂_y u)(dx − i dy)/2` in a holomorphic coordinate, checking the metric factors in
conformal coordinates. The operator with these complex structures has complex index `1 − g`, while
its underlying real operator has index `2 − 2g`; prove this factor by the kernel and cokernel
complex structures and Hodge theory rather than identifying the two indices. Compare with the
complexification of the real de Rham operator, which has complex index `2 − 2g` and splits into
the Dolbeault operator and its conjugate, and differs from the complex operator defined by I on
the original real bundles.

Give a second proof of the degree formula by 2.5's local difference class. For every Σ,
holomorphic line L and point p, compare L with `L(p)` in a holomorphic coordinate and frame by the
transition `e_inside = z⁻¹ e_outside`. The resulting local difference class is universal,
independent of Σ, L, p and the holomorphic disc coordinates, so `ind ∂̄_(L(p)) − ind ∂̄_L = δ` for
one integer δ. Retain the relative boundary identification and the winding sign; no surjection
from the two K-groups of an open cover is assumed. Before using this step prove `deg O(p) = +1`
directly by its transition winding and the sign `c₁ = −c₁_B6`, and `deg L(p) = deg L + 1` by
CharacteristicClasses C1.5's tensor law; neither calculation uses meromorphic sections or
Riemann–Roch. Consume K7's closed-surface CW model and the integral fundamental-class pairing
`H²(Σ; ℤ) ≃ ℤ`. By CharacteristicClasses C1.6's classification and C1.4's smoothing of
isomorphisms, holomorphic lines of equal degree are smoothly isomorphic; their transported `∂̄`
operators differ by order 0 and have equal indices. The trivial-line Hodge calculation gives
`1 − g` for every genus, and the degree −1 sphere case forces `δ = 1`. Deduce the formula for all
degrees, independently of the Hirzebruch–Riemann–Roch proof.

Give a third, model-and-excision proof for the trivial line: compute index 1 on `ℂP¹` by
projective-chart Laurent cohomology and index 0 on a flat complex torus by Fourier series, with
the constants as kernel and cokernel. For connected sums prove the cut-and-paste identity
`i(Σ_g # Σ_h) + i(ℂP¹) = i(Σ_g) + i(Σ_h)`, where i is the trivial-line Dolbeault index. Identify
the two removed discs and boundary collars, the holomorphic annular transition `z = 1/w` and both
symbol-bundle identifications satisfying 2.5's common-collar cocycle condition. Consume
GeometricTopology Layer 1's smooth gluing and construct the holomorphic atlas from the two
punctured-surface atlases and that annular transition; take the collars from these coordinate
annuli, with radial parameters `log|z|` and `log|w|`, reversed by `z = 1/w`. Prove that the
resulting holomorphic charts induce precisely the glued smooth structure and are compatible on
every overlap, and identify the fourth regluing biholomorphically with K7.1's `ℂP¹` by its two
reciprocal charts. Apply 2.5's cut-and-paste theorem to the two surfaces, their regluings, the
connected sum and the sphere. Prove additivity of `b₁` by Mayer–Vietoris, so that the glued
connected sum X of g tori (`ℂP¹` when `g = 0`) has `b₁ = 2g`. X is compact, connected and oriented
by its holomorphic atlas, and a compact connected Riemann surface Σ of genus g has `b₁ = 2g` by
K7's dictionary; GeometricTopology's smooth classification of compact surfaces (the contract
`gap:smooth-surface-classification`), with `rank H₁(F; ℚ) = 2g` for closed orientable surfaces,
places both on the orientable genus-g standard model, so there is a diffeomorphism `f : X → Σ`. If f reverses orientation, replace its
transported complex structure `J′` by `−J′`; for the trivial line, complex conjugation on functions
and forms intertwines `∂̄_(−J′)` with `∂̄_(J′)` by antilinear Sobolev isomorphisms, so their complex
kernel and cokernel dimensions and indices agree. Join the resulting orientation-compatible
structure and the given complex structure through their contractible fibre, producing
elliptic-symbol bundle families over `Σ × [0, 1]`; integrability of the intermediate structures is
not needed, and metric changes give the same continuous elliptic-symbol homotopies. The two model
values and handle induction give `1 − g` by this route as well. Compare the three proofs with
Hirzebruch–Riemann–Roch and the genus dictionary.

**Checks.**

- `O(−1)` on `ℂP¹`: `deg = −1`, `g = 0`, index `−1 + 1 − 0 = 0 = h⁰ − h¹ = 0 − 0`; the
  tautological line has `c₁ = −1`, and the opposite sign convention for B6 would give `+1` and
  index 2.
- `O(p)` has transition `e_inside = z⁻¹ e_outside`, the canonical section has coefficient z
  inside, one simple zero, degree +1; `deg K = 2g − 2` gives `−2` on `ℂP¹`, matching
  `K ≃ O(−2)`.
- The trivial line on a genus-2 surface: index `1 − 2 = −1`, the real underlying operator has
  index `2 − 4 = −2`; the glued model `T² # T²` has `χ = −2`, `b = 0`, genus
  `(2 − χ − b)/2 = 2`, the same standard model as Σ.
- `A(1) = (1, 0)` is killed by `d + d*` and `∂̄1 = 0`; for `u = z̄ = x − iy`,
  `∂̄u = (1 + 1)(dx − i dy)/2 = dx − i dy`, `B(dx − i dy) = 2 dx`, and
  `(d + d*)A(u) = (d + d*)(x, y vol) = dx + d*(y vol) = dx + dx = 2 dx` with `d*(y vol) = −*d*(y vol)
  = −*dy = dx`.

*Needs:* Layers 2.5, 6.1 and 7.3; ComplexKahlerGeometry K5 and K7; CharacteristicClasses C1.4–C1.6
and C4; SmoothBundlesConnections B6; GeometricTopology Layer 1 and its contract
`gap:smooth-surface-classification`.

### 7.5 Twisted spin Dirac operators and Rokhlin's theorem (I7.5)

For a closed even-dimensional spin M, SpinGeometry's Γ labels give `D⁺ : S⁺ → S⁻`, with
`S⁻ = (S⁺)*` for a real oriented two-plane and `S⁺² = E*` for the positively oriented complex
two-plane E. Compute the half-spin root difference and the dual-Koszul symbol Thom comparison in
these labels to obtain `ind D_W⁺ = ⟨Â(TM) ch(W), [M]⟩` for every Hermitian twist W (Freed,
display (4.7) for `W` trivial). Keep the chosen spin structures, intertwining maps, phase homotopy
and graded direct-sum products in the proof. Compare the self-adjoint Dirac index 0 with the
potentially nonzero chiral index. Deduce Â-integrality and the positive-scalar-curvature
obstruction from SpinGeometry G6's Lichnerowicz formula, including the twisted curvature version
in its stated positivity range. In dimension 0 distinguish the signed orientation and Γ from the
canonical empty-frame choice.

In dimension 4 specialize to the **untwisted** operator and consume SpinGeometry G6.7's
quaternionic kernels and index α. Prove the integral equality `8 · ind_ℂ D⁺ = −σ(M)` from the
degree-four term `Â₄ = −p₁/24` and 7.2's `σ = ⟨p₁, [M]⟩/3`, keeping the same orientation and Γ
labels. Combine it with G6.7's complex index `2α` to obtain the integral equality `σ(M) = −16α`,
and export Rokhlin's theorem: the signature of every closed oriented smooth spin four-manifold is
divisible by 16 (Freed, §5.3, the real Dirac index route). Retain independence of the metric,
spin-isometry naturality and orientation reversal. TangentialBordism's geometric KO-index
comparison consumes these identities and supplies the KO-genus and Atiyah–Bott–Shapiro
orientation comparison; the theorem needs no bordism classification. Arbitrary Hermitian twists
keep the general index formula above, with no parity conclusion from G6.7.

**Checks.**

- K3: `Â = −p₁/24 = 48/24 = 2`, `8 · 2 = 16 = −σ` with `σ = −16`, and `α = 1`, so `σ = −16α`.
- K3 with the reversed orientation: `σ = 16`, `ind D⁺ = −2`, `α = −1`.
- `ℂP²` is not spin (`w₂ ≠ 0`) and has `σ = 1`, not divisible by 16; `S⁴` has `σ = 0 = −16 · 0`.

*Needs:* Layers 6.1–6.4 and 7.2; SpinGeometry G2, G5, G6 and G6.7; CharacteristicClasses C5.

### 7.6 Vanishing in odd dimensions (I7.6)

On a closed **odd-dimensional** M the index of an elliptic differential operator, or of a
common-order differential complex, vanishes. Covector negation changes an order-m homogeneous
polynomial symbol by `(−1)^m`, which is phase-homotopic to the original symbol. On the canonical
cotangent orientation negation has degree `(−1)^n = −1`, so 6.1 gives `index = −index`, hence 0.
Extend to complexified real operators. The conclusion does not cover arbitrary classical
pseudodifferential symbols: 5.2's circle operator has index −1.

**Checks.**

- `d/dx` on `S¹`: index 0.
- `d/dx + c` on `ℝ/2πℤ` with `c ∉ iℤ`: `e^(−cx)` and `e^(c̄x)` are not periodic, so kernel and
  cokernel are 0, index 0.
- `A = e^(ix) P_≥0 + (1 − P_≥0)` on `S¹` is a pseudodifferential operator of index −1, so the
  differential hypothesis cannot be dropped.

*Needs:* Layer 6.1; Layer 5.2 for the non-example.

### Examples

`S²`, `ℝP²`, `ℂP¹`, `ℂP²`, `S⁴`, K3, genus-g Riemann surfaces and the circle.

### Dependencies

Layers 2, 5 and 6; ComplexKahlerGeometry K2, K5 and K7; CharacteristicClasses C1, C2, C4 and C5;
SpinGeometry G2, G5, G6 and G6.7; SmoothBundlesConnections B6; GeometricTopology Layer 1 and its
contract `gap:smooth-surface-classification`.

## Layer 8: Holomorphic fixed-map Lefschetz traces (I8)

### 8.1 Induced maps on Dolbeault cohomology (I8.1)

For a compact boundaryless complex manifold M and a finite-rank holomorphic vector bundle E,
construct the Dolbeault complex and its Hodge comparison from 7.3. For a holomorphic map
`f : M → M` and a holomorphic bundle map `φ : f*E → E`, construct the cochain map `φ ∘ f*` and the
induced endomorphisms of `H^q(M, E)`, with identity, composition, bundle-isomorphism and
direct-sum laws. No global invertibility of f or L²-boundedness of its unsmoothed pullback is
assumed.

**Checks.**

- `f = id`, `φ = id`: the induced maps are identities and the alternating trace is `χ(M, E)`.
- A constant map f to a point `x₀` with E trivial: `f*` kills `H^q` for `q > 0` and acts as
  evaluation on `H⁰`.
- Composition: `(φ ∘ f*) ∘ (ψ ∘ g*) = (φ ∘ f*ψ) ∘ (g ∘ f)*` on cochains.

*Needs:* Layer 7.3; ComplexKahlerGeometry K2 and K5.

### 8.2 The heat-kernel trace (I8.2)

Construct the analytic fixed-map trace proof. From the elliptic calculus construct positive-time
smoothing kernels for the Dolbeault Laplacians, their trace-class estimates and the cohomological
alternating-trace identity for `φ ∘ f*` composed with the heat operator. Prove independence of
time by the cochain-homotopy and trace-class commutator argument; the bundle map need not commute
with a chosen adjoint or metric. For a nonisometric f, smoothing before pullback gives the bounded
trace-class composite. Construct the local graph/diagonal asymptotics and show that the
contribution away from their intersection tends to zero.

**Checks.**

- At `f = id` and large time the trace is the alternating dimension of the harmonic spaces.
- For a fixed-point-free translation of an elliptic curve the off-diagonal contribution is
  exponentially small as `t → 0`, giving 0.
- On a point M every Laplacian is zero and the heat trace is constant in t.

*Needs:* Layer 8.1; PseudodifferentialOperators P6–P7; ComplexKahlerGeometry K5.

### 8.3 The holomorphic Lefschetz formula (I8.3)

Suppose every fixed point x is isolated with `det_ℂ(1 − df_x) ≠ 0`. Prove that the fixed set is
finite and `Σ_q (−1)^q tr(H^q(φ ∘ f*)) = Σ_(f(x) = x) tr(φ_x) / det_ℂ(1 − df_x)` (Atiyah–Bott II,
Theorem 4.12, pp. 458–459). The fibre map `φ_x` is an endomorphism only at a fixed point.
Pullback on holomorphic covectors has the same eigenvalues as `df_x` (matrix transpose), not the
inverse eigenvalues of an independently defined group-action dual. Prove coordinate, metric and
trivialization independence and the rank-zero, point and no-fixed-point cases.

**Checks.**

- `f(z) = qz` on `ℂP¹`, `q ≠ 0, 1`, with the O(1) lift whose fixed-fibre values at 0 and ∞ are 1
  and q: the multipliers of df are q and `q⁻¹`, and
  `1/(1 − q) + q/(1 − q⁻¹) = (1 − q²)/(1 − q) = 1 + q`, the trace of pullback on the linear
  sections. Using `det(1 − df⁻¹)` instead gives `−q/(1 − q) + q/(1 − q) = 0`.
- The same map on the trivial line: `1/(1 − q) + 1/(1 − q⁻¹) = 1/(1 − q) − q/(1 − q) = 1`.
- A nonzero translation of an elliptic curve has no fixed points; it acts trivially on
  `H⁰(O) = ℂ` and `H¹(O) = ℂ`, so the left side is `1 − 1 = 0`. A rank-zero E gives 0 on both
  sides, and a point M gives `tr φ`.

*Needs:* Layers 8.1–8.2.

### 8.4 Group actions (I8.4)

For a holomorphic group action with the section convention `(g · s)(x) = g_E s(g⁻¹x)`, specialize
with `f = g⁻¹` and the fibre map `φ = g_E`, and prove the eigenvalue and character dictionary
before using the formula in homogeneous examples. This generic fixed-map construction consumes
elliptic and Dolbeault analysis, not algebraic Schubert splitting, standard monomial theory,
vanishing or a flag-character formula; the flag and word-space character specializations are
SchubertGeometry's applications.

**Checks.**

- The circle acting on `ℂP¹` by `λ · [z₀ : z₁] = [z₀ : λz₁]` with `g = λ`: `f = g⁻¹` has
  multiplier `λ⁻¹` at 0, and on O the formula gives `1/(1 − λ⁻¹) + 1/(1 − λ) = 1`, the trivial
  character on `H⁰(O)`.
- The convention `f = g` instead of `g⁻¹` exchanges λ and `λ⁻¹` and gives the dual character on
  `H⁰(O(1))`.
- The identity element gives `χ(M, E)` only through the limit, since its fixed set is not
  isolated; the formula is applied to elements with isolated fixed points.

*Needs:* Layer 8.3.

### Examples

Rotations of `ℂP¹` on O, O(1) and O(−1), translations of elliptic curves and the circle action on
`ℂP¹`.

### Dependencies

Layer 7.3; PseudodifferentialOperators P6–P7; ComplexKahlerGeometry K2 and K5.

## Downstream consumers

TangentialBordism consumes Layers 1–3, 5, 7.2 and 7.5 for its geometric KO-index comparison.
FourManifolds consumes 7.2 and 7.5. SeibergWittenTheory consumes Layers 1–7
for its Spinᶜ symbol index. SchubertGeometry consumes Layer 8's map-level Lefschetz interface for
its flag and word-space specializations. K3Surfaces consumes Layer 6, 7.1–7.3 and Layer 8;
GeometricQuantization consumes Layer 6 and 7.3; InstantonFloerTheory consumes Layers 1–2 and 7;
SpectralManifolds consumes Layer 2; StringOrientation consumes the Layer 7 formulas.

## References

- M. F. Atiyah and I. M. Singer, *The index of elliptic operators I*, Ann. of Math. 87 (1968),
  484–530, [DOI 10.2307/1970715](https://doi.org/10.2307/1970715): §3 (pp. 497–499, the
  pushforward and the topological index), Lemma 3.2 (the sphere symbol), §4 (pp. 501–505,
  axioms (B1)–(B3′), Propositions 4.1 and 4.4), (6.1)–(6.5) and pp. 519–520 (the analytic index
  and the transverse subspace), Theorem 6.7, §7 (p. 520), §8 (pp. 522–523), §9 (p. 526).
- M. F. Atiyah and R. Bott, *A Lefschetz fixed point formula for elliptic complexes. II.
  Applications*, Ann. of Math. 88 (1968), 451–491,
  [DOI 10.2307/1970721](https://doi.org/10.2307/1970721): Theorem 4.12, pp. 458–459.
- M. F. Atiyah, *Bott periodicity and the index of elliptic operators*, Quart. J. Math. Oxford
  19 (1968), 113–140, [DOI 10.1093/qmath/19.1.113](https://doi.org/10.1093/qmath/19.1.113): §2
  (finite-cokernel stabilization) and §4, Theorem 4.3.
- D. S. Freed, *The Atiyah–Singer index theorem*, 2021,
  [arXiv:2107.03557](https://arxiv.org/abs/2107.03557) (numbering of v1): displays (3.5)–(3.7)
  and (3.13), Theorems 2.7, 2.11, 4.9 and 4.18, display (4.7), §5.3.
