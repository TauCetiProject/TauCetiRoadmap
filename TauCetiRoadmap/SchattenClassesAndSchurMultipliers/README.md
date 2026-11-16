# Roadmap: Schatten classes and Schur multipliers

**Summary.** Build Schur multipliers on the Schatten classes of `L²(Ω, μ)` for a σ-finite measure
space `(Ω, μ)`, on top of the Schatten classes `S_p` of OperatorTheory/OperatorIdeals, the
noncommutative `Lᵖ` theory of NoncommutativeIntegration and the Hilbert–Schmidt kernels of
AutomorphicSpectralTheory. The construction runs from the Schatten scale with its compact endpoint
and completely bounded maps defined by amplification (Layer 1), through the kernel description of
Hilbert–Schmidt operators (Layer 2), to the multiplier `S_M(A) = T_{M·k_A}` of a symbol
`M ∈ L^∞(Ω × Ω)`, its `S_p` and completely bounded norms (Layers 3–5). The end theorems are:

- `M ↦ S_M` is an isometric unital `*`-homomorphism `L^∞(Ω × Ω) → B(S₂)`; the `S_p` and the
  completely bounded norms are unchanged under `p ↦ p'` and under transposition of the symbol,
  are log-convex in `1/p`, and are nondecreasing in `|1/p − 1/2|`;
- the Schur product theorem for finite index sets, with `‖S_M‖_p = ‖S_M‖_{cb,p} = max_j M(j, j)`
  for every positive semidefinite `M` and every `1 ≤ p ≤ ∞`;
- the Grothendieck–Haagerup characterisation: for σ-finite `(Ω, μ)` and `p ∈ {1, ∞}`, the norm and
  the completely bounded norm of `S_M` equal the infimum of `‖ξ‖_∞ ‖η‖_∞` over measurable
  factorisations `M(x, y) = ⟨ξ(x), η(y)⟩` through `ℓ²(ℕ)`, equivalently over factorisations
  through all separable Hilbert spaces at once;
- Lafforgue–de la Salle: on an atomless σ-finite measure space the norm and the completely
  bounded norm of every Schur multiplier on `S_p` agree, for every `1 ≤ p ≤ ∞`; for a continuous
  symbol and a σ-finite Radon measure the norm is the supremum of the norms of the finite matrix
  restrictions to the support;
- Fourier–Schur transference on `ℝⁿ`: for every `m ∈ L^∞(ℝⁿ)` and `1 ≤ p ≤ ∞` the
  completely bounded norm of the Toeplitz multiplier with symbol `m(x − y)` on `S_p(L²(ℝⁿ))` equals
  the completely bounded norm of the Fourier multiplier `T_m` on `Lᵖ(ℝⁿ)`;
- the Hörmander–Mikhlin–Schur theorem of Conde-Alonso, González-Pérez, Parcet and Tablate: for
  `n ≥ 1`, `1 < p < ∞` and a symbol `M` of class `C^{⌊n/2⌋+1}` off the diagonal of `ℝⁿ × ℝⁿ` with
  `|||M|||_{HMS} < ∞`, `‖S_M‖_{S_p → S_p} = ‖S_M‖_{cb, S_p → S_p} ≤ C_n (p²/(p − 1)) |||M|||_{HMS}`,
  through the matrix BMO space of `B(L²(ℝⁿ))` and its interpolation with `S₂`.

[Suggested.lean](Suggested.lean) states these end theorems at the pinned libraries, with the
Schur multiplier norm written through kernels (Conventions), except the multiplicativity and
`*`-compatibility of `M ↦ S_M`, whose statement needs the map `A ↦ S_M(A)` and hence the kernel of
a Hilbert–Schmidt operator on an arbitrary σ-finite space, which Layer 2 builds; its docstring
records this.

## Scope and ownership

This roadmap owns:

- the compact endpoint `S_∞(H)` of the Schatten scale (compact operators with the operator norm),
  the extended Schatten gauge on bounded operators, the norming of `S_p` by finite-rank operators
  under the trace pairing, and Riesz–Thorin interpolation for maps defined on finite-rank
  operators with the compact endpoint (Layer 1);
- completely bounded maps on Schatten classes defined by matrix amplification, with their
  composition, duality, interpolation and stabilisation laws and their agreement at `p = ∞` with
  the completely bounded maps of CStarAlgebras C3.2 (Layer 1), and completely bounded norms of
  Fourier multipliers on `Lᵖ(ℝⁿ)` through `Lᵖ(ℝⁿ; S_p^k)`, with the identification of
  `Lᵖ(ℝⁿ; S_p^k)` as the tracial `Lᵖ` of `L^∞(ℝⁿ) ⊗̄ M_k` for Lebesgue measure (Layer 9);
- the kernel `k_A ∈ L²(μ ⊗ ν)` of a Hilbert–Schmidt operator `A : L²(ν) → L²(μ)` (surjectivity of
  the kernel map onto `S₂`), the kernel calculus (adjoint, composition, multiplication operators,
  transposition) and the transformation of kernels under change of measure, measure-preserving
  isomorphisms and passage to a sub-σ-algebra, and, for the `L^∞` conditional expectation of
  BochnerSpaces §7.4, the `𝒜`-measurability of its values, its positivity and its tower law
  (carried over from the `L¹` projection by the adjoint formula), its agreement with
  `MeasureTheory.condExp` on integrable functions, the uniqueness in its pairing characterisation,
  its invariance under `𝒜`-measurable densities, its commutation with complex conjugation and its
  module property against `MeasureTheory.condExpL2` (Layer 2);
- Schur multipliers on `L²(Ω, μ)` for σ-finite `(Ω, μ)`: the multiplier on `S₂`, its norms on
  `S_p`, its unique bounded extension, its completely bounded norm by amplified symbols, the finite
  (Hadamard) case, and their invariances (Layer 3); duality and interpolation (Layer 4);
  conditional expectations of symbols and martingale limits (Layer 5); positive symbols and the
  Grothendieck–Haagerup characterisation (Layer 6); the atomless theorem (Layer 7); continuous
  symbols (Layer 8);
- Toeplitz symbols on `ℝⁿ`, the Følner compressions of convolution operators and Fourier–Schur
  transference on `ℝⁿ` (Layer 9);
- operator-valued column and row BMO seminorms of functions on `ℝⁿ` and on the torus `𝕋ⁿ`, the
  matrix BMO seminorm on `S₂(L²(ℝⁿ))`, its periodisation and its interpolation inequality with
  `S₂` (Layer 10); twisted Fourier multipliers, the Hörmander–Mikhlin–Schur norm and theorem
  (Layer 11).

It leaves to named roadmaps, and consumes from them by section:

- **OperatorTheory/OperatorIdeals** owns approximation numbers (Part A), the Schatten families
  `S_p` for `1 ≤ p < ∞` with their gauges, inclusions and completeness, the trace-class and
  Hilbert–Schmidt families (Part B) and the Hilbert–Schmidt column model (Part C). Its `p = ∞`
  family (OI-B80) is all of `B(H)`; the compact endpoint used by the sources is a different
  object and is defined here.
- **VonNeumannAlgebras** owns the canonical trace on the trace class with cyclicity and the
  Hilbert–Schmidt pairing (V4.Core), the completed Hilbert tensor product `H ⊗̂ L` of two Hilbert
  spaces (V2), the tensor identification `L²(μ) ⊗̂ L²(ν) ≅ L²(μ ⊗ ν)` (V2.RectangularL2) and the
  Hilbert-space ultraproduct of a sequence of Hilbert spaces (V13b).
- **NoncommutativeIntegration** owns the identification of `Lᵖ(B(H), Tr)` with `S_p` (its §1.5),
  density of finite-trace-support elements (its §1.3), Hölder's inequality (its §1.4), `Lᵖ`–`L^q`
  duality and cyclicity of the trace pairing (its §2.1), the complex method with regularisation
  (its §2.3), the interpolation of semifinite `Lᵖ` couples (its §2.5), noncommutative Riesz–Thorin
  (its §2.6), the isometric identification of the tracial `Lᵖ` of a semifinite trace with the
  Haagerup `Lᵖ` (its §3.5) and the Bochner identification `Lᵖ(Ω; Lᵖ(N)) = Lᵖ(L^∞(Ω) ⊗̄ N)` for a
  probability space (its §4.4); the case of Lebesgue measure on `ℝⁿ` with a matrix fibre `M_k`,
  which Layer 9 uses, is §9.2 here. The semifinite martingale BMO space and its interpolation
  inequality with the sharp order `O(p)` are requested of NoncommutativeIntegration, Part II (gap
  `semifinite-martingale-bmo-interpolation`).
- **AutomorphicSpectralTheory** owns the kernel operator `T_k` of an `L²` kernel with
  `kernel_apply`, `kernel_unique` and `kernel_norm` (its §0.8), and states for the trace of
  VonNeumannAlgebras V4.Core the basis formula `Tr(BC) = Σ_j ⟨B* e_j, C e_j⟩` for
  Hilbert–Schmidt `B`, `C` (AutomorphicSpectralTheory §0.9); every trace in this roadmap, whether
  reached through V4.Core or through AutomorphicSpectralTheory §0.9, is therefore the one
  functional of V4.Core. Its §0.8 is stated for standard Borel spaces; the arbitrary σ-finite
  version that Layers 2, 5 and 7 need (sub-σ-algebras of a standard Borel space are not standard
  Borel) is requested of AutomorphicSpectralTheory §0.8
  (gap `sigma-finite-hilbert-schmidt-kernels`). Its trace formula
  `Tr(T₁T₂) = ∫∫ K₁(x, y)K₂(y, x)` (its §0.10) is stated on one space at the generality of its
  §0.8; §2.2 here proves it for two arbitrary σ-finite spaces from the kernel isometry and the
  adjoint kernel.
- **CStarAlgebras** owns the C*-algebra of compact operators (C1.6) and completely bounded maps of
  operator spaces with Smith's lemma (C3.2); Layer 1 compares its amplification norm at `p = ∞`
  with C3.2.
- **BanachSpaceTheory** owns the Bochner density, for a finite measure, of a vector measure of
  finite variation, absolutely continuous to it, with values in a reflexive Banach space (B4.0),
  which gives the Radon–Nikodým representation of bounded maps `L¹(μ) → K` used here in §6.4.
- **OperatorTheory/UnboundedOperators** treats integral operators with measurable kernels on
  `L²(ℝ)`, with their maximal and absolute-pairing domains, conjugate-transpose adjoints and
  composition (its §5.1, UO-E01). Layer 2 here is a different statement and consumes nothing of it:
  bounded operators with square-integrable kernels between arbitrary σ-finite measure spaces.
- **PDE** owns the scalar harmonic analysis of `ℝⁿ`: Riesz–Thorin interpolation (its §2.2), the
  Mihlin–Hörmander multiplier theorem (its §2.3), the space `BMO(ℝⁿ)` with the John–Nirenberg
  inequality (its §2.4) and the dyadic partition with the Bernstein and Littlewood–Paley estimates
  (its §7.1). This roadmap consumes none of it. The column and row seminorms of §10.1 take the
  operator norm of the average `⨍_Q |f − f_Q|²` of operator squares, a different seminorm from
  `sup_B ⨍_B |f − f_B|`; §11.2 bounds the Littlewood–Paley pieces of a symbol with only `σ_n`
  derivatives uniformly in a parameter `x`, which the estimates for a single smooth symbol do not
  give; and the scalar Mihlin–Hörmander bound used in the Checks of §11.5 is Tau Ceti's.
- **BochnerSpaces** owns the scalar conditional expectation on `L^∞` for a measure whose trim to
  the sub-σ-algebra is σ-finite, defined as the adjoint of the `L¹` projection `E₁`, with its
  adjoint formula, its contractivity and its agreement with `MeasureTheory.condExpL2` on
  `L^∞ ∩ L²`, together with the positivity, idempotence, tower law and agreement with
  `MeasureTheory.condExp` of `E₁` (its §7.4), the divisibility of atomless finite measures (its
  §7.5), and the Fubini isometry `Lᵖ(μ ⊗ ν; X) ≅ Lᵖ(μ; Lᵖ(ν; X))` for σ-finite `μ`, `ν` (its §4.2).
  Here §2.5 proves the further properties of that expectation which Layers 5–7 use, among them
  the `𝒜`-measurability of its values, its positivity and its tower law, carried over from `E₁` by
  the adjoint formula; §7.1 applies BochnerSpaces §7.5 to the restriction of an atomless measure
  to a set of finite measure; §11.3 uses BochnerSpaces §4.2 at `p = 2`. Mathlib's
  `MeasureTheory.condExp` is `0` on every non-integrable function and gives this expectation only
  on integrable functions; the
  normal expectation of NoncommutativeIntegration §4.3 lives on that roadmap's own `Lᵖ` carriers
  of von Neumann algebras.

Already in the pinned libraries and consumed directly: Mathlib's matrix Schur product theorem
`Matrix.PosSemidef.hadamard`, the Hadamard three-lines theorem, the `L²` Fourier transform
`MeasureTheory.Lp.fourierTransformₗᵢ`, conditional expectations of integrable functions and of `L²`
classes, and Lévy's upward theorem; Tau Ceti's Schatten, trace-class and Hilbert–Schmidt families,
its `L²` Fourier multiplier with `L^∞` symbols, its Littlewood–Paley pieces and its measure atoms
(Exact supplier contracts).

Outside this roadmap: Schatten classes for `0 < p < 1` (NoncommutativeIntegration §1.5);
noncommutative `Lᵖ` of general von Neumann algebras; Fourier multipliers on group von Neumann
algebras of non-abelian or non-Euclidean groups, including the transference theorems of
Neuwirth–Ricard for discrete amenable groups and of Caspers–de la Salle for amenable locally
compact groups beyond `ℝⁿ`; approximation properties of groups by Schur multipliers
(Lafforgue–de la Salle §2 onwards); Hardy-space Toeplitz operators (OperatorTheory/ToeplitzOperators,
a different object from the Toeplitz symbols `m(x − y)` here); double operator integrals and
operator-Lipschitz functions; the Sobolev form of the Hörmander–Mikhlin–Schur theorem
(Conde-Alonso–González-Pérez–Parcet–Tablate, Theorem A′) and its corollaries for divided
differences, which belong to SchattenClassesAndSchurMultipliers, Part II (Downstream consumers).

## Conventions

- **Scalars and inner products.** Hilbert spaces are complex; the inner product `⟨·, ·⟩` is
  conjugate-linear in the first slot (Mathlib). `B(H)` is `H →L[ℂ] H`. A rank-one operator is
  `u ⊗ v* : g ↦ ⟨v, g⟩ u`.
- **Measure spaces.** `(Ω, μ)` is σ-finite; `L²(Ω, μ)` is Mathlib's `MeasureTheory.Lp ℂ 2 μ`, the
  product measure is `μ.prod μ` (written `μ ⊗ μ`), and `L^∞(Ω × Ω)` is
  `MeasureTheory.Lp ℂ ∞ (μ.prod μ)`. Symbols are almost-everywhere classes. Finite index sets carry
  counting measure. The zero measure is allowed: then every space is zero and every norm is `0`.
- **Kernels and matrices.** The kernel convention is `(T_k g)(x) = ∫ k(x, y) g(y) dμ(y)`: the first
  variable is the row. Witness: on `{1, 2}` with counting measure the kernel `1_{(1,2)}` is the
  matrix unit `E₁₂`, which sends `δ₂` to `δ₁`; the opposite convention would give `E₂₁`.
- **Schur multipliers.** `S_M(A) = T_{M · k_A}` for `A ∈ S₂`. Witness: on `{1, 2}`,
  `M = [[1, 2], [3, 4]]` sends `[[a, b], [c, d]]` to `[[a, 2b], [3c, 4d]]`.
- **Three operations on symbols.** `M^t(x, y) = M(y, x)`, `M̄(x, y) = conj M(x, y)` and
  `M̃(x, y) = conj M(y, x)`. The Hilbert-space adjoint of `S_M` on `S₂` is `S_{M̄}`; the identity
  `S_M(A)* = S_{M̃}(A*)` is a different statement. Witness: for `M = 1_{(1,2)}` on `{1, 2}`,
  `S_M(E₁₂) = E₁₂`, the adjoint of `S_M` for the Hilbert–Schmidt inner product is `S_M` itself
  (`M̄ = M`), while `S_{M̃}(E₁₂) = 0`.
- **Transposition.** `J` is complex conjugation on `L²(Ω, μ)` and `A^T = J A* J`, a linear map
  with kernel `k_A(y, x)`. Witness: `(i E₁₂)^T = i E₂₁`, while `(i E₁₂)* = −i E₂₁`.
- **Trace pairing.** Duality is the bilinear pairing `⟨A, B⟩ = Tr(AB)`, never `Tr(A*B)`. Witness:
  `Tr(E₁₂ E₂₁) = 1 = Σ_{x,y} k_{E₁₂}(x, y) k_{E₂₁}(y, x)`, while `Tr(E₁₂* E₂₁) = 0`.
- **Exponents.** `p ∈ [1, ∞]` (an element of `ℝ≥0∞`), `p'` its conjugate with `1/p + 1/p' = 1`.
  `S_∞(H)` is the space of compact operators with the operator norm, not `B(H)`. Norms of
  multipliers and extended Schatten gauges take values in `[0, ∞]`. Witness: the identity of
  `ℓ²(ℕ)` lies in OperatorIdeals' `p = ∞` family with gauge `1` but has extended gauge `∞` here,
  because it is not compact.
- **Completely bounded norms.** Defined by amplification: for a symbol `M` on `Ω`, the amplified
  symbol on `Ω × {1, …, m}` (with `μ ⊗` counting measure) is `M_m(x, i, y, j) = M(x, y)`, and
  `‖S_M‖_{cb,p} = sup_m ‖S_{M_m}‖_p`. Witness (§1.4): the transpose map on `M₂` has norm `1` and
  completely bounded norm `2` at `p = ∞`, and completely bounded norm `1` at `p = 2`.
- **Fourier transform.** Mathlib's `𝓕 f(ξ) = ∫ e^{−2πi⟨x, ξ⟩} f(x) dx` on `ℝⁿ` (the Euclidean space
  `EuclideanSpace ℝ (Fin n)` with Lebesgue measure); the Fourier multiplier with symbol
  `m ∈ L^∞(ℝⁿ)` is `T_m f = 𝓕⁻¹(m · 𝓕 f)`, Tau Ceti's `MeasureTheory.Lp.fourierMultiplierCLM`.
  Witness: for `m(ξ) = e^{2πi⟨a, ξ⟩}`, `T_m f = f(· + a)`.
- **Toeplitz symbols.** `M_m(x, y) = m(x − y)` on `ℝⁿ × ℝⁿ`, the additive form of the
  Caspers–de la Salle symbol `φ(s t⁻¹)`.
- **Matrix BMO.** `U_z` is multiplication by `e^{2πi⟨z, x⟩}` on `L²(ℝⁿ)` and `π(A)(z) = U_z A U_z*`,
  with kernel `e^{2πi⟨z, x − y⟩} k_A(x, y)`. Cubes are axis-parallel; averages `⨍_Q` are
  normalised by Lebesgue measure. A cube of the torus `𝕋ⁿ` is the image of a cube of `ℝⁿ` of side
  at most `1` and may wrap around (Layer 10).
- **The HMS norm.** `σ_n = ⌊n/2⌋ + 1`; derivatives in `x` and in `y` are Fréchet derivatives
  (Mathlib `iteratedFDeriv`) with their operator norms; the multi-index form of the sources is
  equivalent up to a factor depending only on `n`, absorbed in `C_n`.
- **Atoms.** An atom is Tau Ceti's `MeasureTheory.Measure.IsAtom`: a measurable set of positive
  measure all of whose measurable subsets have measure `0` or full measure. A measure without
  atoms is called atomless. Mathlib's `MeasureTheory.NullSingletonClass` (singletons are null)
  is weaker and is never used as the hypothesis. Witness: the countable–cocountable measure on an
  uncountable set has null singletons and is itself an atom.
- **Radon measures.** On a locally compact Hausdorff space with its Borel σ-algebra, a σ-finite
  Radon measure is a σ-finite measure with `MeasureTheory.IsFiniteMeasureOnCompacts` and
  `MeasureTheory.Measure.InnerRegularCompactLTTop`; its support is
  `MeasureTheory.Measure.support`.
- **Section references.** A bare section number such as §2.3 is a section of this roadmap. A
  section of another roadmap is written with that roadmap's name (NoncommutativeIntegration §2.3,
  or "its §2.3" directly after the name); the one exception is the key of a bullet under a
  heading "From TauCetiRoadmap.X" of the supplier contracts, which is a section of X. Witness:
  §2.3 is transposition, while NoncommutativeIntegration §2.3 is the complex method that §1.3
  applies.
- **The statements of `Suggested.lean`.** An exponent is `p : ℝ≥0∞` with `Fact (1 ≤ p)`, as for
  Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm.schatten`, and conjugate exponents are
  `ENNReal.HolderConjugate`. A symbol is a function `M : Ω × Ω → ℂ` with
  `MemLp M ∞ (μ.prod μ)`; the multiplier norms and `‖M‖_H` depend only on its class (§3.3,
  §3.5, §6.2), while the HMS norm of §11.1 is defined through derivatives of the function. The
  Schur multiplier norm is written through kernels, so that the kernel map of §2.1 is not
  constructed: `IsKernelOperator` (§2.1) says that an operator is the integral operator of a kernel, and
  `schurNorm` (§3.3) takes the supremum of `‖B‖_p` over pairs of integral operators `A`, `B` with
  kernels `k ∈ L²(μ ⊗ μ)` and `M · k` and with `‖A‖_p ≤ 1`. By §2.1 every Hilbert–Schmidt operator
  is such an `A`, for a unique class `k`, so this is the norm `‖S_M‖_p` of §1.4 and §3.3.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Lp`, `MeasureTheory.Measure.prod`, `MeasureTheory.SigmaFinite`,
  `MeasureTheory.Measure.rnDeriv`, `MeasureTheory.MeasurePreserving`: the `Lᵖ` spaces, product
  measures, Radon–Nikodým derivatives and measure-preserving maps of the conventions.
- `MeasureTheory.lpMeas` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/AEMeasurable.lean`)
  and `MeasureTheory.condExpL2` (`…/ConditionalExpectation/CondexpL2.lean`): the closed subspace of
  `𝒜`-measurable classes and the orthogonal projection onto it, defined with no σ-finiteness
  hypothesis; `MeasureTheory.condExp` (`…/ConditionalExpectation/Basic.lean`): the conditional
  expectation of an integrable function when `μ` is σ-finite on the sub-σ-algebra. It is `0`
  on every non-integrable function (`MeasureTheory.condExp_of_not_integrable`): on `ℕ` with
  counting measure the conditional expectation of the constant `1` onto the full σ-algebra is
  `0`. It is therefore used only on integrable functions, in particular on bounded functions of a
  finite measure (§2.5, §5.3, §6.4); §2.4 uses `MeasureTheory.condExpL2` for kernels, and bounded
  functions of a measure that is only σ-finite on the sub-σ-algebra take the `L^∞` conditional
  expectation of BochnerSpaces §7.4 (§2.5).
- `MeasureTheory.condExp_indicator` (`…/ConditionalExpectation/Indicator.lean`): for an integrable
  `f` and a set `A ∈ 𝒜`, the conditional expectation of `1_A f` is `1_A` times that of `f`;
  `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'` (`…/ConditionalExpectation/Basic.lean`): when `μ`
  is σ-finite on `𝒜`, `MeasureTheory.condExpL2` and `MeasureTheory.condExp` agree on functions
  that are integrable and square-integrable (§2.5).
- `MeasureTheory.exists_pos_lintegral_lt_of_sigmaFinite`
  (`Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean`) and `MeasureTheory.lintegral_trim`:
  an everywhere positive measurable function of finite integral for a σ-finite measure, and
  integrals of `𝒜`-measurable functions for the trimmed measure (§2.5);
  `LinearMap.IsSymmetric.eigenvectorBasis` (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean`):
  an orthonormal eigenbasis of a symmetric operator on a finite-dimensional space (§1.2).
- `MeasureTheory.Integrable.tendsto_ae_condExp` (`Mathlib/Probability/Martingale/Convergence.lean`):
  Lévy's upward theorem, almost-everywhere convergence of `E[g | ℱ_n]` to `g`, for a real-valued
  integrable `g` on a finite measure space (`IsFiniteMeasure μ`), a filtration `ℱ` indexed by `ℕ`
  (`MeasureTheory.Filtration ℕ`) and `g` strongly measurable for `⨆ n, ℱ n`. §5.3 and §6.4 apply it
  after the reduction to a finite measure (§3.7), on `μ ⊗ μ` along the sequence `𝓑_n ⊗ 𝓑_n`,
  whose supremum is `𝒜₀ ⊗ 𝒜₀`, to the real and imaginary parts of a complex symbol;
  `ContinuousLinearMap.comp_condExp_comm`
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`) with `Complex.reCLM` and
  `Complex.imCLM` makes the conditional expectation commute with taking those parts.
- `IsCompactOperator` and `compactOperator` (`Mathlib/Analysis/Normed/Operator/Compact/Basic.lean`):
  compactness and the submodule of compact operators; `ContinuousLinearMap.adjoint`.
- `Matrix.hadamard` (`Mathlib/LinearAlgebra/Matrix/Hadamard.lean`), `Matrix.PosSemidef.hadamard`
  and `Matrix.PosSemidef.kronecker` (`Mathlib/Analysis/Matrix/Order.lean`): the Hadamard product,
  positivity of Hadamard and Kronecker products of positive semidefinite matrices.
- `CompletelyPositiveMap` (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean`): completely
  positive maps between C*-algebras; `CStarMatrix` for matrix levels.
- `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`
  (`Mathlib/Analysis/Complex/Hadamard.lean`): the three-lines theorem.
- `MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean`): the Fourier
  transform on `L²(ℝⁿ; F)` as a linear isometric equivalence (Plancherel), for every complex
  Hilbert space `F`. `fourier_gaussian_innerProductSpace`
  (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`): on a finite-dimensional
  real inner product space `V` and for `Re b > 0`, the Fourier transform of `v ↦ e^{−b‖v‖²}` is
  `w ↦ (π/b)^{dim V/2} e^{−π²‖w‖²/b}`; with `b = π/T²` this is `𝓕γ_T = Tⁿ γ_{1/T}` for the
  Gaussian `γ_T` of width `T` (§9.4).
- `MeasureTheory.Measure.support` (`Mathlib/MeasureTheory/Measure/Support.lean`): the support of a
  measure, closed, conull under inner regularity; `MeasureTheory.IsFiniteMeasureOnCompacts`,
  `MeasureTheory.Measure.InnerRegularCompactLTTop`.
- `MeasurableSet.exists_isCompact_lt_add` and `IsCompact.exists_isOpen_lt_add`
  (`Mathlib/MeasureTheory/Measure/Regular.lean`): under `InnerRegularCompactLTTop`, a measurable
  set of finite measure contains compact sets of measure arbitrarily close to its own; if moreover
  the measure is locally finite, the space is R₁ (for instance Hausdorff) and the σ-algebra is
  Borel, a compact set lies in open sets of measure arbitrarily close to its own.
  `exists_continuousMap_one_of_isCompact_subset_isOpen` (`Mathlib/Topology/UrysohnsLemma.lean`):
  on an R₁ locally compact space, for compact `K` inside open `V` a continuous `φ` with values in
  `[0, 1]`, equal to `1` on `K`, with compact support inside `V`. §8.2 combines the three into the
  density of continuous compactly supported functions in `L²(μ)` for a σ-finite Radon measure on
  a locally compact Hausdorff space.
- `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`
  (`Mathlib/MeasureTheory/Function/ContinuousMapDense.lean`): density of continuous compactly
  supported functions in `ℒᵖ(μ)` for `p ≠ ∞`, under `NormalSpace`, `R1Space`,
  `WeaklyLocallyCompactSpace` and `μ.Regular` (the last holds for a finite Radon measure on a
  Hausdorff space with its Borel σ-algebra). A locally compact Hausdorff space need not be
  normal, so this covers only the normal (for instance second-countable) case of §8.2.
- `WithLp` (`Mathlib/Analysis/Normed/Lp/WithLp.lean`) with `PiLp.innerProductSpace`
  (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`): `WithLp 2 (Fin m → H)` is the Hilbert sum `H^m`
  of `m` copies of `H`, with inner product `Σ_i ⟨x_i, y_i⟩`; the bare type synonym carries no norm
  (§1.4).
- `MeasureTheory.integral_prod` (`Mathlib/MeasureTheory/Integral/Prod.lean`): Fubini's theorem, the
  integral of a `μ.prod ν`-integrable function equals the iterated integral, for s-finite `μ` and
  `ν` (`MeasureTheory.SFinite`, implied by σ-finiteness) (§2.1, §2.2, §6.4).
  `MeasureTheory.Measure.measure_prod_null` (`Mathlib/MeasureTheory/Measure/Prod.lean`): for
  s-finite `ν`, a measurable set is `μ.prod ν`-null exactly when `μ`-almost all of its sections are
  `ν`-null; so the diagonal of `ℝⁿ × ℝⁿ`, whose sections are points, is null for Lebesgue measure
  when `n ≥ 1` (§10.2).
- `MeasureTheory.hasSum_integral_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`): dominated convergence for series,
  `Σ_n ∫ F_n = ∫ f` when `Σ_n F_n = f` almost everywhere, each `F_n` is almost everywhere strongly
  measurable and `‖F_n‖ ≤ b_n` with `Σ_n b_n` summable almost everywhere and integrable (§6.4).
- `ContinuousLinearMap.compLp` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`): the class
  `x ↦ L(f(x))` of `Lᵖ(μ; F)` for `f ∈ Lᵖ(μ; E)` and a bounded linear `L : E → F`, of norm at most
  `‖L‖ ‖f‖`; composing with a unitary and with its inverse gives an isometric isomorphism of the
  `L²` spaces (§11.3).
- `MeasureTheory.Measure.withDensity` (`Mathlib/MeasureTheory/Measure/WithDensity.lean`): the
  measure `w · μ` with `(w · μ)(A) = ∫⁻_A w dμ` for measurable `A` and `w : Ω → [0, ∞]` (§2.5).
