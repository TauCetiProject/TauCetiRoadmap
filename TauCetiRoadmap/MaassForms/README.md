# Roadmap: maass forms — the hyperbolic Laplacian on `Γ₀(N)\ℍ`, Hecke–Maass newforms, and their invariants

**Summary.** A Maass cusp form of weight `0` for `Γ₀(N)` with nebentypus `χ` is a smooth function on the upper
half-plane, automorphic with character `χ`, square-integrable on the quotient, an eigenfunction of
the hyperbolic Laplacian, and without constant term at any cusp. This roadmap builds the classical
theory of these forms at positive level N: the character comparison for the Laplacian, the `χ`-isotypic restriction of the
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

The primary carrier is a **weight-`0` Maass cusp form for `Γ₀(N)` with character `χ`**, with N positive and `χ` a Dirichlet character modulo `N`; level one with trivial character is a special
case, and its objects are consumed from the roadmap that owns them (below) rather than rebuilt.
Holomorphic modular forms, their Hecke theory and their `L`-functions are the
[modular-forms roadmap](../ModularForms/README.md)'s; this roadmap reuses its conventions, its
nebentypus spaces and its Fricke matrix, and states no holomorphic theorem.

Suggested home: `TauCeti/NumberTheory/MaassForms/`, with separate files for character and cusp comparisons, the `K`-Bessel supplements and the Fourier expansion, the `χ`-isotypic
Laplacian and the cuspidal spectrum, Hecke and Atkin–Lehner operators with newforms, the `3/16`
theorem, `L`-functions, the Picard group, and the LMFDB layer.

## Scope and ownership

### Owned here

- The comparison between the unitary weight convention and AutomorphicSpectralTheory §1.16’s
  weight Laplacian, together with the character and cusp extensions at weight zero (Layer 0).
- The weight-zero specialization of the native nebentypus space, regular and irregular
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

### Shared objects and their owners

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
  one); Layer 6's trace formula. The general spectral decomposition and Eisenstein continuation are imported; the
  character-weighted classical cusp comparison is owned by §5.5 below.
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
  strong multiplicity one, and its *Layer 9* predicate IsSelfDual. The Hecke coset
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
  `isometry_smul` and `SMulInvariantMeasure` (Layer 0); `bianchi F ι` and
  `isDiscrete_bianchi` (Layer 3); and `covolume_bianchiGaussian : catalanConstant / 3`
  (Layer 4, using Layer 1’s index law). Layer 7 builds on this carrier and adds no
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

### Further boundaries

- General adelic Eisenstein theory belongs to AutomorphicSpectralTheory §§2.4 and 4.3–4.4;
  §§3.5 and 5.5 construct its character-weighted classical comparison at regular cusps.
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


## Conventions

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
  `∫₀^N g(x + iy) dx = 0` for all `y > 0` is N times the constant term at a
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
  `petersson N f g = D⁻¹ * inner ℂ ĝ f̂`, where f̂ and ĝ are their Γ₁(N)-quotient
  classes and `D = [Γ̄₀(N) : Γ̄₁(N)]` is the positive index of the images in `PSL(2, ℝ)`
  (`1` for `N ≤ 2`, `φ(N)/2` for `N ≥ 3`). The native product is conjugate-linear in
  the first slot, so its arguments are reversed; the squared norms differ only by D.
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
  for λ ≥ 1 use λ = 1 + r², s = 1 + ir; for 0 ≤ λ < 1 use λ = 1−t², s = 1+t, the knowl `mf.maass.picard.eigenvalue`. The
  Fourier expansion at `∞` is `f(P) = Σ_{0 ≠ n ∈ ℤ[i]} a(n) y K_{ir}(2π|n|y) e(Re(n x))`, the
  pairing `Re(n x)` under which `ℤ[i]` is self-dual.
- **Named conjectures are propositions.** SelbergEigenvalueConjecture N χ,
  RamanujanPetersson N f and MultiplicityOne N χ are `Prop`s with their statements; the
  theorems below prove the instances that are theorems (`3/16`, level one) and conclude nothing
  from the propositions except as stated implications.

## Exact supplier contracts

### From Mathlib

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
- `GaussianInt` for `ℤ[i]`, `Zsqrtd`, and the arithmetic of `ZMod`;
  `AddChar.sum_eq_zero_of_ne_one` and `AddChar.sum_eq_card_of_eq_one` for finite
  additive-character sums (`Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`,
  lines 240 and 250).

### From Tau Ceti

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
- The plain-function character space is `functionCharSpace` in
  `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Ring.lean`, line 88: the slash law
  for every element of Γ₀(N), with no smoothness, holomorphicity or integrability condition.
  Use weight zero and `MulChar.equivToUnitHom χ`; `IsAutomorphic` is membership in this space.
  The weighted double-coset sum is `HeckeRing.GL2.twistedHeckeSlashSum` in
  `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Basic.lean`, line 121.
  Section 4.1 compares its unitary scalar and upper-triangular representatives with that sum.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §1.16’s weight-zero Laplacian, power and slash-invariance laws; §§0.25–0.28’s
complex-order modified Bessel I, Whittaker comparison and growing asymptotics for positive
arguments. The range used here is imaginary order, including zero, or real order in [0,1]
(the H³ constant eigenfunction reaches order 1). The Wronskian comparison with the integral
K-kernel in §2.1 fixes the orientation `K I′ − K′ I = 1/u`.
Consume §§2.4 and 4.3–4.4 for general Eisenstein continuation and the spectral decomposition,
§§1.23 and 4.8 for the untwisted classical comparison, §4.9 for the level-one Weyl law, and
Layer 6 for the trace formula. Section 5.5 constructs the character-weighted classical comparison.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.3.5.3’s global Rankin–Selberg unfolding and AL.3.6.1’s positive self-pair pole
criterion and absolute Euler convergence on Re s > 1. Section 6.1 identifies the
classical normalized coefficients with the GL₂ Whittaker coefficients at every place and
transports these results; it does not build a second Rankin–Selberg theory.
AL.2.6.1–AL.2.6.4 give the level-one completion and normalization comparisons, which remain
level-one statements. The character and exceptional-parameter comparisons are made here.
For §4.6 consume AL.2.1.4’s standard local factors, AL.2.2.4–AL.2.2.5’s normalized
newvector and AL.3.7.1’s strong multiplicity one; identify the classical p-th coefficient
with the local newvector parameter before forming the L-series in Layer 6.

### From the other named suppliers

The section-by-section contracts in Scope and ownership fix the quotient measure and
Laplacian from CongruenceSpectralGap §§0.1–0.2, compact cuspidal resolvent from §0.5b and
spectral bound from §5.3; the cusp data from FuchsianOrbifolds; the newform and matrix
conventions from ModularForms Layers 0 and 3–6; the card from LFunctions Layer 0; the H³
carrier and action from KleinianGroups Layer 0, the Gaussian group from Layer 3 and its
covolume from Layer 4, using Layer 1’s index law; PDE Lane E for
elliptic regularity; SelfAdjointSpectralTheory Parts C–E for the resolvent and spectral
projections; and OrthogonalL2Bases B2 for Hilbert-basis packaging.

## How to read the build

Layers 0–1 fix character spaces and the Maass carrier; Layer 2 proves the all-cusp expansion.
Layer 3 restricts the supplied quotient Laplacian, Layer 4 builds classical newforms, Layer 5
proves spectral bounds and counting, and Layer 6 identifies completed L-functions. Layer 7
carries the same analytic comparisons to the Picard quotient, and Layer 8 gives invariant and
error-bound semantics. Each *Needs:* line names the inputs to the statement and the indicated
proof route.

## Layer 0: the Laplacian, automorphy with character, cusps and the Petersson product

### 0.1 The hyperbolic Laplacian

Use `hyperbolicLaplacian f z := -(im z)² · Δ(f ∘ ofComplex)(z)` as the
coordinate specialization of AutomorphicSpectralTheory §1.16’s weight-zero operator. The
coordinate body is needed to state the Maass eigenfunction headlines. Its power law and
Möbius invariance are that supplier’s §1.16, not additional targets.
The comparison owned here is the unitary weight convention
`Δ^{(u)}_k = -y²(∂ₓ² + ∂ᵧ²) + iky∂ₓ`: if `F = y^{k/2} f`, then
`Δ_k f = y^{-k/2}(Δ^{(u)}_k F + (k²/4-k/2)F)`.
Define `IsSmoothOnUpperHalfPlane f` by real smoothness of f composed with `ofComplex` on im > 0.

- The coordinate expression uses the positive Laplacian convention.
- The weight comparison holds for every integral k and C² function on ℍ.
- Real smoothness is local on im > 0; the junk value of `ofComplex` outside that set is irrelevant.

**Checks.**
- At s = 0 and s = 2 the power values are 0 and −2y², respectively.
- At k = 0 the comparison scalar is 0; at k = 1 it is −1/4.
- At k = 1/2 the same algebraic comparison gives −3/16; no half-integral slash carrier is asserted.
- The constant 1 is smooth on im > 0, with every positive-order derivative 0.
- The function |Re z| fails smoothness along Re z=0: its left and right x-derivatives are −1 and 1.
- The function 1/im z is smooth on im > 0, with kth y-derivative (−1)^k k! y^(−k−1), although it has no continuous extension to y=0; requiring smoothness of the junk extension on all of ℂ would reject it.

*Needs:* Mathlib `InnerProductSpace.laplacian`, `laplacian_eq_iteratedFDeriv_complexPlane`;
AutomorphicSpectralTheory §1.16.

### 0.2 Reflection and energy comparison

Prove that reflection z ↦ −z̄ commutes with the weight-zero Laplacian on C² functions, and
identify the energy of compactly supported C² functions with
`∫ (Δf) ḡ dμ = ∫ (∂ₓf ∂ₓḡ + ∂ᵧf ∂ᵧḡ) dx dy`.
The imported Möbius invariance includes positive dilations. The energy comparison transports
the Friedrichs form of CongruenceSpectralGap §0.2 to these coordinates.
These are coordinate consequences: the two x-derivatives cancel the reflection's minus sign;
in the energy identity the density y⁻² cancels the factor y² and integration by parts
in x and y gives the displayed right side, with zero boundary terms because the supports
are compact in ℍ. The precise inputs are Mathlib's
`laplacian_eq_iteratedFDeriv_complexPlane` and
`MeasureTheory.integral_mul_deriv_eq_deriv_mul_of_integrable`
(`Mathlib/Analysis/InnerProductSpace/Laplacian.lean`, line 231, and
`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`, line 1372).

**Checks.**
- Reflection fixes y², so both compositions give −2y².
- Reflection negates x and preserves x²; second derivatives have positive sign in both cases.
- Dilation by 2 sends Δy² to −8y² on either side of the covariance identity.
- For the C² compactly supported function f(x+iy)=(1−x²)³(1−(y−2)²)³ on |x|≤1, 1≤y≤3, extended by zero, both the Laplacian pairing and the Euclidean gradient energy are 4194304/1156155. Reversing the Laplacian sign negates only the first value.

*Needs:* §0.1; CongruenceSpectralGap §0.2; Mathlib’s chain rule and integration by parts.

### 0.3 Automorphic functions with nebentypus and the parity lemma

Write A(N, χ) for `functionCharSpace 0 (MulChar.equivToUnitHom χ)` and define
`IsAutomorphic N χ f` as membership. Its slash law at weight zero is
f(γz) = χ(d_γ)f(z), with no analytic hypotheses. Prove: `A(N, χ)` is stable under `Δ` on `C²`
functions (by 0.2), under the reflection `ι`, under `f ↦ f ∘ W_N` with `χ ↦ χ̄`, and under
`f ↦ f(d ·)` from `A(M, χ')` to `A(N, changeLevel χ')` when `M ∣ N`, `d ∣ N/M`. Prove the
**parity lemma**: `-I ∈ Γ₀(N)` acts trivially on `ℍ`, so `f = χ(-1) f`, and `A(N, χ) = 0` unless
`χ(-1) = 1`. Prove the comparison with the modular-forms roadmap: an element of
`modFormCharSpace k χ` satisfies the weight-`k` nebentypus law (`mem_modFormCharSpace_iff_nebentypus`),
and `A(N, χ)` is the same law at `k = 0` on arbitrary functions.
*Needs:* Mathlib's `Gamma0`, `Gamma0Map`; Tau Ceti's `mem_modFormCharSpace_iff_nebentypus`.


The native character space and membership.

**Checks.**

- At N = 1, χ = 1, the constant 1 satisfies the slash law; at N = 3 with χ(−1) = −1 it would require 1 = −1.
- At γ = T the lower-right entry is 1: the law is period one, with multiplier 1.
- At k = 0 the determinant-one slash scalar is 1; no holomorphicity or cusp condition follows from this law.


- `IsAutomorphic` is the weight-zero native character-space membership predicate.
- Positive dilation changes the level and reflection preserves the character; Fricke conjugates it.


### 0.4 Cusps of `(Γ₀(N), χ)`, the constant term, and the cuspidality predicate

Use `pt x y := UpperHalfPlane.ofComplex (x + y * I)` for cusp coordinates: for y>0
its real and imaginary parts are x and y. Coordinate identities below require y>0;
the native default at nonpositive height is not a boundary point of ℍ.

For `σ ∈ SL(2, ℤ)` define the **width** `w_σ := N / gcd(c², N)` of the cusp `σ∞ = a/c`
(`σ = [a, b; c, d']`), prove `w_σ ∣ N`, prove that `σ T^{w_σ} σ⁻¹ ∈ Γ₀(N)` generates the
stabilizer of `σ∞` in `Γ₀(N)/{±I}`, and identify `w_σ` with the `width` of the Tau Ceti
`CuspDatum` whose `scaling` is `σ⁻¹`. Define the **multiplier** `ζ_σ := χ(1 + a c w_σ)`, the
predicate IsRegularCusp χ σ := ζ_σ = 1, and prove `ζ_σ^{N/w_σ} = 1` from
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
*Needs:* 0.3; Mathlib's `Gamma0`, `OnePoint.exists_mem_SL2`; Tau Ceti's `CuspDatum`.


