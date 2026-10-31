# Roadmap: von Neumann algebras: operator foundations and measurable fields

**Summary.** Build the foundations of von Neumann algebra theory on Mathlib's
`VonNeumannAlgebra` and `WStarAlgebra`: states and the faithful Gelfand–Naimark representation on
top of the native GNS construction (V0); the weak, strong, ultraweak and ultrastrong operator
topologies, their continuous functionals, the bicommutant theorem and Kaplansky density (V1);
membership of calculus values and polar factors, the projection lattice, Murray–von Neumann
comparison with its Schröder–Bernstein law, central supports and corners, the completed Hilbert
tensor product and the spatial tensor product, and the comparison `L∞(σ(a),μ) ≅ W*(a)` with the
abstract classification of abelian algebras on separable spaces (V2); types of projections, type I
factors, finite-dimensional algebras, inclusion matrices and traces (V3); the trace-class predual,
Sakai's theorem, the positive spanning of the predual, the normality criterion and normal
representations (V4); and measurable fields of separable Hilbert spaces with their direct integrals
and decomposable operators (V4.0.Fields). The end theorems are the bicommutant theorem, Kaplansky
density, the Gelfand–Naimark representation, projection Schröder–Bernstein, the `L∞` comparison,
the predual theorem and Sakai's theorem, the normality criterion, cyclic-iff-separating, and the
decomposable-operator theorem. The measurable-field construction uses given measures and fields,
not spectral representation or central disintegration.

## Scope and ownership

This roadmap owns, by section: the state and GNS additions and the faithful direct-sum
representation (V0); the strong-star, ultraweak and ultrastrong wrappers, the continuous-functional
and closed-convex-set theorems, the bicommutant theorem, generated algebras and Kaplansky density
(V1); the membership adapters for calculus values and polar factors, Vigier's theorem, the
projection lattice, Murray–von Neumann comparison, central supports, corners, the completed Hilbert
tensor product, the spatial tensor product with its slice maps and the `B(K)` commutation theorem,
`L∞` as a maximal abelian algebra, the single generator, the `L∞` comparison and the abelian
classification (V2); types of projections, type I factors, matrix units, finite-dimensional algebras,
inclusion matrices and traces on `B(H)` and on group rings (V3); the trace-class duality
specialisation, the predual of an ultraweakly closed subspace, Sakai's theorem, the predual's
separability, normality, the positive spanning of the predual, the normality criterion and normal
representations (V4.Core, V4.PositivePredual, V4.Normality); and measurable fields of separable
Hilbert spaces, their direct integrals, decomposable operators and change of measure (V4.0.Fields).

It leaves to other roadmaps, and consumes from them by section: the bounded polar decomposition
(OperatorTheory/PolarDecomposition, Part B); the Borel functional calculus and spectral projection-valued
measures of a normal operator (OperatorTheory/SelfAdjointSpectralTheory SA-B05–SA-B13, SA-B30, SA-B46,
SA-B49, SA-B53, SA-B84); trace-class and Hilbert–Schmidt operators (OperatorTheory/OperatorIdeals
OI-B29–OI-B41); orthogonal series, invariant and reducing subspaces (OperatorTheory/OrthogonalGeometry);
annihilators, quotients and weak topologies (BanachSpaceTheory B1), the Krein–Šmulian theorem
(BanachSpaceTheory B2) and the Schmidt expansion of compact operators with the nuclear/trace-class
identification (BanachSpaceTheory B4); and the finite-dimensional double-centralizer theorem
(RepresentationTheory/SemisimpleAlgebras Layer 3). Already in Mathlib, hence never built here: the
C*-algebra classes and continuous functional calculus, the GNS construction, the norm-at-one identity
and Cauchy–Schwarz inequality for positive functionals, the unitary spanning of a C*-algebra, the weak
and pointwise operator topologies on `H →L[ℂ] H`, the Loewner order, and the inner product on the
algebraic tensor product of Hilbert spaces (named in the supplier contracts below).

Spectral representation of normal operators on direct integrals, the central decomposition of a von
Neumann algebra, factors of types II and III, traces and dimension functions, group von Neumann
algebras, modular theory and the classification programme are not built here: they belong to the
Part II roadmap of this one, which consumes V0–V4 and V4.0.Fields by section together with
SelfAdjointSpectralTheory SA-B85–SA-B86. The one variant kept here that overlaps a supplier in
subject is the `L∞` comparison of V2.5: it identifies `W*(a)` with `L∞` of a scalar measure for a
single normal operator and uses neither SelfAdjointSpectralTheory's cyclic multiplication models
SA-B85 nor its essentially bounded symbols SA-B86, which are built for representations of `C(K)` and
consume V4.0.Fields; the direction of supply is therefore SA-B05–SA-B53 → V2 and V4.0.Fields → SA-B85.

## Conventions

- `H`, `K`, `L` are complete complex inner product spaces (`[NormedAddCommGroup H]
  [InnerProductSpace ℂ H] [CompleteSpace H]`), of any cardinality, including `H = 0`, unless a
  theorem states separability. `B(H)` is `H →L[ℂ] H`. The inner product is conjugate-linear in its
  first variable, Mathlib's convention.
- A concrete von Neumann algebra is Mathlib's `VonNeumannAlgebra H`: a unital star subalgebra of
  `B(H)` equal to its double commutant, with unit the identity of `H`. The zero algebra on `H = 0` is
  included. `M'` is `VonNeumannAlgebra.commutant`. A corner `pMp` acts on the complete range `pH` with
  `p` as its unit. An abstract W*-algebra is Mathlib's `WStarAlgebra`: a C*-algebra `M` with a Banach
  space `X` and a conjugate-linear isometric isomorphism `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M`.
- A representation is a unital complex star-algebra homomorphism; normality is an additional
  property, never part of the word. The vector functional of `ξ` is `ω_ξ(x) = ⟪ξ, xξ⟫`, and
  functionals are translated by `(aφb)(x) = φ(bxa)`.
- A state is a positive functional of norm one. On a zero algebra there is no state, since the zero
  functional has norm zero.
- Projections are `IsStarProjection`. Murray–von Neumann equivalence is oriented from the initial
  to the final projection: `p ∼ q` when some `v ∈ M` has `v*v = p` and `vv* = q`; subequivalence
  `p ≼ q` permits `vv* ≤ q` in the Loewner order of `B(H)`.
- A factor has nonzero identity and scalar centre: `M ∩ M' = ℂ·1` with `1 ≠ 0`. The zero algebra is
  not a factor.
- `W*(S)` is the von Neumann algebra generated by a set `S ⊆ B(H)`: the double commutant of
  `S ∪ S*`, which is `StarSubalgebra.centralizer ℂ (StarSubalgebra.centralizer ℂ S)` since Mathlib's
  `StarSubalgebra.centralizer ℂ s` is the centralizer of `s ∪ star s`.
- `H ⊗̂ K` is the completed Hilbert tensor product and `M ⊗̄ N` the spatial tensor product of
  algebras; `conj(H)` is the conjugate Hilbert space.
- `S₁(H)` and `S₂(H)` are the trace-class and Hilbert–Schmidt operators of OperatorIdeals, with
  trace norm `‖·‖₁`; `M_*` is the space of ultraweakly continuous functionals on `M`.

## Exact supplier contracts

### From Mathlib

- `CStarAlgebra`, `NonUnitalCStarAlgebra`, `StarSubalgebra`, `StarSubalgebra.centralizer`,
  `StarSubalgebra.coe_centralizer_centralizer`, `Set.centralizer` and
  `Set.centralizer_centralizer_centralizer`: the C*-classes and the centralizer vocabulary.
  `StarSubalgebra.cstarAlgebra` gives a closed star subalgebra of a C*-algebra its C*-structure and
  needs an `IsClosed` instance; V1.3 supplies norm closedness of a von Neumann algebra.
- `VonNeumannAlgebra` (a `StarSubalgebra ℂ (H →L[ℂ] H)` with `centralizer_centralizer'`),
  `VonNeumannAlgebra.commutant`, and `WStarAlgebra` with its field `exists_predual`
  (`StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M`, conjugate-linear).
- `IsStarProjection`; the Loewner order `ContinuousLinearMap.instLoewnerPartialOrder` with
  `ContinuousLinearMap.le_def`.
- The weak operator topology `ContinuousLinearMapWOT` (`H →WOT[ℂ] H`) with
  `ContinuousLinearMapWOT.ofCLM`, `ContinuousLinearMap.WOTofCLM` and
  `ContinuousLinearMapWOT.instLocallyConvexSpace`; the strong operator topology
  `PointwiseConvergenceCLM` (`H →Lₚₜ[ℂ] H`) with `ContinuousLinearMap.toPointwiseConvergenceCLM`,
  its `LocallyConvexSpace` instance built from `UniformConvergenceCLM.locallyConvexSpace`, and the
  theorem (not instance) `UniformConvergenceCLM.continuousSMul` on finite sets;
  `geometric_hahn_banach_closed_point` for separation.
- `PositiveLinearMap.GNS`, `PositiveLinearMap.gnsStarAlgHom`,
  `PositiveLinearMap.gnsNonUnitalStarAlgHom`; the Cauchy–Schwarz inequality
  `PositiveLinearMap.cauchy_schwarz_star_mul` (`‖f(x*y)‖ ≤ √‖f(x*x)‖ √‖f(y*y)‖`); the bounded positive
  functional carrier `A →P[ℂ] ℂ` with `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`
  (`‖f‖ = f 1` on a unital C*-algebra) and `PositiveContinuousLinearMap.norm_map_sq_le_opNorm_mul`
  (`‖f x‖² ≤ ‖f‖ ‖f(x*x)‖`); `CStarAlgebra.increasingApproximateUnit`; the continuous functional
  calculus `cfc` and `cfcₙ` with positivity, square roots, positive and negative parts, spectral
  permanence and the automatic contractivity of star homomorphisms; `CStarAlgebra.span_unitary`.
- `TensorProduct ℂ H K` with its inner product (`Mathlib.Analysis.InnerProductSpace.TensorProduct`:
  positive definite, `‖x ⊗ₜ y‖ = ‖x‖‖y‖`), `TensorProduct.mapL`, `TensorProduct.commIsometry`,
  `TensorProduct.assocIsometry`; `UniformSpace.Completion`; `lp` for Hilbert direct sums
  (`lp (fun _ : ℕ => H) 2` is `ℓ²(ℕ, H)`); `MeasureTheory.Lp`.
- `LinearMap.dualEmbedding_surjective` and `LinearMap.rightDualEquiv` at `topDualPairing ℂ B`,
  `WeakDual ℂ B = WeakBilin (topDualPairing ℂ B)`, the `RCLike` instance of `SeparatingDual` and
  `SeparatingDual.eq_zero_of_forall_dual_eq_zero`: the identification of the continuous dual of a
  weak-star space with evaluations, used in V4.Core.

### From OperatorTheory

- PolarDecomposition, Part B (PD-B22–PD-B29): the bounded polar decomposition `T = v|T|` with its
  partial isometry, initial space `(ker T)⊥` and final space the closure of the range.
- SelfAdjointSpectralTheory SA-B05–SA-B13 (the Borel calculus `f ↦ f(a)` of a normal `a`, its
  agreement with the continuous calculus, multiplicativity, star, commutation, the vector norm bound and
  almost-everywhere invariance), SA-B30 (the spectral projection-valued measure `P_a`), SA-B46
  (indicator recovery `1_B(a) = P_a(B)`), SA-B49 (the null filter: `P_a(B) = 0` iff every diagonal
  measure vanishes on `B`), SA-B53 (bounded sequential convergence) and SA-B84 (scalar-measure
  uniqueness on continuous tests). SA-B85–SA-B86 are not consumed; they consume V4.0.Fields.
- OperatorIdeals OI-B29–OI-B31 (the nuclear gauge and the trace-class family), OI-B32–OI-B41 (the
  Hilbert–Schmidt energy, its basis independence, norm, domination `‖T‖ ≤ ‖T‖_HS`, adjoint invariance
  and ideal inequality).
- OrthogonalGeometry: orthogonal series, invariant and reducing subspaces, coordinate isometries.

### From BanachSpaceTheory

- B1: annihilators and preannihilators, the double-annihilator theorem, `(E/F)* ≅ Fᗮ` and
  `F* ≅ E*/Fᗮ` for a closed subspace `F`, with restriction and quotient maps.
- B2: the Krein–Šmulian theorem, including the linear-subspace criterion using the unit ball.
- B4: the compact Schmidt series `Tx = Σ s_j ⟪e_j, x⟫ f_j`, the zero-based comparison
  `s_n = a_n(T)` with OperatorIdeals' approximation numbers, the isometric identification of the
  nuclear norm with the trace-class gauge on Hilbert pairs, and the rank-one norm `‖u ⊗ v*‖₁ = ‖u‖‖v‖`.

### From RepresentationTheory/SemisimpleAlgebras

- Layer 3: the double-centralizer theorem for a simple faithful module finite over its endomorphism
  ring, and its corollary for finite-dimensional algebras.

## How to read the build