- `Matrix.toEuclideanCLM` (`Mathlib/Analysis/CStarAlgebra/Matrix.lean`): the star-algebra
  isomorphism between `Matrix ι ι ℂ` and the bounded operators on `EuclideanSpace ℂ ι` given by the
  standard orthonormal basis; `Matrix.kroneckerMap` (`Mathlib/LinearAlgebra/Matrix/Kronecker.lean`):
  the Kronecker product `(A ⊗ B)_{(i,k),(j,l)} = f(A_{ij}, B_{kl})`; `Matrix.transpose`
  (`Mathlib/LinearAlgebra/Matrix/Defs.lean`) (§2.3, §3.4, §3.5); `Matrix.toEuclideanLin`
  (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`): the linear equivalence between
  `Matrix (Fin k) (Fin k) ℂ` and the linear maps of `EuclideanSpace ℂ (Fin k)`, through which a
  matrix gets its Schatten norm `‖·‖_{S_p^k}` (§9.2).
- `lp` (`Mathlib/Analysis/Normed/Lp/lpSpace.lean`) with its inner product at exponent `2`
  (`Mathlib/Analysis/InnerProductSpace/l2Space.lean`): the Hilbert space `ℓ²(ℕ)` (§6.2) and the
  Hilbert sum `ℓ²(β; H)` of copies of a Hilbert space `H` (§1.4).
- `geometric_hahn_banach_point_closed` (`Mathlib/Analysis/LocallyConvex/Separation.lean`): in a real
  locally convex topological vector space, a point outside a closed convex set is strictly
  separated from it by a continuous real-linear functional (§6.3, applied to a finite-dimensional
  real space).
- `ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable`
  (`Mathlib/Analysis/Calculus/BumpFunction/Convolution.lean`): on a finite-dimensional real normed
  space with an additive Haar measure, for normalised smooth bumps `φ_i` whose outer radius tends
  to `0` with outer radius at most a fixed multiple of the inner radius, `φ_i ⋆ g → g` almost
  everywhere for every locally integrable `g` with values in a complete real normed space (§9.5).
- `volume_euclideanSpace_eq_dirac` (`Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`):
  for an empty finite index type `ι`, the volume of `EuclideanSpace ℝ ι` is the point mass at `0`
  (the case `n = 0` of §9.5).
- `MeasureTheory.NullSingletonClass`: null singletons (used only in a Check).
- `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.nullSingletonClass_gaussianReal` and
  `ProbabilityTheory.gaussianReal_zero_var` (`Mathlib/Probability/Distributions/Gaussian/Real.lean`):
  the real Gaussian measure of mean `m` and variance `v`, with null singletons for `v ≠ 0` and equal
  to the point mass `δ_m` for `v = 0` (used only in the examples of Layer 7).
- `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`
  (`Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean`): the Stone–Weierstrass theorem for a
  star subalgebra of `C(K, ℂ)` separating the points of a compact space `K`;
  `exists_continuous_zero_one_of_isClosed` (`Mathlib/Topology/UrysohnsLemma.lean`): Urysohn's lemma
  in a normal space, which a compact Hausdorff space is
  (`NormalSpace.of_compactSpace_r1Space`). §8.1 and §8.2 combine them into the measurability of
  continuous functions on `K × K` for the product of the Borel σ-algebras. That product can be
  strictly smaller than the Borel σ-algebra of `X × X` when `X` is not second countable: Mathlib's
  `Prod.opensMeasurableSpace` (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean`) needs
  one factor second countable.
- `UnitAddTorus`: the torus `𝕋ⁿ = Fin n → UnitAddCircle` with its Haar probability measure.
- `iteratedFDeriv`, `ContDiffOn`, `MeasureTheory.eLpNorm`, `MeasureTheory.AEStronglyMeasurable`,
  `MeasureTheory.Measure.count` and `essSup` (`Mathlib/MeasureTheory/Function/EssSup.lean`);
  `ENNReal.HolderConjugate` (`Mathlib/Basic/ENNReal/Holder.lean`): exponents with
  `p⁻¹ + q⁻¹ = 1` in `ℝ≥0∞`.

Mathlib has no Schatten class, no trace on infinite-dimensional operators, no Schur multiplier
beyond the Hadamard product of matrices, no completely bounded map on Schatten classes, no
atomless measure (its `NoAtoms` is a deprecated alias of `NullSingletonClass`, and the docstring
of `Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean` notes that atomlessness is
strictly stronger), no operator-valued BMO and no Fourier multiplier with an `L^∞` symbol: its
`SchwartzMap.fourierMultiplierCLM` and `TemperedDistribution.fourierMultiplierCLM`
(`Mathlib/Analysis/Distribution/FourierMultiplier.lean`) act on Schwartz functions and tempered
distributions and assume a symbol of temperate growth.

### From Tau Ceti

- `TauCeti.OperatorIdealFamily.schatten`, `TauCeti.OperatorIdealFamily.gauge_schatten`,
  `TauCeti.OperatorIdealFamily.gauge_schatten_le_of_le`,
  `TauCeti.OperatorIdealFamily.finiteSubmodule_schatten_le_of_le`,
  `TauCeti.OperatorIdealFamily.lowerSemicontinuous_gauge_schatten` and
  `TauCeti.OperatorIdealFamily.schatten_isComplete`
  (`TauCeti/Analysis/OperatorIdeal/Family/Schatten.lean`): for real `p ≥ 1`, the Schatten family
  with gauge `(Σ' aₙ(T)^p)^{1/p}` in `ℝ≥0∞`, its monotonicity in `p`, the inclusions of the finite
  gauge submodules, lower semicontinuity of the gauge for the operator norm, and completeness.
  The gauge is defined for every bounded map between complete Hilbert spaces; it is not
  restricted to compact operators. The family takes a real exponent `p` together with a proof of
  `1 ≤ p`, so the extended gauge of §1.1 uses it at `p.toReal` for `p ∈ [1, ∞)`.
- `TauCeti.OperatorIdealFamily.traceClass` and `TauCeti.OperatorIdealFamily.schatten_one`
  (`…/Family/TraceClass.lean`); `TauCeti.OperatorIdealFamily.hilbertSchmidt` and
  `TauCeti.OperatorIdealFamily.schatten_two` (`…/Family/HilbertSchmidt.lean`): the endpoints
  `p = 1, 2`.
- `ContinuousLinearMap.singularValue` (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean`):
  the zero-indexed approximation numbers.
- `TauCeti.UnitarilyInvariantSeminorm.schatten`
  (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Schatten.lean`): the Schatten
  `p`-seminorm on linear maps between finite-dimensional inner product spaces, for
  `p ∈ [1, ∞]` with `Fact (1 ≤ p)`, used for the matrix levels `S_p^k`.
- `Matrix.frobeniusInnerProductSpace` (`TauCeti/Analysis/Matrix/Frobenius.lean`): the Frobenius
  inner product `⟨A, B⟩ = Σ_{i,j} conj A_{ij} B_{ij} = Tr(A* B)` on `Matrix (Fin k) (Fin k) ℂ`,
  compatible with Mathlib's Frobenius norm and available through
  `open scoped Matrix.Norms.Frobenius`; with it the matrices are the Hilbert space `S₂^k` on which
  §9.2 lets Fourier multipliers act.
- `MeasureTheory.Lp.fourierMultiplierCLM`, `MeasureTheory.Lp.norm_fourierMultiplierCLM_le`,
  `MeasureTheory.Lp.fourierMultiplierCLM_compL_fourierMultiplierCLM`,
  `MeasureTheory.Lp.adjoint_fourierMultiplierCLM` and
  `MeasureTheory.Lp.tendsto_fourierMultiplierCLM_apply` (`TauCeti/Analysis/Fourier/L2Multiplier.lean`):
  the Fourier multiplier `𝓕⁻¹(m · 𝓕 f)` on `L²(E; F)` for `m ∈ L^∞(E)` and a complex Hilbert space
  `F`, with norm at most `‖m‖_∞`, multiplicativity in the symbol, adjoint `T_{m̄}` and strong
  continuity under boundedly almost-everywhere convergent symbols.
- `TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`
  (`TauCeti/Analysis/Fourier/MihlinHormander.lean`): the Mihlin–Hörmander theorem for symbols
  smooth off the origin with Hilbert-space-valued functions (Checks of §11.5).
- `ContDiffBump.littlewoodPaleyPiece` and `ContDiffBump.exists_norm_iteratedFDeriv_littlewoodPaleyPiece_le`
  (`TauCeti/Analysis/Distribution/SchwartzSpace/LittlewoodPaley.lean`): the Littlewood–Paley pieces
  of a symbol smooth off the origin with their scale-invariant derivative bounds. The pieces
  require a symbol smooth off the origin; §11.2 proves the bounds for symbols of class `C^{σ_n}`.
- `MeasureTheory.Measure.IsAtom` (`TauCeti/MeasureTheory/Measure/Atom.lean`): measurable, positive
  measure, every measurable subset null or of full measure.
- `MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton`
  (`TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean`): Sierpiński's theorem on a
  standard Borel space under null singletons; §7.1 takes the version for an arbitrary measurable
  space under the atomless hypothesis from BochnerSpaces §7.5 and compares the two.

Tau Ceti has no compact endpoint of the Schatten scale, no operator trace on infinite-dimensional
spaces, no kernel theorem, no Schur multiplier and no operator-valued BMO. Its bounded mean
oscillation estimates (`TauCeti/MeasureTheory/Integral/CalderonZygmund/BoundedMeanOscillation.lean`)
average the norm `⨍_Q ‖f − f_Q‖` of a Banach-valued function; the column seminorm of §10.1 takes
the operator norm of the average `⨍_Q |f − f_Q|²` of operator squares, a different seminorm.

### From TauCetiRoadmap.OperatorTheory

OperatorIdeals: OI-A23 (finite rank implies vanishing approximation numbers), OI-A25–OI-A29
(finite-rank approximability and compactness on Hilbert targets), OI-A30 (adjoint invariance),
OI-A38–OI-A40 (localisation of approximation numbers on finite-dimensional subspaces, used for
lower semicontinuity under strongly convergent compressions), OI-B29–OI-B41 (trace class,
Hilbert–Schmidt energy, norm and family), OI-B76–OI-B88 (Schatten gauges and inclusions) and
OI-C01–OI-C14 (column model, finite-rank truncations, Hilbert–Schmidt implies compact). Each is
assumed for arbitrary complex Hilbert spaces, as Tau Ceti implements it.

### From TauCetiRoadmap.VonNeumannAlgebras

- V4.Core: the canonical trace `Tr` on the trace class with `|Tr(X)| ≤ ‖X‖₁`, cyclicity
  `Tr(XY) = Tr(YX)` for trace-class products and Hilbert–Schmidt pairs, the rank-one formulas
  `Tr(u ⊗ v*) = ⟨v, u⟩` and `‖u ⊗ v*‖₁ = ‖u‖‖v‖`.
- V2 (completed Hilbert tensor products): for complex Hilbert spaces `H` and `L`, the completed
  tensor product `H ⊗̂ L`, the completion of `H ⊗[ℂ] L` for the inner product with
  `⟨h ⊗ l, h' ⊗ l'⟩ = ⟨h, h'⟩ ⟨l, l'⟩`, in which the elementary tensors span a dense subspace;
  used for the stabilisation of §1.4, which identifies `H ⊗̂ L` with the Hilbert sum `ℓ²(β; H)`
  along a Hilbert basis `(e_β)` of `L`, and `H ⊗̂ ℂ^m` with `H^m`.
- V2.RectangularL2: the unitary `L²(μ) ⊗̂ L²(ν) ≅ L²(μ ⊗ ν)` sending `f ⊗ g` to `f(x)g(y)`, which
  for σ-finite measures uses `μ.prod ν`; used for `L²(Ω × Ω, 𝒜 ⊗ 𝒜, μ ⊗ μ) = L²(𝒜) ⊗̂ L²(𝒜)` in
  §2.4, for the amplified spaces `L²(Ω × Fin m)` of §3.5 and for
  `L²(Ω × Ω') ≅ L²(Ω) ⊗̂ L²(Ω')` in §3.6.
- V13b (§13.2): the Hilbert-space ultraproduct `∏_𝒰 H_n` of a sequence of Hilbert spaces along an
  ultrafilter `𝒰` on `ℕ`, the quotient of the bounded sequences by those with `lim_𝒰 ‖x_n‖ = 0`,
  built there in the route of the uniqueness of the injective factor of type III₁ with separable
  predual, where its quotient inner product, its completeness and its coordinate norm are proved.
  §6.4 uses it for a non-principal `𝒰` and states the three facts it consumes.

### From TauCetiRoadmap.NoncommutativeIntegration

- §1.3: the tracial `Lᵖ(M, τ)` of a semifinite trace for finite `p`, complete, and the density in it
  of the bounded elements of finite-trace support; on `B(H)` these are the finite-rank operators,
  and on the algebra `L^∞(ℝⁿ; F_k)` of §9.2 the bounded functions vanishing off a set of finite
  measure.
- §1.4 with §1.5: Hölder's inequality `‖XY‖_r ≤ ‖X‖_p ‖Y‖_q` on `B(H)` with the trace.
- §1.5: `Lᵖ(B(H), Tr) = S_p(H)` isometrically for `1 ≤ p < ∞`; the commutative identification
  `Lᵖ(L^∞(Ω), ∫) = Lᵖ(Ω)`.
- §2.1: `L^{p'}(M, τ) = Lᵖ(M, τ)*` isometrically for `1 ≤ p < ∞` under `(X, Y) ↦ τ(XY)`, and
  cyclicity `τ(XY) = τ(YX)`. Nothing else of §2.1 is consumed: the norming element of a nonzero
  finite-rank `X` with polar decomposition `X = u|X|` is constructed in §1.2 here, as
  `|X|^{p−1}u*/‖X‖_p^{p−1}` (`u*` at `p = 1`), whose pairing with `X` is
  `Tr(|X|^p u*u)/‖X‖_p^{p−1} = ‖X‖_p`. The product in the other order does not norm: for
  `X = E₁₂` in `M₂`, `u = E₁₂` and `|X| = E₂₂`, so `u*|X| = E₂₁E₂₂ = 0`, while
  `|X|u* = E₂₂E₂₁ = E₂₁` and `Tr(X E₂₁) = 1 = ‖X‖₂`.
- §2.3: the complex method, the operator estimate `‖T‖_θ ≤ ‖T‖₀^{1−θ}‖T‖₁^θ`, and regularisation
  (each endpoint may be replaced by the closure of the intersection in it).
- §2.5: `[L^{p₀}(M, τ), L^{p₁}(M, τ)]_θ = L^{p_θ}(M, τ)` isometrically, with `L^∞ = M`.
- §2.6: noncommutative Riesz–Thorin for a linear map between the sums of two semifinite `Lᵖ`
  couples, the source and target algebras possibly different (used with `L^∞(ℝⁿ)` on one side and
  `B(L²(F))` on the other in §9.3).
- §3.5: for a semifinite trace `τ` on `M`, the tracial `Lᵖ(M, τ)` of NoncommutativeIntegration
  §1.3 is the weight-independent Haagerup `Lᵖ(M)` of NoncommutativeIntegration Layer 3,
  isometrically.
- §4.4: `Lᵖ(Ω; Lᵖ(N)) = Lᵖ(L^∞(Ω) ⊗̄ N)` for a probability space and `1 ≤ p < ∞`, with the norm
  `(∫ ‖f(ω)‖_p^p dP)^{1/p}`, stated for the Haagerup spaces and the product weight. Read through
  NoncommutativeIntegration §3.5 and §1.5, it gives for `N = B(L²(ℝⁿ))` with `Tr` and the Haar
  probability measure of `𝕋ⁿ` the norm `(∫_{𝕋ⁿ} ‖f(s)‖_p^p ds)^{1/p}` on the tracial `Lᵖ` of
  `L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ))` for the trace `∫ ⊗ Tr`, the space in which the martingale contract below
  is stated (§10.3, §10.4).

What NoncommutativeIntegration must provide (gap:semifinite-martingale-bmo-interpolation): in a
Part II extending its §7.3 and §8.4 to semifinite operator-valued filtrations, the column, row
and two-sided martingale BMO norms on `L²(𝓜) ∩ 𝓜` for `𝓜 = L^∞(Ω) ⊗̄ N` and the interpolation
inequality between them and `L²(𝓜)` with an absolute constant of order `p`, as follows.

- **Semifinite martingale BMO interpolation.** Let `(N, τ_N)` be a semifinite von Neumann algebra,
  `(Ω, 𝓕, P)` a probability space with a filtration `(𝓕_k)_{k ≥ 0}`, `𝓕₀` trivial, generating `𝓕`,
  `𝓜 = L^∞(Ω) ⊗̄ N` with the trace `∫ ⊗ τ_N`, `E_k = E[· | 𝓕_k] ⊗ id_N` and `E_{−1} = 0`. For `f`
  in `L²(𝓜) ∩ 𝓜` put `‖f‖_{BMO_c} = sup_{k ≥ 0} ‖E_k |f − E_{k−1} f|²‖^{1/2}`,
  `‖f‖_{BMO_r} = ‖f*‖_{BMO_c}` and `‖f‖_{BMO} = max(‖f‖_{BMO_c}, ‖f‖_{BMO_r})`. There is an
  absolute constant `C` such that for every `2 ≤ p < ∞` and every function
  `Ψ(z) = Σ_j e^{δ z² + λ_j z} f_j` on the closed strip `0 ≤ Re z ≤ 1` (finitely many
  `f_j ∈ L²(𝓜) ∩ 𝓜` with `E₀ f_j = 0`, `δ ≥ 0`, `λ_j ∈ ℝ`),
  `‖Ψ(2/p)‖_{Lᵖ(𝓜)} ≤ C p · max(sup_t ‖Ψ(it)‖_{BMO}, sup_t ‖Ψ(1 + it)‖_{L²(𝓜)})`.
  This is the inclusion `[BMO(𝓜), L²_0(𝓜)]_{2/p} ⊆ Lᵖ_0(𝓜)` with constant `O(p)`
  (Conde-Alonso–González-Pérez–Parcet–Tablate, Lemma 1.4, cgpt-2023 lines 471–484, for the dyadic
  filtration of `𝕋ⁿ` and `N = B(L²(ℝⁿ))`; Mei, Lemma 6.1, mei-2007 line 3218, for semifinite
  operator-valued dyadic filtrations with equivalent norms; Musat, musat-2003 Theorem 3.1, as cited
  in mei-2007 lines 3229–3230; the growth `O(p)` comes from the order `O(1/(q − 1))` of the
  noncommutative Burkholder–Gundy constant as `q → 1`, Jiao–Randrianantoanina–Wu–Zhou, jrwz-2020,
  as cited in cgpt-2023 lines 483–484). §10.4 uses the case of the
  dyadic filtration of `𝕋ⁿ` and `N = B(L²(ℝⁿ))`.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- §0.8: for square-integrable `K ∈ L²(X × Y)`, the integral operator `T_K : L²(Y) → L²(X)`,
  `kernel_apply` (`T_K f(x) = ∫ K(x, y) f(y) dν(y)` almost everywhere), `kernel_unique` (a
  linear embedding of `L²(X × Y)` into the bounded operators, isometric for the Hilbert–Schmidt
  norm) and `kernel_norm`
  (`‖T_K‖_{HS} = ‖K‖₂`).
- §0.9: for the trace `Tr` of VonNeumannAlgebras V4.Core (AutomorphicSpectralTheory §0.9
  defines no second trace), the absolutely convergent basis formula
  `Tr(BC) = Σ_j ⟨B* e_j, C e_j⟩` for every Hilbert basis `(e_j)` and `‖BC‖₁ ≤ ‖B‖_HS ‖C‖_HS` for
  Hilbert–Schmidt `B, C`, on arbitrary complex Hilbert spaces.

What AutomorphicSpectralTheory must provide (gap:sigma-finite-hilbert-schmidt-kernels): its §0.8
for arbitrary σ-finite measure spaces `(X, μ)` and `(Y, ν)`, with no standard Borel or
separability hypothesis on the measurable spaces or on `L²`: the integral operator
`T_K : L²(Y, ν) → L²(X, μ)` of every `K ∈ L²(μ ⊗ ν)` with `kernel_apply`, and `K ↦ T_K` a linear
embedding into the bounded operators with `‖T_K‖_HS = ‖K‖₂` (`kernel_unique`, `kernel_norm`).
The trace formula is not part of the request: §2.2 here derives it from AutomorphicSpectralTheory
§0.8, §0.9 and the adjoint kernel. A route that needs no countable orthonormal basis is the
composite of VonNeumannAlgebras V2.RectangularL2 with the unitary
`S₂(L²(ν), L²(μ)) ≅ L²(μ) ⊗̂ conj(L²(ν))` of V4.Core, identified with the integral formula on
rank-one kernels and extended by continuity.

### From TauCetiRoadmap.CStarAlgebras

- C1.6: the compact operators `K(H)` as a C*-algebra. The matrix levels `M_m(K(H)) = K(H^m)`
  are identified in §1.4: an operator on `H^m` is compact exactly when each of its `m²` blocks is.
- C3.2: the completely bounded norm `‖u‖_cb = sup_n ‖u_n‖` of a linear map between operator
  spaces, with matrix levels `CStarMatrix`.

### From TauCetiRoadmap.BanachSpaceTheory

- B4.0: for a reflexive real Banach space `Y` (a complex one through its underlying real space),
  a finite positive measure `μ` and a vector measure `m` with values in `Y`, of finite variation
  `|m|` with `|m| ≪ μ`, an integrable Bochner density `h` with `m = μ.withDensityᵥ h` and
  `|m|(s) = ∫_s ‖h‖ dμ` for every measurable `s`. If moreover `|m|(s) ≤ C μ(s)` for every
  measurable `s`, the variation formula gives `‖h‖ ≤ C` almost everywhere. Applied to
  `m(s) = a(1_s)` it represents a bounded linear `a : L¹(μ) → K` into a Hilbert space as
  `u ↦ ∫ u h dμ` with `‖h‖_{L^∞(μ; K)} = ‖a‖` (§6.4).

### From TauCetiRoadmap.BochnerSpaces

- §7.4: for σ-algebras `𝒜 ⊆ 𝓑` on `Ω` and a measure `μ` on `𝓑` whose trim `μ.trim h` to `𝒜` is
  σ-finite, with complex scalars: the `L¹` projection `E₁` of `L¹(Ω, 𝓑, μ)` onto the
  `𝒜`-measurable classes (positive, contractive, idempotent with range the `𝒜`-measurable
  classes, satisfying the tower law for nested σ-algebras, equal to `MeasureTheory.condExp` on
  integrable functions), and the linear contraction `φ ↦ E[φ | 𝒜]` of `L^∞(Ω, 𝓑, μ)` defined as
  its adjoint: `∫ E[φ | 𝒜] g dμ = ∫ φ E₁(g) dμ` for every `g ∈ L¹(μ)`; it agrees with
  `MeasureTheory.condExpL2` on `L^∞ ∩ L²`. Nothing else is assumed of `E[· | 𝒜]`: the
  `𝒜`-measurability of its values, its positivity, its tower law and its agreement with
  `MeasureTheory.condExp` on `L^∞ ∩ L¹` are proved in §2.5 from the properties of `E₁` listed
  here.
- §4.2: for σ-finite `μ`, `ν`, `1 ≤ p < ∞` and a Banach space `X`, the isometric isomorphism
  `Lᵖ(μ ⊗ ν; X) ≅ Lᵖ(μ; Lᵖ(ν; X))` with its section formula: the image of `F` is a class whose
  value at `s` has value `F(s, t)` at `t`, for `ν`-almost every `t` and `μ`-almost every `s`. Used at
  `p = 2`, `X = ℂ` in §11.3, with `μ` Lebesgue measure on `ℝⁿ_z` and `ν` Lebesgue measure on
  `ℝⁿ_x × ℝⁿ_y`.
- §7.5: for a finite atomless measure `ν`, a measurable set `A` and `0 ≤ t ≤ 1`, a measurable
  `B ⊆ A` with `ν(B) = t ν(A)`. Atomless is read as: no set is an atom in the sense of Tau Ceti's
  `MeasureTheory.Measure.IsAtom`. It is the only reading under which the statement holds: under
  the weaker reading by null singletons it is false, since the countable–cocountable probability
  measure on an uncountable set has null singletons and no set of measure `1/2`.

## How to read the build

Layer 1 completes the Schatten scale with its compact endpoint, proves norming by finite-rank
operators and interpolation with the compact endpoint, and defines completely bounded maps by
amplification. Layer 2 gives every Hilbert–Schmidt operator between `L²` spaces its kernel,
computes kernels of adjoints, products, transposes, multiplication operators, changes of measure
and compressions to sub-σ-algebras, and proves the properties of the `L^∞` conditional expectation
of BochnerSpaces §7.4 that the later layers use, among them the `𝒜`-measurability of its values,
its positivity and tower law, and its module property against the `L²` projection. Layer 3
defines Schur multipliers, their norms, extensions and completely bounded norms, with the finite
case and the invariances. Layer 4 proves
duality and interpolation. Layer 5 studies conditional expectations of symbols and martingale
limits. Layer 6 proves the Schur product theorem and the Grothendieck–Haagerup characterisation,
first for finite index sets and then for σ-finite spaces. Layer 7 proves that norm and completely
bounded norm agree on atomless spaces; Layer 8 treats continuous symbols on Radon measure spaces.
Layer 9 proves Fourier–Schur transference on `ℝⁿ`. Layer 10 builds the operator-valued and matrix
BMO seminorms and the interpolation inequality between matrix BMO and `S₂`; Layer 11 proves the
Hörmander–Mikhlin–Schur theorem.

Layers 1 and 2 can be built at once, except that §2.3 and §2.4 use §1.1 and §1.4. Layer 3 needs
Layers 1 and 2; Layer 4 needs Layers 1–3; Layer 5 needs Layers 2 and 3. Layer 6 needs Layers 1–5
(§6.1–6.3 need only Layers 1, 3 and 4). Layer 7 needs Layers 2, 3 and 5. Layer 8 needs
Layers 1, 3 and 5. Layer 9 needs Layers 1, 2 (§2.1, §2.2), 3, 4 and 8. Layer 10 needs Layers 1,
2 (§2.1) and 3. Layer 11 needs Layers 2, 3, 4, 7 and 10.

## Layer 1: the Schatten scale with its compact endpoint

Throughout this layer `H`, `K` are complex Hilbert spaces.

### 1.1 The Schatten scale and the extended gauge

Define, for `1 ≤ p < ∞`, the Schatten class `S_p(H)` as the finite-gauge submodule of Tau Ceti's
`TauCeti.OperatorIdealFamily.schatten ℂ p hp` (with `hp : 1 ≤ p`) on `H →L[ℂ] H` with its gauge
norm `‖A‖_p = (Σ' aₙ(A)^p)^{1/p}`, and define `S_∞(H)` as Mathlib's `compactOperator` submodule
with the operator norm (lafforgue-delasalle-2011 lines 174–179; cgpt-2023 lines 209–214;
simon-trace-ideals-2005 Ch. 2; gohberg-krein-1969 Ch. III). Define the extended gauge
`‖X‖_p ∈ [0, ∞]` of a bounded `X` (Lean `schattenGauge`, for `p : ℝ≥0∞` with `Fact (1 ≤ p)`): the
Schatten gauge at the real exponent `p.toReal` for `p < ∞`, and for `p = ∞` the operator norm when
`X` is compact and `∞` otherwise. The same definitions apply to bounded maps `H → K`.

- For `1 ≤ p ≤ q ≤ ∞` and every bounded `X`, `‖X‖_q ≤ ‖X‖_p`; hence `S_p ⊆ S_q` contractively. For
  `p < ∞` this is `TauCeti.OperatorIdealFamily.gauge_schatten_le_of_le` and, at `q = ∞`,
  compactness of operators whose approximation numbers tend to `0` (OI-A25–OI-A27) with
  `a₀(X) = ‖X‖` (OI-A12).
- Finite-rank operators lie in every `S_p` (OI-A23) and are dense in `S_p` for `p < ∞`
  (NoncommutativeIntegration §1.3 through §1.5) and in `S_∞` (OI-A28–OI-A29).
- `‖X*‖_p = ‖X‖_p` (OI-A30), `‖V X W‖_p ≤ ‖V‖ ‖X‖_p ‖W‖` for bounded `V`, `W`, and
  `‖U X U*‖_p = ‖X‖_p` for an isometry `U`.
- `X ↦ ‖X‖_p` is lower semicontinuous for the operator norm
  (`TauCeti.OperatorIdealFamily.lowerSemicontinuous_gauge_schatten`; at `p = ∞` because the compact
  operators are norm closed), and `S_p(H)` is complete
  (`TauCeti.OperatorIdealFamily.schatten_isComplete`; at `p = ∞` closedness of the compact
  operators).
- Compression bound: if finite-rank orthogonal projections `P_α` increase strongly to the
  identity, then for `1 ≤ p < ∞` and every bounded `X`, `‖X‖_p ≤ liminf_α ‖P_α X P_α‖_p`: on a
  finite-dimensional subspace where `‖Xx‖ ≥ r‖x‖`, the compressions eventually satisfy the same
  bound up to `ε`, OI-A38–OI-A40 turn this into `aₙ(X) ≤ liminf_α aₙ(P_α X P_α)` for each `n`, and
  Fatou's lemma for the sums `Σ aₙ^p` concludes. At `p = ∞` only the case `n = 0`,
  `‖X‖ ≤ liminf_α ‖P_α X P_α‖`, survives: the extended-gauge bound holds for compact `X` and fails
  for every non-compact `X`, whose compressions have finite rank and `‖P_α X P_α‖_∞ ≤ ‖X‖`, while
  `‖X‖_∞ = ∞`.

**Checks.**

- On `ℓ²(ℕ)` the diagonal operator `diag(1/(j+1))` has `‖·‖₂² = Σ (j+1)^{−2} = π²/6`, is compact,
  and has `‖·‖₁ = Σ 1/(j+1) = ∞`: it lies in `S₂ ∩ S_∞` and not in `S₁`.
- The identity of `ℓ²(ℕ)` has `aₙ = 1` for every `n`, so `‖1‖_p = ∞` for every `p < ∞`, and
  `‖1‖_∞ = ∞` because it is not compact; on `ℂ^d` with `d ≥ 1` the identity has
  `‖1‖_p = d^{1/p}` and `‖1‖_∞ = 1`, while on `ℂ⁰` it is the zero operator, with every gauge `0`.
  A definition taking `B(H)` as the `p = ∞` endpoint gives `‖1‖_∞ = 1` on `ℓ²(ℕ)`.
- A rank-one orthogonal projection `e` has `a₀(e) = 1` and `aₙ(e) = 0` for `n ≥ 1`, so
  `‖e‖_p = 1` for every `p`; a one-based reading of the approximation numbers would give `0`.
- The compression bound stops at `p < ∞`: for the identity of `ℓ²(ℕ)` and the projections `P_α`
  onto the first `α` coordinates, `‖P_α 1 P_α‖_∞ = ‖P_α‖ = 1` for every `α ≥ 1` (and `0` for
  `P₀ = 0`) while `‖1‖_∞ = ∞`; for `p < ∞` the same compressions have
  `‖P_α‖_p = α^{1/p} → ∞ = ‖1‖_p`, as the bound requires.
- On the zero space every gauge is `0`.

*Needs:* Tau Ceti `TauCeti.OperatorIdealFamily.schatten`, `TauCeti.OperatorIdealFamily.gauge_schatten`,
`TauCeti.OperatorIdealFamily.gauge_schatten_le_of_le`,
`TauCeti.OperatorIdealFamily.lowerSemicontinuous_gauge_schatten`,
`TauCeti.OperatorIdealFamily.schatten_isComplete`; Mathlib `compactOperator`, `IsCompactOperator`;
OperatorIdeals OI-A12, OI-A23, OI-A25–OI-A30, OI-A38–OI-A40; NoncommutativeIntegration §1.3, §1.5.

### 1.2 Norming by finite-rank operators

Prove that for every bounded `X` on `H` and `1 ≤ p < ∞`,
`‖X‖_p = sup { |Tr(X B)| : B of finite rank, ‖B‖_{p'} ≤ 1 }` in `[0, ∞]`, where for `p = 1` the
condition on `B` is `‖B‖ ≤ 1`; and that for every bounded `X`,
`‖X‖ = sup { |Tr(X B)| : B of finite rank, ‖B‖₁ ≤ 1 }`. For `X ∈ S_p` and `1 < p < ∞` the first
formula is the duality `Lᵖ(B(H), Tr) = L^{p'}(B(H), Tr)*` under `(X, Y) ↦ Tr(XY)` of
NoncommutativeIntegration §2.1 (with the finite exponent `p'`), read through its §1.5 and
restricted to the finite-rank operators, which are dense in `S_{p'}` (§1.1); the bilinear trace
duality between `S_p` and `S_{p'}` is recalled in caspers-delasalle-2015 lines 638–642. At
`p = 1`, and for a bounded `X ∉ S_p`, where both sides are `∞`, the formula is this roadmap's. The
finite-rank pairing bound in the form used by §3.3 and §5.2 is lafforgue-delasalle-2011 line 400,
the estimate (9) in the proof of Lemma 1.11. In particular a bounded operator whose pairings with
finite-rank operators are bounded in this way lies in `S_p`.