Widths, multipliers, regularity, cusp integrals and constant terms.

- The width is positive and divides N; the generator fixes the stated cusp.
- The multiplier determines quasi-periodicity; regularity is equality with 1.
- The full-period integral is linear, equals N times the regular constant term and vanishes on irregular modes.
- The coordinate map has the stated real and imaginary parts at positive height and intertwines real translation with addition to x.

**Checks.**

- At N = 1, σ = 1, width = 1, multiplier = 1, constant term of 1 = 1 and cusp integral of 1 = 1.
- At N = 4, cusp 0 has width 4 and multiplier 1; the constant function has constant term 1 and cusp integral 4.
- At N = 9, cusp 1/3 has width 1 and multiplier χ(4) = e(1/3). For g(x+iy) = e(x/3), the integral over nine units is 0; the integral over one unit is not a scalar zero mode. Thus irregularity means no constant channel, not vanishing of every one-width integral.
- For N > 0, the function 1 has cusp integral N and fails cuspidality; the zero function has every cusp integral 0.
- At the regular cusp ∞, the modes e(x) and e(2x) have both constant term and full-period integral 0; 1+e(x) has constant term 1 and integral N.
- The points at (x,y)=(0,1) and (2,3) are i and 2+3i, respectively; interchanging the coordinates fails these values.
- At (x,y)=(2,0) and (0,−1), the native map has the same chosen value in ℍ, whose imaginary part is positive; it is neither the boundary point 2 nor −i. Dropping y>0 would falsely assert imaginary part 0 or −1.
- At N=4, cusp 1/2 has width 4/gcd(4,4)=1, whereas cusp 0 has width 4; replacing c² by c would give width 2 at 1/2.
- At N=9, choose the cubic character with χ(4)=e(1/3). Its conjugate has multiplier e(2/3) at 1/3; both are irregular, while at ∞ both multipliers are 1. Inverting the generator exchanges these two nonreal values.
- At N=4, cusp 0 with trivial character has width 4: the local mode g(x)=1+2e(x/4) has one-width integral 4, constant term 1 and full-period integral 4. At N=12, cusp 1/3 with trivial character also has width 12/gcd(9,12)=4: the same local mode has one-width integral 4 and constant term 1, but full-period integral 12. Omitting the width denominator gives the wrong constant term 4; confusing width with level gives the wrong full-period integral at N=12.
- For an automorphic cusp form f, every cusp integral of 2f is 2·0=0; adding the constant 1 at trivial character changes each integral from 0 to N and fails cuspidality.

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
square-integrable elements of `A(N, χ)` are exactly `L²(N, χ)`. For their classes f̂, ĝ prove
`petersson N f g = D⁻¹ * inner ℂ ĝ f̂`, with positive D as in Conventions
(`MeasureTheory.L2.inner_def`, `Mathlib/MeasureTheory/Function/L2Space.lean`, line 136;
`inner_smul_left`, `Mathlib/Analysis/InnerProductSpace/Defs.lean`, line 251;
CongruenceSpectralGap, Conventions). Thus the native Hilbert product for the Petersson norm
is `D⁻¹ * inner ℂ f̂ ĝ = petersson N g f`; for even `χ`, restriction to a fundamental domain `F` of `Γ̄₀(N)` is an isometry
of `L²(N, χ)` with its Petersson norm onto `Lp ℂ 2 (volume.restrict F)`; and pulling back along
`X_{Γ₁(N)} → X_{Γ₀(N)}` identifies `L²(X_{Γ₀(N)}, μ_{Γ₀(N)})` with `L²(N, 1)`, multiplying squared
norms by `[Γ̄₀(N) : Γ̄₁(N)]`.
*Needs:* 0.3; CongruenceSpectralGap §0.1; Mathlib's `IsFundamentalDomain`, `Lp`; Tau Ceti's
`Covolume` and `MeasureTheory.covolume_eq_card_mul_covolume`.


The effective group, square-integrability, Petersson product and character Hilbert space.

- Integrability is independent of the effective fundamental domain for automorphic functions.
- The Petersson product is first-slot linear and positive definite on continuous automorphic L² functions.
- The character projections are orthogonal and their sum is the identity, with the stated covering-degree norm change.

**Checks.**

- For N = 1 the effective group has covolume π/3; the constant 1 has squared norm π/3 and the zero function has norm 0.
- For N = 2 the covolume and squared norm of 1 are π. Multiplication by 2i multiplies squared norm by 4, giving 4π.
- On a width-one cusp, √y has truncated squared integral log Y, whereas 1 has integral from 1 to infinity equal to 1; the former fails square-integrability.
- At N=1 and trivial χ, `petersson 1 i 1 = iπ/3 = inner ℂ 1 i` and `petersson 1 1 i = −iπ/3 = inner ℂ i 1` on the quotient classes. The unswapped native products have the opposite signs, while both diagonal products at i are π/3.
- At N=5 and trivial χ, the Γ₀ area is 2π and D=2: the native Γ₁ products `inner ℂ 1 i` and `inner ℂ i 1` are 4πi and −4πi, giving Petersson values 2πi and −2πi after division by D; the diagonal at i is 2π.
- The trivial-character projector fixes 1; a nontrivial character projector sends 1 to 0. At N = 3 the odd-character projector is zero because the effective diamond action of −1 is the identity.
- At N = 5 the effective covering degree is 2: pulling back a function doubles its squared quotient norm, while rescaling by 1/√2 restores the norm.
- In the effective group at N=1, the images of I and −I agree and fix i, while the image of T sends i to 1+i. Quotienting by all of SL₂(ℤ), or retaining its central kernel, fails one of these two tests.



- `gamma0PSL` specifies the effective group in `IsSquareIntegrable`.
- For the native carrier closures, `petersson_zero_left` and `petersson_smul_left` express zero and scalar linearity in the first slot.


### Examples

At level 9 the cubic character has multiplier χ(4) at 1/3; at level 1 the area is π/3.

### Dependencies

Mathlib upper half-plane and integration; the character-space and cusp APIs; CongruenceSpectralGap §§0.1–0.2; AutomorphicSpectralTheory §1.16.

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
*Needs:* 0.1–0.5.


The Maass and cusp predicates and their submodules.

- `maassCuspSpace` has closure under addition and complex scalars.
- `IsMaassForm` is the conjunction of smoothness, native automorphy, the eigen-equation and L² integrability.
- `IsMaassCuspForm` adds vanishing of every full-period cusp integral.

**Checks.**

- At positive level and trivial character, 1 lies in M(N,1,0) and fails S(N,1,0), since its cusp integral is N.
- The zero function belongs to every eigenspace; the spectral assertions therefore require a nonzero function or a nonzero subspace.
- For a nonzero eigenform f at λ, the sum f+(−f) is zero and 2f remains at λ; f at a distinct eigenvalue μ cannot satisfy both equations since (λ−μ)f ≠ 0.


- `isMaassForm_zero`, `IsMaassForm.const_smul`, `isMaassCuspForm_zero`, `IsMaassCuspForm.add` and `IsMaassCuspForm.const_smul` supply the zero, additive and scalar closure needed to bundle the cusp submodule.

(Booker–Lee–Strömbergsson, arXiv:1803.06016v2, §1.1, p.3, defines the character carrier; the explicit cusp-integral formulation fixes the cusp condition here.)

### 1.2 The spectral parameter

Define `spectralParameter λ := √(λ - 1/4)` and exceptionalParameter λ := √(1/4 - λ), prove
`λ = 1/4 + r²` for `λ ≥ 1/4` and `λ = 1/4 - t²` for `λ ≤ 1/4`, `λ = s(1-s)` with `s = 1/2 + ir`,
resp. s = 1/2 + t; for 0 < λ < 1/4 this lies in (1/2,1), and for λ = 0 it equals 1, and define IsExceptional λ := λ < 1/4. Prove the LMFDB
dictionary: `spectral_parameter = spectralParameter λ` when λ ≥ 1/4; below the threshold use the imaginary parameter i√(1/4−λ); the title line "`R = 9.53369526`" of the
form `1.1` is `spectralParameter 91.1413453…`. Prove that `r ↦ 1/4 + r²` is injective on `r ≥ 0`
and that `K_{ir} = K_{-ir}` makes the sign of `r` immaterial in every expansion.
*Needs:* 1.1; §4.5's `K_ν = K_{-ν}`.


Real and complementary parameters and the order `besselOrder`.

- The real parameter has square λ−1/4 on λ ≥ 1/4.
- The complementary parameter has square 1/4−λ on λ ≤ 1/4.
- `besselOrder` has square 1/4−λ in both branches, fixing the common Fourier and gamma order.

**Checks.**

- At λ = 1/4, r = 0, t = 0 and the order is 0; both formulas give 1/4.
- At λ = 1/5 the complementary order is √(1/20), and 1/4−1/20 = 1/5; the real square root of λ−1/4 is 0 and cannot encode this eigenvalue.
- At λ = 0, t = 1/2 and s = 1, giving s(1−s) = 0. At λ = 5/4, r = 1 and the order is i, with square −1.
- The exceptional predicate is true at 0 and 1/5 and false at 1/4 and 5/4; the complementary parameter at 5/4 is the junk real-square-root value 0, not an order satisfying t²=−1.


### Examples

The constant function separates M(N,1,0) from S(N,1,0); λ=1/5 uses order √(1/20).

### Dependencies

Layer 0 and the supplied K-order symmetry.

## Layer 2: the `K`-Bessel function and the Fourier–Whittaker expansion

### 2.1 Supplements to `K_ν`

With `K_ν(u) = ∫₀^∞ e^{-u cosh t} cosh(νt) dt` consumed from §4.5 (convergence, differentiation,
evenness in `ν`, the equation `u²K'' + uK' - (u² + ν²)K = 0`, the asymptotic `√(π/(2u)) e^{-u}`),
prove: (i) `K_{ir}(u) ∈ ℝ` for real `r` and `u > 0`, and `|K_{ir}(u)| ≤ K_0(u)`; (ii) for `ν = t`
real, `0 ≤ t < 1/2`, `K_t(u) > 0` and `K_t(u) ≤ K_{1/2}(u) = √(π/(2u)) e^{-u}`; (iii) the uniform
bound `|K_ν(u)| ≤ C(a) e^{-u/2}` for `u ≥ 1` and `|Re ν| ≤ a`, from the integral; (iv) the
small-argument behaviour: `|K_{ir}(u)| ≤ C_r` for `0 < u ≤ 1` and fixed real r ≠ 0; at r = 0 use K₀(u) = −log(u/2) − γ + o(1) (DLMF 10.30.3 and 10.31.2), and
`K_t(u) ~ (Γ(t)/2)(u/2)^{-t}` as `u → 0⁺` for `0 < t < 1/2`;
(v) the **Mellin transform** `∫₀^∞ K_ν(y) y^{s-1} dy = 2^{s-2} Γ((s+ν)/2) Γ((s-ν)/2)` for
`Re s > |Re ν|` (DLMF 10.43.19), which Layer 6 consumes; (vi) the dichotomy that the solution space
of `u²K'' + uK' - (u² + ν²)K = 0` on `(0, ∞)` is two-dimensional, spanned by `K_ν` and the growing
complex-order solution I_ν of AutomorphicSpectralTheory §§0.25–0.28, and that a solution bounded by `C e^{-u/2}` for
large `u` is a multiple of `K_ν` (the Wronskian K_ν I′_ν − K′_ν I_ν is 1/u, DLMF 10.28.2, so `I_ν` grows like
`e^{u}/√(2πu)`). Check numerically: `K_{1/2}(1) = 0.4610685044…` equals
`√(π/2) e^{-1}`; `K_0(1) = 0.4210244382…`; with `R = 9.53369526135355755`,
`K_{iR}(2π) = 6.82794275895 · 10⁻⁸` from the integral and from the series agree; the Mellin identity
at `ν = 1.3 i`, `s = 2.5` gives `0.72603653010…` on both sides.
*Needs:* §4.5's `K_ν`; Mathlib's Gamma function and `mellin`; Tau Ceti’s ODE library; AutomorphicSpectralTheory §§0.25–0.28.


The complex-order kernel comparisons.

**Checks.**

- At ν = 1/2 and u = 1, K = √(π/2)e^(−1) = 0.4610685044; I = √(2/π)sinh(1) = 0.9376748882.
- At ν = 0, u = e^(−10), K₀(u) = 10.11593152 approximately; it is not bounded by the value K₀(1) = 0.4210244382.
- At ν = i and u = 1, K I′−K′I = 1; at ν = 0 and u = 2 it is 1/2. Reversing the Wronskian reverses these signs.

### 2.2 Fourier modes and the mode equation