V0 adds to Mathlib's GNS construction what V1–V4 use of states. V1 builds the four operator
topologies and proves the bicommutant theorem and Kaplansky density, the two tools every later layer
uses. V2 is the elementary algebra of a von Neumann algebra: which operators it contains, its
projections and corners, tensor products, and the abelian case, ending with the `L∞` comparison and
the classification of abelian algebras. V3 classifies type I factors and finite-dimensional algebras
with their inclusions. V4 builds the predual and normality in three stages (V4.Core, then
V4.PositivePredual, then V4.Normality) and ends with V4.0.Fields, the measurable-field construction,
which depends only on V1–V2 and on scalar measure theory. Each layer ends with its examples and the
dependencies it draws on.

## V0. C*-algebra and state prerequisites

### V0.1 Positive functionals and states

Consume Mathlib's complex `CStarAlgebra`, star-algebra homomorphism, order and continuous
functional calculus APIs: positivity, uniqueness of positive square roots, positive and negative
parts, spectral permanence, automatic contractivity and isometry of injective star homomorphisms,
approximate units, the Cauchy–Schwarz inequality `PositiveLinearMap.cauchy_schwarz_star_mul`, and the
norm-at-one identity `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one` with its consequence
`PositiveContinuousLinearMap.norm_map_sq_le_opNorm_mul`.

Define a state on a unital C*-algebra `A` as a bounded positive functional `f : A →P[ℂ] ℂ` of norm
one. Prove that convex combinations of states are states, that the restriction of a state to a
unital star subalgebra and the pullback of a state along a unital star homomorphism are states, and
that `f(1) = 1` characterises states among positive functionals (by the norm-at-one identity). The
zero algebra has no state with this convention, and the zero functional is positive but not a state.

- Convex combinations: for states `f, g` and `0 ≤ t ≤ 1`, `t f + (1−t) g` is a state.
- Restriction: a state of `A` restricted to a unital star subalgebra `B` is a state of `B`.
- Pullback: for a unital star homomorphism `π : B → A` and a state `f` of `A`, `f ∘ π` is a state.
- Norm-at-one: a positive functional `f` is a state iff `f(1) = 1`.

**Checks.**
- On `A = ℂ` the only state is the identity; the functional `z ↦ 2z` is positive with norm two and
  is not a state, which a definition omitting the norm condition would accept.
- On `A = ℂ²` the states are exactly `(z, w) ↦ tz + (1−t)w` with `0 ≤ t ≤ 1`; the functional
  `(z, w) ↦ z − w` has norm one but is not positive, which a definition omitting positivity would
  accept.
- On the zero algebra the only functional is `0`, of norm `0`: there is no state; a definition
  requiring `f(1) = 1` agrees, since `1 = 0` there.
- Cauchy–Schwarz on `M₂(ℂ)` with `f = ω_{e₁}` (`f(x) = x₁₁`) and `x = e₁₁ + e₁₂`: `|f(x)|² = 1`,
  `‖f‖ = 1`, `f(x*x) = f(e₁₁ + e₁₂ + e₂₁ + e₂₂) = 1`, so the bound `1 ≤ 1` is attained.

*Needs:* Mathlib `A →P[ℂ] ℂ`, `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`,
`PositiveLinearMap.cauchy_schwarz_star_mul`.

### V0.2 GNS additions and the faithful representation

Use `PositiveLinearMap.GNS` and `PositiveLinearMap.gnsStarAlgHom` for the completed GNS construction
of a positive functional `f` on a unital C*-algebra `A` (Peterson, Theorem 4.1.6, p. 57; Houdayer,
Theorem 1.27, p. 6). Add the canonical cyclic vector `ξ_f` (the class of `1`), the recovery
`f(a) = ⟪ξ_f, π_f(a) ξ_f⟫`, cyclicity of `ξ_f`, the uniqueness up to a unique unitary of a cyclic
representation with a prescribed vector functional (Peterson, Theorem 4.1.6, p. 57), transport of
the GNS data along unitaries, and restriction to unital star subalgebras. Prove state separation:
for `a ∈ A` and `λ ∈ σ(a)` there is a state `f` with `f(a) = λ`, and for `a ≥ 0` nonzero a state
with `f(a) = ‖a‖` (Peterson, Propositions 4.1.4–4.1.5, p. 56). Construct the faithful direct-sum
representation on `lp (fun f : states => f.GNS) 2` and prove it injective: this is the
Gelfand–Naimark theorem, that every unital C*-algebra has a faithful representation on a complete
complex Hilbert space (Peterson, Corollary 4.1.7, p. 58; Houdayer, Corollary 1.28, p. 6), stated as
`exists_faithful_representation`. For the zero algebra the Hilbert space is `0`.

- The GNS vector `ξ_f` is cyclic for `π_f` and `‖ξ_f‖² = f(1)`.
- If `(π, K, η)` is a cyclic representation with `⟪η, π(a)η⟫ = f(a)` for all `a`, there is a unique
  unitary `u : f.GNS → K` with `u ξ_f = η` and `u π_f(a) = π(a) u`.
- A unitary `u : K → K'` transports `(π, K, η)` to `(uπ(·)u*, K', uη)` with the same vector functional.
- The direct sum of the GNS representations of all states is injective on `A`.

**Checks.**
- `A = ℂ`, `f = id`: `f.GNS = ℂ`, `π_f = id`, `ξ_f = 1`.
- `A = M₂(ℂ)`, `f(x) = x₁₁`: the null space `{x : f(x*x) = 0}` is the matrices with zero first
  column, `f.GNS ≅ ℂ²` and `π_f` is the defining representation; with `f = tr/2` instead,
  `f.GNS = M₂(ℂ)` with the Hilbert–Schmidt inner product, of dimension four. A construction that
  forgot to quotient by the null space would give dimension four in both cases.
- `A = C([0,1])`, `f = ∫ dx`: `f.GNS = L²[0,1]` and `π_f` is multiplication, with `ξ_f = 1`.
- Separation on `A = ℂ²`, `a = (1, 0)`: the state `(z, w) ↦ z` gives `f(a) = 1 = ‖a‖`; the
  direct sum over all states is injective since `a ≠ 0` is detected by this state.

*Needs:* Mathlib `PositiveLinearMap.GNS`, `PositiveLinearMap.gnsStarAlgHom`, `lp`; V0.1.

### Examples

The state space of `ℂⁿ` is the simplex; the GNS space of `x ↦ x₁₁` on `M_n(ℂ)` is `ℂⁿ` with the
defining representation; the GNS space of integration on `C(X)` for a compact `X` and a Borel
probability measure `μ` is `L²(X, μ)` with multiplication.

### Dependencies

Mathlib only: the C*-algebra classes, the continuous functional calculus, the positive-functional
carrier with its norm-at-one identity and Cauchy–Schwarz inequality, and the GNS construction.

## V1. Operator topologies and the bicommutant theorem

### V1.1 The four operator topologies

Use `ContinuousLinearMapWOT` (`H →WOT[ℂ] H`) for the weak operator topology and
`PointwiseConvergenceCLM` (`H →Lₚₜ[ℂ] H`) for the strong operator topology (Houdayer, §2.1, p. 7;
Peterson, §2.4, p. 25; Jones, §3.1, p. 11). Build compatible strong-star, ultraweak and ultrastrong
wrappers: the strong-star topology is generated by the seminorms `x ↦ ‖xξ‖ + ‖x*ξ‖`; the ultraweak
and ultrastrong topologies are the pullbacks of the weak and strong topologies of `B(ℓ²(ℕ, H))`
along the amplification `x ↦ x ⊗ 1` (Houdayer, Definition 2.6, p. 8; Peterson, §2.4, p. 26). Prove
for each topology the neighbourhood and net criteria, the Hausdorff locally convex structure, the
continuity of `x ↦ ⟪η, xξ⟫`, the separate continuity of products, the weak and ultraweak continuity
of `x ↦ x*`, and the joint strong continuity of products on norm-bounded sets (Jones, Exercise
3.4.1, p. 19; Peterson, Exercises 2.4.6–2.4.7, p. 27). Prove that weak and ultraweak, and strong and
ultrastrong, coincide on norm-bounded sets (Houdayer, Exercise 2.7, p. 8; Peterson, Corollary 2.4.5,
p. 27; Jones, Exercise 3.3.12, p. 18), and exhibit their difference on all of `B(H)` for
infinite-dimensional `H` (Jones, Corollary 5.1.4, p. 32): the functional `φ(x) = Σ_n n⁻² ⟪e_n, xe_n⟫`
for an orthonormal sequence `(e_n)` is ultraweakly continuous and not weakly continuous. For
separable infinite-dimensional `H`, direct the finite-dimensional subspaces `F` by inclusion, choose
a unit vector `η_F ⊥ F` and put `T_F = φ(P_{η_F})⁻¹ P_{η_F}` with `P_η` the projection onto `ℂη`:
`φ` is faithful and positive, `T_F → 0` strongly, and `φ(T_F) = 1`, so the net does not converge
ultrastrongly. Prove that none of the four topologies is metrizable on `B(H)` when `H` is
infinite-dimensional, using the family `e_m + m e_n` (`m ≠ n`) of operators built from the rank-one
projections `e_n` onto an orthonormal sequence: `0` is in its ultrastrong closure but no sequence from
it converges weakly to `0` (Jones, EP9, pp. 22–23). For separable `H` prove that all four are
metrizable on the norm unit ball and that `B(H)` is separable for each of them, while the operator
norm topology of `B(H)` is nonseparable when `H` is infinite-dimensional (Jones, EP9, p. 23).

**Checks.**
- Backward shift `S*` on `ℓ²(ℕ)`: `‖(S*)ⁿξ‖² = Σ_{k ≥ n} |ξ_k|² → 0`, so `(S*)ⁿ → 0` strongly with
  `‖(S*)ⁿ‖ = 1`; the forward powers `Sⁿ` satisfy `‖Sⁿξ‖ = ‖ξ‖`, so they do not converge strongly to
  `0`, although `⟪η, Sⁿξ⟫ → 0`, so they converge weakly to `0`.
- The rank-one family `T_n e₀ = n^(−1/2) Σ_{k=1}^n e_k`, vanishing on the other basis vectors, has
  `‖T_n e₀‖ = 1` and `⟪η, T_n ξ⟫ = ⟪ξ, e₀⟫ n^(−1/2) Σ_{k ≤ n} ⟪η, e_k⟫ → 0`, so it converges weakly
  but not strongly to `0`.
- `φ(x) = Σ n⁻² ⟪e_n, xe_n⟫` on the projection `p` onto the orthogonal complement of finitely many
  vectors `ν_i`: a weakly continuous functional `Σ_{i ≤ k} ⟪ν_i, · η_i⟫` vanishes on such a `p`,
  while `φ(p) > 0` since `pe_n ≠ 0` for some `n`; so `φ` is not weakly continuous.
- `e_m + m e_n` with `m ≠ n`: for an ultrastrong neighbourhood of `0` given by `ε` and `(ξ_i)` with
  `Σ ‖ξ_i‖² < ∞`, choose `m` with `Σ_i |⟪e_m, ξ_i⟫|² < ε²/4` and then `n` with
  `Σ_i |⟪e_n, ξ_i⟫|² < ε²/(4m²)`; the seminorm of `e_m + m e_n` is below `ε`. A weakly convergent
  sequence is norm bounded, which forces one `m` to recur, and `⟪e_m, (e_m + m e_n) e_m⟫ = 1`.
- `H = ℂ²`: all four topologies coincide with the norm topology, and `B(H) = M₂(ℂ)` is metrizable
  and separable in each; `H = 0`: `B(H)` is a point.

*Needs:* Mathlib `ContinuousLinearMapWOT`, `PointwiseConvergenceCLM`, `lp`;
`ContinuousLinearMapWOT.instLocallyConvexSpace`, the `LocallyConvexSpace` instance of
`H →Lₚₜ[ℂ] H` and `UniformConvergenceCLM.continuousSMul`.

### V1.2 Continuous functionals and closed convex sets

Characterise the weakly continuous linear functionals on a weakly closed subspace `V ⊆ B(H)` as the
finite sums `x ↦ Σ_{i ≤ n} ⟪η_i, xξ_i⟫` of matrix coefficients, and prove they are exactly the
strongly continuous ones (Houdayer, Proposition 2.3, p. 7; Peterson, Lemma 2.4.1, p. 25; Jones,
Theorem 5.1.1, p. 31). Characterise the ultraweakly continuous functionals on an ultraweakly closed
subspace as the absolutely convergent pairings `x ↦ Σ_n ⟪η_n, xξ_n⟫` with `Σ‖ξ_n‖² < ∞` and
`Σ‖η_n‖² < ∞`, equal to the ultrastrongly continuous ones and to those strongly continuous on the
unit ball (Houdayer, Proposition 2.8, pp. 8–9; Jones, Exercise 5.1.2, p. 31). Prove that the weak
and strong closures of a convex set coincide, and the ultraweak and ultrastrong closures (Houdayer,
Theorem 2.2, p. 7; Peterson, Corollary 2.4.2, p. 26; Jones, Corollary 5.1.3, p. 32), by locally
convex separation: `geometric_hahn_banach_closed_point` in `H →Lₚₜ[ℂ] H` needs the
`LocallyConvexSpace` instance and real scalar continuity from `UniformConvergenceCLM.continuousSMul`
through `IsScalarTower.continuousSMul`; in `H →WOT[ℂ] H` the instance suffices; the ultraweak and
ultrastrong cases use the wrappers' own locally convex structure. State the hypotheses on
subspaces explicitly: a subspace is weakly closed iff strongly closed iff its intersection with the
unit ball is. Prove that the unit ball of `B(H)` is weakly compact (Houdayer, Theorem 2.4, pp. 7–8;
Peterson, Corollary 2.4.4, p. 27).