Route: `≥` by Hölder (NoncommutativeIntegration §1.4 with §1.5) and `|Tr Y| ≤ ‖Y‖₁`
(VonNeumannAlgebras V4.Core). For `≤`, first let `X ≠ 0` map a finite-dimensional subspace `F`
into itself and vanish on `F^⊥`. An orthonormal eigenbasis of `X*X` on `F`
(`LinearMap.IsSymmetric.eigenvectorBasis`) gives `X = Σ_i s_i u_i ⊗ v_i*` over the eigenvalues
`s_i² > 0`, with orthonormal families `(v_i)` and `(u_i) = (s_i⁻¹ X v_i)`; so `X = u|X|` with
`|X| = Σ_i s_i v_i ⊗ v_i*` and the partial isometry `u = Σ_i u_i ⊗ v_i*`. The norming element
`Y = |X|^{p−1}u*/‖X‖_p^{p−1} = Σ_i s_i^{p−1} v_i ⊗ u_i*/‖X‖_p^{p−1}` (`Y = u*` at `p = 1`) has
finite rank, `‖Y‖_{p'} = 1` and `Tr(XY) = Σ_i s_i^p/‖X‖_p^{p−1} = ‖X‖_p`. For a bounded `X` take
finite-rank orthogonal projections `P_α` increasing strongly to `1` and the norming elements `Y_α`
of the compressions `P_α X P_α` (`Y_α = 0` when the compression is `0`); then `Y_α = P_α Y_α P_α`,
so `Tr(X Y_α) = Tr(P_α X P_α Y_α) = ‖P_α X P_α‖_p`, and the compression bound of §1.1, which holds
because `p < ∞`, gives `‖X‖_p ≤ liminf_α ‖P_α X P_α‖_p`, at most the supremum. The operator-norm
formula is the rank-one case: `Tr(X (u ⊗ v*)) = ⟨v, X u⟩` and `‖u ⊗ v*‖₁ = ‖u‖‖v‖` (V4.Core).

On `ℂ²` with `X = E₁₂` and `p = 2`: `u = E₁₂` and `|X| = E₂₂`, and the norming element
`|X|u* = E₂₂E₂₁ = E₂₁` gives `Tr(X E₂₁) = 1 = ‖X‖₂`, while the product in the other order is
`u*|X| = E₂₁E₂₂ = 0`. On `ℓ²(ℕ)` with `X = diag((j + 1)^{−2})` and `p = 1`, the norming element
`u* = 1` of `X` is not compact and not a norm limit of finite-rank operators; the norming elements
`P_d` of the compressions give `Tr(X P_d) = Σ_{j<d} (j + 1)^{−2} → π²/6 = ‖X‖₁`. For `X = 0` both
sides are `0`.

*Needs:* §1.1; VonNeumannAlgebras V4.Core (trace, rank-one formulas); NoncommutativeIntegration
§1.4, §1.5, §2.1; Mathlib `LinearMap.IsSymmetric.eigenvectorBasis`.

### 1.3 Interpolation with the compact endpoint

Let `1 ≤ p₀, p₁ ≤ ∞`, `0 < θ < 1` and `1/p_θ = (1 − θ)/p₀ + θ/p₁`. Let `T` be a linear map from the
finite-rank operators on `H` to the bounded operators on `K` with `‖T A‖_{p_j} ≤ C_j ‖A‖_{p_j}` for
every finite-rank `A` and `j = 0, 1`. Prove that `‖T A‖_{p_θ} ≤ C₀^{1−θ} C₁^θ ‖A‖_{p_θ}` for every
finite-rank `A` (lafforgue-delasalle-2011 lines 246–252; cgpt-2023 line 486 for
`[S_∞, S₂]_{2/p} = S_p`). Route: extend `T` by continuity to `S_{p₀}` and to `S_{p₁}` (§1.1); the
two extensions agree on `S_{p₀} ∩ S_{p₁}`, where finite-rank operators are dense for the maximum
of the two norms (spectral truncation), so `T` is defined on `S_{p₀} + S_{p₁}`. When both
exponents are finite apply NoncommutativeIntegration §2.6. When `p₁ = ∞`, the closure of
`S_{p₀}` in `B(H)` is `S_∞(H)`, so the regularisation of NoncommutativeIntegration §2.3
identifies `[S_{p₀}, S_∞]_θ = [L^{p₀}(B(H)), B(H)]_θ = S_{p_θ}` (NoncommutativeIntegration §2.5
with its §1.5), and the operator estimate of NoncommutativeIntegration §2.3 applies to the regular
couple `(S_{p₀}, S_∞)`.

On `M_n` the map `T(A) = Tr(A) E₁₁` has `C₀ = 1` at `p₀ = 1` and `C₁ = n` at `p₁ = ∞`, attained at
the identity. With `1/p_θ = 1 − θ` the bound is `n^θ = n^{1 − 1/p_θ}`, which is the norm of `T` on
`S_{p_θ}^n` (Hölder, attained at the identity, `‖1‖_{p} = n^{1/p}`). The exponents exchanged,
`C₀^θ C₁^{1−θ} = n^{1/p_θ}`, would give `n^{1/4}` at `p_θ = 4`, below the norm `n^{3/4}`.

*Needs:* §1.1; NoncommutativeIntegration §1.5, §2.3, §2.5, §2.6.

### 1.4 Completely bounded maps on Schatten classes

For a linear map `T : S₂(H) → S₂(K)` and `m ≥ 1`, define the amplification
`T^{(m)} : S₂(H^m) → S₂(K^m)` on block matrices, `[A_{ij}] ↦ [T(A_{ij})]`, where `H^m` is the
Hilbert sum of `m` copies of `H` (`WithLp 2 (Fin m → H)`), so that `S₂(H^m)` is the space of
`m × m` matrices with entries in `S₂(H)`. For `1 ≤ p ≤ ∞` define
`‖T‖_p = sup { ‖T A‖_p : A ∈ S₂(H), ‖A‖_p ≤ 1 } ∈ [0, ∞]` and
`‖T‖_{cb,p} = sup_{m ≥ 1} ‖T^{(m)}‖_p` (lafforgue-delasalle-2011 lines 183–190 and equation (2);
cgpt-2023 lines 217–219). When `‖T‖_p < ∞`, `T` extends uniquely to a bounded map `S_p → S_p`
(`S_∞ → S_∞` at `p = ∞`), by the density of §1.1.

- `‖T^{(1)}‖_p = ‖T‖_p`, and `m ↦ ‖T^{(m)}‖_p` is nondecreasing (compress to a corner); so
  `‖T‖_p ≤ ‖T‖_{cb,p}`.
- For linear `T : S₂(H) → S₂(K)` and `S : S₂(K) → S₂(L)`, read in `[0, ∞]` with `0 · ∞ = 0`:
  `‖S ∘ T‖_{cb,p} ≤ ‖S‖_{cb,p} ‖T‖_{cb,p}` unless `‖S‖_{cb,p} = 0` and `‖T‖_{cb,p} = ∞`, and
  `‖S ∘ T‖_p ≤ ‖S‖_p ‖T‖_p` unless `‖S‖_p = 0` and `‖T‖_p = ∞`. The excluded case needs `p < 2`
  and `‖S‖₂ = ∞`: a map of norm `0` at `p` vanishes on the finite-rank operators, hence on all of
  `S₂` when `p ≥ 2` (every element of `S₂` has finite `p`-norm) or when it is bounded on `S₂`
  (finite-rank operators are dense), and then `S ∘ T = 0`. `‖·‖_{cb,p}` is a seminorm in `[0, ∞]`.
- For bounded `V : H → K` and `W : K → H`, the map `A ↦ V A W : S₂(H) → S₂(K)` has
  `‖·‖_{cb,p} ≤ ‖V‖ ‖W‖`, since its amplification of level `m` is `A ↦ V_m A W_m` with the
  diagonal operators `V_m = V ⊕ ⋯ ⊕ V`, `W_m = W ⊕ ⋯ ⊕ W` of norms `‖V‖`, `‖W‖`; for an isometry
  `U : H → K` the map `A ↦ U A U* : S₂(H) → S₂(K)` is a complete isometry, and
  `B ↦ U* B U : S₂(K) → S₂(H)` a complete contraction left inverse to it.
- Duality: if `T, T^♯ : S₂ → S₂` satisfy `Tr(T(A) B) = Tr(A T^♯(B))` for all `A, B ∈ S₂`, then
  `‖T‖_p = ‖T^♯‖_{p'}` and `‖T‖_{cb,p} = ‖T^♯‖_{cb,p'}`, by §1.2 at every level, since
  `(T^{(m)})^♯ = (T^♯)^{(m)}` for the block trace.
- Interpolation: for `1 ≤ p₀, p₁ ≤ ∞`, `0 < θ < 1` and `1/p_θ = (1 − θ)/p₀ + θ/p₁`, if
  `‖T^{(m)}‖_{p₀}` and `‖T^{(m)}‖_{p₁}` are finite then
  `‖T^{(m)}‖_{p_θ} ≤ ‖T^{(m)}‖_{p₀}^{1−θ} ‖T^{(m)}‖_{p₁}^θ`; and if `‖T‖_{cb,p₀}` and `‖T‖_{cb,p₁}`
  are finite then `‖T‖_{cb,p_θ} ≤ ‖T‖_{cb,p₀}^{1−θ} ‖T‖_{cb,p₁}^θ` (the supremum over `m`). Route:
  §1.3 applied to `T^{(m)}` on the finite-rank operators with `C_j = ‖T^{(m)}‖_{p_j}`; then for
  `A ∈ S₂(H^m)` with `‖A‖_{p_θ} ≤ 1` and `q = max(p₀, p₁) ≥ p_θ`, the spectral truncations `A_k` of
  `A` have finite rank, `‖A_k‖_{p_θ} ≤ ‖A‖_{p_θ}` and `‖A − A_k‖_q → 0`, so
  `‖T^{(m)}(A − A_k)‖_q ≤ ‖T^{(m)}‖_q ‖A − A_k‖_q → 0`, `T^{(m)} A_k → T^{(m)} A` in operator
  norm, and the lower semicontinuity of the gauge (§1.1) concludes.
- Stabilisation: for a Hilbert space `L` of dimension `d` with a Hilbert basis `(e_β)`, the
  completed Hilbert tensor product `H ⊗̂ L` of VonNeumannAlgebras V2 is the Hilbert sum `ℓ²(β; H)`
  (Mathlib `lp`) through `(h_β) ↦ Σ_β h_β ⊗ e_β`, a unitary because the vectors `h ⊗ e_β` with
  distinct `β` are orthogonal, `‖h ⊗ e_β‖ = ‖h‖`, and elementary tensors span a dense subspace; for
  `L = ℂ^m` with its standard basis this is `H ⊗̂ ℂ^m = H^m`. Let `T ⊗ id` act entrywise on the
  block matrices `[A_{βγ}]` of operators on `ℓ²(β; H)`. For finite `d` it is `T^{(d)}` on all of
  `S₂(H ⊗̂ L)` (the zero map of the zero space when `d = 0`). For infinite `d` it is defined on the
  block matrices with finitely many nonzero blocks, and on all of `S₂(H ⊗̂ L)` when `‖T‖₂ < ∞`,
  since then
  `Σ ‖T A_{βγ}‖₂² ≤ ‖T‖₂² ‖A‖₂²`; on either domain its `p`-norm is `‖T‖_{cb,p}`, whatever the
  cardinality of the basis (lafforgue-delasalle-2011 equation (2), line 187). Route: for a finite
  set `F` of basis vectors and `P_F` the projection onto `H ⊗̂ span F` (respectively
  `K ⊗̂ span F`), `P_F (T ⊗ id)(A) P_F = (T ⊗ id)(P_F A P_F)` is an amplification of level `|F|`;
  for finite-rank `B`, `P_F B P_F → B` in `S₁`, so
  `|Tr((T ⊗ id)(A) B)| ≤ ‖T‖_{cb,p} ‖A‖_p ‖B‖_{p'}`, and §1.2 bounds `‖(T ⊗ id)(A)‖_p`; the corner
  embeddings of `S₂(H^m)` give the reverse inequality.
- At `p = ∞`, when `‖T‖_∞ < ∞`, the extension `K(H) → K(K)` of `T` between the C*-algebras of
  compact operators (C1.6; `M_m(K(H)) = K(H^m)`, since an operator on `H^m` is compact exactly
  when each of its blocks is) is completely bounded in the sense of
  CStarAlgebras C3.2, which defines its norm only when the supremum over the levels is finite,
  exactly when `‖T‖_{cb,∞} < ∞`, and then its C3.2 completely bounded norm is `‖T‖_{cb,∞}`.

**Checks.**

- The transpose map `t(A) = Aᵀ` on `M_n = S₂(ℂⁿ)`, `n ≥ 2`: `‖t‖_∞ = 1` (singular values are
  preserved), while at level `n` it sends the flip unitary `[E_{ji}]_{ij}` of norm `1` to
  `[E_{ij}]_{ij}`, which is `n` times a rank-one projection, so `‖t‖_{cb,∞} = n`; a definition of
  the completely bounded norm by the first amplification returns `1`. At `p = 2` every
  amplification of `t` permutes Hilbert–Schmidt coordinates, so `‖t‖_{cb,2} = 1`, and
  `‖t‖_{cb,1} = n` by duality (`t^♯ = t`). On `ℓ²(ℕ)` the transpose `A ↦ J A* J` has
  `‖t‖_∞ = 1` and `‖t‖_{cb,∞} ≥ n` for every `n` (the `n × n` corners), so its extension to
  `K(ℓ²(ℕ))` is bounded and not completely bounded in the sense of C3.2.
- Stabilisation needs `‖T‖₂ < ∞` for infinite `d`: if `‖T‖₂ = ∞`, choose `B_k ∈ S₂(H)` with
  `‖B_k‖₂ ≤ 2^{−k}` and `‖T B_k‖₂ ≥ 1`; the block-diagonal `A` with blocks `B_k` lies in
  `S₂(H ⊗̂ ℓ²(ℕ)) = S₂(ℓ²(ℕ; H))`, while `[T(A_{βγ})]` has `Σ ‖T B_k‖₂² = ∞` and is not
  Hilbert–Schmidt.
- Interpolation needs finite endpoint norms: on `S₂(ℓ²(ℕ))` let `w₀ = diag(1/(j+1))`, which lies
  in `S_{4/3}` (`Σ (j+1)^{−4/3} < ∞`) and not in `S₁`, and let `T` be the linear map that fixes `w₀`
  and is `0` on `S₁` and on an algebraic complement of `S₁ ⊕ ℂw₀` in `S₂`. Then `‖T‖₁ = 0`;
  `‖T‖₂ = ∞`, since `T ≠ 0` vanishes on the dense subspace `S₁` of `S₂` and so is not bounded; and
  `‖T‖_{4/3} ≥ ‖T w₀‖_{4/3}/‖w₀‖_{4/3} = 1`. With `p₀ = 1`, `p₁ = 2`, `θ = 1/2` (so `p_θ = 4/3`)
  the bound read in `[0, ∞]` would give `1 ≤ 0^{1/2} ∞^{1/2} = 0`; the interpolation law asserts
  nothing here because `‖T‖₂ = ∞`.
- Composition needs its exclusion: at `p = 1`, with `T` the map of the previous Check
  (`‖T‖_{cb,1} = 0`, since every block of an element of `S₁(H^m)` lies in `S₁`) and the rank-one
  map `R(A) = ⟨e₀, A e₀⟩ w₀`, bounded on `S₂` with `‖R E₀₀‖₁ = ‖w₀‖₁ = Σ_j 1/(j+1) = ∞`, so
  `‖R‖_{cb,1} = ∞`: `T R E₀₀ = T w₀ = w₀`, so `‖T ∘ R‖₁ = ∞` while `‖T‖_{cb,1} ‖R‖_{cb,1} = 0 · ∞ = 0`.
  In the other order `R ∘ T` vanishes on `S₁`, and `‖R ∘ T‖_{cb,1} = 0 ≤ ∞ · 0`.
- Conjugation `A ↦ U A U*` by a unitary of `H ≠ 0` has `‖·‖_{cb,p} = 1` for every `p`; on
  `H = 0` it is the zero map, with every norm `0`.
- The map `A ↦ E₁₁ A E₁₁` on `M₂` has `‖·‖_{cb,p} = 1` for every `p` (a compression), and the
  diagonal projection `A ↦ E₁₁AE₁₁ + E₂₂AE₂₂` has `‖·‖_{cb,p} = 1` (average of two unitary
  conjugations, by `diag(1, 1)` and `diag(1, −1)`).
- On the zero space every norm is `0`.

*Needs:* §1.1–§1.3; Mathlib `WithLp`, `lp`, `CStarMatrix`; VonNeumannAlgebras V2 (completed
Hilbert tensor products); CStarAlgebras C1.6, C3.2; NoncommutativeIntegration §2.6.

### Examples

- `M_n` with the trace: `S_p^n` is `M_n` with the norm `TauCeti.UnitarilyInvariantSeminorm.schatten`,
  and `S_∞^n = M_n` with the operator norm.
- `ℓ²(ℕ)`: `S₁ ⊊ S₂ ⊊ S_∞ ⊊ B(ℓ²)`, with `diag(1/(j+1))` and the identity as witnesses.
- The transpose on `M_n` separates `‖·‖_p` from `‖·‖_{cb,p}` at `p ∈ {1, ∞}` and not at `p = 2`.

### Dependencies

Mathlib (`compactOperator`, `WithLp`, `lp`, `CStarMatrix`); Tau Ceti Schatten families;
OperatorTheory/OperatorIdeals Parts A–C; VonNeumannAlgebras V2 (completed Hilbert tensor
products), V4.Core; NoncommutativeIntegration §1.3–§1.5,
§2.1, §2.3, §2.5, §2.6; CStarAlgebras C1.6, C3.2.

## Layer 2: Hilbert–Schmidt kernels on σ-finite measure spaces

Throughout this layer `(Ω, μ)`, `(Ω', ν)`, `(Ω'', λ)` are σ-finite measure spaces.

### 2.1 The kernel of a Hilbert–Schmidt operator

The kernel operator `k ↦ T_k`, `T_k g(x) = ∫ k(x, y) g(y) dν(y)`, from `L²(μ ⊗ ν)` to the bounded
operators `L²(ν) → L²(μ)` is AutomorphicSpectralTheory §0.8, with `kernel_apply`, `kernel_unique`
and `kernel_norm`, at the generality of arbitrary σ-finite measure spaces
(gap `sigma-finite-hilbert-schmidt-kernels`). Prove that its range is the whole Hilbert–Schmidt
class `S₂(L²(ν), L²(μ))`: the range is closed (an isometry from a complete space) and contains
the rank-one operators `u ⊗ v*`, whose kernel is `u(x) conj v(y)` by `kernel_apply` and Fubini,
and finite-rank operators are dense in `S₂` (OperatorIdeals OI-C01–OI-C13, truncation of the
column model). Hence `k ↦ T_k` is a unitary `L²(μ ⊗ ν) ≅ S₂(L²(ν), L²(μ))`; define the kernel
`k_A ∈ L²(μ ⊗ ν)` of `A ∈ S₂` as the inverse image of `A` (lafforgue-delasalle-2011 lines 226–232;
reed-simon-1-1980 §VI.6).

- `T_{k_A} = A` and `k_{T_k} = k`; `A ↦ k_A` is linear with `‖k_A‖_{L²} = ‖A‖₂` and, for
  `A, B ∈ S₂(L²(ν), L²(μ))`, `⟨k_A, k_B⟩_{L²(μ ⊗ ν)} = Tr(A* B)`: polarise `‖k_A‖₂² = ‖A‖₂²`, whose
  right side is `Σ_j ‖A e_j‖²` for a Hilbert basis `(e_j)` (OperatorIdeals OI-B32–OI-B35), and use
  the basis formula `Tr(A* B) = Σ_j ⟨A e_j, B e_j⟩` (AutomorphicSpectralTheory §0.9).
- For finite index sets with counting measure, `k_A(i, j) = ⟨δ_i, A δ_j⟩` is the matrix of `A`.
- `k_A` is an almost-everywhere class: two operators with kernels equal off a `μ ⊗ ν`-null set
  coincide.
- Call a bounded `T` the integral operator of a function `k` (Lean `IsKernelOperator`, stated on one
  space `Ω = Ω'`) when `(T g)(x) = ∫ k(x, y) g(y) dν(y)` for `μ`-almost every `x` and every
  `g ∈ L²(ν)`. For `k ∈ L²(μ ⊗ ν)` this holds exactly for `T = T_k`, by `kernel_apply` and the
  uniqueness of the operator with given values; so the integral operators of square-integrable
  kernels are exactly the Hilbert–Schmidt operators, each for one class `k`.

**Checks.**

- On `{1, 2}` with counting measure, the kernel `1_{(1,2)}` gives the matrix unit `E₁₂`
  (`E₁₂ δ₂ = δ₁`); the transposed convention would give `E₂₁`.
- On `[0, 1]` with Lebesgue measure, `k(x, y) = min(x, y)` gives the operator with eigenvalues
  `((j + 1/2)π)^{−2}`, `j ≥ 0`, and `Σ_j ((j + 1/2)π)^{−4} = (16/π⁴)(π⁴/96) = 1/6`, which equals
  `‖k‖²_{L²} = ∫∫ min(x, y)² = 1/6`; the constant kernel `1` gives the projection onto constants,
  with `‖T_1‖₂ = 1 = ‖1‖_{L²}`.
- The identity of `L²([0, 1])` is not Hilbert–Schmidt and has no kernel; a definition accepting
  the indicator of the diagonal as its kernel would produce the zero operator, since the diagonal
  is null.
- For the zero measure all spaces are zero.

*Needs:* AutomorphicSpectralTheory §0.8 (gap `sigma-finite-hilbert-schmidt-kernels`), §0.9;
OperatorIdeals OI-B32–OI-B41, OI-C01–OI-C13; Mathlib `MeasureTheory.Measure.prod`,
`MeasureTheory.integral_prod`.

### 2.2 Kernel calculus and the trace formula

Prove, for `A ∈ S₂(L²(ν), L²(μ))`, `B ∈ S₂(L²(λ), L²(ν))`, `u ∈ L²(μ)`, `v ∈ L²(ν)` and
`f ∈ L^∞(μ)`, `g ∈ L^∞(ν)` (lafforgue-delasalle-2011 Remark 1.2, line 239; reed-simon-1-1980
§VI.6):

- `k_{u ⊗ v*}(x, y) = u(x) conj v(y)`;
- `k_{A*}(y, x) = conj k_A(x, y)`, as classes on `Ω' × Ω`;
- `A B ∈ S₁` and `k_{AB}(x, z) = ∫ k_A(x, y) k_B(y, z) dν(y)` for `μ ⊗ λ`-almost every `(x, z)`;
- `k_{D_f A D_g}(x, y) = f(x) k_A(x, y) g(y)`, where `D_f` is multiplication by `f`;
- the trace formula: for `A ∈ S₂(L²(ν), L²(μ))` and `C ∈ S₂(L²(μ), L²(ν))`,
  `Tr(A C) = ∫∫ k_A(x, y) k_C(y, x) dμ(x) dν(y)`, the integrand being integrable with integral
  bounded by `‖A‖₂ ‖C‖₂`. Route: `A*` and `C` are Hilbert–Schmidt operators `L²(μ) → L²(ν)` and
  `A C = (A*)* C`, so the polarised kernel isometry of §2.1 gives
  `Tr(A C) = ⟨k_{A*}, k_C⟩_{L²(ν ⊗ μ)}`; the adjoint kernel of the second bullet,
  `conj k_{A*}(y, x) = k_A(x, y)`, turns the inner product into the integral, and Cauchy–Schwarz in
  `L²(ν ⊗ μ)` gives integrability and the bound.

On `{1, 2}`: `Tr(E₁₂ E₂₁) = 1 = Σ_{x,y} k_{E₁₂}(x, y) k_{E₂₁}(y, x)`, and along the route
`k_{E₁₂*} = 1_{(2,1)}` and `⟨k_{E₁₂*}, k_{E₂₁}⟩ = 1`; the Hilbert–Schmidt inner product
`Tr(E₁₂* E₂₁)` is `0`, so the bilinear and the sesquilinear pairings differ. For `A = i E₁₂`,
`k_{A*} = −i·1_{(2,1)}` and `⟨k_{A*}, k_{E₂₁}⟩ = conj(−i) = i = Tr(A E₂₁) = k_A(1, 2) k_{E₂₁}(2, 1)`;
an adjoint kernel without the conjugation would give `−i`. With `Ω = {1}` and `Ω' = {2}` as two
different spaces, `A = E₁₂ : L²({2}) → L²({1})` and `C = E₂₁ : L²({1}) → L²({2})`, the same
computation is the two-space formula: `Tr(AC) = 1 = k_A(1, 2) k_C(2, 1)`.

*Needs:* §2.1; AutomorphicSpectralTheory §0.8 (`kernel_apply`, gap
`sigma-finite-hilbert-schmidt-kernels`), §0.9; VonNeumannAlgebras V4.Core (Hölder at `p = q = 2`,
cyclicity); Mathlib `MeasureTheory.integral_prod`.

### 2.3 Transposition

Let `J` be complex conjugation on `L²(Ω, μ)`, the conjugate-linear isometric involution
`f ↦ conj f`. For bounded `A` define `A^T = J A* J`, the adjoint of `A` for the bilinear pairing
`∫ f g dμ`: `∫ (A^T f) g dμ = ∫ f (A g) dμ`. Under the identification of `S₂(L²(Ω, μ))` with
`L²(Ω × Ω, μ ⊗ μ)` through this bilinear pairing (lafforgue-delasalle-2011 lines 226–230) it is
the flip of the two variables, and it is the transposition through which a multiplier is compared
with its dual in lafforgue-delasalle-2011 Remark 1.3, line 244 (used in §4.1).

- `A ↦ A^T` is complex linear, `(A^T)^T = A`, `(A B)^T = B^T A^T`, `(A*)^T = (A^T)*`, and
  `D_f^T = D_f` (each from `⟨J f, J g⟩ = ⟨g, f⟩` and `J² = 1`).
- `aₙ(A^T) = aₙ(A)` for every `n` (conjugation by `J` preserves rank and norm, with OI-A30); so
  `‖A^T‖_p = ‖A‖_p` for every `p`, and `A^T` is compact exactly when `A` is. On `M_n` the
  transposition is an isometry for the operator norm whose completely bounded norm is `n`
  (pisier-grothendieck-2012 Remark 13.4, line 2086; the first Check of §1.4).
- For `A ∈ S₂`, `k_{A^T}(x, y) = k_A(y, x)` (lafforgue-delasalle-2011 lines 228–230): by
  `kernel_apply`, `J B J` has kernel `conj k_B(x, y)`, and §2.2 gives `k_{A*}(x, y) = conj k_A(y, x)`.
- For `A ∈ S₁`, `Tr(A^T) = Tr(A)`, hence `Tr(A^T B^T) = Tr(A B)`: `J (u ⊗ v*) J = (J u) ⊗ (J v)*`,
  so `Tr(J X J) = conj Tr(X)` for trace-class `X` by the rank-one formula of VonNeumannAlgebras
  V4.Core, and `Tr(A*) = conj Tr(A)`.
- For a finite index set with counting measure, `A^T` is Mathlib's `Matrix.transpose`.

**Checks.**

- On `{1, 2}`: `E₁₂^T = E₂₁` and `(i E₁₂)^T = i E₂₁`; the adjoint gives `−i E₂₁`, so the
  definition is linear, not conjugate-linear.
- For `A = [[1, 1], [0, 0]]` the singular values are `√2, 0`, as for `A^T = [[1, 0], [1, 0]]`:
  `‖A^T‖_p = ‖A‖_p = √2` for every `p`; yet the transpose map is not completely isometric at
  `p = ∞` (§1.4).
- `D_f^T = D_f` while `D_f* = D_{f̄}`: for `f = i`, `D_f^T = i` and `D_f* = −i`.

*Needs:* §1.1, §1.4, §2.1, §2.2; OperatorIdeals OI-A30; VonNeumannAlgebras V4.Core.

### 2.4 Change of measure, isomorphisms and sub-σ-algebras

Prove (lafforgue-delasalle-2011 lines 346–349 and 366–381):

- **Change of measure.** For σ-finite `ν ≪ μ` on one measurable space with `h = dν/dμ`
  (`MeasureTheory.Measure.rnDeriv`), `U g = √h · g` is an isometry `L²(ν) → L²(μ)` with
  `U* f = f/√h` `ν`-almost everywhere, unitary when also `μ ≪ ν`; for `A ∈ S₂(L²(ν))`,
  `k^μ_{U A U*}(x, y) = √h(x) k^ν_A(x, y) √h(y)`; and `A ↦ U A U*` is a complete isometry on
  every `S_p` (§1.4).
- **Isomorphisms.** For a measurable bijection `φ : Ω₁ → Ω₂` with measurable inverse,
  measure preserving from `μ₁` to `μ₂` (`MeasureTheory.MeasurePreserving`), the composition unitary
  `C_φ g = g ∘ φ` satisfies `k_{C_φ A C_φ*}(x, y) = k_A(φ x, φ y)`.
- **Sub-σ-algebras.** For σ-algebras `𝒜 ⊆ 𝓑` on `Ω` with `μ` σ-finite on `𝒜`, the inclusion
  `V : L²(Ω, 𝒜, μ) → L²(Ω, 𝓑, μ)` (`MeasureTheory.lpMeas`) is an isometry whose adjoint is the
  orthogonal projection `Q` onto its range (`MeasureTheory.condExpL2`). The maps `ι(A) = V A V*`
  and `P(B) = V* B V` are complete contractions on every `S_p`, `ι` is a complete isometry and
  `P ∘ ι = id`. The product measure `μ ⊗ μ` is σ-finite on `𝒜 ⊗ 𝒜`, where it is the product of
  two copies of the trimmed measure `μ.trim h` on `𝒜` (the two agree on the rectangles of
  `𝒜`-sets, a π-system that generates `𝒜 ⊗ 𝒜` and contains a cover of `Ω × Ω` by sets of finite
  measure); so
  `L²(Ω × Ω, 𝒜 ⊗ 𝒜, μ ⊗ μ) = L²(𝒜) ⊗̂ L²(𝒜)` (VonNeumannAlgebras V2.RectangularL2). Kernels:
  `k_{ι(A)} = k_A` as a `𝓑 ⊗ 𝓑` class, and `k_{P(B)}` is the orthogonal projection of `k_B` onto
  the `𝒜 ⊗ 𝒜`-measurable classes of `L²(μ ⊗ μ)` (`MeasureTheory.condExpL2` for
  `𝒜 ⊗ 𝒜 ⊆ 𝓑 ⊗ 𝓑`, which is `Q ⊗ Q`): for `B = u ⊗ v*` both are `(Qu)(x) conj (Qv)(y)`, and
  both sides are continuous in `B ∈ S₂`.