For `f ∈ A(N, χ)` of class `C²` with `Δf = λ f`, `σ ∈ SL(2, ℤ)` and `g = f ∘ σ` with multiplier
`ζ_σ = e(κ_σ)`, `κ_σ ∈ [0, 1)`, define the **modes**
`g_ν(y) := w_σ⁻¹ ∫₀^{w_σ} g(x + iy) e(-νx/w_σ) dx` for `ν ∈ κ_σ + ℤ`, prove the expansion
`g(x + iy) = Σ_{ν ∈ κ_σ + ℤ} g_ν(y) e(νx/w_σ)` (uniformly on compact sets, from smoothness and
periodicity), and prove the **mode equation** `-y² g_ν'' + (2πν/w_σ)² y² g_ν = λ g_ν`. For `ν ≠ 0` the
substitution `g_ν(y) = √y h(2π|ν|y/w_σ)` turns it into the Bessel equation of order besselOrder λ (ir for λ ≥ 1/4, √(1/4−λ) otherwise), so by
2.1 (vi) `g_ν(y) = α √y K_{ir}(2π|ν|y/w_σ) + β √y I_{ir}(2π|ν|y/w_σ)`; for `ν = 0` (regular cusps
only) `g_0(y) = α y^s + β y^{1-s}` when `s ≠ 1/2` and `α √y + β √y log y` when `s = 1/2`.
*Needs:* 0.4, 2.1; Mathlib's Fourier series on a circle.


The cusp modes `fourierModeAt` and their frequency lattice.

**Checks.**

- For g(x) = e(x), width 1 and κ = 0, the n = 1 mode is 1 and the n = 2 mode is 0.
- For g(x) = e(x/3), width 1 and κ = 1/3, the n = 0 shifted mode is 1; a periodic integer-frequency expansion has the wrong translation multiplier.
- For the zero mode y^s, the ODE gives −y²g″ = s(1−s)y^s; at s = 1/2 it gives (1/4)√y, and √y log y is the independent repeated-root solution.
- At ∞, the function 1+2e(x) has modes 1,2,0 at n=0,1,−1; the opposite exponential sign would put 2 at −1 instead.
- At width 4 and κ=0, g(x)=e(x/4) has mode 1 at frequency 1 and mode 0 at frequency 0; without division by the width the former value would be 4.
- At width 1 and κ=1/3, g(x)=e(4x/3) has shifted modes 0 and 1 at n=0 and n=1. Thus the shift is κ+n, not n alone.


- `pt` is x+iy for y>0; `fourierMode` specializes the integral to width one at ∞.
- `cuspWidth`, `cuspMultiplier` and `cuspIntegral` specify the width, shifted-frequency multiplier and full-period integral used by the general modes.

(The order and factor-two normalization specialize Duke–İmamoğlu–Tóth (2016), §5, unnumbered “Spectral expansion” subsection, (5.6)–(5.7), p.962. The all-cusp character statement is the adaptation obtained from §0.4 and the displayed ODE, not a claim that their level-one formula covers all levels.)

### 2.3 The Fourier–Whittaker expansion and the coefficients

For `f ∈ M(N, χ, λ)`, prove `β = 0` in every nonzero mode of 2.2 at every cusp: a mode with
`β ≠ 0` grows like `e^{2π|ν|y/w_σ}` while square-integrability on the cusp region
`{0 ≤ x < w_σ, y > Y}` with `dμ` forces `∫_Y^∞ |g_ν(y)|² y⁻² dy < ∞` by Parseval. Define
`fourierCoefficient f n := α_n / 2` at the cusp `∞` for `n ∈ ℤ ∖ {0}`, so that
`f(z) = 2√y Σ_{n ≠ 0} a_f(n) K_{ir}(2π|n|y) e(nx) + (constant term)`, with the sum absolutely and
locally uniformly convergent together with its derivatives, and more generally
`fourierCoefficientAt σ f ν` at every cusp with the width in the exponential. Prove the **limit
characterization** `a_f(n) = lim_{y → ∞} √|n| e^{2π|n|y} f_n(y)` from the asymptotic of `K_ν`
(`2√y K_{ir}(2π|n|y) ~ |n|^{-1/2} e^{-2π|n|y}`); this is the form `Suggested.lean` uses, since it
mentions no Bessel function. Prove the comparison with §4.5: at `N = 1`, trivial `χ`,
`fourierCoefficient` here is §4.5's `fourierCoefficient`, and the expansion is its `fourierExpansion`.
Prove `a_{ιf}(n) = a_f(-n)` and `a_{f ∘ (d ·)}(n) = √d a_f(n/d)` (zero unless `d ∣ n`).
*Needs:* 2.1, 2.2, 1.1.


Coefficients `fourierCoefficient` and `fourierCoefficientAt`.

- The limit and the Bessel coefficient agree at every nonzero allowed cusp frequency.
- Reflection exchanges n and −n; raw dilation contributes √d.
- `fourierMode_eq` and `hasSum_fourierMode` give the Bessel identity and the summable all-cusp expansion, including the complementary branch.

**Checks.**

- A mode α√y K_b(2πy) with α = 1 has the limit coefficient 1/2 and reconstructs as 2·(1/2)√y K_b(2πy).
- For a(1)=1, raw dilation d = 1, 2, 4 gives coefficients at n=d equal to 1, √2, 2; at n=1 they are 1, 0, 0.
- At width w = 4 and frequency 1, the large-height mode is a√4 e^(−πy/2); multiplying by √(1/4)e^(πy/2) recovers a. At κ = 1/3, w = 1 the recovering multiplier is √(1/3)e^(2πy/3).
- For the zero function, both coefficient limits are 0 at every frequency. At width 4 and frequency −1, a mode 2√y K_b(πy/2)e(−x/4) has coefficient 1, just as at frequency +1; using the signed frequency instead of its absolute value fails this test.


(Duke–İmamoğlu–Tóth (2016), §5, unnumbered “Spectral expansion” subsection, (5.7), p.962 fixes the factor two at level one; substituting dz in that convention gives the stated √d factor at general level.)

### 2.4 Growth, decay and the trivial bound

For `f ∈ S(N, χ, λ)`: at every cusp the expansion has no zero mode. Put δ_σ = 1 at a regular cusp and
δ_σ = min(κ_σ,1−κ_σ) at an irregular cusp. Then `f(σ(x + iy)) = O(e^(-2πδ_σ y/w_σ))`
uniformly in `x` as `y → ∞`; `f` is bounded on `ℍ`; `f ∈ L^p(Γ₀(N)\ℍ)` for 1 ≤ p ≤ ∞; and the
**trivial bound** `|a_f(n)| ≤ C_f √|n|`, from |f_n(y)| ≤ sup |f| at y = A/|n|, where A > 0 is fixed so K_b(2πA) ≠ 0 (choose A sufficiently large using the nonzero leading asymptotic), hence
`|λ_f(n)| ≤ C √n` for a normalized eigenform. For `f ∈ M(N, χ, λ)` not cuspidal, the constant term
at a regular cusp is `αy^s + βy^{1-s}`: when `λ ≥ 1/4` both exponents have real part `1/2` and
square-integrability forces the whole zero mode to vanish. At λ = 1/4 the independent
solutions are A√y + B√y log y, and both A and B vanish. For 0 ≤ λ < 1/4, choose
s = 1/2 + √(1/4−λ) ∈ (1/2,1]; integrability forces α = 0 and permits βy^(1−s),
including the constant term at λ = 0, s = 1. Prove that the
Fourier expansion determines `f` (two forms with the same coefficients at `∞` and the same constant
term are equal), and that `f ↦ (a_f(n))_{n ≠ 0}` is injective on `S(N, χ, λ)`.
*Needs:* 2.3, 0.5.


Decay and integrable constant terms.

**Checks.**

- For κ = 0, δ = 1. For κ = 1/3 or 2/3, δ = 1/3; the rate is e^(−2πy/(3w)), whose ratio to e^(−2πy/w) is e^(4πy/(3w)).
- At s = 1/2, A = 1, B = 0 the truncated constant-term integral is log Y; at A = 0, B = 1 it is (log Y)³/3. Neither is finite at infinity.
- At λ = 0, s = 1 the surviving β term is constant and has cusp integral of its squared norm equal to |β|²; the αy term instead has integral |α|²(Y−1).


- `fourierCoefficient_le` gives the √|n| bound, `fourierCoefficient_injective` gives uniqueness, and `decay_atImInfty` fixes the width-one decay at ∞.


### 2.5 Nonzero forms have real nonnegative eigenvalue; nonzero cusp forms have `λ > 0`

Prove that a nonzero Maass form has `λ ∈ ℝ` and `λ ≥ 0`: by Green's formula on a fundamental
domain with the cusps truncated at height `Y`, `λ ‖f‖² = ∫_F |∇f|² dx dy + (boundary terms)`, and the
boundary terms vanish as `Y → ∞` because `f` is square-integrable with the constant term at each cusp
a combination of `y^s` and `y^{1-s}` (2.4) and the nonzero modes decay. Prove `λ = 0` only for
locally constant, hence constant, `f`, which is not cuspidal; so a nonzero Maass cusp form has
`λ > 0`. This is §4.5's zero-eigenvalue exclusion at level `N` with character.
*Needs:* 1.1, 2.4.


Positivity.

**Checks.**

- For the zero function the energy equation is 0 = λ·0, so it imposes no sign on λ.
- For the constant 1 the energy is 0 and λ = 0; its nonzero constant term excludes it from the cusp space.
- At λ = 1/5 the spectral parameter is complementary but λ remains positive; positivity does not imply λ ≥ 1/4.


### Examples

Dilation by 4 multiplies a(1) into a(4)=2; the critical zero mode has divergent integral log Y.

### Dependencies

Layers 0–1; AutomorphicSpectralTheory §§0.25–0.28; AutomorphicFormsOnReductiveGroups §4.5; Fourier series and ODE analysis.

## Layer 3: the self-adjoint Laplacian and the cuspidal spectrum

### 3.1 The diamond action reduces the Laplacian of `Γ₁(N)`

Let `Δ_{Γ₁(N)}` be the self-adjoint Laplacian of CongruenceSpectralGap §0.2 on
`L²(X_{Γ₁(N)}, μ_{Γ₁(N)})`. Prove that every diamond operator `⟨d⟩` of 0.5 maps the domain of
`Δ_{Γ₁(N)}` onto itself and commutes with it: by §0.2's maximal-domain characterization, `f` lies in
the domain exactly when the distributional `-y²(∂ₓ² + ∂ᵧ²)` of its `Γ₁(N)`-invariant lift is the lift
of an `L²` class, and composing with `γ ∈ Γ₀(N)` preserves that condition and commutes with the
expression by 0.2. Hence the projection onto `L²(N, χ)` commutes with `Δ_{Γ₁(N)}`, and `L²(N, χ)` is
a reducing subspace for every `χ`.
*Needs:* 0.2, 0.5; CongruenceSpectralGap §0.2.


Reducing character projections.

**Checks.**

- The identity diamond fixes every domain vector and commutes with Δ.
- At N = 5 the two effective diamond characters give projectors (1+D)/2 and (1−D)/2; their product is (1−D²)/4 = 0.
- On a χ-eigenvector, the χ projector is 1 and any distinct-character projector is 0.

### 3.2 The restricted Laplacian `Δ_{N,χ}`

Define `Δ_{N,χ}` as the restriction of `Δ_{Γ₁(N)}` to the reducing subspace `L²(N, χ)` of 3.1. Prove
that it is self-adjoint, hence closed (`IsSelfAdjoint.isClosed`) and densely defined
(`IsSelfAdjoint.dense_domain`), and nonnegative (`0 ≤ Re ⟨Δ_{N,χ} f, f⟩`); that its domain is
`{f ∈ L²(N, χ) : Δf ∈ L² in the distributional sense}`; that its kernel is the constants when
`χ = 1` and `0` otherwise (a constant `c` with `c = χ(d) c` for every `d` vanishes unless `χ = 1`);
and that at trivial `χ` the pullback of 0.5 carries §0.2's `Δ_{Γ₀(N)}` onto `Δ_{N,1}`, both having
the maximal domain, so that `Δ_{N,1}` is AutomorphicSpectralTheory §1.16a's
`modular_laplacian_realization` by §0.2's agreement and nothing proved there is reproved here.
This is a reducing-subspace adaptation of CongruenceSpectralGap §0.2, “Positive orbifold
Laplacian”, with the finite character projector of §3.1: it preserves the maximal domain
and commutes with Δ, hence with (Δ±i)⁻¹. Restricting those inverses to its closed range
gives both resolvent inverses there and therefore self-adjointness; positivity and the
kernel are restrictions of the supplied energy and constant kernel. With f̂, ĝ the quotient
classes and D as in §0.5, the form comparison is
`petersson N (Δf) g = D⁻¹ * inner ℂ ĝ (Δ_{N,χ} f̂)` on the operator domain; equivalently
it is D⁻¹ times the supplied closed form q(ĝ,f̂). Reversing both arguments and
rescaling by positive D preserves adjoints, orthogonality and nonnegativity, so the
operator uses the native Hilbert convention while the displayed Petersson pairing
remains first-slot linear. Closedness and density
then use `IsSelfAdjoint.isClosed` and `IsSelfAdjoint.dense_domain`
(`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean`, lines 340 and 241).
*Needs:* 3.1, 0.5; CongruenceSpectralGap §0.2; Mathlib's `LinearPMap`.


The restricted operator.

**Checks.**

- For χ = 1, Δ1 = 0 and the kernel contains the constants.
- For χ ≠ 1 choose d with χ(d) ≠ 1; a constant c must satisfy (1−χ(d))c = 0, hence c = 0.
- For odd χ the Hilbert space is zero; no positive first eigenvalue is asserted on it.
- In the domain model Δ=diag(0,2), f=(0,i), g=(0,1), D=1, the Petersson value of (Δf,g) is 2i, equal to `inner ℂ g (Δf)` and q(g,f); the unswapped native value is −2i. The diagonal energy is 2 in both conventions.
- In the finite-dimensional model Δ=diag(0,2), P=diag(1,0), the restricted operator is 0 and its (Δ+i)⁻¹ is −i, the restriction of diag(−i,(2−i)/5); the complementary restriction is 2. This tests reduction of the domain and resolvent as well as the kernel.