**Checks.**
- Forward shift `S` on `ℓ²(ℕ)`: `0` lies in the weak closure of `{Sⁿ : n ≥ 1}` but not in its strong
  closure (`‖Sⁿξ‖ = ‖ξ‖`), so the set, which is not convex, separates the two closures; its convex
  hull contains `(1/N) Σ_{n ≤ N} Sⁿ` with `‖(1/N) Σ_{n ≤ N} Sⁿ e₀‖² = 1/N → 0`, so `0` lies in both
  closures of the hull.
- The functional `x ↦ ⟪e₁, xe₀⟫` is given by one matrix coefficient; `φ = Σ n⁻² ⟪e_n, · e_n⟫` is an
  `ℓ²`-pairing with `ξ_n = η_n = n⁻¹ e_n` and is not a finite sum (V1.1).
- `H = 0`: the unit ball is a point, compact; every functional is `0`.

*Needs:* V1.1; Mathlib `geometric_hahn_banach_closed_point`,
`ContinuousLinearMapWOT.instLocallyConvexSpace`, `UniformConvergenceCLM.continuousSMul`,
`IsScalarTower.continuousSMul`.

### V1.3 The bicommutant theorem and generated algebras

Prove von Neumann's bicommutant theorem: for a unital star subalgebra `A` of `B(H)`, the weak,
strong, ultraweak and ultrastrong closures of `A` all equal `A''`, so `A = A''` iff `A` is closed in
any of the four topologies (Houdayer, Theorem 3.1, p. 12; Peterson, Theorem 2.5.6, p. 29; Jones,
Theorem 3.2.2 and Corollary 3.2.3, p. 12). The weak form is `bicommutant_eq_iff_isClosed_wot`.
Consume the finite-dimensional double-centralizer theorem of RepresentationTheory/SemisimpleAlgebras
Layer 3 and prove its operator-space specialisation (Jones, Theorem 3.2.1, p. 12), then the general
case by the simultaneous-vector amplification: for `x ∈ A''` and `ξ₁, …, ξ_n ∈ H`, the projection
onto the closure of `A(ξ₁ ⊕ ⋯ ⊕ ξ_n)` in `Hⁿ` lies in the commutant of the diagonal copy of `A`, so
`x ⊕ ⋯ ⊕ x` preserves that closure (Peterson, Lemma 2.5.5, pp. 28–29). Give each `VonNeumannAlgebra H`
its canonical complete normed star algebra and `CStarAlgebra` instances on the subtype through
`StarSubalgebra.cstarAlgebra`, supplying the `IsClosed` instance from weak closedness, compatible
with `toStarSubalgebra`. Define `W*(S)` for a set `S ⊆ B(H)` as the double commutant of `S ∪ S*`
(Jones, Example 3.3.4, p. 13) and prove leastness, monotonicity, intersections, closure
(`W*(W*(S)) = W*(S)`), commutant reversal (`S ⊆ T ⇒ T' ⊆ S'`) and the lattice operations
`M ∧ N = M ∩ N`, `M ∨ N = W*(M ∪ N)`, with `(M ∨ N)' = M' ∩ N'`. Prove that a unital star
subalgebra is a von Neumann algebra iff its norm unit ball is weakly compact (Jones, Corollary
5.2.2, p. 33). For a nonunital star subalgebra `A`, separate the common annihilator
`W = ⋂_{a ∈ A} ker a` and prove that on `K = W⊥` the strong closure of `A|_K` is a von Neumann
algebra with unit `1_K`, equal to the bicommutant of `A|_K` in `B(K)` (Jones, EP6, pp. 20–21), so
that the correct supported algebra on `H` is this one and not `A''` computed in `B(H)`, which
contains `1_H`.

- `W*(S)` is the least von Neumann algebra containing `S`; `S ⊆ W*(S)`; `W*` is monotone; the
  intersection of von Neumann algebras is one.
- `W*(S)' = (S ∪ S*)'` and `W*(S)'' = W*(S)`.
- A von Neumann algebra is norm closed; its subtype is a C*-algebra.

**Checks.**
- `A = ℂ·1`: `A' = B(H)`, `A'' = ℂ·1 = A`; `A` is the diagonal algebra of `M₂(ℂ)`: `A' = A`,
  `A'' = A`.
- `A` = finite-rank operators plus `ℂ·1` on `ℓ²(ℕ)`: `A' = ℂ·1`, `A'' = B(H) ≠ A`, and `A` is not
  weakly closed: with `P_n = e₀ + ⋯ + e_n`, the finite-rank operators `P_n S P_n` converge strongly
  to the shift `S ∉ A`, consistent with the theorem.
- `S = {e₁₂} ⊆ M₂(ℂ)`: `S ∪ S* = {e₁₂, e₂₁}` generates `M₂(ℂ)` since `e₁₂e₂₁ = e₁₁` and
  `e₂₁e₁₂ = e₂₂`; the plausible wrong model, the double centralizer of `S` alone, is
  `span{1, e₁₂}`, since `{e₁₂}'` is the algebra of matrices `[[a, b], [0, a]]`.
- Nonunital `A = ℂ e₁₁ ⊆ M₂(ℂ)`: `W = ℂe₂`, `K = ℂe₁`, the supported algebra is `ℂ e₁₁` with unit
  `e₁₁`; the bicommutant in `B(ℂ²)` is the diagonal algebra, which contains `1 ≠ e₁₁`.
- `H = 0`: `B(H) = 0` is the unique von Neumann algebra and is its own commutant.

*Needs:* V1.1–V1.2; RepresentationTheory/SemisimpleAlgebras Layer 3; Mathlib
`StarSubalgebra.centralizer`, `StarSubalgebra.coe_centralizer_centralizer`,
`Set.centralizer_centralizer_centralizer`, `StarSubalgebra.cstarAlgebra`.

### V1.4 Kaplansky density

Prove Kaplansky's density theorem: for a unital star subalgebra `A ⊆ B(H)` with strong closure `M`,
the norm unit ball of `A` is strongly dense in the unit ball of `M`, the self-adjoint part of the
unit ball of `A` is strongly dense in the self-adjoint part of the unit ball of `M`, and likewise
for the positive parts (Houdayer, Theorem 3.16, p. 17; Peterson, Theorem 2.6.4, p. 31; Jones,
Theorem 5.2.1, pp. 32–33). Since `M = A''` by V1.3, the unit-ball form is
`kaplansky_closure_unitBall`. Route: the self-adjoint case by the homeomorphism `t ↦ 2t/(1 + t²)` of
`[−1, 1]` and the identity `y − x = 2(1 + Y²)⁻¹(Y − X)(1 + X²)⁻¹ + ½ y(X − Y)x` for `x = f(X)`,
`y = f(Y)`; the general case by the matrix amplification `[[0, x], [x*, 0]]` in `M₂(M)`; the positive
case by `x ↦ x*x` applied to self-adjoint approximants of `√x`. Give the strong-star form, and the
useful criterion that an operator lies in `W*(A)` as soon as it is the strong limit of a norm-bounded
net from `A`.

**Checks.**
- `A = ℂ·1`: both unit balls are the closed disc `{c·1 : |c| ≤ 1}`.
- `A` = finite-rank operators plus `ℂ·1` on `ℓ²(ℕ)`, `M = B(H)`: the shift `S` is the strong limit
  of `P_n S P_n` with `P_n` the projection onto the first `n` basis vectors, each in the unit ball of
  `A`, as the theorem requires.
- Negative control, the star hypothesis: `A` = upper triangular matrices in `M₂(ℂ)` is a unital
  subalgebra, not star-closed; `A' = ℂ·1`, so `A'' = M₂(ℂ)`, but `A` is closed and its unit ball
  is not dense in that of `M₂(ℂ)`.
- Positive part on `M₂(ℂ)` with `A = M₂(ℂ)`: trivial; on `A` = finite rank plus `ℂ·1`, the positive
  operator `1 − e₀` is the strong limit of the positive contractions `P_n − e₀`.

*Needs:* V1.1–V1.3; Mathlib `cfc`.

### Examples

The diagonal algebra `ℓ∞(ℕ)` on `ℓ²(ℕ)` is weakly closed and equals its bicommutant. The shift
`S` on `ℓ²(ℕ)` generates `W*(S) = B(ℓ²(ℕ))`: an operator `T` commuting with `S` and `S*` commutes
with the rank-one projection `e₀ = 1 − SS*`, so `Te₀ = ce₀` for a scalar `c`, and then
`Te_n = TSⁿe₀ = SⁿTe₀ = ce_n` for every `n`, so `{S, S*}' = ℂ·1`; a singly generated algebra can be
all of `B(H)`.

### Dependencies

V0 (nothing beyond Mathlib); Mathlib's weak and pointwise operator topologies, their local convexity
and `geometric_hahn_banach_closed_point`; RepresentationTheory/SemisimpleAlgebras Layer 3.

## V2. Elementary algebra, corners, and tensors

### V2.1 Membership of calculus values, polar factors, projections and unitaries

For a nonunital concrete C*-algebra `A ⊆ B(H)`, use Mathlib's nonunital continuous functional
calculus `cfcₙ` to identify the C*-algebra generated by a positive element `a` with the continuous
functions on `σ(a)` vanishing at zero, and prove that the support (range) projection of `a ≠ 0` lies
in the strong closure of `A`, as the strong limit `SOT-lim (a/‖a‖)^(1/n)`, approximated by
polynomials with zero constant term (Jones, EP6, p. 20; Peterson, Proposition 4.4.5, p. 65).

For a von Neumann algebra `M` and a normal `a ∈ M`, prove that every bounded Borel calculus value
`f(a)` (SelfAdjointSpectralTheory SA-B05) and every spectral projection `P_a(B)` (SA-B30) lies in
`M`: an operator commuting with `a` and `a*` commutes with every `f(a)` (Peterson, Theorem 2.7.4,
pp. 33–34; Jones, EP1, p. 19), so `f(a) ∈ {a, a*}'' = W*(a) ⊆ M`. Prove that the modulus `|x|` and
the partial isometry of the polar decomposition `x = v|x|` (PolarDecomposition PD-B24–PD-B29) of
every `x ∈ M` lie in `M` (Houdayer, Theorem 3.9, p. 14; Peterson, Corollary 2.5.8, p. 29; Jones,
EP8, p. 22). Prove that `M` is generated by its projections and by its unitaries, and that every
element is a complex linear combination of at most four unitaries of `M` (Peterson, Proposition
1.4.5, p. 13; Jones, EP2, p. 19). For a unital C*-algebra `A` with von Neumann closure `M`, prove
that `U(A)` is strong-star dense in `U(M)`: construct a bounded self-adjoint logarithm `h ∈ M` of
each unitary `u`, with spectrum in `[−π, π]`, from the Borel calculi of the commuting real and
imaginary parts of `u`; apply Kaplansky density to uniformly bounded self-adjoint approximants of
`h` in `A`; and prove the strong continuity of the exponential on that bounded set by power-series
approximation.

- `f(a) ∈ W*(a)` for bounded Borel `f` and normal `a`; `P_a(B) ∈ W*(a)` for Borel `B`.
- `|x| ∈ M` and `v ∈ M` for `x ∈ M` with polar decomposition `x = v|x|`.
- `M` is the norm closure of the span of its projections, and the span of its unitaries.

**Checks.**
- `a = diag(1/2, 0)` in `M₂(ℂ)`: `(a/‖a‖)^(1/n) = diag(1, 0)` for every `n`, so the limit is the
  range projection `e₁₁` and not `1`.
- `a = diag(1, −1)` in `M₂(ℂ)`: `|a| = 1` and `v = a`; both lie in the diagonal algebra `W*(a)`.
- Four unitaries: `e₁₁ = (u + u*)/2` with `u = e₁₁ + i e₂₂ = x + i√(1 − x²)` for `x = e₁₁`; the
  diagonal algebra contains `u`.
- Logarithm: `u = diag(e^{iθ}, e^{−iθ})` with `0 < θ < π` has `h = diag(θ, −θ)` with
  `σ(h) ⊆ [−π, π]` and `e^{ih} = u`; `u = −1` has `h = π·1`.
- Negative control: in the nonunital C*-algebra `A = ℂ e₁₁ ⊆ M₂(ℂ)` the support projection of
  `a = e₁₁` is `e₁₁ ∈ A`, while `1 ∉ A`; a formula producing `1` would be wrong.

*Needs:* V1.3–V1.4; SelfAdjointSpectralTheory SA-B05, SA-B10–SA-B11, SA-B30, SA-B46;
PolarDecomposition PD-B24–PD-B29; Mathlib `cfcₙ`, `CStarAlgebra.span_unitary`.

### V2.2 Vigier's theorem, the projection lattice and comparison of projections