- Each statement holds verbatim for the amplified spaces `Ω × {1, …, m}` with `μ ⊗` counting
  measure.

The text of lafforgue-delasalle-2011 line 348 names the target of the embedding
`S_p(L²(X, ν))`; the embedding is into `S_p(L²(X, μ))`, as stated here.

The kernel projection is `MeasureTheory.condExpL2`, not `MeasureTheory.condExp`: on `ℕ` with
counting measure and `𝒜 = 𝓑`, the kernel `k(i, j) = u_i u_j` with `u_j = 1/(j + 1)` has
`‖k‖₂ = Σ_j (j + 1)^{−2} = π²/6` but `Σ_{i,j} k(i, j) = ∞`; `condExpL2` returns `k`, so that
`P(B) = B` as `𝒜 = 𝓑` requires, while `condExp` returns `0`.

**Checks.**

- Sub-σ-algebra, kernel of `P(B)`: on `{1, 2}` with counting measure and `𝒜` trivial,
  `L²(𝒜) = ℂ e` with `e = (1, 1)/√2`, `ι(a) = (a/2) J` for the scalar `a` (`J` the all-ones matrix)
  and `P(B) = ⟨e, B e⟩ = (Σ_{i,j} B_{ij})/2`, so `P(ι(a)) = (a/2) · 4/2 = a`. For `B = E₁₁`, `P(B)`
  is the scalar `1/2`; its kernel for `μ` on `𝒜 ⊗ 𝒜` is the constant `c` with `2c = 1/2`, so
  `c = 1/4`, the mean of `k_{E₁₁} = 1_{(1,1)}` over the four points, as the projection onto the
  `𝒜 ⊗ 𝒜`-measurable classes gives. Reading the scalar `1/2` as the kernel would be wrong by the
  mass `2` of `Ω`.
- Direction of `C_φ`: on `{1, 2, 3}` with counting measure and the cycle `φ(1) = 2`, `φ(2) = 3`,
  `φ(3) = 1`, `C_φ δ₁ = δ₁ ∘ φ = δ₃` and `C_φ δ₂ = δ₁`, so `C_φ E₁₂ C_φ* = E₃₁`, and
  `k_{E₁₂}(φx, φy) = 1` exactly at `(x, y) = (3, 1)`; the formula with `φ⁻¹` in place of `φ` would
  give `E₂₃`.
- Change of measure without `μ ≪ ν`: `ν = δ₀ ≪ μ = δ₀ + δ₁` on `{0, 1}` has `h = 1_{{0}}`,
  `L²(ν) = ℂ` and `U c = (c, 0)`, so `U*U = 1` and `U U* = E₀₀ ≠ 1`: `U` is an isometry and not a
  unitary, and `A ↦ U A U*` is a complete isometry onto the corner `E₀₀ S_p E₀₀`, not onto
  `S_p(L²(μ))`.

*Needs:* §1.4, §2.1, §2.2; VonNeumannAlgebras V2.RectangularL2; Mathlib
`MeasureTheory.Measure.rnDeriv`, `MeasureTheory.MeasurePreserving`, `MeasureTheory.lpMeas`,
`MeasureTheory.condExpL2`.

### 2.5 Conditional expectation of bounded functions

Let `𝒜 ⊆ 𝓑` be σ-algebras on `Ω` and `μ` a measure on `𝓑` that is σ-finite on `𝒜`
(`MeasureTheory.SigmaFinite (μ.trim h)`). For `φ ∈ L^∞(Ω, 𝓑, μ)`, `E[φ | 𝒜]` is the `L^∞`
conditional expectation of BochnerSpaces §7.4: the linear contraction of `L^∞(Ω, 𝓑, μ)` adjoint
to the `L¹` projection `E₁` onto the `𝒜`-measurable classes,
`∫ E[φ | 𝒜] g dμ = ∫ φ E₁(g) dμ` for every `g ∈ L¹(μ)`, which agrees with
`MeasureTheory.condExpL2` on `L^∞ ∩ L²` (lafforgue-delasalle-2011 lines 356–359 for the setting).
Since `E₁` fixes the `𝒜`-measurable classes, `∫ E[φ | 𝒜] g dμ = ∫ φ g dμ` for every
`𝒜`-measurable `g ∈ L¹(μ)`. The measure `μ` is σ-finite, because it is on `𝒜`, so a class of
`L^∞(μ)` is determined by its integrals against `L¹(μ)` (test the difference `ψ` against
`1_B conj ψ` for sets `B` of finite measure); the first three statements below pass properties of
`E₁` to `E[· | 𝒜]` in this way. Layer 5 and its consumers use `E[· | 𝒜]` on `Ω × Ω` for `μ ⊗ μ`
and `𝒜 ⊗ 𝒜`, on which `μ ⊗ μ` is σ-finite (§2.4). Prove:

- **`𝒜`-measurable values.** `E[φ | 𝒜]` is the class of an `𝒜`-measurable function. For `A ∈ 𝒜`
  of finite measure, `1_A E[φ | 𝒜] = E[1_A φ | 𝒜]`, because `E₁(1_A g) = 1_A E₁(g)` for
  `g ∈ L¹(μ)` (`E₁` is `MeasureTheory.condExp` on `L¹`, and `MeasureTheory.condExp_indicator`);
  as `1_A φ ∈ L^∞ ∩ L²`, this is `MeasureTheory.condExpL2 (1_A φ)`, an element of
  `MeasureTheory.lpMeas`. Countably many disjoint such `A` cover `Ω` because the trim is σ-finite,
  and the `𝒜`-measurable representatives on the pieces glue.
- **Positivity.** If `φ ≥ 0` almost everywhere, then `E[φ | 𝒜] ≥ 0` almost everywhere: for
  `g ≥ 0` in `L¹(μ)`, `∫ E[φ | 𝒜] g dμ = ∫ φ E₁(g) dμ ≥ 0` because `E₁` is positive, and testing
  `g = 1_B` on sets `B` of finite measure on which `E[φ | 𝒜]` has positive or negative imaginary
  part, or negative real part, shows that these sets are null.
- **Tower law.** For a σ-algebra `𝒜' ⊆ 𝒜` on which `μ` is σ-finite, with `L¹` projection `E₁'`,
  `E[E[φ | 𝒜] | 𝒜'] = E[φ | 𝒜']`: for `g ∈ L¹(μ)`,
  `∫ E[E[φ | 𝒜] | 𝒜'] g = ∫ E[φ | 𝒜] E₁'(g) = ∫ φ E₁(E₁'(g)) = ∫ φ E₁'(g) = ∫ E[φ | 𝒜'] g`, since
  `E₁` fixes the `𝒜'`-measurable, hence `𝒜`-measurable, class `E₁'(g)`.
- **Agreement with `MeasureTheory.condExp`.** If `φ` is also `μ`-integrable, then
  `E[φ | 𝒜] = MeasureTheory.condExp 𝒜 μ φ`: `φ ∈ L²` because `|φ|² ≤ ‖φ‖_∞ |φ|`, so
  `E[φ | 𝒜] = MeasureTheory.condExpL2 φ`, which is `MeasureTheory.condExp 𝒜 μ φ`
  (`MeasureTheory.MemLp.condExpL2_ae_eq_condExp'`). In particular this holds for every `φ` when
  `μ` is finite.
- **Characterisation.** `E[φ | 𝒜]` is the unique `𝒜`-measurable class in `L^∞(μ)` with
  `∫ E[φ | 𝒜] g dμ = ∫ φ g dμ` for every `𝒜`-measurable `g ∈ L¹(μ)`: it is one such class by the
  first statement and the identity above; for the difference `ψ` of two
  such classes and a set `A ∈ 𝒜` of finite measure, `g = 1_A conj ψ` is admissible and gives
  `∫_A |ψ|² dμ = 0`, and countably many such `A` cover `Ω` because the trim is σ-finite. Hence
  `E[φ | 𝒜]` fixes the `𝒜`-measurable classes.
- **Change of density.** For an `𝒜`-measurable `ρ : Ω → (0, ∞)`, the measure `ρ · μ` is σ-finite
  on `𝒜`, has the null sets and the `L^∞` classes of `μ`, and its conditional expectation of `φ`
  is `E[φ | 𝒜]`: `g ↦ ρ g` maps the `𝒜`-measurable classes of `L¹(ρ · μ)` onto those of `L¹(μ)`,
  and the characterisation applies.
- **Finite equivalent measure.** There is an `𝒜`-measurable `w : Ω → (0, ∞)` with `∫ w dμ < ∞`
  (`MeasureTheory.exists_pos_lintegral_lt_of_sigmaFinite` for `μ.trim h`, with
  `MeasureTheory.lintegral_trim`); `w · μ` (`MeasureTheory.Measure.withDensity`) is a finite
  measure with the null sets of `μ`, and `E[φ | 𝒜]` is the class of
  `MeasureTheory.condExp 𝒜 (w · μ) φ`, by the change of density and the agreement with
  `MeasureTheory.condExp` for the finite measure `w · μ`, on which `φ` is integrable
  (lafforgue-delasalle-2011 lines 422–424 for the reduction by an `𝒜`-measurable density).
- **Conjugation.** `E[conj φ | 𝒜] = conj E[φ | 𝒜]`: the right side is `𝒜`-measurable and
  `∫ conj E[φ | 𝒜] g dμ = conj ∫ E[φ | 𝒜] conj g dμ = conj ∫ φ conj g dμ = ∫ conj φ g dμ`, so the
  characterisation applies.
- **Module property.** For `𝒜`-measurable `k ∈ L²(μ)`, `MeasureTheory.condExpL2 (φ k) = E[φ | 𝒜] k`.
  For `𝒜`-measurable `g ∈ L²(μ)` the product `conj g · k` is `𝒜`-measurable and integrable, so
  `⟨g, φ k⟩ = ⟨g, E[φ | 𝒜] k⟩` by the characterisation, and `E[φ | 𝒜] k` is `𝒜`-measurable and
  square-integrable.

**Checks.**

- Counting measure on `ℕ`, `𝒜 = 𝓑` the power set and `φ = 1`: the `L¹` projection is the
  identity, and so is its adjoint, so `E[1 | 𝒜] = 1`, while `MeasureTheory.condExp 𝒜 μ 1 = 0`
  because `1` is not integrable. For the symbol `1` on `ℕ × ℕ` this is the difference between the
  identity multiplier, of norm `1`, and the zero multiplier.
- Lebesgue measure on `ℝ` and `𝒜` generated by the intervals `[k, k + 1)`, `k ∈ ℤ`, on which it is
  σ-finite: for the `1`-periodic `φ` equal to `1` on `[0, 1/2)` and `0` on `[1/2, 1)`,
  `E[φ | 𝒜] = ∫_k^{k+1} φ = 1/2` on every `[k, k + 1)`, while `MeasureTheory.condExp` gives `0`.
- σ-finiteness on `𝒜` is needed: for Lebesgue measure on `ℝ` and `𝒜 = {∅, ℝ}`, the
  `𝒜`-measurable functions are the constants and the only integrable one is `0`, so every
  constant satisfies the characterising identity for `φ = 1` and nothing is determined.
- On `{1, 2}` with masses `1` and `3` and `𝒜` trivial, `E[(a, b) | 𝒜]` is the constant
  `(a + 3b)/4`, unchanged for `ρ · μ` with a constant `ρ > 0` (masses `c`, `3c`). The density
  must be `𝒜`-measurable: `ρ = (3, 1)` gives masses `3`, `3` and the expectation `(a + b)/2`,
  which is `1/2` against `1/4` at `(a, b) = (1, 0)`.
- The `𝒜`-measurability of the values is a property of `E₁`, not of adjoints of projections onto
  the `𝒜`-measurable classes: on `{1, 2}` with masses `1` and `3` and `𝒜` trivial, the projection
  `g ↦ g(1) · 1` of `L¹` onto the constants has the adjoint `φ ↦ (φ(1) + 3φ(2)) · 1_{{1}}`, which
  sends `1` to `(4, 0)`, not a constant, while `E[1 | 𝒜] = MeasureTheory.condExpL2 1 = 1`.
- On `{1, 2, 3, 4}` with counting measure, `φ = 1_{{1}}` and `𝒜` generated by `{1, 2}` and
  `{3, 4}`: `E[φ | 𝒜] = (1/2, 1/2, 0, 0)`, whose mean `1/4` is the mean of `φ`, as the tower law
  for the trivial `𝒜'` requires. The inclusion `𝒜' ⊆ 𝒜` is needed: for the σ-algebra generated by
  `{1, 3}` and `{2, 4}`, the expectation of `(1/2, 1/2, 0, 0)` is the constant `1/4`, while that
  of `φ` is `(1/2, 0, 1/2, 0)`.

*Needs:* §2.4 (σ-finiteness of `μ ⊗ μ` on `𝒜 ⊗ 𝒜`); BochnerSpaces §7.4; Mathlib
`MeasureTheory.condExp`, `MeasureTheory.condExp_indicator`, `MeasureTheory.condExpL2`,
`MeasureTheory.lpMeas`, `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'`,
`MeasureTheory.Measure.withDensity`, `MeasureTheory.exists_pos_lintegral_lt_of_sigmaFinite`,
`MeasureTheory.lintegral_trim`.

### Examples

- Finite index sets: kernels are matrices, `A^T` is the transpose and the trace formula is
  `Tr(AC) = Σ A_{ij} C_{ji}`.
- `[0, 1]` with Lebesgue measure: `min(x, y)` and the constant kernel (§2.1).
- The sub-σ-algebra generated by a partition of `[0, 1]` into two intervals: `P(B)` has kernel
  constant on the four products of the intervals, equal to the averages of `k_B`.
- The σ-algebra of `ℝ` generated by the unit intervals `[k, k + 1)`, with Lebesgue measure: the
  conditional expectation of a bounded function is the sequence of its averages over the unit
  intervals (§2.5).

### Dependencies

Layer 1 (§1.1, §1.4); AutomorphicSpectralTheory §0.8, §0.9; OperatorIdeals Parts A–C;
VonNeumannAlgebras V2.RectangularL2, V4.Core; BochnerSpaces §7.4; Mathlib measure theory,
measures with density and conditional expectations.

## Layer 3: Schur multipliers

Throughout this layer `(Ω, μ)` is σ-finite, `H = L²(Ω, μ)`, and `M, N ∈ L^∞(Ω × Ω, μ ⊗ μ)`.

### 3.1 Schur multipliers on `S₂`

Define the Schur multiplier with symbol `M` as the map `S_M : S₂(H) → S₂(H)`,
`S_M(A) = T_{M · k_A}` (lafforgue-delasalle-2011 lines 226–238; cgpt-2023 lines 220–226).

- `S_M` is linear and bounded on `S₂` with `‖S_M‖_{S₂ → S₂} = ‖M‖_{L^∞(μ ⊗ μ)}`: through §2.1 it is
  multiplication by `M` on `L²(μ ⊗ μ)`, whose norm is the essential supremum since `μ ⊗ μ` is
  σ-finite.
- `S_M` depends only on the almost-everywhere class of `M`, and `M ↦ S_M` is injective on classes.
- Elementary symbols: for `f, g ∈ L^∞(μ)` and `M(x, y) = f(x) g(y)`, `S_M(A) = D_f A D_g`.
- Bimodularity: `S_M(D_f A D_g) = D_f S_M(A) D_g`.
- The constant symbol `1` gives the identity, and `0` gives `0`.

**Checks.**

- On `{1, 2}` with `M = [[1, 2], [3, 4]]`: `S_M([[a, b], [c, d]]) = [[a, 2b], [3c, 4d]]`, and
  `‖S_M‖_{S₂ → S₂} = 4`, attained at `E₂₂`.
- On `[0, 1]` with `M = 1_{x<y}` and `A` the projection onto constants (kernel `1`), `S_M(A)` is
  `g ↦ ∫_x^1 g`, with `‖S_M(A)‖₂² = ∫∫ 1_{x<y} = 1/2`.
- On `[0, 1]` the symbol `1_{x=y}` is `0` almost everywhere, so its multiplier is `0`; a pointwise
  definition on the diagonal would act on no Hilbert–Schmidt operator and is excluded.
- For the zero measure, `S_M = 0` and `‖M‖_∞ = 0`.

*Needs:* §2.1, §2.2; Mathlib `MeasureTheory.Lp`, `MeasureTheory.Measure.prod`.

### 3.2 The algebra of multipliers on `S₂`

Prove that `S_{MN} = S_M S_N`, `S_{M+N} = S_M + S_N`, `S_{cM} = c S_M`, `S_1 = id`, that the
adjoint of `S_M` for the Hilbert–Schmidt inner product `⟨A, B⟩ = Tr(A* B)` is `S_{M̄}`, and that
`‖S_M‖_{S₂ → S₂} = ‖M‖_∞`; hence `M ↦ S_M` is an isometric unital `*`-homomorphism from
`L^∞(μ ⊗ μ)`, with pointwise conjugation, into `B(S₂(H))`. Prove also `S_M(A)* = S_{M̃}(A*)` with
`M̃(x, y) = conj M(y, x)` and `S_M(A)^T = S_{M^t}(A^T)` (lafforgue-delasalle-2011 lines 230–232 and
267–268; cgpt-2023 lines 224–226). Route: §3.1 and the kernel formulas of §2.2–§2.3.

On `{1, 2}` with `M = 1_{(1,2)}`: `S_M(E₁₂) = E₁₂` and the Hilbert-space adjoint of `S_M` is
`S_M = S_{M̄}`, while `S_{M̃}(E₁₂) = 0`; and `S_M(E₁₂)* = E₂₁ = S_{M̃}(E₂₁)`.

*Needs:* §2.2, §2.3, §3.1.

### 3.3 Norms on `S_p` and the bounded extension

For `1 ≤ p ≤ ∞` the norm `‖S_M‖_p ∈ [0, ∞]` is the norm of §1.4 for `T = S_M`: the supremum of
`‖S_M(A)‖_p` over `A ∈ S₂` with `‖A‖_p ≤ 1`. By §2.1 it is the supremum of `‖B‖_p` over pairs of
integral operators `A`, `B` of kernels `k ∈ L²(μ ⊗ μ)` and `M · k` with `‖A‖_p ≤ 1`, which is the
definition `schurNorm` of `Suggested.lean`. Prove (lafforgue-delasalle-2011 lines 233–238,
397–413 and 433–438; cgpt-2023 lines 226–229):

- `‖S_M‖_p = sup { ‖S_M(A)‖_p : A of finite rank, ‖A‖_p ≤ 1 }`, and this equals
  `sup { |Tr(S_M(A) B)| : A, B of finite rank, ‖A‖_p ≤ 1, ‖B‖_{p'} ≤ 1 }` (§1.2, §1.1);
- `S₂ ∩ S_p` is dense in `S_p` (in `S_∞` at `p = ∞`), so when `‖S_M‖_p < ∞` the bounded extension
  `S_M : S_p → S_p` (`S_∞ → S_∞`) is unique; for `p ≤ 2` it maps `S_p` into `S_2 ∩ S_p`;
- for an elementary symbol `f(x) g(y)`, `‖S_M‖_p ≤ ‖f‖_∞ ‖g‖_∞` for every `p`;
- lower semicontinuity: if `M_k → M` almost everywhere with `sup_k ‖M_k‖_∞ < ∞`, then
  `‖S_M‖_p ≤ liminf_k ‖S_{M_k}‖_p`, by the pairing formula, the trace formula of §2.2 and dominated
  convergence;
- `‖S_M‖_p` is unchanged when `M` is changed on a null set.

**Checks.**

- A one-point space of mass `w > 0` with the constant symbol `c`: `L² = ℂ`, multiplication by `a`
  has kernel `a/w`, `S_M(a) = c a`, and `‖S_M‖_p = |c|` for every `p`, whatever `w`.
- The supremum is over `‖A‖_p ≤ 1`, not over `‖A‖₂ ≤ 1`: on `{1, 2}` with counting measure and
  `M = 1`, `S_M = id` and `‖S_M‖₁ = 1`, while `sup { ‖A‖₁ : ‖A‖₂ ≤ 1 } = √2`, attained at
  `A = I/√2` (`‖A‖₂ = 1`, `‖A‖₁ = 2/√2`).
- The norm is not the essential supremum of the symbol when `p ≠ 2`: the triangular truncation
  `M = [[1, 1], [0, 1]]` on `M₂` has `‖M‖_∞ = ‖S_M‖₂ = 1` (§3.1) and `‖S_M‖_∞ = 2/√3` (§3.4).
- Lower semicontinuity can be strict: on `ℕ` with counting measure, `M_k = 1_{(k,k)}` tends to `0`
  everywhere with `‖M_k‖_∞ = 1`, and `S_{M_k}(A) = A_{kk} E_{kk}` has `‖S_{M_k}‖_p = 1` for every
  `p` (`|A_{kk}| ≤ ‖A‖ ≤ ‖A‖_p`, with equality at `A = E_{kk}`), while the limit symbol `0` has
  norm `0 < 1 = liminf_k ‖S_{M_k}‖_p`.

*Needs:* §1.1, §1.2, §1.4, §2.2, §3.1.

### 3.4 Finite index sets

Let `ι` be a finite type with counting measure. Prove that `L²(ι) = EuclideanSpace ℂ ι`, that
`S₂` is all of `Matrix ι ι ℂ` acting through `Matrix.toEuclideanCLM`, that `k_A(i, j) = A i j`, that
`S_M(A) = M ⊙ A` (`Matrix.hadamard`), and that `‖S_M‖_p` is the norm of `A ↦ M ⊙ A` on
`Matrix ι ι ℂ` for `TauCeti.UnitarilyInvariantSeminorm.schatten` at exponent `p`
(lafforgue-delasalle-2011 lines 213–218; pisier-grothendieck-2012 lines 767–772).

On `M₂`: the triangular truncation `M = [[1, 1], [0, 1]]` has `‖S_M‖_∞ = 2/√3`, attained at the
unitary `A = [[√2, 1], [−1, √2]]/√3`, whose truncation `[[√2, 1], [0, √2]]/√3` has
`(S_M A)*(S_M A)` with eigenvalues `4/3` and `1/3`; so `‖S_M‖_∞ > ‖M‖_∞ = 1`, and the norm on
`S_∞` is not the supremum of the symbol.

