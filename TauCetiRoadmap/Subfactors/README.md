# Roadmap: subfactors, Jones index and planar standard invariants

**Summary.** This roadmap builds the theory of inclusions of II₁ factors from Mathlib's von Neumann
algebras, through a layer of von Neumann algebra prerequisites (normal states, modular theory,
traces, coupling dimension, weights, the hyperfinite factor and amenability), and the native
Temperley–Lieb presentation of Tau Ceti.
It covers normal correspondences and Connes fusion, the basic construction, Pimsner–Popa bases,
the index of conditional expectations, relative inclusion entropy, the Jones tower and its
Temperley–Lieb projections, and commuting squares. It then covers standard invariants, shaded and
rigid planar algebras, graph planar algebras and the analytic reconstruction of subfactors from
planar algebras. The end theorems are:

- Jones's index restriction `[M:N] ∈ {4cos²(π/m) : m ≥ 3} ∪ [4,∞]` for every II₁ subfactor,
  proved through Jones's positivity theorem for the Temperley–Lieb closure trace
  (`markovTrace_nonneg_iff`).
- Realisation of every allowed index by a subfactor of the hyperfinite II₁ factor.
- The Pimsner–Popa formula for relative entropy and its equality criteria.
- Reconstruction of a subfactor from every subfactor planar algebra, and Burns's realisation of
  rigid C*-planar algebras.
- Popa's classification of finite-depth hyperfinite inclusions by their standard invariants, and
  the list of standard invariants of index below 4.
- Penneys's extended-cone calculus and the Burns rotation theorems for bimodules of infinite
  index, with Burns's type III relative-commutant example.

## Scope and ownership

This roadmap owns:

- the inclusion theory of II₁ factors: basic constructions, bases, towers, minimal index,
  statistical dimension and relative entropy;
- over ℂ, the Temperley–Lieb facts the index theory needs, proved from Tau Ceti's presentation:
  the analytic adjoint, the normal form, uniqueness of the Markov trace, Jones–Wenzl
  projections, Jones's positivity theorem for the closure trace, the positive path models, the
  positive Jones quotients and their C*-tower (Layer 3);
- the trace-preserving Temperley–Lieb action in the Jones tower, its kernel, and the index
  restriction (Layer 3);
- commuting squares and Ocneanu compactness;
- standard invariants and principal graphs;
- shaded, rigid and graph planar algebras and right planar modules;
- planar-algebra reconstruction;
- Popa's finite-depth classification and the classification below index 4;
- the infinite-index cone and rotation calculus.

It owns the Temperley–Lieb material of Layer 3 because Layer 3's index restriction and Layer 4's
realisation need it, and every other roadmap that develops it comes later in the supply order.
For the same reason it owns Layer 0's von Neumann algebra prerequisites: normal functionals and
GNS, Tomita–Takesaki theory and the standard form, finite factors and tracial L², group von
Neumann algebras and crossed products, coupling dimension and the index `[M:N]`, weights,
operator-valued weights and spatial derivatives, the hyperfinite II₁ factor with its L²
perturbation lemmas, and amenability defined by hypertraces. Layer 0 states only what the later
layers use; the type classification, Connes's invariants, and Connes's theorem that an amenable
II₁ factor is approximately finite-dimensional, with the injective classification it gives,
belong to VonNeumannAlgebras, which is not a prerequisite of any layer. Hyperfiniteness enters
the later layers only as a hypothesis or through generation by finite-dimensional algebras,
never through that theorem.

The roadmap leaves the following to named roadmaps:

- The Temperley–Lieb algebra over a general commutative ring belongs to TemperleyLieb: the
  diagram basis, cell modules and Gram determinants, and negligible ideals over arbitrary
  coefficients. Layer 3 here uses none of it and works over ℂ only.
- C*-tensor products and C*-inductive limits belong to CStarAlgebras C5.
- Scalar Fock spaces and tracial amalgamated free products belong to FreeProbability F3–F4.
- CAR algebras, quasi-free states and Bogoliubov functoriality belong to
  OperatorAlgebraDynamics D8.
- Knot and link invariants belong to GeometricTopology.
- The comparison of Connes fusion with the interior tensor product of Hilbert C*-modules belongs
  to HilbertModules.
- Q-systems, module categories, pivotal module C*-categories and planar-to-C*-algebra
  completions belong to CategoricalOperatorAlgebras.
- The unitary Temperley–Lieb category, affine diagrams and annular modules belong to
  TemperleyLiebOperatorAlgebras.

HilbertModules and CategoricalOperatorAlgebras consume this roadmap. TemperleyLieb,
TemperleyLiebOperatorAlgebras, GeometricTopology and HilbertModules are not prerequisites of
any layer.

Outside the roadmap's conclusions:

- classification by Kosaki index for factor types other than II₁;
- the complete list of exceptional standard invariants up to index 5¼;
- reconstruction of arbitrary standard invariants of infinite index;
- classification of all inclusions with a given standard invariant, beyond the finite-depth
  hyperfinite case.

No historical conjecture is a target.

## Conventions

- **Inclusions.** Unless a statement says otherwise, `N ⊆ M` is a unital inclusion of II₁
  factors, represented normally. No separable predual is assumed. Separability enters only
  where it is stated, namely in two places. The first is Layer 9's local quantisation and
  generation arguments, and with them Popa's classification theorem. The second is Layer 10's
  type III example, whose input factor acts on a separable Hilbert space. The hyperfinite II₁
  factor `R` of 0.7 has separable predual.
- **Traces and index.** The normalised traces are `τ_N` and `τ_M`, and `τ_M` restricts to `τ_N`.
  The index is `[M:N] = dim_N L²(M)` in `[1,∞]` (0.5). Finite index is
  an extra hypothesis wherever it is used.
- **Jones tower.** The tower is `M_(−1) = N`, `M_0 = M`, `M_(k+1) = ⟨M_k, e_(k+1)⟩` for `k ≥ 0`.
  The projection `e_(k+1)` implements the trace-preserving expectation `M_k → M_(k−1)`. Every
  tower trace is normalised.
- **Hilbert spaces.** Inner products are conjugate-linear in the first variable.
- **Temperley–Lieb.** For finite index `d` put `δ = √d > 0`. The algebraic generators `U_i`
  satisfy `U_i² = δU_i` and `U_i U_(i±1) U_i = U_i`. They are δ times the Jones projections,
  whose adjacent triple product has coefficient `d⁻¹`.
  - Prose labels are one-based. The native generator `TauCeti.TemperleyLieb.e δ i`, with
    zero-based `i`, is `U_(i+1)`.
  - The closure trace `T_n` takes the value `δⁿ` on `1`. The normalised tower trace pulls back
    to `δ⁻ⁿ T_n`.
  - Tau Ceti's `TauCeti.TemperleyLieb.markovTrace q hδ` realises `T_n` for every unit `q` with
    `δ = −(q + q⁻¹)`. For positive real `δ ≤ 2` take `q = −e^(iθ)` with `δ = 2cos θ`; for
    `δ ≥ 2` take `q` negative real.
  - The analytic adjoint `†` is conjugate-linear, reverses products and fixes every `U_i`.
    Injectivity of a Temperley–Lieb action is a separate conclusion.
- **Planar algebras.**
  - Box spaces of a finite-index inclusion: `P_(n,+) = N′ ∩ M_(n−1)` and
    `P_(n,−) = M′ ∩ M_n` for `n ≥ 1`. In the connected case both zero-box spaces are `ℂ`.
  - The distinguished interval and the shading fix the boundary order. Reflection conjugates
    coefficients.
  - A closed contractible circle has value δ in the extremal spherical case.
  - An isomorphism of standard invariants preserves the distinguished inclusion, both shadings,
    traces, expectations, Jones projections and every tangle operation. An unlabelled principal
    graph is much weaker data.
- **Entropy.** `η(t) = −t log t` for `t ≥ 0`, with `η(0) = 0` and natural logarithms. This is
  Mathlib's `Real.negMulLog`.
- **Angles (rigid planar algebras).** In the oriented plane counterclockwise angles are positive.
  A string is oriented with the black region on its right. Its turning `Θ` is the signed total
  change of tangent angle, including the winding multiple of `2π`.

## Exact supplier contracts

**From Mathlib.**

