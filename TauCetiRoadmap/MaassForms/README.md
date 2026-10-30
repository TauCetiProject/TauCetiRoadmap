# Roadmap: Maass forms — the hyperbolic Laplacian on `Γ₀(N)\ℍ`, Hecke–Maass newforms, and their invariants

A Maass cusp form of weight `0` for `Γ₀(N)` with nebentypus `χ` is a smooth function on the upper
half-plane, automorphic with character `χ`, square-integrable on the quotient, an eigenfunction of
the hyperbolic Laplacian, and without constant term at any cusp. This roadmap builds the classical
theory of these forms at level `N`: the Laplacian, the `χ`-isotypic restriction of the
self-adjoint Laplacian of `Γ₁(N)\ℍ`, the `K`-Bessel Fourier–Whittaker expansion, the dictionary
between the Laplace eigenvalue `λ` and the spectral parameter `r` with `λ = 1/4 + r²`, Hecke
operators, the reflection `z ↦ -z̄`, Atkin–Lehner and Fricke involutions, oldforms and newforms
with strong multiplicity one, Selberg's theorem `λ₁ ≥ 3/16` at level `N` with character, read off
the congruence spectral gap, Selberg's eigenvalue conjecture and Weyl's law as named
statements with their proofs, the `L`-function of a Hecke–Maass newform in the completed-`L`-function
data model, Maass forms for the Picard group `PSL₂(ℤ[i])` on hyperbolic three-space, and the
semantics of a rigorous certificate for a numerically computed Maass form.

It exists because every object type, displayed invariant and searchable property of the LMFDB's
Maass-form section is to be a precisely stated Lean definition with the theorems that make it well
defined. The section displays, for a Maass newform on `Γ₀(N)`: the level `N`, the weight (`0`),
the character (by its Conrey label), the spectral parameter `R` with a rigorous error, the
symmetry (even or odd under `z ↦ -z̄`), the Fricke sign for trivial character, and the Hecke
eigenvalues `a₁ = 1, a₂, a₃, …` with error intervals; it searches on level, weight, character,
spectral parameter and symmetry. Each of these is owned by a milestone below, or is handed to the
roadmap that owns it; the dictionary is Layer 8.

The primary carrier is a **weight-`0` Maass cusp form for `Γ₀(N)` with character `χ`**, with `N`
arbitrary and `χ` a Dirichlet character modulo `N`; level one with trivial character is a special
case, and its objects are consumed from the roadmap that owns them (below) rather than rebuilt.
Holomorphic modular forms, their Hecke theory and their `L`-functions are the
[modular-forms roadmap](../ModularForms/README.md)'s; this roadmap reuses its conventions, its
nebentypus spaces and its Fricke matrix, and states no holomorphic theorem.

Suggested home: `TauCeti/NumberTheory/MaassForms/`, with separate files for the Laplacian and
automorphic functions, the `K`-Bessel supplements and the Fourier expansion, the `χ`-isotypic
Laplacian and the cuspidal spectrum, Hecke and Atkin–Lehner operators with newforms, the `3/16`
theorem, `L`-functions, the Picard group, and the LMFDB layer.

## Prerequisites