*Needs:* §3.1, §3.3; Mathlib `Matrix.hadamard`, `Matrix.toEuclideanCLM`; Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.schatten`.

### 3.5 The completely bounded norm of a Schur multiplier

Define, for `m ≥ 1`, the amplified symbol `M_m ∈ L^∞((Ω × Fin m)²)` by `M_m(x, i, y, j) = M(x, y)`,
for the measure `μ ⊗` counting measure on `Ω × Fin m`, and
`‖S_M‖_{cb,p} = sup_m ‖S_{M_m}‖_p ∈ [0, ∞]` (lafforgue-delasalle-2011 Lemma 1.5, line 254;
cgpt-2023 lines 217–219). In `Suggested.lean` this is `schurCbNorm`, whose supremum also admits
`m = 0`, the zero space, which contributes `0`.

- Through `L²(Ω × Fin m) = L²(Ω)^m`, `S_{M_m}` is the amplification `(S_M)^{(m)}` of §1.4; so
  `‖S_M‖_{cb,p}` is the completely bounded norm of §1.4 of the map `S_M`.
- `‖S_M‖_p ≤ ‖S_M‖_{cb,p}`; `m ↦ ‖S_{M_m}‖_p` is nondecreasing.
- At `p = 2`: `‖S_M‖_{cb,2} = ‖S_M‖_2 = ‖M‖_∞` (lafforgue-delasalle-2011 lines 267–268), since
  `‖S_M‖_2` is the norm `‖S_M‖_{S₂ → S₂} = ‖M‖_∞` of §3.1 and `‖M_m‖_∞ = ‖M‖_∞` for `m ≥ 1`. This
  is `schurNorm_two_eq`, the isometry of `M ↦ S_M` on `S₂` with its completely bounded form: for
  σ-finite `μ` and `M ∈ L^∞(μ ⊗ μ)`, `‖S_M‖₂ = ‖S_M‖_{cb,2} = ‖M‖_∞`.
- `‖S_{MN}‖_{cb,p} ≤ ‖S_M‖_{cb,p} ‖S_N‖_{cb,p}`, and the same for `‖·‖_p`, in `[0, ∞]` with no
  exception: `S_{MN} = S_M ∘ S_N` (§3.2), and the case excluded in §1.4 does not occur, because
  `S_M` is bounded on `S₂` (§3.1), so `‖S_M‖_p = 0` forces `S_M = 0` and `M = 0` almost
  everywhere.
- `‖S_M‖_{cb,p}` is unchanged when `M` is changed on a `μ ⊗ μ`-null set `N`: then `M_m` changes
  only on the null set of the points `((x, i), (y, j))` with `(x, y) ∈ N`, and §3.3 applies at
  every level.
- For a finite type `ι` with counting measure, `M_m` is the Kronecker product of `M` with the
  all-ones `m × m` matrix (`Matrix.kroneckerMap`, rows indexed by `ι × Fin m`), so `S_{M_m}` is
  the Hadamard multiplier of §3.4 by that matrix.

**Checks.**

- `M = 1`: the amplified symbol is the constant `1`, so `S_{M_m}` is the identity of
  `S₂(H^m)`, the `m`-th amplification of the identity, and `‖S_M‖_{cb,p} = 1` when `μ ≠ 0` (`0`
  when `μ = 0`). The plausible alternative `M(x, y) δ_{ij}` gives the block-diagonal pinching
  `[A_{ij}] ↦ [δ_{ij} A_{ii}]`, which for `m ≥ 2` and `μ ≠ 0` is not the amplification of the
  identity: it sends the block matrix with the single nonzero block `A ≠ 0` in position `(1, 2)`
  to `0`.
- On `{1, 2}` with `M = [[1, 2], [2, 1]]`: `‖S_M‖_∞ = ‖S_M‖_{cb,∞} = 2`, since
  `M = (3/2)·J − (1/2)·vvᵀ` with `J` the all-ones matrix and `v = (1, −1)`, `S_J = id` and
  `S_{vvᵀ}(A) = D_v A D_v` are complete isometries, so the bound `3/2 + 1/2 = 2` holds at every
  level, and `S_M(E₁₂) = 2E₁₂` gives the reverse.
- For the zero measure all norms are `0`.

*Needs:* §1.4, §2.4, §3.1, §3.2, §3.3, §3.4; Mathlib `Matrix.kroneckerMap`; VonNeumannAlgebras
V2.RectangularL2 (for `L²(Ω × Fin m)`).

### 3.6 Stabilisation and comparison of completely bounded norms

Prove (lafforgue-delasalle-2011 Lemma 1.5, line 254, and Remark 1.6, line 262):

- with `M_∞(x, i, y, j) = M(x, y)` on `Ω × ℕ` (counting measure on `ℕ`),
  `‖S_M‖_{cb,p} = ‖S_{M_∞}‖_{cb,p} = ‖S_{M_∞}‖_p`;
- for every σ-finite `(Ω', ν)` with `ν ≠ 0` (equivalently `L²(ν) ≠ 0`) and
  `M'(x, ω, y, ω') = M(x, y)` on `Ω × Ω'`, `‖S_{M'}‖_{cb,p} = ‖S_M‖_{cb,p}`, and
  `‖S_{M'}‖_p = ‖S_M‖_{cb,p}` when `L²(ν)` is infinite-dimensional, while
  `‖S_{M'}‖_p = ‖S_{M_d}‖_p` when `L²(ν)` has finite dimension `d ≥ 1`; for `ν = 0` the space
  `L²(μ ⊗ ν)` is `0` and every norm of `S_{M'}` is `0`;
- at `p = ∞`, when `‖S_M‖_∞ < ∞`, the extension `S_M : K(H) → K(H)` is completely bounded in the
  sense of CStarAlgebras C3.2 exactly when `‖S_M‖_{cb,∞} < ∞`, and then its C3.2 completely
  bounded norm is `‖S_M‖_{cb,∞}` (§1.4).

Route: `L²(Ω × Ω') ≅ L²(Ω) ⊗̂ L²(Ω')` (VonNeumannAlgebras V2.RectangularL2) carries `S_{M'}` to
`S_M ⊗ id`, defined on all of `S₂` because `‖S_M‖₂ = ‖M‖_∞ < ∞` (§3.5), and the stabilisation of
§1.4 applies; for finite `d ≥ 1` the completely bounded norm of `(S_M)^{(d)}` is
`sup_m ‖(S_M)^{(dm)}‖_p = ‖S_M‖_{cb,p}`, by monotonicity in the level. Remark 1.6 of
lafforgue-delasalle-2011 (line 262) quantifies over every σ-finite `(Ω', ν)`; the zero measure is
excluded here.

On a one-point `Ω` of mass `1` with `M = 1`, `‖S_M‖_{cb,2} = 1`; the stabilised multiplier has every
norm `1` for a one-point probability space `Ω'`, and every norm `0` for `ν = 0`, where `S_{M'}` is
the zero map of the zero space.

*Needs:* §1.4, §3.5; VonNeumannAlgebras V2.RectangularL2; CStarAlgebras C3.2.

### 3.7 Invariances

Prove, for `1 ≤ p ≤ ∞` and for the norms `‖·‖_p` and `‖·‖_{cb,p}` alike
(lafforgue-delasalle-2011 Lemma 1.9, line 342, and lines 339–341):

- **Measure-preserving isomorphisms.** For `φ` as in §2.4, the symbol `M ∘ (φ × φ)` has the same
  norms on `L²(μ₁)` as `M` on `L²(μ₂)`.
- **Change of measure.** For σ-finite `ν ≪ μ` (so `ν ⊗ ν ≪ μ ⊗ μ` and `M` defines a class for
  `ν ⊗ ν`), the norms for `ν` are at most those for `μ`; for equivalent measures they are equal.
- **Restriction.** For measurable `E ⊆ Ω`, the norms of `M|_{E × E}` on `L²(E, μ)` are at most
  those of `M`.
- **Transpose and conjugate symbols.** `‖S_{M^t}‖_p = ‖S_M‖_p` (since
  `S_{M^t}(A) = S_M(A^T)^T`, §2.3, §3.2) and `‖S_{M̄}‖_p = ‖S_M‖_p` (since
  `S_{M̄}(A) = J S_M(J A J) J`); the same for the completely bounded norms, because
  `(M^t)_m = (M_m)^t` and `(M̄)_m = (M_m)‾`.

**Checks.**

- Lebesgue measure on `[0, 1]` and `ν = 2x dx` are equivalent on `(0, 1]`, so every symbol has the
  same norms for both.
- For `ν = δ₀ ≪ μ = δ₀ + δ₁` on `{0, 1}`, `‖S_M‖_p` for `ν` is `|M(0, 0)|`, at most the norm for
  `μ`, which for `M = [[1, 2], [2, 1]]` and `p = ∞` is `2 > 1`.
- Point masses `w_i > 0` on a finite set give a measure equivalent to counting measure, so every
  symbol has the norms of its Hadamard multiplier of §3.4. For the masses `(1, 3)` on `{1, 2}` the
  unitary `g ↦ √w g` onto `ℓ²({1, 2})` (§2.4) carries a kernel `k` to the matrix
  `[[k₁₁, √3 k₁₂], [√3 k₂₁, 3 k₂₂]]`, which commutes with the Hadamard product by `M`; for
  `M = [[1, 2], [2, 1]]` this gives `‖S_M‖₂ = 2` and `‖S_M‖_∞ = ‖S_M‖_{cb,∞} = 2`, the values for
  counting measure (§3.1, §3.5).
- On `M₂` the transpose of the triangular truncation `[[1, 1], [0, 1]]` is `[[1, 0], [1, 1]]`, with
  the same norm `2/√3` at `p = ∞`.

*Needs:* §2.3, §2.4, §3.2, §3.4, §3.5.

### Examples

- Finite matrices: Hadamard multipliers; the triangular truncation on `M₂` with norm `2/√3`.
- Elementary symbols `f(x) g(y)`: two-sided multiplication operators, norm at most
  `‖f‖_∞ ‖g‖_∞`.
- Indicator symbols `1_{E × F}`: the compression `A ↦ D_{1_E} A D_{1_F}`, norm `1` when both sets
  are non-null.

### Dependencies

Layers 1–2; VonNeumannAlgebras V2.RectangularL2, V4.Core; CStarAlgebras C3.2; Mathlib
`Matrix.hadamard`; Tau Ceti `TauCeti.UnitarilyInvariantSeminorm.schatten`.

## Layer 4: duality and interpolation

Throughout this layer `(Ω, μ)` is σ-finite and `M ∈ L^∞(Ω × Ω, μ ⊗ μ)`.

### 4.1 Trace duality

Prove that `Tr(S_M(A) B) = Tr(A S_{M^t}(B))` for all `A, B ∈ S₂(H)`, by the trace formula of §2.2:
both sides equal `∫∫ M(x, y) k_A(x, y) k_B(y, x)`. Deduce from the duality of §1.4 that
`‖S_M‖_p = ‖S_{M^t}‖_{p'}` and `‖S_M‖_{cb,p} = ‖S_{M^t}‖_{cb,p'}`, and from §3.7 that
`‖S_M‖_p = ‖S_M‖_{p'}` and `‖S_M‖_{cb,p} = ‖S_M‖_{cb,p'}` for every `1 ≤ p ≤ ∞`
(lafforgue-delasalle-2011 Remark 1.3, line 244, and Remark 1.2, line 239). The norm statements
are `schurNorm_eq_of_holderConjugate`, in the equivalent form `‖S_M‖_p = ‖S_M‖_{p'}` and
`‖S_{M^t}‖_p = ‖S_M‖_p`, with the same for the completely bounded norms.

On `{1, 2}` with `M = 1_{(1,2)}`: `Tr(S_M(A) B) = A₁₂ B₂₁ = Tr(A S_{M^t}(B))`, while
`Tr(A S_M(B)) = A₂₁ B₁₂`; so the dual of `S_M` is `S_{M^t}`, not `S_M`. The triangular truncation of
§3.4 has `‖·‖₁ = ‖·‖_∞ = 2/√3`.

*Needs:* §1.4, §2.2, §3.2, §3.7.

### 4.2 Interpolation and monotonicity in the exponent

Prove that for `1 ≤ p₀, p₁ ≤ ∞`, `0 < θ < 1` and `1/p_θ = (1 − θ)/p₀ + θ/p₁`, in `[0, ∞]`,
`‖S_M‖_{p_θ} ≤ ‖S_M‖_{p₀}^{1−θ} ‖S_M‖_{p₁}^θ`, and the same for the completely bounded norms. When
both endpoint norms are finite this is the interpolation law of §1.4 for `T = S_M` and its
amplifications `S_{M_m}` (§3.5). Unlike a general map (§1.4), a Schur multiplier needs no
finiteness hypothesis: a zero endpoint norm (for the completely bounded norms, through
`‖S_M‖_p ≤ ‖S_M‖_{cb,p}`) makes `S_M` vanish on the finite-rank operators, which are dense in `S₂`
(§1.1), so `S_M = 0` and `M = 0` (§3.1) and every norm is `0`; hence when one endpoint norm is `∞`
the other is positive and the right side is `∞`. Deduce: if `|1/p − 1/2| ≤ |1/q − 1/2|` then
`‖S_M‖_p ≤ ‖S_M‖_q` and `‖S_M‖_{cb,p} ≤ ‖S_M‖_{cb,q}`; in particular
`‖M‖_∞ = ‖S_M‖₂ ≤ ‖S_M‖_p ≤ ‖S_M‖_∞` for every `p`, and `‖S_M‖_p ≤ ‖S_M‖_q` for
`2 ≤ p ≤ q ≤ ∞` (lafforgue-delasalle-2011 Remark 1.4, lines 246–252).
Route: `1/p` lies between `1/q` and `1/q' = 1 − 1/q`, so `1/p = (1 − θ)/q + θ/q'` for some
`θ ∈ [0, 1]`, and `‖S_M‖_p ≤ ‖S_M‖_q^{1−θ} ‖S_M‖_{q'}^θ = ‖S_M‖_q` by §4.1. The source writes the
interpolation identity with `p` and `q` exchanged (line 249); the version here is the one the
inequality needs. The two statements are `schurNorm_interpolation` and
`schurNorm_mono_of_abs_inv_sub_le`, the second with `|1/p − 1/2|` written through `p⁻¹.toReal`.

On `M₂` the triangular truncation has norms `1` at `p = 2` and `2/√3` at `p ∈ {1, ∞}`; at `p = 4`
the interpolation bound is `(2/√3)^{1/2} ≈ 1.0746`, between the two. For `M = [[1, 2], [2, 1]]` all
norms equal `2 = ‖M‖_∞`, so the chain can be an equality throughout.

*Needs:* §1.1, §1.3, §1.4, §3.1, §3.5, §4.1.

### 4.3 The weak-* extension to `B(H)`

Prove that if `‖S_M‖_∞ < ∞` there is a unique map `S̄_M : B(H) → B(H)` continuous for the weak-*
topology of `B(H) = S₁(H)*` (VonNeumannAlgebras V4.Core) that agrees with `S_M` on `S₂`: the adjoint
of `S_{M^t}` acting on `S₁`, of norm `‖S_{M^t}‖₁ = ‖S_M‖_∞` (§4.1). It is bimodular,
`S̄_M(D_f X D_g) = D_f S̄_M(X) D_g`, multiplicative in the symbol, and its amplifications are the
weak-* extensions of `S_{M_m}`, so it is completely bounded in the sense of CStarAlgebras C3.2
exactly when `‖S_M‖_{cb,∞} < ∞`, and then its completely bounded norm is `‖S_M‖_{cb,∞}`
(caspers-delasalle-2015 lines 28–34; cgpt-2023 lines 89–93).

For `M = 1` the extension is the identity of `B(H)`, and for `M = 1_{x=y}` on `ℕ` with counting
measure it is the diagonal projection of `B(ℓ²)` onto `ℓ^∞`; a map extending `S_M` by `0` off the
compact operators would send the identity of `ℓ²(ℕ)` to `0` in both cases.

*Needs:* §1.4, §3.2, §3.5, §4.1; VonNeumannAlgebras V4.Core; CStarAlgebras C3.2.

### Examples

- The triangular truncation on `M₂`: `1` at `p = 2`, `2/√3` at `p = 1` and `p = ∞`.
- Elementary symbols: the weak-* extension is `X ↦ D_f X D_g` on all of `B(H)`.

### Dependencies

Layers 1–3; VonNeumannAlgebras V4.Core; CStarAlgebras C3.2; through §1.3 of Layer 1,
NoncommutativeIntegration §1.5, §2.3, §2.5 and §2.6.

## Layer 5: conditional expectations of symbols

Throughout this layer `𝒜 ⊆ 𝓑` are σ-algebras on `Ω`, `μ` is a measure on `𝓑` that is σ-finite on
`𝒜`, and `L²(𝒜) = L²(Ω, 𝒜, μ)` (lafforgue-delasalle-2011 (6), lines 356–357). Conditional
expectations of symbols are those of §2.5 for `μ ⊗ μ` onto `𝒜 ⊗ 𝒜`, on which `μ ⊗ μ` is σ-finite
(§2.4), written `E[φ | 𝒜 ⊗ 𝒜]`; Mathlib's `MeasureTheory.condExp` agrees with them on integrable
symbols, in particular when `μ` is finite (§2.5), and is `0` on the others.

### 5.1 Contractivity of the conditional expectation

Prove that for `φ ∈ L^∞(𝓑 ⊗ 𝓑)` and every `1 ≤ p ≤ ∞`,
`‖E[φ | 𝒜 ⊗ 𝒜]‖_{S_p(L²(𝒜))} ≤ ‖φ‖_{S_p(L²(𝓑))}`, and the same for the completely bounded norms
(lafforgue-delasalle-2011 Lemma 1.10, line 363, proof lines 366–381). Route:
`S_{E[φ | 𝒜 ⊗ 𝒜]} = P ∘ S_φ ∘ ι` with the complete contractions of §2.4; on kernels, where `P`
acts by `MeasureTheory.condExpL2` (§2.4), this is the module property
`condExpL2(φ k) = E[φ | 𝒜 ⊗ 𝒜] k` for `𝒜 ⊗ 𝒜`-measurable `k ∈ L²(μ ⊗ μ)` (§2.5). Prove also the
pairing identity `Tr(S_φ(ι A) ι B) = Tr(S_{E[φ | 𝒜 ⊗ 𝒜]}(A) B)` for `A, B ∈ S₂(L²(𝒜))`
(lines 404–413): by §2.2 both sides integrate a symbol against the integrable
`𝒜 ⊗ 𝒜`-measurable function `k_A(x, y) k_B(y, x)`, and §2.5 applies.

On `{1, 2}` with counting measure and `𝒜` trivial, `L²(𝒜)` is the line of constants and the
inequality reads `|average of φ| ≤ ‖S_φ‖_p`: for `[[1, 2], [2, 1]]` it is `3/2 ≤ 2`, for the
triangular truncation `3/4 ≤ 2/√3`, and for `1_{(1,2)}` it is `1/4 ≤ 1`. On `ℕ` with counting
measure, `𝒜 = 𝓑` and `φ = 1`, `E[1 | 𝒜 ⊗ 𝒜] = 1`, both norms are `1` and the pairing identity for
`A = B = E₀₀` reads `1 = 1`; with `MeasureTheory.condExp` in place of §2.5 the left side would be
the zero multiplier and the pairing identity would read `1 = 0`.

*Needs:* §2.2, §2.4, §2.5, §3.3, §3.5.

### 5.2 Martingale limits

Let `(𝓑_α)` be a nonempty directed family of sub-σ-algebras of `𝓑`, each with `μ` σ-finite on it,
generating `𝓑`. For `f ∈ L^∞(𝓑 ⊗ 𝓑)` let `f_α = E[f | 𝓑_α ⊗ 𝓑_α]`. Prove that
`‖f‖_{S_p(L²(𝓑))} = sup_α ‖f_α‖_{S_p(L²(𝓑_α))}`, the net being nondecreasing, and the same for the
completely bounded norms (lafforgue-delasalle-2011 Lemma 1.11, line 383, and Remark 1.12, line 393).
Route: monotonicity and `≤` by §5.1 and the tower property of §2.5; `≥` by the pairing formula of
§3.3 tested on finite-rank operators with `𝓑_α ⊗ 𝓑_α`-measurable kernels, which are dense in
`S_p(L²(𝓑))` and `S_{p'}(L²(𝓑))` because `⋃_α L²(𝓑_α)` is dense in `L²(𝓑)` (the closure is `L²` of
the generated σ-algebra), together with the pairing identity of §5.1; the completely bounded case by
§3.6.

For the dyadic filtration of `[0, 1]` and `f = 1_{x<y}`: `f₀` is the constant `1/2` on the trivial
σ-algebra, with norm `1/2`; `f₁` is the `2 × 2` symbol `[[1/2, 1], [0, 1/2]]` on two atoms of mass
`1/2`, with norm at least `1` (its off-diagonal entry); the net is nondecreasing, as the lemma
asserts. On `ℕ` with counting measure, the family consisting of `𝓑` alone and `f = 1`, both
sides are `1`; with `MeasureTheory.condExp` in place of §2.5 the right side would be `0`. The
family must be nonempty (Mathlib's `Directed` does not require it): the empty family generates the
trivial σ-algebra, and for `𝓑 = {∅, Ω}`, `μ(Ω) = 1` and `f = 1` the left side is `1` while the
supremum over the empty family is `0`; the one-member family `𝓑₀ = 𝓑` gives `1 = 1`.

*Needs:* §2.5, §3.3, §3.6, §5.1; Mathlib `MeasureTheory.lpMeas`, `MeasureTheory.condExpL2`.

### 5.3 Independence of the ambient σ-algebra for completely bounded norms

Prove that for `φ ∈ L^∞(𝒜 ⊗ 𝒜)`, `‖φ‖_{cb, S_p(L²(𝒜))} = ‖φ‖_{cb, S_p(L²(𝓑))}`; hence, for
`φ ∈ L^∞(𝓑 ⊗ 𝓑)`, `‖E[φ | 𝒜 ⊗ 𝒜]‖_{cb, S_p(L²(𝓑))} ≤ ‖φ‖_{cb, S_p(L²(𝓑))}`
(lafforgue-delasalle-2011 Lemma 1.13, line 415, proof lines 419–439). Route: reduce to a finite
measure by an `𝒜`-measurable positive density (§3.7), which changes neither the norms nor
`E[φ | 𝒜 ⊗ 𝒜]` (§2.5); for finite `𝒜` the multiplier on `L²(𝓑)` is a block amplification of the
finite matrix multiplier (§3.6); in general choose a countably generated `𝒜₀ ⊆ 𝒜` for which `φ`
is `𝒜₀ ⊗ 𝒜₀`-measurable and finite σ-algebras `𝓑_n` increasing to `𝒜₀`; on the finite measure the
expectations of §2.5 are `MeasureTheory.condExp`, and `φ_n = E[φ | 𝓑_n ⊗ 𝓑_n] → φ` almost
everywhere (`MeasureTheory.Integrable.tendsto_ae_condExp` on the finite measure `μ ⊗ μ`, applied
to `Re φ` and `Im φ` through `ContinuousLinearMap.comp_condExp_comm`), and the completely bounded
norms of `φ_n` converge to those of `φ` on both spaces by §5.1 and the lower semicontinuity of §3.3
applied on `Ω × ℕ` (§3.6). The statement is for completely bounded norms only; for the norms it
is lafforgue-delasalle-2011 Question 1.14 (line 442).

On `Ω = {1, 2, 3, 4}` with counting measure and `𝒜` generated by `{1, 2}` and `{3, 4}`, the symbol
with block values `[[1, 2], [2, 1]]` acts on `L²(𝒜) ≅ ℂ²` (equivalent to counting measure) as that
`2 × 2` matrix and on `L²(𝓑) = ℂ⁴` as its Kronecker product with the all-ones `2 × 2` matrix, and
both completely bounded norms are `2`.

*Needs:* §2.5, §3.3, §3.6, §3.7, §5.1; Mathlib `MeasureTheory.Integrable.tendsto_ae_condExp`,
`ContinuousLinearMap.comp_condExp_comm`.

### Examples

- Trivial sub-σ-algebra: the conditional expectation is the average of the symbol.
- The dyadic filtration of `[0, 1]`: block-constant approximations of a symbol, with norms
  increasing to the norm of the symbol.

### Dependencies

Layers 2 and 3; Mathlib conditional expectations and Lévy's upward theorem.

## Layer 6: positive symbols and the Grothendieck–Haagerup characterisation

### 6.1 The Schur product theorem

For a finite type `ι` and `M ∈ Matrix ι ι ℂ`, prove that the following are equivalent:
`M` is positive semidefinite; `A ↦ M ⊙ A` is positive on `Matrix ι ι ℂ`; it is completely positive
(Mathlib `CompletelyPositiveMap` on `CStarMatrix ι ι ℂ`). When they hold, prove
`‖S_M‖_p = ‖S_M‖_{cb,p} = max_j M(j, j)` for every `1 ≤ p ≤ ∞` (the value `0` for empty `ι`)
(horn-johnson-topics-1991 Ch. 5; paulsen-2002 Ch. 3 and Ch. 8; pisier-grothendieck-2012
lines 767–772 for the diagonal form). Route: the `m`-th amplification is the Hadamard multiplier
by the Kronecker product of `M` with the all-ones matrix, positive semidefinite by
`Matrix.PosSemidef.kronecker`, so positivity of every amplification is
`Matrix.PosSemidef.hadamard`; conversely `M = S_M(J)` with `J` the all-ones matrix, which is
positive semidefinite. For the norm, write `M = Σ_k v_k v_k*`, so `S_M(A) = Σ_k D_{v_k} A D_{v_k}*`,
and `|⟨x, Σ_k D_{v_k} A D_{v_k}* y⟩| ≤ ‖A‖ (Σ_k ‖D_{v_k}* x‖²)^{1/2} (Σ_k ‖D_{v_k}* y‖²)^{1/2}` gives
`‖S_M‖_∞ ≤ max_j Σ_k |v_k(j)|² = max_j M(j, j)` at every level; `p = 1` by §4.1, since
`M^t = M̄` is positive semidefinite with the same diagonal; every `p` by §4.2; the lower bound
from `S_M(E_{jj}) = M(j, j) E_{jj}`. The norm formula is `schurNorm_of_posSemidef`, with `ι`
carrying counting measure and `max_j M(j, j)` written as the supremum over `j` of the real part of
`M(j, j)` in `[0, ∞]`.

**Checks.**

- `M = [[2, 1], [1, 1]]` (positive definite, determinant `1`): every norm is `2`, attained at
  `E₁₁`.
- `M = [[1, 2], [2, 1]]` is Hermitian with eigenvalue `−1`: its diagonal maximum is `1` but
  `‖S_M‖_∞ = 2` (§3.5), and `S_M(J) = M` is not positive; the positivity hypothesis cannot be
  dropped from the norm formula.
- For nonempty `ι`, `M = J` gives the identity (norm `1`), and `M = I` the diagonal projection
  (norm `1`); both are positive semidefinite with diagonal `1`. For empty `ι` both are the zero
  map of the zero space, of norm `0`, the maximum over the empty index set.

*Needs:* §3.4, §3.5, §4.1, §4.2; Mathlib `Matrix.PosSemidef.hadamard`,
`Matrix.PosSemidef.kronecker`, `CompletelyPositiveMap`, `CStarMatrix`.

### 6.2 The Haagerup factorisation constant

For σ-finite `(Ω, μ)` and `M ∈ L^∞(Ω × Ω, μ ⊗ μ)` define
`‖M‖_H = inf { ‖ξ‖_{L^∞(μ; ℓ²)} ‖η‖_{L^∞(μ; ℓ²)} } ∈ [0, ∞]` (Lean `haagerupNorm`) over almost
everywhere strongly measurable `ξ, η : Ω → ℓ²(ℕ)` (Mathlib `lp`) with `M(x, y) = ⟨ξ(x), η(y)⟩` for
`μ ⊗ μ`-almost every `(x, y)`; the infimum of the empty set is `∞` (lafforgue-delasalle-2011
Theorem 1.7, lines 274–278, where the Hilbert space varies with the factorisation over all
separable ones; cgpt-2023 lines 89–93; pisier-grothendieck-2012 (3.9), line 656, for finite index
sets).

- The infimum is unchanged when the factorisations may take values in any separable complex
  Hilbert space `K`, the infimum then running over all such `K` and all factorisations through
  them, and when `ℓ²(ℕ)` is replaced by one fixed infinite-dimensional separable `K`: every
  separable `K` embeds isometrically into `ℓ²(ℕ)`, and every infinite-dimensional separable `K`
  is isometrically isomorphic to `ℓ²(ℕ)`. For one fixed `K` of finite dimension `d` the infimum
  can be larger, since a factorisation through `K` writes `M` as a sum of at most `d` elementary
  symbols `f(x) g(y)` (for a finite index set, a matrix of rank at most `d`). The infimum is also
  unchanged when the maps are required to be strongly measurable: changing `ξ` on a `μ`-null set
  `N` changes `⟨ξ(x), η(y)⟩` only on the `μ ⊗ μ`-null set `N × Ω`, and leaves `‖ξ‖_∞` unchanged.
- `‖M‖_H` depends only on the class of `M`; `‖M‖_∞ ≤ ‖M‖_H` by Cauchy–Schwarz;
  `‖M + N‖_H ≤ ‖M‖_H + ‖N‖_H` (direct sums of balanced factorisations);
  `‖M N‖_H ≤ ‖M‖_H ‖N‖_H` (tensor products); `‖M^t‖_H = ‖M̄‖_H = ‖M‖_H` (pass to the conjugate
  Hilbert space); `‖f ⊗ g‖_H = ‖f‖_∞ ‖g‖_∞` for elementary symbols.
- Invariant under equivalent measures and measure-preserving isomorphisms.
- For a finite index set the infimum is attained, with `dim K ≤ |ι|`: replacing each `η_j` by its
  orthogonal projection onto the span of the `ξ_i` keeps every `⟨ξ_i, η_j⟩` and does not increase
  `‖η_j‖`; replacing `(ξ, η)` by `(tξ, η/t)` balances `max_i ‖ξ_i‖ = max_j ‖η_j‖` without changing
  the product; and the balanced factorisations through `ℂ^{|ι|}` with product at most a fixed bound
  form a compact set on which the product is continuous.

**Checks.**

- `M = [[1, 2], [2, 1]]`: with `v = (1, −1)`, `ξ_j = (√(3/2), v_j/√2)` and
  `η_k = (√(3/2), −v_k/√2)` give `⟨ξ_j, η_k⟩ = 3/2 − v_j v_k/2 = M(j, k)` and `‖ξ_j‖² = ‖η_k‖² = 2`,
  so `‖M‖_H ≤ 2`, and `|M(1, 2)| = 2` gives `‖M‖_H = 2`.
- The same `M = [[1, 2], [2, 1]]` has no factorisation through the fixed space `K = ℂ`: there
  `⟨ξ_j, η_k⟩ = conj(ξ_j) η_k` is a matrix of rank at most `1`, while `M` has determinant `−3`,
  so the infimum over `ℂ`-valued factorisations is `∞`. Through `ℂ²` the value `2` is attained
  (previous Check), and through `ℓ²(ℕ)` along the embedding `ℂ² ⊆ ℓ²(ℕ)`; a Hilbert space fixed
  for all symbols at once must be infinite-dimensional.
- The constant symbol `1` on `ℕ` with counting measure has `‖1‖_H = 1` (`ξ = η = e₀`, through the
  line `ℂ e₀` of `ℓ²(ℕ)`); the variant with `L²` norms of `ξ, η` in place of `L^∞` norms gives `∞`
  for it, and is not the right constant.
- The diagonal symbol `1_{i=j}` on `ℕ`: `ξ_i = η_i = e_i` in `ℓ²(ℕ)` gives `‖·‖_H = 1`.

*Needs:* §3.1; Mathlib `lp`, `MeasureTheory.AEStronglyMeasurable`, `MeasureTheory.eLpNorm`.

### 6.3 Grothendieck–Haagerup for finite index sets

For a finite type `ι` and `M ∈ Matrix ι ι ℂ` prove
`‖S_M‖_∞ = ‖S_M‖_{cb,∞} = ‖S_M‖₁ = ‖S_M‖_{cb,1} = ‖M‖_H`, the infimum being attained
(pisier-grothendieck-2012 Proposition 3.3, line 781, and Remark 13.4, line 2086; paulsen-2002
Ch. 8; pisier-similarity-2001 Ch. 5). Route: `‖S_M‖_{cb,∞} ≤ ‖M‖_H`, in coordinates. For a
factorisation `M(i, j) = ⟨ξ_i, η_j⟩` through `ℓ²(ℕ)` let `D_{ξ(n)}` and `D_{η(n)}` be the diagonal
matrices with entries the `n`-th coordinates `ξ_i(n)` and `η_j(n)`. Then
`S_M(A) = Σ_n D_{ξ(n)}* A D_{η(n)}`, entrywise absolutely convergent because
`Σ_n |ξ_i(n)| |η_j(n)| ≤ ‖ξ_i‖ ‖η_j‖`, and
`|⟨u, S_M(A) v⟩| ≤ ‖A‖ (Σ_n ‖D_{ξ(n)} u‖²)^{1/2} (Σ_n ‖D_{η(n)} v‖²)^{1/2}`, which is at most
`‖A‖ max_i ‖ξ_i‖ max_j ‖η_j‖ ‖u‖ ‖v‖` since `Σ_n ‖D_{ξ(n)} u‖² = Σ_i ‖ξ_i‖² |u_i|²`; the
amplified symbol `M_m` factors through the same vectors (`ξ_{(i, a)} = ξ_i`, `η_{(j, b)} = η_j`),
so the bound holds at every level. For
`‖M‖_H ≤ ‖S_M‖_∞`: by the finite-dimensional duality of the norms `‖·‖_H` and `‖·‖_{H'}`
(pisier-grothendieck-2012 (3.9)–(3.10), lines 656–665) it suffices to bound `|Σ ψ_{ij} M_{ij}|` for
`‖ψ‖_{H'} ≤ 1`; such `ψ` factor as `ψ_{ij} = α_i a_{ij} β_j` with `‖a‖ ≤ 1` and `α, β` unit vectors
of `ℓ²(ι)` (Remark 23.4, line 3541, from the minimax Lemma 23.1, line 3439, which for a finite
index set is the separation theorem `geometric_hahn_banach_point_closed`). Then
`Σ ψ_{ij} M_{ij} = Σ_{i,j} α_i (M ⊙ a)_{ij} β_j = ⟨ᾱ, S_M(a) β⟩`, where `ᾱ` is the coordinatewise
conjugate of `α` (the inner product is conjugate-linear in its first slot, and the pairing of
pisier-grothendieck-2012 line 800 is bilinear), so `|Σ ψ_{ij} M_{ij}| ≤ ‖ᾱ‖ ‖S_M(a)‖ ‖β‖ ≤ ‖S_M‖_∞`.
The `p = 1` equalities follow from §4.1 and `‖M^t‖_H = ‖M‖_H`.

On `M₂`: `[[1, 2], [2, 1]]` has all five quantities equal to `2` (§6.2), and with the factorisation
of §6.2 the coordinate form reads `S_M(A) = (3/2) A − (1/2) D_v A D_v`, the decomposition of
§3.5, bounded by `2 = max_i ‖ξ_i‖ max_j ‖η_j‖`; the triangular truncation
has all five equal to `2/√3` (§3.4); the transpose map of §1.4, which is not a Schur multiplier,
has norm `1` and completely bounded norm `2` at `p = ∞`, so the equality of norm and completely
bounded norm uses the Schur form. The conjugation of `α` is needed: for `α = (1, i)/√2`,
`β = (1, 1)/√2`, `a = I₂` and `M = diag(1, i)`, `ψ = diag(1/2, i/2)` and
`Σ ψ_{ij} M_{ij} = 1/2 + i · i/2 = 0 = ⟨ᾱ, S_M(a) β⟩`, whereas
`⟨α, S_M(a) β⟩ = 1/2 + conj(i) · i/2 = 1`.

*Needs:* §1.4, §3.4, §3.5, §4.1, §6.2; Mathlib `geometric_hahn_banach_point_closed`.

### 6.4 Grothendieck–Haagerup on σ-finite measure spaces

For σ-finite `(Ω, μ)` and `M ∈ L^∞(Ω × Ω, μ ⊗ μ)` prove
`‖S_M‖_∞ = ‖S_M‖_{cb,∞} = ‖S_M‖₁ = ‖S_M‖_{cb,1} = ‖M‖_H` in `[0, ∞]` (lafforgue-delasalle-2011
Theorem 1.7, line 274, proof lines 286–337; cgpt-2023 lines 89–94); this is
`schurNorm_eq_haagerupNorm`. Route: `‖S_M‖_{cb,∞} ≤ ‖M‖_H` by the coordinate estimate of §6.3. Let
`M(x, y) = ⟨ξ(x), η(y)⟩` almost everywhere with `‖ξ‖_∞ ‖η‖_∞ < ∞` (if one factor norm is `0`
then `M = 0` almost everywhere and `S_M = 0`; if one is `∞` and the other nonzero the bound is
`∞`), and let `c_j(x) = ξ(x)(j)` and `d_j(y) = η(y)(j)` be the coordinates, essentially bounded
and almost everywhere strongly measurable, with `Σ_j |c_j(x)| |d_j(y)| ≤ ‖ξ‖_∞ ‖η‖_∞` almost
everywhere (Cauchy–Schwarz in `ℓ²(ℕ)`). For `A ∈ S₂` with kernel `k = k_A` (§2.1) and
`f, g ∈ L²(μ)`, `⟨g, S_M(A) f⟩ = ∫∫ conj g(x) M(x, y) k(x, y) f(y) dμ(y) dμ(x)` (Fubini,
`MeasureTheory.integral_prod`, the integrand being integrable because
`∫∫ |g(x)| |k(x, y)| |f(y)| ≤ ‖k‖₂ ‖g‖₂ ‖f‖₂`); expanding `M(x, y) = Σ_j conj c_j(x) d_j(y)` under
that domination (`MeasureTheory.hasSum_integral_of_dominated_convergence`) gives
`⟨g, S_M(A) f⟩ = Σ_j ⟨c_j g, A(d_j f)⟩`, hence
`|⟨g, S_M(A) f⟩| ≤ ‖A‖ (Σ_j ‖c_j g‖₂²)^{1/2} (Σ_j ‖d_j f‖₂²)^{1/2}`, which is at most
`‖A‖ ‖ξ‖_∞ ‖η‖_∞ ‖g‖₂ ‖f‖₂` because `Σ_j ‖c_j g‖₂² = ∫ ‖ξ(x)‖² |g(x)|² dμ(x)`. On `Ω × Fin m`
the amplified symbol `M_m` (§3.5) factors through `ξ(x, i) = ξ(x)` and `η(y, j) = η(y)` with the
same norms, so the bound holds at every level. For
`‖M‖_H ≤ ‖S_M‖_∞` (assume it finite): reduce to a finite measure (§3.7, §6.2); choose a countably
generated `𝒜₀` for which `M` is `𝒜₀ ⊗ 𝒜₀`-measurable and finite σ-algebras `𝓑_n` increasing to `𝒜₀`;
`M_n = E[M | 𝓑_n ⊗ 𝓑_n]` has `‖S_{M_n}‖_∞ ≤ ‖S_M‖_∞` on `L²(𝓑_n)` (§5.1), so §6.3 on the atoms of
`𝓑_n` gives `M_n(x, y) = ⟨ξ_n(x), η_n(y)⟩` with `𝓑_n`-measurable `ξ_n, η_n`,
`‖ξ_n‖_∞ = ‖η_n‖_∞ ≤ (‖S_M‖_∞ + 1/n)^{1/2}`. Fix a non-principal ultrafilter `𝒰` on `ℕ` and form the
ultraproduct `K = ∏_𝒰 K_n` (VonNeumannAlgebras V13b). The facts used, proved there from the
construction, are: for bounded sequences `⟨[x_n], [y_n]⟩ = lim_𝒰 ⟨x_n, y_n⟩`, hence
`‖[x_n]‖ = lim_𝒰 ‖x_n‖`, and `K` is complete. Put `a(u) = [∫ u ξ_n dμ]` and `b(v) = [∫ v η_n dμ]`
for `u, v ∈ L¹(𝒜₀)`, bounded sequences since `‖∫ u ξ_n dμ‖ ≤ ‖u‖₁ ‖ξ_n‖_∞`; by the coordinate norm
and `lim_𝒰 ‖ξ_n‖_∞ ≤ ‖S_M‖_∞^{1/2}` (`𝒰` is non-principal), `‖a‖ ‖b‖ ≤ ‖S_M‖_∞`. Then
`⟨a(u), b(v)⟩ = lim_𝒰 ∫∫ conj u(x) v(y) M_n(x, y) = ∫∫ conj u(x) v(y) M(x, y)` by Lévy's theorem (on
the finite measure `μ ⊗ μ`, on which the expectations of §2.5 are `MeasureTheory.condExp`, for
`Re M` and `Im M`), dominated convergence (`|M_n| ≤ ‖M‖_∞`), and the agreement of `lim_𝒰` with the
limit of a convergent sequence for a non-principal `𝒰`. By the Radon–Nikodým representation of
BanachSpaceTheory B4.0, `a(u) = ∫ u ξ dμ` and `b(v) = ∫ v η dμ` with
`‖ξ‖_∞ ‖η‖_∞ ≤ ‖a‖ ‖b‖ ≤ ‖S_M‖_∞`; testing against products `u(x) v(y)` gives `M = ⟨ξ, η⟩` almost
everywhere; the closed span of the essential ranges of `ξ, η` is separable. The `p = 1` equalities
follow from §4.1 and §6.2.

On `[0, 1]`, elementary symbols `f(x) g(y)` have all five quantities equal to `‖f‖_∞ ‖g‖_∞`
(`K = ℂ`); on `ℝ` the Toeplitz symbol `cos(x − y)` has `ξ(x) = η(x) = (e^{ix}, e^{−ix})/√2` with
`⟨ξ(x), η(y)⟩ = cos(x − y)` and `‖ξ‖_∞ = ‖η‖_∞ = 1`, and `|M(x, x)| = 1`, so all five equal `1`;
in coordinates `S_M(A) = (D_{e^{−ix}} A D_{e^{ix}} + D_{e^{ix}} A D_{e^{−ix}})/2`, an average of two
unitary conjugations, and the coordinate bound is `‖S_M(A)‖ ≤ ‖A‖` because `Σ_j |c_j(x)|² = 1`.
For `K_n = ℂ` the ultraproduct is `ℂ`, through `[x_n] ↦ lim_𝒰 x_n`: `⟨[1], [i]⟩ = conj(1) · i = i`
and `‖[1 + 1/n]‖ = 1`. The ultrafilter must be non-principal: for the principal ultrafilter at `k`
the ultraproduct is `K_k`, `lim_𝒰` is evaluation at `k`, and `⟨a(u), b(v)⟩` pairs `conj u ⊗ v` with
`M_k` instead of `M`.

*Needs:* §2.1, §2.5, §3.5, §3.7, §4.1, §5.1, §6.2, §6.3; VonNeumannAlgebras V13b;
BanachSpaceTheory B4.0; Mathlib `MeasureTheory.integral_prod`,
`MeasureTheory.hasSum_integral_of_dominated_convergence`,
`MeasureTheory.Integrable.tendsto_ae_condExp`, `ContinuousLinearMap.comp_condExp_comm`.

### Examples

- Positive definite matrices: `‖S_M‖_p = max_j M(j, j)` for every `p`.
- `[[1, 2], [2, 1]]`: an explicit optimal factorisation through `ℂ²`.
- Toeplitz symbols of positive definite functions on `ℝⁿ` (`cos`), with factorisations by
  characters.

### Dependencies

Layers 1 (§1.4), 2 (§2.1, §2.5) and 3–5; Mathlib matrix order and completely positive maps, the
separation theorem, Fubini's theorem and dominated convergence for series; VonNeumannAlgebras
V13b; BanachSpaceTheory B4.0.

## Layer 7: atomless measure spaces

### 7.1 Atomless measures

Call a measure `μ` atomless when no set is an atom in the sense of Tau Ceti's
`MeasureTheory.Measure.IsAtom` (lafforgue-delasalle-2011 lines 487–488, where an atom is meant to
have positive measure).

- A σ-finite atom has finite measure, so for σ-finite measures atomlessness is invariant under
  equivalence of measures, under measure-preserving isomorphisms and under restriction to
  measurable sets; if `μ` is atomless so is `μ ⊗ ν` for every σ-finite `ν`.
- Sierpiński's theorem: if `μ` is atomless, `A` is measurable with `μ(A) < ∞` and
  `0 ≤ t ≤ μ(A)`, there is a measurable `B ⊆ A` with `μ(B) = t`; hence `A` is a disjoint union of `n`
  measurable sets of measure `μ(A)/n` for every `n ≥ 1`. This is BochnerSpaces §7.5 applied to the
  finite measure `μ.restrict A` and the set `A` with the ratio `t/μ(A)` (for `μ(A) = 0`, `t = 0`
  and `B = ∅`); `μ.restrict A` is atomless because an atom `E` of it gives the atom `E ∩ A` of `μ`.
  The `n` pieces follow by splitting off `μ(A)/n` from the remainder `n − 1` times.
- On a standard Borel space a σ-finite measure is atomless exactly when it has null singletons,
  by Tau Ceti's `MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton` and the point-mass
  description of atoms in `TauCeti/MeasureTheory/Measure/Atom.lean`.

**Checks.**

- Lebesgue measure on `[0, 1]` is atomless; counting measure on `{1, 2}` has the atoms `{1}` and
  `{2}`; `δ₀ + ` Lebesgue measure on `[0, 1]` has the atom `{0}`.
- The countable–cocountable measure on an uncountable set (value `0` on countable sets, `1` on
  cocountable ones) has null singletons, so it satisfies `MeasureTheory.NullSingletonClass`, but
  the whole space is an atom: the two notions differ off standard Borel spaces. It has no set of
  measure `1/2`, so Sierpiński's theorem fails under null singletons alone.
- Lebesgue measure, `A = [0, 2]` and `t = 1/2`: `μ.restrict A` has mass `2`, the ratio is `1/4`,
  and a subset of measure `(1/4) · 2 = 1/2` is `[0, 1/2]`; with the ratio taken as `t` itself the
  subset would have measure `1`.
- The zero measure is atomless, and every finite-measure set splits into `n` null pieces.

*Needs:* Tau Ceti `MeasureTheory.Measure.IsAtom`,
`MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton`; Mathlib
`MeasureTheory.NullSingletonClass`; BochnerSpaces §7.5.

### 7.2 Equal-measure refinements

Let `𝒜 ⊆ 𝓑` be finite σ-algebras on `Ω`, `μ` a finite measure on `𝓑`, and assume that every
minimal nonempty set `A` of `𝒜` is a union of minimal nonempty sets of `𝓑` that all have one
measure, a value which may depend on `A`. Prove that for every `𝓑 ⊗ 𝓑`-measurable `φ` and
`1 ≤ p ≤ ∞`, `‖E[φ | 𝒜 ⊗ 𝒜]‖_{S_p(L²(𝓑))} ≤ ‖φ‖_{S_p(L²(𝓑))}` (lafforgue-delasalle-2011
Lemma 1.17, lines 489–490, proof lines 493–501). Route: reduce to a finite weighted set; for
independent uniformly random permutations `σ, σ'` of the minimal sets of `𝓑` preserving each
minimal set of `𝒜`, `E[φ | 𝒜 ⊗ 𝒜](x, y)` is the expectation of `φ(σx, σ'y)`; each `φ(σ ·, σ' ·)`
has the norm of `φ` because the permutation unitaries are measure preserving (equal masses inside
each minimal set of `𝒜`), and the triangle inequality concludes.

**Checks.**

- On `{1, 2}` with counting measure and `𝒜` trivial the conclusion is `|average of φ| ≤ ‖S_φ‖_p`
  for the constant symbol acting on `M₂`, the same numbers as §5.1.
- The common measure is fixed inside each minimal set of `𝒜` only: on `{1, 2, 3, 4}` with masses
  `(1, 1, 3, 3)`, `𝓑` the power set and `𝒜` generated by `{1, 2}` and `{3, 4}`, the hypothesis
  holds with the values `1` and `3`, and the permutations of the route are the four elements of
  the group generated by the transpositions `(1 2)` and `(3 4)`, each measure preserving. A
  hypothesis asking one measure for all minimal sets of `𝓑` would exclude this space, while §7.3
  cuts a minimal set `A` of `𝒜` into pieces of measure `μ(A)/n`, which depends on `A`.
- With masses `(1, 2, 3, 3)` and the same `𝒜` the hypothesis fails: `(1 2)` exchanges points of
  masses `1` and `2` and is not measure preserving. The route breaks at the averaging step: on
  `{1, 2}²` the expectation `E[φ | 𝒜 ⊗ 𝒜]` weights the four values of `φ` by `(1, 2, 2, 4)/9`,
  while the average of `φ(σx, σ'y)` over independent uniform permutations of `{1, 2}` weights each
  of them by `1/4`.

*Needs:* §2.5, §3.7, §5.1.

### 7.3 Norm equals completely bounded norm on atomless spaces

Prove that for an atomless σ-finite `(Ω, μ)`, every `M ∈ L^∞(Ω × Ω, μ ⊗ μ)` and every `1 ≤ p ≤ ∞`,
`‖S_M‖_p = ‖S_M‖_{cb,p}` (lafforgue-delasalle-2011 Theorem 1.18, line 505, proof lines 508–520;
cgpt-2023 §1.1 property i), line 231); this is `schurNorm_eq_schurCbNorm_of_forall_not_isAtom`, with
atomlessness written as: no set is a `MeasureTheory.Measure.IsAtom`. Route: pass to an equivalent
finite measure (§3.7, §7.1; for `μ = 0` it is `0`, every `L²` space is `0` and both sides are `0`);
by §5.2 along the directed family of finite sub-σ-algebras (nonempty: it contains the trivial
σ-algebra) it suffices that `‖E[M | 𝒜 ⊗ 𝒜]‖_{cb, S_p(L²(𝒜))} ≤ ‖M‖_{S_p(L²(𝓑))}` for finite `𝒜`; for
each `n` split every minimal set of `𝒜` into `n` sets of equal measure (§7.1), generating `𝓑'`; then
the `n`-th amplification norm of `E[M | 𝒜 ⊗ 𝒜]` on `L²(𝒜)` is its norm on `L²(𝓑') ≅ L²(𝒜) ⊗ ℓ²_n`
(§3.6), at most `‖E[M | 𝓑' ⊗ 𝓑']‖_{S_p(L²(𝓑'))}` by §7.2 applied to `E[M | 𝓑' ⊗ 𝓑']`, whose
expectation onto `𝒜 ⊗ 𝒜` is `E[M | 𝒜 ⊗ 𝒜]` by the tower law of §2.5, and at most `‖M‖_{S_p(L²(𝓑))}`
by §5.1.