- `VonNeumannAlgebra` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean`) is a star-subalgebra
  of bounded operators equal to its double commutant. It carries no factor, trace, type or
  separability data.
- `WStarAlgebra` (same file) asserts only that a Banach predual exists.
- `StarSubalgebra.centralizer` (`Mathlib/Algebra/Star/Subalgebra.lean`) is the commutant of a
  set together with its adjoints.
- `IsStarProjection` (`Mathlib/Algebra/Star/StarProjection.lean`) means idempotent and
  self-adjoint.
- `ContinuousLinearMapWOT` (`Mathlib/Analysis/LocallyConvex/WeakOperatorTopology.lean`) is the
  weak operator topology wrapper.
- `CStarAlgebra`, `StarAlgHom`, `MulOpposite` and `cfc` are the continuous functional
  calculus.
- `Real.negMulLog` (`Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`) takes the value 0
  at 0.
- `Real.sqrt` is the positive square root. `Real.arccos` has values in `[0,π]`.
- `FreeAlgebra`, `RingQuot` and `RingQuot.lift` underlie Tau Ceti's presentation and carry
  the construction of the analytic adjoint in 3.1.
- `StarRing`, `StarModule` and the `ComplexOrder` partial order on `ℂ` are used; in that order
  `0 ≤ z` means `z` is real and nonnegative.

None of these supplies a II₁ factor, a normal trace, an index, a correspondence or a planar
algebra.

**From Tau Ceti** (`TauCeti/Algebra/TemperleyLieb/Basic.lean`, `.../MarkovTrace.lean`).

- `TauCeti.TemperleyLieb R δ n` is the algebra presented by generators `e δ i`,
  `i : Fin (n − 1)`, and the three Temperley–Lieb relations.
- `TauCeti.TemperleyLieb.lift`, `lift_e` and `hom_ext` give the universal property.
- `strandIncl` and `strandIncl_e` give the last-strand inclusion.
- `e_ne_zero_two` says the generator is nonzero on two strands. `twoStrandRep` is the
  two-strand matrix model.
- `markovTrace q hδ` is the spin-model trace with loop value `δ = −(q + q⁻¹)`. It comes with
  `markovTrace_one` (value `δⁿ` on `1`), `markovTrace_mul_comm`, `markovTrace_strandIncl` (factor
  `δ`) and `markovTrace_strandIncl_mul_e_last` (the Markov property).
- No star structure, positivity or quotient is supplied.

**From TauCetiRoadmap.CStarAlgebras.** C5: spatial tensor products and C*-inductive limits of
unital injective systems, with their universal property.

**From TauCetiRoadmap.FreeProbability.** F3: scalar full Fock spaces and reduced free products.
F4: tracial amalgamated free products.

**From TauCetiRoadmap.OperatorAlgebraDynamics.** D8: `CAR(h)` with antilinear generators, the
antisymmetric Fock space, quasi-free states and Bogoliubov functoriality for unitaries.

## How to read the build

Layer k is the section that consumers cite as Sk. Section 2.6 on relative entropy is cited as
S2a. The layers build up as follows.

- **Layer 0** states the von Neumann algebra prerequisites over Mathlib's `VonNeumannAlgebra`:
  normality and GNS, modular theory and the standard form, traces and tracial L², group algebras
  and crossed products, coupling dimension and the index, weights and spatial derivatives,
  the hyperfinite II₁ factor and amenability.
- **Layer 1** builds normal correspondences and Connes fusion for arbitrary von Neumann
  algebras.
- **Layer 2** builds the basic construction, finite bases, the Jones tower, bifinite bimodules,
  the index of expectations and relative entropy.
- **Layer 3** proves Jones's positivity theorem for the Temperley–Lieb trace, builds the positive
  path models, the positive Jones quotients and their C*-tower, and deduces the index restriction
  from Layer 2's tower.
- **Layer 4** develops commuting squares and Ocneanu compactness, and realises every allowed
  index in `R`.
- **Layer 5** defines the standard invariant, extremality, depth and principal graphs.
- **Layer 6** builds shaded and rigid planar algebras, and the two-way correspondence between
  them.
- **Layer 7** builds graph planar algebras, planar modules, the embedding theorems and
  presentations by generators and relations.
- **Layer 8** reconstructs subfactors from planar algebras.
- **Layer 9** proves Popa's finite-depth classification and the classification below index 4.
- **Layer 10** treats bimodules of infinite index.

## Layer 0: Von Neumann algebra prerequisites

Mathlib's `VonNeumannAlgebra H` is a star-subalgebra of `H →L[ℂ] H` equal to its double
commutant, with `VonNeumannAlgebra.centralizer_centralizer` as its defining law. It has no
normality, predual, trace, weight, dimension or factor data. This layer states over it the
general theory that the inclusion theory of the later layers uses, at the generality those
layers need. Throughout, M and N are von Neumann algebras on complex Hilbert spaces, `M′` is the
commutant (`StarSubalgebra.centralizer`), and no separability is assumed unless a statement says
so.

### 0.1 Normal functionals, normal representations and GNS

Define a positive linear functional ω on M to be normal when `ω(sup_i x_i) = sup_i ω(x_i)` for
every bounded increasing net of self-adjoint elements, and define the predual `M_*` as the
norm-closed span of the normal positive functionals in the dual of M. Define a unital
*-homomorphism `π : M → B(K)` to be normal when it preserves suprema of bounded increasing nets
of self-adjoint elements.

- For a positive functional ω on M the following are equivalent: ω is normal; ω is completely
  additive on families of orthogonal projections; the restriction of ω to the unit ball is
  weak-operator continuous; that restriction is strong-operator continuous (Anantharaman–Popa,
  Theorem 2.5.5).
- Von Neumann's bicommutant theorem: a unital *-subalgebra of `B(H)` equals its double commutant
  if and only if it is weak-operator closed (Anantharaman–Popa, Theorem 2.1.3). So Mathlib's
  `VonNeumannAlgebra` is exactly a weak-operator closed unital *-subalgebra, in the topology of
  `ContinuousLinearMapWOT`.
- Every *-isomorphism of von Neumann algebras is normal (Anantharaman–Popa, Corollary 2.5.9), and
  the range of a normal unital *-homomorphism is a von Neumann algebra on its target space
  (Anantharaman–Popa, Proposition 2.5.12).
- For a state φ on M with GNS triple `(π_φ, H_φ, ξ_φ)`, `π_φ` is normal exactly when φ is
  normal, and then `π_φ(M)` is a von Neumann algebra on `H_φ` (Anantharaman–Popa,
  Theorem 2.6.1).

**Checks.**

- On `M = ℓ^∞(ℕ)` acting on `ℓ²(ℕ)`, `ω(x) = Σ_n 2^(−n−1) x_n` is normal. A Banach limit is a
  state that is not normal: it vanishes on every finite projection `1_[0,n]`, while their
  supremum 1 has value 1. A definition by norm continuity alone would accept it.
- For `M = M₂(ℂ)` and the vector state `φ(x) = x₁₁`, the GNS space has dimension 2, not 4: the
  null space `{x : φ(x*x) = Σ_i |x_(i1)|² = 0}` is the matrices with zero first column. For the
  faithful state `Tr(diag(1/3, 2/3)·)` the dimension is 4.
- The upper triangular 2×2 matrices form a weak-operator closed unital algebra whose commutant is
  `ℂ1`, so its double commutant is `M₂(ℂ)`. The bicommutant theorem needs closure under `*`.

*Needs:* Mathlib `VonNeumannAlgebra`, `StarSubalgebra.centralizer`, `ContinuousLinearMapWOT`,
`StarAlgHom`.

### 0.2 Modular theory and the standard form

For a faithful normal semifinite weight φ on M, with GNS map `Λ_φ` on
`n_φ = {x : φ(x*x) < ∞}`, define `S_φ : Λ_φ(x) ↦ Λ_φ(x*)` for `x ∈ n_φ ∩ n_φ*`. Prove that it is
closable, write `S̄_φ = J_φ Δ_φ^(1/2)` for the polar decomposition of its closure, and prove the
following (Kosaki, §2.1 and Example 2.1):

- `J_φ` is an antiunitary involution and `J_φ Δ_φ J_φ = Δ_φ⁻¹`;
- Tomita's theorem: `J_φ M J_φ = M′` and `Δ_φ^(it) M Δ_φ^(−it) = M` for real t;
- the modular group `σ_t^φ = Ad Δ_φ^(it)` restricted to M satisfies the KMS condition for φ at
  inverse temperature 1, and is the only one-parameter automorphism group that does.

Every von Neumann algebra has a faithful normal semifinite weight: sum a maximal family of normal
positive functionals with mutually orthogonal supports. Define the standard form of M as
`(L²(M), J, P)` built from such a weight, with `L²(M) = H_φ`, `J = J_φ` and P the closure of
`{Δ_φ^(1/4) Λ_φ(x) : x ∈ n_φ ∩ n_φ*, x ≥ 0}`. Prove that for two
such weights there is a unique unitary between the GNS spaces that intertwines the left actions
of M, the two conjugations and the two cones; the route is Connes's 2×2 matrix trick and the
Radon–Nikodym cocycle `(Dφ : Dφ₀)_t` (Kosaki, Appendix A §1).

**Checks.**

- For `M = M₂(ℂ)` on `H = M₂(ℂ)` with `⟨x, y⟩ = Tr(x* y)` and `φ = Tr(h·)`, `h = diag(1/5, 4/5)`:
  `Δ x = h x h⁻¹`, `J x = x*`, and `Δ E₁₂ = (1/5)(4/5)⁻¹ E₁₂ = (1/4) E₁₂`, so
  `σ_t(E₁₂) = 4^(−it) E₁₂` (Kosaki, Example 2.1). The inverse convention `Δ x = h⁻¹ x h` gives 4.
- A trace has trivial modular data: for `h = (1/2)·1` on `M₂(ℂ)`, `Δ = 1` and `σ_t = id`.
- Faithfulness is needed: for the vector state `φ(x) = x₁₁` on `M₂(ℂ)`, `Λ_φ(E₂₂) = 0` while
  `E₂₂ ≠ 0`, so `S_φ` is not well defined on `Λ_φ(M)`.
- For `M = ℂ` on `ℂ`, J is complex conjugation and `JMJ = ℂ = M′`.

*Needs:* 0.1.

### 0.3 Finite factors, traces and tracial L²

Define a tracial von Neumann algebra as a pair `(M, τ)` with τ a faithful normal tracial state,
and a II₁ factor as an infinite-dimensional factor admitting such a τ (Anantharaman–Popa,
Definitions 1.3.3 and 1.3.14). Build `L²(M, τ)` as the GNS space of τ, with `x ↦ x̂`, and the
conjugation `J x̂ = (x*)^`.

- A factor has at most one tracial state; a factor has a normal tracial state if and only if 1 is
  a finite projection, and the trace is then faithful (Anantharaman–Popa, Proposition 4.1.3 and
  Theorem 6.3.5).
- In `L²(M, τ)` the left and right multiplication algebras are each other's commutants and
  `J L(M) J = R(M) = L(M)′` (Anantharaman–Popa, Theorem 7.1.1). This is 0.2's standard form with
  `Δ = 1`.
- For a unital von Neumann subalgebra `B ⊆ M` there is a unique τ-preserving conditional
  expectation `E_B : M → B`; it is normal, faithful and B-bimodular, and the orthogonal
  projection `e_B` of `L²(M)` onto `L²(B)` satisfies `e_B x̂ = E_B(x)^` (Anantharaman–Popa,
  Theorem 9.1.2). For `P ⊆ B ⊆ M`, uniqueness gives `E_P ∘ E_B = E_P`.

**Checks.**

- In `M₂(ℂ)` with `τ = Tr/2`, `‖Ê₁₁‖₂² = 1/2` and `J Ê₁₂ = Ê₂₁`. The unnormalised trace gives
  `‖Ê₁₁‖₂² = 1`, and its `L²` would not contain `1̂` as a unit vector.
- For the diagonal `D₂ ⊂ M₂(ℂ)`, `E_(D₂)` is the diagonal compression, so `E(E₁₂) = 0` and
  `E([[a, b], [c, d]]) = diag(a, d)`. For `ℂ1 ⊂ M₂(ℂ)` the vector state `x ↦ x₁₁` is a
  conditional expectation that is not τ-preserving: it sends `E₁₁` to 1 instead of 1/2.
- `B(ℓ²(ℕ))` is a factor with no normal tracial state, and the trace of `M_n(ℂ)` is `Tr/n` with
  `τ(E₁₁) = 1/n`.

*Needs:* 0.1, 0.2.

### 0.4 Group von Neumann algebras, tensor products and crossed products

For a discrete group G define `L(G)` as the von Neumann algebra on `ℓ²(G)` generated by the left
regular representation λ, with trace `τ(x) = ⟨δ_e, x δ_e⟩`. For von Neumann algebras `M_i` on
`H_i` define the spatial tensor product `M₁ ⊗̄ M₂` on `H₁ ⊗ H₂`. For an action σ of a discrete
group G on a von Neumann algebra `B ⊆ B(H)` define the crossed product `B ⋊_σ G` on
`H ⊗ ℓ²(G)` generated by `π_σ(b)(ξ ⊗ δ_h) = σ_(h⁻¹)(b)ξ ⊗ δ_h` and `1 ⊗ λ_g` (Kosaki, §2.1,
Definition 2.2 and the discrete-group discussion following it, printed pp. 6–7). This
definition needs neither a trace on B nor an implementation of σ on H. For a trace-preserving
action on a tracial `(B, τ)` with `H = L²(B, τ)`, Anantharaman–Popa represent the formal sums
`Σ b_g u_g` by `(b u_g)(ξ ⊗ δ_h) = b σ_g(ξ) ⊗ δ_gh` (Anantharaman–Popa, §5.2); the unitary
`W(ξ ⊗ δ_h) = σ_(h⁻¹)(ξ) ⊗ δ_h` satisfies `W (b u_g) W* = π_σ(b)(1 ⊗ λ_g)`, so the two pictures
give unitarily equivalent algebras, and the tracial statements below hold in either.

- `L(G) = R(G)′` and `R(G) = L(G)′` (Anantharaman–Popa, Theorem 1.3.6); `L(G)` is a factor
  exactly when every nontrivial conjugacy class of G is infinite (Anantharaman–Popa,
  Proposition 1.3.9).
- `M₁ ⊗̄ M₂` is a factor when both are factors, and the tracial tensor product is the unique
  tracial von Neumann algebra containing the algebraic tensor product densely with
  `τ(x₁ ⊗ x₂) = τ₁(x₁) τ₂(x₂)` (Anantharaman–Popa, Propositions 5.1.2 and 5.1.4).
- The covariance relation `(1 ⊗ λ_g) π_σ(b) (1 ⊗ λ_g)* = π_σ(σ_g(b))` holds, π_σ is normal and
  injective, and the coefficient of `δ_e` is a faithful normal conditional expectation onto
  `π_σ(B)` (Kosaki, §2.1, printed pp. 6–7). For a trace-preserving action on a tracial
  `(B, τ)`, this expectation is trace-preserving for the trace `τ(x) = ⟨1̂ ⊗ δ_e, x(1̂ ⊗ δ_e)⟩`,
  `B′ ∩ (B ⋊ G) = Z(B)` exactly when the action is properly outer, and then `B ⋊ G` is a
  factor exactly when the action on `Z(B)` is ergodic (Anantharaman–Popa, §5.2 and
  Proposition 5.2.3).

**Checks.**

- The covariance relation fixes the convention. Applied to `ξ⊗δ_h`, the operator
  `(1⊗λ_g)π_σ(b)(1⊗λ_g)*` gives `σ_(h⁻¹g)(b)ξ⊗δ_h`, which is `π_σ(σ_g(b))(ξ⊗δ_h)`. With
  `σ_h(b)` in place of `σ_(h⁻¹)(b)` the two sides are `σ_(g⁻¹h)(b)ξ⊗δ_h` and `σ_(hg)(b)ξ⊗δ_h`.
  For the translation action of `S₃` on `ℓ^∞(S₃)` with `g = (12)` and `h = (23)` they differ,
  since `g⁻¹h ≠ hg`.
- The two tracial pictures differ pointwise and agree after W. For the swap action of `ℤ/2` on
  `B = ℂ²` with `b = (1, 0)`, `g = 1` and the vector `1̂ ⊗ δ_0`: Anantharaman–Popa's generator
  gives `(b u_1)(1̂ ⊗ δ_0) = (1, 0) ⊗ δ_1`, while `π_σ(b)(1 ⊗ λ_1)(1̂ ⊗ δ_0) = σ_1(b) ⊗ δ_1 =
  (0, 1) ⊗ δ_1`. Since `W(1̂ ⊗ δ_0) = 1̂ ⊗ δ_0` and `W((1, 0) ⊗ δ_1) = (0, 1) ⊗ δ_1`, the identity
  `W (b u_1) = π_σ(b)(1 ⊗ λ_1) W` holds on this vector, as it does on all of them.
- `L(S₃) ≅ ℂ ⊕ ℂ ⊕ M₂(ℂ)` has dimension 6 and is not a factor, while the group of finitary
  permutations of ℕ has infinite nontrivial conjugacy classes and gives a II₁ factor.
  `τ(λ_g) = 0` for `g ≠ e`.
- `ℓ^∞(ℤ/2) ⋊ ℤ/2` for the swap is `M₂(ℂ)`, a factor; the trivial action on `ℂ²` gives the
  abelian algebra `ℂ² ⊗ L(ℤ/2)`, also of dimension 4.

*Needs:* 0.1, 0.3.

### 0.5 Coupling dimension and the index

For a tracial `(M, τ)`, a right M-module is a Hilbert space with a normal unital
*-representation of `Mᵐᵒᵖ`. Prove that every right M-module is isomorphic to `p(ℓ²(I) ⊗ L²(M))`
for some set I and some projection p in the commutant of the right action
(Anantharaman–Popa, Proposition 8.2.3, stated there for separable spaces; the proof with a
maximal orthogonal family of cyclic submodules, Lemma 8.2.1, works for any I). Define
`dim(H_M) = (Tr ⊗ τ)(p)` in `[0, ∞]` (Anantharaman–Popa, Definition 8.5.4), and for a unital
inclusion `N ⊆ M` of II₁ factors define the index `[M:N] = dim(L²(M)_N)` (Anantharaman–Popa,
Definition 9.4.9, there for separable M).

- `dim` is independent of the presentation, additive on direct sums, and `dim(L²(M)_M) = 1`
  (Anantharaman–Popa, equation (8.6)).
- Over a II₁ factor, `dim(H_M) < ∞` exactly when H is finitely generated, exactly when the
  commutant of the right action is finite (Anantharaman–Popa, Propositions 8.5.5 and 8.6.1). For
  separable M, dim classifies separable right modules, with every value in `[0, ∞]` attained
  (Anantharaman–Popa, Proposition 8.6.2).
- `[M:N] ≥ 1`, with equality exactly when `N = M` (Anantharaman–Popa, Remark 9.4.10).
- Restriction of scalars: for a finite right M-module H, `dim(H_N) < ∞` exactly when
  `[M:N] < ∞`, and then `dim(H_N) = [M:N] dim(H_M)` (Anantharaman–Popa, Exercise 9.15).
  Multiplicativity `[M:P] = [M:N][N:P]` in `[1, ∞]` for II₁ factors `P ⊆ N ⊆ M` with
  `[M:N] < ∞` follows by applying this to `P ⊆ N` and the finite right N-module `L²(M)`.
- `[N ⊗ M_n(ℂ) : N ⊗ 1] = n²` (Anantharaman–Popa, Exercise 9.14), and for a subgroup H of a
  group G, `dim(ℓ²(G)_(L(H))) = [G:H]` (Anantharaman–Popa, Exercise 9.13).

**Checks.**

- For `M = M_n(ℂ)` with `τ = Tr/n`, the row space `ℂⁿ` is a right M-module of dimension `1/n`,
  since `L²(M)` is n copies of it and has dimension 1. The unnormalised trace would give 1.
- `[N ⊗ M₂(ℂ) : N ⊗ 1] = 4`, not 2: the index squares the matrix size.
- For `G = S₃` and `H = ⟨(12)⟩`, `dim(ℓ²(S₃)_(L(H))) = 3`, and for the trivial subgroup it is 6.
- The identity inclusion has index 1, and a proper inclusion has index greater than 1.

*Needs:* 0.1, 0.3, 0.4.

### 0.6 Weights, operator-valued weights and spatial derivatives

Define the extended positive part `M̂₊` as the lower semicontinuous additive positively
homogeneous maps `M_*⁺ → [0, ∞]` (Kosaki, Appendix A §2), an operator-valued weight
`T : M₊ → N̂₊` for `N ⊆ M` as an additive, positively homogeneous map with
`T(y* x y) = y* T(x) y` for `y ∈ N` (Kosaki, Appendix A §4), and, for a faithful normal
semifinite weight φ on M and ψ′ on `M′` acting on K, Connes's spatial derivative `dφ/dψ′` as the
positive self-adjoint operator of the closed quadratic form built from φ and ψ′ (Kosaki, §3.1,
first part).

- `dψ′/dφ = (dφ/dψ′)⁻¹`, `(dφ/dψ′)^(it) x (dφ/dψ′)^(−it) = σ_t^φ(x)` for `x ∈ M`, and
  `(dφ₁/dψ′)^(it)(dφ/dψ′)^(−it) = (Dφ₁ : Dφ)_t` (Kosaki, §3.1, properties after Remark 3.3).
- Haagerup's theorem: for faithful normal semifinite weights φ on M and ψ on N with
  `σ_t^φ|_N = σ_t^ψ`, there is a unique normal semifinite faithful operator-valued weight
  `F : M₊ → N̂₊` with `φ = ψ ∘ F` (Kosaki, Appendix A §4).
- Takesaki's theorem: if `φ|_N` is semifinite and `σ_t^φ(N) = N` for all t, there is a unique
  normal conditional expectation `E : M → N` with `φ ∘ E = φ` (Kosaki, Appendix A §3). For a
  tracial `(M, τ)` the modular group is trivial and this is 0.3's `E_N`.
- For a faithful normal conditional expectation `E : M → N`, there is a unique operator-valued
  weight `E⁻¹ : N′ → M′` with `d(ψ′ ∘ E⁻¹)/dφ = dψ′/d(φ ∘ E)` for faithful normal semifinite
  weights φ on N and ψ′ on `M′`, and it does not depend on ψ′ (Kosaki, §3.1, construction of
  `E⁻¹`).

**Checks.**

- For `M = ℂ` on `K = ℂ²`, `M′ = M₂(ℂ)`, `ψ′ = Tr(h·)` with `h = diag(1/5, 4/5)` and φ the
  identity functional on ℂ, `dφ/dψ′ = h⁻¹ = diag(5, 5/4)` (Kosaki, Remark 3.3(iii)). The
  inverse convention gives `diag(1/5, 4/5)`.
- For `ℂ ⊂ M_n(ℂ)` and the expectation `E = Tr(h·)`, `E⁻¹(1) = Tr(h⁻¹)`. For
  `h = diag(1/5, 4/5)` this is `5 + 5/4 = 25/4`, and the minimum over states, `n² = 4`, is
  attained exactly at `h = 1/2` (Kosaki, §3.3, first example).
- For `M = B(K)` and `ψ′ = 1` on `M′ = ℂ`, `d(Tr(k·))/dψ′ = k`, so the spatial derivative is the
  density.

*Needs:* 0.1, 0.2.

### 0.7 The hyperfinite II₁ factor and L² perturbation lemmas

Define R as the weak closure of `⋃_n M_(2ⁿ)(ℂ)`, with the unital trace-preserving embeddings
`x ↦ diag(x, x)`, in the GNS representation of its trace (Anantharaman–Popa, §1.6). Define a
tracial `(M, τ)` to be approximately finite-dimensional when, for every finite subset F of M and
every `ε > 0`, some finite-dimensional unital *-subalgebra Q of M satisfies `d₂(x, Q) < ε` for
all `x ∈ F` (Anantharaman–Popa, Definition 11.1.2). Prove the L² perturbation lemmas that the
uniqueness theorem below and Layer 9 use (Anantharaman–Popa, Lemmas 11.1.14–11.1.16 and
Lemma 11.2.1; Popa, Appendix A).

- For a projection `e ∈ M` and a positive `x ∈ eMe` with `‖e − x‖₂ < ε′‖e‖₂`, `0 < ε′ < 1`, the
  spectral projection `e′` of x for the interval `(1 − √ε′, 1 + √ε′)` satisfies `e′ ≤ e`,
  `‖e − e′‖₂ < √ε′ ‖e‖₂` and `‖e′ − xe′‖ < √ε′`.
- For `x ∈ Me` with `‖x*x − e‖₂ < ε′‖e‖₂`, `ε′ < 1`, there are a projection `e′ ≤ e` and a partial
  isometry u with `u*u = e′`, `‖e − e′‖₂ < √ε′ ‖e‖₂` and `‖xe′ − u‖ < ε′^(1/4)`.
- Two projections of equal trace in a II₁ factor at `‖·‖₂`-distance ε are conjugate by a unitary
  at `‖·‖₂`-distance at most `Cε` from 1, with a universal constant C. For every n and `η > 0`
  there is `ε > 0` such that a family `(v_ij)` of elements of M satisfying the `n × n` matrix-unit
  relations up to ε in `‖·‖₂` lies within η of an exact system of matrix units of M.
- In an approximately finite-dimensional II₁ factor every finite set of unitaries is approximated
  in `‖·‖₂` by a unital subalgebra of type `I_(2ⁿ)` (Anantharaman–Popa, Lemma 11.2.1).
- Approximate finite-dimensionality passes to corners: if `(M, τ)` is approximately
  finite-dimensional, so is `pMp` for every nonzero projection p, with the trace `τ/τ(p)`. The
  route approximates p and the given elements by a finite-dimensional Q, replaces p by a
  projection of Q close to it through the first two lemmas, conjugates that projection back to p
  by a unitary close to 1 through the third, and compresses Q.

Prove the following.

- R is a II₁ factor with separable predual, and it is approximately finite-dimensional
  (Anantharaman–Popa, §1.6).
- For a separable II₁ factor M the following are equivalent: M is approximately
  finite-dimensional; M is generated by an increasing sequence of finite-dimensional unital
  *-subalgebras; M is generated by an increasing sequence of unital subalgebras of type
  `I_(2^k)`; `M ≅ R` (Anantharaman–Popa, Theorem 11.2.2, conditions (2)–(5)). The proof uses
  Lemma 11.2.1 and the corner lemma above, and nothing about amenability. Connes's theorem that
  an amenable II₁ factor is approximately finite-dimensional is not used by any layer and is not a
  target.
- Every nonzero corner `pRp` is isomorphic to R, by the corner lemma and the uniqueness theorem;
  `R ⊗ M_n(ℂ) ≅ R` and `R ⊗̄ R ≅ R`, since each is generated by an increasing sequence of
  finite-dimensional algebras (Anantharaman–Popa, Remark 11.2.3, with the corner lemma in place
  of amenability).

**Checks.**

- The embedding `x ↦ diag(x, x)` keeps `τ(E₁₁) = 1/2` at every level. The non-unital embedding
  `x ↦ diag(x, 0)` sends `E₁₁` to a projection of trace 1/4 and does not define a trace on the
  union.
- For a projection p of trace 1/3, `pRp ≅ R` with normalised trace `3τ`. No projection of trace
  1/3 lies in any `M_(2ⁿ)(ℂ)` of the generating sequence, so the corner lemma, not the generating
  sequence alone, gives this.
- `L(F₂)` is a separable II₁ factor that is not isomorphic to R: R has property Γ and `L(F₂)`
  does not (Anantharaman–Popa, Examples 15.4.3). So `L(F₂)` is not generated by an increasing
  sequence of finite-dimensional algebras, and the uniqueness theorem needs that hypothesis, not
  only separability.
- In `M₂(ℂ)` with `τ = Tr/2`, `e = 1` and `x = diag(1, 1 − t)` for `0 < t < 1`: `‖e − x‖₂ = t/√2`,
  so `ε′ = t/√2`. At `t = 1/2` the window `(1 − √ε′, 1 + √ε′) ≈ (0.41, 1.59)` contains `1/2`,
  so the first lemma returns `e′ = 1` with `‖e′ − xe′‖ = 1/2 < √ε′ ≈ 0.59`. At `t = 9/10` the
  window `≈ (0.20, 1.80)` excludes `1/10`, so it returns `e′ = E₁₁` with `‖e − e′‖₂ = 1/√2 ≈ 0.71 <
  √ε′ ≈ 0.80` and `‖e′ − xe′‖ = 0`.
- In `M₂(ℂ)` with `τ = Tr/2`, `E₁₁` and the projection onto `(cos θ, sin θ)` are at
  `‖·‖₂`-distance `sin θ`; the rotation by θ conjugates one to the other and is at distance
  `2 sin(θ/2)` from 1, which is at most `√2 sin θ` for `0 ≤ θ ≤ π/2`.

*Needs:* 0.3, 0.4, 0.5.

### 0.8 Amenability and hypertraces

Define a von Neumann algebra `M ⊆ B(H)` to be amenable when there is a conditional expectation
`B(H) → M`, that is a unital completely positive map that is the identity on M (Anantharaman–Popa,
Definition 10.2.1). For a tracial `(M, τ)` define a hypertrace as a state ψ on `B(L²(M))` with
`ψ(xT) = ψ(Tx)` for all `x ∈ M` and `T ∈ B(L²(M))` and `ψ|_M = τ` (Anantharaman–Popa, §10.2.2).
Prove the following.

- Amenability does not depend on the representation: it is equivalent to the extension
  property for unital completely positive maps into M along inclusions of unital C*-algebras
  (Anantharaman–Popa, Proposition 10.2.2).
- A tracial `(M, τ)` is amenable exactly when it has a hypertrace (Anantharaman–Popa,
  Proposition 10.2.5). For a II₁ factor the condition `ψ|_M = τ` is automatic.
- Følner-type characterisation: a tracial `(M, τ)` is amenable exactly when, for every `ε > 0`
  and every finite set F of unitaries of M, there is a positive finite-rank operator T on
  `L²(M)` with `‖T‖_(2,Tr) = 1`, `‖uT − Tu‖_(2,Tr) ≤ ε` for `u ∈ F` and `|Tr(xT²) − τ(x)| ≤ ε`
  for `‖x‖ ≤ 1` (Anantharaman–Popa, Theorem 10.2.9); for a II₁ factor, exactly when for every
  such ε and F there is a finite-rank projection P with `‖uPu* − P‖_(2,Tr) < ε‖P‖_(2,Tr)` for
  `u ∈ F` (Anantharaman–Popa, Theorem 10.3.1).
- `L(G)` is amenable exactly when G is amenable (Anantharaman–Popa, Proposition 10.1.3), and R
  is amenable (Anantharaman–Popa, Theorem 10.2.4).
- Amenability passes to a von Neumann subalgebra onto which there is a conditional expectation,
  hence to every von Neumann subalgebra of a tracial amenable algebra through 0.3's `E_B`.

Layer 9 uses the hypertrace and the finite-rank Følner projections; the converse direction,
Connes's theorem that an amenable II₁ factor is approximately finite-dimensional, is not a
target of this roadmap.

**Checks.**

- `M = M_n(ℂ) ⊗ 1` on `ℂⁿ ⊗ K` is amenable: the slice map `id ⊗ φ` for any state φ of `B(K)` is a
  conditional expectation onto M. For `M = ℂ1` every state of `B(H)` is one.
- The commutation condition carries the content of a hypertrace. For any tracial `(M, τ)` the
  vector state `ω(T) = ⟨1̂, T 1̂⟩` restricts to τ on M, but for a unitary `u ∈ M` with
  `τ(u) = 0` and the rank-one operator `T = |1̂⟩⟨û|`, `ω(uT) = τ(u) conj(τ(u)) = 0` while
  `ω(Tu) = ⟨û, û⟩ = 1`. A definition that dropped the commutation condition would make every
  tracial algebra amenable.
- `L(F₂)` has no hypertrace, since `F₂` is not amenable.
- For a II₁ factor M a hypertrace is never normal: a normal state is `Tr(ρ ·)` with ρ trace
  class, the commutation condition puts ρ in `M′`, and the II₁ factor `M′ = JMJ` contains no
  nonzero finite-rank operator, so `ρ = 0`.

*Needs:* 0.1, 0.3, 0.7.

### Examples

- `L²(M₂(ℂ), Tr/2)` is the standard form of `M₂(ℂ)`, with `J x̂ = (x*)^` and `Δ = 1`.
- `L(ℤ) ≅ L^∞(S¹)` is a tracial abelian von Neumann algebra, not a factor; `L(S_∞)` for the
  finitary permutation group is a model of R.

### Dependencies

Mathlib `VonNeumannAlgebra`, `StarSubalgebra.centralizer`, `ContinuousLinearMapWOT`,
`StarAlgHom`. No other layer.

## Layer 1: Normal correspondences and Connes fusion

### 1.1 Correspondences

Define an M–N correspondence, for von Neumann algebras M and N, as a complex Hilbert space H with
commuting normal unital *-representations of M and of `Nᵐᵒᵖ`. Build the following constructions,
and compare the right-action notation with Mathlib's `MulOpposite` convention.

- intertwiner spaces and closed invariant subspaces;
- orthogonal direct sums and unitary equivalence;
- functorial change of coefficients along normal unital *-homomorphisms;
- the conjugate correspondence H̄, which exchanges the two actions and conjugates the scalars.

Construct `L²(M)` as the identity correspondence from the general standard form, including for
M that is not σ-finite (0.2).

- The conjugate of the conjugate is canonically H, and the adjoint of an intertwiner is an
  intertwiner.
- `L²(M)` is self-conjugate through the modular conjugation J.
- Change of coefficients is functorial, and it preserves direct sums.

**Checks.**

- On `H = ℂ` as a ℂ–ℂ correspondence, `⟨i·1, 1⟩ = −i`. A form linear in the first variable gives
  `+i`.
- The zero correspondence is a zero object. Its conjugate is zero, and its intertwiner space with
  any H is `{0}`.
- For `M = M₂(ℂ)` with its normalised trace, `L²(M)` is `M₂(ℂ)` with the normalised
  Hilbert–Schmidt inner product, and J is `x ↦ x*`. The right action of `y` is `ξ ↦ ξy`, and J
  intertwines it with left multiplication by `y*`.

*Needs:* 0.1, 0.2; Mathlib `MulOpposite`, `StarAlgHom`.

### 1.2 Bounded vectors and Connes fusion

For a faithful normal semifinite weight ψ on N, use the opposite weight `ψ^op` on `N^op`. A vector
ξ of a right N-module is right bounded when `Λ_(ψ^op)(y^op) ↦ ξ·y` extends to a bounded
right-N-linear map. Identify its domain with `L²(N,ψ)` by `Λ_(ψ^op)(y^op) ↦ JΛ_ψ(y*)`, and call
the resulting operator `R_ξ`. This fixes the modular right action. The map `Λ_ψ(y) ↦ ξy` is not
the bounded-vector map when the weight is not tracial.

Define the Connes fusion `H ⊗_N K` from

`⟨ξ⊗η, ξ′⊗η′⟩ = ⟨η, (R_ξ* R_ξ′) η′⟩`,

where the operator `R_ξ* R_ξ′` lies in `(N^op)′ = N` and acts through K's left action. Prove that
this form is positive on finite sums. Take the quotient by its null space and complete. Build both
outer normal actions (Anantharaman–Popa, Chapter 13; Burns, §2.1.2, Definition 2.1.15).

- The bounded vectors are dense. The fusion is independent of the weight, up to canonical unitary
  comparisons.
- There are an associator, left and right unitors and a conjugation comparison. They satisfy the
  pentagon and triangle identities.
- Fusion of bounded intertwiners is bounded, with norm at most the product of the norms, and it
  is compatible with adjoints.
- Fusion distributes over direct sums.

**Checks.**

- For `N = M₂(ℂ)` with `ψ = Tr(ρ·)`, `ρ = diag(1/5, 4/5)`, and `ξ = ρ^(1/2)` in `L²(N,ψ)`, `R_ξ`
  is isometric. The rejected map `Λ_ψ(y) ↦ ξy` sends `E₂₁ρ^(1/2)` to `ρ^(1/2)E₂₁`, which multiplies
  the norm by 2, so it is not the bounded-vector map.
- `H ⊗_N 0 = 0`, and fusion with a direct sum is the direct sum of the fusions.
- `L²(N) ⊗_N K ≅ K` through the left unitor. For `N = ℂ` the fusion is the Hilbert tensor product
  `H ⊗ K`, and its dimension is the product of the dimensions.

*Needs:* 1.1; 0.2, 0.6.

### Examples

- For N a II₁ factor, `L²(N) ⊗_N L²(N) ≅ L²(N)`. In the tracial case `R_ξ` is right
  multiplication by the bounded element `ξ ∈ N` for `ξ ∈ NΩ`.

### Dependencies

Layer 0 (0.1, 0.2, 0.6). No other layer.

## Layer 2: Expectations, bases and the Jones tower

### 2.1 The basic construction

Consume the trace-preserving expectation `E_N` and the orthogonal projection `e_N` on `L²(M)` from
0.3, and the index `[M:N]` from 0.5. Prove their basic properties:

- `e_N x e_N = E_N(x) e_N` for `x ∈ M`, and `e_N ∈ N′`;
- `⟨M, e_N⟩ = J N′ J`, and this algebra is identified with the bounded right-N-linear operators
  on `L²(M)`.

Build the canonical semifinite trace on the basic construction by `Tr(x e_N y) = τ_M(yx)`.
Prove that it is normal and faithful, and describe its finite-trace ideal. Prove `Tr(1) = [M:N]`,
so finite index holds exactly when `⟨M, e_N⟩` is finite (Jones–Sunder, §3.1; Pimsner–Popa, §1).
Give the inclusion and fusion comparisons and the commutant and corner dimension identities
without assuming that relative commutants are finite-dimensional.

**Checks.**

- Let A be the tracial infinite tensor product of copies of `(M₂(ℂ), tr)` over an uncountable
  set. Then A is a II₁ factor without separable predual. For `A ⊂ A ⊗ M₂(ℂ)` the index is 4,
  `Tr(1) = 4` and `τ_(M₁)(e_N) = 1/4`.
- For the identity inclusion `N = M`, `e_N = 1`, `⟨M, e_N⟩ = M` and `Tr(1) = 1`.
- `R ⊗ 1 ⊂ R ⊗̄ R` has `Tr(1) = ∞`. The canonical trace is then semifinite and not finite.

*Needs:* 0.3, 0.5.

### 2.2 Finite bases and the Pimsner–Popa inequality

At finite index construct a finite right basis `(b_i)` with `x = Σ_i b_i E_N(b_i* x)` for all
`x ∈ M`, and the adjoint formula. Develop the following:

- the projection matrix that encodes the module;
- independence of the basis, and `Σ_i b_i b_i* = d·1`;
- the Pimsner–Popa inequality `E_N(x) ≥ d⁻¹x` for positive x, and the optimality of `d⁻¹` for
  inclusions of factors (Pimsner–Popa, Theorem 2.2, and Kosaki, Theorem 3.8);
- at infinite index, the optimal uniform constant is 0;
- the comparison of the basis, dimension and expectation descriptions of the index;
- for nonzero `p ∈ N′ ∩ M`, the local-index formula `[pMp : Np] = tr_(N′)(p) τ_M(p) [M:N]`, where
  `tr_(N′)` is the normalised trace of the commutant of N on `L²(M)` (Anantharaman–Popa,
  Exercise 9.16; Pimsner–Popa, formula 0.13; both from Jones, *Index for subfactors*, §2.2);
- for nonzero orthogonal `p_1, …, p_n ∈ N′ ∩ M` summing to 1, the sum formula
  `[M:N] = Σ_i tr_(N′)(p_i)⁻¹ [p_i M p_i : N p_i]`, hence `[M:N] ≥ n²` (Anantharaman–Popa,
  Exercise 9.17; Pimsner–Popa, formula 0.14);
- finite-dimensionality of `N′ ∩ M` at finite index, with `dim(N′ ∩ M) ≤ [M:N]`: apply the sum
  formula to the minimal projections of a maximal abelian subalgebra of `N′ ∩ M`, which has
  dimension n, and use `dim(⊕_i M_(k_i)(ℂ)) = Σ_i k_i² ≤ (Σ_i k_i)²`.

For a nonzero finite left M-module H prove `dim_N(pH) = tr_(N′ on H)(p) dim_N(H)` and
`dim_(pMp)(pH) = dim_M(H)/τ_M(p)`, and deduce the local-index formula with H's commutant trace.
The traces `τ_M` and `tr_(N′)` on `N′ ∩ M` are not identified when the inclusion is not extremal.

**Checks.**

- For A as in 2.1, `{√2 E_ij}` is a basis of `A ⊂ A ⊗ M₂(ℂ)` with `Σ b b* = 4·1`. For
  `x = a ⊗ E_kl` the sum `Σ_ij √2E_ij E_N(√2E_ji x)` returns x.
- In `N ⊗ M₂(ℂ)` with `N = N₀ ⊗ M₂(ℂ)`, let P be the projection onto
  `(e₁⊗e₁ + e₂⊗e₂)/√2` in `M₂ ⊗ M₂`. Then `E_N(P) = 1/4`, so the Pimsner–Popa constant cannot
  exceed `1/4 = [M:N]⁻¹`. The projection `1 ⊗ E₁₁` only shows that it is at most `1/2`.
- For the diagonal corner inclusion of Layer 4 with parameter t, `N′ ∩ M = ℂp ⊕ ℂ(1−p)`. The
  local index at p is 1, and `tr_(N′)(p) τ_M(p) [M:N] = (1−t) t (t⁻¹ + (1−t)⁻¹) = 1`. The sum
  formula reads `(1−t)⁻¹ + t⁻¹ = [M:N]`, and `n = 2` gives `[M:N] ≥ 4`.
- For `N ⊂ N ⊗ M₂(ℂ)`, `N′ ∩ M = M₂(ℂ)` has a maximal abelian subalgebra of dimension `n = 2`,
  and `dim(N′ ∩ M) = 4 = n² = [M:N]`. The bound `dim(N′ ∩ M) ≤ n`, which a plausible wrong
  reading of the sum formula would give, fails here.

*Needs:* 2.1; 0.5.

### 2.3 The Jones tower

Iterate the basic construction with explicit embeddings, expectations and normalised traces.
Prove the following:

- the index of each step is d;
- `τ_(k+1)(e_(k+1)) = d⁻¹` and `E_(M_k)(e_(k+1)) = d⁻¹·1`;
- the Jones projection relations `e_i e_(i±1) e_i = d⁻¹ e_i`, and `e_i e_j = e_j e_i` for
  `|i − j| ≥ 2`;
- compatibility of traces and expectations at every level.

Give the dense spans by alternating words, the finite basis expansions, the tensor-power
identifications with `L²(M_k)`, and the corner and canonical-shift isomorphisms on relative
commutants. Develop expectations and Jones projections for intermediate factors, inclusion
reversal and lattice comparisons. For an outer action of a finite group G on a II₁ factor, prove
`[M : M^G] = |G| = [M ⋊ G : M]`, compute the relative commutants and prove the duality between
the two examples (Jones–Sunder, §§3.1–3.3).

**Checks.**

- For `N ⊂ N ⊗ M₂(ℂ)`, `M₁ ≅ N ⊗ M₄(ℂ)`, `τ(e₁) = 1/4` and `E_M(e₁) = 1/4`.
- For G = ℤ/2 acting outerly, `[M : M^G] = 2` and `τ(e₁) = 1/2`. Also `M^G′ ∩ M = ℂ`, while
  `M^G′ ∩ M₁ ≅ ℂ²`.
- At index 1 every `e_k = 1`, and the tower is constant.

*Needs:* 2.1, 2.2; 0.4, 0.5.

### 2.4 Bifinite bimodules and statistical dimension

For finite factors compare the left and right von Neumann dimensions, the standard module
realisations and the commutant traces of 0.5. Define a bimodule to be bifinite
when both dimensions are finite. Construct the conjugate and the evaluation and coevaluation maps
of a bifinite correspondence. Prove the following (Longo–Roberts, §2 for the conjugate equations
and their standard solutions and §3 for the dimension and its trace, stated there for any tensor
C*-category with conjugates and applied here to the bifinite bimodule category; Kosaki, §6, for
the sector version over properly infinite factors):

- the conjugate equations and the normalisation of standard solutions;
- the statistical dimension `d(X)` is invariant, additive under direct sums and multiplicative
  under fusion;
- the two standard traces on endomorphisms are equal;
- irreducible decomposition, finite-dimensional Hom spaces and rigidity.

This is the concrete analytic bimodule category; the abstract theory of tensor categories is not
duplicated here. The statistical dimension is not identified with either one-sided dimension for
an arbitrary bimodule.

Define the distortion ratio of an irreducible bifinite bimodule Y by
`ρ(Y) = dim_left(Y)/dim_right(Y)`, and prove the following.

- Conjugation inverts ρ.
- ρ is multiplicative along nonzero fusion constituents of irreducible bimodules.
- A bifinite bimodule is extremal exactly when its irreducible constituents have a common ratio.
- Extremality is preserved under fusion.
- In a finitely generated family of even bimodules, a positive ratio whose powers take finitely
  many values equals 1.

Layer 5 uses this to prove that finite depth forces extremality.

**Checks.**

- For `N = M^G ⊂ M` with G finite and outer, `X = L²(M)` has `d(X) = √|G|`, and both one-sided
  dimensions are `|G|` and 1.
- For the diagonal corner inclusion of Layer 4 with parameter `t ≠ 1/2`, X splits as
  `pL²(R) ⊕ (1−p)L²(R)`. The left N-dimensions are `t⁻¹` and `(1−t)⁻¹`, and the right
  R-dimensions are t and `1 − t`. So both summands have statistical dimension 1, and
  `d(X) = 2`. Their ratios `t⁻²` and `(1−t)⁻²` differ, so X is not extremal.
- The bimodule `L²(N)` has `d = 1`, and ρ = 1.

*Needs:* 2.1–2.3; Layer 1.

### 2.5 The index of a conditional expectation and the minimal index

Build the index of a faithful normal finite-index expectation E from its dual operator-valued
weight and the spatial derivative of 0.6. For factors `Ind(E) = E⁻¹(1)` is a
scalar. Prove `Ind(E_N) = [M:N]`.

For positive invertible `h ∈ N′ ∩ M` with `E_N(h) = 1`, put `E_h(x) = E_N(h^(1/2) x h^(1/2))`,
which equals `E_N(hx)`.

- `Ind(E_h) = [M:N] tr_(N′)(h⁻¹)`.
- At finite index every normal conditional expectation `E : M → N` has a unique positive
  `h ∈ N′ ∩ M` with `E_N(h) = 1` and `E(x) = E_N(hx)`. The proof locates the Radon–Nikodym
  density of the N-central functional `τ_N ∘ E` in the finite-dimensional relative commutant.
- E is faithful exactly when h is invertible, and then E has finite index.

Define the minimal index as the infimum of `Ind(E)` over faithful normal expectations. Prove that
it is attained by a unique expectation `E_0`, and that `Ind(E_0) = d(X)² ≤ [M:N]` for
`X = _N L²(M)_M` (Kosaki, Theorem 3.7). Construct `E_0` explicitly.
For the minimal central projections `z_i` of `N′ ∩ M`, put `r_i = τ_M(z_i)`,
`s_i = tr_(N′)(z_i)` and `c = Σ_i √(r_i s_i)`. Prove

`h_0 = Σ_i c⁻¹ √(s_i/r_i) z_i`,  `Ind(E_0) = [M:N] c²`,  `d(X) = √[M:N] c`,

using the finite-dimensional weighted Cauchy–Schwarz inequality and the strict convexity of
inversion. Compare `E_0` with the standard solutions of the conjugate equations. Develop the
uniqueness of the Radon–Nikodym parametrisation and the comparison of the weighted GNS spaces and
towers.

**Checks.**

- For the diagonal corner inclusion with parameter t:
  - `c = 2√(t(1−t))` and `E_N(h_0) = c⁻¹(√(t(1−t)) + √(t(1−t))) = 1`.
  - `Ind(E_0) = 4`, while `[M:N] = (t(1−t))⁻¹`, which is greater than 4 for `t ≠ 1/2`.
- At `t = 1/2`, `c = 1`, `h_0 = 1` and `E_0 = E_N`.
- For `N = R ⊗ 1 ⊂ M = R ⊗ M₂(ℂ)` and `h = diag(2/5, 8/5)`, `Ind(E_h) = 4·tr(diag(5/2, 5/8)) =
  25/4`. A plausible wrong formula `[M:N] tr(h)` gives 4.

*Needs:* 2.1–2.4; 0.6.

### 2.6 Relative entropy of finite tracial inclusions

For a unital inclusion `N ⊆ M` of finite von Neumann algebras with a faithful normal normalised
trace `τ_M`, use 0.3's trace and L² construction and 0.6's tracial
specialisation of Takesaki's theorem. Together they give the unique normal trace-preserving
conditional expectation `E_N`, with its positivity, bimodularity, projection and composition
laws. No factor hypothesis is imposed. For finite positive partitions of unity
`x₁, …, x_n ∈ M₊`, `Σ_i x_i = 1`, define

`H(M|N) = sup_(x_i) Σ_i [τ_M(η(E_N(x_i))) − τ_M(η(x_i))] ∈ [0,∞]`,

with η applied by continuous functional calculus (Pimsner–Popa, §3). Prove the following.

- Each partition value is real and nonnegative. The proof is trace Jensen for η under `E_N`, by
  spectral approximation and scalar Jensen on compressed states, or by operator Jensen; the zero
  endpoint is handled by continuity, and M need not be commutative.
- The identity inclusion has entropy 0, and each partition value is bounded by the supremum.
- H is invariant under trace-preserving *-isomorphisms of inclusions.
- H is monotone under conditioning: `N ⊆ P ⊆ M` gives `H(M|P) ≤ H(M|N)`.
- For II₁ subfactors, `0 ≤ H(M|N) ≤ log[M:N]` in `[0,∞]`. The proof uses operator monotonicity of
  log on positive invertible elements and 2.2's optimal Pimsner–Popa inequality, regularising
  non-invertible partition elements before passing to the limit.

Prove the Pimsner–Popa formula (Pimsner–Popa, Theorem 4.4) for a II₁ factor M and a subfactor N.
If `N′ ∩ M` has a diffuse part, then `H(M|N) = ∞`. If `N′ ∩ M` is atomic with minimal projections
`f_k` summing to 1, then

`H(M|N) = Σ_k τ_M(f_k) log([f_k M f_k : N f_k] / τ_M(f_k)²)`.

The formula has no finite-index hypothesis; an infinite corner index gives the value ∞. At finite
index `d = [M:N]`, prove Pimsner–Popa, Corollary 4.5: the following are equivalent.

- `H(M|N) = log d`.
- Every minimal projection f of `N′ ∩ M` has `[fMf : Nf]/τ_M(f)² = d`.
- `τ_M` and `tr_(N′)` agree on `N′ ∩ M`.
- The anti-isomorphism `x ↦ Jx*J` from `N′ ∩ M` to `M′ ∩ M₁` preserves the normalised traces.
- For one projection, equivalently for every projection, `e ∈ M` with `E_N(e) = d⁻¹·1`, one has
  `E_(N′∩M)(e) = d⁻¹·1`. Here e is a projection of M, distinct from `e_N ∈ M₁`.

Using 2.5's `h_0`, prove these conditions equivalent to `E_N = E_0`. Prove Pimsner–Popa,
Corollary 4.6: `N′ ∩ M = ℂ` implies `H(M|N) = log[M:N]` at finite index. The converse holds when
`4 < [M:N] < 8` and `[M:N] ≠ (1 + 2cos(π/n))²` for every `n ≥ 3`. No unconditional converse is
asserted.

**Checks.**

- For `N = ℂ ⊂ M = ℂ²` with trace `(t, 1−t)`, the minimal projections give the value
  `η(t) + η(1−t)`. This is a non-factor inclusion with positive entropy.
- For `N ⊂ N ⊗ M₂(ℂ)`, `N′ ∩ M = M₂(ℂ)` has two minimal projections of trace 1/2 and corner index
  1, so `H = 2·(1/2) log 4 = log 4 = log[M:N]`. The relative commutant is not ℂ, which shows that
  Corollary 4.6's converse needs its index window.
- For the diagonal corner inclusion with parameter `t ≠ 1/2`,
  `H(R|N) = 2η(t) + 2η(1−t) < log(t⁻¹ + (1−t)⁻¹)`. At `t = 1/2` both sides are `log 4`.
- The identity inclusion has `H = 0`. A partition by a projection p of trace t in `M = N` gives
  `η(t) − η(t) = 0`.

*Needs:* 2.1, 2.2, 2.5; 0.3, 0.6; Mathlib `Real.negMulLog`, `cfc`.

### Examples

- The group inclusions `M^G ⊂ M ⊂ M ⋊ G` for a finite outer action have index `|G|`. When G is
  abelian the relative commutant `M^G′ ∩ M₁` is `ℂ^|G|`.
- The diagonal corner inclusion of Layer 4 is the basic example of a reducible, non-extremal
  inclusion of finite index.

### Dependencies

Layers 0 and 1.

## Layer 3: Temperley–Lieb positivity and Jones index restriction

Everything in 3.1–3.3 is over ℂ and starts from Tau Ceti's presentation
`TauCeti.TemperleyLieb ℂ δ n`. No diagram basis, cell module or Gram determinant is used. Write
`TL_n` for this algebra, `ι` for `strandIncl` and `U_n` for the last generator on `n + 1` strands
(`n ≥ 1`).

### 3.1 The analytic adjoint

For real δ, define the analytic adjoint `†` on `TauCeti.TemperleyLieb ℂ δ n`. On
`FreeAlgebra ℂ (Fin (n − 1))`, conjugate the coefficients and reverse the words, as a ring map
into the opposite algebra. It descends through `RingQuot.lift` because conjugation fixes the
relation `e_i² = δe_i` exactly when δ is real.

- `†` is involutive and additive, reverses products, and is conjugate-linear.
- `†` fixes every generator `e δ i`, and it is the unique map with these properties.
- `†` commutes with `strandIncl`.

**Checks.**

- On zero and one strands the algebra is ℂ, and `†` is complex conjugation.
- `(i·e)† = −i·e` on two strands. A linear reflection gives `i·e`.
- For non-real δ no such map exists. Applying it to `e² = δe` on two strands gives
  `e² = conj(δ)e`, hence `(δ − conj δ)e = 0`, which contradicts `e_ne_zero_two`.

*Needs:* Tau Ceti `e_ne_zero_two`, `strandIncl` and the presentation in the Tau Ceti supplier
contract; Mathlib `FreeAlgebra`, `RingQuot.lift`, `MulOpposite`.

### 3.2 Markov uniqueness, Jones–Wenzl projections and Jones's positivity theorem

Prove the following structural facts from the three defining relations, for every δ ∈ ℂ unless a
hypothesis is stated.

- **Normal form.** Every element of `TL_(n+1)` is a sum of elements `ι(a)` and `ι(a) U_n ι(b)`
  with `a, b ∈ TL_n` (Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4, Exercise 4.1.2,
  printed p. 141). Hence `dim TL_n ≤ catalan n` (ibid., Exercise 4.1.3).
- **Uniqueness of the Markov trace.** Let `φ_n` be linear functionals on `TL_n`, with
  `φ_0(1) = 1`, each tracial, with `φ_(n+1) ∘ ι = δ φ_n` for `n ≥ 0` and
  `φ_(n+1)(ι(x) U_n) = φ_n(x)` for `n ≥ 1`. Then `φ_n = T_n` for every n. The proof is induction
  through the normal form: `φ_(n+1)(ι(a) U_n ι(b)) = φ_(n+1)(ι(ba) U_n) = φ_n(ba)`. The four
  trace lemmas of Tau Ceti show that `markovTrace q hδ` is such a family, so `T_n` does not
  depend on the choice of q.
- **Quantum integers.** Put `[0] = 0`, `[1] = 1` and `[j+1] = δ[j] − [j−1]` (ibid.,
  Exercise 4.3.3 and Lemma 4.3.4, printed pp. 146–147). For `δ = 2cos θ` with `sin θ ≠ 0`,
  `[j] = sin(jθ)/sin θ`; at `δ = 2`, `[j] = j`; for `δ > 2` every `[j]` with `j ≥ 1` is positive.
- **Jones–Wenzl projections.** If `[2], …, [k]` are nonzero, put `f_1 = 1` and
  `f_(j+1) = ι(f_j) − ([j]/[j+1]) ι(f_j) U_j ι(f_j)` for `1 ≤ j < k` (ibid., Definition 4.3.10).
  Then `f_k` is idempotent, `U_i f_k = f_k U_i = 0` for every generator, and `f_k − 1` lies in the
  two-sided ideal generated by the generators; `f_k` is the unique element with these three
  properties; for real δ, `f_k† = f_k`; and `T_k(f_k) = [k+1]` (ibid., Proposition 4.3.14 and
  Exercises 4.3.15–4.3.16, printed pp. 148–149).

For real δ define the Hermitian form `H_n(x, y) = T_n(x† y)`.

- `T_n(x†) = conj T_n(x)`, since `x ↦ conj T_n(x†)` is again a Markov family; so `H_n` is
  Hermitian.
- `H_n` is natural under strand inclusion, with factor δ.
- The trace radical `R_n = {x : T_n(xy) = 0 for all y}` is a two-sided ideal stable under `†`. It
  is distinct from the Jacobson radical.

The headline is Jones's theorem, `markovTrace_nonneg_iff`: for `δ > 0`, the value
`T_n(x† x)` is real and nonnegative for every n and x exactly when δ lies in
`jonesLoopParameters = {2cos(π/m) : m ≥ 3} ∪ [2,∞)` (ibid., Theorem 4.3.17, printed p. 150, for
necessity). The refinement `markovTrace_nonneg_iff_lt_floor` covers inadmissible δ with
`0 < δ < 2`. Write `δ = 2cos θ` with `0 < θ < π/2` and put `k = ⌊π/θ⌋`. Then `T_n` is positive
semidefinite exactly when `n < k` (ibid., Lemma 4.3.8, printed p. 147, and §4.4).

The proof route has three parts.

- **Necessity.** The quantum integers `[j] = sin(jθ)/sin θ` are positive for `j ≤ k`, and
  `[k+1] < 0`. So `f_k` exists, it is `†`-invariant, and `T_k(f_k† f_k) = T_k(f_k) = [k+1] < 0`.
  Its image at level `n ≥ k` has trace `δ^(n−k)[k+1] < 0`. The trigonometric case analysis covers
  rational `θ/π` that are not reciprocals of integers.
- **Sufficiency.** For admissible δ, 3.3 gives a *-representation `π_n` of `TL_n` with a positive
  trace `τ_n` and `τ_n ∘ π_n = T_n`, so `T_n(x† x) = τ_n(π_n(x)* π_n(x)) ≥ 0`. At `δ = 2` there is
  no division by `q − q⁻¹`: the weights are `[t+1] = t+1`.
- **Below the first bad level.** For `n < k` the same construction on paths of length at most n on
  the half-line uses only the weights `[1], …, [n+1]`, all positive, and Markov uniqueness up to
  level n identifies its trace with `T_n`.

Prove the consequences used later.

- Cauchy–Schwarz holds for `H_n`, and `{x : H_n(x,x) = 0} = R_n`.
- **Pullback criterion.** Let `ρ_n` be compatible *-homomorphisms from `TL_n(ℂ,δ)` into
  *-algebras `B_n` carrying positive tracial functionals `σ_n` with `σ_n ∘ ρ_n = δ⁻ⁿ T_n`. Then δ
  is admissible. Injectivity of `ρ_n` is not needed.

**Checks.**

- At `δ = 1/2`, `f_2 = 1 − δ⁻¹e` is a self-adjoint idempotent with `T_2(f_2) = δ² − 1 = −3/4`.
  Here `θ = arccos(1/4)` and `k = ⌊π/θ⌋ = 2`.
- At `δ = 0`, `T_n = 0` for `n > 0` and `T_0` is the identity. So the forms are trivially
  positive semidefinite while `0 ∉ jonesLoopParameters`, which is why the hypothesis `δ > 0` is
  needed.
- At negative δ, `T_1(1) = δ < 0`.
- For δ just below `√2`, `k = 3`: `T_2(f_2) = δ² − 1 > 0`, while `T_3(f_3) = [4] = δ³ − 2δ < 0`.
- At `δ = √2` (m = 4), `[4] = 0`, and the trace vanishes on `f_3` without becoming negative.
- The recursion gives `f_2 = 1 − δ⁻¹U_1` and `T_2(f_2) = δ² − δ⁻¹·δ = δ² − 1 = [3]`. A
  recursion with coefficient `[j+1]/[j]` instead gives `1 − δU_1`, which is not idempotent
  unless `δ² = 1`.

*Needs:* 3.1; 3.3 for sufficiency; Tau Ceti `markovTrace`, `markovTrace_one`,
`markovTrace_mul_comm`, `markovTrace_strandIncl`, `markovTrace_strandIncl_mul_e_last`; Mathlib
`Real.arccos`.

### 3.3 Positive path models, Jones quotients and their C*-tower

Let Γ be the half-line graph with vertices `0, 1, 2, …` when `δ ≥ 2`, and the Dynkin graph
`A_(m−1)` with vertices `0, …, m−2` when `δ = 2cos(π/m)`, `m ≥ 3`. Vertex t has weight `[t+1]`,
which is positive in both cases, and the weights satisfy `[t] + [t+2] = δ[t+1]` along Γ (with
`[m] = 0` at the end of `A_(m−1)`). Let `P_n` be the set of n-step paths on Γ from 0, and
`H_n = ℓ²(P_n)`. Define `π_n(U_i)` to be zero on paths whose vertices i−1 and i+1 differ. On
paths with both equal to s it mixes the two possible values `s ± 1` of vertex i by the
matrix `[s+1]⁻¹ v vᵀ`, where `v = (√[s], √[s+2])` and an absent vertex contributes 0. Prove the
following.

- The operators `π_n(U_i)` satisfy the three relations, so `π_n` lifts through
  `TauCeti.TemperleyLieb.lift`. Each `π_n(U_i)` is self-adjoint, so `π_n` carries `†` to the
  matrix adjoint. Extending paths by one step intertwines `π_n` with `π_(n+1) ∘ ι`.
- The functional `τ_n(X) = Σ_t [t+1] Tr(X_t)`, with `X_t` the block of paths ending at t, is a
  positive trace with `τ_n(1) = δⁿ`, and `τ_n ∘ π_n` is a Markov family. By 3.2,
  `τ_n ∘ π_n = T_n`.
- `ker π_n = R_n`: if `x ∈ R_n` then `τ_n(π_n(x) π_n(x)*) = T_n(x x†) = 0`, and `τ_n` is faithful.
  So `Q_n = TL_n / R_n` is the image of `π_n`, a *-algebra with a faithful positive trace.
- The image of `π_n` is the whole path algebra, so `Q_n ≅ ⊕_t M_(#paths(n,t))(ℂ)` with trace
  weights `[t+1] > 0`. The same matrix units appear as Penneys's tree basis (ibid., §4.4,
  (TB1)–(TB7), printed pp. 154–155, for `δ ≥ 2`; §4.5, Definition 4.5.1 and Facts 4.5.5, printed
  pp. 158–159, at `δ = 2cos(π/m)`). At `δ ≥ 2`, `Σ_t #paths(n,t)² = catalan n ≥ dim TL_n`, so
  `π_n` is injective and `R_n = 0`.