Prove Vigier's monotone convergence theorem: a norm-bounded increasing net of self-adjoint operators
converges strongly to its least upper bound (Houdayer, Proposition 2.5, p. 8; Jones, Theorem 3.4.2,
p. 19; Peterson, Lemma 2.7.1, p. 32), and that a von Neumann algebra is closed under such limits.
Construct the complete lattice of projections of `M` (Houdayer, Proposition 3.8, p. 14; Jones, EP5,
p. 20; Peterson, §3.1.1, p. 41): the meet is the projection onto the intersection of ranges, the join
the projection onto the closed span, the complement `1 − p`; define the support, range and kernel
projections of an element and the central support `c(p)` (V2.3); prove compatibility with increasing
limits, the identities `p ∧ q = SOT-lim (pq)ⁿ = SOT-lim (pqp)ⁿ` (Jones, Exercise 3.4.3, p. 20), and
the zero/one, orthogonality, inclusion, conjugation, functional-calculus and transport lemmas for all
these operations. Define Murray–von Neumann equivalence `MurrayVonNeumannEquiv` (`p ∼ q`: some
`v ∈ M` with `v*v = p`, `vv* = q`) and subequivalence `MurrayVonNeumannSubequiv` (`p ≼ q`: `v*v = p`
and `vv* ≤ q`) (Peterson, §3.1.1, p. 41; Jones, Definition 6.1.1, p. 35). Prove that `∼` is an
equivalence relation, that `≼` is reflexive and transitive, that orthogonal sums preserve `≼`
(Peterson, Lemma 3.1.5, p. 42), that `[xH] ∼ [x*H]` through the polar partial isometry (Peterson,
Lemma 3.1.6, p. 43), Kaplansky's parallelogram law `p ∨ q − p ∼ q − p ∧ q` using the polar
decomposition of `(1 − p)q`, and its version with `p` and `q` interchanged (Peterson, Proposition
3.1.7, p. 43; Jones, Exercise 7.3.9, p. 47). Prove the projection Schröder–Bernstein theorem
`murrayVonNeumannEquiv_of_subequiv`: `p ≼ q` and `q ≼ p` give `p ∼ q` (Peterson, Proposition 3.1.4,
p. 42; Jones, Theorem 6.1.2, pp. 35–36), so `≼` is a partial order on equivalence classes. Define
countable decomposability (σ-finiteness) of a projection, and of `M`, as countability of every
family of pairwise orthogonal nonzero subprojections (Peterson, §3.2, p. 48; Houdayer, p. 14); the
zero algebra is countably decomposable. Prove that ultraweakly closed left ideals of `M` are exactly
the `Mp` for a unique projection `p ∈ M`, and ultraweakly closed two-sided ideals correspond to
central projections, with uniqueness and inclusion correspondence (Jones, Theorem 6.1.12, pp. 37–38;
Peterson, Lemma 4.3.1, p. 61; Houdayer, Exercise 3.7, p. 14).

- `∼` is an equivalence relation on the projections of `M`; `≼` is a preorder, antisymmetric up to `∼`.
- `p ≤ q` implies `p ≼ q`; `p ∼ q` implies `p ≼ q`; `p ≼ q` and `q ∼ r` imply `p ≼ r`.
- If `p_i ⊥ p_j` and `q_i ⊥ q_j` for `i ≠ j` and `p_i ≼ q_i` for all `i`, then `Σ p_i ≼ Σ q_i`.
- `M` is countably decomposable iff some, equivalently every, maximal orthogonal family of nonzero
  projections is countable.

**Checks.**
- Two distinct lines in `ℂ²` with unit vectors `u, v`, `|⟪u, v⟫| = cos θ < 1`, projections `p, q`:
  `pq = ⟪u, v⟫ u ⊗ v*` and `(pq)ⁿ = |⟪u, v⟫|^(2n−2) pq` has norm `(cos θ)^(2n−1) → 0`, so
  `p ∧ q = 0`; `p ∨ q = 1`;
  Kaplansky's law reads `1 − p ∼ q`, both of rank one, which holds in `M₂(ℂ)`.
- Orientation witness in `M₂(ℂ)`: `v = e₂₁` has `v*v = e₁₁` and `vv* = e₂₂`, so `e₁₁ ∼ e₂₂` with
  initial projection `e₁₁`; `e₁₁ ≼ 0` fails since `v*v = e₁₁` forces `vv* ≠ 0`.
- Schröder–Bernstein on `B(ℓ²(ℕ))`: the shift gives `1 ≼ 1 − e₀` (`S*S = 1`, `SS* = 1 − e₀`), and
  `1 − e₀ ≤ 1` gives `1 − e₀ ≼ 1`; the conclusion `1 ∼ 1 − e₀` holds with `v = S`, and the
  projections are not equal, so the conclusion is equivalence and not equality.
- Countable decomposability: `B(ℓ²(ℕ))` is countably decomposable; `B(ℓ²(I))` for uncountable `I`
  is not (the rank-one projections `e_i`); the zero algebra is.
- Left ideals in `M₂(ℂ)`: the matrices with zero second column form `M e₁₁`; the only two-sided
  ideals are `0 = M·0` and `M = M·1`, matching the central projections `0, 1`.

*Needs:* V1.3; V2.1 (polar factors in `M`); PolarDecomposition PD-B24–PD-B29.

### V2.3 Central support and corners

For a projection `p ∈ M`, prove that its central support `c(p)` is the projection onto
`closure span {xpξ : x ∈ M, ξ ∈ H}` (Peterson, Lemma 3.1.8, p. 43). Prove the central-support
kernel theorem: for `y ∈ M'`, `yp = 0 ⟺ y c(p) = 0`. Construct the corner `pMp` on `pH` with
unit `p` and prove `(pMp)' = pM'p` on `pH` (Jones, EP7, p. 21; Peterson, Proposition 3.1.1, p. 41
and Lemma 3.3.8, p. 52). If `M` is a factor and `p ≠ 0`, prove that `pMp` is a factor and that the
restriction `M' → B(pH)`, `y ↦ y|_{pH}`, is a faithful normal isomorphism onto `pM'p` (Jones,
Corollary 3.4.4, p. 22). Prove the reducing-subspace correspondence: a closed subspace `K` is
invariant under `M` iff `[K] ∈ M'` (Houdayer, Exercise 3.6, p. 14), and the nonzero product theorem
`ab ≠ 0` for nonzero `a ∈ M`, `b ∈ M'` when `M` is a factor (Jones, Corollary 3.4.5, p. 22). For a
self-adjoint multiplicatively closed generating set `S`, prove that `pSp` generates `pMp` for
`p ∈ M` or `p ∈ M'`, and give the counterexample when multiplicative closure is dropped (Jones,
Exercise 3.4.6, p. 22). For a factor and finite-dimensional subspaces `V ⊆ M`, `W ⊆ M'`, prove that
multiplication `V ⊗ W → VW` is a linear isomorphism onto the span of the products, and the
star-algebra version when `V, W` are star subalgebras (Jones, Exercise 3.4.7, p. 22).

- `c(p)` is the least central projection above `p`; `c(p) = ⋁_{u ∈ U(M)} upu*`.
- `pMp` is a von Neumann algebra on `pH`; `(pMp)' = pM'p`; `(pM'p)' = pMp`.
- `p ↦ pMp` sends factors to factors for `p ≠ 0`.

**Checks.**
- `M = M₂(ℂ) ⊕ ℂ` (block diagonal in `M₃(ℂ)`), `p = e₁₁`: `Mp ℂ³` is the span of the first two
  coordinates, so `c(p) = e₁₁ + e₂₂ ≠ 1`; `y = e₃₃ ∈ M'` has `yp = 0` and `y c(p) = 0`; `y = 1`
  has `yp ≠ 0`.
- `M = M₂(ℂ)`, `p = e₁₁`: `pMp = ℂp` on `pH = ℂ`, `(pMp)' = ℂ = pM'p`.
- Counterexample to generation: `M = M₃(ℂ)`, `S = {e₁₂, e₂₁, e₂₃, e₃₂}` (self-adjoint, generating
  `M₃(ℂ)` since `e₁₂e₂₃ = e₁₃`, not multiplicatively closed), `p = e₁₁ + e₃₃`: `pSp = {0}`
  generates `ℂp`, while `pMp ≅ M₂(ℂ)`; with `S` replaced by all matrix units, `pSp` contains `e₁₃`
  and generates `pMp`.
- Nonzero products: `M = M₂(ℂ) ⊕ ℂ` is not a factor, `a = e₁₁ ∈ M`, `b = e₃₃ ∈ M'`, `ab = 0`
  with `a, b ≠ 0`; for the factor `M₂(ℂ)` on `ℂ²`, `M' = ℂ·1` and `ab = 0` forces `a = 0` or `b = 0`.
- `V ⊗ W → VW` for `M = M₂(ℂ) ⊕ ℂ`, `V = span{e₁₁, e₃₃} ⊆ M`, `W = span{e₁₁ + e₂₂, e₃₃} ⊆ M'`:
  `V ⊗ W` has dimension four and `VW = span{e₁₁, e₃₃}` dimension two, so the factor hypothesis is
  needed; for `M = M₂(ℂ)`, `V = M`, `W = ℂ·1`, the map is an isomorphism `M₂(ℂ) ⊗ ℂ ≅ M₂(ℂ)`.

*Needs:* V1.3; V2.1–V2.2; OrthogonalGeometry (invariant and reducing subspaces).

### V2.4 Hilbert and spatial tensor products

Construct the completed Hilbert tensor product `H ⊗̂ K` as `UniformSpace.Completion` of Mathlib's
inner-product space `TensorProduct ℂ H K`, whose inner product is already positive definite with
`‖x ⊗ₜ y‖ = ‖x‖‖y‖`, so no null quotient is taken; give it its Hilbert space structure. Extend
`TensorProduct.mapL`, `TensorProduct.commIsometry` and `TensorProduct.assocIsometry` to the completion
to obtain the bounded-operator tensor maps `x ⊗ y`, the flip and associativity; prove the density of
elementary tensors, the norm formula `‖x ⊗ y‖ = ‖x‖‖y‖`, `(x ⊗ y)(x' ⊗ y') = xx' ⊗ yy'`,
`(x ⊗ y)* = x* ⊗ y*`, and the identification `L²(X, μ) ⊗̂ K ≅ L²(X, μ; K)` with `MeasureTheory.Lp`.
For finite measures develop the measure algebra modulo null sets with metric `μ(A △ B)` and prove
that its separability is equivalent to separability of `L²(μ)`. For uncountable `I` and the fair
coin product measure on `{0,1}^I`, prove that the centred coordinate functions form an uncountable
orthogonal family, so `L²` is nonseparable; prove that `ℓ²(I)` is separable iff `I` is countable.
Define the spatial tensor product `M ⊗̄ N` of `M` on `H` and `N` on `K` as `W*({x ⊗ y})` on `H ⊗̂ K`
(Jones, §4.3, p. 27); prove associativity and the flip. Construct the canonical maps `x ↦ x ⊗ 1_K`
from `M` and `y ↦ 1_H ⊗ y` from `N` as normal unital star homomorphisms into `M ⊗̄ N`, with no
nonzero hypothesis. Prove the left map injective, hence isometric, when `K ≠ 0`, and the right map
when `H ≠ 0`. If `K = 0` then `H ⊗̂ K = 0` and `M ⊗̄ N = 0`, so the left map is zero and is injective
only when `H = 0` as well; for `M = ℂ` on `H = ℂ` and `N = 0` on `K = 0` it is the zero map
`ℂ → 0`. State `M ⊗̄ 0 = 0` and `0 ⊗̄ N = 0` explicitly. Construct the slice maps: for
`η₁, η₂ ∈ K` the map `R_{η₁,η₂} : B(H ⊗̂ K) → B(H)` with `⟪ξ₁, R(T)ξ₂⟫ = ⟪ξ₁ ⊗ η₁, T(ξ₂ ⊗ η₂)⟫`,
with `‖R(T)‖ ≤ ‖η₁‖‖η₂‖‖T‖`, `R(T)* = R_{η₂,η₁}(T*)`, `R(x ⊗ y) = ⟪η₁, yη₂⟫ x`, weak continuity,
`R(M ⊗̄ N) ⊆ M`, and the separating property: `T = 0` iff all slices of `T` vanish; symmetrically
on the other side. Prove the commutation theorem for `B(K)` tensor factors: `(M ⊗ 1)' = M' ⊗̄ B(K)`
and `(M ⊗̄ B(K))' = M' ⊗ 1`, in particular `(B(H) ⊗ 1)' = 1 ⊗ B(K)` (Jones, Exercise 3.3.8, p. 16,
and §4.2, p. 26), by the matrix picture: for an orthonormal basis `(k_j)` of `K`, `B(H ⊗̂ K)` is the
bounded `K`-indexed matrices over `B(H)` with strongly convergent finite truncations, an operator
commuting with `M ⊗ 1` is a matrix with entries in `M'`, and one commuting with `1 ⊗ B(K)` is a
scalar matrix `x ⊗ 1` (Houdayer, proof of Theorem 3.1, p. 12). Prove the `B(K)` splitting theorem:
a von Neumann algebra `N` on `H ⊗̂ K` containing `1 ⊗ B(K)` is `M ⊗̄ B(K)` for the von Neumann
algebra `M` with `M' ⊗ 1 = N'`, by the two commutation theorems, and the factoriality of a tensor
product of factors: for `z` central in `M ⊗̄ N`, every `K`-slice of `z` lies in `M ∩ M' = ℂ`, so `z`
commutes with `B(H) ⊗ 1` and `z = 1 ⊗ w`; the `H`-slices then give `w ∈ N ∩ N' = ℂ`.