**Checks.**

- Lebesgue measure on `[0, 1]`: every symbol has equal norm and completely bounded norm; for the
  triangular truncation `1_{x<y}` both are `1` at `p = 2`.
- The theorem is not stated under `MeasureTheory.NullSingletonClass`: the disjoint union of two
  copies of the countable–cocountable space has null singletons and `L² ≅ ℂ²`, so its Schur
  multipliers are those of `M₂`, to which the proof does not apply (a two-point space cannot be
  refined into sets of equal positive measure); the source records that no Schur multiplier on
  `S_p^n` with different norm and completely bounded norm is known, and conjectures that one
  exists on `S_p(ℓ²)` for `1 < p < ∞`, `p ≠ 2` (lafforgue-delasalle-2011 Conjecture 1.8,
  lines 281–285).
- Counting measure on `{1, 2}` is excluded; at `p ∈ {1, ∞}` equality holds there by §6.3, and at
  `p = 2` by §3.5, independently of this theorem.

*Needs:* §2.5, §3.6, §3.7, §5.1, §5.2, §7.1, §7.2.

### Examples

- Lebesgue measure on `ℝⁿ` and on `[0, 1]`; Gaussian measures of nondegenerate covariance, for
  instance `ProbabilityTheory.gaussianReal m v` on `ℝ` with variance `v > 0`, which has null
  singletons (`ProbabilityTheory.nullSingletonClass_gaussianReal`) and is atomless by §7.1 on the
  standard Borel space `ℝ`; any atomless σ-finite space. A Gaussian of variance `0` is excluded:
  `ProbabilityTheory.gaussianReal m 0` is the point mass `δ_m`
  (`ProbabilityTheory.gaussianReal_zero_var`), the singleton `{m}` is an atom and `L² = ℂ`.
- Counting measure on `{1, …, n}`: excluded; no Schur multiplier on `S_p^n` with different norm
  and completely bounded norm is known (lafforgue-delasalle-2011 lines 283–285).

### Dependencies

Layers 2 (§2.5), 3 and 5; Tau Ceti `MeasureTheory.Measure.IsAtom`; BochnerSpaces §7.5.

## Layer 8: continuous symbols on Radon measure spaces

Throughout this layer `X` is a locally compact Hausdorff space with its Borel σ-algebra and `μ` is
a σ-finite Radon measure on `X` (Conventions).

### 8.1 Finitely supported approximation of a Radon measure

Prove that for a finite Radon measure `μ` there is a net `(μ_α)` of finitely supported measures
`μ_α = Σ_i c_{α,i} δ_{x_{α,i}}`, `c_{α,i} ≥ 0`, `x_{α,i} ∈ supp μ`, with
`∫ F d(μ_α ⊗ μ_α) → ∫ F d(μ ⊗ μ)` for every continuous compactly supported `F` on `X × X` and
`∫ f dμ_α → ∫ f dμ` for every continuous compactly supported `f` on `X`
(lafforgue-delasalle-2011 lines 555–559). Route: Riemann sums `Σ_i μ(V_i) δ_{x_i}` over finite Borel
partitions `(V_i)` of a compact set into pieces on which finitely many test functions oscillate by
less than `ε`, with tags `x_i ∈ V_i ∩ supp μ` when `μ(V_i) > 0` (possible since `supp μ` is conull,
`MeasureTheory.Measure.support`), directed by the finite family of test functions and `ε`.