- The restriction is closed, nonnegative and self-adjoint on its maximal domain.
- Its kernel is the constants for trivial χ and zero otherwise.
- At trivial χ the pullback comparison identifies the supplied Γ₀(N) Laplacian.


### 3.3 Eigenvectors are Maass forms

Prove that an `L²`-eigenvector `f` of `Δ_{N,χ}` with eigenvalue `λ` has a `C^∞` representative
(elliptic regularity: `Δf = λf` weakly implies smoothness), which is then an element of
`M(N, χ, λ)` in the sense of 1.1; conversely every `f ∈ M(N, χ, λ)` lies in the domain with
`Δ_{N,χ} f = λ f`. So the point spectrum of `Δ_{N,χ}` with its eigenspaces is exactly
`{λ : M(N, χ, λ) ≠ 0}` with the spaces `M(N, χ, λ)`, and the eigenvalues are real and nonnegative
(this reproves 2.5 for the `L²` eigenvectors).
*Needs:* 3.2, 1.1; PDE Lane E.


Eigenfunction comparison.

**Checks.**

- The smooth constant 1 represents an L² eigenvector at 0 for χ = 1.
- The same constant fails any eigen-equation at λ ≠ 0 since Δ1−λ1 = −λ.
- The zero class has zero smooth representative; positivity claims exclude it.

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
The cuspidal restriction is discrete, with positive eigenvalues of finite multiplicity.
For even χ, §5.5 then proves an infinite sequence 0 < λ₁ ≤ λ₂ ≤ … → ∞; for odd χ
this space and its spectrum are empty. In either case
`S(N, χ, λ)` is
finite-dimensional for every `λ`, `{λ ≤ T : S(N, χ, λ) ≠ 0}` is finite for every `T`, and
`L²_cusp(N, χ)` has an orthonormal basis of Maass cusp forms, packaged as a `HilbertBasis` with its
element-level `coe_*` (the B2 pattern of the orthogonal-bases roadmap). The multiplicity
`dim S(N, χ, λ)` is the LMFDB knowl `mf.maass.mwf.dimension`. Restricting §0.6 at `Γ₁(N)` to
`L²(N, χ)`, every spectral value of `Δ_{N,χ}` in `(0, 1/4)` is an eigenvalue of
`Δ^{cusp}_{N,χ}`. Define `λ₁(N, χ) := min {λ : S(N, χ, λ) ≠ 0}` (the
minimum exists by discreteness, when the set is nonempty) and `cuspCount N χ T := Σ_{λ ≤ T} dim S(N, χ, λ)`,
a finite sum by discreteness.
*Needs:* 3.2, 3.3, 2.3, 0.4; CongruenceSpectralGap §§0.2, 0.5b, 0.6; SelfAdjointSpectralTheory
Part E (spectral measure, compact resolvent gives discrete spectrum); OrthogonalL2Bases B2.


The cusp Hilbert space, first eigenvalue and counting function.

**Checks.**

- For an odd character modulo 3 the Hilbert space is zero and every count is 0, despite index 4.
- At T = 0 the count is 0 by positivity; an eigenspace of dimension 2 at λ contributes 2 at T = λ, not 1.
- If there are no eigenvalues the first-eigenvalue minimum is undefined; compact resolvent on the zero space does not imply an infinite sequence.


- `finiteDimensional_maassCuspSpace` is the finite multiplicity statement.
- `cuspidalSpectrum_finite` gives finitely many eigenvalues in any bounded interval.
- `cuspCount` sums those dimensions, retaining multiplicity.


### 3.5 Orthogonality and the residual spectrum, stated as a boundary

Prove that Maass cusp forms with distinct eigenvalues are Petersson-orthogonal, that `S(N, χ, λ)` is
orthogonal to the constants, and that the orthogonal complement of `L²_cusp(N, χ)` in `L²(N, χ)` is
the closure of the span of incomplete Eisenstein series (the functions Σ over Γ_σ\Γ conj(χ(d_γ)) ψ(im τ_σ⁻¹γz),
ψ ∈ C_c^∞(0,∞), with σ a χ-regular cusp and τ_σ a width-one scaling).
The character weight makes the sum transform by χ; regularity makes it independent of coset
representatives. Prove this classical realization and its comparison with the inducing data of
AutomorphicSpectralTheory §§2.4 and 4.3–4.4; §5.5 uses the same comparison for continued series.
*Needs:* 3.4; AutomorphicSpectralTheory §4.8 for the cited decomposition.


Weighted incomplete Eisenstein series.

**Checks.**

- For trivial χ the weight is 1 and the usual invariant series is recovered.
- Right translation by δ with χ(d_δ)=ζ multiplies the weighted sum by ζ, whereas an unweighted sum is invariant.
- At the cubic character modulo 9 the cusp 1/3 has multiplier e(1/3); changing a stabilizer representative changes an unweighted seed, so it is excluded from the channel index.


### Examples

The odd character modulo 3 gives count zero for every height; a two-dimensional eigenspace contributes two.

### Dependencies

Layers 0–2; CongruenceSpectralGap §§0.2, 0.5b, 0.6; PDE Lane E; SelfAdjointSpectralTheory Parts C–E; OrthogonalL2Bases B2.

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
*Needs:* 0.3, 2.3; Tau Ceti's `HeckeRing.GL2.Gamma0`.


Unitary Hecke normalization.

**Checks.**

- At n = 1 the sum is f and the scalar is 1.
- At a good prime p, the n = p coefficient recurrence is a(p²) = a(p)²−χ(p), with no factor p.
- At a bad prime χ(p) = 0 and a(p²) = a(p)²; for χ = 1 and p exactly dividing N this is 1/p.


- `heckeOperator_mem` states preservation of the cusp eigenspace.
- `fourierCoefficient_heckeOperator` and `heckeOperator_mul` state the divisor-sum laws at every positive index.
- The bad-prime operator is the same Hecke sum with zero-extended character weights.


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
The character-general adjoint comparison follows by changing variables in each double-coset
integral of §4.1 and using the adjugate coset: its diamond factor acts as χ̄(n), since
χ(n)χ̄(n)=1 for (n,N)=1. The representative algebra is the same as in
`HeckeRing.GL2.trace_translate_adjugateGL_natDiagGL_eq_diamondOp_heckeTNat`
(`TauCeti/NumberTheory/ModularForms/HeckeSlash/Diamond.lean`, line 217);
that holomorphic theorem supplies the algebraic template, while the L² change of variables
is proved here without holomorphicity. The finite-dimensional diagonalization input is
`LinearMap.IsSymmetric.iSup_iInf_eq_top_of_commute`
(`Mathlib/Analysis/InnerProductSpace/JointEigenspace.lean`, line 121).
*Needs:* 4.1, 3.4, 0.5; Mathlib's joint eigenspaces.


Adjoints.

**Checks.**

- For trivial χ, conjugating an eigenvalue leaves it fixed.
- If χ(n) = i and the eigenvalue is exp(iπ/4) = e(1/8), its conjugate and −i times that value are both (1−i)/√2, matching the adjoint factor.
- The same scalar is normal but not real; requiring all good operators to be self-adjoint would exclude it.


- `petersson_heckeOperator` fixes the adjoint factor on the complex character space.


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
*Needs:* 4.1, 4.2, 2.3.


Reflection and parity.

**Checks.**

- Reflection sends e(x) to e(−x), so the coefficients at 1 and −1 are exchanged.
- The sum e(x)+e(−x) has parity 0 and takes value 2 at x=0; their difference has parity 1 and takes value 0.
- The zero function is both even and odd, so the chosen parity is 0; newform normalization a(1)=1 excludes this ambiguity.
- The constant 1 is even and not odd, since 1≠−1; the function Re z is odd and not even, since its values at 1+i and −1+i are 1 and −1. Their sum is neither, and the total parity definition returns 1 without asserting oddness.


- `reflection` is an involution commuting with Δ and the Hecke operators.
- `IsEven` and `IsOdd` cut out its +1 and −1 eigenspaces.
- `parity` is 0 on the even subspace and 1 on a nonzero odd form.


### 4.4 Atkin–Lehner and Fricke involutions at weight `0`

For `Q ‖ N` define atkinLehner N Q f := f ∘ W_Q with `W_Q = [Qa, b; Nc, Qd]`, `det = Q`, and
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
The matrix identities are the inputs to this weight-zero adaptation of ModularForms
Layer 6: `TauCeti.coe_frickeGL_sq`
(`TauCeti/NumberTheory/ModularForms/Fricke/Matrix.lean`, line 110) and
`TauCeti.adjugateGL_eq_frickeGL_conj_bar`
(`TauCeti/NumberTheory/ModularForms/Fricke/AtkinLehnerBar.lean`, line 60).
Apply their fractional-linear actions, where scalar matrices act trivially, and use
§§0.2–0.5 for the differential and L² comparisons. This does not apply a holomorphic
slash normalization to weight-zero functions.
*Needs:* 0.3, 4.1, 4.3; Tau Ceti's Fricke matrix and `AtkinLehnerBar`.


Atkin–Lehner and Fricke maps.

**Checks.**

- Applying z ↦ −1/(Nz) twice gives z for N > 0; at z = i/√N one application fixes z.
- At N = 6, W₂W₃ = W₆ and W₂² = W₁ on the trivial-character space.
- For χ of order 3 modulo 9, W₉ changes χ to χ̄; treating W₉ as an endomorphism of the original character space is wrong.
- At N=2 the Fricke matrix squares to −2I, whose fractional-linear action is the identity; conjugating diag(1,3) by this matrix gives diag(3,1), its adjugate. Thus the scalar matrix square and the operator square have different literal values.


- `frickeOperator` carries χ to χ̄ and squares to the identity for N>0.
- Atkin–Lehner operators at exact divisors are unitary on trivial-character spaces.
- Their product rule and good-Hecke commutation retain the stated coprimality hypotheses.


### 4.5 Oldforms and newforms

For positive levels M ∣ N, χ′ modulo M with `changeLevel χ' = χ`, and `d ∣ N/M`, define the **level-raising**
`B_d f := f(d ·)`, prove it maps `S(M, χ', λ)` into `S(N, χ, λ)` with `a_{B_d f}(n) = √d a_f(n/d)` (zero if d does not divide n) and
`⟨B_d f, B_d g⟩_N = [Γ₀(M) : Γ₀(N)] ⟨f, g⟩_M` (the dilation preserves `dμ` and carries a fundamental
domain of `Γ₀(N)` to one of `d Γ₀(N) d⁻¹ ≤ Γ₀(M)`, a subgroup of the same index; this is where an
unnormalized Petersson product shows its convention).
Define the **oldspace** `S^{old}(N, χ, λ) := Σ_{M ∣ N, M ≠ N, χ' , d ∣ N/M} B_d S(M, χ', λ)` and the
**newspace** `S^{new}(N, χ, λ)` as its Petersson-orthogonal complement in `S(N, χ, λ)`. Prove that
the good `Tₙ`, `ι` and (for trivial `χ`) every `W_Q` preserve the oldspace and the newspace, and that
the oldspace is spanned by the `B_d f` with `f` a newform of some level `M ∣ N`, `M < N` (by induction
on `N`). Define a **newform**: `f ∈ S^{new}(N, χ, λ)` with `a_f(1) = 1` and `f` a good Hecke
eigenform (4.2); newforms N χ λ is the set of them.
*Needs:* 4.1–4.4, 3.4.


Raw dilation, oldspace, newspace and `IsNewform`.

- `levelRaisingLinear` bundles raw dilation without a normalization scalar.
- `oldSpace_le_maassCuspSpace` requires N > 0 and uses only positive divisor levels.
- `newSpace` is the Petersson orthogonal complement within the cusp space, and `IsNewform` adds first coefficient one and every good Hecke eigencondition.

**Checks.**

- At N = 1 there are no proper positive divisor levels: `oldSpace` is zero and `newSpace` is the full cusp eigenspace.
- For a normalized level-one f, `levelRaising` at d = 4 gives a(4)=2 and a(1)=0. Its squared norm at level 4 is 6 times its level-one squared norm.
- At N = 0 the divisors M=d=1 would occur and 1 divides 0; the oldspace inclusion and `newSpace` require positive level. A first coefficient 0 cannot satisfy `IsNewform`.
- Raw dilation at d=1 is the identity and at d=2 sends a normalized level-one form to one with a(2)=√2 and a(1)=0; its linear-map version sends 0 to 0 and 2f to twice the same dilate.
- At level 2, a nonzero level-one cusp form f and f(2z) belong to the oldspace; neither belongs to its orthogonal complement, since its pairing with itself is positive. The zero vector belongs to both oldspace and newspace.
- A normalized level-one good eigenform is new, whereas 0 and 2f are not normalized: their first coefficients are 0 and 2 rather than 1. Thus membership in the newspace alone does not define a newform.


- `petersson_add_left` supplies additive closure of the Petersson orthogonal complement.

(Booker–Lee–Strömbergsson, arXiv:1803.06016v2, §1.1, pp.3–4, defines raw dilation and the old/new orthogonal decomposition for arbitrary conductor and even character.)

### 4.6 Strong multiplicity one and the full eigenform theorem