Read, before anything is built: the [modular-forms roadmap](../ModularForms/README.md) (its
conventions on levels and characters, Layers 0, 3–6 and 9), the
[Fuchsian-orbifolds roadmap](../FuchsianOrbifolds/README.md) (fundamental domains, cusp data,
widths), §4.5 of the
[automorphic forms on reductive groups roadmap](../AutomorphicFormsOnReductiveGroups/README.md),
§§1.16–1.16a and 4.8–4.9 of the
[automorphic spectral theory roadmap](../AutomorphicSpectralTheory/README.md), §§0.1–0.2,
0.5b–0.6 and 5.3 of the [congruence spectral gap roadmap](../CongruenceSpectralGap/README.md),
Layer 0 of the [L-functions roadmap](../LFunctions/README.md), Layers 0 and 3–4 of the
[Kleinian-groups roadmap](../KleinianGroups/README.md), and, on the analysis side, the
[PDE roadmap](../PDE/README.md) Lane E, [self-adjoint spectral theory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
Parts C–E and the [weighted orthogonal `L²` bases roadmap](../../Completed/OrthogonalL2Bases/README.md)
B2. The exact declarations and milestones consumed from each are listed under *Consumed, not
redefined*, *What Mathlib supplies* and *What Tau Ceti supplies*; every milestone names which of
them it rests on.

## Scope and ownership

### Owned here

- The **hyperbolic Laplacian** `Δ = -y²(∂ₓ² + ∂ᵧ²)` on `C²` functions on `ℍ`, its invariance
  under `GL(2, ℝ)⁺`, its action on `y^s`, and the dictionary with the weight-`k` operators
  (Layer 0).
- **Automorphic functions with nebentypus** on `Γ₀(N)`, the parity lemma, regular and irregular
  cusps of `(Γ₀(N), χ)`, the constant term at a cusp, the cuspidality predicate, square-integrability
  through fundamental domains, the Petersson inner product of weight `0`, and the Hilbert space
  `L²(N, χ)` as the `χ`-isotypic subspace of `L²(Γ₁(N)\ℍ)` (Layer 0).
- The **carrier**: Maass forms and Maass cusp forms `M(N, χ, λ)`, `S(N, χ, λ)` for every level,
  character and eigenvalue, and the eigenvalue/spectral-parameter dictionary `λ = 1/4 + r² = s(1-s)`
  (Layer 1).
- The **`K`-Bessel supplements** beyond what §4.5 of the automorphic-forms roadmap supplies: uniform
  bounds in the order, small-argument behaviour, the Mellin transform, real-valuedness for imaginary
  order (Layer 2).
- The **Fourier–Whittaker expansion** at every cusp of `Γ₀(N)`, the Fourier coefficients with
  their trivial bound, the `K`-free limit characterization, exponential decay of cusp forms, the
  comparison with the level-one expansion of §4.5, and the reality and positivity of the eigenvalue
  of a cusp form (Layer 2).
- The **`χ`-isotypic Laplacian** `Δ_{N,χ}`, the restriction of the self-adjoint Laplacian of
  `Γ₁(N)\ℍ` to `L²(N, χ)`, with its domain, its kernel and its identification at trivial `χ` with
  the `Γ₀(N)` operator; the cuspidal subspace `L²_cusp(N, χ)`, the discreteness and finite
  multiplicity of its spectrum, an orthonormal basis of Maass cusp forms, `λ₁(N, χ)` and the
  counting function `cuspCount` (Layer 3). The operators themselves and their compact cuspidal
  resolvent are consumed.
- **Hecke operators** `Tₙ` at level `N` with character for every `n ≥ 1`, their coefficient
  formula, multiplicativity and adjoints; the **reflection** `ι` with the even/odd symmetry;
  **Atkin–Lehner and Fricke involutions** on weight-`0` forms; **oldforms, newforms, strong
  multiplicity one**, the bad-prime eigenvalues and the Fricke sign of a newform (Layer 4).
- **Selberg's theorem `λ ≥ 3/16`** for `(Γ₀(N), χ)`, as a corollary of the consumed congruence
  spectral gap; the elementary level-one bound `λ₁ ≥ 3π²/2`; **Selberg's eigenvalue
  conjecture** as a named proposition; the **scattering matrix** of `Γ₀(N)` and **Weyl's law** for
  the cuspidal spectrum of `(Γ₀(N), χ)` (Layer 5).
- The **`L`-function** of a Hecke–Maass newform: Dirichlet series, Euler product, completion,
  entire continuation, functional equation and root number, and its card in the completed-`L`-function
  data model (Layer 6).
- **Maass forms on `PSL₂(ℤ[i])\H³`**: the Laplacian on `H³`, the carrier, the Fourier–Bessel
  expansion `y K_{ir}(2π|n|y) e(Re(n x))`, the two symmetries, Hecke operators indexed by Gaussian
  integers up to sign, and the `L`-function (Layer 7).
- The **LMFDB layer**: the invariant dictionary for the section, the intrinsic label prefix, the
  multiplicity-one proposition for squarefree level, and the **certificate semantics** of a rigorous
  Maass form (Layer 8).

### Consumed, not redefined

- From the [automorphic forms on reductive groups roadmap](../AutomorphicFormsOnReductiveGroups/README.md),
  §4.5 *Maass forms, the Fourier ODE and Hecke normalization*: the level-one carrier
  `MaassCuspForm(Γ, λ)` for a finite-index congruence subgroup, the Bessel function
  `K_ν(u) = ∫₀^∞ e^{-u cosh t} cosh(νt) dt` with its absolute convergence, differentiation in `u`,
  `K_ν = K_{-ν}`, the equation `u²K'' + uK' - (u² + ν²)K = 0` and the asymptotic
  `K_ν(u) ~ √(π/(2u)) e^{-u}`; the factor-two Fourier expansion
  `φ(z) = 2√y Σ_{n≠0} a(n) K_{ir}(2π|n|y) e(nx)` with `fourierCoefficient` and `fourierExpansion`;
  `maassHecke(m) = m^{-1/2} Σ_{ad=m} Σ_{b mod d} φ((az+b)/d)` with its self-adjointness,
  commutativity and relations; the parity `ε`; `NormalizedMaassEigenform(r, δ)` with
  `maassHeckeRecurrence`; the adelic comparison `maassClassicalEquiv`. This roadmap generalizes each
  of these to `(Γ₀(N), χ)` and proves, at `N = 1` and trivial `χ`, that its object restricts to
  §4.5's (milestones 1.1, 2.3, 4.1); it adds no second level-one carrier and no second `K_ν`.
  Since the file holding `K_ν` is a roadmap target and not a Tau Ceti module, `Suggested.lean`
  writes the Bessel function as its defining integral wherever a signature needs it, and declares
  no Bessel function of its own.
- From the [automorphic spectral theory roadmap](../AutomorphicSpectralTheory/README.md):
  §1.16 `weight_laplacian` `Δ_k` with `weight_laplacian_slash` and `weight_laplacian_power`; §1.16a
  `modular_laplacian_realization`, the Friedrichs realization of `Δ` on `L²(Γ₀(N)/{±I}\ℍ)` with
  trivial character, which the congruence spectral gap roadmap's §0.2 identifies with its
  `Δ_{Γ₀(N)}`; §4.8 `gl2_spectral_expansion`; §4.9 `modular_weyl_estimates` (`N(X) ~ X/12` at level
  one); Layer 6's trace formula. The continuous spectrum, Eisenstein series and their meromorphic
  continuation are never restated.
- From the [congruence spectral gap roadmap](../CongruenceSpectralGap/README.md), for a congruence
  subgroup `Γ ≤ SL(2, ℤ)` acting through its effective image: §0.1 the quotient measure `μ_Γ` on
  `X_Γ = Γ\ℍ`, the pushforward of `volume` restricted to any measurable fundamental domain,
  independent of the domain, with `0 < μ_Γ(X_Γ) < ∞` and `μ_Γ(X_Γ) = π/3` at `Γ = SL(2, ℤ)`; §0.2
  the nonnegative self-adjoint Friedrichs realization `Δ_Γ` of `-y²(∂ₓ² + ∂ᵧ²)` on
  `L²(X_Γ, μ_Γ)`, densely defined, with kernel the constants, with maximal domain (the classes whose
  `Γ`-invariant lift has distributional `-y²(∂ₓ² + ∂ᵧ²)` in `L²`), and agreeing at `Γ = Γ₀(N)` with
  §1.16a's `modular_laplacian_realization`; §0.5b the compact resolvent of `Δ_{Γ(N)}` on its closed
  cuspidal subspace (zero constant term at every cusp), with pure point spectrum, finite-dimensional
  eigenspaces and finitely many eigenvalues in every bounded interval; §0.6 the congruence spectral
  description (the residual spectrum is the constants, the absolutely continuous spectrum is
  `[1/4, ∞)` with one channel per cusp, and every spectral value in `(0, 1/4)` is a
  finite-multiplicity eigenvalue whose eigenspace consists of Maass cusp forms); §5.3
  `congruence_eigenvalue_bound`, `21/100 ≤ λ` for every nonconstant bounded `Γ`-invariant `C²`
  function `u` on `ℍ` with `-(im z)² Δu = λu`. Layer 3 reads `(Γ₀(N), χ)` off `Γ₁(N)` as a
  `χ`-isotypic reducing subspace, and 5.3 reads `3/16` off `21/100`; no measure, operator or bound
  of that roadmap is restated, and `Suggested.lean` declares none of them.
- From the [modular-forms roadmap](../ModularForms/README.md) and the Tau Ceti modules built to it:
  the conventions on levels and characters (`[NeZero N]`, the two faces of `χ` bridged by
  `MulChar.equivToUnitHom`, the zero extension `χ(p) = 0` for `p ∣ N`), the nebentypus spaces
  `modFormCharSpace`/`cuspFormCharSpace` as the model for how a character enters (an eigenspace
  condition inside a bare-group space, with the transformation law a theorem), the definition of
  exact divisor `Q ‖ N`, the Fricke matrix `W_N = [0, -1; N, 0]` and the Atkin–Lehner matrices
  `W_Q` of its *Layer 6*, the shape of its *Layer 3* oldspace, *Layer 4* newforms and *Layer 5*
  strong multiplicity one, and its *Layer 9* predicate `IsSelfDual`. The Hecke coset
  representatives `[a, b; 0, d]`, `ad = n`, `(a, N) = 1`, `b mod d` are consumed from
  `TauCeti.NumberTheory.HeckeRing.GL2.Gamma0` (`CosetDecomposition`, `UpperTriangularDelta0`).
- From the [L-functions roadmap](../LFunctions/README.md), Layer 0: `AnalyticLFunctionData` (norm-indexed
  coefficients, positive integral conductor, real and complex gamma-shift multisets, root number,
  completed function, finitely supported polar divisor), its degree and gamma factor, the dual
  record, and the predicates *Dirichlet-series agreement*, *meromorphic continuation with exact
  poles*, *functional equation with unit-modulus root number*, *average coefficient growth*.
  Milestone 6.4 produces this card for a Hecke–Maass newform; it defines no second card.
- From the [Kleinian-groups roadmap](../KleinianGroups/README.md): `H^3` as
  `{p : EuclideanSpace ℝ (Fin 3) // 0 < p 2}` with `height`, the `MeasureSpace` instance with
  `volume_def` (density `(p 2)⁻³`), the quaternionic action of `PSL(2, ℂ)` with `smul_def`,
  `isometry_smul` and `SMulInvariantMeasure`, `bianchi F ι`, `isDiscrete_bianchi`, and
  `covolume_bianchiGaussian : catalanConstant / 3`. Layer 7 builds on this carrier and adds no
  second half-space.
- From the [Fuchsian-orbifolds roadmap](../FuchsianOrbifolds/README.md) and Tau Ceti: fundamental
  domains and covolume, cusp data with widths, horodiscs, the `q`-coordinate, finiteness of cusp
  orbits for a cofinite group, and the compactified quotient.
- From Mathlib and the analysis roadmaps: everything listed under *Prerequisites*.

### Not owned here

- **Holomorphic modular forms** of any weight, their Hecke theory, newforms, `L`-functions,
  dimension formulas and trace formula: the [modular-forms roadmap](../ModularForms/README.md).
  The weight-`k` Maass forms whose constant term is `y^{k/2}` times a holomorphic form are mentioned
  only in the weight dictionary of 0.1.
- **Half-integral weight Maass forms**, the Kohnen plus space and the Shimura lift: the
  [metaplectic automorphic forms roadmap](../MetaplecticAutomorphicForms/README.md), §7.2
  `halfWeightMaass` and 7.32 `biroLevelSpaces`.
- **Eisenstein series, their meromorphic continuation, the Maass–Selberg relations, the continuous
  spectrum, the full spectral decomposition of `L²(Γ\ℍ)` and the Selberg trace formula**: the
  [automorphic spectral theory roadmap](../AutomorphicSpectralTheory/README.md), Layers 1–4 and 6.
  Layer 5 here consumes the trace formula to prove Weyl's law and owns only the scattering matrix of
  `Γ₀(N)` as an explicit object.
- **The adelic theory**: automorphic representations of `GL₂`, the adelization of Maass forms
  (§4.5's `maassAdelization`), Kuznetsov's formula and the Kim–Sarnak bound `|λ(p)| ≤ p^{7/64} + p^{-7/64}`
  (symmetric-power functoriality): the automorphic-forms, automorphic-spectral-theory and
  `GL₂`-transfer roadmaps. The Ramanujan–Petersson conjecture for Maass forms is a named hypothesis
  here (6.3), never a theorem.
- **Maass forms on `GL(n)` for `n ≥ 3`** (the LMFDB `L`-function instance types `MaassGL3`,
  `MaassGL4`, `MaassGSp4`): the automorphic-forms roadmap's Whittaker theory, §4.3; nothing here
  is stated beyond `GL₂` over `ℚ` and over `ℚ(i)`.
- **Bianchi modular forms** of weight `2` as cuspidal cohomology classes and harmonic forms on
  `H³`, their Hecke theory, base change and the elliptic-curve correspondence: the sibling roadmap
  `BianchiModularForms`. Layer 7 here is the weight-`0` Laplace eigenfunction theory for the one
  group `PSL₂(ℤ[i])`; its Hecke operators and `L`-function are stated for that group, and the
  general level-`𝔫` Bianchi theory is not.
- **Labels and orderings**: label components beyond the intrinsic prefix, orderings fixed by
  convention, stored lists, and the completeness of database tables are not targets: the spectral
  index `m` and the index `d` among forms with equal eigenvalue in the label `N.k.a.m.d`, the
  Conrey labelling of characters, the stored encodings of symmetry and Fricke sign, and the
  completeness ranges of the database. Layer 8 states the intrinsic prefix `(N, k, χ)` and the invariants
  the labels are built from.
- **Kloosterman sums modulo `c` with character**, their multiplicativity, Salié's evaluation and
  Weil's bound at every modulus, Gauss and Jacobi sums: `CharacterSumsOverFiniteFields`.
- **Elliptic regularity, Sobolev spaces, the Friedrichs extension in the abstract, the spectral
  theorem for unbounded self-adjoint operators**: the PDE and self-adjoint-spectral-theory roadmaps.
  3.3 and Layer 7 apply them.
- **Numerical algorithms** (Hejhal's algorithm, the Stark–Hejhal collocation, the computation of
  `R` and of the coefficients), portraits, and the heuristic data: Layer 8 states what a certificate
  proves and never asserts that a particular decimal is a Maass form.

## Pinned conventions

Each of these could go two ways; every milestone uses the choice made here.

- **The plane and the measure.** `ℍ` is Mathlib's `UpperHalfPlane`, `z = x + iy` with
  `x = z.re`, `y = z.im`. The invariant measure is `UpperHalfPlane.volume`, `dμ = y⁻² dx dy`.
  No second measure is introduced. The group `SL(2, ℤ)` acts through Mathlib's `SLAction`;
  `Γ₀(N)` is `CongruenceSubgroup.Gamma0 N` with `[NeZero N]` in every theorem; `d_γ` is the
  lower-right entry of `γ`, read mod `N` through `Gamma0Map N γ`.
- **The Laplacian is nonnegative.** `Δ f = -y² (∂ₓ² f + ∂ᵧ² f)`, computed as
  `-(im z)² · InnerProductSpace.laplacian (f ∘ ofComplex)` on `ℂ` as a real inner product space.
  This is the LMFDB's `mf.maass.mwf.laplacian`, the convention `D` of AutomorphicSpectralTheory and
  the operator of AutomorphicFormsOnReductiveGroups §4.5; eigenvalues are `λ ≥ 0`. The
  opposite-sign operator of the Gross–Zagier literature is never used. `Δ y^s = s(1-s) y^s`.
- **The eigenvalue and the spectral parameter.** For a Maass form the eigenvalue `λ` is written
  `λ = 1/4 + r² = s(1-s)`, `s = 1/2 + ir`. `spectralParameter λ := √(λ - 1/4)` is the
  nonnegative real `r` when `λ ≥ 1/4`; an eigenvalue with `0 < λ < 1/4` is **exceptional**, and
  its parameter is `t := √(1/4 - λ) ∈ (0, 1/2)`, i.e. `r = it`. The LMFDB's `spectral_parameter`
  column is the real `R = r` of the non-exceptional case (`columns.maass_rigor.spectral_parameter`,
  `mf.maass.mwf.eigenvalue`); its `mf.maass.spectral_index` knowl describes the standard case with
  the words "`R` purely imaginary", which is the opposite assignment, and this roadmap follows the
  column and the eigenvalue knowl. `λ = 0` occurs only for constants and never for a cusp form.
- **Automorphy with character.** `f ∈ A(N, χ)` means `f(γz) = χ(d_γ) f(z)` for all
  `γ ∈ Γ₀(N)`, with `χ : DirichletCharacter ℂ N` evaluated at `Gamma0Map N γ`. This is the
  nebentypus law of the modular-forms roadmap at weight `0` (no automorphy factor), and the
  parity lemma reads `A(N, χ) ≠ 0 → χ(-1) = 1`. Both faces of `χ` are kept, the Dirichlet
  character (zero on non-units, so that `χ(p) = 0` for `p ∣ N` in every formula) and the unit
  homomorphism `MulChar.equivToUnitHom χ` where an eigenspace is indexed.
- **Regular and irregular cusps, and the uniform cusp condition.** Every cusp of `Γ₀(N)` is
  `σ∞` for some `σ ∈ SL(2, ℤ)`, and for the width `w_σ` of that cusp
  `g := f ∘ σ` satisfies `g(z + w_σ) = ζ_σ g(z)` with `ζ_σ = χ(d)` for the generator
  `σ T^{w_σ} σ⁻¹ = [1 - acw, a²w; -c²w, 1 + acw]` of the stabilizer (`σ = [a, b; c, d']`). The cusp is
  **regular** when `ζ_σ = 1` and **irregular** otherwise; for trivial `χ` every cusp is regular.
  Since `w_σ ∣ N` and `ζ_σ^{N/w_σ} = χ((1 + acw)^{N/w_σ}) = 1`, the condition
  `∫₀^N g(x + iy) dx = 0` for all `y > 0` is `N/w_σ` times the vanishing of the constant term at a
  regular cusp and holds identically at an irregular cusp. **Cuspidality is therefore the single
  condition `∀ σ ∈ SL(2, ℤ), ∀ y > 0, ∫₀^N f(σ(x + iy)) dx = 0`**, with no width bookkeeping, and
  milestone 0.4 proves it equivalent to "zero constant term at every regular cusp".
- **Square-integrability** is `∫_F |f|² dμ < ∞` for a measurable fundamental domain `F` of
  `Γ₀(N)`, independent of `F` because `|f|²` is invariant. The group in Mathlib's predicate is the
  image `Γ̄₀(N) := gamma0PSL N` of `Γ₀(N)` in `PSL(2, ℝ)` (through Tau Ceti's
  `psl2zToPSL2R`), **never** `Gamma0 N` itself: `-I ∈ Γ₀(N)` acts trivially on `ℍ`, so
  `IsFundamentalDomain (Gamma0 N) F volume` demands `F` be a.e. disjoint from itself and is
  satisfiable by no `F`. The indices agree, `[PSL₂(ℤ) : Γ̄₀(N)] = [SL₂(ℤ) : Γ₀(N)]`, because
  `-I ∈ Γ₀(N)`. The **Petersson inner product** is
  `⟨f, g⟩ = ∫_F f ḡ dμ`, conjugate-linear in the second slot, with no normalization by the
  covolume. The norm of a form is `‖f‖ = ⟨f, f⟩^{1/2}`. On `L²(N, χ)`, read as the `χ`-isotypic
  subspace of `L²(X_{Γ₁(N)}, μ_{Γ₁(N)})` (0.5), the Petersson product is
  `[Γ̄₀(N) : Γ̄₁(N)]⁻¹` times the ambient product, the index of the images in `PSL(2, ℝ)`
  (`1` for `N ≤ 2`, `φ(N)/2` for `N ≥ 3`).
- **The Fourier expansion carries a factor two.** At the cusp `∞`, for `λ = 1/4 + r²`,
  `f(z) = 2 √y Σ_{n ≠ 0} a_f(n) K_{ir}(2π|n|y) e(nx)`, `e(x) = exp(2πix)`. This is the
  normalization of AutomorphicFormsOnReductiveGroups §4.5 and of Iwaniec's `W_s(z) = 2√y K_{s-1/2}(2πy) e(x)`,
  so that `fourierCoefficient` of §4.5 is literally the `N = 1` case of 2.3. The LMFDB knowl
  `mf.maass.mwf.fourierexpansion` writes the expansion without the `2`; the two differ by a scalar
  multiple of the form and agree on every normalized quantity. The **normalized coefficients**
  `λ_f(n) := a_f(n) / a_f(1)` of a newform are the LMFDB's `coefficients` column (`a_1 = 1`), and
  for a form of parity `ε` the knowl's cosine or sine expansion is `f / (4 a_f(1))`, resp.
  `f / (4i a_f(1))`.
- **Hecke operators are unitarily normalized.** For `n ≥ 1`,
  `(Tₙ f)(z) = n^{-1/2} Σ_{ad = n, a, d > 0} χ(a) Σ_{b mod d} f((az + b)/d)`, with `χ(a) = 0` when
  `(a, N) > 1`. Then `a_{Tₙ f}(m) = Σ_{d ∣ (m, n)} χ(d) a_f(mn/d²)`, the eigenvalue of `Tₙ` on a
  normalized eigenform is `λ_f(n)`, and `TₘTₙ = Σ_{d ∣ (m,n)} χ(d) T_{mn/d²}`. At `p ∣ N` this is the
  operator the literature writes `Uₚ`, and `Uₚ` is an alias with the lemma `Uₚ = Tₚ`. The
  Ramanujan–Petersson bound in this normalization reads `|λ_f(p)| ≤ 2` for `p ∤ N`; the trivial
  bound is `λ_f(n) = O(n^{1/2})`. §4.5's `maassHecke(m)` is the `N = 1` case.
- **Reflection and symmetry.** `(ιf)(z) = f(-z̄)`. A form is **even** when `ιf = f` and **odd**
  when `ιf = -f`; `a_{ιf}(n) = a_f(-n)`, so an even form has `a(-n) = a(n)` and an odd form
  `a(-n) = -a(n)`. The LMFDB `symmetry` column stores an encoding of this sign (`0` for even and `1`
  for odd on the `maass_rigor` table; `+1`/`-1` on the retired `maass_newforms` table); the sign
  `ε ∈ {±1}` is the invariant, the encoding is not a target. The
  parity `δ ∈ {0, 1}` is `ε = (-1)^δ`, as in §4.5.
- **Fricke and Atkin–Lehner.** `(W_N f)(z) = f(-1/(Nz))`, the raw slash of weight `0` by the
  Fricke matrix of the modular-forms roadmap; at weight `0` no scalar normalization is needed and
  `W_N² = 1` on `A(N, χ)` when `χ` is trivial. For `Q ‖ N`, `W_Q` is the raw slash by any
  Atkin–Lehner matrix `[Qa, b; Nc, Qd]` of determinant `Q`, well defined on `A(N, 1)`. The
  **Fricke sign** `ε_N(f) ∈ {±1}` of a newform with trivial character is its `W_N`-eigenvalue; it
  is the product of the `W_{p^{v_p(N)}}`-eigenvalues `η_p(f)`. The LMFDB's `fricke_eigenvalue`
  column stores `ε_N` and uses `0` for "not computed rigorously"; the `0` is an encoding, not a
  value of the invariant.
- **The root number** of the `L`-function of a newform with trivial character is
  `ε_N(f) · (-1)^δ`, where `δ` is the parity: `Λ(s, f) = ε_N (-1)^δ Λ(1 - s, f)` with
  `Λ(s, f) = N^{s/2} Γ_ℝ(s + δ + ir) Γ_ℝ(s + δ - ir) L(s, f)` and `Γ_ℝ(s) = π^{-s/2} Γ(s/2)`
  (Mathlib's `Complex.Gammaℝ`). The conductor of the card is `N`, its degree `2`, and the
  analytic normalization is the one with centre `1/2`; there is no arithmetic weight.
- **`H³` and its Laplacian.** `H³` is the Kleinian-groups carrier, a point `P = x + yj` with
  `x ∈ ℂ` and `y = height P > 0`; `Δ₃ = -y²(∂²_{x₁} + ∂²_{x₂} + ∂²_y) + y ∂_y`, the negative of the
  knowl `mf.maass.picard.laplacian`, so that it is nonnegative and `Δ₃ y^s = s(2-s) y^s`;
  eigenvalues are `λ = 1 + r²`, `s = 1 + ir`, the knowl `mf.maass.picard.eigenvalue`. The
  Fourier expansion at `∞` is `f(P) = Σ_{0 ≠ n ∈ ℤ[i]} a(n) y K_{ir}(2π|n|y) e(Re(n x))`, the
  pairing `Re(n x)` under which `ℤ[i]` is self-dual.
- **Named conjectures are propositions.** `SelbergEigenvalueConjecture N χ`,
  `RamanujanPetersson N f` and `MultiplicityOne N χ` are `Prop`s with their statements; the
  theorems below prove the instances that are theorems (`3/16`, level one) and conclude nothing
  from the propositions except as stated implications.

## What Mathlib supplies

- `UpperHalfPlane` with `coe`, `ofComplex` (`ofComplex_apply_of_im_pos`), `im`, `re`, the
  `SL(2, R)` action `SLAction` for `R = ℤ, ℝ`, the `GL(2, ℝ)⁺` action and `ModularGroup.S`, `T`;
  the measure `volume` with `volume_def`, local finiteness and `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume`.
- `CongruenceSubgroup.Gamma0 N`, `Gamma1 N`, `Gamma N`, `Gamma0Map`, `Gamma1'`, and in
  `Cusps.lean` the parabolic-fixed-point cusps `IsCusp`, transitivity of `SL(2, ℤ)` on
  `OnePoint ℚ` (`OnePoint.exists_mem_SL2`), `strictWidthInfty`, `widthInfty`, and the arithmetic
  subgroup class `Subgroup.IsArithmetic`.
- `DirichletCharacter ℂ N`, `changeLevel`, `conductor`, `IsPrimitive`, the Gauss sums `gaussSum`,
  `MulChar.equivToUnitHom`/`ofUnitHom`; `ZMod` units and `Nat.divisorsAntidiagonal` for Hecke sums.
- `InnerProductSpace.laplacian`/`laplacianWithin` with `laplacian_eq_iteratedFDeriv_complexPlane`
  (so that `Δ` on `ℂ` is `∂ₓ² + ∂ᵧ²`), `ContDiffOn`, `iteratedFDeriv`.
- `MeasureTheory.IsFundamentalDomain` with `setIntegral_eq`, `integrableOn_iff`, `covolume`,
  `HasFundamentalDomain`; `Lp ℂ 2 μ` as a Hilbert space; `intervalIntegral`.
- `LinearPMap`, `LinearPMap.adjoint`, `IsSelfAdjoint` (with `IsSelfAdjoint.isClosed`,
  `IsSelfAdjoint.dense_domain`), `HilbertBasis` with `mkOfOrthogonalEqBot`, and the finite-dimensional
  joint diagonalization `LinearMap.IsSymmetric.iSup_iInf_eq_top_of_commute`,
  `LinearMap.IsSymmetric.directSum_isInternal_of_commute`.
- `LSeries`, `LSeriesSummable`, `LSeries.abscissaOfAbsConv`, Euler products for multiplicative
  coefficients, `Complex.Gammaℝ`, `Complex.Gamma`, `mellin`, `WeakFEPair`; `Complex.besselJ`
  (the function of the first kind, analytic on the slit plane) and `regularizedHGFun`.
- `GaussianInt` for `ℤ[i]`, `Zsqrtd`, and the arithmetic of `ZMod`.

## What Tau Ceti supplies

- `TauCeti.Analysis.Complex.Fuchsian.Covolume` (`Subgroup.IsCofinite`, `hasFundamentalDomain`,
  `exists_isFundamentalDomain`) and `TauCeti.Analysis.Complex.Fuchsian.Cusp.*` (`IsCuspPoint`,
  `CuspOrbit`, `CuspDatum` with `scaling`, `generator`, `width`, `zpowers_generator`,
  `scaling_mul_generator_mul_inv`, horodiscs, `coordinate`, `qCoordinate`, finiteness of cusp orbits,
  `widthIndex`); `TauCeti.Analysis.Complex.UpperHalfPlane.*` (`FundamentalDomain`,
  `DirichletDomain`, `CuspCoordinate`, `Growth`, `Stabilizer`).
- `TauCeti.NumberTheory.ModularForms.DiamondOperators`, `CharacterDecomp`, `Parity`
  (`diamondOp`, `modFormCharSpace`, `cuspFormCharSpace`, `mem_modFormCharSpace_iff_nebentypus`),
  `TauCeti.NumberTheory.ModularForms.Fricke.*` (`frickeGL`, `frickeOperator`, `frickeScalar`,
  `Involution`, `AtkinLehnerBar`, `Hecke`), `TauCeti.NumberTheory.HeckeRing.GL2.Gamma0.*`
  (`Delta0`, `CosetDecomposition`, `UpperTriangularDelta0`, `CoprimeDetCoset`, `AtkinLehner`,
  `NebentypusChar`), `TauCeti.NumberTheory.DirichletCharacter.*` (`Conductor`, `Even`, `GaussSum`).
- `TauCeti.Analysis.PDE.*` (`Regularity`, `Spectrum`, `SymmetricEnergy`, `EnergyForm`),
  `TauCeti.Analysis.Sobolev.*` (`RellichKondrachov`, `WeakDeriv`, `W1p`) and
  `TauCeti.Analysis.ODE.*` (`Linear`, `Regularity`, `Frobenius`): the elliptic-regularity,
  compactness and second-order ODE tools Layers 2, 3 and 7 apply.
- On Tau Ceti main beyond the pin, cited in prose only: `TauCeti/Analysis/SpecialFunctions/BesselI.lean`
  (`Real.besselI ν x` with its series, positivity, derivative and recurrence), the growing solution
  of the mode equation in 2.1–2.2, and `TauCeti/Analysis/Distribution/SchwartzSpace/LaplacianResolvent.lean`,
  the Euclidean model for the resolvent construction of Layer 7.

## What is missing

Nothing in Mathlib or Tau Ceti mentions a Maass form, the `K`-Bessel function or the hyperbolic
Laplacian as an operator on a quotient; the operator on a congruence quotient is the congruence
spectral gap roadmap's. Specifically absent, and built here:
the Laplacian on `ℍ` and its invariance; automorphic functions with nebentypus at weight `0`;
regular and irregular cusps for a character; the carrier `S(N, χ, λ)`; the Mellin transform and
uniform bounds of `K_{ir}`; the Fourier expansion at every cusp with the limit characterization of
the coefficients; the `χ`-isotypic subspace `L²(N, χ)`, the restricted Laplacian `Δ_{N,χ}` and the
discreteness of its cuspidal spectrum; Hecke operators on nonholomorphic forms; the reflection;
weight-`0` Atkin–Lehner theory, old/new and strong multiplicity one; the `3/16` theorem with
character; the scattering matrix of `Γ₀(N)`; Weyl's law at level `N`; the `L`-function card; Maass
forms on `H³`; and the certificate semantics.

## The build, in layers

Milestones are numbered `N.M`; each states what it rests on. "Rests on" lists are exhaustive.

## Layer 0: the Laplacian, automorphy with character, cusps and the Petersson product

### 0.1 The hyperbolic Laplacian

Define `hyperbolicLaplacian f z := -(im z)² · Δ(f ∘ ofComplex)(z)` for `f : ℍ → ℂ`, where `Δ` is
`InnerProductSpace.laplacian` on `ℂ` as a two-dimensional real inner product space, and prove it is
`-y²(∂ₓ² + ∂ᵧ²) f` through `laplacian_eq_iteratedFDeriv_complexPlane`. Prove linearity on `C²`
functions, `Δ 1 = 0`, `Δ y^s = s(1 - s) y^s` for complex `s` (with `y^s` the real power), and
`Δ y² = -2y²` as the sign check. Define the **weight-`k` operator** of the unitary convention,
`Δ^{(u)}_k = -y²(∂ₓ² + ∂ᵧ²) + iky ∂ₓ` (the negative of the LMFDB knowl `mf.maass.mwf.weight`), and
prove the dictionary with AutomorphicSpectralTheory's `weight_laplacian`
`Δ_k = -y²(∂ₓ² + ∂ᵧ²) + iky(∂ₓ + i∂ᵧ)`: for `F = y^{k/2} f`,
`Δ_k f = y^{-k/2}(Δ^{(u)}_k F + (k²/4 - k/2) F)`, the constant being `-3/16` at `k = 1/2` as that
roadmap records. The weight-`k` operator exists so that the LMFDB's `weight` column has a meaning
for `k ≠ 0`; every other milestone is at weight `0`, and no theorem about `Δ^{(u)}_k` for `k ≠ 0`
is a target here.
Rests on: Mathlib's `InnerProductSpace.laplacian`; AutomorphicSpectralTheory §1.16 for the
comparison target.

### 0.2 Invariance

For `g ∈ GL(2, ℝ)⁺` and `f` of class `C²`, `Δ(f ∘ g) = (Δf) ∘ g`, where `g` acts by Möbius
transformations; in particular `Δ` commutes with the action of `SL(2, ℤ)`, with the dilations
`z ↦ dz`, `d > 0`, and with the reflection `z ↦ -z̄` (which is not in `GL(2, ℝ)⁺`; prove it
separately). Prove `Δ` is symmetric for compactly supported `C²` functions on `ℍ`:
`∫ (Δf) ḡ dμ = ∫ (∂ₓf ∂ₓḡ + ∂ᵧf ∂ᵧḡ) dx dy = ∫ f (Δg)‾ dμ` (Green's formula on `ℍ`), the Dirichlet
integral `∫ |∇f|² dx dy` being `GL(2, ℝ)⁺`-invariant.
Rests on: 0.1; Mathlib's Möbius action and chain rule.

### 0.3 Automorphic functions with nebentypus and the parity lemma

Define `IsAutomorphic N χ f := ∀ γ ∈ Γ₀(N), f(γz) = χ(Gamma0Map N γ) f(z)` and the `ℂ`-submodule
`A(N, χ) = automorphicSpace N χ` of `ℍ → ℂ` it cuts out, for `χ : DirichletCharacter ℂ N`. Prove: `A(N, χ)` is stable under `Δ` on `C²`
functions (by 0.2), under the reflection `ι`, under `f ↦ f ∘ W_N` with `χ ↦ χ̄`, and under
`f ↦ f(d ·)` from `A(M, χ')` to `A(N, changeLevel χ')` when `M ∣ N`, `d ∣ N/M`. Prove the
**parity lemma**: `-I ∈ Γ₀(N)` acts trivially on `ℍ`, so `f = χ(-1) f`, and `A(N, χ) = 0` unless
`χ(-1) = 1`. Prove the comparison with the modular-forms roadmap: an element of
`modFormCharSpace k χ` satisfies the weight-`k` nebentypus law (`mem_modFormCharSpace_iff_nebentypus`),
and `A(N, χ)` is the same law at `k = 0` on arbitrary functions.
Rests on: Mathlib's `Gamma0`, `Gamma0Map`; Tau Ceti's `mem_modFormCharSpace_iff_nebentypus`.

### 0.4 Cusps of `(Γ₀(N), χ)`, the constant term, and the cuspidality predicate

For `σ ∈ SL(2, ℤ)` define the **width** `w_σ := N / gcd(c², N)` of the cusp `σ∞ = a/c`
(`σ = [a, b; c, d']`), prove `w_σ ∣ N`, prove that `σ T^{w_σ} σ⁻¹ ∈ Γ₀(N)` generates the
stabilizer of `σ∞` in `Γ₀(N)/{±I}`, and identify `w_σ` with the `width` of the Tau Ceti
`CuspDatum` whose `scaling` is `σ⁻¹`. Define the **multiplier** `ζ_σ := χ(1 + a c w_σ)`, the
predicate `IsRegularCusp χ σ := ζ_σ = 1`, and prove `ζ_σ^{N/w_σ} = 1` from
`(1 + acw)^{N/w} ≡ 1 (mod N)`. Prove that for `f ∈ A(N, χ)` the function `g = f ∘ σ` satisfies
`g(z + w_σ) = ζ_σ g(z)`, and that `ζ_σ` and regularity depend only on the `Γ₀(N)`-orbit of `σ∞`.
For a regular cusp define the **constant term** `c_σ(f, y) := w_σ⁻¹ ∫₀^{w_σ} f(σ(x + iy)) dx` and
for every `σ` the **cusp integral** `I_σ(f, y) := ∫₀^N f(σ(x + iy)) dx`. Prove
`I_σ(f, y) = N · c_σ(f, y)` at a regular cusp (the `N/w_σ` periods each contribute
`w_σ c_σ`) and `I_σ(f, y) = 0` at an irregular cusp (geometric sum of `ζ_σ^j`). Define **`IsCuspidal N f := ∀ σ ∈ SL(2, ℤ), ∀ y > 0, I_σ(f, y) = 0`** (the character enters only
through the regularity of the cusps, not the predicate) and prove
it equivalent to: the constant term vanishes at every regular cusp, for every `y`. Prove that for
trivial `χ` every cusp is regular, that the cusp `∞` (`σ = 1`) is regular for every `χ`, and the
rejection check that for `N = 9`, `σ∞ = 1/3` and `χ` an even character of order `3` modulo `9`,
`w_σ = 1`, `1 + acw = 4` and `ζ_σ = χ(4) ≠ 1`, so the cusp is irregular. Count the cusps:
`Σ_{d ∣ N} φ(gcd(d, N/d))` orbits, consumed from the Fuchsian library's cusp-orbit API where it
states it and proved here otherwise.
Rests on: 0.3; Mathlib's `Gamma0`, `OnePoint.exists_mem_SL2`; Tau Ceti's `CuspDatum`.

### 0.5 Square-integrability, the Petersson inner product and `L²(N, χ)`

The quotient measure, its independence of the fundamental domain and its finiteness are consumed
from CongruenceSpectralGap §0.1 at `Γ = Γ₀(N)` and `Γ = Γ₁(N)`; this milestone owns the
weight-`0` packaging with a character. Define `gamma0PSL N := (Gamma0 N).map (psl2zToPSL2R ∘ mk')`,
the image of `Γ₀(N)` in `PSL(2, ℝ)`,
and `IsSquareIntegrable N f := ∃ F, IsFundamentalDomain (gamma0PSL N) F volume ∧ IntegrableOn (‖f‖²) F volume`
and prove that for `f ∈ A(N, χ)` the clause holds for every fundamental domain once it holds for
one (`IsFundamentalDomain.integrableOn_iff`, `|f|²` being invariant since `|χ(d)| = 1`), that a
measurable fundamental domain of `Γ₀(N)` exists (Tau Ceti's `exists_isFundamentalDomain` for the
image of `Γ₀(N)` in `PSL(2, ℝ)`, transported along the quotient), and that its measure
`μ_{Γ₀(N)}(X_{Γ₀(N)})` is `(π/3) [SL(2, ℤ) : Γ₀(N)] = (π/3) N ∏_{p ∣ N}(1 + 1/p)`, from §0.1's
level-one value `π/3` and Tau Ceti's `MeasureTheory.covolume_eq_card_mul_covolume` (the index in
`PSL(2, ℤ)` equals the index in `SL(2, ℤ)` because `-I ∈ Γ₀(N)`). Define
`petersson N f g := ∫_F f ḡ dμ` for square-integrable `f, g ∈ A(N, χ)` and prove independence of
`F` (`IsFundamentalDomain.setIntegral_eq`), sesquilinearity, positivity, and the invariance
`⟨f ∘ σ, g ∘ σ⟩ = ⟨f, g⟩` for `σ` normalizing `Γ₀(N)`.

For `γ ∈ Γ₀(N)` the map `f ↦ f ∘ γ` descends to a unitary operator `⟨d_γ⟩` of
`L²(X_{Γ₁(N)}, μ_{Γ₁(N)})` (`Γ₁(N)` is normal in `Γ₀(N)`, and `γ` preserves `μ_{Γ₁(N)}` by §0.1's
independence of the fundamental domain) that depends only on `d_γ mod N`. Define the Hilbert space
`L²(N, χ)` as the closed subspace `{f : ⟨d⟩ f = χ(d) f for all d ∈ (ℤ/Nℤ)ˣ}` and prove: its
orthogonal projection is `φ(N)⁻¹ Σ_{d ∈ (ℤ/Nℤ)ˣ} conj(χ(d)) ⟨d⟩`; the subspaces for distinct
characters are orthogonal, `L²(N, χ) = 0` for odd `χ`, and `L²(X_{Γ₁(N)}, μ_{Γ₁(N)})` is their
orthogonal sum over the Dirichlet characters modulo `N`; the classes of the measurable
square-integrable elements of `A(N, χ)` are exactly `L²(N, χ)`, with the Petersson product of the
pinned conventions; for even `χ`, restriction to a fundamental domain `F` of `Γ̄₀(N)` is an isometry
of `L²(N, χ)` with its Petersson norm onto `Lp ℂ 2 (volume.restrict F)`; and pulling back along
`X_{Γ₁(N)} → X_{Γ₀(N)}` identifies `L²(X_{Γ₀(N)}, μ_{Γ₀(N)})` with `L²(N, 1)`, multiplying squared
norms by `[Γ̄₀(N) : Γ̄₁(N)]`.
Rests on: 0.3; CongruenceSpectralGap §0.1; Mathlib's `IsFundamentalDomain`, `Lp`; Tau Ceti's
`Covolume` and `MeasureTheory.covolume_eq_card_mul_covolume`.

## Layer 1: the carrier and the spectral parameter

### 1.1 Maass forms and Maass cusp forms

Define `IsMaassForm N χ λ f` for `f : ℍ → ℂ` and `λ : ℝ`: `f ∘ ofComplex` is `C^∞` on
`{im > 0}`, `f ∈ A(N, χ)`, `Δf = λ f`, and `IsSquareIntegrable N f`; define
`IsMaassCuspForm N χ λ f := IsMaassForm N χ λ f ∧ IsCuspidal N f`. Define the submodules
`M(N, χ, λ)`, `S(N, χ, λ) ≤ (ℍ → ℂ)` they cut out, with their closure proofs. Prove the comparison:
for `N = 1` and trivial `χ`, `S(1, 1, λ)` is the carrier `MaassCuspForm(SL₂(ℤ), λ)` of
AutomorphicFormsOnReductiveGroups §4.5 (the same four conditions; the cusp condition at the single
cusp `∞` with `N = 1` is that roadmap's zero-constant-term clause), and more generally
`S(N, 1, λ)` is its `MaassCuspForm(Γ₀(N), λ)`. Prove `S(N, χ, λ) = 0` unless `χ(-1) = 1` (0.3),
and that `S(N, χ, λ) ↪ S(N', changeLevel χ, λ)` for `N ∣ N'`.
Rests on: 0.1–0.5.

### 1.2 The spectral parameter

Define `spectralParameter λ := √(λ - 1/4)` and `exceptionalParameter λ := √(1/4 - λ)`, prove
`λ = 1/4 + r²` for `λ ≥ 1/4` and `λ = 1/4 - t²` for `λ ≤ 1/4`, `λ = s(1-s)` with `s = 1/2 + ir`,
resp. `s = 1/2 + t ∈ (1/2, 1)`, and define `IsExceptional λ := λ < 1/4`. Prove the LMFDB
dictionary: `spectral_parameter = spectralParameter λ`; the title line "`R = 9.53369526`" of the
form `1.1` is `spectralParameter 91.1413453…`. Prove that `r ↦ 1/4 + r²` is injective on `r ≥ 0`
and that `K_{ir} = K_{-ir}` makes the sign of `r` immaterial in every expansion.
Rests on: 1.1; §4.5's `K_ν = K_{-ν}`.

## Layer 2: the `K`-Bessel function and the Fourier–Whittaker expansion

### 2.1 Supplements to `K_ν`

With `K_ν(u) = ∫₀^∞ e^{-u cosh t} cosh(νt) dt` consumed from §4.5 (convergence, differentiation,
evenness in `ν`, the equation `u²K'' + uK' - (u² + ν²)K = 0`, the asymptotic `√(π/(2u)) e^{-u}`),
prove: (i) `K_{ir}(u) ∈ ℝ` for real `r` and `u > 0`, and `|K_{ir}(u)| ≤ K_0(u)`; (ii) for `ν = t`
real, `0 ≤ t < 1/2`, `K_t(u) > 0` and `K_t(u) ≤ K_{1/2}(u) = √(π/(2u)) e^{-u}`; (iii) the uniform
bound `|K_ν(u)| ≤ C(a) e^{-u/2}` for `u ≥ 1` and `|Re ν| ≤ a`, from the integral; (iv) the
small-argument behaviour: `|K_{ir}(u)| ≤ C_r` for `0 < u ≤ 1` and real `r`, and
`K_t(u) ~ (Γ(t)/2)(u/2)^{-t}` as `u → 0⁺` for `0 < t < 1/2`;
(v) the **Mellin transform** `∫₀^∞ K_ν(y) y^{s-1} dy = 2^{s-2} Γ((s+ν)/2) Γ((s-ν)/2)` for
`Re s > |Re ν|` (DLMF 10.43.19), which Layer 6 consumes; (vi) the dichotomy that the solution space
of `u²K'' + uK' - (u² + ν²)K = 0` on `(0, ∞)` is two-dimensional, spanned by `K_ν` and the growing
solution `I_ν` of Tau Ceti main's `Real.besselI`, and that a solution bounded by `C e^{-u/2}` for
large `u` is a multiple of `K_ν` (the Wronskian of `K_ν` and `I_ν` is `1/u`, so `I_ν` grows like
`e^{u}/√(2πu)`). Check numerically: `K_{1/2}(1) = 0.4610685044…` equals
`√(π/2) e^{-1}`; `K_0(1) = 0.4210244382…`; with `R = 9.53369526135355755`,
`K_{iR}(2π) = 6.82794275895 · 10⁻⁸` from the integral and from the series agree; the Mellin identity
at `ν = 1.3 i`, `s = 2.5` gives `0.72603653010…` on both sides.
Rests on: §4.5's `K_ν`; Mathlib's Gamma function and `mellin`; Tau Ceti's ODE library.

### 2.2 Fourier modes and the mode equation

For `f ∈ A(N, χ)` of class `C²` with `Δf = λ f`, `σ ∈ SL(2, ℤ)` and `g = f ∘ σ` with multiplier
`ζ_σ = e(κ_σ)`, `κ_σ ∈ [0, 1)`, define the **modes**
`g_ν(y) := w_σ⁻¹ ∫₀^{w_σ} g(x + iy) e(-νx/w_σ) dx` for `ν ∈ κ_σ + ℤ`, prove the expansion
`g(x + iy) = Σ_{ν ∈ κ_σ + ℤ} g_ν(y) e(νx/w_σ)` (uniformly on compact sets, from smoothness and
periodicity), and prove the **mode equation** `-y² g_ν'' + (2πν/w_σ)² y² g_ν = λ g_ν`. For `ν ≠ 0` the
substitution `g_ν(y) = √y h(2π|ν|y/w_σ)` turns it into the Bessel equation of order `ir`, so by
2.1 (vi) `g_ν(y) = α √y K_{ir}(2π|ν|y/w_σ) + β √y I_{ir}(2π|ν|y/w_σ)`; for `ν = 0` (regular cusps
only) `g_0(y) = α y^s + β y^{1-s}` when `s ≠ 1/2` and `α √y + β √y log y` when `s = 1/2`.
Rests on: 0.4, 2.1; Mathlib's Fourier series on a circle.

### 2.3 The Fourier–Whittaker expansion and the coefficients

For `f ∈ M(N, χ, λ)`, prove `β = 0` in every nonzero mode of 2.2 at every cusp: a mode with
`β ≠ 0` grows like `e^{2π|ν|y/w_σ}` while square-integrability on the cusp region
`{0 ≤ x < w_σ, y > Y}` with `dμ` forces `∫_Y^∞ |g_ν(y)|² y⁻² dy < ∞` by Parseval. Define
`fourierCoefficient f n := α_n` at the cusp `∞` for `n ∈ ℤ ∖ {0}`, so that
`f(z) = 2√y Σ_{n ≠ 0} a_f(n) K_{ir}(2π|n|y) e(nx) + (constant term)`, with the sum absolutely and
locally uniformly convergent together with its derivatives, and more generally
`fourierCoefficientAt σ f ν` at every cusp with the width in the exponential. Prove the **limit
characterization** `a_f(n) = lim_{y → ∞} √|n| e^{2π|n|y} f_n(y)` from the asymptotic of `K_ν`
(`2√y K_{ir}(2π|n|y) ~ |n|^{-1/2} e^{-2π|n|y}`); this is the form `Suggested.lean` uses, since it
mentions no Bessel function. Prove the comparison with §4.5: at `N = 1`, trivial `χ`,
`fourierCoefficient` here is §4.5's `fourierCoefficient`, and the expansion is its `fourierExpansion`.
Prove `a_{ιf}(n) = a_f(-n)` and `a_{f ∘ (d ·)}(n) = a_f(n/d)` (zero unless `d ∣ n`).
Rests on: 2.1, 2.2, 1.1.

### 2.4 Growth, decay and the trivial bound

For `f ∈ S(N, χ, λ)`: at every cusp the expansion has no zero mode, so `f(σ(x + iy)) = O(e^{-2πy/w_σ})`
uniformly in `x` as `y → ∞`; `f` is bounded on `ℍ`; `f ∈ L^p(Γ₀(N)\ℍ)` for every `p`; and the
**trivial bound** `|a_f(n)| ≤ C_f √|n|`, from `|f_n(y)| ≤ sup |f|` at `y = 1/|n|`, hence
`|λ_f(n)| ≤ C √n` for a normalized eigenform. For `f ∈ M(N, χ, λ)` not cuspidal, the constant term
at a regular cusp is `αy^s + βy^{1-s}`: when `λ ≥ 1/4` both exponents have real part `1/2` and
`∫^∞ |g_0|² y^{-2} dy < ∞` holds for every `α, β`; when `λ < 1/4`, `s ∈ (1/2, 1)` and
square-integrability forces `α = 0`. Prove that the
Fourier expansion determines `f` (two forms with the same coefficients at `∞` and the same constant
term are equal), and that `f ↦ (a_f(n))_{n ≠ 0}` is injective on `S(N, χ, λ)`.
Rests on: 2.3, 0.5.

### 2.5 The eigenvalue is real and nonnegative; cusp forms have `λ > 0`

Prove that a nonzero Maass form has `λ ∈ ℝ` and `λ ≥ 0`: by Green's formula on a fundamental
domain with the cusps truncated at height `Y`, `λ ‖f‖² = ∫_F |∇f|² dx dy + (boundary terms)`, and the
boundary terms vanish as `Y → ∞` because `f` is square-integrable with the constant term at each cusp
a combination of `y^s` and `y^{1-s}` (2.4) and the nonzero modes decay. Prove `λ = 0` only for
locally constant, hence constant, `f`, which is not cuspidal; so a nonzero Maass cusp form has
`λ > 0`. This is §4.5's zero-eigenvalue exclusion at level `N` with character.
Rests on: 1.1, 2.4.

## Layer 3: the self-adjoint Laplacian and the cuspidal spectrum

### 3.1 The diamond action reduces the Laplacian of `Γ₁(N)`

Let `Δ_{Γ₁(N)}` be the self-adjoint Laplacian of CongruenceSpectralGap §0.2 on
`L²(X_{Γ₁(N)}, μ_{Γ₁(N)})`. Prove that every diamond operator `⟨d⟩` of 0.5 maps the domain of
`Δ_{Γ₁(N)}` onto itself and commutes with it: by §0.2's maximal-domain characterization, `f` lies in
the domain exactly when the distributional `-y²(∂ₓ² + ∂ᵧ²)` of its `Γ₁(N)`-invariant lift is the lift
of an `L²` class, and composing with `γ ∈ Γ₀(N)` preserves that condition and commutes with the
expression by 0.2. Hence the projection onto `L²(N, χ)` commutes with `Δ_{Γ₁(N)}`, and `L²(N, χ)` is
a reducing subspace for every `χ`.
Rests on: 0.2, 0.5; CongruenceSpectralGap §0.2.

### 3.2 The restricted Laplacian `Δ_{N,χ}`

Define `Δ_{N,χ}` as the restriction of `Δ_{Γ₁(N)}` to the reducing subspace `L²(N, χ)` of 3.1. Prove
that it is self-adjoint, hence closed (`IsSelfAdjoint.isClosed`) and densely defined
(`IsSelfAdjoint.dense_domain`), and nonnegative (`0 ≤ Re ⟨Δ_{N,χ} f, f⟩`); that its domain is
`{f ∈ L²(N, χ) : Δf ∈ L² in the distributional sense}`; that its kernel is the constants when
`χ = 1` and `0` otherwise (a constant `c` with `c = χ(d) c` for every `d` vanishes unless `χ = 1`);
and that at trivial `χ` the pullback of 0.5 carries §0.2's `Δ_{Γ₀(N)}` onto `Δ_{N,1}`, both having
the maximal domain, so that `Δ_{N,1}` is AutomorphicSpectralTheory §1.16a's
`modular_laplacian_realization` by §0.2's agreement and nothing proved there is reproved here.
Rests on: 3.1, 0.5; CongruenceSpectralGap §0.2; Mathlib's `LinearPMap`.

### 3.3 Eigenvectors are Maass forms

Prove that an `L²`-eigenvector `f` of `Δ_{N,χ}` with eigenvalue `λ` has a `C^∞` representative
(elliptic regularity: `Δf = λf` weakly implies smoothness), which is then an element of
`M(N, χ, λ)` in the sense of 1.1; conversely every `f ∈ M(N, χ, λ)` lies in the domain with
`Δ_{N,χ} f = λ f`. So the point spectrum of `Δ_{N,χ}` with its eigenspaces is exactly
`{λ : M(N, χ, λ) ≠ 0}` with the spaces `M(N, χ, λ)`, and the eigenvalues are real and nonnegative
(this reproves 2.5 for the `L²` eigenvectors).
Rests on: 3.2, 1.1; PDE Lane E.

### 3.4 The cuspidal subspace and its compact resolvent

Define `L²_cusp(N, χ) ≤ L²(N, χ)` as the closed subspace of `f` whose cusp integrals `I_σ(f, y)`
vanish for almost every `y` and every `σ` (the `L²` version of `IsCuspidal`). Every cusp of `Γ(N)`
has width `N`, so `I_σ(f, y)` is `N` times the constant term of `f` at the cusp `σ∞` of `Γ(N)`, and
under the pullback along `X_{Γ(N)} → X_{Γ₁(N)}` the space `L²_cusp(N, χ)` is the intersection of
`L²(N, χ)` with the cuspidal subspace of CongruenceSpectralGap §0.5b at `Γ(N)`. Prove that it
reduces `Δ_{N,χ}` and that the restriction `Δ^{cusp}_{N,χ}` has **compact resolvent**, consumed from
§0.5b at `Γ(N) ≤ Γ₁(N)`: the pulled-back `L²(X_{Γ₁(N)}, μ_{Γ₁(N)})` is the closed subspace of
`Γ₁(N)/Γ(N)`-invariants, which reduces `Δ_{Γ(N)}` with restriction `Δ_{Γ₁(N)}` (both have §0.2's
maximal domain); `Γ₀(N)` permutes the cusps of `Γ(N)`, so the projections onto `L²(N, χ)` and
onto the cuspidal subspace commute; and a closed reducing subspace of an operator with compact
resolvent carries a restriction with compact resolvent. Conclude: the spectrum of
`Δ^{cusp}_{N,χ}` is a discrete set `0 < λ₁ ≤ λ₂ ≤ … → ∞` of eigenvalues of finite multiplicity,
`S(N, χ, λ)` is
finite-dimensional for every `λ`, `{λ ≤ T : S(N, χ, λ) ≠ 0}` is finite for every `T`, and
`L²_cusp(N, χ)` has an orthonormal basis of Maass cusp forms, packaged as a `HilbertBasis` with its
element-level `coe_*` (the B2 pattern of the orthogonal-bases roadmap). The multiplicity
`dim S(N, χ, λ)` is the LMFDB knowl `mf.maass.mwf.dimension`. Restricting §0.6 at `Γ₁(N)` to
`L²(N, χ)`, every spectral value of `Δ_{N,χ}` in `(0, 1/4)` is an eigenvalue of
`Δ^{cusp}_{N,χ}`. Define `λ₁(N, χ) := min {λ : S(N, χ, λ) ≠ 0}` (the
minimum exists by discreteness, when the set is nonempty) and `cuspCount N χ T := Σ_{λ ≤ T} dim S(N, χ, λ)`,
a finite sum by discreteness.
Rests on: 3.2, 3.3, 2.3, 0.4; CongruenceSpectralGap §§0.2, 0.5b, 0.6; SelfAdjointSpectralTheory
Part E (spectral measure, compact resolvent gives discrete spectrum); OrthogonalL2Bases B2.

### 3.5 Orthogonality and the residual spectrum, stated as a boundary

Prove that Maass cusp forms with distinct eigenvalues are Petersson-orthogonal, that `S(N, χ, λ)` is
orthogonal to the constants, and that the orthogonal complement of `L²_cusp(N, χ)` in `L²(N, χ)` is
the closure of the span of incomplete Eisenstein series (the functions `Σ_{γ ∈ Γ_σ\Γ} ψ(im σ⁻¹γz)`,
`ψ ∈ C_c^∞(0, ∞)`), which is the statement AutomorphicSpectralTheory §4.8 decomposes further. No
property of Eisenstein series beyond their membership in that complement is proved here.
Rests on: 3.4; AutomorphicSpectralTheory §4.8 for the cited decomposition.

## Layer 4: Hecke operators, the reflection, Atkin–Lehner involutions and newforms

### 4.1 Hecke operators at level `N` with character

Define `heckeOperator N χ n f` by the pinned formula for `n ≥ 1`, with the coset representatives
`[a, b; 0, d]`, `ad = n`, `(a, N) = 1`, `0 ≤ b < d` consumed from the `Γ₀(N)` Hecke-ring coset
decomposition. Prove: `Tₙ` maps `A(N, χ)` to itself, commutes with `Δ` (0.2), preserves
smoothness, square-integrability and cuspidality, hence maps `S(N, χ, λ)` to itself and
`M(N, χ, λ)` to itself; the **coefficient formula** `a_{Tₙ f}(m) = Σ_{d ∣ (m, n)} χ(d) a_f(mn/d²)` for
`m ≠ 0` (with `d` ranging over positive divisors of `gcd(|m|, n)`); `T₁ = 1`; the
**multiplicativity** `TₘTₙ = Σ_{d ∣ (m,n)} χ(d) T_{mn/d²}` on `A(N, χ)`, in particular
`TₘTₙ = Tₘₙ` for coprime `m, n` and `T_{p^{r+1}} = T_p T_{p^r} - χ(p) T_{p^{r-1}}` for `p ∤ N`; the
alias `Uₚ := Tₚ` for `p ∣ N` with `T_{p^r} = Tₚ^r` and `a_{Uₚ f}(m) = a_f(pm)`. Prove the comparison:
at `N = 1`, `Tₙ` is §4.5's `maassHecke(n)`, and the coefficient formula is `maassHeckeRecurrence`.
Rests on: 0.3, 2.3; Tau Ceti's `HeckeRing.GL2.Gamma0`.

### 4.2 Adjoints and simultaneous diagonalization

Prove `⟨Tₙ f, g⟩ = χ(n)⟨f, Tₙ g⟩` for `(n, N) = 1` on square-integrable automorphic functions (the
adjoint of `Tₙ` is `χ̄(n) Tₙ`), so that `Tₙ` is normal and `Tₙ` is self-adjoint for trivial `χ`;
prove `TₘTₙ = TₙTₘ` for all `m, n`.
On the finite-dimensional space `S(N, χ, λ)` (3.4), the good operators `{Tₙ : (n, N) = 1}` are a
commuting family of normal operators and therefore simultaneously diagonalizable: write each as
`A + iB` with `A, B` symmetric and commuting across the family and apply Mathlib's
`LinearMap.IsSymmetric.iSup_iInf_eq_top_of_commute`. Conclude that `S(N, χ, λ)` has an orthonormal
basis of forms which are eigenvectors of every good `Tₙ` (**good Hecke eigenforms**, the
modular-forms roadmap's `IsEigenformAwayFromLevel`), and that for such an `f` with `a_f(1) ≠ 0`,
`Tₙ f = λ_f(n) f` with `λ_f(n) = a_f(n)/a_f(1)` for `(n, N) = 1`, and `conj λ_f(n) = χ̄(n) λ_f(n)`
(the eigenvalue of the adjoint).
Rests on: 4.1, 3.4, 0.5; Mathlib's joint eigenspaces.

### 4.3 The reflection and the symmetry

Define `reflection f z := f(-z̄)`. Prove `ι` maps `A(N, χ)` to itself (conjugation by
`diag(-1, 1)` preserves `Γ₀(N)` and the lower-right entry), commutes with `Δ` (0.2), with every
`Tₙ`, with `W_N`, preserves cuspidality and the Petersson product, and `ι² = 1`. Define
`IsEven f := ιf = f`, `IsOdd f := ιf = -f`, `parity f ∈ {0, 1}`, and prove `a_{ιf}(n) = a_f(-n)`
(2.3), so even forms have `a(-n) = a(n)` and odd forms `a(-n) = -a(n)`, and an odd form vanishes on
the imaginary axis. Prove that `S(N, χ, λ)` splits as the orthogonal sum of its even and odd parts,
each stable under all `Tₙ`, so the good Hecke eigenforms of 4.2 can be chosen with a parity; and
that `ι` preserves every joint eigenspace of the good `Tₙ` in `S(N, χ, λ)`, so a one-dimensional
joint eigenspace consists of forms of a single parity. This is the LMFDB's `symmetry`.
Rests on: 4.1, 4.2, 2.3.

### 4.4 Atkin–Lehner and Fricke involutions at weight `0`

For `Q ‖ N` define `atkinLehner N Q f := f ∘ W_Q` with `W_Q = [Qa, b; Nc, Qd]`, `det = Q`, and
`frickeOperator N f := f ∘ W_N`, `W_N = [0, -1; N, 0]` (Tau Ceti's `frickeGL ℝ N`). Prove on `A(N, χ)` with `χ` **trivial**: `W_Q` is
well defined (independent of the matrix), maps `A(N, 1)` to itself, commutes with `Δ`, with `ι`
and with `Tₙ` for `(n, Q) = 1`, preserves cuspidality, is an isometry for the Petersson product,
and `W_Q² = 1`; `W_Q W_R = W_{QR/gcd(Q,R)²}`; `W_N = ∏_{p ∣ N} W_{p^{v_p(N)}}`. For general `χ`
prove `W_N : A(N, χ) → A(N, χ̄)` with `W_N² = 1` (the matrix `W_N² = -N·I` acts trivially) and
`W_N Tₙ = χ(n) Tₙ W_N` for `(n, N) = 1`, the `Tₙ` on the right acting on `A(N, χ̄)` (conjugation by
`W_N` carries the coset representative with upper-left entry `a` to one with upper-left entry `d`,
and `χ(a) = χ(n) χ̄(d)` since `ad ≡ n (mod N)`), and that `W_Q` sends `A(N, χ_Q χ')` to
`A(N, χ̄_Q χ')` (the `Q`-part conjugated), matching the modular-forms roadmap's Layer 6. Prove the
special case `(W_N f)(iy) = f(i/(Ny))` that Layer 6 uses.
Rests on: 0.3, 4.1, 4.3; Tau Ceti's Fricke matrix and `AtkinLehnerBar`.

### 4.5 Oldforms and newforms

For `M ∣ N`, `χ' mod M` with `changeLevel χ' = χ`, and `d ∣ N/M`, define the **level-raising**
`B_d f := f(d ·)`, prove it maps `S(M, χ', λ)` into `S(N, χ, λ)` with `a_{B_d f}(n) = a_f(n/d)` and
`⟨B_d f, B_d g⟩_N = [Γ₀(M) : Γ₀(N)] ⟨f, g⟩_M` (the dilation preserves `dμ` and carries a fundamental
domain of `Γ₀(N)` to one of `d Γ₀(N) d⁻¹ ≤ Γ₀(M)`, a subgroup of the same index; this is where an
unnormalized Petersson product shows its convention).
Define the **oldspace** `S^{old}(N, χ, λ) := Σ_{M ∣ N, M ≠ N, χ' , d ∣ N/M} B_d S(M, χ', λ)` and the
**newspace** `S^{new}(N, χ, λ)` as its Petersson-orthogonal complement in `S(N, χ, λ)`. Prove that
the good `Tₙ`, `ι` and (for trivial `χ`) every `W_Q` preserve the oldspace and the newspace, and that
the oldspace is spanned by the `B_d f` with `f` a newform of some level `M ∣ N`, `M < N` (by induction
on `N`). Define a **newform**: `f ∈ S^{new}(N, χ, λ)` with `a_f(1) = 1` and `f` a good Hecke
eigenform (4.2); `newforms N χ λ` is the set of them.
Rests on: 4.1–4.4, 3.4.

### 4.6 Strong multiplicity one and the full eigenform theorem

Prove the **Atkin–Lehner–Li theorem for Maass forms**: (i) a newform is an eigenvector of **every**
`Tₙ`, `n ≥ 1`, with `Tₙ f = λ_f(n) f` and `λ_f(n) = a_f(n)`, so `λ_f` is multiplicative with
`λ_f(m)λ_f(n) = Σ_{d ∣ (m,n)} χ(d) λ_f(mn/d²)`; (ii) **strong multiplicity one**: two forms
`f ∈ S(N, χ, λ)`, `g ∈ S(N', χ'', λ)` which are good Hecke eigenforms with `λ_f(p) = λ_g(p)` for all
but finitely many primes `p` have `f ∈ S^{old}` or `g ∈ S^{old}` unless `N = N'`, `χ = χ''` and
`f, g` are proportional; in particular distinct newforms of the same `(N, χ, λ)` have different
eigenvalue systems, and the newforms of `(N, χ, λ)` are an orthogonal basis of `S^{new}(N, χ, λ)`;
(iii) **multiplicity one in the newspace**: the joint eigenspace of the good `Tₙ` in
`S^{new}(N, χ, λ)` for a given eigenvalue system is at most one-dimensional, so by 4.3 every
newform is even or odd. The proof is the
weight-`0` transcription of the holomorphic argument (the Main Lemma: a form whose coefficients
`a_f(n)` vanish for `(n, N) = 1` is old; the rescaling dichotomy), with the role of the
`q`-expansion played by 2.4's injectivity of `f ↦ (a_f(n))`. Prove **(iv) the bad-prime values**
for trivial `χ`: for `p ‖ N`, `λ_f(p) = -η_p(f) p^{-1/2}` with `η_p(f) ∈ {±1}` the
`W_{p}`-eigenvalue, so `λ_f(p)² = 1/p` and `λ_f(p^k) = λ_f(p)^k`; for `p² ∣ N`, `λ_f(p) = 0`; and
for general `χ` the trichotomy: with `N = p^α N'`, `χ = χ_p χ'`, if `χ_p` is primitive modulo
`p^α` then `|λ_f(p)| = 1`; if `α = 1` and `χ_p` is trivial then `λ_f(p)² = χ'(p)/p`; if `α ≥ 2` and
`χ_p` is imprimitive then `λ_f(p) = 0`. Prove **(v) the Fricke sign**: for trivial `χ` a newform
satisfies `W_N f = ε_N(f) f` with `ε_N(f) = frickeSign N f = ∏_{p ∣ N} η_p(f) ∈ {±1}`, where `W_{p^{v_p(N)}} f = η_p(f) f`;
for general `χ`, `W_N f = c · f̄_ρ` with `f̄_ρ` the newform of `(N, χ̄, λ)` with conjugate coefficients
and `|c| = 1` (the pseudo-eigenvalue). Record the dictionary with the LMFDB: for a squarefree level
with trivial character every `λ_f(n)` is real, `f` is real-valued up to a scalar, and the stored
`a_p = ±p^{-1/2}` for `p ∣ N` has sign `-η_p(f)`.
Rests on: 4.1–4.5, 2.4; Atkin–Lehner 1970 and Atkin–Li 1978 for the shape of the argument.

### 4.7 Self-duality and the conjugate form

Define `conjugateForm f := conj ∘ f`, prove it lies in `S(N, χ̄, λ)` with
`a_{conj ∘ f}(n) = conj(a_f(-n))`, so that `f̄_ρ := conj ∘ ιf` has coefficients `conj(a_f(n))`, is a
newform when `f` is, and `IsSelfDual f := ∀ n, im(λ_f(n)) = 0` (the
modular-forms roadmap's predicate) holds for every newform with trivial character.
Rests on: 4.3, 4.6.

## Layer 5: Selberg's `3/16`, the eigenvalue conjecture and Weyl's law

### 5.3 Selberg's theorem: `λ ≥ 3/16` at level `N` with character

Prove `selberg_three_sixteenths`: every `λ` with `S(N, χ, λ) ≠ 0` satisfies `λ ≥ 3/16`; equivalently
every exceptional parameter satisfies `t ≤ 1/4`, equivalently `s_f ≤ 3/4`. It is a corollary of
CongruenceSpectralGap §5.3's `congruence_eigenvalue_bound` at `Γ = Γ₁(N)`
(`CongruenceSubgroup.Gamma1_is_congruence`): a nonzero `f ∈ S(N, χ, λ)` is `Γ₁(N)`-invariant
(`χ(d_γ) = χ(1) = 1` for `γ ∈ Γ₁(N)`), `C^∞` with `hyperbolicLaplacian f = λ f` (1.1), bounded on
`ℍ` (2.4), and not constant (a constant `c` has cusp integral `I_1(c, y) = N c`, so a cuspidal
constant is `0`; 0.4); hence `λ ≥ 21/100 = 84/400 > 75/400 = 3/16`. The statement `3/16` is
Selberg's (Selberg 1965). Record the corollary for the LMFDB's exceptional-eigenvalue encoding: an
exceptional spectral parameter `t = -iR` lies in `(0, 1/4]`, and in fact in `(0, 1/5]` since
`1/4 - t² ≥ 21/100`.
Rests on: 0.4, 1.1, 2.4; CongruenceSpectralGap §5.3; Mathlib's `Gamma1_is_congruence`.

### 5.4 Selberg's eigenvalue conjecture and the level-one theorem

Define `SelbergEigenvalueConjecture N χ : Prop := ∀ λ, S(N, χ, λ) ≠ 0 → 1/4 ≤ λ`, and
`HasExceptionalEigenvalue N χ := ¬ SelbergEigenvalueConjecture N χ`. Prove the **level-one
theorem**: for `f ∈ S(1, 1, λ)` nonzero, `λ ≥ 3π²/2`; hence `SelbergEigenvalueConjecture 1 1`.
Proof (Roelcke's bound, as in Iwaniec, *Spectral Methods*, Chapter 11): with `F` the standard
fundamental domain and `S := {|x| ≤ 1/2, y ≥ √3/2}`, one has `F ⊆ S ⊆ F ∪ S·F` (the part of `S`
below the unit circle lies in the image of `F` under `z ↦ -1/z`, since `|z ± 1| ≥ 1` there), so
`∫_S |f|² dμ ≤ 2‖f‖²` and `∫_S |∇f|² dx dy ≤ 2 ∫_F |∇f|² dx dy = 2λ‖f‖²`; on `S` the strip is a full
period for every `y`, so Parseval and the absence of a zero mode give
`∫_S |∂ₓ f|² dx dy ≥ 4π² ∫_S |f|² dx dy = 4π² ∫_S y² |f|² dμ ≥ 3π² ∫_S |f|² dμ ≥ 3π² ‖f‖²`; combining,
`2λ‖f‖² ≥ 3π²‖f‖²`. Prove also the converse direction of the dictionary: `λ > 1/4` for all cusp
forms at level one means every level-one spectral parameter is real, which is the hypothesis under
which §4.5's `NormalizedMaassEigenform(r, δ)` with real `r` exhausts the level-one Hecke eigenforms.
Rests on: 1.1, 2.3, 2.4, 0.5; Mathlib's standard fundamental domain `ModularGroup.fd`.

### 5.5 The scattering matrix of `Γ₀(N)` and Weyl's law

Define, for each pair of cusps `𝔞, 𝔟` of `Γ₀(N)` and `χ`, the **scattering coefficient**
`φ_{𝔞𝔟}(s; χ)` as the coefficient of `y^{1-s}` in the constant term at `𝔟` of the Eisenstein series
`E_𝔞(z, s; χ)` of AutomorphicSpectralTheory (its §1.23 `E_N(z, s)` at `∞` and its level-`N` clause of
§4.8 at the other cusps), and the **scattering matrix** `Φ(s; χ) = (φ_{𝔞𝔟})`. Prove the explicit
formula for trivial `χ` and squarefree `N` (Huxley 1984; Iwaniec, *Spectral Methods*, the chapter on
Eisenstein series for `Γ₀(N)`): each entry is a finite Dirichlet-series factor in `N` times
`√π Γ(s - 1/2) ζ(2s - 1) / (Γ(s) ζ(2s))`, and for general `N` and `χ` a finite combination of ratios
`L(2s - 1, ψ)/L(2s, ψ)` of Dirichlet `L`-functions; prove `det Φ(s; χ)` is meromorphic with
`|det Φ(1/2 + it)| = 1` and the bound `-(φ'/φ)(1/2 + it) = O(log(|t| + 2))` for `φ := det Φ`,
from Stirling and `(L'/L)(1 + 2it, ψ) = O(log(|t| + 2))`. Then prove **Weyl's law for the cuspidal
spectrum**: `cuspCount N χ (1/4 + T²) + M(T) = (vol/(4π)) T² + O(T log T)` with
`M(T) := (1/(4π)) ∫_{-T}^{T} -(φ'/φ)(1/2 + it; χ) dt = O(T log T)`, hence
`cuspCount N χ X ∼ (vol(Γ₀(N)\ℍ)/(4π)) X = ([SL₂(ℤ) : Γ₀(N)]/12) X` as `X → ∞`; at `N = 1` this is
`X/12`, AutomorphicSpectralTheory §4.9's `modular_weyl_estimates`, which is consumed there and
reproved here only as the `N = 1` instance of the general argument. The proof is the Selberg trace
formula for `(Γ₀(N), χ)` with a heat-kernel or Gaussian test function (the trace formula is
consumed from AutomorphicSpectralTheory Layer 6; the geometric side's hyperbolic and elliptic terms
are `O(T)`, the parabolic terms are `O(T log T)`), with the continuous-spectrum term the integral
of the logarithmic derivative of `det Φ`. Record the constants: `vol = π/3, π, 2π, 4π, 14π` for
`N = 1, 2, 4, 6, 26`.
Rests on: 3.4; AutomorphicSpectralTheory §§1.23, 4.8, Layer 6; Mathlib's Dirichlet `L`-functions;
Huxley 1984.

## Layer 6: the `L`-function of a Hecke–Maass newform

### 6.1 The Dirichlet series and the Euler product

For a newform `f` of `(N, χ, λ)` define `lfunction f s := LSeries (n ↦ λ_f(n)) s` (Mathlib's
`LSeries`, which ignores `n = 0`). Prove absolute convergence for `Re s > 3/2` from the trivial
bound (2.4), the **Euler product**
`L(s, f) = ∏_p (1 - λ_f(p) p^{-s} + χ(p) p^{-2s})^{-1}` on `Re s > 3/2` from the multiplicativity of
4.6 (i), and the bad-prime factors from 4.6 (iv): for trivial `χ` and `p ‖ N` the factor is
`(1 + η_p(f) p^{-1/2 - s})^{-1}`, and for `p² ∣ N` it is `1`.
Rests on: 4.6, 2.4; Mathlib's `LSeries` and Euler products.

### 6.2 The completed `L`-function, its continuation and functional equation

Define the gamma factor `γ(s) := Γ_ℝ(s + δ + ir) Γ_ℝ(s + δ - ir)` with `δ` the parity (4.3) and
`r` the spectral parameter (for an exceptional eigenvalue, `ir = -t` real, and the same formula),
and `completedLFunction f : ℂ → ℂ` as the function characterized on `Re s > 3/2` by
`Λ(s, f) = N^{s/2} γ(s) L(s, f)`. Prove, for an even newform, the **Mellin representation**
`Λ(s, f) = N^{1/4} a_f(1)⁻¹ ∫₀^∞ f(iy/√N) y^{s - 1/2} dy/y` (with the factor-two convention
`f(iy) = 4√y Σ_{n ≥ 1} a_f(n) K_{ir}(2πny)`, and 2.1 (v) giving
`∫₀^∞ f(iy) y^{s-1/2} dy/y = a_f(1) Γ_ℝ(s + ir) Γ_ℝ(s - ir) L(s, f)` exactly, the constants
`4 · 2^{s-2} (2π)^{-s} = π^{-s}` cancelling), and for an odd newform
`Λ(s, f) = N^{-1/4} (2πi a_f(1))⁻¹ ∫₀^∞ (∂ₓ f)(iy/√N) y^{s + 1/2} dy/y` (the substitution
`y ↦ y/√N` in `y^{s+1/2}` costs `N^{-s/2 - 1/4}` against the `N^{s/2}`) with `δ = 1` in the gamma factor; conclude that `Λ(·, f)` is
**entire** (from the exponential decay of 2.4 at `∞` and at `0 = W_N ∞`) and satisfies, for trivial
`χ`, `Λ(s, f) = ε_N(f) (-1)^δ Λ(1 - s, f)` by the Fricke relation 4.6 (v) under `y ↦ 1/y` (`f(i/(√N y)) = (W_N f)(iy/√N)`; the derivative of
`-1/(Nz)` contributes the `(-1)^δ`), and
for general `χ` the two-form equation `Λ(s, f) = (-1)^δ Λ(1 - s, W_N f)` with `W_N f = c f̄_ρ`
(4.6 (v)), so that `Λ(s, f) = c (-1)^δ Λ(1 - s, f̄_ρ)` with `|c| = 1`. Prove that `L(s, f)` has an
entire continuation `lfunctionContinuation f` agreeing with `LSeries` on `Re s > 3/2`, and that
`Λ(·, f)` vanishes nowhere on `Re s > 3/2` (the Euler product with the trivial bound), so by the
functional equation every zero of `Λ(·, f)` lies in `-1/2 ≤ Re s ≤ 3/2`.
Rests on: 6.1, 2.1 (v), 2.4, 4.3, 4.6; Mathlib's `mellin` and `WeakFEPair`.

### 6.3 Named hypotheses: Ramanujan–Petersson and the convexity bound

Define `RamanujanPetersson N f : Prop := ∀ p, p ∤ N → |λ_f(p)| ≤ 2` and prove the implications that
hold: `RamanujanPetersson N f → ∀ n, |λ_f(n)| ≤ τ(n)` (from multiplicativity), hence absolute
convergence of `L(s, f)` for `Re s > 1`; and that `RamanujanPetersson N f` is equivalent to the Satake
parameters `α_p, β_p` (the roots of `X² - λ_f(p) X + χ(p)`) having modulus `1` for every good `p`
(this uses `conj λ_f(p) = χ̄(p) λ_f(p)` from 4.2, which makes `χ(p)^{-1/2} λ_f(p)` real; the bound
`|λ_f(p)| ≤ 2` alone does not force unit-modulus roots when `χ(p) ≠ 1`).
The only unconditional bound stated is 2.4's `|λ_f(p)| ≤ C_f p^{1/2}`, with a constant depending on
`f`; no bound with an absolute constant is a target (that is the Kim–Sarnak theorem, not owned
here). Define the **analytic conductor** `𝔮(f, s) := N · (|s + δ + ir| + 3)(|s + δ - ir| + 3)` and
`𝔮(f) := 𝔮(f, 1/2)`, the Iwaniec–Kowalski (5.7) normalization that the modular-forms roadmap's
Layer 7 also pins.
Rests on: 6.1, 6.2, 4.6.

### 6.4 The card in the completed-`L`-function data model

Produce, for a newform `f` of `(N, χ, λ)`, an `AnalyticLFunctionData` of the L-functions roadmap's
Layer 0: coefficients `λ_f(n)` (norm-indexed over `ℚ`, so by `n`), conductor `N`, real gamma shifts
the multiset `{δ + ir, δ - ir}`, no complex shifts, root number `ε_N(f)(-1)^δ` for trivial `χ` and
the unit `c (-1)^δ` of 6.2 in general, completed function `Λ(·, f)`, empty polar divisor; prove its
degree is `2`, that it satisfies *Dirichlet-series agreement* on `Re s > 3/2` (and on `Re s > 1`
under `RamanujanPetersson N f`), *meromorphic continuation with no poles*, the *functional equation
against the dual card* (whose coefficients are `conj λ_f(n) = λ_{f̄_ρ}(n)`, 4.7), and *average
coefficient growth*; prove the card of `f̄_ρ` is the dual card, and that for trivial `χ` the card is
self-dual. Nothing about the card is defined twice: the data model, its predicates and its dual are
that roadmap's.
Rests on: 6.1–6.3, 4.7; the L-functions roadmap, Layer 0.

## Layer 7: Maass forms on `PSL₂(ℤ[i])\H³`

### 7.1 The Laplacian on `H³`

On the Kleinian-groups carrier `H³` define
`laplacianH3 f P := -(height P)² · Δ_{ℝ³}(f ∘ coe)(P) + (height P) · ∂_y f(P)`, with `Δ_{ℝ³}`
Mathlib's Laplacian on `EuclideanSpace ℝ (Fin 3)` and `∂_y` the partial derivative in the third
coordinate, so that `Δ₃ f = -y²(∂²_{x₁} + ∂²_{x₂} + ∂²_y) f + y ∂_y f`. Prove the
sign check `Δ₃ y^s = s(2 - s) y^s`, invariance under the `PSL(2, ℂ)` action (`smul_def` of that
roadmap's Layer 0: translations, dilations and the inversion generate), symmetry on compactly
supported functions with respect to `volume` (density `y⁻³`), and the Dirichlet-integral formula
`∫ (Δ₃ f) ḡ dvol = ∫ y⁻¹ ⟨∇f, ∇ḡ⟩_{ℝ³} dx₁ dx₂ dy` for compactly supported `f, g`.
Rests on: KleinianGroups Layer 0; Mathlib's Laplacian.

### 7.2 The carrier for the Picard group

With `Γ := bianchi ℚ(i) ι = PSL₂(ℤ[i])` (the Kleinian-groups roadmap's Layer 3, Gaussian
embedding), define `IsMaassFormH3 λ f` (`C^∞`, `Γ`-invariant, square-integrable on a fundamental
domain, `Δ₃ f = λ f`) and `IsMaassCuspFormH3 λ f` (additionally `∫_{ℂ/ℤ[i]} f(x + yj) dx = 0` for all
`y > 0` at the single cusp `∞`), and the submodules `M₃(λ)`, `S₃(λ)`. Prove the group has exactly one
cusp orbit (the class number of `ℤ[i]` is one: every element of `P¹(ℚ(i))` is `γ∞`), that the
stabilizer of `∞` in `Γ` is generated by the translations `x ↦ x + 1`, `x ↦ x + i` and the rotation
`x ↦ -x` (`diag(i, -i)`), that `λ ∈ ℝ`, `λ ≥ 0`, and `λ > 0` for cusp forms (the argument of 2.5 on
`H³`), and that `λ = 1 + r²` with `spectralParameterH3 λ := √(λ - 1)` (knowl
`mf.maass.picard.eigenvalue`). Define the self-adjoint realization of `Δ₃` on `L²(Γ\H³)` and prove
self-adjointness, the cuspidal reducing subspace and its compact resolvent, by the route of
CongruenceSpectralGap §0.2 (Friedrichs closure of the energy on compactly supported smooth
functions, essential self-adjointness by cutoffs) and §0.5b (the cusp Fourier tail estimate and
local Rellich compactness) transcribed to `H³` (the cusp region is `{x ∈ ℂ/ℤ[i], y > Y}` with volume
`∫_Y^∞ y^{-3} dy < ∞`), hence the discreteness and finite multiplicity of the cuspidal spectrum.
Rests on: 7.1; KleinianGroups Layers 1 and 3 (`covolume_bianchiGaussian`); SelfAdjointSpectralTheory
Parts C–E; PDE Lane E; Tau Ceti's `RellichKondrachov`; CongruenceSpectralGap §§0.2 and 0.5b as the
template.

### 7.3 The Fourier–Bessel expansion

For `f ∈ M₃(λ)` prove the expansion
`f(x + yj) = (constant term) + Σ_{0 ≠ n ∈ ℤ[i]} a_f(n) y K_{ir}(2π|n|y) e(Re(n x))`: the modes
`f_n(y) = ∫_{ℂ/ℤ[i]} f(x + yj) e(-Re(n x)) dx` satisfy `-y² f_n'' + y f_n' + 4π²|n|² y² f_n = λ f_n`,
whose solutions are `y K_{ir}(2π|n|y)` and `y I_{ir}(2π|n|y)` (substitute `f_n = y h(2π|n|y)`), and
square-integrability excludes the second; the constant term is `α y^s + β y^{2-s}` (`α y + β y log y`
at `s = 1`). Prove `a_f(-n) = a_f(n)` (the rotation `diag(i, -i) ∈ Γ` acts by `x ↦ -x`), the trivial
bound `|a_f(n)| ≤ C_f |n|`, exponential decay of cusp forms, and injectivity of `f ↦ (a_f(n))` on
`S₃(λ)`. The `K`-Bessel function is §4.5's; the expansion is the knowl `mf.maass.picard.fourierexpansion`
with the pairing `Re(n x)` and no factor two.
Rests on: 7.2, 2.1, 2.2's ODE analysis.

### 7.4 Symmetries and Hecke operators

Define the two commuting involutions on `M₃(λ)`: `R f(x + yj) := f(ix + yj)` (conjugation by
`diag(i, 1) ∈ GL₂(ℤ[i])`, which normalizes `Γ`; `R² = 1` on `Γ`-invariant functions because
`diag(i, 1)² = diag(-1, 1)` acts as `diag(i, -i) ∈ Γ`) and `J f(x + yj) := f(x̄ + yj)` (complex
conjugation, an orientation-reversing isometry normalizing `Γ`). Prove both commute with `Δ₃`,
preserve `S₃(λ)` and the inner product, and act on coefficients by `a_{Rf}(n) = a_f(i⁻¹ n)` and
`a_{Jf}(n) = a_f(n̄)`; so `S₃(λ)` splits into four joint eigenspaces
`(±1, ±1)`, the symmetry classes. For `0 ≠ n ∈ ℤ[i]` define
`T_n f(P) := N(n)^{-1/2} Σ_{ad = n mod units, b mod d} f([a, b; 0, d] · P)`, the matrix acting
through `PSL₂(ℂ)` after division by a square root of `n`, i.e. `x + yj ↦ (ax + b)/d + (|a|/|d|) y j`
(the sum over `(a, d)` up to `(εa, ε⁻¹d)` and `b ∈ ℤ[i]/dℤ[i]`; `ℤ[i]` is Euclidean, so the
matrices `[a, b; 0, d]` are a set of representatives of the left cosets
`Γ \ {α ∈ M₂(ℤ[i]) : det α = n}`, two representatives differing by `diag(ε, ε⁻¹) ∈ Γ` giving the
same coset). Prove `T_n` depends on `n` only up to sign (`T_{-n} = T_n`, since
`x ↦ -x` is in `Γ`), `T_{in} = R T_n R`, that `T_n` preserves `M₃(λ)` and `S₃(λ)`, the coefficient
formula `a_{T_n f}(ν) = Σ_{a ∣ (n, ν) mod units} a_f(ν n/a²)` (well defined by `a_f(-m) = a_f(m)`), the
relations `T_m T_n = Σ_{d ∣ (m, n) mod units} T_{mn/d²}` for `m, n` with `T_m, T_n` both depending
only on the ideals when restricted to the `R`-even subspace, self-adjointness of `T_n` on
`R`-even forms, and simultaneous diagonalization on each finite-dimensional `S₃(λ)^{R = 1}`. On an
`R`-even Hecke eigenform with `a_f(1) = 1` define `λ_f(𝔫) := a_f(n)` for `𝔫 = (n)`, prove
`T_n f = λ_f((n)) f`, multiplicativity over ideals, and `λ_f((n)) λ_f((m)) = Σ_{𝔡 ∣ (m, n)} λ_f((mn)/𝔡²)`.
Rests on: 7.2, 7.3; the Euclidean algorithm in `GaussianInt`.

### 7.5 The `L`-function of a Hecke–Maass form on `PSL₂(ℤ[i])`

For an `R`-even normalized Hecke eigenform `f ∈ S₃(λ)` define `L(s, f) := Σ_{𝔫 ≠ 0} λ_f(𝔫) N𝔫^{-s}`
(as an `LSeries` over the norm, `n ↦ Σ_{N𝔫 = n} λ_f(𝔫)`), prove absolute convergence for
`Re s > 3/2` from the trivial bound (`|a_f(n)| ≤ C_f |n| = C_f N𝔫^{1/2}`), the Euler product over Gaussian primes
`∏_𝔭 (1 - λ_f(𝔭) N𝔭^{-s} + N𝔭^{-2s})^{-1}`, the completed function
`Λ(s, f) := 16^{s/2} Γ_ℂ(s + ir) Γ_ℂ(s - ir) L(s, f)`, `Γ_ℂ(s) = 2(2π)^{-s}Γ(s)`, conductor
`|d_{ℚ(i)}|² = 16`, its entire continuation by the Mellin transform of `f` along the vertical
geodesic `y ↦ yj` and the Mellin transform of `K_{ir}` (2.1 (v)), and a functional equation
`Λ(s, f) = ε Λ(1 - s, f)` with `ε ∈ {±1}` determined by the action of `[0, -1; 1, 0] ∈ Γ` and of `J`;
produce the degree-`4` card in the L-functions roadmap's data model with complex gamma shifts
`{ir, -ir}`.
Rests on: 7.3, 7.4, 2.1 (v); the L-functions roadmap, Layer 0.

## Layer 8: the LMFDB layer

### 8.1 The invariant dictionary

Collect the correspondence between the section's columns and the definitions above, as named
functions of a newform `f` of `(N, χ, λ)`: `level f := N`; `weight f := 0` (the only weight the
section stores; 0.1 gives `k ≠ 0` its meaning); `character f := χ` (its Conrey label is
not a target); `spectral_parameter f := spectralParameter λ` (1.2);
`symmetry f := parity f` (4.3); `fricke_eigenvalue f := ε_N(f)` for trivial `χ` (4.6 (v)), undefined
otherwise (the page shows it only when `conrey_index = 1`); `coefficients f := (λ_f(n))_{n ≥ 1}` with
`λ_f(1) = 1` (4.6 (i)); `self_dual f := IsSelfDual f` (4.7); `cusp_width σ := w_σ` (0.4); the
Laplace eigenvalue `λ = 1/4 + R²` (`mf.maass.mwf.eigenvalue`); the multiplicity `dim S(N, χ, λ)`
(3.4). Prove the two display identities the page code uses for squarefree level and trivial
character: `λ_f(p^k) = (-η_p(f))^k p^{-k/2}` for `p ∣ N` (so `a_4 = 1/2` when `2 ∣ N`), and
`λ_f(n) = λ_f(n') ∏_{p ∣ N} λ_f(p)^{v_p(n)}` with `n'` the part of `n` prime to `N`.
Rests on: Layers 1–6.

### 8.2 The intrinsic label prefix and the boundary with labels

Define `IntrinsicPrefix f := (N, 0, χ)` and prove it is an isomorphism invariant of the newform
(determined by the function `f`: `N` is the minimal level by 4.6 (ii), `χ` by the automorphy law).
State the boundary: the label `N.k.a.m.d` of `mf.maass.label` consists of the prefix (`N`, `k`,
the Conrey index `a` of `χ`) followed by the **spectral index** `m`, the position of `λ` in the
increasing list of cuspidal eigenvalues of `(N, χ)` (an ordering of the discrete set of 3.4; the knowl
`mf.maass.spectral_index` reserves `0` for `λ = 1/4` and indexes exceptional eigenvalues separately,
in base `26`), and the index `d`
among the newforms of `(N, χ, λ)` under the lexicographic ordering of `(Re λ_f(n), Im λ_f(n))_{n ≥ 1}`;
`m` and `d` are orderings and are not targets; the theorems they rest on, `cuspCount` (3.4) and
4.6 (ii)'s separation of newforms by their coefficient sequences, are this roadmap's. Define
`MultiplicityOne N χ : Prop := ∀ λ, ∀ f g, IsNewform N χ λ f → IsNewform N χ λ g → f = g` and record that the knowl
`mf.maass.label` conjectures it for squarefree level (stated there without a condition on `χ`; the
second family below shows it needs one, and this roadmap reads it for trivial `χ`), so `d = 1` for
every form that conjecture covers, and that
it fails in the three families the knowl `mf.maass.mwf.dimension` lists (oldspaces, quadratic
factors of `χ`, `9 ∣ N`), which is a statement about `dim S(N, χ, λ)`, not about newforms, and is not
claimed here beyond the oldspace case, which 4.5 exhibits (`B_1 f` and `B_p f` for a level-`M`
newform and `N = pM`).
Rests on: 8.1, 4.5, 4.6, 3.4.

### 8.3 Certificate semantics for rigorous Maass forms

Define what a rigorous data point proves. A **Maass certificate** for `(N, χ)` consists of an
interval `[R₀ - ε, R₀ + ε]`, a parity `δ`, a finite list of coefficient intervals
`[c_n - e_n, c_n + e_n]`, `1 ≤ n ≤ M`, and a Fricke sign (`Certificate`); the proposition
`CertifiesNewform N cert : Prop`, for trivial character, is: there exists exactly one newform `f`
of `(N, 1, λ)` with
`λ = 1/4 + r²`, `r ∈ [R₀ - ε, R₀ + ε]`, and it has parity `δ`, Fricke sign as stated, and
`|λ_f(n) - c_n| ≤ e_n` for `n ≤ M`. A **completeness certificate** for a range `[0, R]` is the
proposition `CertifiesCount N χ R k := cuspCount N χ (1/4 + R²) = k`: the number of cuspidal
eigenvalues `λ ≤ 1/4 + R²` of `(N, χ)` counted with multiplicity is `k`. (For a nontrivial
character the certificate carries no Fricke sign and the proposition drops that clause.) Prove the two
**a-posteriori lemmas** that make such certificates checkable: (i) `exists_eigenvalue_near`: if `g`
is a smooth cuspidal automorphic function in the form domain with `‖(Δ - λ₀) g‖ ≤ η ‖g‖` in the
Petersson norm, then some cuspidal eigenvalue lies in `[λ₀ - η, λ₀ + η]` (the resolvent bound `‖(Δ - λ₀)⁻¹‖ ≤ dist(λ₀, spec)⁻¹` of SelfAdjointSpectralTheory
Part D, applied to the cuspidal restriction); (ii) if moreover the spectral projection of `g` onto
`[λ₀ - η', λ₀ + η']` has norm `≥ (1 - θ)‖g‖` then the coefficients of the eigenvector it exhibits
are within explicit bounds of those of `g` (the Booker–Strömbergsson–Venkatesh argument). The
LMFDB's `maass_rigor` table asserts `CertifiesNewform` for each row and the completeness
certificate for each listed range (knowl `rcs.rigor.maass_rigor`); this roadmap states those
propositions and the lemmas a verification uses, and no particular decimal is asserted to be a
spectral parameter by any milestone.
Rests on: 3.4, 4.6; SelfAdjointSpectralTheory Part D.

## Explicit scope exclusions

- No Eisenstein series is constructed, continued or expanded here; 3.5 and 5.5 cite them.
- No trace formula is proved here; 5.5 consumes it.
- No bound on `λ_f(p)` with an absolute constant is a target: only the `f`-dependent trivial bound of
  2.4 is proved, and 6.3 names the Ramanujan–Petersson conjecture.
- No Maass form of weight `k ≠ 0`, no multiplier system, no eta multiplier; 0.1 defines the operator
  only.
- No Kuznetsov formula, no Kloosterman sums, Poincaré series or Kloosterman zeta functions, no
  equidistribution of eigenvalues or of Hecke eigenvalues.
- No spectral-gap argument: the congruence Laplacian, its spectral description and the bound
  `21/100` are consumed, and 5.3 deduces `3/16` from them.
- No Bianchi group other than `PSL₂(ℤ[i])`, no level in Layer 7, no class-number bookkeeping.
- No algorithm: Hejhal's method, the computation of `R`, portraits.
- No labels, orderings or completeness statements about the database.

## Worked examples (acceptance criteria)

Every number below is taken from the LMFDB page named or computed; a milestone that defines the
quantity is named, and a wrong value fails the roadmap.

- **`1.1` = `1.0.1.1.1`, the first Maass form.** `N = 1`, trivial character, odd, Fricke sign
  `+1` (`W_1 = S ∈ Γ`, so every level-one form has `ε_1 = +1`; 4.4), `R = 9.5336952613535577…`, so
  `λ = 1/4 + R² = 91.1413453…` (1.2), the first of §4.5's test values `91.14134`. Coefficients
  `λ(2) = -1.06833355`, `λ(3) = -0.45619735`, `λ(4) = +0.14133658`, `λ(5) = -0.29067255`,
  `λ(6) = +0.48737094`, `λ(7) = -0.74494161`. Checks: `λ(4) = λ(2)² - 1 = 1.14133658 - 1` (4.6 (i),
  the recurrence at `p = 2`, `χ(2) = 1`); `λ(6) = λ(2)λ(3) = 0.48737…` (multiplicativity). Root
  number `ε_1 (-1)^δ = -1` (6.2), so `L(1/2, f) = 0`. `K_{iR}(2π) = 6.8279 · 10⁻⁸` and
  `K_{iR}(4π) = 3.1847 · 10⁻⁸` are the Bessel values in the modes `f_1(1) = 2 a_f(1) K_{iR}(2π)` and
  `f_2(1) = 2 a_f(2) K_{iR}(4π)` at `y = 1` (2.1, 2.3); `f(i) = 0` itself, the form being odd (4.3).
- **`1.3` = `1.0.1.3.1`, the first even form.** `R = 13.779751351890739…`, `λ = 190.1315473…`
  (§4.5's third value, even), `λ(2) = +1.54930448`, `λ(3) = +0.24689977`, `λ(4) = +1.40034437`,
  `λ(5) = +0.73706039`; `λ(4) = λ(2)² - 1 = 2.40034… - 1` ✓; root number `+1`. The second
  level-one form (`R = 12.1730083246…`, `λ = 148.4321317…`) is odd, and the fourth and fifth
  (`R = 14.3585095…`, `16.1380731…`; `λ = 206.4167956…`, `260.6874057…`) are odd, matching the
  parities §4.5 records for its five test values.
- **`2.1` = `2.0.1.1.1`.** `N = 2`, odd, Fricke sign `-1`, `R = 5.4173348068446783…`.
  `λ(2) = +0.70710678 = 2^{-1/2}`, `λ(4) = +0.5`, `λ(8) = +0.35355339 = 2^{-3/2}`: this is
  4.6 (iv) with `η_2 = ε_2 = -1`, `λ(2) = -η_2 · 2^{-1/2}`, and `λ(2^k) = λ(2)^k`. `λ(3) = -0.38053857`,
  `λ(6) = -0.26908141 = λ(2)λ(3)` ✓. Cusps: `∞` of width `1` and `0` of width `2`, both regular;
  `vol(Γ₀(2)\ℍ) = π`, index `3` (0.4, 0.5).
- **`26.1` = `26.0.1.1.1`.** `N = 26`, even, Fricke sign `+1`, `R = 1.3769460644538554…`.
  `λ(2) = -0.70710678 = -2^{-1/2}`, `λ(13) = -0.27735010 = -13^{-1/2}`, `λ(4) = +0.5`,
  `λ(8) = -0.35355339`: so `η_2 = +1`, `η_13 = +1` and `ε_26 = η_2 η_13 = +1` ✓ (4.6 (v)).
  `λ(6) = +0.89466299 = λ(2)λ(3)` with `λ(3) = -1.26524453` ✓. Index `42`, four cusps,
  `vol = 14π`. Root number `+1`. The knowl `mf.maass.26.0.1.1.1.top` records that `26` is the
  smallest squarefree level whose first form is even.
- **`19.205` = `19.0.1.205.1`.** `N = 19`, odd, Fricke sign `-1`,
  `R = 12.34000055975791…` (the form the LMFDB tests reach by searching `spectral_parameter = 12.34`),
  `λ(2) = -1.23669325`, `λ(3) = -1.50256421`, `λ(4) = +0.52941018 = λ(2)² - 1` ✓,
  `λ(6) = +1.85821101 = λ(2)λ(3)` ✓; `λ(19) = -η_19 · 19^{-1/2} = +0.2294157…` with `η_19 = ε_19 = -1`
  (4.6 (iv)). The stored coefficient errors of this form are `≈ 4 · 10⁻⁴` (`4.39 · 10⁻⁴` at `n = 2`),
  against `≈ 10⁻⁸` for `2.1` and `26.1` and `≈ 10⁻⁶⁸` for the level-one forms; a certificate in the
  sense of 8.3 carries those intervals.
- **Rejection checks.** The constant function `1 ∈ M(N, 1, 0)` is not cuspidal (its cusp integral
  is `N`), and `λ = 0` is excluded for cusp forms (2.5). The Eisenstein series `E(z, s)` is
  `Γ`-invariant, smooth and an eigenfunction with `λ = s(1-s)`, but not square-integrable
  (constant term `y^s + φ(s) y^{1-s}`), so it is not a Maass form in the sense of 1.1. For an odd
  character `χ` modulo `N`, `S(N, χ, λ) = 0` for every `λ` (0.3). For `N = 9` and an even character
  of order `3`, the cusp `1/3` is irregular (0.4), and the cusp condition there is vacuous. A level-`1`
  form `f` and `f(2z) ∈ S(2, 1, λ)` is old, not new (4.5), and `λ(2)` of `f(2z)` is not defined by
  `a(2)/a(1)` since `a_{f(2·)}(1) = 0`. A holomorphic cusp form `F ∈ S_k(Γ₀(N))` gives
  `y^{k/2} F ∈ A(N, 1)` only for the weight-`k` law, not for weight `0`; it is not in any
  `M(N, 1, λ)`. The search `level = 4` returns no form: the rigorous table holds squarefree levels only
  (the completeness of a stored list is not a target), not a theorem that `S(4, 1, λ) = 0`.
- **Constants** (0.5, 5.3, 5.4, 5.5): `[SL₂(ℤ) : Γ₀(N)] = 1, 3, 4, 6, 6, 12, 12, 12, 20, 24, 42, 102, 192`
  for `N = 1, 2, 3, 4, 5, 6, 9, 11, 19, 23, 26, 101, 105`; cusp counts `1, 2, 2, 3, 2, 4, 4, 2, 2, 2, 4, 2, 8`;
  widths of `Γ₀(4)`: `4, 1, 1` at `0, 1/2, ∞`; of `Γ₀(12)`: `12, 3, 4, 3, 1, 1` at `0, 1/2, 1/3, 1/4, 1/6, ∞`;
  `[Γ̄₀(N) : Γ̄₁(N)] = 1, 1, 1, 1, 2, 1, 3` for `N = 1, …, 7` (the Petersson rescaling of 0.5);
  `3/16 = s(1-s)` at `s = 3/4`; `3/16 = 75/400 < 84/400 = 21/100` and `1/4 - 21/100 = (1/5)²` (5.3);
  `3π²/2 = 14.804…`; Weyl's constant at level one `1/12`.
- **Picard group** (Layer 7): `vol(PSL₂(ℤ[i])\H³) = G/3 = 0.3053218…` with Catalan's constant
  `G = 0.9159655941…` (consumed); one cusp; `Δ₃ y^s = s(2-s)y^s`; `λ = 1 + r²`.

## Ordering

```text
Layer 0 (Laplacian, automorphy, cusps, Petersson)      → Mathlib, Fuchsian library, ModularForms L0/L6, CongruenceSpectralGap §0.1
Layer 2.1–2.2 (K-Bessel supplements, mode equation)    → §4.5's K_ν, Tau Ceti ODE          ‖ parallel with Layer 0
Layer 1 (carrier, spectral parameter)                  → Layer 0
Layer 2.3–2.5 (expansion, coefficients, decay, λ > 0)  → 0.4, 1.1, 2.1–2.2
Layer 3 (χ-isotypic Laplacian, cuspidal spectrum)      → 0.2, 0.4, 0.5, 2.3; CongruenceSpectralGap §§0.2, 0.5b, 0.6; PDE Lane E, SelfAdjointSpectralTheory E
Layer 4 (Hecke, reflection, Atkin–Lehner, newforms)    → Layers 1–3, HeckeRing.GL2.Gamma0, Fricke
Layer 5.3–5.4 (3/16, level one)                        → 0.4, 0.5, 1.1, 2.3, 2.4; CongruenceSpectralGap §5.3
Layer 5.5 (scattering matrix, Weyl's law)              → 3.4, §§1.23/4.8, AutomorphicSpectralTheory L6
Layer 6 (L-functions)                                  → 4.6, 2.1 (v), 2.4; LFunctions L0
Layer 7 (Picard group)                                 → KleinianGroups L0/L3, 2.1, templates of Layers 1–4, 6 and CongruenceSpectralGap §§0.2, 0.5b
Layer 8 (LMFDB layer, certificates)                    → Layers 1–6
```

Layer 0 and 2.1–2.2 start together; 5.3 needs only 0.4, 1.1 and 2.4; Layer 7 can start as soon
as 2.1 and the Kleinian-groups carrier exist and proceeds in parallel with Layers 3–6; Layer 6
waits only for 4.6. Nothing waits on Mathlib.

## References

- A. O. L. Atkin and J. Lehner, *Hecke operators on `Γ₀(m)`*, Math. Ann. 185 (1970), 134–160:
  Theorem 3 (bad-prime eigenvalues), Theorem 5 (multiplicity one); the template for 4.5–4.6.
- A. O. L. Atkin and W.-C. W. Li, *Twists of newforms and pseudo-eigenvalues of `W`-operators*,
  Invent. Math. 48 (1978), 221–243: Theorem 3 (the bad-prime trichotomy with character), for 4.6 (iv).
- A. R. Booker, A. Strömbergsson and A. Venkatesh, *Effective computation of Maass cusp forms*,
  IMRN 2006, art. 71281: the certification argument of 8.3.
- A. R. Booker, A. Strömbergsson and H. Then, *Bounds and algorithms for the `K`-Bessel function of
  imaginary order*, LMS J. Comput. Math. 16 (2013), 78–108: the bounds of 2.1 (i), (iii).
- A. R. Booker, M. Lee and A. Strömbergsson, *Twist-minimal trace formulas and the Selberg
  eigenvalue conjecture*, J. London Math. Soc. 102 (2020), 1067–1134: newform theory for Maass forms
  with character, the shape of 4.5–4.6.
- D. Bump, *Automorphic Forms and Representations*, Cambridge Studies in Advanced Mathematics 55,
  1997, §1.9 (Maass forms: the Fourier expansion, Hecke operators, the `L`-function and its
  functional equation at level one), §2.1 (Maass forms and the spectral problem).
- W. Duke, Ö. Imamoğlu and Á. Tóth, *Geometric invariants for real quadratic fields*, Ann. of Math.
  184 (2016), 949–990, §5: the factor-two normalization, through AutomorphicFormsOnReductiveGroups §4.5.
- J. Elstrodt, F. Grunewald and J. Mennicke, *Groups Acting on Hyperbolic Space*, Springer
  Monographs in Mathematics, 1998: Chapters 1–3 (the half-space, the Laplacian, Fourier expansions
  with `y K_{ir}`), Chapter 6 (spectral theory), Chapter 7 (Bianchi groups) and Chapter 8
  (Eisenstein series and the Picard group), for Layer 7.
- D. A. Hejhal, *The Selberg Trace Formula for `PSL(2, ℝ)`, Volume 2*, Lecture Notes in Mathematics
  1001, Springer, 1983: the spectral theory with multiplier systems and the trace formula for
  general cofinite groups.
- P. Humphries, *Spectral multiplicity for Maass newforms of non-squarefree level*, IMRN 2019,
  5703–5743: the multiplicity statements behind 8.2.
- M. N. Huxley, *Scattering matrices for congruence subgroups*, in *Modular Forms* (Durham 1983),
  Ellis Horwood, 1984, 141–156: the explicit scattering matrix of 5.5.
- H. Iwaniec, *Spectral Methods of Automorphic Forms*, 2nd ed., Graduate Studies in Mathematics
  53, AMS, 2002: Chapter 1 (the hyperbolic plane and the Laplacian), Chapter 3 (Fourier
  expansions of automorphic functions, the trivial bound), Chapters 4–7 (the spectral theorem),
  Chapter 8 (Hecke operators at level one), Chapter 11 (Weyl's law; Roelcke's bound
  `λ₁ ≥ 3π²/2`; Selberg's `3/16`).
- H. Iwaniec, *Topics in Classical Automorphic Forms*, Graduate Studies in Mathematics 17, AMS,
  1997, Chapter 2 (regular and irregular cusps, multiplier systems).
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53, 2004:
  §5.1 (the analytic conductor, (5.7)), Chapter 15 (Maass forms and their `L`-functions).
- H. Maass, *Über eine neue Art von nichtanalytischen automorphen Funktionen*, Math. Ann. 121
  (1949), 141–183: the original definition and the Hecke theory.
- NIST *Digital Library of Mathematical Functions*, <https://dlmf.nist.gov>: §10.25 (modified
  Bessel equation and the functions `I_ν`, `K_ν`), 10.27.3 (`K_{-ν} = K_ν`), 10.32.9 (the integral
  `K_ν(x) = ∫₀^∞ e^{-x cosh t} cosh(νt) dt`), 10.25.3 (`K_ν(z) ~ √(π/(2z)) e^{-z}`), 10.39.2
  (`K_{1/2}`), 10.43.19 (the Mellin transform).
- W. Roelcke, *Über die Wellengleichung bei Grenzkreisgruppen erster Art*, Sitzungsber. Heidelberger
  Akad. Wiss. 1953/1955, and *Das Eigenwertproblem der automorphen Formen in der hyperbolischen
  Ebene I, II*, Math. Ann. 167 (1966), 292–337 and 168 (1967), 261–324: the level-one bound of
  5.4.
- A. Selberg, *On the estimation of Fourier coefficients of modular forms*, Proc. Sympos. Pure
  Math. 8 (1965), 1–15: the `3/16` theorem, 5.3.
- A. Seymour-Howell, *Rigorous computation of Maass cusp forms of squarefree level*, Res. Number
  Theory 8 (2022), art. 83 (arXiv:2204.11761), the source the LMFDB's `rcs.source.maass_rigor` knowl
  cites for the rigorous table; the certificate semantics of 8.3.
- The LMFDB: the section `lmfdb/maass_forms` (`web_maassform.py`, `main.py`), the knowls
  `mf.maass.mwf.*`, `mf.maass.spectral_index`, `mf.maass.label`, `mf.maass.picard.*`,
  `rcs.rigor.maass_rigor`, `rcs.cande.maass_rigor`, and the pages of the forms `1.1`, `1.3`,
  `2.1`, `19.205`, `26.1`.