- `H ⊗̂ K` is a complete inner product space in which the image of `H ⊗[ℂ] K` is dense; the
  elementary tensors `h ⊗ k` span a dense subspace.
- `x ⊗ y` is bounded with `‖x ⊗ y‖ = ‖x‖‖y‖`, multiplicative and star-preserving in each variable.
- `M ⊗̄ N` is a von Neumann algebra on `H ⊗̂ K`; `(M ⊗̄ N) ⊗̄ P ≅ M ⊗̄ (N ⊗̄ P)` and
  `M ⊗̄ N ≅ N ⊗̄ M` spatially.
- Slices: `R_{η₁,η₂}` is linear, weakly continuous, bounded, and `R_{η₁,η₂}(x ⊗ y) = ⟪η₁, yη₂⟫ x`.

**Checks.**
- `ℂ ⊗̂ K = K`; `ℂ² ⊗̂ ℂ² = ℂ⁴` and `M₂(ℂ) ⊗̄ M₂(ℂ) = M₄(ℂ)`; `M ⊗̄ N = ℂ` for `M = N = ℂ` on `ℂ`.
- Zero cases: `M₂(ℂ) ⊗̄ 0 = 0` on `ℂ² ⊗̂ 0 = 0`; the left map `M₂(ℂ) → 0` is zero and not injective.
- `(M₂(ℂ) ⊗ 1)' = 1 ⊗ M₂(ℂ)` on `ℂ² ⊗̂ ℂ² = ℂ⁴`: the matrices commuting with `x ⊗ 1` for all `x`
  are `1 ⊗ y`, of dimension four.
- Slice of an elementary tensor: `y = e₁₂`, `η₁ = e₁`, `η₂ = e₂`: `R(x ⊗ e₁₂) = ⟪e₁, e₁₂e₂⟫ x = x`;
  with `η₁ = e₂`: `⟪e₂, e₁⟫ x = 0`.
- Nonseparability: `ℓ²(I)` for uncountable `I` has the uncountable orthonormal family `(δ_i)`; on
  `{0,1}^I` the centred coordinates `f_i = 2·1_{x_i = 1} − 1` satisfy `⟪f_i, f_j⟫ = 0` for `i ≠ j`
  (independence and mean zero) and `‖f_i‖ = 1`.
- Factoriality: `M₂(ℂ) ⊗̄ M₂(ℂ) = M₄(ℂ)` is a factor; the diagonal algebra `D ⊗̄ D` on `ℂ⁴` is not,
  consistent with `D` not being a factor.

*Needs:* V1.3–V1.4; V2.1–V2.3; Mathlib `TensorProduct ℂ H K` with its inner product,
`TensorProduct.mapL`, `TensorProduct.commIsometry`, `TensorProduct.assocIsometry`,
`UniformSpace.Completion`, `MeasureTheory.Lp`, `lp`.

### V2.5 Abelian algebras: `L∞`, the single generator, the `L∞` comparison and the classification

For a σ-finite measure space `(X, μ)` realise `L∞(X, μ)` as multiplication operators on `L²(X, μ)`
and prove that it is isometrically embedded and is its own commutant, hence a maximal abelian von
Neumann algebra (Houdayer, Proposition 3.3, p. 13, for probability measures; Peterson, Proposition
2.5.9 and the remark following it, pp. 29–30). For an abelian von Neumann algebra `M` on separable
`H`, construct a single self-adjoint generator `a = Σ_n 3⁻ⁿ e_n` from a strongly dense sequence of
projections `(e_n)`, recovering each `e_n` as a spectral projection of `a` (Jones, EP10, p. 23;
Peterson, Lemma 2.8.8, p. 38, with weights `4⁻ᵏ`).