- The strand maps `Q_n → Q_(n+1)` are injective, including at levels 0 and 1.
- The normalised trace-preserving expectations `E_n : Q_(n+1) → Q_n` are given by the scaled
  last-strand closure. They satisfy the Markov formula `τ_(n+1)(ι_n(x) p_n) = δ⁻¹ τ_n(x)`, where
  `p_n = δ⁻¹ U_n`; for the normalised traces `tr_n = δ⁻ⁿ τ_n` this is `tr_(n+1)(ι_n(x) p_n) =
  δ⁻² tr_n(x)`, the form in which 2.3 and 7.2 state it.

Prove the reusable lemma: a finite-dimensional unital complex *-algebra with a faithful positive
trace is a C*-algebra under the operator norm of left multiplication on its trace Hilbert space.
For every admissible δ, apply it to `Q_n`, and prove the following.

- The strand maps are isometric unital *-homomorphisms, and the expectations are unital
  completely positive.
- The C*-inductive limit `B_δ` (CStarAlgebras C5) carries a faithful normalised trace τ. Its
  faithfulness follows from the norm convergence of the stage expectations.
- The GNS representation on `L²(B_δ, τ)` is faithful. Its weak closure carries the normal
  extension of τ and the extended expectations (0.1, 0.3).

**Checks.**