The integrals against `μ ⊗ μ` and `μ_α ⊗ μ_α` are taken for the product of the Borel σ-algebras,
and every continuous compactly supported `F` on `X × X` is measurable for it, with no countability
hypothesis on `X`: `F` vanishes off `K × K`, where the compact `K` is the union of the two
projections of the support of `F`; the finite sums `Σ_i f_i(x) g_i(y)` with `f_i, g_i ∈ C(K, ℂ)`
form a star subalgebra of `C(K × K, ℂ)` containing the constants and separating points (continuous
functions separate the points of the compact Hausdorff space `K`, by Urysohn's lemma), so the
restriction of `F` to `K × K` is a uniform limit of such sums (Stone–Weierstrass); each
`f_i(x) g_i(y)`, extended by `0` off `K × K`, is a product of Borel functions of `x` and of `y`
(`K` is closed), and the uniform limit of measurable functions is measurable.

*Needs:* Mathlib `MeasureTheory.Measure.support`, `MeasureTheory.IsFiniteMeasureOnCompacts`,
`MeasureTheory.Measure.InnerRegularCompactLTTop`,
`ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
`exists_continuous_zero_one_of_isClosed`.

### 8.2 Continuous symbols

Let `M : X × X → ℂ` be continuous, `1 ≤ p ≤ ∞` and `C` a finite real `C ≥ 0`. Prove that the
following are equivalent (lafforgue-delasalle-2011 Theorem 1.19, line 524, proof lines 535–588;
cgpt-2023 §1.1 property ii), lines 232–237; caspers-delasalle-2015 Theorem 3.1, line 282):

- `M` is `μ ⊗ μ`-essentially bounded and `‖S_M‖_p ≤ C`;
- for every finite `Σ ⊆ supp μ`, the matrix multiplier `(M(s, t))_{s, t ∈ Σ}` on `S_p(ℓ²(Σ))` has
  norm at most `C`.

The same equivalence holds for the completely bounded norms. In `Suggested.lean` these are
`schurNorm_le_iff_of_continuous` and `schurCbNorm_le_iff_of_continuous`, where a finite `Σ` is
enumerated by an injective `s : Fin N → X` and `ℓ²(Σ)` carries counting measure. The points are
distinct, as in the source: with a repeated point the matrix is block-constant, and its norm lies
between the norm and the completely bounded norm of the matrix on the distinct points (§3.5,
§3.7). Consequently `‖S_M‖_p` and
`‖S_M‖_{cb,p}` depend only on `supp μ` (and on `M` there), and if `supp μ` has no isolated point then
`‖S_M‖_p = ‖S_M‖_{cb,p}`. Route: pass to an equivalent finite Radon measure with the same support
(§3.7). Then `M` is almost everywhere strongly measurable for `μ ⊗ μ` (a property of the null sets
of `μ ⊗ μ`, the same for equivalent measures), so it defines an almost-everywhere class: choose
compact sets `K_j` increasing with `μ(X ∖ K_j) < 1/j` (`MeasurableSet.exists_isCompact_lt_add`
applied to `X`, then finite unions); on `K_j × K_j` the function `M` is a uniform limit of finite
sums `Σ_i f_i(x) g_i(y)` of continuous functions on `K_j` (Stone–Weierstrass, as in §8.1), so
`M · 1_{K_j × K_j}` is measurable for the product σ-algebra; these functions converge everywhere to
`M · 1_N` with `N = ⋃_j K_j × K_j`, and the complement of `N` lies in
`((X ∖ ⋃_j K_j) × X) ∪ (X × (X ∖ ⋃_j K_j))`, which is `μ ⊗ μ`-null. First to second: for disjoint
Borel neighbourhoods `V_i` of the points of `Σ` (Hausdorff; `μ(V_i) > 0` since the points are in
the support), §5.1 for the σ-algebra they generate and §3.7 bound the matrix of averages of `M`
over `V_i × V_j` by `C`, and the averages tend to `M(s_i, s_j)` by continuity. Second to first:
`|M(s, t)| ≤ C` on `supp μ × supp μ` (the two-point matrices, tested on matrix units), which is
conull, so `M` is essentially bounded; then the pairing formula
of §3.3 over operators whose kernels are finite sums of products of continuous compactly
supported functions. These are dense in every `S_q`, `1 ≤ q ≤ ∞`: finite-rank operators are dense
(§1.1), each is a limit in `S₁`, hence in `S_q`, of such operators because `‖u ⊗ v*‖₁ = ‖u‖ ‖v‖`,
and continuous compactly supported functions are dense in `L²(μ)`. That density needs no
normality of `X`: for a Borel set `E` of finite measure take a compact `K ⊆ E` with `μ(E \ K)`
small (`MeasurableSet.exists_isCompact_lt_add`), an open `U ⊇ K` with `μ(U \ K)` small
(`IsCompact.exists_isOpen_lt_add`) and a compactly supported Urysohn function `1_K ≤ φ ≤ 1_U`
(`exists_continuousMap_one_of_isCompact_subset_isOpen`), so that
`‖φ − 1_E‖₂² ≤ μ(E \ K) + μ(U \ K)`; when `X` is moreover normal the density is
`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` at `p = 2`. Then Gram–Schmidt writes
such kernels in an orthonormal family, and §8.1 passes from the finitely supported `μ_α` to `μ`.
The completely bounded case is the same on `X × ℕ` (§3.6). Without isolated points, distinct nets
converging to the points of `Σ` realise every amplification of the finite matrix inside the
support.

**Checks.**

- `X = ℝ`, Lebesgue measure, `M(x, y) = e^{i(x−y)}`: every finite restriction is a conjugation by a
  diagonal unitary, of norm `1`, so `‖S_M‖_p = 1` for every `p`.
- `μ = δ₀ + δ₁` on `ℝ` and continuous `M` with `M(0, 0) = M(1, 1) = 1`, `M(0, 1) = M(1, 0) = 2`:
  `‖S_M‖_∞ = 2`, the norm of `[[1, 2], [2, 1]]`, whatever the values of `M` off `{0, 1}²`.
- `C` must be finite: for `M(x, y) = x` on `ℝ` with Lebesgue measure every finite restriction has
  finite norm, so the second condition holds with `C = ∞`, while `M` is not essentially bounded and
  has no multiplier.
- Continuity is needed: the symbol `1_{x=y}` on `[0, 1]` with Lebesgue measure is `0` almost
  everywhere, so its multiplier is `0`, while all its finite restrictions are identity matrices
  of norm `1`.
- The measurability step is needed: on a discrete space `X` of cardinality larger than the
  continuum, with `μ = δ_{x₀}`, the symbol `M = 1_{x=y}` is continuous (`X × X` is discrete) but not
  measurable for the product σ-algebra. A set of that σ-algebra lies in the σ-algebra generated by
  countably many rectangles `A_n × B_n`; if the diagonal did, then for distinct `x, y` lying in the
  same sets `A_n` and `B_n` the points `(x, x)` and `(x, y)` would lie in the same rectangles, hence
  in the same sets of the generated σ-algebra, while only `(x, x)` is on the diagonal; so the sets
  `A_n, B_n` would separate the points of `X` and inject `X` into `{0, 1}^ℕ`, which is too small.
  The step may take every `K_j = {x₀}`: `M · 1_{K_j × K_j} = 1_{(x₀, x₀)}` is measurable and equals
  `M` off a `μ ⊗ μ`-null set; since `μ ⊗ μ = δ_{(x₀, x₀)}` the class is the constant `1`, and
  `‖S_M‖_p = 1`, the norm of the `1 × 1` restriction to `supp μ = {x₀}`.

*Needs:* §1.1, §3.3, §3.6, §3.7, §5.1, §8.1; Mathlib `MeasureTheory.Measure.support`,
`MeasurableSet.exists_isCompact_lt_add`, `IsCompact.exists_isOpen_lt_add`,
`exists_continuousMap_one_of_isCompact_subset_isOpen`,
`ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
`exists_continuous_zero_one_of_isClosed`.

### Examples

- Lebesgue measure on `ℝⁿ`: support `ℝⁿ` with no isolated point, so norm and completely bounded
  norm of continuous symbols agree and are computed on finite point sets.
- Finitely supported measures: the theorem reduces to finite matrices.

### Dependencies

Layers 1, 3 and 5; Mathlib measure support, inner and outer regularity, Urysohn's lemma for
locally compact Hausdorff and for normal spaces, and the Stone–Weierstrass theorem.

## Layer 9: Toeplitz symbols and Fourier–Schur transference on `ℝⁿ`

Throughout this layer `n ≥ 1`, except that the equality of §9.5 is also stated for `n = 0`; `ℝⁿ`
carries Lebesgue measure, `m ∈ L^∞(ℝⁿ)`, and `e_a(x) = e^{2πi⟨a, x⟩}`.

### 9.1 Toeplitz symbols

Define the Toeplitz symbol `M_m ∈ L^∞(ℝⁿ × ℝⁿ)` by `M_m(x, y) = m(x − y)`, a well-defined class
because `(x, y) ↦ (x − y, y)` is a measure-preserving linear isomorphism of `ℝ^{2n}` (cgpt-2023
lines 59–66; caspers-delasalle-2015 lines 28–30; lafforgue-delasalle-2011 Notation 2.1, line 597).

- `‖M_m‖_∞ = ‖m‖_∞`; `M_{m₁ m₂} = M_{m₁} M_{m₂}`; `(M_m)^t = M_{m(−·)}`; `M̄_m = M_{m̄}`.
- Covariance: `S_{M_m}` commutes with conjugation by translations and by modulations `D_{e_a}`; for
  `V_t f = f(· + t)`, `S_{M_{m(·−t)}}(A) = V_t⁻¹ S_{M_m}(V_t A)`, so symbol translates have the same
  norms and completely bounded norms; unitary dilations `f ↦ s^{n/2} f(s ·)` give
  `‖S_{M_{m(s·)}}‖_p = ‖S_{M_m}‖_p`.
- Mollification: for a probability density `ρ`, `S_{M_{m * ρ}}` is the `ρ`-average of the
  multipliers of the translates `M_{m(·−t)}`, so `‖S_{M_{m*ρ}}‖_{(cb),p} ≤ ‖S_{M_m}‖_{(cb),p}`.

**Checks.**

- `m = e_a`: `M_m(x, y) = e_a(x) conj e_a(y)` and `S_{M_m}(A) = D_{e_a} A D_{e_a}*`, of norm and
  completely bounded norm `1` for every `p`.
- `m = cos(2π⟨a, ·⟩)`: `M_m = (M_{e_a} + M_{e_{−a}})/2`, and each `S_{M_{e_{±a}}}` is the
  conjugation by the diagonal unitary `D_{e_{±a}}` (§3.1), with norm and completely bounded norm at
  most `1` (§3.3, §3.5), so `‖S_{M_m}‖_p ≤ ‖S_{M_m}‖_{cb,p} ≤ (1 + 1)/2 = 1` for every `p`. Equality
  holds for every `p`: for `u` the normalised indicator of the ball of radius `r` about `0`,
  `S_{M_m}(u ⊗ u*) = (c u) ⊗ (c u)* + (s u) ⊗ (s u)*` with `c = cos(2π⟨a, ·⟩)` and
  `s = sin(2π⟨a, ·⟩)`, a positive operator of operator norm at least `‖c u‖²`, which tends to `1`
  as `r → 0`, while `‖u ⊗ u*‖_p = 1` (§1.1: `‖X‖_p ≥ ‖X‖`).
- `m = 1_{{0}}` is `0` almost everywhere, so `M_m = 0` and `S_{M_m} = 0`; reading `M_m` pointwise
  on the diagonal would give the identity's "diagonal part", which is not a Schur multiplier.

*Needs:* §3.1, §3.3, §3.5, §3.7; Mathlib `MeasureTheory.MeasurePreserving`.

### 9.2 Fourier multipliers on `Lᵖ(ℝⁿ)` and their completely bounded norms

For `k ≥ 1` let `F_k` be `Matrix (Fin k) (Fin k) ℂ` with the Hilbert–Schmidt inner product
`⟨a, b⟩ = Tr(a* b)`, Tau Ceti's `Matrix.frobeniusInnerProductSpace`, and let `T_m^{(k)}` be Tau
Ceti's `MeasureTheory.Lp.fourierMultiplierCLM F_k m` on `L²(ℝⁿ; F_k)`, for `m ∈ L^∞(ℝⁿ)` the class
`MeasureTheory.Lp ℂ ∞ volume`; it is the entrywise action of `T_m`. For `1 ≤ p ≤ ∞` put
`‖f‖_{Lᵖ(S_p^k)} = (∫ ‖f(x)‖_{S_p^k}^p dx)^{1/p}` (essential supremum at `p = ∞`), where
`‖a‖_{S_p^k}` is Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm.schatten` of the operator
`Matrix.toEuclideanLin a` on `ℂ^k` (Lean `lpSchattenNorm`), and define
`‖T_m^{(k)}‖_p = sup { ‖T_m^{(k)} f‖_{Lᵖ(S_p^k)} : f ∈ L²(ℝⁿ; F_k), ‖f‖_{Lᵖ(S_p^k)} ≤ 1 } ∈ [0, ∞]`,
`‖T_m‖_p = ‖T_m^{(1)}‖_p` and `‖T_m‖_{cb,p} = sup_k ‖T_m^{(k)}‖_p` (Lean
`fourierMultiplierCbNorm`, whose supremum also admits the zero level `k = 0`; cgpt-2023 lines 60–74
and 250–251; caspers-delasalle-2015 lines 26–41; lafforgue-delasalle-2011 (3), lines 193–199).

- At `p = 2`: `‖T_m‖_{cb,2} = ‖T_m‖₂ = ‖m‖_∞` (Plancherel, `MeasureTheory.Lp.fourierTransformₗᵢ`,
  and `MeasureTheory.Lp.norm_fourierMultiplierCLM_le` for `≤`; concentration of `𝓕 f` near Lebesgue
  points of `|m|` for `≥`).
- **The tracial picture of `Lᵖ(ℝⁿ; S_p^k)`.** Let `𝓡_k = L^∞(ℝⁿ; F_k)` be the von Neumann algebra
  of essentially bounded `F_k`-valued functions acting by multiplication on `L²(ℝⁿ; ℂ^k)` (the
  algebra `L^∞(ℝⁿ) ⊗̄ M_k`), with `τ_k(g) = ∫ Tr g(ξ) dξ` on its positive elements. Prove that
  `τ_k` is a normal faithful semifinite trace, that the norm of `𝓡_k` is `ess sup_ξ ‖g(ξ)‖`, the
  `p = ∞` value of `‖·‖_{Lᵖ(S_p^k)}`, and that for `1 ≤ p < ∞` and every bounded `g`,
  `τ_k(|g|^p) = ∫ ‖g(ξ)‖_{S_p^k}^p dξ` in `[0, ∞]`; hence the tracial
  `Lᵖ(𝓡_k, τ_k)` of NoncommutativeIntegration §1.3 is `Lᵖ(ℝⁿ; S_p^k)`, isometrically, through the
  identity on the bounded functions vanishing off a set of finite measure (cgpt-2023
  lines 249–252, for the fibre `B(L²(ℝⁿ))`). Route: for bounded `g`, every polynomial in `g* g`
  is computed pointwise, and the uniform approximation of `t ↦ t^{p/2}` by polynomials on
  `[0, ‖g‖²]` gives `|g|^p(ξ) = |g(ξ)|^p` almost everywhere; the operator norm of multiplication
  by `g` is at least `c` whenever `‖g(ξ) v‖ > c` on a set `E` of positive finite measure for one
  vector `v` of a countable dense subset of the unit sphere of `ℂ^k` (test on `1_E v`); the
  bounded elements of finite-trace support are the bounded functions vanishing off a set of
  finite measure, which are dense on both sides (NoncommutativeIntegration §1.3; on the Bochner
  side the truncations `g · 1_{‖g‖ ≤ j} · 1_{|ξ| ≤ j}` and dominated convergence), and both
  sides are complete. At `k = 1` this is the commutative identification of
  NoncommutativeIntegration §1.5; NoncommutativeIntegration §4.4 identifies Bochner spaces with
  noncommutative `Lᵖ` for probability spaces only, and Lebesgue measure on `ℝⁿ` is infinite.
- `‖T_m‖_p ≤ ‖T_m‖_{cb,p}`; `k ↦ ‖T_m^{(k)}‖_p` is nondecreasing.
- Modulation: `T_m(e_s f) = e_s T_{m(·+s)} f`, so symbol translates have the same norms; the
  reflection `R f = f(−·)` is a complete isometry with `R T_m R = T_{m(−·)}`; unitary dilations
  preserve the norms.
- Duality: `‖T_m‖_{(cb),p} = ‖T_m‖_{(cb),p'}`, since the transpose of `T_m` for the bilinear pairing
  `∫ tr(f g)` is `T_{m(−·)}`.
- Mollification `‖T_{m*ρ}‖_{(cb),p} ≤ ‖T_m‖_{(cb),p}` (average of modulation conjugates), and lower
  semicontinuity under boundedly almost-everywhere convergent symbols
  (`MeasureTheory.Lp.tendsto_fourierMultiplierCLM_apply` and Fatou's lemma).

**Checks.**

- `m = e_a`: `T_m f = f(· + a)`, a complete isometry of every `Lᵖ(ℝⁿ; S_p^k)`; the opposite sign
  convention for `𝓕` would give `f(· − a)`, with the same norms, which is why the convention is
  pinned on this witness rather than on a norm.
- `m = cos(2π⟨a, ·⟩)`: `T_m = (V_a + V_{−a})/2` has norm at most `1` on every `Lᵖ`, and equal to `1`
  at `p = 1`, since `‖T_m f‖₁ = ‖f‖₁` for nonnegative `f`.
- `m = 1`: the identity, all norms `1`; `m = 0`: all norms `0`.
- Tracial picture, a projection of finite trace on a space of infinite measure: `n = 1`, `k = 2`,
  `g = 1_{[0, 2]} E₁₁` has `|g|^p = g`, so `τ₂(|g|^p) = 2 = ∫_0^2 ‖E₁₁‖_p^p dξ` and both norms are
  `2^{1/p}`; at `p = ∞` both are `1`. The measure of `ℝ` is infinite, so the probability-space
  identification of NoncommutativeIntegration §4.4 does not reach this case.
- Tracial picture, matrix and not entrywise: `g = 1_{[0, 1]} a` with `a = [[1, 1], [0, 0]]` has
  `|g|² = 1_{[0, 1]} [[1, 1], [1, 1]]` and singular values `√2, 0` at each point of `[0, 1]`, so
  `‖g‖ = √2` in every `Lᵖ(S_p^2)` and in `𝓡_2`; the entrywise model `(∫ Σ_{i,j} |g_{ij}|^p)^{1/p}`
  gives `2^{1/p}`, which is `2` at `p = 1`, and the entrywise maximum gives `1` at `p = ∞`.
- Tracial picture, normalisation of the trace: `g = 1_{[0, 1]} I_k` has `τ_k(|g|^p) = k`, so its
  norm is `k^{1/p} = ‖I_k‖_{S_p^k}`, the unnormalised Schatten norm of Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.schatten`; the normalised trace `tr = Tr/k` would give `1`
  and break the identification. For `n = 1` the function `1_{[0, ∞)} E₁₁` lies in `𝓡_k` with
  norm `1` and in no `Lᵖ`, `p < ∞`, since both `τ_k(|g|^p)` and `∫ ‖g(ξ)‖_p^p dξ` are `∞`.

*Needs:* Tau Ceti `MeasureTheory.Lp.fourierMultiplierCLM`,
`MeasureTheory.Lp.norm_fourierMultiplierCLM_le`, `MeasureTheory.Lp.tendsto_fourierMultiplierCLM_apply`,
`TauCeti.UnitarilyInvariantSeminorm.schatten`; NoncommutativeIntegration §1.3, §1.5; Mathlib
`MeasureTheory.Lp.fourierTransformₗᵢ`, `MeasureTheory.eLpNorm`.

### 9.3 Følner compressions of convolution operators

For `g ∈ L²(ℝⁿ; F_k)` and a bounded measurable `F ⊆ ℝⁿ` of positive measure, define `Λ_F(g)` as the
Hilbert–Schmidt operator on `L²(F)^k = L²(F) ⊗̂ ℂ^k` (§1.4) with matrix-valued kernel
`1_F(s) (𝓕⁻¹ g)(s − t) 1_F(t)`;
when `g` is bounded, `Λ_F(g) = P_F T_g P_F`, the compression of the Fourier multiplier with symbol
`g` (a convolution operator) to `L²(F)`. Prove, with `Q_R = [−R, R]ⁿ` (caspers-delasalle-2015
Theorem 5.1, line 529, and Theorem 5.2, line 543, for `G = ℝⁿ`):

- for `1 ≤ p ≤ ∞` and `g ∈ L² ∩ Lᵖ(ℝⁿ; S_p^k)`, `‖Λ_F(g)‖_p ≤ |F|^{1/p} ‖g‖_{Lᵖ(S_p^k)}`. For
  `g ∈ L¹ ∩ L^∞`: at `p = ∞` from `‖T_g‖ ≤ ‖g‖_∞`; at `p = 1` by writing `g = u v` with
  `|u|² = |v|² = |g|` (polar decomposition for matrices), so `Λ_F(g)` is a product of two
  Hilbert–Schmidt operators of norms `|F|^{1/2} ‖u‖₂` and `|F|^{1/2} ‖v‖₂`; in between by
  NoncommutativeIntegration §2.6 for the couple `(L¹, L^∞)(ℝⁿ; F_k)` of the semifinite algebra
  `𝓡_k = L^∞(ℝⁿ; F_k)` with the trace `τ_k(g) = ∫ Tr g(ξ) dξ`, whose `Lᵖ` spaces are the
  `Lᵖ(ℝⁿ; S_p^k)` with the norm `‖g‖_{Lᵖ(S_p^k)}` (the tracial picture of §9.2), and for the
  couple `(S₁, B)(L²(F)^k)` (NoncommutativeIntegration §1.5 for `B(H)`). For general
  `g ∈ L² ∩ Lᵖ` (at `p = ∞`, `g ∈ L² ∩ L^∞`) the truncations
  `g_j = g · 1_{‖g‖ ≤ j} · 1_{|ξ| ≤ j}` lie in `L¹ ∩ L^∞` with `‖g_j‖_{Lᵖ(S_p^k)} ≤ ‖g‖_{Lᵖ(S_p^k)}`
  and `g_j → g` in `L²` (dominated convergence); since
  `‖Λ_F(h)‖₂² = ∫ ‖ȟ(u)‖₂² |F ∩ (F + u)| du ≤ |F| ‖h‖₂²` for every `h ∈ L²` (Plancherel),
  `Λ_F(g_j) → Λ_F(g)` in `S₂`, hence in operator norm, and the lower semicontinuity of the gauge
  (§1.1) gives the bound;
- the pairing `|Q_R|⁻¹ Tr(Λ_{Q_R}(g) Λ_{Q_R}(h)) → ∫ tr(g(ξ) h(ξ)) dξ` for `g ∈ L²` and
  `h ∈ L¹ ∩ L^∞`, from `Tr(Λ_F(g) Λ_F(h)) = ∫ tr(ǧ(u) ȟ(−u)) |F ∩ (F + u)| du` (with `ǧ = 𝓕⁻¹ g`),
  `|Q_R ∩ (Q_R + u)|/|Q_R| → 1` and Parseval;
- for `g ∈ L²(ℝⁿ; F_k)`, `‖g‖_{Lᵖ(S_p^k)} ≤ liminf_R |Q_R|^{−1/p} ‖Λ_{Q_R}(g)‖_p`, by the pairing,
  Hölder for the trace and the first bound for `h`; with equality and a limit when also
  `g ∈ Lᵖ(ℝⁿ; S_p^k)`, by the first bound for `g`;
- intertwining: `Λ_F(𝓕(m · 𝓕⁻¹ g)) = S_{M_m}(Λ_F(g))`, by comparing kernels, where `S_{M_m}` is
  the Schur multiplier of §3.1 on `L²(F)`, for Lebesgue measure restricted to `F`, whose symbol is
  the restriction of `M_m` to `F × F`, amplified as in §3.5 for `k > 1`.

caspers-delasalle-2015 state Theorem 5.1 for every `1 ≤ p ≤ ∞` (line 530) and Theorem 5.2, the
asymptotically isometric embedding behind the third bullet, for `1 < p < ∞` only (line 543); the
third bullet at `p ∈ {1, ∞}` comes from the duality route given there, with the first bound at the
conjugate exponent.

**Checks.**

- `n = 1`, `g = 1_{[−1/2, 1/2]}`: `𝓕⁻¹ g(u) = sin(πu)/(πu)` and `T_g` is an orthogonal projection,
  so `Λ_F(g) ≥ 0` and `‖Λ_F(g)‖₁ = Tr Λ_F(g) = |F| · (𝓕⁻¹ g)(0) = |F| = |F| ‖g‖₁`: equality at
  `p = 1`.
- At `p = 2`: `‖Λ_F(g)‖₂² = ∫ |ǧ(u)|² |F ∩ (F + u)| du ≤ |F| ‖g‖₂²`, so the normalisation is
  `|F|^{1/2}`; a normalisation by `|F|^{−1}` would send every compression to `0` in the limit.
- Frequency translation: `𝓕⁻¹(g(· − a)) = e_a · 𝓕⁻¹ g`, so the kernel of `Λ_F(g(· − a))` is
  `e_a(s) [1_F(s) ǧ(s − t) 1_F(t)] conj e_a(t)` and `Λ_F(g(· − a)) = D_{e_a} Λ_F(g) D_{e_a}*`: every
  bound is invariant under translation of the symbol, as `‖g(· − a)‖_p = ‖g‖_p` requires.

*Needs:* §1.1, §1.4, §2.1 (`Λ_F(g)` is defined by its kernel; kernel uniqueness for the
intertwining), §2.2 (the trace formula for `Tr(Λ_F(g) Λ_F(h))`), §3.1, §3.5, §4.1, §9.1, §9.2;
NoncommutativeIntegration §1.4, §1.5, §2.6; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`.

### 9.4 Approximate identities on the Fourier side

Prove that for `1 ≤ p ≤ ∞` there are `f_R ∈ L² ∩ Lᵖ(ℝⁿ)`, `g_R ∈ L² ∩ L^{p'}(ℝⁿ)` with
`‖f_R‖_p = ‖g_R‖_{p'} = 1`, nonnegative even Fourier transforms, and
`∫ (T_m f_R) g_R → m(0)` for every bounded `m` continuous at `0` (caspers-delasalle-2015 Lemma 4.1,
line 449, proves this on a locally compact group for `1 < p < ∞` with `p/p'` rational; on `ℝⁿ`
explicit Gaussians give every `1 ≤ p ≤ ∞`). Write `γ_T(x) = e^{−π|x|²/T²}` for the Gaussian of
width `T`, whose Fourier transform is `𝓕γ_T = Tⁿ γ_{1/T}` (Mathlib
`fourier_gaussian_innerProductSpace` with `b = π/T²`), and take `f_R` the multiple of `γ_R`
normalised in `Lᵖ`. For `1 < p < ∞` take `g_R = f_R^{p−1}`, the norming element, a multiple of `γ_{R/√(p−1)}` with `‖g_R‖_{p'} = 1` and
`∫ f_R g_R = 1`. For `p = 1` take `g_R = γ_{T_R}` (normalised in `L^∞`) with `T_R/R → ∞`, and for
`p = ∞` take `g_R = T_R^{−n} γ_{T_R}` (normalised in `L¹`) with `T_R/R → 0`; then
`∫ f_R g_R = (1 + R²/T_R²)^{−n/2}`, respectively `(1 + T_R²/R²)^{−n/2}`, which tends to `1`. In
every case `∫ (T_m f_R) g_R = ∫ m(ξ) 𝓕f_R(ξ) 𝓕g_R(ξ) dξ` with a nonnegative Gaussian weight of
total mass `∫ f_R g_R → 1` and of width at most `1/R` in `ξ`. At `p = ∞` the dual Gaussian must be
the narrower one: for `n = 1`, `f = γ_R` and `g = T^{−1}γ_T` the mass is `R (R² + T²)^{−1/2}`,
which is `0.995` at `T = R/10` and `0.0995` at `T = 10R`. Deduce, for `m` bounded and continuous,
points `s_1, …, s_N ∈ ℝⁿ` and `a ∈ S_p^N(S_p^k)`, `b ∈ S_{p'}^N(S_{p'}^k)`:
`|Σ_{i,j} m(s_i − s_j) tr(a_{ij} b_{ji})| ≤ ‖T_m‖_{cb,p} ‖a‖_p ‖b‖_{p'}`, by testing `T_m ⊗ id` on
`A_R(x) = D(x) (a f_R(x)) D(x)*` with the unitary `D(x) = diag(e_{s_i}(x))`, and the modulation rule
of §9.2 (caspers-delasalle-2015 Theorem 4.2, proof lines 494–522).

*Needs:* §9.2; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`, `fourier_gaussian_innerProductSpace`.

### 9.5 Fourier–Schur transference

Prove that for every `m ∈ L^∞(ℝⁿ)` and `1 ≤ p ≤ ∞`: `‖S_{M_m}‖_{cb,p} = ‖T_m‖_{cb,p}`
(`schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm`, which also covers `n = 0`), and moreover
`‖S_{M_m}‖_p ≤ ‖T_m‖_{cb,p}` and `‖T_m‖_p ≤ ‖S_{M_m}‖_p` (cgpt-2023 (FS), lines 71–72;
caspers-delasalle-2015 Theorem 4.2, line 485, Theorem 5.2, line 543, and Corollary 5.3, line 626;
neuwirth-ricard-2011 Theorem 2.7, line 516, for discrete amenable groups). caspers-delasalle-2015
state Theorem 4.2 and Corollary 5.3 for symbols in `M_cbA(G)`, the completely bounded Fourier
multipliers of the group von Neumann algebra (lines 26–33), which are continuous (line 483), and
Theorem 5.2 for `1 < p < ∞` (line 543); cgpt-2023 states (FS) with no hypothesis on `m`. The
statement here, for every `m ∈ L^∞(ℝⁿ)`, with values in `[0, ∞]` and including `p ∈ {1, ∞}`, is
reached by the route below: the Fourier side holds for every `m` and every `p` by §9.3, and the
Schur side passes from continuous to arbitrary symbols by mollification and the lower
semicontinuity of §3.3.

Route. Fourier side: the transferred operator `g ↦ 𝓕(m · 𝓕⁻¹ g)` is
`R T_m R`, with the norms of `T_m`; for `g ∈ L² ∩ Lᵖ`, §9.3 gives
`‖R T_m R g‖_p ≤ liminf |Q_R|^{−1/p} ‖S_{M_m}(Λ_{Q_R}(g))‖_p ≤ ‖S_{M_m}‖_p ‖g‖_p`, and the same at
every level `k`; the second inequality bounds the multiplier of the restriction of `M_m` to
`Q_R × Q_R` by `‖S_{M_m}‖_p` (the restriction rule of §3.7) and `‖Λ_{Q_R}(g)‖_p` by
`|Q_R|^{1/p} ‖g‖_p` (§9.3). Schur side: by §9.1 and §9.2 replace `m` by `m * ρ_ε` (continuous, with
`‖T_{m*ρ_ε}‖_{cb,p} ≤ ‖T_m‖_{cb,p}`); by §9.4 every finite restriction of `M_{m*ρ_ε}` to points of
`ℝⁿ`, amplified or not, has norm at most `‖T_m‖_{cb,p}`; by §8.2 (Lebesgue measure has support `ℝⁿ`)
`‖S_{M_{m*ρ_ε}}‖_{(cb),p} ≤ ‖T_m‖_{cb,p}`; and `m * ρ_ε → m` almost everywhere
(`ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable`) with the lower semicontinuity of
§3.3 gives the bound for `m`.

The equality `‖S_{M_m}‖_{cb,p} = ‖T_m‖_{cb,p}` also holds for `n = 0`, by computation: `ℝ⁰` is a
point of mass `1` (Mathlib `volume_euclideanSpace_eq_dirac`: the volume of `EuclideanSpace ℝ ι`
for empty `ι` is the point mass at `0`), `L²(ℝ⁰; F_k) = F_k`, `T_m = m(0) · id` because scalars
commute with `𝓕`, and the Toeplitz symbol is the constant `m(0)`; at every level `k ≥ 1` both
multipliers are multiplication by `m(0)`, of norm `|m(0)|` on `S_p^k`, and the level `0`
contributes `0`, so both sides are `|m(0)|`.

**Checks.**

- `n = 0`, `m = 2i`: `L²(ℝ⁰) = ℂ` and both completely bounded norms are `2 = |m(0)|` at every
  `p`; a supremum that omitted the levels `k ≥ 1` would give `0` instead.
- `m = e_a`: both completely bounded norms are `1` (§9.1, §9.2).
- `m = cos(2π⟨a, ·⟩)`: both norms are `1` at `p = ∞` and at `p = 1` (§9.1, §9.2), and by §4.2 at
  every `p`.
- `m = 0` and `m = 1`: both sides `0`, respectively `1`; the reflection in `R T_m R` is invisible in
  the norms but visible on `e_a`, where `R T_m R f = f(· − a)`.
- `n = 1`, `m = sign`, a discontinuous symbol and so outside the class `M_cbA(ℝ)` of
  caspers-delasalle-2015: at `p = 2` both completely bounded norms are `‖m‖_∞ = 1` (§3.5 for the
  Schur side, §9.2 for the Fourier side), so the equality holds beyond the symbols of the cited
  theorems, as the mollification step of the route provides; a statement restricted to
  continuous `m` would not cover this symbol.

*Needs:* §3.3, §3.7, §4.2, §8.2, §9.1–§9.4; Mathlib
`ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable`, `volume_euclideanSpace_eq_dirac`.

### Examples

- Characters and their averages (`cos`), with norm `1` on both sides.
- Mihlin symbols smooth off the origin: Tau Ceti's
  `TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le` bounds `‖T_m‖_p` for
  `1 < p < ∞` (scalar level); §9.5 transfers completely bounded bounds to the Toeplitz multiplier.

### Dependencies

Layers 1 (§1.1, §1.4), 2 (§2.1, §2.2), 3, 4 and 8; Tau Ceti `L²` Fourier multipliers;
NoncommutativeIntegration §1.3, §1.4, §1.5, §2.6; Mathlib Plancherel, the Fourier transform of
Gaussians, mollifiers and the volume of `ℝ⁰`.

## Layer 10: operator-valued and matrix BMO

Throughout this layer `n ≥ 1`, `H` is a complex Hilbert space and `𝕋ⁿ = UnitAddTorus (Fin n)`
with its Haar probability measure. A cube of `ℝⁿ` is an axis-parallel cube of positive side. A cube
of `𝕋ⁿ` is the image under the quotient map `ℝⁿ → 𝕋ⁿ` of a cube of `ℝⁿ` of side at most `1`, so it
may wrap around, and the average over it of a function on `𝕋ⁿ` is the average of the `ℤⁿ`-periodic
lift of the function over that cube of `ℝⁿ`; the family of cubes of `𝕋ⁿ` is invariant under
translations of `𝕋ⁿ`.

### 10.1 Column and row BMO of operator-valued functions

For `f : ℝⁿ → S₂(H)` locally square-integrable (as an `S₂(H)`-valued function) define
`‖f‖_{BMO^c} = sup_Q ‖⨍_Q |f(z) − f_Q|² dz‖^{1/2} ∈ [0, ∞]`, where `|g|² = g* g`, `f_Q = ⨍_Q f` and the
norm is the operator norm; `‖f‖_{BMO^r} = ‖f*‖_{BMO^c}` and
`‖f‖_{BMO} = max(‖f‖_{BMO^c}, ‖f‖_{BMO^r})`. The same definitions on `𝕋ⁿ` (cgpt-2023
lines 246–263; mei-2007 lines 96–110).

- `f ↦ ‖f‖_{BMO^c}` is a seminorm vanishing on constants: `(⨍_Q |h|²)^{1/2}` is the norm of `h` as a
  column operator `H → L²(Q; H)`.
- For every `α ∈ S₂(H)`, `⨍_Q |f − α|² = ⨍_Q |f − f_Q|² + |f_Q − α|²`; so the infimum over constants
  is attained at `f_Q` (cgpt-2023 line 683, with constant `1`).
- Operator Jensen: `|⨍_Q g|² ≤ ⨍_Q |g|²`; hence `‖f‖_{BMO^c} ≤ ess sup_z ‖f(z)‖`.
- Invariance under translations and the reflection of the variable, on `ℝⁿ` and on `𝕋ⁿ`, under
  dilations of the variable on `ℝⁿ`, and under `f ↦ U f V` for unitaries `U`, `V`.
- `‖f‖_{BMO^c} = sup_{‖h‖ ≤ 1} ‖f(·) h‖_{BMO(ℝⁿ; H)}`, the `H`-valued BMO seminorm with square means
  (mei-2007 lines 101–103).
- Dyadic comparison on `𝕋ⁿ`: for the dyadic filtration `(𝓓_k)_{k ≥ 0}` of `𝕋ⁿ = [0, 1)ⁿ`, with
  `E_{−1} = 0` and `E₀` the mean, and for `f` of mean zero,
  `sup_{k ≥ 0} ‖E_k |f − E_{k−1} f|²‖^{1/2} ≤ 2^{n/2} ‖f‖_{BMO^c(𝕋ⁿ)}`, because on a dyadic cube `Q` of
  generation `k ≥ 1` with parent `Q̂`, `E_k |f − E_{k−1} f|² = ⨍_Q |f − f_{Q̂}|² ≤ 2ⁿ ⨍_{Q̂} |f − f_{Q̂}|²`,
  and the `k = 0` term is the average over the whole torus.

**Checks.**

- Column versus row: on `𝕋` let `I_k = [(k − 1)/N, k/N)` for `k = 1, …, N` with `N ≥ 3`, and
  `f = Σ_k 1_{I_k} E_{k1}` in `M_N`, a unit column at every point. With `a_k = |Q ∩ I_k|/|Q|`,
  `⨍_Q |f − f_Q|² = (1 − Σ_k a_k²) E₁₁`, largest at `Q = 𝕋`, so `‖f‖_{BMO^c} = (1 − 1/N)^{1/2}`;
  and `⨍_Q |f* − f*_Q|² = diag(a) − a aᵀ`, whose norm is the largest variance of the coordinates of
  a unit vector under the law `a`, at most `1/2` (Popoviciu's inequality, two coordinates of a
  unit vector differing by at most `√2`) and equal to `1/2` at `Q = I₁ ∪ I₂`, so
  `‖f‖_{BMO^r} = 2^{−1/2}`. For `N = 4` these are `0.866` and `0.707`; a definition with
  `|g|² = g g*` in place of `g* g` would exchange the two values.
- `f = 1_{[0, 1/2)} e` on `𝕋` with `e` a rank-one projection: on `Q = 𝕋`, `f_Q = e/2` and
  `⨍ |f − f_Q|² = e/4`, giving `1/2`; unnormalised integrals `∫_Q` in place of `⨍_Q` would grow with
  the cube for the periodic extension of `f` to `ℝ`.
- Constant functions have seminorm `0`. For a rank-one projection `e`, `f(z) = e^{2πiz} e` on `𝕋`
  has `‖f(z)‖₂ = 1` at every point; on an interval `Q` of length at most `1`,
  `⨍_Q |f − f_Q|² = (1 − |⨍_Q e^{2πiz} dz|²) e`, which is `e` at `Q = 𝕋`, where the mean vanishes,
  so `‖f‖_{BMO^c} = 1`. The unitary-valued `z ↦ U_z` on `L²(ℝⁿ)` is not an `S₂`-valued function:
  every singular value of `U_z` is `1`, so `‖U_z‖₂ = ∞`.
- Cubes of `𝕋` wrap around: for a rank-one projection `e` and `f(z) = z e` for `z ∈ [0, 1)`,
  `⨍_Q |f − f_Q|²` is the variance of the values of `f` on `Q` times `e`. Intervals inside `[0, 1)`
  give at most `1/12`, so seminorm at most `(1/12)^{1/2} ≈ 0.289`; the arc `[3/4, 5/4)` gives `7/48`,
  seminorm `(7/48)^{1/2} ≈ 0.382`; the arcs `[1 − h, 1 + h)` give `1/4 − h/2 + h²/3 → 1/4`; and a
  variance of values in `[0, 1)` is at most `1/4`. So `‖f‖_{BMO^c} = 1/2`, the value of every
  translate of `f`. A definition by the intervals of one fundamental domain would give `f` the
  value `0.289` and its translate by `1/2`, whose jump lies inside `[0, 1)`, the value `1/2`, and
  would not be translation invariant.

*Needs:* Mathlib `MeasureTheory.Lp`, Bochner integration, `UnitAddTorus`; §1.1.

### 10.2 Matrix BMO

For `A ∈ S₂(L²(ℝⁿ))` let `π(A) : ℝⁿ → S₂(L²(ℝⁿ))`, `π(A)(z) = U_z A U_z*`, a bounded continuous
function with kernel `e^{2πi⟨z, x − y⟩} k_A(x, y)`. Define `‖A‖_{BMO_c} = ‖π(A)‖_{BMO^c(ℝⁿ)}`,
`‖A‖_{BMO_r} = ‖A*‖_{BMO_c}` and `‖A‖_{BMO} = max(‖A‖_{BMO_c}, ‖A‖_{BMO_r})` (cgpt-2023 lines
264–285).

- `π` is multiplicative and `*`-preserving, and `‖π(A)(z)‖_p = ‖A‖_p` for every `z` and `p`; hence
  `‖A‖_{BMO_r} = ‖π(A)‖_{BMO^r}`.
- `‖A‖_{BMO} ≤ ‖A‖` (operator norm), by §10.1.
- `‖·‖_{BMO}` is a norm on `S₂`. If `‖A‖_{BMO_c} = 0`, then for every cube `Q` and every `h`,
  `⨍_Q ‖(π(A)(z) − π(A)_Q) h‖² dz = ⟨h, ⨍_Q |π(A) − π(A)_Q|² h⟩ = 0`, so the continuous function
  `π(A)` equals its mean on every cube; any two points lie in a common cube, so `π(A)` is constant
  and `U_z A U_z* = π(A)(0) = A` for every `z`. Its kernel is `e^{2πi⟨z, x − y⟩} k_A(x, y)` (§3.1,
  the elementary symbol `e^{2πi⟨z, x⟩} e^{−2πi⟨z, y⟩}`), so by the uniqueness of the kernel (§2.1)
  `(e^{2πi⟨z, x − y⟩} − 1) k_A(x, y) = 0` for almost every `(x, y)`, for each `z`. Over the countable
  set `z ∈ ℚⁿ`, almost every `(x, y)` with `k_A(x, y) ≠ 0` has `⟨z, x − y⟩ ∈ ℤ` for all `z ∈ ℚⁿ`,
  and this forces `x = y`: if `x_j ≠ y_j`, a rational `t` with `0 < |t (x_j − y_j)| < 1` gives
  `z = t e_j` with `⟨z, x − y⟩ ∉ ℤ`. The diagonal of `ℝⁿ × ℝⁿ` is null for `n ≥ 1` (its sections are
  points, Mathlib `MeasureTheory.Measure.measure_prod_null`), so `k_A = 0` and `A = 0` (§2.1).
- Bimodule and symmetry invariance: `π(D_u A D_v) = D_u π(A) D_v` for multiplication operators,
  so unimodular `u`, `v` do not change `‖A‖_{BMO}`; translations, modulations, unitary dilations
  and the reflection preserve `‖A‖_{BMO}`.
- `π(S_M A)(z) = S_M(π(A)(z))` for every Schur multiplier (bimodularity, §3.1).

**Checks.**

- Dilations: for `D_t f(x) = t^{n/2} f(t x)`, `U_z D_t = D_t U_{z/t}`, so
  `π(D_t A D_t*)(z) = D_t π(A)(z/t) D_t*`, and the seminorm is unchanged.
- Translations `τ_a f = f(· − a)`: `τ_a U_z = e^{−2πi⟨z, a⟩} U_z τ_a`, the scalar cancels in the
  conjugation, so `π(τ_a A τ_a*) = τ_a π(A) τ_a*`.
- The model `π'(A)(z) = U_z A`, without the right factor, has column seminorm `‖A‖` for every `A`
  (its averages over large cubes tend to `0` strongly), so it reproduces the operator norm and not
  a BMO space; the conjugation is essential.
- The dimension `n = 0` is excluded: `ℝ⁰` is a point, `L²(ℝ⁰) = ℂ` and `U_z = 1`, so `π(A)` is
  constant and `‖A‖_{BMO} = 0` for every `A`, while `A = 1` has `‖A‖₂ = 1`; definiteness fails. In
  the route the factor `e^{2πi⟨z, x − y⟩} − 1` is `e⁰ − 1 = 0` and the diagonal is all of
  `ℝ⁰ × ℝ⁰`, of mass `1`, so nothing follows. For `n ≥ 1` the diagonal of `ℝⁿ × ℝⁿ` is null.
- Definiteness in dimension one: for `A = u ⊗ u*` with `u = 1_{[0, 1]}` and `z = 1/2`, the kernel
  of `U_z A U_z* − A` is `(e^{πi(x − y)} − 1) 1_{[0, 1]²}(x, y)`, nonzero on a set of positive
  measure, so `π(A)` is not constant and `‖A‖_{BMO_c} > 0`.

*Needs:* §2.1, §3.1, §10.1; Mathlib `MeasureTheory.Lp`, `MeasureTheory.Measure.measure_prod_null`.

### 10.3 Periodisation and removal of the diagonal strip

For `k ≥ 0` let `m_k(x) = (⌊8^k x_j⌋)_j ∈ ℤⁿ` and `p_k(x) = 8^{−k} m_k(x)`; for `s ∈ 𝕋ⁿ` let
`W_{k,s}` be multiplication by `e^{2πi⟨s, m_k(x)⟩}` and `π_k(A)(s) = W_{k,s} A W_{k,s}*`, with kernel
`e^{2πi⟨s, m_k(x) − m_k(y)⟩} k_A(x, y)`; let `J_k` be the Schur multiplier with symbol
`1_{|x − y| ≥ 2^{−k}}` and `J_k^⊥ = id − J_k` (cgpt-2023 lines 348–378). Prove:

- `‖π_k(B)(s)‖_p = ‖B‖_p`, so `‖π_k(B)‖_{Lᵖ(L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ)))} = ‖B‖_p` for
  `B ∈ S₂ ∩ S_p` and `1 ≤ p < ∞`, the left side being the tracial `Lᵖ` for the trace `∫ ⊗ Tr`
  (NoncommutativeIntegration §4.4, read tracially through its §1.5 and §3.5);
- `π_k ∘ J_k = J_k ∘ π_k`, and, when `4^k ≥ √n`, `∫_{𝕋ⁿ} π_k(J_k B)(s) ds = 0`: points with
  `m_k(x) = m_k(y)` lie in one cube of side `8^{−k}`, so `|x − y| < √n 8^{−k} ≤ 2^{−k}`;
- Lemma 1.3: for `4^k ≥ 4√n` and `A ∈ S₂`,
  `‖π_k J_k(A)‖_{BMO^c(𝕋ⁿ)} ≤ ‖π J_k(A)‖_{BMO^c(ℝⁿ)} + C_n 2^{−k} ‖J_k A‖₂`, and the same for rows
  (cgpt-2023 Lemma 1.3, line 379, proof lines 380–454), by rescaling the cubes of `𝕋ⁿ`, of side at
  most `1`, by the factor `8^k` to cubes of side at most `8^k` in `ℝⁿ`, comparing small cubes with
  `π` up to `C_n 2^{−k}‖J_k A‖₂`, and bounding large cubes through
  `|⨍_Q e^{2πi⟨ξ, p_k(x) − p_k(y)⟩} dξ| ≲ 2^{−k}`, which uses `|p_k(x) − p_k(y)| ≥ 2^{−k}/2` on the
  support of `J_k`;
- `‖A − J_k A‖₂ → 0` and `‖A‖_p ≤ liminf_k ‖J_k A‖_p` for `A ∈ S₂` (the diagonal is null; §1.1).

The source asserts the mean-zero property for every `k` and writes `‖A‖_p = lim_k ‖J_k(A)‖_p`
(cgpt-2023 lines 375–378 and 506); for `n ≥ 2` the first holds only for `4^k ≥ √n`, and only the
inequality `≤ liminf` is used, as stated here. The source takes the cubes of `𝕋ⁿ` inside
`[−1/2, 1/2]ⁿ` (line 380); since `π_k J_k(A)` is `ℤⁿ`-periodic, a cube of `𝕋ⁿ` that wraps around
lifts to a cube of `ℝⁿ` of side at most `1` with the same average, and the argument, which
translates small cubes to the origin and bounds large cubes by their size alone, applies to it
unchanged.

**Checks.**

- `n = 2`, `k = 0`: `x = (0.05, 0.05)` and `y = (0.95, 0.95)` lie in the unit cube `[0, 1)²` with
  `|x − y| = 0.9√2 ≈ 1.27 ≥ 1`, so `J₀` keeps the entry while `m₀(x) − m₀(y) = 0`: the mean-zero
  property fails at `k = 0` in dimension `2`, and the threshold on `k` is needed.
- `n = 1`, `k = 0`: a kernel supported in `[0, 1)²` has all frequencies `0`, and `J₀` kills it,
  since `|x − y| < 1` there.
- A rank-one `u ⊗ v*` with `u, v` supported in grid cubes with labels `a`, `b` has
  `π_k(u ⊗ v*)(s) = e^{2πi⟨s, a − b⟩} u ⊗ v*`, of mean zero exactly when `a ≠ b`.
- The dimension `n = 0` is excluded: on `ℝ⁰ × ℝ⁰`, `|x − y| = 0 < 2^{−k}`, so every `J_k` is `0`, and
  `‖A‖_p ≤ liminf_k ‖J_k A‖_p` fails for `A = 1`, where the left side is `1` and the right side `0`.

*Needs:* §1.1, §3.1, §10.1, §10.2; NoncommutativeIntegration §1.5, §3.5, §4.4.

### 10.4 Interpolation between matrix BMO and `S₂`

Prove that there is `C_n` such that for every `2 ≤ p < ∞` and every
`Ψ(z) = Σ_j e^{δ z² + λ_j z} A_j` with finitely many `A_j ∈ S₂(L²(ℝⁿ))`, `δ ≥ 0`, `λ_j ∈ ℝ`,
`‖Ψ(2/p)‖_p ≤ C_n p · max(sup_t ‖Ψ(it)‖_{BMO}, sup_t ‖Ψ(1 + it)‖₂)` (cgpt-2023 Theorem 1.1, line 313,
inequality (1.1), proof lines 485–539; Lemma 1.2, line 326). Deduce the operator form: if
`T : S₂ → S₂` is linear and there are finite constants `C₂, C_∞ ≥ 0` with `‖T A‖₂ ≤ C₂ ‖A‖₂` and
`‖T A‖_{BMO} ≤ C_∞ ‖A‖` for finite-rank `A`, then `‖T A‖_p ≤ C_n p C_∞^{1−2/p} C₂^{2/p} ‖A‖_p` for
finite-rank `A` (with `C_∞⁰ = 1` at `p = 2`). For `A = 0` there is nothing to prove. For
`C₂, C_∞ > 0` and `A ≠ 0`, normalised to `‖A‖_p = 1` with polar decomposition `A = U|A|`, apply the
inequality to `Ψ(z) = C_∞^{z−1} C₂^{−z} T(U |A|^{pz/2})`, with `|A|^{pz/2}` taken on the nonzero
eigenvalues of `|A|` (an exponential sum since `A` has finite rank; `‖U|A|^{pit/2}‖ ≤ 1`,
`‖|A|^{p/2}‖₂ = 1` and `Ψ(2/p) = C_∞^{2/p−1} C₂^{−2/p} T A`). If `C₂` or `C_∞` is `0`, the
hypotheses hold with `C₂ + ε` and `C_∞ + ε` for every `ε > 0`, and the bound follows by letting
`ε ↓ 0`; the family `Ψ` itself, with its powers `C^{z−1}` and `C^{−z}`, is not defined at a zero
constant.

Route: for `k` large let `Ψ_k = π_k J_k Ψ`, an exponential sum of mean-zero elements of
`L² ∩ L^∞(L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ)))` (§10.3). The martingale interpolation of
NoncommutativeIntegration, Part II (gap `semifinite-martingale-bmo-interpolation`) bounds
`‖Ψ_k(2/p)‖_{Lᵖ}` by `C p` times the maximum of the dyadic martingale BMO norms on the line
`Re z = 0` and the `L²` norms on `Re z = 1`. The latter are `‖J_k Ψ(1 + it)‖₂ ≤ ‖Ψ(1 + it)‖₂`. The
former are at most `2^{n/2}` times the cube seminorms (§10.1), hence by §10.3 at most
`2^{n/2}(‖π J_k Ψ(it)‖_{BMO(ℝⁿ)} + C_n 2^{−k} ‖J_k Ψ(it)‖₂)`, with
`‖π J_k B‖_{BMO} ≤ ‖B‖_{BMO} + ‖J_k^⊥ B‖₂`. Since `Ψ` takes values in a finite-dimensional subspace
of `S₂` on which `‖·‖_{BMO}` is a norm (§10.2), `‖J_k Ψ(it)‖₂ ≤ c_Ψ sup_t ‖Ψ(it)‖_{BMO}`, and
`sup_t ‖J_k^⊥ Ψ(it)‖₂ → 0`. Finally `‖Ψ(2/p)‖_p ≤ liminf_k ‖J_k Ψ(2/p)‖_p = liminf_k ‖Ψ_k(2/p)‖_{Lᵖ}`
(§10.3).

**Checks.**

- `p = 2`: `‖Ψ(1)‖₂ ≤ sup_t ‖Ψ(1 + it)‖₂` holds with constant `1`, the point `1` being on the line
  `Re z = 1`.
- `T = id`: `C₂ = 1` and `C_∞ = 1` (§10.2), and the operator form reads `‖A‖_p ≤ C_n p ‖A‖_p`, so
  `C_n p ≥ 1` for every `p ≥ 2`.
- Homogeneity: replacing `T` by `cT` multiplies `C₂`, `C_∞` and `‖T A‖_p` by `|c|`, and the
  exponents `1 − 2/p` of `C_∞` and `2/p` of `C₂` sum to `1`, as this requires; at `p = 2` only `C₂`
  remains, so the operator form at `p = 2` is the hypothesis `‖T A‖₂ ≤ C₂ ‖A‖₂` up to `2C_n`.
- `T = 0` with `C₂ = C_∞ = 0`: the conclusion is `0 ≤ 0`, reached through the constants `ε`; for
  `p > 2` and `C₂ = 0`, `C_∞ = 1` the right side is `0`, and indeed `T A = 0` because
  `‖T A‖₂ ≤ 0`.
- The dimension `n = 0` is excluded: there `‖·‖_{BMO} = 0` (§10.2), and for `p = 4` and
  `Ψ(z) = e^{−Rz}·1` on `S₂(ℂ) = ℂ` the inequality would read `‖Ψ(1/2)‖₄ = e^{−R/2} ≤ 4 C_n e^{−R}`,
  since `sup_t ‖Ψ(1 + it)‖₂ = e^{−R}`; this fails for every `R > 2 ln(4 C_n)`.

*Needs:* §10.1–§10.3; NoncommutativeIntegration §1.5, §3.5, §4.4 and Part II (gap
`semifinite-martingale-bmo-interpolation`).

### Examples

- Rank-one and finite-rank operators: `π(A)` is a trigonometric family of finite-rank operators.
- Toeplitz symbols `M_m(x, y) = m(x − y)` (Conventions): `π(S_{M_m} A)(z) = S_{M_m}(π(A)(z))`
  (§10.2), and on the entry `(x, y)` the character `e^{2πi⟨z, x − y⟩}` of `π(A)` is multiplied by
  `m(x − y)`, the value of `m` at its own frequency.

### Dependencies

Layers 1, 2 (§2.1) and 3; Mathlib Bochner integration, the torus and null sets of product measures;
NoncommutativeIntegration §1.5, §3.5, §4.4 and the Part II contract.

## Layer 11: Hörmander–Mikhlin–Schur multipliers

Throughout this layer `n ≥ 1` and `σ_n = ⌊n/2⌋ + 1`.

### 11.1 The Hörmander–Mikhlin–Schur norm

For `M : ℝⁿ × ℝⁿ → ℂ` of class `C^{σ_n}` on the open set `{(x, y) : x ≠ y}` (Mathlib `ContDiffOn`)
define
`|||M|||_{HMS} = Σ_{k=0}^{σ_n} ess sup_{x ≠ y} |x − y|^k (‖D_x^k M(x, y)‖ + ‖D_y^k M(x, y)‖) ∈ [0, ∞]`,
where `D_x^k` is the `k`-th Fréchet derivative in the first variable (Mathlib `iteratedFDeriv`) and
`D_y^k` in the second (cgpt-2023 Theorem A, lines 149–154, where the multi-index form is used).
The essential supremum is for Lebesgue measure on `ℝⁿ × ℝⁿ`, on which the diagonal is null; so
the restriction `x ≠ y` changes nothing, and the Lean `hmsNorm` takes `essSup` over the whole
product (with `n ≥ 1` in every statement that uses it).

- `ess sup |M| ≤ |||M|||_{HMS}/2` in `[0, ∞]` (the term `k = 0`). When `|||M|||_{HMS} < ∞`, `M`
  defines a class in `L^∞(ℝⁿ × ℝⁿ)`, the diagonal being null, and so a Schur multiplier `S_M`
  (§3.1); a symbol of infinite gauge need not be bounded and then defines no multiplier.
- The column part `|||M|||_c = Σ_{k ≤ σ_n} ess sup_{x ≠ y} |x − y|^k ‖D_y^k M(x, y)‖` and the row
  part `|||M|||_r`, the same sum with `D_x`, satisfy
  `max(|||M|||_c, |||M|||_r) ≤ |||M|||_{HMS} ≤ |||M|||_c + |||M|||_r`; each contains the term
  `ess sup |M|` (`k = 0`), so either one being finite makes `M` bounded.
- `|||M^t||| = |||M̄||| = |||M̃||| = |||M|||`; invariance under `M(t x + a, t y + a)` for `t > 0`,
  `a ∈ ℝⁿ`, and under a common orthogonal change of variables.
- Toeplitz symbols: `|||M_m||| = 2 Σ_{k ≤ σ_n} sup_{ξ ≠ 0} |ξ|^k ‖D^k m(ξ)‖`, twice the Mihlin norm of
  order `σ_n` of `m`.
- The multi-index form `Σ_{|γ| ≤ σ_n} ‖|x − y|^{|γ|}(|∂_x^γ M| + |∂_y^γ M|)‖_∞` is comparable to
  `|||M|||` with constants depending only on `n`.

**Checks.**

- `n = 1`, `M = sign(x − y)`: `σ₁ = 1`, the derivatives vanish off the diagonal, `|||M||| = 2`.
- `n = 1`, `M(x, y) = φ(x − y)` with `φ(ξ) = ξ/√(1 + ξ²)`: the `k = 0` term is `2` and the `k = 1`
  term is `2 sup_ξ |ξ|(1 + ξ²)^{−3/2} = 2 · (1/√2)(3/2)^{−3/2} = 4/(3√3) ≈ 0.770`, so
  `|||M||| = 2 + 4/(3√3)`; the same value for `φ(tξ)`, `t > 0`.
- `M(x, y) = sin x₁`: `|x − y| |cos x₁|` is unbounded, so `|||M||| = ∞`, while `S_M(A) = D_{sin x₁} A`
  has norm `1` on every `S_p`: the condition is sufficient, not necessary.
- `n = 1`, `M(x, y) = x`: smooth, with `|||M||| = ∞` and `ess sup |M| = ∞`, so it defines no
  multiplier: for `u = 1_{[1, ∞)}(x)/x` and `v = 1_{[0, 1]}`, `u ⊗ v*` has Hilbert–Schmidt norm
  `‖u‖₂‖v‖₂ = 1`, while `M(x, y) u(x) v(y) = 1_{[1, ∞)}(x) 1_{[0, 1]}(y)` is not square-integrable.
- `σ₁ = 1`, `σ₂ = 2`, `σ₃ = 2`, `σ₄ = 3`: the order is `⌊n/2⌋ + 1`, the least integer `> n/2`.

*Needs:* Mathlib `iteratedFDeriv`, `ContDiffOn`; §3.1.

### 11.2 Littlewood–Paley estimates uniform in a parameter

Let `φ` be smooth, equal to `1` on the unit ball and `0` outside the ball of radius `2`, and
`ψ_j(ξ) = φ(2^{−j}ξ) − φ(2^{1−j}ξ)` for `j ∈ ℤ` (cgpt-2023 (2.12), line 770). Let `N(x, ·)` be of
class `C^{σ_n}` on `ℝⁿ ∖ {0}` for every `x`, with
`B = sup_x Σ_{k ≤ σ_n} sup_{ξ ≠ 0} |ξ|^k ‖D_ξ^k N(x, ξ)‖ < ∞`, and `k_j(x, ·) = 𝓕⁻¹(ψ_j N(x, ·))`.
Prove that for every `j` and `x` (cgpt-2023 (2.13), line 793, lines 866–894, 967–972 and 995–1015):

- `∫ |s|^{2σ_n} |k_j(x, s)|² ds ≤ C_n B² 2^{j(n − 2σ_n)}`;
- `∫ |∇_s k_j(x, s)|² ds ≤ C_n ‖N‖_∞² 2^{j(n + 2)}`;
- `∫ |s|^{2σ_n} |∇_s k_j(x, s)|² ds ≤ C_n B² 2^{j(n + 2 − 2σ_n)}`.

Route: Plancherel turns the weights `(−2πis)^γ` into derivatives `∂_ξ^γ(ψ_j N(x, ·))`, and Leibniz
with `supp ψ_j ⊆ {2^{j−1} ≤ |ξ| ≤ 2^{j+1}}` and `|∂^α ψ_j| ≤ C_α 2^{−j|α|}` gives the bounds. Tau
Ceti's `ContDiffBump.exists_norm_iteratedFDeriv_littlewoodPaleyPiece_le` gives the same bounds for
symbols smooth off the origin; here the symbol has only `σ_n` derivatives.

**Checks.**

- `N = 1`: `k_j(s) = 2^{jn} (𝓕⁻¹ψ)(2^j s)`, so
  `∫ |s|^{2σ}|k_j|² = 2^{j(n − 2σ)} ∫ |u|^{2σ} |𝓕⁻¹ψ(u)|² du`: the exponent `n − 2σ_n` is exact.
  Likewise the gradient bounds scale as `2^{j(n+2)}` and `2^{j(n+2−2σ_n)}`.
- The geometric sums `Σ_{2^j|u| > 1} 2^{j(n/2 − σ_n)}` used in §11.4 converge because `σ_n > n/2`;
  with `σ = n/2` (`n` even) they diverge.
- `N(x, ξ) = m(ξ)` independent of `x`: the estimates are the scalar ones of the Mihlin–Hörmander
  theorem.

*Needs:* Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`, `iteratedFDeriv`.

### 11.3 Twisted Fourier multipliers

For bounded measurable `N : ℝⁿ × ℝⁿ → ℂ` define the column-twisted multiplier `T̃^c_N` on
`L²(ℝⁿ; S₂(L²(ℝⁿ)))`, identified with `L²(ℝⁿ_z × ℝⁿ_x × ℝⁿ_y)` by applying the kernel unitary
`S₂(L²(ℝⁿ)) ≅ L²(ℝⁿ_x × ℝⁿ_y)` of §2.1 pointwise in `z` (Mathlib `ContinuousLinearMap.compLp`) and
then the Fubini isometry `L²(ℝⁿ_z; L²(ℝⁿ_x × ℝⁿ_y)) ≅ L²(ℝⁿ_z × ℝⁿ_x × ℝⁿ_y)` of BochnerSpaces §4.2
(Lebesgue measures, σ-finite): the Fourier
multiplier in `z` whose symbol at frequency `ξ` on the entry `(x, y)` is `N(x, ξ)`, i.e. partial
Fourier transform in `z` (Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ` with values in the Hilbert
space `S₂`), multiplication by `N(x, ξ)`, inverse transform. Define the row-twisted `T̃^r_N` with
symbol `N(ξ, y)` on the entry `(x, y)`. For a symbol `M` put `M_c(x, ξ) = M(x, x − ξ)` and
`M_r(ξ, y) = M(y − ξ, y)` (cgpt-2023 (2.2), lines 572–582). Prove:

- `‖T̃^c_N f‖_{L²(ℝⁿ; S₂)} ≤ ‖N‖_∞ ‖f‖` (cgpt-2023 (2.8), line 704);
- `T̃^c_N` is a right module map, `T̃^c_N(f E) = (T̃^c_N f) E` for bounded `E`, hence the column bound
  `‖∫ |T̃^c_N f(z)|² dz‖^{1/2} ≤ ‖N‖_∞ ‖∫ |f(z)|² dz‖^{1/2}` (operator norms; (2.9), lines 705–718);
  `T̃^r_N` is a left module map with the row bound;
- localised intertwining: for `M` of class `C^{σ_n}` on `{x ≠ y}` with finite column part
  `|||M|||_c` (§11.1; then `M` and `M_c` are bounded, so `S_M` and `T̃^c_{M_c}` are defined), for
  `A ∈ S₂` and a cube `Q`,
  `T̃^c_{M_c}(π(A) 1_{Q_R}) − ⨍_Q T̃^c_{M_c}(π(A) 1_{Q_R}) → π(S_M A) − ⨍_Q π(S_M A)` in `L²(Q; S₂)`
  as `R → ∞` (`Q_R = [−R, R]ⁿ`), and the same for rows with `σ(A)(ξ) = π(A)(−ξ)`, `M_r` and a finite
  row part `|||M|||_r` (cgpt-2023 (2.5), lines 595–608, and lines 668–680). Smoothness alone does
  not suffice: `M(x, y) = x` (`n = 1`) is smooth but unbounded and has no multiplier (§11.1). On the
  entry `(x, y)` with `x ≠ y`, `π(A)` is the character `e_{x−y}` times `k_A(x, y)`, the symbol
  `M_c(x, ·)` is continuous at `x − y`, and the truncations converge modulo constants by the kernel
  estimates of §11.2 off `5Q`; this is the meaning of `T̃_{M_c}(π(A)) = π(S_M A)`.

**Checks.**

- Toeplitz symbol `M = M_m`: `M_c(x, ξ) = m(ξ)` does not depend on `x`, so `T̃^c_{M_c}` is the
  ordinary Fourier multiplier `T_m` acting entrywise, and on characters
  `T_m e_{x−y} = m(x − y) e_{x−y}`, consistent with `S_{M_m}`.
- `N = 1`: the identity, norm `1`.
- `M(x, y) = f(x)` (a function of the row only): `M_c(x, ξ) = f(x)`, `T̃^c_{M_c}` is left
  multiplication by `D_f`, which commutes with right multiplication as the module property states,
  and `S_M(A) = D_f A`.

*Needs:* §2.1, §3.1, §10.2, §11.1, §11.2; BochnerSpaces §4.2; Mathlib
`MeasureTheory.Lp.fourierTransformₗᵢ`, `ContinuousLinearMap.compLp`.

### 11.4 The BMO endpoint

Prove that for `M` of class `C^{σ_n}` on `{x ≠ y}` with `‖M‖_∞ < ∞` (so that `S_M` is defined,
§3.1) and `A ∈ S₂(L²(ℝⁿ))`, in `[0, ∞]`,
`‖S_M A‖_{BMO_c} ≤ C_n |||M|||_c ‖A‖` and `‖S_M A‖_{BMO_r} ≤ C_n |||M|||_r ‖A‖`, with the column
part `|||M|||_c = Σ_{k ≤ σ_n} ess sup_{x ≠ y} |x − y|^k ‖D_y^k M(x, y)‖` and the row part
`|||M|||_r` (the same with `D_x`) of §11.1; hence `‖S_M A‖_{BMO} ≤ C_n |||M|||_{HMS} ‖A‖`
(cgpt-2023 (2.1), line 570; (2.3)–(2.4), line 591; (2.6)–(2.7), lines 629–634; proof in steps
3–5, lines 628–1041). Each bound is trivial when its right side is infinite; the column argument
below uses a finite column part, the row argument a finite row part. Route (column):
`‖S_M A‖_{BMO_c} = ‖π(S_M A)‖_{BMO^c}` (§10.2); fix a cube `Q`, use the localised intertwining of
§11.3 and split `π(A) = π(A) 1_{5Q} + π(A) 1_{(5Q)^c}`. The near part is bounded by
`5^{n/2} ‖M‖_∞ ‖A‖` through the column bound of §11.3 and `‖π(A)(z)‖ = ‖A‖` ((2.10), line 723).
For the far part use operator Jensen (§10.1), the change of variables of (2.11) (line 751), the
Littlewood–Paley decomposition `K_c = Σ_j K_{cj}` with diagonal kernels `K_{cj} = diag(k_{cj}(x, ·))`,
`k_{cj}(x, ·) = 𝓕⁻¹(ψ_j M_c(x, ·))`, split at `2^j|u| ≷ 1`, and the operator Cauchy–Schwarz
inequality `‖∫ a(s)* b(s) ds‖ ≤ ‖∫ a*a‖^{1/2} ‖∫ b*b‖^{1/2}` with the weights `|s|^{±2σ_n}`, the
normality `K_{cj} K_{cj}* = K_{cj}* K_{cj}` and §11.2 ((2.14)–(2.18), lines 859–1026). The bound is
`sup_x ‖M_c(x, ·)‖_{HM}`, which equals the column part `|||M|||_c` because
`∂_ξ^γ M_c(x, ξ) = (−1)^{|γ|}(∂_y^γ M)(x, x − ξ)` (line 910). Rows: the same with `M_r` and left
module maps (lines 1031–1040).

**Checks.**

- `M = 1`: `S_M = id` and the bound `‖A‖_{BMO} ≤ 2C_n ‖A‖` is consistent with `‖A‖_{BMO} ≤ ‖A‖`
  (§10.2).
- Toeplitz `M_m`: only the derivatives of `m` enter, the column and row parts are equal, and the
  estimate is the operator-valued `L^∞ → BMO` bound of the Fourier multiplier `T_m` applied to
  `π(A)`.
- The column part uses only `D_y` and the row part only `D_x`: for `M(x, y) = sin y₁`,
  `|||M|||_r = 1` and `|||M|||_c = ∞`, so only the row estimate applies, although
  `S_M(A) = A D_{sin y₁}` has both seminorms at most `‖A‖` (§10.1, §10.2): neither part of the
  condition is necessary.

*Needs:* §3.1, §10.1, §10.2, §11.1–§11.3.

### 11.5 The Hörmander–Mikhlin–Schur theorem

Prove that there is `C_n` such that for every `1 < p < ∞` and every `M` of class `C^{σ_n}` on
`{x ≠ y} ⊆ ℝⁿ × ℝⁿ` with `|||M|||_{HMS} < ∞`,
`‖S_M‖_{S_p(L²(ℝⁿ)) → S_p(L²(ℝⁿ))} = ‖S_M‖_{cb,p} ≤ C_n (p²/(p − 1)) |||M|||_{HMS}`
(cgpt-2023 Theorem A, lines 149–154; step 1, lines 565–571; Remark 2.1, line 1042, for the
completely bounded form; grafakos-classical-2014 Theorem 6.2.7 for the Toeplitz case); this is
`schurNorm_le_hmsNorm`, with `n ≥ 1` as throughout this layer. Route:
for `p > 2` apply the operator form of §10.4 to `T = S_M` with `C₂ = ‖M‖_∞ ≤ |||M|||/2` (§3.1) and
`C_∞ = C_n |||M|||` (§11.4), giving `‖S_M‖_p ≤ C_n p |||M|||` on finite-rank operators, hence on
`S_p` (§3.3); for `p < 2` use `‖S_M‖_p = ‖S_{M^t}‖_{p'}` (§4.1) and `|||M^t||| = |||M|||`; then
`max(p, p') ≤ p²/(p − 1)`. Lebesgue measure on `ℝⁿ` is atomless, so `‖S_M‖_p = ‖S_M‖_{cb,p}`
(§7.3).

**Checks.**

- `M = 1`: `|||M||| = 2` and `‖S_M‖_p = 1`; since `min_{p > 1} p²/(p − 1) = 4` (at `p = 2`), the
  theorem forces `C_n ≥ 1/8`.
- `p²/(p − 1)` is unchanged under `p ↦ p'`, as `‖S_M‖_p = ‖S_M‖_{p'}` (§4.1) requires; and
  `max(p, p') ≤ p²/(p − 1) ≤ 2 max(p, p')`.
- Toeplitz symbols: `|||M_m||| = 2 ‖m‖_{HM}` and §9.5 give
  `‖T_m‖_{cb,p} ≤ 2C_n (p²/(p − 1)) ‖m‖_{HM}` on `Lᵖ(ℝⁿ)`, the Hörmander–Mikhlin theorem with its
  classical order in `p` (cgpt-2023 (HMS), line 79), consistent with Tau Ceti's
  `TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`.
- `n = 1`, `M = sign(x − y)`: `|||M||| = 2`, so the triangular truncation `(M + 1)/2` is bounded on
  `S_p` for `1 < p < ∞` with norm `O(p²/(p − 1))`; nothing is asserted at `p ∈ {1, ∞}`.

*Needs:* §3.1, §3.3, §4.1, §7.3, §10.4, §11.1, §11.4.

### Examples

- Toeplitz Mihlin symbols on `ℝⁿ` and their transferred Fourier multipliers.
- Non-Toeplitz symbols in every dimension: `M(x, y) = φ((x − y)/⟨x⟩)` with `⟨x⟩ = (1 + |x|²)^{1/2}`
  and `φ` a Schwartz function on `ℝⁿ`, for instance a smooth bump, which cuts `M` off to a band
  around the diagonal whose width grows like `⟨x⟩`. With `t = (x − y)/⟨x⟩`, `D_y t = −⟨x⟩^{−1}`, so
  `|x − y|^k ‖D_y^k M‖ = |t|^k ‖D^kφ(t)‖`; and
  `D_x^k t = (x − y) ⊗ D^k⟨x⟩^{−1} + k (id ⊗ D^{k−1}⟨x⟩^{−1})` with
  `‖D^j⟨x⟩^{−1}‖ ≤ C_j ⟨x⟩^{−1−j}`, so `|x − y|^k ‖D_x^k t‖ ≤ C_k (|t|^{k+1} + |t|^k)` and, by the
  chain rule, `|x − y|^k ‖D_x^k M‖` is bounded by a polynomial in `|t|` times derivatives of `φ` at
  `t`. Hence `|||M||| < ∞`. For a smooth bump `φ` with `φ(0) ≠ 0`, `M` is not Toeplitz, since
  `M(0, −s) = φ(s) = 0` for large `|s|` while `M(x, x − s) = φ(s/⟨x⟩) → φ(0)` as `|x| → ∞`, and not
  a product `f(x) g(y)`, since then `M(x, y) M(y, x) = M(x, x) M(y, y) = φ(0)² ≠ 0` for all `x`,
  `y`, which fails at `x = 0` and large `|y|`. The elementary symbols `f(x) g(y)` with `f`, `g`
  Schwartz, such as `e^{−|x|²−|y|²}`, are simpler non-Toeplitz examples
  (`|x − y|^k ≤ (|x| + |y|)^k`).
- In dimension one, `M(x, y) = φ((x − y)/(⟨x⟩ + ⟨y⟩))` with `φ` of class `C¹`, bounded with bounded
  derivative, has `|||M||| ≤ 2 sup |φ| + 4 sup |φ′|`, since `|x − y| ≤ ⟨x⟩ + ⟨y⟩` and only first
  derivatives enter (`σ₁ = 1`). The same formula is not an HMS symbol in dimension two, where second
  derivatives enter: for `φ(t) = sin t₁`, `x = 0` and `y = (R, 0)`, with `D = 1 + (1 + R²)^{1/2}`,
  `|x − y|² |∂²_{x₁} M| = R² |sin(R/D) + R cos(R/D)|/D²`, which is `5.70`, `54.6` and `541` at
  `R = 10, 100, 1000`: the second derivative of `⟨x⟩` at `x = 0` does not decay as `|y|` grows.
- `sign(x − y)`: the triangular truncation on `S_p(L²(ℝ))`.

### Dependencies

Layers 2 (§2.1), 3, 4, 7 and 10; BochnerSpaces §4.2; Mathlib Plancherel and Fréchet derivatives;
Tau Ceti Littlewood–Paley pieces and `L²` Fourier multipliers.

## Downstream consumers

- **SchattenClassesAndSchurMultipliers, Part II**: the Sobolev form of the
  Hörmander–Mikhlin–Schur theorem with `σ = n/2 + ε` (cgpt-2023 Theorem A′, line 1070), the
  Calderón–Torchinsky variants, divided differences of `α`-Hölder functions and Arazy's conjecture
  (cgpt-2023 lines 178–183), and the discrete and Lie-group formulations; it consumes Layers 3, 4,
  7, 10 and 11.
- **Operator-Lipschitz functions and double operator integrals**: Schur multipliers with
  divided-difference symbols `(f(λ) − f(μ))/(λ − μ)` on spectral measure spaces
  (potapov-sukochev-2011 Theorem 1, line 76, and Theorem 7, line 339); consumes Layers 2–4 and 11.
- **Approximation properties by Schur multipliers** (lafforgue-delasalle-2011 §2 onwards, the
  constants `Λ^{Schur}_{p,cb}`): consumes Layers 3–8.
- **Fourier multipliers on group von Neumann algebras of amenable groups**: the transference
  theorems of Neuwirth–Ricard and Caspers–de la Salle beyond `ℝⁿ`; consumes Layers 3, 8 and 9.

## References

- cgpt-2023 — J. M. Conde-Alonso, A. M. González-Pérez, J. Parcet, E. Tablate, *Schur multipliers in
  Schatten–von Neumann classes*, Ann. of Math. 198 (2023); arXiv 2201.05511v4.
- lafforgue-delasalle-2011 — V. Lafforgue, M. de la Salle, *Non commutative Lp spaces without the
  completely bounded approximation property*, Duke Math. J. 160 (2011); arXiv 1004.2327v3.
- pisier-grothendieck-2012 — G. Pisier, *Grothendieck's theorem, past and present*, Bull. Amer.
  Math. Soc. 49 (2012); arXiv 1101.4195v3.
- caspers-delasalle-2015 — M. Caspers, M. de la Salle, *Schur and Fourier multipliers of an amenable
  group acting on non-commutative Lp-spaces*, Trans. Amer. Math. Soc. 367 (2015); arXiv 1303.0135v2.
- neuwirth-ricard-2011 — S. Neuwirth, É. Ricard, *Transfer of Fourier multipliers into Schur
  multipliers and sumsets in a discrete group*, Canad. J. Math. 63 (2011).
- mei-2007 — T. Mei, *Operator valued Hardy spaces*, Mem. Amer. Math. Soc. 188 (2007); arXiv
  math/0311160v3.
- potapov-sukochev-2011 — D. Potapov, F. Sukochev, *Operator-Lipschitz functions in Schatten–von
  Neumann classes*, Acta Math. 207 (2011); arXiv 0904.4095v3.
- musat-2003 — M. Musat, *Interpolation between non-commutative BMO and non-commutative
  Lp-spaces*, J. Funct. Anal. 202 (2003).
- jrwz-2020 — Y. Jiao, N. Randrianantoanina, L. Wu, D. Zhou, *Square functions for noncommutative
  differentially subordinate martingales*, Comm. Math. Phys. 374 (2020).
- reed-simon-1-1980 — M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*, §VI.6.
- simon-trace-ideals-2005 — B. Simon, *Trace Ideals and Their Applications*, Ch. 1–3.
- gohberg-krein-1969 — I. C. Gohberg, M. G. Kreĭn, *Introduction to the Theory of Linear
  Nonselfadjoint Operators in Hilbert Space*, Ch. III.
- paulsen-2002 — V. Paulsen, *Completely Bounded Maps and Operator Algebras*, Ch. 3 and Ch. 8.
- pisier-similarity-2001 — G. Pisier, *Similarity Problems and Completely Bounded Maps*, Ch. 5.
- horn-johnson-topics-1991 — R. A. Horn, C. R. Johnson, *Topics in Matrix Analysis*, Ch. 5.
- grafakos-classical-2014 — L. Grafakos, *Classical Fourier Analysis*, Theorem 6.2.7.