The `L∞` comparison. Let `a` be a normal operator on `H` (of any cardinality), `P_a` its spectral
projection-valued measure on `σ(a)` (SA-B30) and `W*(a)` the von Neumann algebra it generates. Prove
that the following are equivalent: `W*(a)` is countably decomposable; there is a finite positive
Borel measure `μ` on `σ(a)` with `μ(B) = 0 ⟺ P_a(B) = 0` for every Borel `B`. In that case prove
that the bounded Borel calculus descends to an isometric unital star-algebra isomorphism
`L∞(σ(a), μ) ≅ W*(a)`, `[f] ↦ f(a)`: the value is independent of the bounded Borel representative,
`‖f(a)‖` is the `μ`-essential supremum of `f`, the map agrees with the continuous functional
calculus on `C(σ(a))`, sends the class of an indicator `1_B` to `P_a(B)`, and is onto `W*(a)`.
Houdayer proves this for separable `H` (Theorem 3.4, p. 13) and Peterson for `W*(a)` with
separable predual (Corollary 2.8.7, p. 38, where a von Neumann algebra is called separable when it is
strongly separable, equivalently when its predual is separable, p. 36); both hypotheses imply that
`W*(a)` is countably decomposable, the first since an orthogonal family of nonzero projections on a
separable space is countable, the second since a separable predual yields a faithful normal state
(V4.PositivePredual). For
`H ≠ 0`, `μ` may be normalised to a probability measure; for `H = 0`, `σ(a)` is empty, `μ` is the zero
measure and both sides are the zero algebra. Route for the measure: for `ξ ∈ H` let `s_ξ ∈ W*(a)` be
the support projection of `ω_ξ` on `W*(a)`, the complement of the join of the projections `p` of
`W*(a)` with `pξ = 0` (the join kills `ξ` since `W*(a)` is abelian and by Vigier's theorem), so that
`P_a(B)ξ = 0 ⟺ P_a(B)s_ξ = 0`; choose by Zorn a maximal family of unit vectors `ξ_i` with
pairwise orthogonal `s_{ξ_i}`; maximality gives `Σ_i s_{ξ_i} = 1`, since a unit vector `ξ` in the
range of `1 − Σ s_{ξ_i}` has `s_ξ ≤ 1 − Σ s_{ξ_i}`; countable decomposability makes the family
countable, and `μ = Σ_i 2^(−i) ω_{ξ_i} ∘ P_a` is a finite measure with `μ(B) = 0` iff
`P_a(B) s_{ξ_i} = 0` for all `i` iff `P_a(B) = 0`; moreover `ξ = Σ_i 2^(−i/2) ξ_i` is separating for
`W*(a)`, since `s_{ξ_i} ξ = 2^(−i/2) ξ_i`, and `μ = ω_ξ ∘ P_a`. Conversely, given `μ`, let `(p_j)`
be an orthogonal family of nonzero projections of `W*(a)` and `η_j ∈ p_jH` unit vectors: for
`j ≠ k` the vector measure `μ_{η_j + η_k}` is `μ_{η_j} + μ_{η_k}`, and in the cyclic model
`L²(μ_{η_j + η_k}) ≅ closure W*(a)(η_j + η_k)` (the unitary `f ↦ f(a)η` of the vector norm-square
identity, with `W*(a)` acting inside the maximal abelian `L∞`) the projection `p_j` is
multiplication by an indicator `h`, so `μ_{η_j} = h·μ_{η_j + η_k}` and `μ_{η_k} = (1 − h)·μ_{η_j + η_k}`
are mutually singular; each `μ_{η_j}` is absolutely continuous with respect to `μ` and nonzero, so
the `μ`-supports of their densities are pairwise disjoint sets of positive `μ`-measure, countably
many for a finite measure. For the isomorphism, for any `μ` equivalent to `P_a`: the kernel of
`f ↦ f(a)` is the `μ`-null symbols, since `f(a) = 0` forces `P_a({|f| > 1/n}) = 0` for every `n` by
the vector norm-square identity `‖f(a)ξ‖² = ∫ |f|² dμ_ξ` (SA-B12–SA-B13, SA-B49), and conversely
`f(a) = f(a) P_a({f ≠ 0})`; the essential-norm identity follows from the spectral projections of
`{|f| > c}`; for onto-ness, with `μ = ω_ξ ∘ P_a` for the separating vector above (any equivalent
measure gives the same `L∞`), Kaplansky density (V1.4) gives a norm-bounded net `f_α(a)` of
continuous-calculus values converging strongly to a given `T ∈ W*(a)`; the norm-square identity makes
`(f_α)` Cauchy in `L²(μ) = ⊕_i 2^(−i) L²(μ_{ξ_i})`, whose limit `f` is essentially bounded by the
common bound; `f_α(a)ξ_i → f(a)ξ_i` for each `i`, so `T − f(a)` kills every `ξ_i`, hence its
support projection (onto the orthogonal complement of its kernel), which lies in `W*(a)`, is
orthogonal to every `s_{ξ_i}` and vanishes, giving `T = f(a)`. This target uses neither
SelfAdjointSpectralTheory SA-B85–SA-B86 nor V4.0.Fields.

- The map `[f] ↦ f(a)` is a well-defined isometric unital star-algebra isomorphism
  `L∞(σ(a), μ) → W*(a)`.
- `[1_B] ↦ P_a(B)`; the projections of `W*(a)` are the `P_a(B)`.
- `μ` is unique up to equivalence of measures.

**Checks.**
- `X = {1, 2}` with counting measure: `L∞` is the diagonal algebra of `M₂(ℂ)`, whose commutant is
  itself.
- Negative control for the measure hypothesis: an uncountable set with the countable–cocountable
  σ-algebra and counting measure is not σ-finite, and there `L∞` is a proper subalgebra of its
  bicommutant (Peterson, Exercise 2.5.10, p. 30).
- Single generator on `ℓ∞({0, 1, 2})`, the diagonal algebra of `ℂ³`: `a = e₀ + 3⁻¹ e₁ + 3⁻² e₂`
  has three distinct eigenvalues, so its spectral projections are `e₀, e₁, e₂` and `W*(a)` is the
  whole algebra; with equal weights, `a = 1` generates only `ℂ`.
- `a = e₁₁` on `ℂ²`: `σ(a) = {0, 1}`, `P_a({0}) = e₂₂`, `P_a({1}) = e₁₁`, `μ = (δ₀ + δ₁)/2`, and
  `L∞(σ(a), μ) = ℂ² ≅ W*(a)` = the diagonal algebra; for `f = 1_{{0}}`, `‖f(a)‖ = ‖e₂₂‖ = 1` is the
  `μ`-essential supremum, whereas the non-equivalent measure `δ₁` would give essential supremum `0`.
- `a = 1` on a nonseparable `H`: `σ(a) = {1}`, `μ = δ₁`, `L∞ = ℂ = W*(a)`; `W*(a)` is countably
  decomposable although `H` is not separable, so the hypothesis is on `W*(a)` and not on `H`.
- Negative control: `a` = multiplication by `t ↦ t` on `ℓ²([0,1])`, so `W*(a) = ℓ∞([0,1])`
  (Peterson, p. 38): the rank-one projections `e_t` form an uncountable orthogonal family, so `W*(a)`
  is not countably decomposable; since `P_a({t}) = e_t ≠ 0` for every `t`, a measure equivalent to
  `P_a` would need `μ({t}) > 0` for uncountably many `t`, impossible for a finite measure.
- `H = 0`: `σ(a) = ∅`, `μ = 0`, both algebras are `0`.

Classification. Prove that for a nonatomic finite Borel measure `μ` on a compact `K ⊆ ℝ` the
distribution function `θ(t) = μ(K ∩ (−∞, t])/μ(K)` pushes `μ/μ(K)` forward to Lebesgue measure `λ`
on `[0,1]` and that `f ↦ f ∘ θ` is a star-algebra isomorphism `L∞([0,1], λ) → L∞(K, μ)` (`θ` is
injective off a `μ`-null set, since its non-degenerate fibres are countably many `μ`-null
intervals). Classify the abelian von Neumann algebras on separable `H` abstractly as `ℓ∞(K)` for a
countable (possibly empty) set `K`, or `L∞([0,1], λ) ⊕ ℓ∞(K)` (Peterson, Theorem 2.8.9, pp. 38–39;
Jones, p. 23): by the single self-adjoint generator and the comparison above, such an algebra is
`L∞(σ(a), μ)`; split `μ` into its atomic and nonatomic parts, the atoms being the `t ∈ σ(a)` with
`P_a({t}) ≠ 0`; normalise the nonatomic part and apply the isomorphism through `θ`. The zero algebra
is `ℓ∞(∅)`.

**Checks.**
- The diagonal algebra of `ℂ³` is `ℓ∞({0, 1, 2})`; `L∞([0,1], λ)` on `L²[0,1]` has `K = ∅`;
  `L∞([0,1], λ) ⊕ ℂ` on `L²[0,1] ⊕ ℂ` has `K` a point; the zero algebra is `ℓ∞(∅)`.
- `L∞([0,2], λ) ≅ L∞([0,1], λ)` through `θ(t) = t/2`: the nonatomic part has one isomorphism type,
  so the classification lists `L∞([0,1], λ)` once and `K` is determined by the atoms.
- `μ = (δ₀ + λ|_{[0,1]})/2` on `[0,1]`: one atom, `K` a point, nonatomic part `λ`; the algebra is
  `L∞([0,1], λ) ⊕ ℂ`.

*Needs:* V1.3–V1.4; V2.1–V2.2; SelfAdjointSpectralTheory SA-B05–SA-B13, SA-B30, SA-B46, SA-B49,
SA-B53; Mathlib `MeasureTheory.Lp`.

### Examples

`ℓ∞(ℕ)` on `ℓ²(ℕ)` is `L∞` of counting measure and is maximal abelian, generated by
`a = Σ 3⁻ⁿ e_n`; `L∞[0,1]` on `L²[0,1]` is generated by multiplication by `t`, with `P_a(B) = 1_B`
and `μ = λ`; `M₂(ℂ) ⊗̄ B(ℓ²)` on `ℂ² ⊗̂ ℓ²` has commutant `1 ⊗ ℂ = ℂ` and is a factor.

### Dependencies

V1; OperatorTheory/PolarDecomposition Part B, SelfAdjointSpectralTheory SA-B05–SA-B13, SA-B30,
SA-B46, SA-B49, SA-B53, OrthogonalGeometry; Mathlib's `cfcₙ`, the inner product on
`TensorProduct ℂ H K`, `UniformSpace.Completion`, `MeasureTheory.Lp` and `lp`.

## V3. Type I and finite-dimensional algebras

### V3.1 Types of projections and type I factors

Define minimal, abelian, finite, infinite and properly infinite projections of `M` (Peterson, §3.2,
pp. 44–45; Jones, Definitions 4.1.3 and 6.1.3, pp. 26 and 36): `p ≠ 0` is minimal when its only
subprojections in `M` are `0` and `p`, abelian when `pMp` is abelian, finite when `q ≤ p` and
`q ∼ p` force `q = p`, infinite otherwise, and properly infinite when `p ≠ 0` and `zp` is infinite
for every central projection `z` with `zp ≠ 0`. Prove the minimal-corner criterion: a nonzero
projection `p` is minimal iff `pMp = ℂp` (Jones, Exercise 4.1.4, p. 26). Prove that in a factor any
two nonzero projections `p, q` have a nonzero connecting corner `pxq ≠ 0`, with `x` a unitary
(Jones, Theorem 4.1.1, p. 25), and derive nonzero equivalent subprojections `p₀ ≤ p`, `q₀ ≤ q`,
`p₀ ∼ q₀` (Jones, Corollary 4.1.2, p. 25; Peterson, Proposition 3.1.9, pp. 43–44), and the
comparison theorem for factors: `p ≼ q` or `q ≼ p` (Jones, Theorem 6.1.8, p. 36; Peterson,
Corollary 3.1.11, p. 44). Construct systems of matrix units `(e_{ij})` from orthogonal equivalent
projections (Jones, Definition 4.3.2, p. 27), with their representation, corner and tensor-product
APIs: the `e_{ij}` generate a type I factor isomorphic to `B(ℓ²(I))` and `M ≅ e₁₁Me₁₁ ⊗̄ B(ℓ²(I))`
(Jones, Exercise 4.3.3, p. 27). Prove that a factor with a minimal projection is spatially
`B(K) ⊗ 1_L` on `K ⊗̂ L` (Jones, Theorem 4.2.1, p. 26; Peterson, Theorem 3.4.3, p. 54), treating
arbitrary cardinality in the basic type I classification by a maximal orthogonal family of minimal
projections, and classify the type `I_n` and `I_∞` factors on separable spaces by the cardinality of
that family (Peterson, Lemma 3.4.1 and Proposition 3.4.2, p. 53). Give the commutant `1 ⊗ B(L)`
(V2.4) and the multiplicity `dim L` (Jones, §4.4, pp. 27–28).

- `p` minimal ⟹ abelian ⟹ finite; `p ≼ q` and `q` finite ⟹ `p` finite (Peterson, Proposition
  3.2.2, p. 45).
- In a factor `M`, the equivalence classes of projections are totally ordered by `≼`.
- A type I factor is isomorphic to `B(K)` for a unique cardinality `dim K`.

**Checks.**
- `M₂(ℂ)`: `e₁₁` is minimal and `e₁₁ M₂(ℂ) e₁₁ = ℂe₁₁`; every projection is finite; `M₂(ℂ)` is
  a factor of type `I₂` on `ℂ²` with commutant `ℂ` and multiplicity one.
- `B(ℓ²(ℕ))`: the rank-one projections are minimal; `1` is infinite (`1 ∼ 1 − e₀`) and properly
  infinite; the factor is of type `I_∞`.
- Negative control for the connecting corner: `M = M₂(ℂ) ⊕ ℂ` is not a factor, and `e₁₁ x e₃₃ = 0`
  for every `x ∈ M`, so no connecting corner exists between `e₁₁` and `e₃₃`.
- `M = M₂(ℂ) ⊗ 1` on `ℂ² ⊗̂ ℂ³ = ℂ⁶`: a factor of type `I₂` with multiplicity three and commutant
  `1 ⊗ M₃(ℂ)`; the minimal projection `e₁₁ ⊗ 1` has rank three in `B(ℂ⁶)`.
- `H = 0`: the zero algebra has no nonzero projection, hence no minimal projection, and is not a factor.

*Needs:* V1.3; V2.2–V2.4.

### V3.2 Finite-dimensional algebras and inclusions

Classify finite-dimensional von Neumann algebras acting on possibly infinite-dimensional `H`
as finite direct sums of matrix algebras `⊕_{i ≤ k} M_{n_i}(ℂ)` with multiplicity Hilbert spaces:
there are Hilbert spaces `K_i` and a unitary `u : ⊕_i ℓ²(n_i) ⊗̂ K_i → H` with
`u* M u = ⊕_i B(ℓ²(n_i)) ⊗ 1` (Jones, Theorem 4.4.1, p. 28), through the minimal central projections
and V3.1. Classify unital inclusions `N ⊆ M` of finite-dimensional algebras by their nonnegative
integer multiplicity matrices `Λ = (λ_{ij})`: for `q_i` and `p_j` the minimal central projections
of `N` and `M`, `λ_{ij}` is the integer `k` for which `e(p_j q_i M q_i p_j)e` is a type `I_k` factor
when `e` is a minimal projection of the subfactor `p_j q_i N` of the factor `p_j q_i M q_i p_j`
(Jones, Theorem 4.4.2, pp. 28–29). Prove the dimension formula
`r_j = Σ_i λ_{ij} k_i` for `N = ⊕_i M_{k_i}(ℂ)` and `M = ⊕_j M_{r_j}(ℂ)`, composition of inclusion
matrices by matrix multiplication, and the bipartite Bratteli graph with `λ_{ij}` edges between `i`
and `j`. Prove the entry formula: `λ_{ij}` is the rank in `M_{r_j}(ℂ)` of `p_j e_i` for a minimal
projection `e_i` of `q_i N` (Jones, Exercise 4.4.3, p. 29). Work out `M₂(ℂ) ⊕ ℂ ⊆ M₅(ℂ) ⊕ M₃(ℂ)`
(Jones, Example 4.4.4, p. 29) and the general construction realising every admissible inclusion
matrix (Jones, Exercise 4.4.5, p. 29). For a spatial inclusion of type I factors `N ⊆ N ⊗ M_k(ℂ)`
with finite `k`, prove that the larger algebra is a free left `N`-module of rank `k²` with basis the
matrix units, including `N = B(K)` for infinite-dimensional `K` (Jones, §4.5, p. 29).

- The decomposition `⊕ M_{n_i}(ℂ)` is unique up to permutation; the `K_i` are unique up to unitary
  equivalence.
- `Λ_{N ⊆ P} = Λ_{N ⊆ M} Λ_{M ⊆ P}` for unital inclusions `N ⊆ M ⊆ P`.
- `Λ` has no zero row and no zero column, since `Σ_i q_i = 1 = Σ_j p_j`.

**Checks.**
- `N = M₂(ℂ) ⊕ ℂ ⊆ M = M₅(ℂ) ⊕ M₃(ℂ)` by `X ⊕ z ↦ diag(X, X, z) ⊕ diag(X, z)`: `Λ = [[2, 1], [1, 1]]`
  and `5 = 2·2 + 1·1`, `3 = 1·2 + 1·1`.
- `N = ℂ ⊕ ℂ ⊆ M₃(ℂ)` by `(z₁, z₂) ↦ diag(z₁, z₁, z₂)`: `Λ = [[2], [1]]` and `3 = 2·1 + 1·1`; the
  transposed convention would not even have the right shape.
- `ℂ ⊆ M₂(ℂ) ⊆ M₄(ℂ)` with `X ↦ diag(X, X)`: `Λ₁ = [2]`, `Λ₂ = [2]`, `Λ₁Λ₂ = [4] = Λ_{ℂ ⊆ M₄(ℂ)}`.
- `M₂(ℂ)` on `ℂ² ⊗̂ ℓ²(ℕ)` as `M₂(ℂ) ⊗ 1`: `k = 1`, `n₁ = 2`, `K₁ = ℓ²(ℕ)`, so the theorem allows
  infinite-dimensional `H`.
- `N ⊆ N ⊗ M₂(ℂ)` for `N = B(ℓ²(ℕ))`: free of rank four on the matrix units `e_{ij} ⊗ 1`.

*Needs:* V3.1; V2.3–V2.4.

### V3.3 Traces on `B(H)` and on group rings

Prove that every algebraic complex linear trace (a linear functional `τ` with `τ(xy) = τ(yx)`) on
`B(H)` for finite-dimensional `H` is a scalar multiple of the matrix trace, since the commutators
span the trace-zero matrices (Jones, Exercise 3.3.9 (i), p. 16). For infinite-dimensional `H` prove
that `B(H)` has no nonzero algebraic linear trace, with no continuity or positivity assumption, by
its commutator-span identity: every operator is a sum of commutators, through `H ≅ H ⊗̂ ℓ²(ℕ)`
(Jones, Exercise 3.3.9 (iv), p. 16). Also give the elementary proofs of the weakly continuous case
(a weakly continuous trace vanishes on the rank-one projections, which converge weakly to `0` and
are all equivalent, hence on the finite-rank operators, which are weakly dense; Jones, Exercise 3.3.9
(ii)) and the positive case (`1` is the sum of `n` orthogonal projections each equivalent to `1`,
so `τ(1) = nτ(1)` for every `n`; Jones, Exercise 3.3.9 (iii)).

For a subgroup `Η` of a group `Γ`, prove that the algebraic complex group ring `ℂ[Γ]`
(`MonoidAlgebra ℂ Γ`) is a free left `ℂ[Η]`-module with basis the group elements `g` in a set of
representatives of the right cosets `Ηg`, hence of rank the index `[Γ : Η]` (Jones, §4.5, p. 29).
This concerns the group rings, not the group von Neumann algebras of the Part II: for `Η` trivial and
`Γ = ℤ` with `U = λ(1)` the translation unitary on `ℓ²(ℤ)`, `(2 − U)⁻¹ = Σ_{n ≥ 0} 2^(−n−1) Uⁿ`
converges in norm in `W*(U)` but sends `δ₀` to a vector of infinite support, so it is not a finite
combination of the coset unitaries.

**Checks.**
- `M₂(ℂ)`: `τ(e₁₂) = τ(e₁₁e₁₂) = τ(e₁₂e₁₁) = 0` and `τ(e₁₁) = τ(e₁₂e₂₁) = τ(e₂₁e₁₂) = τ(e₂₂)`, so
  `τ = τ(e₁₁)·Tr`.
- `B(ℓ²(ℕ))` with the shift `S`: a trace has `τ(1) = τ(S*S) = τ(SS*) = τ(1 − e₀)`, so `τ(e₀) = 0`,
  and hence `τ` vanishes on every rank-one projection.
- `Γ = ℤ`, `Η = 2ℤ`: representatives `{0, 1}`, rank two; `Η = Γ`: rank one; `Η` trivial: rank `|Γ|`.
- `(2 − U)⁻¹δ₀ = Σ_{n ≥ 0} 2^(−n−1) δ_n`, with `‖U/2‖ = 1/2 < 1` giving norm convergence.

*Needs:* V2.2 (equivalence of projections); V2.4 (`H ⊗̂ ℓ²(ℕ)`); Mathlib `MonoidAlgebra`,
`Module.Free`.

### Examples

`M₂(ℂ) ⊕ ℂ ⊆ M₅(ℂ) ⊕ M₃(ℂ)` with its Bratteli diagram (two edges from the `M₂` vertex to the `M₅`
vertex, one to the `M₃` vertex, one each from the `ℂ` vertex); `B(ℓ²(ℕ))` as the type `I_∞` factor;
`M_n(ℂ) ⊗ 1_L` as the type `I_n` factor of multiplicity `dim L`.

### Dependencies

V1–V2; Mathlib `MonoidAlgebra` and `Module.Free`.

## V4. Preduals, normality, and normal representations

### V4.Core — duality and the easy normality direction

Use the trace-class operators `S₁(H)` and Hilbert–Schmidt operators `S₂(H)` from OperatorIdeals
(OI-B29–OI-B41). Prove basis independence of the positive extended trace `Tr(x) = Σ_i ⟪b_i, xb_i⟫`
for `x ≥ 0` (Jones, Lemma 8.1.1, p. 49; Peterson, Corollary 2.1.3, p. 19), the cyclicity
`Tr(xh) = Tr(hx)` for `h ∈ S₁(H)`, `x ∈ B(H)` and for Hilbert–Schmidt pairs (Peterson, Theorem 2.1.5,
p. 20, and Lemma 2.2.1, p. 22), the norm identity `‖φ_h‖ = ‖h‖₁` for `φ_h(x) = Tr(xh)` (Jones,
Proposition 8.1.5, p. 51), and the unitary identification of the Hilbert–Schmidt operators `H → K`
with `K ⊗̂ conj(H)` (Jones, Exercise 8.1.8, p. 52). Identify `B(H)` isometrically with the dual of
`S₁(H)` by the pairing `(x, h) ↦ Tr(xh)` (Peterson, Theorem 2.1.7, p. 21; Jones, Theorem 8.1.11,
p. 53). For an ultraweakly closed linear subspace `V ⊆ B(H)`, construct its predual as the quotient
`S₁(H)/V_⊥` by the preannihilator, prove the closedness of `V_⊥`, the completeness of the quotient,
the isometric dual identification `V ≅ (S₁(H)/V_⊥)*` and the agreement of the weak-star and
ultraweak topologies (Jones, Theorems 8.1.13 and 8.1.15, p. 53; Peterson, Proposition 2.6.7, p. 31;
Houdayer, Theorem 3.11, p. 15). Denote the ultraweakly continuous functionals on `M` by `M_*` and
identify them isometrically with this quotient. For a von Neumann algebra `N` on `H` this gives the
predual theorem `exists_predual`: there is a Banach space `X` with a conjugate-linear isometric
isomorphism `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] N`, namely `X` the conjugate Banach space of `N_*`, on which a
continuous linear functional is a conjugate-linear functional on `N_*`, whose conjugate is evaluation
at a unique `x ∈ N`; so every concrete von Neumann algebra satisfies Mathlib's `WStarAlgebra`
axiom. Prove the intrinsic uniqueness of the predual (Peterson, Theorem 4.4.4, p. 65) and Sakai's
theorem, the equivalence with Mathlib's `WStarAlgebra` definition: every C*-algebra `M` with
`WStarAlgebra M` is star-isomorphic to a concrete von Neumann algebra `N` on some Hilbert space,
`exists_vonNeumannAlgebra_starAlgEquiv` (Peterson, Theorem 4.4.6, p. 66), consuming BanachSpaceTheory
B2's Krein–Šmulian theorem and owning its W*-algebra specialisation: the weak-star closedness of
the positive cone (Peterson, Lemma 4.4.1, pp. 63–64), the separation of positive elements by
positive elements of the predual (Lemma 4.4.2, p. 64), the weak-star convergence of bounded
increasing nets to their least upper bound (Lemma 4.4.3, p. 64), the separate weak-star continuity
of multiplication (by Krein–Šmulian, since `x ↦ ax` is weak-star continuous on the unit ball), the
Kadison–Pedersen monotone-closure criterion (Proposition 4.4.5, p. 65), and the faithful
ultraweakly continuous concrete representation on the direct sum of the GNS spaces of the states in
the predual, inducing the given predual for each abstract W*-algebra; Mathlib's conjugate-linear
isometry is turned into the complex-linear `X̄* ≅ M` by conjugating scalars on `X`. In the
quotient-dual argument consume the native `LinearMap.dualEmbedding_surjective` and
`LinearMap.rightDualEquiv` for the pairing `topDualPairing ℂ B`, where `B` is the Banach predual
(first `S₁(H)`, then its quotient), with `WeakDual ℂ B = WeakBilin (topDualPairing ℂ B)`; right
separation follows from the native `RCLike` instance of `SeparatingDual` and
`SeparatingDual.eq_zero_of_forall_dual_eq_zero`. The resulting linear equivalence identifies every
continuous linear functional on the weak-star space `B*` uniquely with evaluation at some `b ∈ B`,
with no reflexivity hypothesis. Own the pairing and transport specialisation `ev_b(φ) = φ(b)`, and
for bounded `T : B →L[ℂ] C` the identity `ev_b ∘ T* = ev_{Tb}` for its weak-star continuous
transpose. Consume BanachSpaceTheory B1's annihilator and quotient theory.

Own the following separability proof for separable `H` (Jones, Exercise 8.1.16, p. 53). Consume
BanachSpaceTheory B4's compact Schmidt expansion, its zero-based singular-value and
approximation-number comparison and its isometric Hilbert nuclear/trace-class identification.
Truncate the trace-class singular expansion to finite rank with trace-norm error bounded by the
summable tail, and use B4's rank-one norm formula `‖u ⊗ v*‖₁ = ‖u‖‖v‖`. Approximate the finitely
many vectors by rational complex combinations in a countable orthonormal basis; the rank-one formula
controls the error. Thus the finite matrices with rational complex coefficients form a countable
trace-norm dense set, and the quotient predual of every ultraweakly closed subspace `V` of `B(H)` is
separable. Include finite-dimensional and zero `H`; no separability premise enters the general
trace-class or quotient-duality construction. Specialise to concrete algebras. For the group von
Neumann algebra of a group with at least two elements, produce a nonzero trace-class annihilator
(Jones, Exercise 8.1.14, p. 53) to demonstrate that the restriction `S₁(H) → M_*` is not injective.

Consume V0's positive-functional and state carriers, convex operations and norm-at-one comparison.
Define normality of a bounded positive functional `φ` on `M` by preservation of least upper bounds
of norm-bounded increasing nets of self-adjoint elements, `φ(sup x_i) = sup φ(x_i)` (Houdayer,
Definition 3.12, p. 15; Jones, Definition 7.1.2, p. 43). Define the analogous net predicates for
positive maps and star homomorphisms. Prove that ultraweak continuity implies these normality
predicates (Vigier's limit is strong, hence ultraweak on bounded sets), and that a positive member
of `M_*` is completely additive on arbitrary orthogonal projection families. Prove also that a
normal positive functional is completely additive by applying its net property to the finite partial
sums of each orthogonal family (Houdayer, Theorem 3.13, (1) ⇒ (2), p. 16). The converse for bounded
positive functionals is owned only by V4.PositivePredual; V4.Normality then derives the map and
representation consequences from it. Consume V2.2's countable decomposability. Define faithfulness
of a positive functional by `φ(x) = 0, x ≥ 0 ⟹ x = 0`. The zero algebra has no state, by V0's
norm-one definition.

- `S₁(H)* ≅ B(H)` isometrically by `x ↦ Tr(x ·)`; `V ≅ (S₁(H)/V_⊥)*` for ultraweakly closed `V`.
- `M_*` is a norm-closed subspace of `M*` (Houdayer, Proposition 3.10, pp. 14–15), isometric to
  `S₁(H)/M_⊥`, and `(M_*)* ≅ M` with weak-star = ultraweak.
- Ultraweakly continuous positive ⟹ normal ⟹ completely additive.

**Checks.**
- `h = diag(1/n²)` on `ℓ²(ℕ)`: `h ∈ S₁` with `‖h‖₁ = π²/6`, and `φ_h` is the functional of V1.1,
  with `‖φ_h‖ = π²/6`; `h = diag(1/n)` is Hilbert–Schmidt but not trace class, so `x ↦ Tr(xh)`
  is not defined on all of `B(H)` although `x ↦ ⟪h, x⟫₂` is defined on `S₂(H)`.
- Group algebra annihilator for `Γ` with `g ≠ e`: `h = δ_e ⊗ δ_e* − δ_g ⊗ δ_g*` is trace class and
  nonzero, and for `x = Σ_s x_s λ_s` in `W*(λ(Γ))`, `Tr(xh) = ⟪δ_e, xδ_e⟫ − ⟪δ_g, xδ_g⟫ = x_e − x_e = 0`.
- Conjugate-linearity witness in Mathlib's `WStarAlgebra`: for `N = ℂ` on `H = ℂ`, `N_* = ℂ`, `X`
  is `ℂ` with conjugated scalar action, and the isomorphism `StrongDual ℂ X → ℂ` sends
  `L` to `conj(L(1))`, so `λ·L ↦ conj(λ) · conj(L(1))`.
- Normality on `ℓ∞(ℕ)`: a vector functional `ω_ξ` preserves the supremum `Σ_{n ≤ N} e_n ↑ 1`,
  `Σ |ξ_n|² = ‖ξ‖²`; a Banach limit `φ` on `ℓ∞(ℕ)` is a bounded positive functional with
  `φ(e_n) = 0` for all `n` and `φ(1) = 1`, so it is not completely additive and not normal.
- `H = 0`: `S₁(0) = 0`, `B(0) = 0 = 0*`, `M_* = 0`.

*Needs:* V0.1; V1.1–V1.3; V2.2; OperatorIdeals OI-B29–OI-B41; BanachSpaceTheory B1, B2, B4; Mathlib
`LinearMap.dualEmbedding_surjective`, `LinearMap.rightDualEquiv`, `topDualPairing`, `WeakDual`,
`SeparatingDual.eq_zero_of_forall_dual_eq_zero`, `WStarAlgebra`.

### V4.PositivePredual — positive spanning and the self-adjoint base norm

For every complex W*-algebra `M`, with no trace, separability or sigma-finiteness hypothesis,
prove that every self-adjoint member of `M_*` is a difference of positive members of `M_*`, and
every member of `M_*` is a complex linear combination of four positive normal functionals (Peterson,
Theorem 4.3.3 and Corollary 4.3.4, pp. 62–63; Houdayer, Lemma 3.14, p. 16). On the real self-adjoint
predual prove the exact norm formula

```
‖φ‖ = inf {a(1) + b(1) : a, b ∈ M_*⁺, φ = a − b}.
```

Consume V4.Core's faithful ultraweakly continuous concrete representation inducing the given
predual and its isometric trace-class quotient. Use that quotient norm: for every `ε > 0` lift `φ`
to a trace-class `h` with `‖h‖₁ < ‖φ‖ + ε`, replace `h` by `(h + h*)/2` for self-adjoint `φ`, whose
trace norm is no larger, and restrict the trace-class positive parts `h₊, h₋` of this Hermitian lift
to `M`. Prove these restrictions positive and normal, their difference `φ`, and their masses summing
to `‖h‖₁`. The triangle inequality gives the reverse bound and `ε ↓ 0` the formula; no
norm-attaining lift is presumed. Real and imaginary parts give four positive terms. Include the zero
algebra. This is the general predual result, including type III and mixed algebras.

For every already given bounded positive functional `φ`, prove the equivalence of ultraweak
continuity, preservation of bounded increasing positive nets, and complete orthogonal additivity of
its projection restriction (Houdayer, Theorem 3.13, pp. 15–16; Peterson, Proposition 4.2.2, p. 60;
Jones, Theorem 7.1.3, p. 44). Prove that countable decomposability is equivalent to the existence of
a faithful normal positive functional; for `M ≠ 0` it is equivalent to the existence of a faithful
normal state (Peterson, Proposition 4.5.2, p. 67). For `M = 0` the zero functional supplies the
first equivalence and there is no state. For countable decomposability ⟹ a faithful normal
positive functional, in V4.Core's representation choose a countable maximal orthogonal family of
nonzero cyclic projections `[M'ξ_n] ∈ M`, each `ξ_n` of norm one, and sum strictly positive
summable multiples of their vector functionals; the sum is faithful. Prove the converse using
positivity on nonzero orthogonal projections. On a countably decomposable algebra countable
additivity suffices.

Own the following all-cardinality vector-domination proof (Houdayer, Theorem 3.13, (2) ⇒ (3),
p. 16; Jones, Lemmas 7.1.6–7.1.7, pp. 44–45). In V4.Core's faithful ultraweakly continuous
representation inducing the given predual, for each nonzero projection `q` choose `ξ ∈ qH` with
`‖ξ‖² > φ(q)`. A Zorn-maximal orthogonal family of nonzero `f ≤ q` satisfying `φ(f) ≥ ω_ξ(f)` has
sum `f₀ < q`, by complete additivity. Put `e = q − f₀`. Maximality gives `φ(p) ≤ ω_ξ(p)` for every
projection `p ≤ e`. Spectral-step approximation inside this fixed corner gives `φ(exe) ≤ ω_ξ(exe)`
for `x ≥ 0`. Cauchy–Schwarz gives `|φ(xe)|² ≤ φ(1)‖xeξ‖²`, so Riesz representation expresses
`x ↦ φ(xe)` as a vector coefficient, hence as an element of `M_*`. A maximal orthogonal family of
such `e_i` sums to `1`. For `e_F = Σ_{i ∈ F} e_i` over finite `F`, `φ(· e_F)` lies in `M_*` and

```
‖φ − φ(· e_F)‖ ≤ φ(1)^(1/2) φ(1 − e_F)^(1/2) → 0.
```

The isometric predual is norm closed, so `φ ∈ M_*` and is ultraweakly continuous. Use V4.Core for
the converse normality and complete-additivity implications. Deduce ultraweak continuity iff
preservation of increasing projection nets; the increasing-positive-net condition is the normality
predicate already defined. Spectral-step approximation here is confined to a fixed corner: spectral
projections of an increasing noncommuting positive net need not increase. This existing-functional
theorem has no type `I₂` exclusion or charge-extension input.

- `M_* = span M_*⁺`; `(M_*)_sa = M_*⁺ − M_*⁺` with the base norm formula.
- For bounded positive `φ`: ultraweakly continuous ⟺ normal ⟺ completely additive.
- `M` countably decomposable ⟺ `M` has a faithful normal positive functional.
- A von Neumann algebra with separable predual is countably decomposable: the sum
  `Σ_n 2^(−n) ρ_n` over a dense sequence of normal states is a faithful normal state (Peterson,
  §3.2, p. 48).

**Checks.**
- `h = diag(2, −1)` on `ℂ²`, `φ = Tr(· h)` on `M₂(ℂ)`: `‖φ‖ = ‖h‖₁ = 3 = a(1) + b(1)` for
  `a = 2 Tr(· e₁₁)`, `b = Tr(· e₂₂)`; the decomposition `a' = a + Tr(· e₂₂)`, `b' = 2 Tr(· e₂₂)`
  also has difference `φ` but `a'(1) + b'(1) = 5 > 3`, so the infimum is needed.
- The Banach limit on `ℓ∞(ℕ)` (V4.Core) is a bounded positive functional that is not completely
  additive (`φ(Σ e_n) = 1 ≠ 0 = Σ φ(e_n)`), hence by the criterion not ultraweakly continuous.
- `ℓ∞(ℕ)` is countably decomposable with faithful normal state `x ↦ Σ_n 2^(−n−1) x_n`; `ℓ∞(I)` for
  uncountable `I` has no faithful normal state, since a normal state is `Σ_i c_i` with countably many
  `c_i > 0`.
- Vector domination on `M₂(ℂ)` with `φ = tr/2`, `q = 1`, `ξ = √2 e₁`: `‖ξ‖² = 2 > φ(1) = 1`;
  a rank-one projection `f` onto a unit vector `w` has `φ(f) = 1/2` and `ω_ξ(f) = 2|w₁|²`, so
  `φ(f) ≥ ω_ξ(f)` iff `|w₁|² ≤ 1/4`, and `φ(1) = 1 < ω_ξ(1) = 2`; one maximal family is `{e₂₂}`,
  giving `f₀ = e₂₂`, `e = e₁₁`, and `φ(x e₁₁) = x₁₁/2 = ⟪e₁/2, x e₁⟫`, a vector coefficient.
- `M = 0`: `M_* = 0`, the zero functional is faithful and normal, and there is no state.

*Needs:* V0.1; V2.1–V2.2; V4.Core; OperatorIdeals OI-B29–OI-B31.

### V4.Normality — consequences of the positive criterion

Consume V4.Core and V4.PositivePredual. Identify `M_*` with the complex linear span of bounded
positive normal functionals; use the criterion once for the hard normal-to-ultraweak direction.
Derive ultraweak continuity iff normality for positive maps and star homomorphisms by composition
with positive target predual functionals and their separation (Houdayer, Theorem 3.15, pp. 16–17;
Peterson, Corollary 4.2.4, p. 61). Consume V4.Core's faithfulness predicate; own the tracial
predicate (`τ(xy) = τ(yx)`), its closure properties, support projections `s(φ)` of normal positive
functionals (Peterson, §4.3, p. 61) and the normal restriction APIs. Prove that a normal
representation has von Neumann image (Houdayer, Corollary 3.17, p. 17; Jones, Corollary 7.1.8,
p. 45), the normal quotient and corner behaviour, and that a normal positive functional on a concrete
algebra is a countable sum of vector functionals with square-summable vectors (Jones, Theorem 7.1.3
(3), p. 44; Houdayer, Proposition 2.8, p. 8). Derive normal GNS (Peterson, Corollary 4.2.3, p. 61),
cyclic-vector uniqueness, the concrete vector-state GNS identification for `φ(a) = a₁₁` on `M_n(ℂ)`
with its defining representation on `ℂⁿ`, faithful-state separating vectors, and cyclicity for `M`
iff separation for `M'` (Peterson, Proposition 2.8.1, p. 36; Jones, Proposition 6.2.3, p. 41):
define `IsCyclicVector M ξ` as density of the orbit `Mξ` and `IsSeparatingVector M ξ` as
`xξ = 0 ⟹ x = 0` for `x ∈ M`, with no separability or nonzero hypothesis, and prove
`isCyclicVector_iff_isSeparatingVector_commutant`. Prove that normal faithful representations
preserve the intrinsic predual. Include positive-functional domination and the Radon–Nikodym
operator in the commutant for a dominated vector functional: `ψ ≤ ω_ξ` on `M` gives `s ∈ M'` with
`0 ≤ s ≤ 1` and `ψ = ω_{sξ}` (Jones, Lemma 7.1.4, p. 44; Peterson, Proposition 4.1.8, p. 58). Prove
that state-preserving automorphisms are canonically unitarily implementable in the GNS
representation, by the uniqueness of V0.2. Prove that every normal star homomorphism
`π : M → B(K)` is represented by amplification, a reducing projection and a spatial identification
of its image, with kernel a central summand `Mz` (Jones, Theorem 7.2.1, p. 46; Peterson, Theorem
4.5.1, p. 66; Houdayer, Corollary 3.17, p. 17).

- `IsCyclicVector M ξ ⟺ IsSeparatingVector M' ξ`; for abelian `M`, cyclic implies separating
  (Peterson, Corollary 2.8.2, p. 36).
- A normal star homomorphism has ultraweakly closed image and kernel `Mz` for a central projection `z`.
- A star isomorphism between von Neumann algebras is normal and ultraweakly continuous.

**Checks.**
- `M = M₂(ℂ)` on `ℂ²`, `ξ = e₁`: `Mξ = ℂ²`, so `ξ` is cyclic, and separating for `M' = ℂ`; it is not
  separating for `M` since `e₂₂ e₁ = 0`, so cyclic and separating are different predicates.
- `M` the diagonal algebra `D` on `ℂ²`, `ξ = e₁ + e₂`: `Dξ = ℂ²`, cyclic, and separating for
  `D' = D`; `ξ = e₁` is neither cyclic for `D` nor separating for `D' = D` (`e₂₂ e₁ = 0`).
- `H = 0`: `ξ = 0` is cyclic (the orbit `{0}` is dense in `0`) and separating for the zero algebra.
- GNS of `φ(a) = a₁₁` on `M_n(ℂ)`: the null space is the matrices with zero first column, the GNS
  space is `ℂⁿ` and `π_φ` is the defining representation; for `tr/n` the GNS space has dimension `n²`.
- Radon–Nikodym: `M = ℂ` on `ℂ`, `ξ = 1`, `ψ = ½ ω_ξ`: `s = 1/√2 ∈ M' = ℂ` and `ψ = ω_{sξ}`.

*Needs:* V0.2; V1.3; V2.2–V2.4; V4.Core; V4.PositivePredual.

### V4.0.Fields — Hilbert and operator fields

For standard σ-finite measure spaces `(X, μ)` construct measurable fields of separable Hilbert
spaces `x ↦ H_x` from countable fundamental sequences of sections, measurable sections,
square-integrable sections modulo almost-everywhere equality, and their complete direct-integral
Hilbert space `∫^⊕ H_x dμ(x)` (Dixmier, Part II, Chapter 1, §§1–4, uncertified; Takesaki I,
Chapter IV, §8, uncertified). If every member of one fundamental family is measurable for another,
prove that the two families define the same measurable sections, the same square-integrable sections
and the same direct integral, by measurable Gram–Schmidt on the first family and expansion of the
coefficients of the second in the resulting orthonormal sections. Construct measurable essentially
bounded operator fields `x ↦ T_x ∈ B(H_x)`, taken modulo almost-everywhere equality, and prove the
decomposable-operator criterion: a bounded operator on the direct integral commutes with the diagonal
algebra `L∞(X, μ)` iff it is the direct integral of a measurable essentially bounded field. Identify
essentially bounded operator fields with decomposable operators as an isometric star-algebra
isomorphism, with `‖∫^⊕ T_x‖ = ess sup ‖T_x‖`. For two fields over the same base, prove that a
bounded map between their direct integrals intertwines the diagonal `L∞` actions iff it is induced
by a measurable essentially bounded field of maps `H_x → K_x`; derive this from the one-space result
on their direct sum and its off-diagonal corner. Prove that the decomposable map is unitary iff its
fibre maps are unitary almost everywhere; prove the composition, adjoint and change-of-measure laws.
For equivalent σ-finite measures `μ, ν` on the same standard base construct the onto field unitary
`f ↦ √(dμ/dν) f` from the `μ`-direct integral to the `ν`-direct integral, with its inverse, chain law
and diagonal-intertwining formulas. If `μ ≪ λ`, put the transported fibre equal to zero where
`dμ/dλ = 0`; the same formula gives an onto unitary from the `μ`-direct integral to that
zero-extended `λ`-field. Prove measurability, the inverse on positive-density fibres and
independence of density versions. Prove all of these by measurable Gram–Schmidt on fundamental
sections, scalar integration and Hilbert completion; this sublayer has no projection-valued measure,
normal-operator or central-decomposition input.

- `∫^⊕ H_x dμ(x)` is a complete inner product space; the constant field with fibre `K` gives
  `L²(X, μ; K) = L²(X, μ) ⊗̂ K`.
- Decomposable operators form a von Neumann algebra, the commutant of the diagonal algebra, and
  the diagonal algebra is its centre when the fibres are nonzero almost everywhere.
- Change of measure is a unitary intertwining the diagonal actions and the decomposable operators.

**Checks.**
- Constant fibre `ℂ` over `([0,1], λ)`: the direct integral is `L²[0,1]`, the diagonal algebra is
  `L∞[0,1]`, and the decomposable operators are again `L∞[0,1]`, agreeing with the maximal abelian
  theorem of V2.5; a definition of decomposable operators that produced all of `B(L²[0,1])` would
  contradict it.
- `X` a point with fibre `K`: the direct integral is `K`, the diagonal algebra is `ℂ`, the
  decomposable operators are `B(K)`.
- Fundamental families over `([0,1], λ)` with fibre `ℂ`: `{1}` and `{t ↦ e^{it}}` are each
  measurable for the other and give the same sections; the section equal to `1` on a non-measurable
  set and `0` elsewhere is not measurable for either.
- Change of measure with `μ = 2λ`, `ν = λ` on `[0,1]`: `f ↦ √2 f` has `‖√2 f‖²_ν = 2∫|f|² dλ = ∫|f|² dμ`;
  the reciprocal factor `1/√2` would halve norms and is not unitary.
- Zero extension with `μ = λ|_{[0,1/2]} ≪ λ`: `dμ/dλ = 1_{[0,1/2]}`, the transported fibre vanishes
  on `(1/2, 1]`, and the unitary is `L²([0,1/2]) → L²([0,1]; zero-extended field)`.
- The field of maps `T_t = 1` for `t ≤ 1/2` and `T_t = 0` otherwise, over `([0,1], λ)` with fibre
  `ℂ`, is decomposable and not unitary, and its fibre maps fail to be unitary on a set of positive
  measure, as the criterion requires.

*Needs:* V1.1–V1.3; V2.4 (`L²(X, μ) ⊗̂ K`); V2.5 (`L∞` as multiplication operators); Mathlib
`MeasureTheory.Lp`, `MeasureTheory.Measure.rnDeriv`.

### Examples

`B(H)` with predual `S₁(H)`; `ℓ∞(ℕ)` with predual `ℓ¹(ℕ)` and the Banach limit as a non-normal
state; `L∞[0,1]` as the diagonal algebra of the constant field over `[0,1]`, with `L²[0,1]` as its
direct integral.

### Dependencies

V0–V2; OperatorTheory/OperatorIdeals OI-B29–OI-B41; BanachSpaceTheory B1, B2, B4; Mathlib's
`WStarAlgebra`, the dual-pairing declarations named in the supplier contract, `MeasureTheory.Lp` and
`MeasureTheory.Measure.rnDeriv`.

## Downstream consumers

- OperatorTheory/SelfAdjointSpectralTheory SA-B85 consumes V4.0.Fields' measurable fields, direct
  integrals, decomposable maps, fibrewise unitarity and change of measure; SA-B86 consumes it through
  SA-B85.
- FreeProbability consumes V0–V4 (GNS, operator topologies, bicommutants, normal representations and
  the completed Hilbert tensor product of V2.4).
- TypeAHeckeAlgebras consumes V1's bounded Kaplansky density and V2.4's Hilbert tensor products.
- OperatorAlgebraDynamics consumes V0–V4's states, GNS, operator topologies and normal
  representations, and V4.0.Fields' measurable fields and decomposable operators.
- QuantumGroups consumes V1's finite-dimensional bicommutant theorem; NoncommutativeGeometry
  consumes V0's representations and V4's cyclicity and normal functionals.
- The Part II roadmap of this one consumes every layer, and owns spectral representation on direct
  integrals, central decomposition, types II and III, traces, group algebras, modular theory and
  classification.

## References

- C. Houdayer, *An invitation to von Neumann algebras*, lecture notes of a graduate course,
  Université Paris-Sud, 2017, author's page.
- J. Peterson, *Notes on von Neumann algebras*, Vanderbilt University lecture notes, 2013,
  author's page.
- V. F. R. Jones, *Von Neumann algebras*, lecture notes, 2009, author's page.
- J. Dixmier, *Von Neumann algebras*, North-Holland Mathematical Library 27, 1981, Part II,
  Chapters 1–2 (uncertified: cited by locator).
- M. Takesaki, *Theory of Operator Algebras I*, Springer, 1979, Chapter IV, §8 (uncertified: cited
  by locator).