- At `δ = 1` (m = 3), Γ = `A_2` has vertices 0 and 1, there is one n-step path from 0 for each
  n, and `Q_n = ℂ` for every n; `f_2 = 1 − e` spans `R_2`.
- At `δ = √2` (m = 4), `dim Q_2 = 2` and `dim Q_3 = 4`, by paths on `A_3` with endpoints in
  `{0, 2}` and `{1}`. By comparison `dim TL_3 = 5`.
- At `δ = 2`, the two 2-step paths from 0 end at 0 and 2, so `τ_2(1) = 1·1 + 3·1 = 4 = δ²`. With
  unit weights instead of `[t+1]` the value would be 2, and already `τ_1(1) = 1 ≠ δ`.
- At `δ = 1`, `TL_2 = ℂ ⊕ ℂ` is semisimple, but `f_2` is a nonzero idempotent in the trace
  radical. So the trace radical is not the Jacobson radical.
- The Markov formula at `n = 1`, `x = 1`: `τ_2(p_1) = δ⁻¹ T_2(U_1) = δ⁻¹·δ = 1 = δ⁻¹ τ_1(1)`, since
  `τ_1(1) = δ`. The factor `δ⁻²` belongs to the normalised traces only: `tr_2(p_1) = δ⁻² =
  δ⁻² tr_1(1)`. At `n = 2`, `x = U_1`: `τ_3(ι(U_1) p_2) = δ⁻¹ T_2(U_1) = 1 = δ⁻¹ τ_2(U_1)`.