Prove the **Atkin–Lehner–Li theorem for Maass forms**: (i) a newform is an eigenvector of **every**
`Tₙ`, `n ≥ 1`, with `Tₙ f = λ_f(n) f` and `λ_f(n) = a_f(n)`, so `λ_f` is multiplicative with
`λ_f(m)λ_f(n) = Σ_{d ∣ (m,n)} χ(d) λ_f(mn/d²)`; (ii) **strong multiplicity one**: two forms
normalized newforms f of (N,χ,λ) and g of (M,ψ,μ) with equal prime coefficients
outside a finite set satisfy N = M, λ = μ, f = g and χ(a) = ψ(a) for every integer a.
The levels and archimedean parameters need not agree in advance. The normalized newforms
of (N,χ,λ) are an orthogonal basis of the newspace; their unit-norm rescalings form an
orthonormal basis. This is `IsNewform.eq_of_eventually_eq` in the acceptance file;
(iii) **multiplicity one in the newspace**: the joint eigenspace of the good `Tₙ` in
`S^{new}(N, χ, λ)` for a given eigenvalue system is at most one-dimensional, so by 4.3 every
newform is even or odd. The proof is the
weight-`0` transcription of the holomorphic argument (the Main Lemma: a form whose coefficients
`a_f(n)` vanish for `(n, N) = 1` is old; the rescaling dichotomy), with the role of the
`q`-expansion played by 2.4's injectivity of `f ↦ (a_f(n))`. Prove **(iv) the bad-prime values**
for trivial `χ`: for `p ‖ N`, `λ_f(p) = -η_p(f) p^{-1/2}` with `η_p(f) ∈ {±1}` the
`W_{p}`-eigenvalue, so `λ_f(p)² = 1/p` and `λ_f(p^k) = λ_f(p)^k`; for `p² ∣ N`, `λ_f(p) = 0`; and
for general `χ` the trichotomy: for p prime dividing N, write `N = p^α N'`, p∤N′,
α=v_p(N)≥1 and `χ = χ_p χ'`. Put c=v_p(cond χ). If `χ_p` is primitive modulo
`p^α` then `|λ_f(p)| = 1`; if `α = 1` and `χ_p` is trivial then `λ_f(p)² = χ'(p)/p`; if `α ≥ 2` and
`χ_p` is imprimitive then `λ_f(p) = 0`. Prove **(v) the Fricke sign**: for trivial `χ` a newform
satisfies `W_N f = ε_N(f) f` with `ε_N(f) = frickeSign N f = ∏_{p ∣ N} η_p(f) ∈ {±1}`, where `W_{p^{v_p(N)}} f = η_p(f) f`;
for general `χ`, `W_N f = c · f̄_ρ` with `f̄_ρ` the newform of `(N, χ̄, λ)` with conjugate coefficients
and `|c| = 1` (the pseudo-eigenvalue). Record the dictionary with the LMFDB: for a squarefree level
with trivial character every `λ_f(n)` is real, `f` is real-valued up to a scalar, and the stored
`a_p = ±p^{-1/2}` for `p ∣ N` has sign `-η_p(f)`.
*Needs:* 4.1–4.5, 2.4; AutomorphicLFunctionsAndLocalFactors AL.2.1.4, AL.2.2.4–AL.2.2.5 and AL.3.7.1; Atkin–Lehner 1970 and Atkin–Li 1978 for the shape of the argument.


Newform normalization and Fricke sign.

**Checks.**

- At a good prime with χ(p)=1 and a(p)=0, the second coefficient is a(p²)=−1.
- At prime level p=2 and Fricke sign −1, a(2)=1/√2 and a(4)=1/2; sign +1 instead gives a(2)=−1/√2.
- If p² divides N with trivial character, a(p)=0; at p exactly dividing N, a(p)²=1/p is nonzero.
- At N=5 the even primitive quadratic character has v₅(cond χ)=v₅(N)=1, giving |a(5)|=1; the trivial character has conductor exponent 0, giving |a(5)|=1/√5.
- At N=25 a primitive character has exponents (2,2), giving |a(5)|=1; a character induced from modulus 5 has exponents (2,1), giving a(5)=0.
- At N=10 with χ induced from the quadratic character modulo 5, p=2 has exponents (1,0) and χ′(2)=−1, so a(2)²=−1/2; replacing the character factor by 1 would give the wrong phase.
- For a nonzero trivial-character Fricke eigenform, eigenvalues +1 and −1 give signs +1 and −1 respectively; both signs square to 1. The zero function has chosen sign +1 but fails a(1)=1, so no newform is manufactured by this total definition.


- `IsNewform.heckeOperator_eq` identifies every positive-index eigenvalue with its coefficient.
- `IsNewform.fourierCoefficient_mul` gives the Hecke divisor sum.
- `IsNewform.norm_fourierCoefficient_of_conductor` gives modulus 1 when v_p(cond χ)=v_p(N)>0.
- `IsNewform.fourierCoefficient_sq_of_unramified` gives a(p)²=χ₀(p)/p when p exactly divides N and p does not divide cond χ, where χ₀ is `DirichletCharacter.primitiveCharacter` of χ; here χ₀(p)=χ′(p).
- `IsNewform.fourierCoefficient_eq_zero_of_conductor_lt` gives a(p)=0 when 2≤v_p(N) and v_p(cond χ)<v_p(N). The two trivial-character formulas are special cases.
- `frickeOperator_eq_frickeSign_smul` fixes `frickeSign` on newforms.
- `IsNewform.isEven_or_isOdd` gives parity from the one-dimensional good eigenspace.

(Booker–Lee–Strömbergsson, arXiv:1803.06016v2, §1.1, p.4, records the normalized newform basis and conductor uniqueness; the all-place comparison uses the newvector and strong-multiplicity-one results of AutomorphicLFunctionsAndLocalFactors AL.2.2.4 and AL.3.7.1.)

For (iv), the local conductor classification in Booker–Lee–Strömbergsson, Lemma 1.4
and its proof, pp.4–5, combines with the standard local factors of
AutomorphicLFunctionsAndLocalFactors AL.2.1.4 and its newvector comparison AL.2.2.4–AL.2.2.5.
If c=α, one inducing character is unramified and the other has conductor exponent α;
unitarity forces the unramified parameter to have modulus 1. If α=1,c=0, the local
representation is an unramified twist of Steinberg, giving a(p)²=χ′(p)/p. If α≥2,c<α,
both inducing characters are ramified, or the representation is ramified special or
supercuspidal, and the local standard factor is 1, so a(p)=0. The conductor satisfies
c≤α; thus these three cases exhaust bad primes, including p=2.

### 4.7 Self-duality and the conjugate form