*Needs:* 3.1 and the normal form, Markov uniqueness and quantum integers of 3.2; Tau Ceti
`lift`, `lift_e`, `hom_ext`; CStarAlgebras C5; 0.1, 0.3.

### 3.4 The Temperley–Lieb action in the Jones tower

For every finite-index inclusion construct compatible unital algebra maps
`ρ_n : TL_n(ℂ,δ) → M_(n−1)` by `U_i ↦ δ e_i`, `i = 1, …, n−1`, through
`TauCeti.TemperleyLieb.lift`. The native `e δ i` maps to δ times the Jones projection `e_(i+1)`.
Prove the following.

- `ρ_n` commutes with `†` and the tower adjoint, and with the strand inclusions.
- `τ ∘ ρ_n = δ⁻ⁿ T_n`. The proof uses the value on 1, strand inclusion, the Markov relation of
  2.3 and the uniqueness of the Markov trace (3.2), applied to the family `δⁿ τ ∘ ρ_n`.

No extremality or irreducibility is needed.

**Checks.**

- For `N ⊂ N ⊗ M₂(ℂ)` (δ = 2), `ρ_2(U_1) = 2e_1` has trace `2·1/4 = 1/2 = δ⁻² T_2(e)`, since
  `T_2(e) = δ`.
- At index 1, `ρ_n(U_i) = U_i ↦ 1`. This is a representation of `TL_n(ℂ,1)` killing `f_2 = 1 − e`.
- The image of `ρ_n` is generally not injective. At δ = 1 it is one-dimensional.

*Needs:* 2.3, 3.1, 3.2; Tau Ceti `lift`, `lift_e`, `hom_ext`, `strandIncl_e`.

### 3.5 Index restriction and the kernel of the action

Prove Jones's index restriction

```
[M:N] ∈ {4cos²(π/m) : m ≥ 3} ∪ [4,∞]
```

for every II₁ subfactor, from the pullback criterion of 3.2 applied to 3.4 (Jones–Sunder,
Theorem 2.3.8 for the restriction clause). Infinite index lies in the extended interval, and only
the finite case uses δ and the action. The restriction does not depend on realisation. At finite
index prove the following.

- The kernel of `ρ_n` is exactly the trace radical `R_n`, using faithfulness of the receiving
  trace. Hence `Q_n` acts faithfully. Faithfulness of the unquotiented algebra at a root-of-unity
  parameter is never asserted.
- Index below 4 forces irreducibility, by the relative-commutant bounds of 2.2.

**Checks.**

- The admissible values below 4 are `1, 2, (3+√5)/2, 3, …` for `m = 3, 4, 5, 6`, and they
  accumulate only at 4.
- An index of 1/2 or 2.5 is excluded: neither is of the form `4cos²(π/m)`, since 2.5 lies
  strictly between the values for `m = 4` and `m = 5`.
- `δ² ∈ [4,∞)` exactly when `δ ≥ 2`. This matches the two clauses of `jonesLoopParameters`
  under `d = δ²`.

*Needs:* 2.2, 3.2, 3.4.

### Examples

- `ℂ ⊂ M₂(ℂ)` with its normalised trace satisfies the finite-dimensional tower formulas at
  δ = 2. `R ⊂ R ⊗ M₂(ℂ)` is the II₁ version.
- The quotient tower at `δ = (1+√5)/2` follows paths on `A_4`.

### Dependencies

Layer 2; Tau Ceti `lift`, `strandIncl`, `markovTrace` and its trace lemmas; Mathlib
`FreeAlgebra`, `RingQuot`;
CStarAlgebras C5; Layer 0 (0.1, 0.3).

## Layer 4: Commuting squares and realisation of every index

### 4.1 Finite-dimensional towers and commuting squares

For finite-dimensional C*-inclusions with connected Bratteli graph, build inclusion matrices,
Markov traces, basic constructions and weighted path-algebra towers. Prove the Perron–Frobenius
dimension equations, the positivity and uniqueness of the normalised Markov weights, and that the
index is the squared graph norm (Jones–Sunder, §§5.1–5.3). Consider a finite-dimensional square

```
A_0 ⊆ A_1
 ∩     ∩
B_0 ⊆ B_1
```

with one faithful normalised trace that is Markov for all four inclusions. For each unital
subalgebra C of `B_1`, let `E_C` be its trace-preserving expectation. The square commutes when
`E_(A_1) ∘ E_(B_0) = E_(A_0)`. Prove that each of the following is equivalent to commuting:

- `E_(B_0) ∘ E_(A_1) = E_(A_0)`;
- `E_(B_0)|_(A_1) = E_(A_0)|_(A_1)`;
- the two expectations commute and `A_1 ∩ B_0 = A_0`.

Give the L² projection identities and transport along trace-preserving isomorphisms of squares.
The square is symmetric when `span(B_0 A_1) = B_1`. For a commuting symmetric square, prove the
following.

- The square propagates through basic constructions, and it keeps commuting with the expectation
  onto each smallest corner.
- The two horizontal Markov parameters are equal, and so are the two vertical ones.
- The spanning condition is equivalent to Jones–Sunder, 5.3.4(b) and 5.3.6, when all four
  inclusions are connected.

**Checks.**

- Take the tensor-leg square `B_1 = M₂⊗M₂⊗M₂`, `A_1 = M₂⊗M₂⊗1`, `B_0 = M₂⊗1⊗M₂` and `A_0 = ℂ1`
  with the product trace. Then `A_1 ∩ B_0 = M₂⊗1⊗1` and `E_(A_1)E_(B_0) = E_(M₂⊗1⊗1)`. It is
  spanning, Markov and connected, but not commuting over `A_0`. Its horizontal parameters are
  1/16 and 1/4, which differ.
- The trivial square `A_0 = A_1 = B_0 = B_1` commutes and is symmetric, with all parameters 1.
- A commuting square that is not symmetric shows that the relative-commutant comparison of 4.2
  fails without symmetry.

*Needs:* Layer 2.

### 4.2 Ocneanu compactness

Build the horizontal towers `(A_j)` and `(B_j)` and the grid `A_j^r`, with `A_j^0 = A_j` and
`A_j^1 = B_j`, and the vertical basic constructions `A_j^(r+1) = ⟨A_j^r, f_(j,r)⟩` for `r ≥ 1`.
Prove that every grid square is commuting, symmetric and Markov.

Assume connected horizontal and vertical inclusions and a common horizontal graph norm greater
than 1. Prove the following.

- The path tails are ergodic and the matrix sizes are unbounded.
- `R_r = (⋃_j A_j^r)″` is the hyperfinite II₁ factor. A horizontal norm of 1 gives finite matrix
  limits, which are handled separately as tensor products with R.
- The index of `R_0 ⊆ R_1` is the squared norm of the vertical inclusion matrix.

Prove Ocneanu compactness with exact column indices (Jones–Sunder, §5.7):
`R_0′ ∩ R_1 = A_1′ ∩ B_0`, and `R_0′ ∩ R_r = (A_1^0)′ ∩ A_0^r` for `r ≥ 1`. Then supply:

- the finite-stage calculation, L² convergence of the expectations and the passage to weak
  limits;
- `R_(r+1) = ⟨R_r, f_r⟩`, and only then the identification of 2.3's `M_(r−1)` with `R_r` for
  `N = R_0`, `M = R_1`.

**Checks.**

- For the square built from 4.3's Temperley–Lieb ranges at `δ = √2`, `R_0′ ∩ R_1 = ℂ`, and the
  index is 2.
- At horizontal norm 1 the limit algebras are finite-dimensional, and the hypothesis norm > 1 is
  necessary.
- The non-symmetric commuting square of 4.1 gives `R_0′ ∩ R_1` different from `A_1′ ∩ B_0`.

*Needs:* 4.1; Layer 2; 0.7.

### 4.3 Realisation of every allowed index

For `m > 3`, use 3.3's quotient tower at `δ = 2cos(π/m)`.
Construct the trace-preserving first-strand shift `U_i ↦ U_(i+1)`, the weak closure `N_δ` of its image and the full closure
`M_δ`, and prove that both are hyperfinite II₁ factors. Start the two-row square at `n₀ = m − 1`,
after the path diagram has reached every allowed parity vertex, with
`A_j = Alg{e₂, …, e_(n₀+j)}` and `B_j = Alg{e₁, …, e_(n₀+j)}`. Prove the following.

- This range has the stabilised `A_(m−1)` inclusion graph, and the restricted trace is Markov.
- The initial square and all propagated squares are commuting, symmetric and connected.
- The weak limits are `N_δ ⊆ M_δ`, with index δ².

The small initial levels need not carry Markov weights and are not used. Realise `4cos²(π/m)` in
R for every `m ≥ 3`; m = 3 is the identity inclusion.

For each real `d ≥ 4`, choose `t ∈ (0, 1/2]` with `d = t⁻¹ + (1−t)⁻¹`, a projection `p ∈ R` of
trace t, and an isomorphism `θ : pRp → (1−p)R(1−p)` (0.7). Show that
`N = {x + θ(x) : x ∈ pRp}` is a unital II₁ subfactor of index d, by the local-index formula. It
may be reducible. For `t ≠ 1/2`:

- `N′ ∩ R = ℂp ⊕ ℂ(1−p)`, and both corner inclusions are identities;
- by 2.6, `H(R|N) = 2η(t) + 2η(1−t) < log d`.

At `d = 4`, `H(R|N) = log 4`. Realise infinite index by `R ⊗ 1 ⊂ R ⊗̄ R`, using
`L²(R ⊗̄ R) = L²(R) ⊗ L²(R)`. Conclude that every allowed extended index occurs, without claiming
an irreducible model for every value.

**Checks.**

- At `d = 9/2` the corner parameter is `t = 1/3`, with `3 + 3/2 = 9/2`.
- At `d = 4`, `t = 1/2`. The inclusion is then `{x + θ(x)} ⊂ R`, which is isomorphic to
  `N ⊂ N ⊗ M₂(ℂ)` with relative commutant `M₂(ℂ)`.
- At `m = 5` the realised index is `(3+√5)/2 ≈ 2.618`, and the shifted square has the `A_4`
  graph.

*Needs:* 2.2, 2.6, 3.3, 4.1, 4.2; 0.7.

### Examples

- `R^G ⊂ R` for an outer action of a finite group G gives index `|G|`, and its commuting square
  is built from `ℂ ⊂ ℂG`.

### Dependencies

Layers 0, 2 and 3.

## Layer 5: The standard invariant and principal graphs

### 5.1 The standard invariant and extremality

Construct the finite-index grid of relative commutants with both towers, traces, conditional
expectations, Jones projections, canonical shifts and commuting squares. Define its
trace-preserving isomorphisms, which preserve every structure map, and prove functoriality under
isomorphisms of inclusions. Identify its entries with intertwiner spaces between alternating
fusion powers of `X = _N L²(M)_M` and `X̄`. These identifications respect composition, adjoints,
fusion, expectations and both canonical traces.

Define extremality as the equality of the two canonical normalised traces on `N′ ∩ M`. Prove the
following.

- Extremality does not depend on the representation.
- Irreducibility implies extremality.
- `E_N` is minimal exactly when the inclusion is extremal, exactly when `d(X)² = [M:N]`, and
  exactly when `H(M|N) = log[M:N]` (by 2.6).

**Checks.**

- The diagonal corner inclusion with `t ≠ 1/2` has `tr_(N′)(p) = 1 − t` and `τ_M(p) = t`. So it
  is not extremal although its index is finite.
- `N ⊂ N ⊗ M₂(ℂ)` is reducible and extremal, with relative commutant `M₂(ℂ)` and equal traces.
- The identity inclusion has standard invariant `P_(n,±) = ℂ` for all n.

*Needs:* Layer 2.

### 5.2 Depth and principal graphs

Define finite depth by finiteness of the set of irreducible bimodules generated by X. Prove its
equivalence with two other conditions: no new principal-graph vertices after some depth, and the
relative-commutant tower becoming a basic construction from some stage on. Finite depth is
distinct from 7.4's graph stability. Prove that finite depth forces extremality, by 2.4's ratio
argument; this does not follow from finite index alone.

Construct the rooted principal and dual principal bipartite multigraphs from fusion with X. Their
vertices are irreducible bimodules of the appropriate parity, and their edges are fusion
multiplicities. Develop the following:

- path counts, depth of first occurrence and truncations;
- adjacency on `ℓ²` of the vertices;
- positive dimension vectors normalised at the root;
- block sizes of relative commutants as path counts.

Prove `‖Γ‖ ≤ d(X) ≤ δ`, with equality throughout at finite depth. Call the graph amenable in the
extremal case when its norm is δ. Neither graph determines the other or the invariant.

**Checks.**

- For `R^(ℤ/2) ⊂ R` the principal graph is `A_3`, with norm `√2 = δ`.
- For `R^(ℤ/3) ⊂ R` it is `D_4`, with norm `√3 = δ`.
- The Temperley–Lieb subfactor at `δ = 2cos(π/m)` has principal graph `A_(m−1)`, with norm
  `2cos(π/m)`.
- The diagonal corner inclusion with `t ≠ 1/2` has finite index but is not extremal. Since
  finite depth forces extremality, it has infinite depth.

*Needs:* 2.4, 5.1.

### Examples

- For `M^G ⊂ M` the principal graph is the induction–restriction graph between ℂ and the
  irreducible representations of G.

### Dependencies

Layer 2; Layer 4 for the examples.

## Layer 6: Shaded and rigid planar algebras

### 6.1 The shaded planar operad and planar algebras

Define shaded tangles by the following data, modulo isotopy preserving it:

- oriented boundary circles with distinguished intervals;
- checkerboard shading;
- nonintersecting strings.

Develop a combinatorial encoding with gluing, units, reflection, rotation and the operadic
associativity and equivariance laws. Prove that the isotopy classes and the encoding are in
bijection, compatibly with composition, reflection and distinguished intervals. Define a complex
planar algebra by linear tangle operations on both shaded box families (Jones, *Planar
algebras I*, §§1–3). Construct morphisms, kernels, subalgebras, ideals, quotients, direct sums and
tensor products.

Build the multiplication, inclusion, left and right closure, expectation, trace, Jones projection
and rotation tangles. Prove that these elementary tangles and explicit local relations present
the whole shaded operad, and give normal forms. The relations are:

- associativity and unit of multiplication, and the exchange of inclusion with multiplication;
- the two cup–cap cancellations and the nested-expectation laws;
- rotation and its action on the boundary order;
- disjoint-disc exchange and reflection compatibility.

A subfactor planar algebra is connected, finite-dimensional at each level, positive and
spherical, with common circle value δ. Derive its finite C*-box algebras and Markov tower.
Construct the universal Temperley–Lieb box action, compare its closure trace, and apply 3.2's
pullback criterion directly. Build the Temperley–Lieb and finite-group planar algebras as tangle
algebras.

**Checks.**

- In the Temperley–Lieb planar algebra at generic δ, `dim P_(n,+) = catalan n`, `P_(0,±) = ℂ`,
  and a closed circle evaluates to δ.
- In the Temperley–Lieb planar algebra, the one-click rotation sends the identity 2-box to the
  cup–cap 2-box of the opposite shading, and the cup–cap 2-box to the identity. The two-click
  rotation is the identity on 2-boxes, while on 3-boxes it has order 3.
- A graph planar algebra (7.1) has zero-box space larger than ℂ, so it is not connected.

*Needs:* Layer 3.

### 6.2 Rigid C*-planar algebras

Define the rigid shaded operad by the same boundary data, with internal discs restricted to
scaling and translation during isotopy. Use Burns's convention: the distinguished interval is on
the left, and positive shading means the region next to it is white. A rigid C*-planar algebra is
an action of this operad (Burns, Definitions 2.2.6–2.2.7) with:

- a conjugate-linear reflection and connected zero-box spaces;
- finite-dimensional boxes, and the identity action of the radial annulus;
- a common positive circle value `δ_rig`, and positive definite closures.

Construct the rescaling to equal circle values.

Write `Φ_k` for the closure of Burns, Definition 2.2.7, and `Φ′_k` for that of Definition 2.2.9.
Normalise `φ_k = δ_rig^(−k) Φ_k` and `φ′_k = δ_rig^(−k) Φ′_k`. Write `P_k^(0) = P_(k,+)` and
`P_k^(1) = P_(k,−)`. Construct the left-string embeddings `γ⁺ : P_(k,+) → P_(k+1,−)` and
`γ⁻ : P_(k,−) → P_(k+1,+)`. Let `V_(j,k)^(r)` be the image of `P_(k−j)^(r+j)` in `P_k^(r)` (Burns,
Notation 2.2.13), and construct the positive invertible element `w_(j,k)` in the
`φ_k`-centraliser with `φ′_k(x) = φ_k(w_(j,k) x)` there. Put `w_k = w_(k−1,k)` and
`z_k = w_(0,k)`.

Construct the action of the annular tangle `TJ_k^(r)` defined in Burns, Definition 2.2.9 (printed
p. 34), as an algebra anti-isomorphism `𝒥_k^(r) : P_k^(r) → P_k^(r+k)`. Prove its state-exchange
and adjoint laws (Remarks 2.2.10). Define `Δ_k^(r) = 𝒥_k^(r+k) ∘ 𝒥_k^(r)` (Definition 2.2.15),
prove it positive definite on `L²(P_k^(r), φ_k)`, and define its real powers. Script 𝒥 is a tangle
map, distinct from the modular conjugation J.

With `w = w_(0,1)` and `w̃ = (𝒥_1^(1))⁻¹(w⁻¹) ∈ P_(1,−)`, prove Lemma 2.2.14:

`w_(2r+1) = (γ⁻γ⁺)^r(w)` for `r ≥ 0`, `w_(2r) = (γ⁻γ⁺)^(r−1) γ⁻(w̃)` for `r ≥ 1`, and
`z_k = w₁ w₂ ⋯ w_k`.

Prove Corollary 2.2.18: `Δ_k^(0)^t x̂ = (w_(j,k)^(−t/2) x w_(j,k)^(t/2))^` for `x ∈ V_(j,k)^(0)`.
Prove `Δ_k^(0) = I` exactly when `z_k ∈ Z(P_(k,+))`, and the negative-shading analogue; centralisers
of states and centres of algebras are distinct. Construct the modular extension of Burns §2.2.3:
rotating an internal input of colour `(r,k)` by angle θ corrects it by `Δ_k^(r)^(−θ/(2π))`.

**Checks.**

- For `N = R ⊗ 1 ⊂ M = R ⊗ M₂(ℂ)`, `w = diag(4, 1/4)` and `h = diag(2/5, 8/5)`:
  - the unprimed state has density h;
  - the dual state has density `diag(8/5, 2/5)`;
  - their ratio is w, and `Δ_1^(0)` sends `E₁₂` to `E₁₂/4`.
- In the Hilbert–Schmidt model of the second box, `z₂ = L_w R_(w⁻¹)` has eigenvalues
  `1, 16, 1/16, 1` on `E₁₁, E₁₂, E₂₁, E₂₂`. So `z₁` and `z₂` are not central, and Δ ≠ I.
- If `φ_k` is tracial then `Δ = I` (Burns, Corollary 2.2.19), and every `w_(j,k) = 1`.

*Needs:* 6.1; Layer 2.

### 6.3 From rigid to spherical and back

Prove Burns, Theorem 2.2.36: sphericalise a rigid planar algebra by inserting `w^(−Θ/(4π))` on
each oriented string. Prove the following.

- The induced involution and all operation comparisons hold.
- The two closure states are equal, and the result is tracial and spherical.
- `δ_sph = λ δ_rig`, where `λ = φ_1(w^(1/2))`.

Conversely (Burns, Theorem 2.2.40 and Remarks 2.2.41), take a positive invertible `w ∈ P_(1,+)`
in spherical data. Rescale it so that `tr_sph(w^(1/2)) = tr_sph(w^(−1/2)) = a`, and prove `a ≥ 1`
by Cauchy–Schwarz, with equality exactly when `w = 1`. Insert `w^(Θ/(4π))` and restrict to the
rigid operad. Prove the following.

- The first weight is w.
- Both rigid circle values are `a δ_sph`. Burns's proof computes `λ⁻¹ δ_sph` with `λ⁻¹ = a`,
  while the printed conclusion of Theorem 2.2.40 reads `λδ_sph`; the proof's value is used.
- The two constructions are inverse on weighted data.

Reflection reverses both the string parameter and the planar orientation, so it preserves Θ.

**Checks.**

- For `w = diag(4, 1/4)` and `δ_sph = 2`, `tr(w^(1/2)) = tr(w^(−1/2)) = 5/4 = a`. The rigid value
  is `a δ_sph = 5/2`, while the printed `λδ_sph` would give `8/5`.
- `w = 1` gives `a = 1` and `δ_rig = δ_sph`, and the round trip is the identity.
- A full positive turn has Θ = 2π. Inserting `w^(−1/2)` on a closed loop turns `Φ` into
  `Tr(w^(−1/2)·)`.

*Needs:* 6.2.

### 6.4 Planar algebras of subfactors

For an extremal finite-index inclusion, construct the spherical action on 5.1's relative
commutants. Verify every generating tangle, isotopy and positivity law, and prove that
sphericality holds exactly when the inclusion is extremal (Jones, *Planar algebras I*,
Theorem 4.2.1).

For a faithful normal finite-index expectation `E : M → N`, construct the rigid action with
common value `√Ind(E)` on its weighted GNS and Jones tower (Burns, §2.2.2), and fix the following.

- The closure is pinned by `φ_1(x) = τ_N(E(x))` for `x ∈ N′ ∩ M`.
- Higher closures are iterated expectations.
- Both rotation conventions are compared through their modular operators.
- Sphericalising the trace-expectation data gives the value `d(X)`.

In the spherical reconstruction with `h = a⁻¹ w^(−1/2)`, verify `φ_1(x) = tr_sph(hx)` and
`φ′_1(x) = φ_1(wx)`, and identify the index `Ind(E_h) = a² δ_sph²` (Burns, Lemma 2.2.43).

**Checks.**

- For the 6.2 example, `E_N(h) = tr(h) = 1`, `Ind(E_h) = 25/4 = a²δ_sph²`, and `[M:N] = 4`.
- For the trace-preserving expectation of an extremal inclusion, `w = 1` and the rigid action is
  the spherical one.
- By 2.6, `H(M|N) = log 4` for the trace inclusion of the 6.2 example, independently of h.

*Needs:* 5.1, 6.1–6.3; 2.5.

### Examples

- Temperley–Lieb, finite-group and diagonal-corner planar algebras, the last as rigid data with
  `w ≠ 1`.

### Dependencies

Layers 2, 3 and 5.

## Layer 7: Graph planar algebras, embeddings and presentations

### 7.1 Graph planar algebras

For a finite connected bipartite graph Γ with positive Perron–Frobenius weights μ, construct its
graph planar algebra from based even loops and weighted state sums (Jones–Penneys, §3). Fix the
local weights: an oriented edge from a region labelled v to a region labelled w has extremum
weight `√(μ(w)/μ(v))`, and reversal gives the reciprocal. Prove the following.

- The finite box spaces have bases and matrix-block formulas.
- Tangle composition, reflection and the positive trace hold.
- The algebra does not depend on the scaling of the weights.

Its zero-box spaces are the functions on the vertices of each parity.

**Checks.**

- For `A_3` with `μ = (1, √2, 1)`, the weight from an end vertex to the middle is
  `√(√2/1) = 2^(1/4)`, and the reverse is `2^(−1/4)`. The weights `(1, 2, 1)`, which would give
  `√2`, are not an eigenvector of `A_3`. At the end vertex the loop value `Σ_w μ(w)/μ(v) = √2` is
  the graph norm δ, as the Perron–Frobenius equation requires.
- Rescaling μ by 3 leaves every weight `√(μ(w)/μ(v))` unchanged.
- The zero-box space of `GPA(A_3)` has dimension 2 on the even vertices, which is not 1.

*Needs:* Layer 6.

### 7.2 Right planar modules and their towers

Fix a spherical subfactor planar algebra P with value `δ > 0`. Define the shaded right
planar-module operad (Coles–Huston–Penneys–Srinivas, §3):

- the output disc's marked interval is replaced by a left wall with an unshaded adjacent region;
- full-disc inputs carry P boxes, and semidisc inputs on the wall with `2k` endpoints carry
  module boxes `M_k`;
- the action is multilinear, `(⊗_i M_(k_i)) ⊗ (⊗_j P_(ℓ_j,±_j)) → M_(k_0)`, with typed plugging,
  identities, reflection and input permutations.