Define conjugateForm f := conj ∘ f, prove it lies in `S(N, χ̄, λ)` with
`a_{conj ∘ f}(n) = conj(a_f(-n))`, so that `f̄_ρ := conj ∘ ιf` has coefficients `conj(a_f(n))`, is a
newform when `f` is, and IsSelfDual f := ∀ n, im(λ_f(n)) = 0 (the
modular-forms roadmap's predicate) holds for every newform with trivial character.
*Needs:* 4.3, 4.6.


Conjugate reflection `conjugateReflection`.

**Checks.**

- Pointwise conjugation sends coefficient a(1) to conjugate a(−1); for an odd normalized form this is −1.
- Conjugate reflection instead sends a(1)=1 to 1 for either parity.
- For a cubic character χ, its dual is χ̄=χ² rather than χ; for trivial χ the dual coefficients equal the original real coefficients.
- On the test function e(x)+i e(2x), pointwise conjugation has coefficients 1,−i at −1,−2, while conjugate reflection has them at 1,2; applying either operation twice recovers coefficients 1,i.
- A real coefficient sequence satisfies the self-duality predicate; a sequence with a(1)=1 and a(2)=i fails it because Im a(2)=1. Conjugate reflection changes that value to −1.



- Pointwise conjugation conjugates the nebentypus and reverses the coefficient index.
- Conjugate reflection conjugates coefficients without reversing their index.
- On newforms it preserves normalization and gives the dual form.


### Examples

At prime level 2 with Fricke sign −1, a(2)=1/√2 and a(4)=1/2.

### Dependencies

Layers 0–3; the native Hecke cosets, character slash sums and Fricke matrices; ModularForms Layers 3–6 as the newform template.

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
*Needs:* 0.4, 1.1, 2.4; CongruenceSpectralGap §5.3; Mathlib's `Gamma1_is_congruence`.


The gap normalization.

**Checks.**

- 3/16 = 75/400 and 21/100 = 84/400; the supplied bound is stronger.
- At the supplied lower endpoint 21/100 the complementary parameter is 1/5.
- The constant eigenfunction has λ=0 and is excluded by cuspidality.

### 5.4 Selberg's eigenvalue conjecture and the level-one theorem

Define SelbergEigenvalueConjecture N χ : Prop := ∀ λ, S(N, χ, λ) ≠ 0 → 1/4 ≤ λ, and
HasExceptionalEigenvalue N χ := ¬ SelbergEigenvalueConjecture N χ. Prove the **level-one
theorem**: for `f ∈ S(1, 1, λ)` nonzero, `λ ≥ 3π²/2`; hence SelbergEigenvalueConjecture 1 1.
Proof (Roelcke's bound, as in Iwaniec, *Spectral Methods*, Chapter 11): with `F` the standard
fundamental domain and `S := {|x| ≤ 1/2, y ≥ √3/2}`, one has `F ⊆ S ⊆ F ∪ S·F` (the part of `S`
below the unit circle lies in the image of `F` under `z ↦ -1/z`, since `|z ± 1| ≥ 1` there), so
`∫_S |f|² dμ ≤ 2‖f‖²` and `∫_S |∇f|² dx dy ≤ 2 ∫_F |∇f|² dx dy = 2λ‖f‖²`; on `S` the strip is a full
period for every `y`, so Parseval and the absence of a zero mode give
`∫_S |∂ₓ f|² dx dy ≥ 4π² ∫_S |f|² dx dy = 4π² ∫_S y² |f|² dμ ≥ 3π² ∫_S |f|² dμ ≥ 3π² ‖f‖²`; combining,
`2λ‖f‖² ≥ 3π²‖f‖²`. Prove also the converse direction of the dictionary: `λ > 1/4` for all cusp
forms at level one means every level-one spectral parameter is real, which is the hypothesis under
which §4.5's `NormalizedMaassEigenform(r, δ)` with real `r` exhausts the level-one Hecke eigenforms.
*Needs:* 1.1, 2.3, 2.4, 0.5; Mathlib's standard fundamental domain `ModularGroup.fd`.


The conjectural predicate and level-one bound.

**Checks.**

- At level one, 3π²/2 ≈ 14.80440660 > 1/4.
- The zero cusp space satisfies the universal conjectural predicate vacuously.
- A hypothetical nonzero eigenspace at λ = 1/5 satisfies positivity but falsifies the conjectural predicate.


- The conjectural predicate excludes every nonzero cusp eigenspace below 1/4.
- `levelOne_eigenvalue_ge` gives the stronger level-one bound.
- The negation is existence of an exceptional cusp eigenvalue, not a choice of spectral parameter.


### 5.5 The scattering matrix of `Γ₀(N)` and Weyl's law

For even χ, index channels by χ-regular cusps only. Choose width-one scalings τ_𝔞 and
construct E_𝔞(z,s;χ) = Σ over Γ_𝔞\Γ₀(N) conj(χ(d_γ)) Im(τ_𝔞⁻¹γz)^s for Re s > 1.
Prove convergence there, representative independence, transformation by χ and the
Laplace equation with eigenvalue s(1−s). Identify this series with the appropriate adelic
induced section in AutomorphicSpectralTheory §§2.4 and 4.3–4.4, retaining the cusp measure
and character weight; transport its meromorphic continuation and functional equation.
At a regular cusp 𝔟 its constant term is δ_𝔞𝔟 y^s + φ_𝔞𝔟(s;χ)y^(1−s).
Define the scattering matrix Φ from these coefficients. Irregular cusps have shifted
Fourier modes and contribute no scalar channel. For odd χ the automorphic space is zero
and neither this construction nor a positive Weyl asymptotic is asserted.
Prove the explicit
formula for trivial `χ` and squarefree `N`: each entry is a finite Dirichlet-series factor in `N` times
`√π Γ(s - 1/2) ζ(2s - 1) / (Γ(s) ζ(2s))`, and for general `N` and `χ` a finite combination of ratios
`L(2s - 1, ψ)/L(2s, ψ)` of Dirichlet `L`-functions; prove `det Φ(s; χ)` is meromorphic with
`|det Φ(1/2 + it)| = 1` and the integrated bound for φ = det Φ stated below, using the explicit Dirichlet
L-factorization, Stirling and the argument principle. No pointwise logarithmic-derivative
bound on Re s = 1 is assumed. Then prove **Weyl's law for the cuspidal
spectrum**: `cuspCount N χ (1/4 + T²) + M(T) = (vol/(4π)) T² + O(T log T)` with
`M(T) := (1/(4π)) ∫_{-T}^{T} -(φ'/φ)(1/2 + it; χ) dt = O(T log T)`, hence, for χ(−1) = 1,
`cuspCount N χ X ∼ (vol(Γ₀(N)\ℍ)/(4π)) X = ([SL₂(ℤ) : Γ₀(N)]/12) X` as `X → ∞`; at `N = 1` this is
`X/12`, AutomorphicSpectralTheory §4.9's `modular_weyl_estimates`, which is consumed there and
identified with the N = 1 specialization of the character comparison. The proof is the Selberg trace
formula for `(Γ₀(N), χ)` with a heat-kernel or Gaussian test function (the trace formula is
consumed from AutomorphicSpectralTheory Layer 6; the geometric side's hyperbolic and elliptic terms
are `O(T)`, the parabolic terms are `O(T log T)`), with the continuous-spectrum term the integral
of the logarithmic derivative of `det Φ`. Record the constants: `vol = π/3, π, 2π, 4π, 14π` for
`N = 1, 2, 4, 6, 26`.
For the character-general formulas use Booker–Lee–Strömbergsson,
arXiv:1803.06016v2, §2.7, (2.74)–(2.75), pp.30–31, Lemma 2.19, p.32, and §2.8,
Remark 2.27, (2.104), pp.38–39. Their conjugate congruence group and cusp scalings
must be transported to Γ₀(N) and the width-one coordinates above; their ordinary
scattering determinant in (2.104), rather than the reflection-parity determinant
in (2.103), supplies the full cusp space. The Weyl estimate is the adaptation of the
supplied trace formula with this determinant and its finite Dirichlet-factor expression.
*Needs:* 3.4; AutomorphicSpectralTheory §§1.23, 4.8, Layer 6; Mathlib's Dirichlet `L`-functions;
the character-general scattering factorization just cited.


Character scattering and Weyl asymptotics.

**Checks.**

- At N = 1 the scattering matrix is scalar and the Weyl constant is 1/12.
- For an even character at N = 3 the Weyl constant is 4/12=1/3; for the odd character the count is identically 0.
- At N = 9 with cubic χ, the cusp 1/3 has no channel because χ(4) ≠ 1; a scalar y^s term would require 1=χ(4).



- The character Eisenstein family transforms by χ and has channels only at regular cusps.
- The scattering matrix relates the y^s and y^(1−s) coefficients in width-one coordinates.
- `weyl_law` has the explicit even-character hypothesis; odd-character counting is zero.


### Examples

The even level-three Weyl constant is 1/3; the odd-character count is zero.

### Dependencies

Layers 0–3; CongruenceSpectralGap §5.3; AutomorphicSpectralTheory §§2.4, 4.3–4.4 and Layer 6.

## Layer 6: the `L`-function of a Hecke–Maass newform

### 6.1 The Dirichlet series and the Euler product

For a newform `f` of `(N, χ, λ)` define `lfunction f s := LSeries (n ↦ λ_f(n)) s` (Mathlib's
`LSeries`, which ignores `n = 0`). Construct the classical-to-adelic comparison for newforms at arbitrary positive level
and character, with the finite newvector and the archimedean parity/order fixed by §§2.3
and 4.6. Prove equality of local Whittaker coefficients and local factors at good and bad
places. Transport AutomorphicLFunctionsAndLocalFactors AL.3.6.1 to prove absolute
convergence for Re s > 1, unconditionally. Its positive Rankin–Selberg self-pair argument
(AL.3.5.3 and AL.3.6.1) also gives Σ |a(n)|² n^(−1−ε) < ∞ for every ε > 0;
Cauchy–Schwarz then bounds Σ |a(n)| n^(−σ) for every σ > 1 by choosing 0 < ε < 2σ−2.
Prove the **Euler product**
`L(s, f) = ∏_p (1 - λ_f(p) p^{-s} + χ(p) p^{-2s})^{-1}` on `Re s > 1` from the multiplicativity of
4.6 (i), and the bad-prime factors from 4.6 (iv): for trivial `χ` and `p ‖ N` the factor is
`(1 + η_p(f) p^{-1/2 - s})^{-1}`, and for `p² ∣ N` it is `1`.
*Needs:* 4.6, 2.4; AutomorphicLFunctionsAndLocalFactors AL.2.1.1, AL.2.2.4, AL.3.5.3, AL.3.6.1 and AL.R.1–AL.R.3; Mathlib's `LSeries` and Euler products.


The series and the coefficient comparison.

**Checks.**

- At s = 5/4 choose ε = 1/4: Cauchy–Schwarz uses the two convergent weighted series Σ|a(n)|²n^(−5/4) and Σn^(−5/4).
- At a bad prime with a(p)=0 the Euler factor is 1; at p exactly dividing N and sign −1 it is (1−p^(−s−1/2))⁻¹.
- The n=0 term contributes 0 under `LSeries`; a(1)=1 contributes 1.
- The zero coefficient sequence has series 0; a sequence supported at 1 has series a(1). With coefficients 1 and 2 at indices 1 and 2 and zero elsewhere, the series at s=2 is 1+2/4=3/2, distinguishing the index from its square.


- `lfunction_summable` gives unconditional absolute convergence on Re s>1.
- `lfunction_eulerProduct` includes ramified primes with their lower-degree factors.
- The positive self-pair comparison yields the weighted mean-square bound used for average growth.


### 6.2 The completed `L`-function, its continuation and functional equation

Define the gamma factor `γ(s) := Γ_ℝ(s + δ + ir) Γ_ℝ(s + δ - ir)` with `δ` the parity (4.3) and
`r` the spectral parameter (for an exceptional eigenvalue, `ir = -t` real, and the same formula),
and `completedLFunction f : ℂ → ℂ` as the function characterized on `Re s > 1` by
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
entire continuation `lfunctionContinuation f` agreeing with `LSeries` on `Re s > 1`, and that
`Λ(·, f)` vanishes nowhere on `Re s > 1` (the Euler product with the trivial bound), so by the
functional equation every zero of `Λ(·, f)` lies in `0 ≤ Re s ≤ 1`.
*Needs:* 6.1, 2.1 (v), 2.4, 4.3, 4.6; Mathlib's `mellin` and `WeakFEPair`.


Completion and functional equation.

- The completed function agrees with the gamma product on Re s > 1 for both spectral branches.
- `differentiable_completedLFunction` states entirety.
- `completedLFunction_functional_equation` includes the unit-modulus Fricke scalar and the conjugate-reflection form.

**Checks.**

- For even parity the Mellin constants are 4·2^(s−2)·(2π)^(−s) = π^(−s).
- For odd parity the restriction to the imaginary axis is 0 and its transverse derivative supplies the shifted gamma factors; at trivial character the root number is −ε_N.
- At λ = 1/5 the gamma shifts are δ±√(1/20); at the threshold they coincide at δ. For cubic χ the equation pairs χ with χ̄.
- The zero function has L-series 0 and completed function 0: the zero entire extension exists and is unique. On Re s>1 either branch in the total definition agrees with the same gamma product, without requiring a newform.


(Duke–İmamoğlu–Tóth (2016), §5, unnumbered “Spectral expansion” subsection, (5.8)–(5.9), pp.962–963, is the level-one comparison. The level/character extension uses the Fricke relation and the all-cusp decay proved here.)

### 6.3 Named hypotheses: Ramanujan–Petersson and the convexity bound

Define RamanujanPetersson N f : Prop := ∀ p, p ∤ N → |λ_f(p)| ≤ 2 and prove the implications that
hold: RamanujanPetersson N f → ∀ n, |λ_f(n)| ≤ τ(n) (from multiplicativity), a pointwise strengthening of §6.1’s unconditional absolute convergence; and that RamanujanPetersson N f is equivalent to the Satake
parameters `α_p, β_p` (the roots of `X² - λ_f(p) X + χ(p)`) having modulus `1` for every good `p`
(this uses `conj λ_f(p) = χ̄(p) λ_f(p)` from 4.2, which makes `χ(p)^{-1/2} λ_f(p)` real; the bound
`|λ_f(p)| ≤ 2` alone does not force unit-modulus roots when `χ(p) ≠ 1`).
The pointwise bound used here is 2.4's `|λ_f(p)| ≤ C_f p^{1/2}`, with a constant depending on
`f`; no bound with an absolute constant is a target (that is the Kim–Sarnak theorem, not owned
here). Define the **analytic conductor** `𝔮(f, s) := N · (|s + δ + ir| + 3)(|s + δ - ir| + 3)` and
`𝔮(f) := 𝔮(f, 1/2)`, the Iwaniec–Kowalski §5.1, (5.7), p.95 normalization that the modular-forms roadmap's
Layer 7 also pins.
*Needs:* 6.1, 6.2, 4.6.


Ramanujan and the analytic conductor.

**Checks.**

- At χ(p)=1 and a(p)=2, the roots are 1,1 and the recurrence gives a(p^k)=k+1.
- At χ(p)=−1 and a(p)=2, the roots 1±√2 are not unitary; this fails the adjoint phase law and is not a counterexample to the stated equivalence.
- At N=1, δ=r=0 and s=1/2 the analytic conductor is (7/2)²=49/4.
- At N=4, δ=r=0 and s=1/2 the conductor is 4·49/4=49; omitting the level loses this factor.
- At N=1, δ=1, r=0 and s=1/2 it is (9/2)²=81/4; omitting parity gives 49/4.
- At N=1, δ=0, s=1/2 and r=±1 both values are (3+√5/2)²=41/4+3√5; changing r to −r exchanges the two factors.


- The Ramanujan predicate concerns good primes; the bad-prime values are those of §4.6.
- Under that predicate, the Hecke recurrence bounds every positive coefficient by the divisor count.
- The analytic conductor has the stated positive shifts and is invariant under changing r to −r.


### 6.4 The card in the completed-`L`-function data model

Produce, for a newform `f` of `(N, χ, λ)`, an `AnalyticLFunctionData` of the L-functions roadmap's
Layer 0: coefficients `λ_f(n)` (norm-indexed over `ℚ`, so by `n`), conductor `N`, real gamma shifts
the multiset `{δ + ir, δ - ir}`, no complex shifts, root number `ε_N(f)(-1)^δ` for trivial `χ` and
the unit `c (-1)^δ` of 6.2 in general, completed function `Λ(·, f)`, empty polar divisor; prove its
degree is `2`, that it satisfies *Dirichlet-series agreement* on `Re s > 1` unconditionally, *meromorphic continuation with no poles*, the *functional equation
against the dual card* (whose coefficients are `conj λ_f(n) = λ_{f̄_ρ}(n)`, 4.7), and *average coefficient growth* (for every ε > 0, Σ_(n≤x)|a(n)| ≪_(f,ε) x^(1+ε), by §6.1); prove the card of `f̄_ρ` is the dual card, and that for trivial `χ` the card is
self-dual. Nothing about the card is defined twice: the data model, its predicates and its dual are
that roadmap's.
*Needs:* 6.1–6.3, 4.7; the L-functions roadmap, Layer 0.


The completed-function card.

**Checks.**

- Two real gamma shifts contribute degree 2; there are zero complex shifts.
- The normalized first coefficient is 1 and conductor N is positive; N=0 is excluded.
- At trivial character the dual card has the same coefficients; at cubic χ the coefficients and character are conjugated.



- The card has positive conductor, degree two and empty polar divisor.
- It meets Dirichlet-series agreement on the full half-plane required by the supplier.
- The card of conjugate reflection is the dual card, with conjugated coefficients and reciprocal root number.


### Examples

At s=5/4 the weighted Cauchy–Schwarz exponent can be 5/4 on both sides.

### Dependencies

Layers 2 and 4; AutomorphicLFunctionsAndLocalFactors AL.R.1–AL.R.3, AL.2 and AL.3.5–AL.3.6; LFunctions Layer 0.

## Layer 7: Maass forms on `PSL₂(ℤ[i])\H³`

### 7.1 The Laplacian on `H³`

On the Kleinian-groups carrier `H³` define
laplacianH3 f P := -(height P)² · Δℝ³(f ∘ coe)(P) + (height P) · ∂_y f(P), with `Δ_{ℝ³}`
Mathlib's Laplacian on `EuclideanSpace ℝ (Fin 3)` and `∂_y` the partial derivative in the third
coordinate, so that `Δ₃ f = -y²(∂²_{x₁} + ∂²_{x₂} + ∂²_y) f + y ∂_y f`. Prove the
sign check `Δ₃ y^s = s(2 - s) y^s`, invariance under the `PSL(2, ℂ)` action (`smul_def` of that
roadmap's Layer 0: translations, dilations and the inversion generate), symmetry on compactly
supported functions with respect to `volume` (density `y⁻³`), and the Dirichlet-integral formula
`∫ (Δ₃ f) ḡ dvol = ∫ y⁻¹ ⟨∇f, ∇ḡ⟩_{ℝ³} dx₁ dx₂ dy` for compactly supported `f, g`.
This coordinate adaptation uses the height and volume density y⁻³ from
KleinianGroups Layer 0. For the conformal coefficient matrix y²Id the divergence expression is
−y³ Σ_j ∂_j(y⁻¹∂_j f). Expanding the derivative gives the displayed operator,
and coordinate integration by parts gives the energy identity, using
`MeasureTheory.integral_mul_deriv_eq_deriv_mul_of_integrable`
(`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`, line 1372).
Invariance is the chain-rule calculation for the translations, positive dilations and
inversion in that supplier's coordinate action; it does not require constructing a new
Riemannian-volume comparison.
*Needs:* KleinianGroups Layer 0; Mathlib's Laplacian.


The H³ operator.

**Checks.**

- At s=0, Δ₃1=0; at s=1, Δ₃y=y.
- At s=2, Δ₃y²=0; at s=3, Δ₃y³=−3y³.
- The first derivative term is necessary: omitting y∂_y would give −2y² at s=2.


- The coordinate operator is the nonnegative hyperbolic Laplacian.
- Its energy form is symmetric on compactly supported smooth functions.
- It commutes with the supplied PSL₂(ℂ) action.


### 7.2 The carrier for the Picard group

With `Γ := bianchi ℚ(i) ι = PSL₂(ℤ[i])` (the Kleinian-groups roadmap's Layer 3, Gaussian
embedding), define IsMaassFormH3 λ f (`C^∞`, `Γ`-invariant, square-integrable on a fundamental
domain, `Δ₃ f = λ f`) and IsMaassCuspFormH3 λ f (additionally `∫_{ℂ/ℤ[i]} f(x + yj) dx = 0` for all
`y > 0` at the single cusp `∞`), and the submodules `M₃(λ)`, `S₃(λ)`. Prove the group has exactly one
cusp orbit (the class number of `ℤ[i]` is one: every element of `P¹(ℚ(i))` is `γ∞`), that the
stabilizer of `∞` in `Γ` is generated by the translations `x ↦ x + 1`, `x ↦ x + i` and the rotation
`x ↦ -x` (`diag(i, -i)`). For a nonzero Maass form prove `λ ∈ ℝ` and `λ ≥ 0`, and for a nonzero cusp form prove `λ > 0` (the argument of 2.5 on
`H³`), and that λ = 1 + r² for λ ≥ 1, with r = √(λ−1). For 0 ≤ λ < 1 use
t = √(1−λ), so λ = 1−t² and the Bessel order is t, including t = 1 for constants (knowl
`mf.maass.picard.eigenvalue`). Define the self-adjoint realization of `Δ₃` on `L²(Γ\H³)` and prove
self-adjointness, the cuspidal reducing subspace and its compact resolvent, by the route of
CongruenceSpectralGap §0.2 (Friedrichs closure of the energy on compactly supported smooth
functions, essential self-adjointness by cutoffs) and §0.5b (the cusp Fourier tail estimate and
local Rellich compactness) transcribed to `H³` (the cusp region is `{x ∈ ℂ/ℤ[i], y > Y}` with volume
`∫_Y^∞ y^{-3} dy < ∞`), hence the discreteness and finite multiplicity of the cuspidal spectrum.
*Needs:* 7.1; KleinianGroups Layer 1 (quotient and index law), Layer 3 (Gaussian group) and Layer 4 (`covolume_bianchiGaussian`); SelfAdjointSpectralTheory
Parts C–E; PDE Lane E; Tau Ceti's `RellichKondrachov`; CongruenceSpectralGap §§0.2 and 0.5b as the
template.


The Picard carrier and both parameter branches.

**Checks.**

- The constant 1 has λ=0, t=1 and 1−t²=0; the real-square-root formula would give 1+0=1.
- At λ=1 the order is 0; at λ=2, r=1 and 1+r²=2.
- The cusp integral of 1 on the unit torus is 1, so 1 lies in M₃(0) but fails S₃(0); the zero function lies in both.
- At λ=−1, Δ₃0=(−1)0=0, its norm squared and every torus integral are 0: zero lies in both M₃(−1) and S₃(−1), so positivity must require nonzeroness.
- If f is a nonzero Picard cusp eigenfunction at λ, then 2f has zero torus integral and the same eigenvalue; at μ≠λ the difference between the two eigen-equations is (λ−μ)f≠0. The cusp submodule includes 0 but cannot include f at μ.


- The Maass predicate bundles smoothness, invariance, L² integrability and the eigen-equation.
- The cusp predicate adds zero torus constant term at the sole cusp.
- The cuspidal restriction has compact resolvent; nonzero cusp eigenfunctions have positive eigenvalue.


### 7.3 The Fourier–Bessel expansion

For `f ∈ M₃(λ)` prove the expansion
`f(x + yj) = (constant term) + Σ_{0 ≠ n ∈ ℤ[i]} a_f(n) y K_{ir}(2π|n|y) e(Re(n x))`: the modes
`f_n(y) = ∫_{ℂ/ℤ[i]} f(x + yj) e(-Re(n x)) dx` satisfy `-y² f_n'' + y f_n' + 4π²|n|² y² f_n = λ f_n`,
whose solutions are y K_b(2π|n|y) and y I_b(2π|n|y), where b = ir for λ ≥ 1 and b = √(1−λ) otherwise (substitute `f_n = y h(2π|n|y)`), and
square-integrability excludes the second; the constant term is `α y^s + β y^{2-s}` (`α y + β y log y`
at `s = 1`). Prove `a_f(-n) = a_f(n)` (the rotation `diag(i, -i) ∈ Γ` acts by `x ↦ -x`), the trivial
bound `|a_f(n)| ≤ C_f |n|`, exponential decay of cusp forms, and injectivity of `f ↦ (a_f(n))` on
`S₃(λ)`. The `K`-Bessel function is §4.5's; the expansion is the knowl `mf.maass.picard.fourierexpansion`
with the pairing `Re(n x)` and no factor two.
*Needs:* 7.2, 2.1, 2.2's ODE analysis.


The Gaussian Fourier coefficients.

**Checks.**

- The pairing Re(n x) sends n=i to −x₂; replacing it by Re(conj(n)x) reverses this frequency.
- The translation x↦x+1 gives multiplier e(Re n)=1, and x↦x+i gives e(−Im n)=1 for Gaussian n.
- Rotation x↦−x forces a(−n)=a(n). At λ=1 the nonzero mode is yK₀; at λ=0 it is yK₁.
- On the unit torus, the mode of 1 at n=0 is 1 and at n=1 or i is 0. The mode of e(x₁) at n=1 is 1 and at n=i is 0; e(−x₂) instead has mode 1 at n=i. Omitting conjugation conventions in the pairing exchanges the latter frequency with −i.


- The coefficients use the Re(n x) pairing and the kernel yK_b.
- The growing mode is excluded by L² integrability.
- The coefficient sequence determines a cusp form and is invariant under n↦−n.


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
`x ↦ -x` is in `Γ`), `T_{in} = R T_n = T_n R`, that `T_n` preserves `M₃(λ)` and `S₃(λ)`, the coefficient
formula `a_{T_n f}(ν) = Σ_{a ∣ (n, ν) mod units} a_f(ν n/a²)` for ν≠0 (well defined by `a_f(-m) = a_f(m)`), the
relations `T_m T_n = Σ_{d ∣ (m, n) mod units} T_{mn/d²}` for `m, n` with `T_m, T_n` both depending
only on the ideals when restricted to the `R`-even subspace, self-adjointness of `T_n` on
`R`-even forms, and simultaneous diagonalization on each finite-dimensional `S₃(λ)^{R = 1}`. On an
`R`-even Hecke eigenform with `a_f(1) = 1` define `λ_f(𝔫) := a_f(n)` for `𝔫 = (n)`, prove
`T_n f = λ_f((n)) f`, multiplicativity over ideals, and `λ_f((n)) λ_f((m)) = Σ_{𝔡 ∣ (m, n)} λ_f((mn)/𝔡²)`.

The element-indexed operator, its self-adjointness, commutativity, product law and
simultaneous eigenfunctions are the unnumbered Hecke formulas in Then,
*Arithmetic quantum chaos of Maass waveforms*, arXiv:math-ph/0305048v2, §5, p.24
(then-arithmetic-quantum-chaos line 798, line 805, line 818 and line 825).
Then chooses d in `Re d > 0, Im d ≥ 0`, one representative modulo all four units;
this is the same divisor choice as the sum above, with `1/|n| = N(n)⁻¹ᐟ²`.
His §3, (1), p.10 uses exactly `e(Re(βx))` and `y K_{ir}`, so no conjugation
of the frequency or factor-two rescaling is needed. His scalar product on p.10
is conjugate-linear first; reverse its arguments for our Petersson convention,
which preserves the adjoint identity. Ideal indexing is taken only after imposing
R=1; the element-indexed operator at i is R, not the identity on the full space.

For the coefficient formula, substitute §7.3’s expansion into the triangular sum:
the sum of `e(Re(βb/d))` over b modulo d is N(d) if d divides β and zero otherwise.
Writing β=dη gives output frequency ν=aη and input index β=νn/a²; the height
and normalization multiply to `N(d) * (|a|/|d|) / |n| = 1` because ad=n≠0.
This derives the displayed coefficient law from Then’s §3, (1), p.10 and §5’s
operator formula, p.24 (then-arithmetic-quantum-chaos line 320 and line 798),
with the unit independence supplied by a(−ν)=a(ν). The adjoint can also be read
from invariant-measure change of variables: the inverse of α/√n is
adj(α)/√n, and adjugation permutes the integral determinant-n correspondences.
The commuting self-adjoint restrictions on the finite-dimensional R-even cusp
eigenspace then admit a joint orthonormal basis by
`LinearMap.IsSymmetric.iSup_iInf_eq_top_of_commute`.
*Needs:* 7.2 (invariant quotient measure and finite-dimensional cusp eigenspaces),
7.3 (Fourier expansion and coefficient uniqueness); the Euclidean domain structure
of `GaussianInt`; Mathlib’s `AddChar.sum_eq_zero_of_ne_one`,
`AddChar.sum_eq_card_of_eq_one` and
`LinearMap.IsSymmetric.iSup_iInf_eq_top_of_commute`.


Gaussian symmetries and Hecke operators.

**Checks.**

- At n=1, T₁=Id on both R-parities, while T_i=R has eigenvalues +1 on the R-even space and −1 on the R-odd space.
- R² sends x to −x, an element of the Picard action; hence R²=Id on invariant functions.
- Changing a divisor a by i changes νn/a² by a sign, which leaves the coefficient unchanged. Ideal indexing of T_n itself requires R=+1.
- For d=1+i the residue representatives 0,1 give character sum 1+e(Re(1/(1+i)))=1−1=0 at β=1, but 1+1=2=N(d) at β=d. For a=1 the normalization and height factor is 2/(√2·√2)=1; missing either factor changes the coefficient law.
- At m=n=1+i the product law has two terms, `T_(2i) + T_1`; its coefficient at ν=1 is a(2i)+a(1). At m=n=i it gives `T_(-1)=Id=R²`, whereas T_i itself remains −Id on R-odd forms.
- On local test functions invariant under x↦−x, x₁²+x₂² has (R,J) signs (+1,+1), x₁²−x₂² has (−1,+1), and x₁x₂ has (−1,−1). The polynomial x₁x₂(x₁²−x₂²) has (+1,−1); thus neither involution can be replaced by the other or by the identity. These are coordinate tests, not claims of Picard automorphy.


- R and J are commuting isometric involutions preserving the cusp eigenspace.
- The coefficient transformations fix the chosen Gaussian pairing.
- The element-indexed Hecke action obeys the unit rule; only its R-even restriction is ideal indexed.


### 7.5 The `L`-function of a Hecke–Maass form on `PSL₂(ℤ[i])`

For an `R`-even normalized Hecke eigenform `f ∈ S₃(λ)` define `L(s, f) := Σ_{𝔫 ≠ 0} λ_f(𝔫) N𝔫^{-s}`
(as an `LSeries` over the norm, `n ↦ Σ_{N𝔫 = n} λ_f(𝔫)`), prove absolute convergence for
`Re s > 3/2` from the trivial bound (`|a_f(n)| ≤ C_f |n| = C_f N𝔫^{1/2}`), the Euler product over Gaussian primes
`∏_𝔭 (1 - λ_f(𝔭) N𝔭^{-s} + N𝔭^{-2s})^{-1}`, the completed function
`Λ(s, f) := 16^{s/2} Γ_ℂ(s + ir/2) Γ_ℂ(s - ir/2) L(s, f)`, `Γ_ℂ(s) = 2(2π)^{-s}Γ(s)`, conductor
`|d_{ℚ(i)}|² = 16`, its entire continuation from Λ(s,f) = 4∫₀∞ f(yj)y^(2s−2)dy.
Indeed, each ideal has four generators and
∫₀∞ y^(2s−1)K_ν(2π|n|y)dy = (1/4)π^(−2s)|n|^(−2s)Γ(s+ν/2)Γ(s−ν/2)
for 2 Re s > |Re ν| (DLMF 10.43.19). Thus the four-unit sum cancels 1/4,
whereas the completed gamma/conductor product is four times that integral.
Inversion [0,−1;1,0] fixes the automorphic function and sends y to 1/y, giving
Λ(s,f) = Λ(1−s,f). A J-odd form has a(1) = −a(1) = 0, and hence cannot be one
of the normalized Hecke eigenforms specified here; restriction to the geodesic is not
claimed to recover an arbitrary J-odd cusp form. For complementary eigenvalues replace
ir by √(1−λ) throughout;
produce the degree-`4` card in the L-functions roadmap's data model with complex gamma shifts
`{ir/2, -ir/2}`.
*Needs:* 7.3, 7.4, 2.1 (v); the L-functions roadmap, Layer 0.


The norm-indexed Picard L-function.

**Checks.**

- At s=r=1 the gamma product Γ(1+i/2)Γ(1−i/2) is 0.6825694503; using shifts ±i gives 0.2720290550.
- For n=1 the scaled Mellin integral is 0.01728968616, equal to the first gamma product divided by 4π².
- Four Gaussian units cancel the 1/4 in the integral; conductor 16 and two complex gamma factors then give Λ=4 times the vertical integral. A J-odd form has a(1)=−a(1)=0 and fails the normalization a(1)=1.



- The Dirichlet coefficients are summed over ideals of a fixed positive norm.
- The gamma shifts are half the Bessel order, with complex degree four.
- The vertical Mellin comparison fixes the factor four, continuation and inversion equation.


### Examples

The constant Picard form has complementary parameter 1; the R-odd unit Hecke operator T_i acts by −1.

### Dependencies

KleinianGroups Layers 0–1, 3 and 4; Layer 2; Fourier analysis in two variables; PDE Lane E and SelfAdjointSpectralTheory Parts C–E; LFunctions Layer 0.

## Layer 8: the LMFDB layer

### 8.1 The invariant dictionary

Collect the correspondence between the section's columns and the definitions above, as named
functions of a newform `f` of `(N, χ, λ)`: `level f := N`; `weight f := 0` (the only weight the
section stores; 0.1 gives `k ≠ 0` its meaning); `character f := χ` (its Conrey label is
not a target); the nonexceptional spectral parameter is `spectralParameter λ` for λ ≥ 1/4;
for 0 < λ < 1/4 record the imaginary parameter i√(1/4−λ) (1.2);
`symmetry f := parity f` (4.3); `fricke_eigenvalue f := ε_N(f)` for trivial `χ` (4.6 (v)), undefined
otherwise (the page shows it only when `conrey_index = 1`); `coefficients f := (λ_f(n))_{n ≥ 1}` with
`λ_f(1) = 1` (4.6 (i)); self_dual f := IsSelfDual f (4.7); `cusp_width σ := w_σ` (0.4); the
Laplace eigenvalue `λ = 1/4 + R²` (`mf.maass.mwf.eigenvalue`); the multiplicity `dim S(N, χ, λ)`
(3.4). Prove the two display identities the page code uses for squarefree level and trivial
character: `λ_f(p^k) = (-η_p(f))^k p^{-k/2}` for `p ∣ N` (so `a_4 = 1/2` when `2 ∣ N`), and
`λ_f(n) = λ_f(n') ∏_{p ∣ N} λ_f(p)^{v_p(n)}` with `n'` the part of `n` prime to `N`.
*Needs:* Layers 1–6.


Invariant fields.

**Checks.**

- At λ=5/4 the real parameter is 1; at λ=1/5 the stored mathematical branch is i/√20.
- For squarefree N with 2 dividing N, either local sign gives a(4)=1/2.
- At nontrivial character there is no real Fricke-sign field; the pseudo-eigenvalue is a complex unit.


- The level and character come from normalized newform uniqueness.
- The parameter field distinguishes real and complementary branches.
- Parity, Fricke sign and coefficient fields use the invariants of Layer 4.


### 8.2 The intrinsic label prefix and the boundary with labels

Define IntrinsicPrefix f := (N, 0, χ) and prove it is an isomorphism invariant of the newform
(determined by the function `f`: `N` is the minimal level by 4.6 (ii), `χ` by the automorphy law).
State the boundary: the label `N.k.a.m.d` of `mf.maass.label` consists of the prefix (`N`, `k`,
the Conrey index `a` of `χ`) followed by the **spectral index** `m`, the position of `λ` in the
increasing list of cuspidal eigenvalues of `(N, χ)` (an ordering of the discrete set of 3.4; the knowl
`mf.maass.spectral_index` reserves `0` for `λ = 1/4` and indexes exceptional eigenvalues separately,
in base `26`), and the index `d`
among the newforms of `(N, χ, λ)` under the lexicographic ordering of `(Re λ_f(n), Im λ_f(n))_{n ≥ 1}`;
`m` and `d` are orderings and are not targets; the theorems they rest on, `cuspCount` (3.4) and
4.6 (ii)'s separation of newforms by their coefficient sequences, are this roadmap's. Define
MultiplicityOne N χ : Prop := ∀ λ, ∀ f g, IsNewform N χ λ f → IsNewform N χ λ g → f = g and record that the knowl
`mf.maass.label` conjectures it for squarefree level (stated there without a condition on `χ`; the
second family below shows it needs one, and this roadmap reads it for trivial `χ`), so `d = 1` for
every form that conjecture covers, and that
it fails in the three families the knowl `mf.maass.mwf.dimension` lists (oldspaces, quadratic
factors of `χ`, `9 ∣ N`), which is a statement about `dim S(N, χ, λ)`, not about newforms, and is not
claimed here beyond the oldspace case, which 4.5 exhibits (`B_1 f` and `B_p f` for a level-`M`
newform and `N = pM`).
*Needs:* 8.1, 4.5, 4.6, 3.4.


Intrinsic prefix and spectral simplicity.

**Checks.**

- For any normalized level-one newform the prefix is (1,0,1).
- Two distinct newforms with different prime coefficients may share λ; strong multiplicity one does not prove spectral simplicity.
- The level-raised form f(2z) has a(1)=0, so it cannot be used as a normalized newform witnessing simplicity failure.


- The intrinsic prefix is determined by the normalized function.
- Spectral multiplicity is a distinct conjectural condition from strong multiplicity one.
- Indexing labels does not add a theorem asserting spectral simplicity.

(Humphries, arXiv:1502.06885v3, §1.1, Theorem 1.1, pp.1–2, treats spectral multiplicity at odd nonsquarefree level with principal character; it does not assert failure of strong multiplicity one.)

### 8.3 Spectral estimates for rigorous Maass data

The rigorous database records spectral intervals, symmetry, coefficient error bounds and,
for trivial character, Fricke signs; it also records ranges with asserted spectral counts.
Their mathematical background is the following two spectral estimates.
Prove (i) `exists_eigenvalue_near`: if `g`
is nonzero, smooth, cuspidal and automorphic at N > 0, belongs to the operator domain
(g and Δg are square-integrable), and η ≥ 0 with `‖(Δ - λ₀) g‖ ≤ η ‖g‖` in the
Petersson norm, then some cuspidal eigenvalue lies in `[λ₀ - η, λ₀ + η]` (the resolvent bound `‖(Δ - λ₀)⁻¹‖ ≤ dist(λ₀, spec)⁻¹` of SelfAdjointSpectralTheory
Part D, applied to the cuspidal restriction); (ii) work in a closed symmetry/Hecke subspace of L²_cusp(N,χ) preserved by Δ.
Suppose the spectral projection P onto an interval has rank one, with eigenvalue λ*,
and the remaining spectrum has distance at least d > 0 from λ₀. For a domain vector g
with ‖g‖ = 1 and residual at most η < d, put q = η/d. Then ‖g−Pg‖ ≤ q and
‖Pg‖ ≥ √(1−q²). For each requested coefficient use a bounded linear functional ℓ_n
on this Hilbert space, with ‖ℓ_n‖ ≤ C_n, and suppose |ℓ_1(g)| ≥ b > C_1 q.
Set v = Pg/ℓ_1(Pg). It is the unique eigenvector in that line normalized by ℓ_1(v)=1,
and for every n
`|ℓ_n(v) − ℓ_n(g)/ℓ_1(g)| ≤ C_n q/(b−C_1 q) + |ℓ_n(g)| C_1 q/(b(b−C_1 q))`.
Construct the ℓ_n by integrating the nth cusp mode against a compactly supported smooth
height test in an embedded cusp band with nonzero Bessel pairing at λ*; divide by that pairing so ℓ_n(v)=a_v(n).
The test and its denominator are specified for the isolated λ*, and C_n is its L² dual norm.
The error for g concerns these bounded mode measurements, not the infinite-height limit
coefficient of an arbitrary noneigenfunction. Isolation and the nonzero pairing must be
proved to apply the estimate. This is a spectral-projection estimate with a stated
normalization denominator (compare Seymour-Howell, arXiv:2201.08760v2, §2.3, pp.3–4, (3)–(4)).
The LMFDB's rigorous table reports existence and isolation of normalized forms with
specified error bounds, and counts with multiplicity for its completeness ranges
(knowl `rcs.rigor.maass_rigor`). These are interpretations of the stored data;
the construction targets here are the two spectral estimates, and no particular decimal
is asserted to be a spectral parameter.
*Needs:* 3.4, 4.6; SelfAdjointSpectralTheory Part D.



Interval assertions and residual estimates.

- The interval assertion includes existence and uniqueness; the counting assertion counts multiplicities.
- `exists_eigenvalue_near` requires positive level and a nonzero operator-domain vector.
- Coefficient recovery requires a rank-one projection, positive spectral separation and a quantitative nonzero first coefficient.

**Checks.**

- With g=0, λ₀=−1 and η=0 the residual is 0 but no nonnegative eigenvalue equals −1; the nonzero-vector hypothesis excludes this.
- For an exact nonzero eigenvector, η=0 yields distance 0 from its eigenvalue, q=0 and coefficient-error bound 0.
- For A=diag(1,2), g=(1,1), the full-interval projection is g but Ag=(1,2); its rank is 2 and fails rank-one isolation.
- At C_n=C_1=b=1, q=1/10 and |ℓ_n(g)|=1, the bound is 2/9; at b=C_1q its denominator is 0, which the strict hypothesis excludes.
- A count assertion with k=0 means no eigenvalues in the range, not an eigenvalue at its midpoint; intervals with negative radius carry no existence claim.



(Booker–Strömbergsson–Venkatesh, §3, Proposition 1 and Remark (2), p.9, separates eigenvalue certification from uniqueness; the estimate here adds explicit rank-one isolation and bounded coefficient measurements.)

### Examples

A zero residual for a nonzero eigenvector gives zero eigenvalue distance; a rank-two projection supplies no unique eigenvector.

### Dependencies

Layers 1–6 and SelfAdjointSpectralTheory Part D.

## Downstream consumers

The completed-function cards feed LFunctions Layer 0; the classical spectral and coefficient
comparisons supply mathematical semantics for Maass-form invariants and rigorous error bounds.
These are outgoing uses, not additional suppliers.

## Worked examples

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
  is `N`), and `λ = 0` is excluded for nonzero cusp forms (2.5). At level one and Re s > 1,
  the Eisenstein series E(z,s) is smooth and invariant, with ΔE = s(1−s)E, but its
  constant term y^s + φ(s)y^(1−s) is not square-integrable. At s=2 the leading term
  alone has squared cusp integral ∫₁^Y y² dy = (Y³−1)/3, tending to infinity.
  In contrast, continuation gives E(z,0)=1, with Δ1=0 and quotient norm squared π/3;
  its cusp norm squared is ∫₁^∞ y⁻² dy=1. It belongs to M(1,1,0) and is not cuspidal
  (Duke–İmamoğlu–Tóth, §5, (5.3)–(5.5), p.962). For an odd
  character `χ` modulo `N`, `S(N, χ, λ) = 0` for every `λ` (0.3). For `N = 9` and an even character
  of order `3`, the cusp `1/3` is irregular (0.4), and the cusp condition there is vacuous. A level-`1`
  form `f` and `f(2z) ∈ S(2, 1, λ)` is old, not new (4.5), and `λ(2)` of `f(2z)` is not defined by
  `a(2)/a(1)` since `a_{f(2·)}(1) = 0`. A nonzero holomorphic cusp form `F ∈ S_k(Γ₀(N))`, with k > 0, gives
  `y^{k/2} F ∈ A(N, 1)` only for the weight-`k` law, not for weight `0`; it is not in any
  `M(N, 1, λ)`. For F=0 the lift is zero and belongs to every Maass submodule. The search `level = 4` returns no form: the rigorous table holds squarefree levels only
  (the completeness of a stored list is not a target), not a theorem that `S(4, 1, λ) = 0`.
- **Constants** (0.5, 5.3, 5.4, 5.5): `[SL₂(ℤ) : Γ₀(N)] = 1, 3, 4, 6, 6, 12, 12, 12, 20, 24, 42, 102, 192`
  for `N = 1, 2, 3, 4, 5, 6, 9, 11, 19, 23, 26, 101, 105`; cusp counts `1, 2, 2, 3, 2, 4, 4, 2, 2, 2, 4, 2, 8`;
  widths of `Γ₀(4)`: `4, 1, 1` at `0, 1/2, ∞`; of `Γ₀(12)`: `12, 3, 4, 3, 1, 1` at `0, 1/2, 1/3, 1/4, 1/6, ∞`;
  `[Γ̄₀(N) : Γ̄₁(N)] = 1, 1, 1, 1, 2, 1, 3` for `N = 1, …, 7` (the Petersson rescaling of 0.5);
  `3/16 = s(1-s)` at `s = 3/4`; `3/16 = 75/400 < 84/400 = 21/100` and `1/4 - 21/100 = (1/5)²` (5.3);
  `3π²/2 = 14.804…`; Weyl's constant at level one `1/12`.
- **Picard group** (Layer 7): `vol(PSL₂(ℤ[i])\H³) = G/3 = 0.3053218…` with Catalan's constant
  `G = 0.9159655941…` (consumed); one cusp; `Δ₃ y^s = s(2-s)y^s`; λ = 1 + r² for λ ≥ 1, or λ = 1−t² for 0 ≤ λ < 1.

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
Layer 7 (Picard group)                                 → KleinianGroups L0/L1/L3/L4, 2.1, templates of Layers 1–4, 6 and CongruenceSpectralGap §§0.2, 0.5b
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
  with character; arXiv:1803.06016v2, §1.1, pp.3–4, for 4.5–4.6.
- D. Bump, *Automorphic Forms and Representations*, Cambridge Studies in Advanced Mathematics 55,
  1997, §1.9 (Maass forms: the Fourier expansion, Hecke operators, the `L`-function and its
  functional equation at level one), §2.1 (Maass forms and the spectral problem).
- W. Duke, Ö. Imamoğlu and Á. Tóth, *Geometric invariants for real quadratic fields*, Ann. of Math.
  184 (2016), 949–990, §5, unnumbered “Spectral expansion” subsection, (5.7)–(5.9), pp.962–963: the factor-two normalization, through AutomorphicFormsOnReductiveGroups §4.5.
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
  §5.1 (the analytic conductor, (5.7), p.95), Chapter 15 (Maass forms and their `L`-functions).
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
- H. Then, *Arithmetic quantum chaos of Maass waveforms*, arXiv:math-ph/0305048v2
  (2004), §3, (1), p.10 (Fourier and inner-product conventions), and §5, p.24
  (unnumbered element-indexed Hecke operator, adjoint, product and eigenvalue formulas),
  for §7.4; cited numbering is that of this arXiv version.
- A. Seymour-Howell, *Rigorous computation of Maass cusp forms of squarefree level*, Res. Number
  Theory 8 (2022), art. 83 (arXiv:2201.08760v2), the source the LMFDB's `rcs.source.maass_rigor` knowl
  cites for the rigorous table; the certificate semantics of 8.3.
- The LMFDB: the section `lmfdb/maass_forms` (`web_maassform.py`, `main.py`), the knowls
  `mf.maass.mwf.*`, `mf.maass.spectral_index`, `mf.maass.label`, `mf.maass.picard.*`,
  `rcs.rigor.maass_rigor`, `rcs.cande.maass_rigor`, and the pages of the forms `1.1`, `1.3`,
  `2.1`, `19.205`, `26.1`.