A right planar module has finite-dimensional spaces, a conjugate-linear dagger and this action.
The multiplication tangles make each `M_k` a finite-dimensional C*-algebra. The closures
`Tr_k : M_k → M_0` are positive, faithful and tracial. Connectedness means `dim M_0 = 1`; then put
`tr_k = δ^(−k) Tr_k`.

Construct the Markov tower `M_0 ⊂ M_1 ⊂ ⋯` with projections `e_n ∈ M_(n+1)`. Here `e_n`
implements `E_n : M_n → M_(n−1)`; 2.3's tower labels this projection `e_(n+1)`. Prove the
following.

- `e_n x e_n = E_n(x) e_n`, `E_(n+1)(e_n) = δ⁻²` and `M_(n+1) e_n = M_n e_n`.
- `tr_(n+1)(x e_n) = δ⁻² tr_n(x)`.
- `M_(n+1)` splits into the old ideal `M_n e_n M_n` and new simple summands `Y_(n+1)`.

Define the pointed principal graph and the dimensions `μ(v) = δ^k tr_k(p)`, and prove
`δμ(v) = Σ_(w∼v) μ(w)`. Define finite depth and depth by this tower. The regular module
`M_k = P_(k,+)` defines P's principal graph independently of Layer 8. For finite-depth P, the
module tower has depth at most that of P (Coles–Huston–Penneys–Srinivas, Lemma 3.12).

**Checks.**

- For the regular module of the Temperley–Lieb planar algebra at `δ = √2`, the new summands give
  the graph `A_3`, with `μ = (1, √2, 1)` and `δ·μ(middle) = 2 = 1 + 1`.
- With `M_0 = ℂ²` the module is not connected, and the normalisation `tr_k` is undefined.
- The index shift: the module projection `e_1` corresponds to 2.3's `e_2`. Both have normalised
  trace `δ⁻²`.

*Needs:* 6.1.

### 7.3 Embedding theorems

Prove that every finite-depth subfactor planar algebra embeds as a planar *-subalgebra of the
graph planar algebra of its principal graph (Jones–Penneys, Theorem 4.1, with the strongly
Markov inclusions of §2 and the isomorphism of Theorem 3.33). For a finite-depth P
and a connected right planar P-module, construct a planar *-algebra embedding `P → GPA(Γ_M)`
(Coles–Huston–Penneys–Srinivas, Theorem 5.1 and Corollary 5.2), as follows.

- Γ_M is finite and connected. Its positive δ-eigenvector, normalised to 1 at the root, is a
  Perron–Frobenius vector, so `‖Γ_M‖ = δ`.
- Define a strongly Markov finite-dimensional inclusion of value δ: multiplication by `δ⁻²`
  normalises the canonical basic-construction trace, and there is a finite Pimsner–Popa basis with
  `Σ_i b_i b_i* = δ²·1`.
- Choose a sufficiently large even shift so that the adjacent inclusion is strongly Markov.
  Identify its relative-commutant planar algebra with `GPA(Γ_M)` through path matrix units.
- The module action with added strings gives the injective, tangle-compatible map.

The equivalence between these modules and abstract pivotal module C*-categories belongs to
CategoricalOperatorAlgebras, and is not used here.

**Checks.**

- `ℂ ⊂ M₂(ℂ)` with the normalised trace is strongly Markov at δ = 2, with basis `√2 E_ij` and
  `Σ b b* = 4·1`.
- The Temperley–Lieb planar algebra at `δ = √2` embeds in `GPA(A_3)`, and `e_1` maps to a loop
  function supported on paths through the middle vertex.
- The infinite-depth Temperley–Lieb planar algebra at `δ > 2` has no finite principal graph. The
  finite-depth hypothesis is used.

*Needs:* 7.1, 7.2; 2.2.

### 7.4 Presentations, jellyfish relations and graph stability

Develop trains, caps, rotational eigenvectors and jellyfish relations. For a finite generating
set satisfying the jellyfish relations, prove the following (Bigelow–Penneys, §3):

- the trains span every box space;
- the closed diagrams lie in the span of the empty diagram;
- these relations, together with a faithful positive trace, determine the generated planar
  algebra up to isomorphism.

Validity and positivity of candidate relations are hypotheses for each concrete example.

Define graph stability at depth n: the edges from depth n to depth n+1 are simple and do not
branch, and there are no mergers. Prove its equivalences with conditions on the tower and on the
spanning of trains. Prove Bigelow–Penneys, Theorem 1.2 (Popa's stability theorem): for `δ > 2`,
paired stability at n together with `Γ_±(n+1) ≠ A_(n+2)` makes both graphs finite and stable at
every `k ≥ n`. Prove Bigelow–Penneys, Theorem 1.3: if `Γ_+` is stable at depths n and n+1 and
`Γ_+(n+1) ≠ A_(n+2)`, with `δ > 2`, then both graphs are finite and pairs are stable for
`k ≥ n+1`. Give the spoke-graph and jellyfish equivalences (Theorem 1.1) with their
supertransitivity and shading hypotheses.

**Checks.**

- In the Temperley–Lieb planar algebra a closed circle evaluates to δ, and two disjoint circles
  to δ².
- The Temperley–Lieb planar algebra at `δ > 2` has principal graph `A_∞`, which is stable at
  every depth and infinite. Its truncations are `A_(n+2)`, so the A-tail exclusion in
  Theorems 1.2–1.3 is what keeps it out of their conclusion of finiteness.
- `D_4` at index 3 branches at depth 1, so it is not stable there.

*Needs:* 7.1–7.3.

### Examples

- `GPA(A_3)` and `GPA(D_4)`, with the Temperley–Lieb and `ℤ/3` planar algebras embedded.

### Dependencies

Layers 2 and 6.

## Layer 8: Analytic reconstruction and model comparisons

### 8.1 The orthogonal model

For a subfactor planar algebra P with `δ > 1`, construct the Jones–Shlyakhtenko–Walker model.
Put `F_k = ⨁_(r≥0) P_(r+k,+)`, with k through strings distinguished. For homogeneous degrees r
and s, the product is the sum of the cup-contraction tangles with `i = 0, …, min(2r, 2s)`, the
i-th term of degree `r + s − i`. Prove the unit, associativity and the conjugate-linear *-law.
Define `τ_k(x) = δ^(−k) T_k(x_0)`, and prove:

- `τ_k(1) = 1`, and positive degrees have trace 0;
- `⟨a, b⟩ = τ_k(a* ⋆ b)`, and unequal degrees are orthogonal;
- `τ_k` is faithful, positive and tracial.

Prove that left multiplication by a homogeneous element is bounded uniformly in the input degree,
by splitting it into at most `2r + 1` contraction operators. Construct the Hilbert completion and
the finite von Neumann algebras `W_k`. Analyse the cup-generated abelian algebra `C_k` through:

- the normalised iterated-cup basis;
- the Jacobi matrices with endpoint corrections;
- the bimodule decomposition into the degree-zero part and coarse summands (JSW, Theorem 4.9).

Prove factoriality and diffuseness from this decomposition.

Construct Jones projections and expectations by tangles, and prove the following
(JSW, Theorems 4.20–4.21).

- `W_0 ⊆ W_1 ⊆ ⋯` is a basic-construction tower of index δ².
- `W_0′ ∩ W_k ≅ P_(k,+)`. So for `N = W_0` and `M = W_1`, 2.3's `M_j` is `W_(j+1)`.
- The dual shading and every structure comparison hold.

At δ = 1, connected positive data is trivial and `R = R` realises it. This realises the standard
invariant, and asserts neither hyperfiniteness nor recovery of a given inclusion.

**Checks.**

- For the Temperley–Lieb planar algebra at `δ > 1`, `W_0′ ∩ W_1 ≅ P_(1,+) = ℂ` and
  `W_0′ ∩ W_2 ≅ TL_2`, of dimension 2.
- `τ_k(1) = 1`, and an element of degree 1 has trace 0.
- At δ = 1 the only connected positive data is trivial, and the index is 1.

*Needs:* Layer 6; Layer 2.

### 8.2 Graded and Fock models

Construct the Guionnet–Jones–Shlyakhtenko concatenation products `∧_k` on the same sums, with
GJS's graded † and its comparison with reflection (GJS, Definition 7). Construct JSW §5's
triangular maps X and Y, by epi Temperley–Lieb diagrams and signed nonnested epi diagrams. Prove
`XY = YX = id`, multiplicativity, *-compatibility and isometry. Transport the trace to obtain GJS's
pairing formula.

For the graph and Fock comparison, use the realised inclusion's extremality and 2.4's rigid
bimodule category, following Chen, §7. Construct the following, and verify their coherence:

- the faithful pivotal dagger action on the semisimple category of principal bimodules;
- its tensorators and unitors;
- the path-matrix realisation.

Normalise `μ(v) = d(Y_v)`. For each edge `v → w` choose orthonormal isometries
`f : Y_w → Y_v ⊗ X`, and fix the reverse basis by Frobenius reciprocity,
`f̄ = √(μ(v)/μ(w)) (f* ⊗ id_X̄)(id_(Y_v) ⊗ coev_X)`. Prove that these reverse maps are orthonormal.
This fixes the cup and cap coefficient `√(μ(w)/μ(v))`. Prove the infinite-depth embedding into the
graph planar algebra (Chen, Theorem 7.9).

Extend 7.1 to a connected locally finite graph with bounded adjacency norm and a positive
δ-eigenvector μ.

- Prove the degree bound δ² from the reciprocal edge weights. The eigenvector may be unbounded;
  adjacent ratios are controlled by δ.
- The box algebras are uniformly bounded products of finite path-endomorphism blocks, normed by
  the supremum of the block norms, and not algebraic direct sums over all vertices.
- Construct bounded loop functions, centre-valued expectations and graph-edge Hilbert modules
  over `ℓ∞(vertices)`.
- Build the relative-tensor Fock module, the creation and annihilation operators, the
  edge-reversal weights and the represented loop algebra.
- At a chosen root, use the normalised vacuum state for `k = 0`. For each k, construct the
  through-path corner and its weighted closure state, and prove that its restriction to P is
  `τ_k`.

No globally finite weight is assumed. Compare this GNS representation with the preceding models,
including independence of the fusion bases and of the root. These are comparisons after
reconstruction, not inputs to it.

**Checks.**

- The unrescaled reciprocal map has squared norm `μ(w)/μ(v)`. For `A_3` with `μ = (1, √2, 1)`
  this is `√2` from an end vertex to the middle and `1/√2` back.
- `X ∘ Y = id` on degree 0, where both maps are the identity.
- For the Temperley–Lieb planar algebra the embedding lands in the loop algebra of `A_∞` with
  `μ(n) = [n+1]` at `δ ≥ 2`.

*Needs:* 8.1; 2.4; 7.1; FreeProbability F3–F4.

### 8.3 Burns's realisation of rigid planar algebras

Prove Burns, Theorem 2.2.42: every connected positive finite-box rigid C*-planar algebra arises
from a finite-index II₁ inclusion `(N, M, E)` with a chosen faithful normal expectation. The route
is as follows.

- Sphericalise by 6.3, and apply 8.1.
- With `h = a⁻¹ w^(−1/2)` and `E_h(x) = E_N(h^(1/2) x h^(1/2))`, prove `E_N(h) = 1` and
  `Ind(E_h) = a² δ_sph²` (Burns, Lemma 2.2.43). Then transport every rigid tangle operation.

This is a realisation theorem, and asserts no uniqueness.

**Checks.**

- The 6.2 example is realised by `R ⊂ R ⊗ M₂(ℂ)` with `E_h`, and `Ind = 25/4`.
- `w = 1` gives `E = E_N`, and the inclusion of 8.1.
- `a ≥ 1` gives `Ind(E_h) ≥ δ_sph²`, with equality exactly when `w = 1`.

*Needs:* 6.3, 6.4, 8.1; 2.5.

### Examples

- For the Temperley–Lieb planar algebra at `δ > 1`, 8.1 gives an irreducible inclusion
  `W_0 ⊂ W_1` of index δ². Its relative commutants are `W_0′ ∩ W_k ≅ P_(k,+)`: this is `TL_k`
  for `δ ≥ 2`, and 3.3's quotient `Q_k` at `δ = 2cos(π/m)`.

### Dependencies

Layers 2, 6 and 7; FreeProbability F3–F4.

## Layer 9: Finite-depth hyperfinite completeness and index below 4

### 9.1 Popa's standard model

Extend 2.3's tower to a tunnel `N_(−1) = M ⊃ N_0 = N ⊃ N_1 ⊃ ⋯`. For `k ≥ i ≥ −1`, build the
anti-isomorphisms `N_k′ ∩ N_i ≅ (M_(i+1)′ ∩ M_(k+1))^op`, which carry `e_(−i)` to `e_(i+2)`. They
are trace-preserving in the extremal case. Define the standard model by
`N^st = (⋃_k N_k′ ∩ N)″ ⊂ M^st = (⋃_k N_k′ ∩ M)″` (Popa, §4.1). Construct it from the oriented
invariant by 4.2's Markov squares, and prove the following.

- The model is hyperfinite and independent of the tunnel, and its standard invariant is P.
- The tower-side inclusion `M_1′ ∩ M_∞ ⊂ M′ ∩ M_∞` is anti-isomorphic to it under extremality.
- An isomorphism of oriented invariants induces an isomorphism of standard models.
- For reducible invariants, `N^st′ ∩ M^st` recovers `N′ ∩ M` with its trace.

**Checks.**

- For the Temperley–Lieb invariant at `δ = √2`, the standard model is the realisation of 4.3, of
  index 2.
- The opposite model of an `E₆` invariant is the complex-conjugate `E₆` invariant.
- For the identity invariant the model is `R = R`.

*Needs:* Layers 2, 4, 5.

### 9.2 Strong amenability and classification

Supply the input to Popa's theorem for finite depth and hyperfinite M (Popa, §§4.1–4.5, 5.1 and
Appendix A; the published text is behind a paywall and cited by locator only).

- The two-step Perron–Frobenius chains are ergodic, and both models are extremal.
- Finite depth passes to `M ⊂ M_1`, including the expectation comparison
  `E_M(Z(N_k′ ∩ M_1)) ⊂ Z(N_k′ ∩ M)` and its dimension and basis bound.
- Two successive extremal opposite models give the tower-tail expectation identities of the
  proof of Popa 5.1.2.
- Prove the Skau lemma (Popa, 4.5.1). For `B ⊂ M′ ∩ M_∞` put `B_k = B ∩ (M_k′ ∩ M_∞)`. If
  `E_B E_(M_k′∩M_∞) = E_(B_k)` and `E_(B_k′∩M_∞)(e_(k+1)) = d⁻¹·1` for every `k ≥ 0`, then
  `B′ ∩ M_∞ = M`.
- Prove the Skau lemma by the basic-construction spans and the descent of expectation ranges
  from `M_(j+1)` to `M_j`. Verify its hypotheses for `B = M′ ∩ M_∞` from the finite-depth trace
  comparisons, giving `(M′ ∩ M_∞)′ ∩ M_∞ = M`.
- Prove Popa 4.1.2 (vi)⇒(i) from 0.8's hypertrace characterisation of amenability and the
  bicommutant condition, which gives strong amenability. Graph-norm equality or ambient
  injectivity alone does not replace these steps.

For a separable II₁ factor B, prove local quantisation as follows.

- There is a hyperfinite `R ⊆ B` with `R′ ∩ B = ℂ`, with a central variant when `Z(B)` is
  finite-dimensional.
- For factors `B ⊆ M`, a finite `Y ⊂ M` and `ε > 0`, there is a nonzero `q ∈ B` with
  `‖qyq − E_(B′∩M)(y) q‖₂ < ε‖q‖₂` for `y ∈ Y`.

Supply the finite-dimensional vector and matrix-unit version, exact common supports after
expectation-preserving partial-isometry perturbation, and the tunnel-alignment lemmas, using
0.7's L² perturbation lemmas for projections and matrix units. Develop the standard core and
tunnel representations, their hypertraces and relative Følner projections (Popa, 4.1.2, 5.1.1 and
Appendix A). From the
relative Følner condition obtain local approximation of relative commutants. Extend it, by
maximality of orthogonal supports, to global approximation along a tunnel that controls factors
and expectations simultaneously, and use separability to align a countable dense family. Define
strong amenability by the hypertrace-and-ergodic-core criterion, and prove that it is equivalent
to the generation criterion below. Prove `⋁_j (N_j′ ∩ M) = M` and `⋁_j (N_j′ ∩ N) = N`. Conclude
that every finite-depth hyperfinite inclusion of separable II₁ factors is isomorphic to its
standard model. Two such inclusions with isomorphic trace-compatible invariants are therefore
isomorphic.

**Checks.**

- Graph-norm equality alone does not give strong amenability. An infinite-depth amenable
  invariant is outside the theorem.
- `R ⊂ R ⊗ M₂(ℂ)` and the 4.3 corner inclusion at `d = 4` have the same invariant, and they are
  isomorphic, as the theorem predicts.
- The identity inclusion is handled separately: its tunnel is constant.

*Needs:* 9.1; 2.2; 0.7, 0.8.

### 9.3 Index below 4

Prove that index below 4 implies finite depth. Use 5.2's bound and the theorem that a connected,
locally finite, possibly infinite rooted graph of norm less than 2 is a finite ADE graph. Classify
the invariants below 4 by rooted ADE data with connections (Evans–Kawahigashi, Theorems
11.22–11.24). The steps are as follows.

- Prove the norm-below-2 classification.
- Exclude `D_odd` and `E_7` by flatness. The `E₈` flatness computation is constructed.
- Prove the positivity and integrality obstructions.
- Construct the A, even-D, `E₆` and `E₈` planar-algebra and commuting-square examples, and verify
  their indices and invariants.
- Root the graph at the trivial bimodule, of statistical dimension 1 and minimal
  Perron–Frobenius weight. Identify the root up to graph automorphism, together with the dual
  graph and the basepoint data.
- Build biunitary connections on the four-partite square of principal and dual graphs, the gauge
  action and the flatness equations, and reconstruct by string algebras.
- Prove the passage from a finite-depth invariant to a flat connection, unique up to gauge. Gauge
  and rooted-graph equivalences induce exactly the isomorphisms of invariants.
- Show one invariant each for `A_n` and `D_(2n)`, and two complex-conjugate classes each for `E₆`
  and `E₈`. Graph classification is distinct from the list of standard invariants, and a graph of
  the right norm does not by itself give a flat connection.

Apply 9.2 only to the finite-depth hyperfinite realisations.

**Checks.**

- `A_n` (n ≥ 2) has index `4cos²(π/(n+1))`; `A_3` gives 2.
- `D_(2n)` has index `4cos²(π/(4n−2))`; `D_4` gives 3.
- `E₆` gives `4cos²(π/12) = 2 + √3`, and `E₈` gives `4cos²(π/30)`.
- `D_5` and `E_7` have norm below 2 but carry no flat connection, so they are excluded.

*Needs:* 5.2, 9.1, 9.2; Layer 4.

### Examples

- `R^(ℤ/3) ⊂ R` with principal graph `D_4`, and the two conjugate `E₆` inclusions.

### Dependencies

Layers 0, 2, 4 and 5.

## Layer 10: Bimodules of infinite index

### 10.1 Extended cones and the bimodule planar algebra

For a II₁ factor A, with no separability assumption, and an A–A correspondence H of arbitrary
dimensions, construct the following (Penneys, §3, which assumes only that A is a II₁ factor).

- `H^n` by Layer 1 fusion.
- The central vectors `P_n = {ξ : aξ = ξa for all a ∈ A}`, and the commutant
  `Q_n = A′ ∩ (Aᵐᵒᵖ)′ ∩ B(H^n)`.
- Left and right bounded vector bases, with independence of the basis.
- The canonical semifinite commutant traces and the operator-valued weights.

Use 0.6's extended positive part `Q̂_n⁺` of `Q_n` for unbounded sums. Construct the connected
normal self-dual planar algebra of Penneys, Theorem 3.18, and its action on the extended cones
`Q̂_n⁺` (Theorem 3.28). Central L² vectors and cone elements are different carriers.

**Checks.**

- For `H = L²(A)`, `H^n = L²(A)`, `P_n = ℂ` (A is a factor) and `Q_n = ℂ`.
- For a coarse `H = L²(A) ⊗ L²(A)`, `P_1 = 0` while `Q_1` is infinite-dimensional.
- The extended cone `Q̂_0⁺` of the centre is `[0, ∞]`.

*Needs:* Layer 1; 0.6.

### 10.2 Burns rotations

H is approximately extremal when its two canonical traces on `Q_1` are comparable within fixed
positive constants, and extremal when they agree. Build the creation contractions `L_β` and
`R_β` and the compressions. Prove Penneys, Theorem 4.20: approximate extremality makes
`ρ = Σ_β L_β R_β*` converge strongly on `P_n`, and extremality makes it unitary. Prove Penneys,
Theorem 4.28, for symmetric H (a bimodule unitary `H ≅ H̄`; Penneys, Definition 3.4 and
Remark 4.21). The rotation existing on `P_(2n)` implies that `H^n` is approximately extremal, and
a unitary rotation implies that `H^n` is extremal. The sufficiency direction needs no symmetry.

**Checks.**

- For `H = L²(A)` the rotation is the identity on `P_n = ℂ`.
- For a finite-index extremal inclusion, the rotation agrees with Layer 6's planar rotation.
- Replacing `H^n` by H in Theorem 4.28's conclusion is not claimed.

*Needs:* 10.1; Layer 6.

### 10.3 Burns's type III example

Construct Burns's example (Burns, §3.4, Lemmas 3.4.5–3.4.8 and Theorem 3.4.9, printed
pp. 116–121). The representation of `F_∞` is built in three steps.

- **Repeated-word map.** Fix free generators `(a_n)_(n≥1)` and a bijection
  `{a_n} ≅ ℕ × F_∞`. The second coordinate extends to a surjective homomorphism
  `ϕ : F_∞ → F_∞` whose fibres on generators are infinite.
- **Type III input.** Let S be a type III factor on a separable `H₀`, and choose unitaries `v_n`
  generating it (Burns, Lemma 3.4.1). Let ψ be the homomorphism with `ψ(a_n) = v_n`, and put
  `w = ψ ∘ ϕ`. Then `w(F_∞)″ = S`.
- **Amplification.** Replace `(H₀, w)` by `(H₀ ⊗ ℓ²(ℕ), w ⊗ 1)`. Then `w_γ ⊗ 1 − 1` is
  Hilbert–Schmidt only when `w_γ = 1`.

Prove the fibre lemma (Burns, proof of Lemma 3.4.7). For `γ₀ ≠ e` there are infinitely many n,
none occurring as a letter of `γ₀`, with `ϕ(a_n) = ϕ(γ₀)`. The conjugates `γ_n = a_n γ₀ a_n⁻¹` are
then distinct, and `w_(γ_n) = w_(γ₀)`.

Take the tracial quasi-free state of covariance 1/2 on `CAR(H₀)` and its GNS factor R on
`H = L²(R)`. The Bogoliubov automorphisms of the `w_γ` form the action α, implemented by
unitaries `W_γ`. Prove Burns, Theorem 3.4.4: the Bogoliubov automorphism of u is inner exactly
when `u − 1` is Hilbert–Schmidt. For `N = L(F_∞) ⊂ M = R ⋊_α F_∞`, prove the following.

- M is a II₁ factor (Lemma 3.4.5).
- `M_1 = B(H) ⋊_α F_∞` with Jones projection `e₁ ⊗ 1` (Lemma 3.4.6).
- `N′ ∩ M_1 = B(H)^(F_∞) = W(F_∞)′` (Lemma 3.4.7). The proof is by Fourier coefficients and the
  fibre lemma: a coefficient `x_(γ₀) ≠ 0` would make `‖x(ξ⊗δ_e)‖²` diverge.
- This commutant has a type III factor as a central summand (Lemma 3.4.8). The one-particle
  isometry `ι(ξ) = √2 (a(ξ)*)^` intertwines w with W, and Lemma 3.4.2 gives factoriality.

Show why central L² data misses this summand. OperatorAlgebraDynamics D8 supplies the CAR Fock
space, quasi-free states and Bogoliubov functoriality, and 0.4 the normal
crossed products. The repeated-word construction, the fibre lemma, the Blattner criterion and the
coefficient argument are targets here. No reconstruction or completeness theorem for standard
invariants of infinite index is asserted.

**Checks.**

- For `γ₀ = a₁`, the words `a_n a₁ a_n⁻¹` with `n ≠ 1` in the fibre are reduced of length 3,
  pairwise distinct, and all map to `w_(a₁)`.
- `u = −1` on infinite-dimensional `H₀` gives `u − 1 = −2`, which is not Hilbert–Schmidt. So the
  parity automorphism is outer.
- `τ(a(ξ) a(ξ)*) = ‖ξ‖²/2` at covariance 1/2, so `ι` is isometric exactly with the factor `√2`.

*Needs:* 10.1; Layer 2; OperatorAlgebraDynamics D8; 0.4.

### Examples

- The infinite-index inclusion `L(F_∞) ⊂ R ⋊ F_∞`, whose relative commutant `N′ ∩ M_1` has a type
  III summand.

### Dependencies

Layers 0, 1, 2 and 6; OperatorAlgebraDynamics D8.

## Downstream consumers

- **CategoricalOperatorAlgebras** consumes:
  - Layer 1's correspondences and fusion;
  - Layer 2's bifinite bimodule category;
  - Layers 5–8's standard invariants, planar algebras, planar modules and reconstruction;
  - Layer 9's standard model.
- **FactorRigidity** consumes Layers 1–2.
- **TypeAHeckeAlgebras** consumes 2.6's relative entropy for finite von Neumann algebras.

## References

- Pimsner–Popa, *Entropy and index for subfactors*, Ann. Sci. ÉNS 19 (1986), 57–106,
  doi:10.24033/asens.1504. Used for: formulas 0.13–0.14 and Theorem 2.2 (2.2), §3 (2.6),
  Theorem 4.4 and Corollaries 4.5–4.6 (2.6).
- Jones, *Index for subfactors*, Invent. Math. 72 (1983), 1–25, doi:10.1007/BF01389127. Used
  for: §2.2, the local-index and sum formulas (2.2). Behind a paywall; cited by locator.
- Jones–Sunder, *Introduction to Subfactors*, LMS Lecture Note Series 234, 1997,
  doi:10.1017/CBO9780511566219. Used for: §§3.1–3.3 (2.1, 2.3), Theorem 2.3.8 (3.5), and
  §§5.1–5.7 (4.1–4.2), including 5.3.4(b) and 5.3.6. Behind a paywall; cited by locator.
- Anantharaman–Popa, *An Introduction to II₁ Factors*, author's draft,
  https://www.math.ucla.edu/~popa/Books/IIun.pdf. Used for:
  - Theorems 2.1.3, 2.5.5 and 2.6.1, Corollary 2.5.9 and Proposition 2.5.12 (0.1);
  - Definitions 1.3.3 and 1.3.14, Proposition 4.1.3, Theorems 6.3.5, 7.1.1 and 9.1.2 (0.3);
  - Theorem 1.3.6, Proposition 1.3.9, Propositions 5.1.2 and 5.1.4, §5.2 and
    Proposition 5.2.3 (0.4);
  - Lemma 8.2.1, Proposition 8.2.3, Definition 8.5.4 and equation (8.6), Propositions 8.5.5,
    8.6.1 and 8.6.2, Definition 9.4.9, Remark 9.4.10 and Exercises 9.13–9.15 (0.5);
  - §1.6, Definition 11.1.2, Lemmas 11.1.14–11.1.16, Lemma 11.2.1, Theorem 11.2.2,
    Remark 11.2.3 and Examples 15.4.3 (0.7);
  - Definition 10.2.1, §10.2.2, Propositions 10.1.3, 10.2.2 and 10.2.5, Theorems 10.2.4,
    10.2.9 and 10.3.1 (0.8);
  - Chapter 13 (1.2), Chapter 9 (2.1–2.2) and Exercises 9.16–9.17 (2.2).
- Kosaki, *Type III factors and index theory*, lecture notes, Seoul 1993,
  https://pages.uoregon.edu/njp/lec-f.pdf. Used for: §2.1 and Example 2.1, Tomita's theorem
  and the KMS condition (0.2); §2.1, Definition 2.2 and the discrete-group crossed product,
  printed pp. 6–7 (0.4); Appendix A §1, the Radon–Nikodym cocycle (0.2); §3.1 with
  Remark 3.3 and the construction of `E⁻¹`, and Appendix A §§2–4, the extended positive part,
  Takesaki's theorem and Haagerup's operator-valued weights (0.6); §3.3 and Theorem 3.7, the
  minimal expectation (2.5); §6, the statistical dimension of a sector (2.4); Theorem 3.8, the
  Pimsner–Popa inequality (2.2).
- Longo–Roberts, *A theory of dimension*, K-Theory 11 (1997), 103–159, arXiv:funct-an/9604008.
  Used for: §2, conjugates and the conjugate equations, and §3, dimension and trace (2.4).
- Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4,
  https://people.math.osu.edu/penneys.2/UQSL/PartI/UQSLPartIChapter4.pdf. Used for:
  Exercises 4.1.2–4.1.3, printed p. 141, the normal form and the dimension bound (3.2–3.3);
  Exercise 4.2.6, printed p. 146, the Markov property (3.2); Exercise 4.3.3 and Lemma 4.3.4,
  printed pp. 146–147, the quantum integers (3.2); Definition 4.3.10, Proposition 4.3.14 and
  Exercises 4.3.15–4.3.16, printed pp. 148–149, the Jones–Wenzl projections (3.2); Lemma 4.3.8
  and Theorem 4.3.17, printed pp. 147 and 150 (3.2); §4.4, (TB1)–(TB7), printed pp. 154–155,
  the tree bases and semisimplicity (3.3); §4.5, Definition 4.5.1 and Facts 4.5.5, printed
  pp. 158–159, the root-of-unity quotient (3.3).
- Jones, *Planar algebras I*, arXiv:math/9909027, §§1–4 and Theorems 4.2.1 and 4.3.1 (6.1, 6.4).
- Jones–Shlyakhtenko–Walker, *An orthogonal approach to the subfactor of a planar algebra*,
  arXiv:0807.4146. Used for: Theorem 4.9 and Theorems 4.20–4.21 (8.1), and §5 (8.2).
- Guionnet–Jones–Shlyakhtenko, *Random matrices, free probability, planar algebras and
  subfactors*, arXiv:0712.2904, Definition 7 and Theorem 8 (8.2).
- Popa, *Classification of amenable subfactors of type II*, Acta Math. 172 (1994), 163–255,
  doi:10.1007/BF02392646. Used for: Appendix A, the L² perturbation lemmas (0.7); §§4.1–4.5,
  5.1 and Appendix A (9.1–9.2). Behind a paywall; cited by locator.
- Burns, *Subfactors, Planar Algebras and Rotations*, arXiv:1111.1362. Used for:
  - §2.1.2 and Definition 2.1.15 (1.2);
  - Definitions 2.2.6–2.2.7 and 2.2.9 (printed pp. 33–34), Remarks 2.2.10, Notation 2.2.13,
    Lemma 2.2.14, Definition 2.2.15, Corollaries 2.2.18–2.2.19 and §2.2.3 (6.2);
  - Theorem 2.2.36, Theorem 2.2.40 and Remarks 2.2.41 (6.3);
  - Lemma 2.2.43 (6.4, 8.3) and Theorem 2.2.42 (8.3);
  - §3.4, Lemmas 3.4.1–3.4.8 and Theorems 3.4.4 and 3.4.9, printed pp. 116–121 (10.3).
- Penneys, *A planar calculus for infinite index subfactors*, arXiv:1110.3504. Used for:
  Definition 3.4, Theorems 3.18 and 3.28 (10.1), and Remark 4.21 with Theorems 4.20 and 4.28
  (10.2).
- Jones–Penneys, *The embedding theorem for finite depth subfactor planar algebras*,
  arXiv:1007.3173. Used for: §2, the strongly Markov inclusions; §3 and Theorem 3.33 (7.1);
  Theorem 4.1 (7.3).
- Coles–Huston–Penneys–Srinivas, *The module embedding theorem via towers of algebras*,
  arXiv:1810.07049. Used for: §3, Lemma 3.12, Theorem 5.1 and Corollary 5.2 (7.2–7.3).
- Chen, *Standard λ-lattices, rigid C*-tensor categories, and (bi)modules*, Doc. Math.,
  doi:10.4171/DM/944, §7 and Theorem 7.9 (8.2). In the preprint arXiv:2009.09273v2 the
  embedding into the graph planar algebra is Corollary 6.2.2 in §6.2.
- Bigelow–Penneys, *Principal graph stability and the jellyfish algorithm*, arXiv:1208.1564,
  Theorems 1.1–1.3 and §3 (7.4).
- Evans–Kawahigashi, *Quantum Symmetries on Operator Algebras*, Oxford, 1998,
  doi:10.1093/oso/9780198511755.001.0001. Used for: Chapter 11, Theorems 11.22–11.24 (9.3).
  Behind a paywall; cited by locator.
