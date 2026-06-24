# Roadmap: modular forms — Hecke theory, newforms, L-functions, and modular curves

Mathlib has the *foundations* of modular forms — `SlashInvariantForm`, `ModularForm`,
`CuspForm` and their classes (`Mathlib/NumberTheory/ModularForms/Basic.lean`), the slash
action (`SlashActions.lean`), the congruence subgroups `Γ(N)`, `Γ₀(N)`, `Γ₁(N)`
(`CongruenceSubgroups.lean`), Eisenstein series and `E₄, E₆`
(`EisensteinSeries/*`), the `q`-expansion and `cuspFunction`
(`QExpansion.lean`), the Petersson integrand (`Petersson.lean`), the cusp-form submodule,
`Δ`, `η`, and the level-one dimension formula (`DimensionFormulas/LevelOne.lean`). It has
**no Hecke operators**, no theory of **eigenforms / newforms / oldforms**, no
**L-function of a modular form**, no **valence formula**, no **modular curves** as Riemann
surfaces, and no **general dimension formulas**. We build the arithmetic theory of modular
forms on top of Mathlib's analytic foundation.

This is a large roadmap with an aspirational summit: the **modular curves** `X(Γ)`, defined
properly as **moduli problems** of elliptic curves with level structure and shown to be
**representable** (following Katz–Mazur), whose complex points are then proved to form the
analytic quotients `Γ\ℍ`; and the **dimension formulas** for `M_k(Γ)`, proved *both*
classically (the valence formula plus counts of elliptic points and cusps) *and* via
**Riemann–Roch** on `X(Γ)`, the way Diamond–Shurman do it in Chapter 3. Both the
moduli/representability of modular curves and the Riemann–Roch development are genuinely
absent from Mathlib, so they sit at the far horizon, behind everything else.

Suggested home: `TauCeti/NumberTheory/ModularForms/`.

A large, `sorry`-free body of this theory already exists in the AINTLIB `LeanModularForms`
project (~260 source files). This roadmap specifies the **mathematics**; the file-by-file
migration map is in the secondary *Provenance* section and in `Targets.lean`. Porting it
into `TauCeti/` is the opportunity to restate everything in Mathlib's vocabulary and to
**clean up** — the project's own audits estimate that the newform and eigenform/SMO subtrees
alone carry ~30–36% redundancy (parallel `ModularForm`/`CuspForm` chains, dead scaffolding,
near-duplicate `slash` variants) that consolidates on the way in.

## Standing hypotheses and conventions

Spell hypotheses out; **do not** bundle "a modular form with all its invariants" into one
class. Pin these conventions before writing code — implementors make bad, divergent choices
otherwise.

- **Levels and characters.** Work with `Γ₁(N) ≤ Γ ≤ Γ₀(N)` and Dirichlet characters
  `χ : DirichletCharacter ℂ N` (`= MulChar (ZMod N) ℂ`, Mathlib's notion — use it, do not
  reinvent). The space with **nebentypus** `χ` is `M_k(N, χ) = M_k(Γ₁(N), χ)`, the
  `χ`-eigenspace of the diamond operators inside `M_k(Γ₁(N))`. Reserve `M_k(Γ)` for a bare
  congruence subgroup.
- **The weight-`k` slash.** Use Mathlib's `SlashAction`/`ModularForm.slash` and its `k` and
  `GL₂(ℝ)⁺`/`GL₂(ℚ)⁺` conventions throughout; the Hecke double-coset operators are built
  from it. ⚠ Two normalizations of the Hecke action circulate (Shimura's vs Diamond–
  Shurman's, differing by a power of the determinant); **pin Diamond–Shurman's** as primary,
  and provide the Shimura-normalized action as a named bridge (AINTLIB has both via
  `ShimuraHom`), so the half-integral-weight / Shimura-correspondence work downstream can use
  it without a silent reconvention.
- **Normalized eigenforms.** An eigenform is `normalized` when `a₁ = 1`; a **newform** is a
  normalized eigenform in the new subspace. State eigenvalue results for normalized forms, so
  that `Tₙ f = aₙ(f) · f` (Hecke eigenvalue = Fourier coefficient).
- **Coefficient field.** The coefficient field of a newform is
  `K_f = ℚ(aₙ : n ≥ 1) ⊆ ℂ`, an `IntermediateField ℚ ℂ`. It is a *number field* (a theorem,
  Layer 8), not an assumption.
- **`q`-expansions are the computational interface.** State Hecke recurrences, Euler
  products, and eigenform characterizations on the Fourier coefficients `aₙ(f)` via
  `qExpansion`, not on bespoke coefficient types.

## What Mathlib already has (consume)

- **Forms and classes:** `ModularForm Γ k`, `CuspForm Γ k`, `SlashInvariantForm`,
  `ModularFormClass`, `CuspFormClass`, the `ℂ`-module structures, `ModularForm.mul`, `E₄`,
  `E₆`, `Δ`, `η` (`NumberTheory/ModularForms/*`).
- **Congruence subgroups:** `CongruenceSubgroup.Gamma`, `Gamma0`, `Gamma1`, and the maps
  between them (`CongruenceSubgroups.lean`).
- **The upper half-plane and the `SL₂` action:** `UpperHalfPlane`, the Möbius action, the
  fundamental domain and proper discontinuity (`Analysis/Complex/UpperHalfPlane/*`,
  `ModularForms/ProperlyDiscontinuous.lean`).
- **`q`-expansions and cusps:** `qExpansion`, `cuspFunction`, `BoundedAtCusp`, the bounds
  `|aₙ| = O(n^{k})` / `O(n^{k/2})` substrate (`QExpansion.lean`, `Bounds.lean`).
- **Eisenstein series:** `eisensteinSeries`, `gammaSet`, the level-`Γ(N)` series and their
  `q`-expansions (`EisensteinSeries/*`).
- **Petersson integrand:** `petersson k f f' τ` (`= conj (f τ) · g τ · (im τ)^k`-style),
  the pointwise pairing (`Petersson.lean`).
- **Dirichlet characters:** `DirichletCharacter`, conductor, primitivity, `changeLevel`,
  Gauss sums, the Dirichlet L-function with its functional equation
  (`NumberTheory/DirichletCharacter/*`, `LSeries/*`).
- **L-series substrate:** `LSeries`, `LSeriesSummable`, `LSeriesHasSum`, abscissa of
  convergence, and the Euler-product API (`riemannZeta_eulerProduct`,
  `LSeries/Dirichlet.lean`, `EulerProduct/*`).
- **Number fields:** `NumberField`, `IntermediateField`, the Galois theory of `ℚ̄/ℚ` — the
  target of the coefficient-field layer.

## What is missing (build here)

The valence formula at general level; the Hecke operators `Tₙ`, `Tₚ`, the diamond operators
`⟨n⟩`, and the (commutative) Hecke algebra acting on `M_k(N,χ)`; the Petersson inner
product as an actual inner product and the self-adjointness of `Tₙ` for `(n,N)=1`; the
old/new decomposition and its orthogonality; eigenforms, newforms, oldforms, primitive
forms; the Main Lemma, the conductor theorem, and **strong multiplicity one**; Atkin–Lehner
and Fricke operators and their signs; the L-function of a modular form with its **Euler
product**, **completed form**, **functional equation**, and **analytic continuation**; the
**coefficient field** and the proof that it is a number field; the LMFDB invariants (Satake
parameters, Hecke characteristic polynomials, Galois orbits, labels, …); **modular curves**
as representable moduli problems (Katz–Mazur) whose complex points are the quotients `Γ\ℍ`,
with their cusps, elliptic points, and genus; and the **dimension formulas** for `M_k(Γ)` and
`S_k(Γ)`, by both the valence-formula route and the Riemann–Roch route. None of this is
upstream.

---

## The build, in layers

The ordering is the dependency order; independent lanes (e.g. L-functions vs. modular
curves) can proceed in parallel once their inputs exist. As each layer makes the next
layer's *types* expressible in `TauCeti/`, its milestones go into `Targets.lean` (with
`sorry`). Embedded Lean below sketches signatures; it is illustrative, not required to
compile.

### Layer 0: modular forms with character (nebentypus)
- **Modular forms with character `M_k(N, χ)` and `S_k(N, χ)`**, defined *intrinsically* by
  the character transformation law — generalizing Mathlib's `ModularForm Γ k`, not carved out
  as an eigenspace after the fact:
  ```lean
  -- f is Γ₁(N)-modular of weight k and transforms by χ under Γ₀(N):
  --   f ∣[k] γ = χ(d_γ) • f   for every γ ∈ Γ₀(N),  d_γ = lower-right entry mod N
  def ModularFormWithChar (N : ℕ) (k : ℤ) (χ : DirichletCharacter ℂ N) : Type  -- and S_k(N, χ)
  ```
  These spaces are the general setting for the entire roadmap; all of the Hecke, Petersson,
  and eigenform theory below lives on them. The **diamond operators `⟨d⟩` are not primitive
  here** — they enter in Layer 2 as elements of the Hecke algebra, and the decomposition
  `M_k(Γ₁(N)) = ⨁_χ M_k(N, χ)` over diamond eigenspaces is then a *theorem*, not the
  definition.
  ⚠ Define `M_k(N, χ)` by the transformation law; the diamond-eigenspace description is
  recovered once Layer 2 exists. This is where the roadmap deliberately improves on the
  AINTLIB provenance, which defines these spaces as eigenspaces of separately-built `⟨d⟩`.
- **Eisenstein series with character** `E_k^{χ,ψ}` (#37): the character-twisted series as
  named modular forms on `Γ₀(N)` with nebentypus, their `q`-expansions in terms of
  generalized Bernoulli numbers and twisted divisor sums, and the Eisenstein subspace.
  ⚠ Match Mathlib's `eisensteinSeries`/`gammaSet` indexing; do not introduce a second
  Eisenstein API.

### Layer 1: the valence formula (general level)
- Consumes the [Contour Integration roadmap](../ContourIntegration/README.md). For a nonzero
  `f ∈ M_k(SL₂(ℤ))`, the **valence formula** (Diamond–Shurman Thm 3.1.1) is a sum over the
  `SL₂(ℤ)`-**orbits** of points of `ℍ` — the order of vanishing `ord_P(f)` is constant on an
  orbit, hence well-defined on the orbit — with the two **elliptic orbits** `[i]`, `[ρ]`
  weighted by the reciprocal `1/e_P` of their stabilizer orders (`e_i = 2`, `e_ρ = 3`) and the
  cusp `∞` contributing `ord_∞`:
  ```text
  ord_∞(f) + ½·ord_i(f) + ⅓·ord_ρ(f) + Σ_{q ∈ (non-elliptic SL₂(ℤ)-orbits of ℍ)} ord_q(f) = k/12
  ```
  equivalently `Σ_{P ∈ SL₂(ℤ)\ℍ*} (1/e_P)·ord_P(f) = k/12` over the orbits of the extended
  upper half-plane `ℍ* = ℍ ∪ {cusps}` (the non-elliptic sum is finite, indexed by orbits with
  chosen representatives). ⚠ The summation index is **orbits in `ℍ`, not points** — this is
  the precise content of the formula `valence_formula_textbook` we already proved, where the
  sum is `∑ᶠ (q : non-elliptic orbits), ord_q(f)`.
- The proof is the contour integral of `f'/f` around the fundamental-domain boundary; `i` and
  `ρ` sit **on** that contour, so their `½` and `⅓` weights are the Hungerbühler–Wasem
  generalized winding numbers of points on a cycle (Contour roadmap Layer 4) — the precise
  reason the elliptic weights are `1/e_P`.
- **General level:** push to a finite-index `Γ ≤ SL₂(ℤ)` via the degree-`[SL₂(ℤ):±Γ]`
  covering, giving `Σ_{P ∈ Γ\ℍ*} (1/e_P)·ord_P(f) = k·[SL₂(ℤ):±Γ]/12` over the `Γ`-orbits, the
  input both to low-weight vanishing and to the dimension formulas.

### Layer 2: Hecke operators and the Hecke algebra
- **(a) The abstract Hecke ring (Shimura).** Double cosets `Γ\ΔΓ` for a Hecke pair
  `(Γ, Δ)`, the convolution product, and **commutativity** of the GL₂ Hecke algebra
  (Shimura Ch. 3). Keep this abstract ring separate from its action, so the structural facts
  (commutativity, generation by `T_p`, `⟨p⟩`) are proved once.
- **(b) The action on forms.** `Tₙ`, `Tₚ` as `ℂ`-linear endomorphisms of `M_k(N,χ)` and
  `S_k(N,χ)`, the ring homomorphism `𝕋 → End_ℂ(M_k(N,χ))`, and the explicit **`q`-expansion
  recurrences**
  ```lean
  -- a_m(T_p f) = a_{mp}(f) + χ(p) p^{k-1} a_{m/p}(f)   (p ∤ N case), etc. (Diamond–Shurman §5.2–5.3)
  def heckeOp (N : ℕ) (k : ℤ) (χ : DirichletCharacter ℂ N) (n : ℕ) : Module.End ℂ (ModularFormWithChar N k χ)
  ```
  with `Tₘ Tₙ = Tₘₙ` for `(m,n)=1` and the prime-power recurrence.
- **The diamond operators `⟨d⟩` are elements of this Hecke algebra** — the operators from the
  double cosets of `Γ₀(N)/Γ₁(N) ≅ (ℤ/N)ˣ`. On `M_k(N, χ)` (defined in Layer 0) they act by
  the scalar `χ(d)`; conversely, decomposing `M_k(Γ₁(N))` into the simultaneous
  `⟨d⟩`-eigenspaces **recovers** Layer 0's `M_k(Γ₁(N)) = ⨁_χ M_k(N, χ)`. Characters come
  first; the diamond operators live here, as part of the Hecke action — not the other way
  round.
  ⚠ The action must preserve cuspidality and the nebentypus; prove that, don't assume it.

### Layer 3: the Petersson inner product, adjoints, oldforms and newforms
- **The Petersson inner product** as a genuine positive-definite Hermitian inner product on
  `S_k(Γ)` (integrate Mathlib's `petersson` integrand over a fundamental domain), and
  **`Tₙ` is self-adjoint** for `(n,N)=1` (`⟨T_n f, g⟩ = ⟨f, T_n g⟩`), so the Hecke algebra
  away from the level is simultaneously diagonalizable.
- **Oldforms and newforms (the spaces):** the old subspace `S_k(N)^{old}` spanned by
  level-raising images `f(τ), f(dτ)` from proper divisors, the **new** subspace
  `S_k(N)^{new}` as its Petersson-orthogonal complement, and their orthogonality and
  `Tₙ`-stability.

### Layer 4: eigenforms, newforms, primitive forms; the conductor
- **Definitions:**
  ```lean
  structure Eigenform (N : ℕ) (k : ℤ) (χ : DirichletCharacter ℂ N) where
    toCuspForm : CuspForm (Gamma1 N) k
    isEigen    : ∀ n, (n.Coprime N) → ∃ a, heckeOp N k χ n toCuspForm = a • toCuspForm
    -- `normalized`: a₁ = 1;  `Newform`: a normalized eigenform in the new subspace
  ```
  with `Eigenform`, normalized eigenform, `Newform`, `Oldform`, and `primitive form`
  (= newform), and the eigenvalue API `aₙ`/`ringEigenvalue`.
- **The Main Lemma** (the Atkin–Lehner key lemma, Diamond–Shurman Lemma 5.7.1 / Miyake
  4.6.x): a cusp form whose `q`-expansion is supported on multiples of a prime descends or
  vanishes. **Discharge the two AINTLIB `sorry`s here** — the Atkin–Lehner Main Lemma and the
  existence of a nonzero prime eigenvalue.
- **The conductor theorem** (Miyake 4.6.4 / the analogue of Diamond–Shurman Prop 5.8.4):
  every normalized eigenform `g ∈ S_k(N,χ)` equals the level-raise of a **newform** of a
  unique level `M ∣ N`, the **conductor** of `g`; the dichotomy on `ℓ·cond(χ) ∣ N`.

### Layer 5: strong multiplicity one and the eigenform characterization
- **Strong multiplicity one** (Diamond–Shurman Thm 5.8.2 / Miyake Thm 4.6.12): two newforms
  in `S_k(Γ₁(N))^{new}` with `aₚ(f) = aₚ(g)` for almost all `p` are equal; each `Tₙ`-
  eigenspace is one-dimensional and the newforms are an orthogonal basis of the new subspace.
- **Diamond–Shurman Proposition 5.8.5** (the coefficient characterization): for
  `f ∈ M_k(N,χ)`, `f` is a normalized eigenform **iff** its Fourier coefficients satisfy
  ```text
  (1)  a₁ = 1
  (2)  a_{p^r} = a_p·a_{p^{r-1}} − χ(p)·p^{k-1}·a_{p^{r-2}}   for all primes p and r ≥ 2
  (3)  a_{mn} = a_m·a_n   whenever (m,n) = 1.
  ```
  This is the bridge to the Euler product (Layer 7): conditions (2)–(3) are exactly
  multiplicativity of the Dirichlet series.

### Layer 6: Atkin–Lehner and Fricke operators
- The Atkin–Lehner involutions `W_Q` for each exact divisor `Q ‖ N` (#18), the **Fricke
  involution** `W_N` (the `Q = N` slash by `[0,-1;N,0]`), their relations with `Tₙ` (commute
  away from `Q`), and on a newform the **signs** `W_Q f = ε_Q(f)·f` with `ε_Q ∈ {±1}` for
  real nebentypus, multiplying to the Fricke sign — the sign of the functional equation.

### Layer 7: L-functions
- **The L-function** `L(s,f) = Σ_{n≥1} aₙ(f)·n^{-s}`, its **convergence** (Diamond–Shurman
  Prop 5.9.1: absolute for `Re s > k/2 + 1` on cusp forms, `> k + 1` otherwise), built on
  Mathlib's `LSeries`.
- **The Euler product** for a normalized eigenform (from Prop 5.8.5):
  `L(s,f) = ∏_p (1 − aₚ p^{-s} + χ(p) p^{k-1-2s})^{-1}` (#30).
- **The completed L-function** `Λ(s,f) = N^{s/2}(2π)^{-s}Γ(s)L(s,f)` via the Mellin transform
  of `f`, its **functional equation** `Λ(s,f) = ε·Λ(k−s, f|W_N)` (from Layer 6's Fricke
  involution and Hecke's argument), and **analytic continuation** to all of `ℂ`.
- **Analytic rank and analytic conductor** (#31): the order of vanishing of `L(f,·)` at the
  central point `s = k/2`, and the conductor `N·(…Γ-factor…)`.

### Layer 8: coefficient fields and the integral Hecke algebra
- **The coefficient field** `K_f = ℚ(aₙ : n) ⊆ ℂ` of a newform (#34), and the headline result
  that **it is a number field**:
  ```lean
  -- the coefficient ring/field of a newform is finite over ℤ/ℚ
  instance (f : Newform N k χ) : NumberField (K_f f)
  theorem finrank_coeffField_eq_dim (f : Newform N k χ) : Module.finrank ℚ (K_f f) = newformDim f
  ```
  proved via the **integral Hecke algebra is a finitely generated ℤ-module** (the integral
  `q`-expansion / Eichler–Shimura lattice, Shimura Thm 3.48/3.51/3.52, Miyake Thm 4.5.9/
  4.5.19). ⚠ This is the deepest current gap — the single substantive `sorry`
  (`heckeAlgℤ_finite`) in the AINTLIB body — and the lynchpin for the whole LMFDB layer.

### Layer 9: the LMFDB invariant layer
Each is a named definition with its basic API, mostly short once Layer 8 exists:
- **Hecke characteristic polynomials** (#35): `charpoly(Tₙ | S_k(N,χ)^{new})`, its
  coefficients as traces of Hecke operators, and the factorization into Galois orbits.
- **Satake parameters and angles** (#32): `α_p, β_p` the roots of `X² − aₚX + χ(p)p^{k-1}`,
  `θ_p = arg α_p`, framed by the Ramanujan–Deligne bound `|aₚ| ≤ 2 p^{(k-1)/2}`.
- **Galois-conjugate forms and orbits** (#38): `f^σ` (act on coefficients), the orbit
  `{f^σ}` and `#orbit = dim` of the newform; **inner twists** (#42).
- **Dual / self-dual** (#55): `f̄` (conjugate coefficients) and `IsSelfDual f ↔ ∀n, (aₙ).im = 0`.
- **Labels** (#33, #13): the LMFDB label `N.k.a.x` (level, weight, character Galois-orbit,
  newform Galois-orbit), Conrey labels and Galois orbits of Dirichlet characters.
- **Bad primes** (#54): `badPrimes f = N.primeFactors`. **Eta quotients and the Ligozat
  criterion** (#19).

### Layer 10: modular curves as moduli problems (the aspirational summit)
- **The moduli problem, following Katz–Mazur** (*Arithmetic Moduli of Elliptic Curves*).
  Define the moduli problem of **elliptic curves with level structure** as a functor on
  (`ℤ[1/N]`-)schemes: a `[Γ(N)]`-, `[Γ₁(N)]`-, or `[Γ₀(N)]`-structure on `E/S` (a full
  level-`N` basis of `E[N]`; a point of exact order `N`; a cyclic subgroup of order `N`):
  ```lean
  -- the moduli problem of elliptic curves with Γ-level structure, as a functor of points
  def ModuliProblem (Γ : LevelStructureDatum) : (Scheme)ᵒᵖ ⥤ Type
  ```
- **Representability.** Prove the moduli problem is **representable by a scheme** — the
  modular curve `Y(Γ)` — when the level structure is **rigid** (Katz–Mazur Cor. 2.7.2 /
  Thm 4.7.0: for `N ≥ 3` the objects have no nontrivial automorphisms, so the functor is
  represented by a smooth affine curve over `ℤ[1/N]`), with the **compactification** `X(Γ)`
  adjoining the cusps via generalized elliptic curves / the Tate curve; for non-rigid levels,
  the coarse moduli space (or the stack). This is the arithmetic definition — **defined over
  `ℤ[1/N]`**, not as an analytic quotient.
- **The complex-analytic uniformization (a theorem, not the definition).** Prove the
  **complex points** of the modular curve form a compact Riemann surface that *is* the
  quotient of the upper half-plane by `Γ`:
  ```lean
  -- Y(Γ)(ℂ) ≅ Γ \ ℍ  biholomorphically;  X(Γ)(ℂ) its compactification
  theorem modularCurve_complexPoints (Γ : …) : (Y Γ).complexPoints ≃ₘ (Γ \ ℍ)
  ```
  with holomorphic charts at ordinary points, elliptic points, and cusps (Diamond–Shurman
  Ch. 2), the cusp count `Γ\ℙ¹(ℚ)`, the elliptic-point count, and the **genus**. So `Γ\ℍ`
  is a *theorem about the complex points* of the moduli scheme — which **subsumes and
  strengthens** the LeanBridge `Spec/ModularCurve.lean` acceptance spec (#68), that pins only
  the analytic quotient.
  ⚠ Mathlib has elliptic curves but **no moduli problems, level structures, or
  representability**; this layer builds that arithmetic-geometry foundation — the single
  largest undertaking in the roadmap, alongside Route 2 of Layer 11.
- **Shimura curves** (#69) and **Hilbert modular surfaces** (#70): the analogous moduli /
  quotient constructions for quaternionic `Γ` and for `SL₂(𝒪_F)` acting on `ℍ²`, against
  their LeanBridge specs — far-horizon companions to `X(Γ)`.

### Layer 11: dimension formulas, both routes
The goal is the **general-level dimension formula** (Diamond–Shurman Thm 3.5.1). For a
congruence subgroup `Γ`, let `g` be the genus of `X(Γ)` — the sibling
[Jacobian-challenge](../JacobianChallenge/README.md) genus `g = dim_ℂ H¹(X(Γ), 𝒪_X)` — and
`ε₂`, `ε₃`, `ε∞` the numbers of elliptic points of period `2`, `3` and of cusps. For **even
`k`**:
```text
dim M_k(Γ) = (k-1)(g-1) + ⌊k/4⌋·ε₂ + ⌊k/3⌋·ε₃ + (k/2)·ε∞          (k ≥ 2)
dim S_k(Γ) = (k-1)(g-1) + ⌊k/4⌋·ε₂ + ⌊k/3⌋·ε₃ + (k/2 - 1)·ε∞      (k ≥ 4),   dim S_2(Γ) = g
```
(`dim M_0 = 1`, `dim S_0 = 0`, both `0` for `k < 0`); the **odd-`k`** formulas (D–S §3.6)
split the cusps into regular and irregular and drop the `ε₂` term. The Jacobian genus is the
key input: `dim S_2(Γ) = g` is exactly the statement that weight-two cusp forms are the
holomorphic differentials on `X(Γ)`, the bridge to `dim Jac X(Γ) = g`.
- **Route 1 (valence / counting).** Derive the formula from the Layer-1 valence formula plus
  the elliptic-point and cusp counts of Layer 10 — the elementary route, extending Mathlib's
  level-one `ModularForm.dimension_level_one` to general level.
- **Route 2 (Riemann–Roch).** The Diamond–Shurman Chapter 3 route: meromorphic differentials
  on `X(Γ)`, the **divisor of a modular form** (rational coefficients at elliptic points and
  cusps), the **Riemann–Roch theorem** for the compact Riemann surface `X(Γ)` (§3.4) applied
  to `⌊div f⌋`, and the formulas above as its corollary (§3.5–3.6). ⚠ Riemann–Roch for
  compact Riemann surfaces is **absent from Mathlib**: this sub-build (divisors, the canonical
  divisor / meromorphic differentials, the Riemann–Roch equality, Serre-duality input) is the
  heaviest single piece of the roadmap. The two routes must agree — that agreement is itself
  an acceptance test.
- Until `X(Γ)`'s genus and elliptic/cusp counts are expressible (Layer 10 + the Jacobian
  genus), a parametrised formula would be false for the wrong data, so `Targets.lean` seeds
  this layer with concrete instances at levels `> 1`: `dim S_2(Γ₀(11)) = 1`,
  `dim S_2(Γ₀(23)) = 2`, `dim S_2(Γ₀(2)) = 0`, `dim M_2(Γ₀(11)) = 2`.

### Layer 12: long horizon (research-level)
The Galois representation `ρ_{f,ℓ}` attached to a newform (#39); the **Eichler–Shimura
relation** and spaces of **modular symbols** (#36) as the homological model; the **Shimura
correspondence** for half-integral weight (#40, with `ShimuraHom` the integral-weight side);
Jacobians and the abelian variety `A_f`; **Stark units** (#41); and the elliptic-curve
links — `aₚ(E) = aₚ(f)` and special L-values / BSD framing (#27). These name major
independent theories; they live here so the roadmap records them as wanted, not as near-term
targets.

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **Δ at level one** (`k = 12`, `N = 1`): the unique normalized cusp form; `τ(p)` are its
  Hecke eigenvalues; `aₙ` multiplicative with the `τ(p^r)` recurrence (Prop 5.8.5); the
  Ramanujan bound `|τ(p)| ≤ 2 p^{11/2}` framing (Layer 9 Satake).
- **Level 11, weight 2** (`S₂(Γ₀(11))`, dimension 1): a single newform, the elliptic curve
  `11a`; its Fricke sign (Layer 6) and the rank-0 functional equation (Layer 7).
- **Level 37, weight 2** (two newforms with opposite Atkin–Lehner signs): the multiplicity-
  one / sign acceptance test (Layers 5–6).
- **A newform with non-real `aₙ`** (CM coefficient field): `K_f` a genuine imaginary-
  quadratic field, not totally real — the coefficient-field acceptance test (Layer 8) and
  the not-self-dual test (Layer 9).
- **`η²⁴ = Δ`** as a weight-12 eta quotient satisfying the Ligozat criterion (Layer 9, #19).
- **Dimension formulas agree:** `dim S_k(Γ₀(N))` from the valence/counting route equals the
  Riemann–Roch route on `X₀(N)` (Layer 11), on a few small `(N,k)`.

## Ordering

Layer 0 (nebentypus) and Layer 2 (Hecke operators) are the trunk and come first; the
valence formula (Layer 1) is an independent early lane that only needs the Contour
Integration roadmap. Layers 3–5 (Petersson → newforms → strong multiplicity one) are the
core arithmetic and must be sequential. Layers 6–7 (Atkin–Lehner → L-functions) and Layer 8
(coefficient fields) consume Layer 5; Layer 9 (LMFDB invariants) consumes Layer 8. The
summit Layers 10–11 (modular curves, dimension formulas) are last, with the Riemann–Roch
sub-build of Layer 11 the single largest undertaking. Layer 12 is the research horizon.

## Provenance (migrate and clean from AINTLIB `LeanModularForms`)

Secondary to the mathematics above: the migration map. Headline theorems are `sorry`-free in
AINTLIB unless flagged. Paths are relative to that project's `LeanModularForms/`.

- **Nebentypus / characters (L0):** `Chapters/CharacterSpaces.lean`,
  `HeckeRIngs/GL2/CharacterDecomp.lean`.
- **Valence formula (L1):** `Chapters/ValenceFormula.lean`, `Chapters/WindingElliptic.lean`,
  and the FD-boundary bridge (`ForMathlib/*FDBoundary*`, `*CornerFTC*`, `*CrossingAt*`) on
  top of the Contour Integration engine.
- **Hecke theory (L2):** `HeckeRIngs/AbstractHeckeRing/*` (abstract ring, commutativity),
  `HeckeRIngs/GL2/*` (`HeckeT_n`, `HeckeT_p`, `diamondOp`, `heckeRingHom`, `MultiplicationTable`),
  `Chapters/{HeckeOperators,GL2Operators,RingStructure,Commutativity}.lean`.
- **Petersson / old–new (L3):** `Chapters/{Petersson,AdjointSpectral}.lean`,
  `Modularforms/Petersson*.lean`, `HeckeRIngs/GL2/AdjointTheory*.lean`.
- **Newforms / conductor (L4):** `Chapters/NewformTheory.lean`,
  `HeckeRIngs/GL2/Newforms/*` (`Basic`, `FullEigenform`, `CoeffSeq`, `MainLemma`),
  `HeckeRIngs/GL2/Unified/EigenformFromRing.lean`,
  `Eigenforms/{ConductorTheorem,MainLemma}.lean` ← the two `sorry`s.
- **Strong multiplicity one (L5):** `Chapters/StrongMultiplicityOne.lean`,
  `SMOObligations/StrongMultiplicityOneFull.lean` (the `sorry`-free proof) and its chain;
  the §5.8.5 characterization in `HeckeRIngs/GL2/Newforms/{FullEigenform,CoeffSeq}.lean`.
- **Atkin–Lehner / Fricke (L6):** `Eigenforms/AtkinLehner.lean`, `HeckeRIngs/GL2/Fricke.lean`.
- **L-functions (L7):** `Modularforms/LFunction.lean`, completion/functional-equation pieces
  in `HeckeRIngs/GL2/Newforms/Fricke*.lean`.
- **Coefficient field (L8):** `Labels/HeckeFieldArithmetic.lean` ← the `heckeAlgℤ_finite`
  `sorry`, the lynchpin.
- **LMFDB layer (L9):** `Labels/{Label,Encoding,NewformOrbit,CharacterOrbit}.lean`,
  `Eigenforms/AtkinLehner.lean` (signs), `Chapters/CharacterSpaces.lean`.
- **Dimensions / curves (L10–11):** `Chapters/{Dimensions,Curves}.lean`,
  `Modularforms/DimensionFormulas.lean` (`dim_gen_cong_levels`, `cuspform_weight_lt_12_zero`)
  give the level-one valence/counting route; the Katz–Mazur **moduli/representability** (L10)
  and the **Riemann–Roch** route (L11, Route 2) are **new** — neither AINTLIB nor Mathlib has
  them.
- **Long horizon (L12):** `HeckeRIngs/GL2/ModularSymbols/*`,
  `HeckeRIngs/GL2/Unified/ShimuraHom.lean`.

The two structural audits `.mathlib-quality/{newforms,eigenforms-smo}-overview-2026-05-31.md`
catalogue the redundancy to collapse during migration.

## References

- F. Diamond, J. Shurman, *A First Course in Modular Forms* (GTM 228): Ch. 3 (dimension
  formulas, the genus, Riemann–Roch), Ch. 5 (Hecke operators, newforms, Thm 5.8.2, Props
  5.8.4–5.8.5, §5.9 L-functions).
- T. Miyake, *Modular Forms*: §4.5–4.6 (the integral structure, the conductor theorem, and
  strong multiplicity one Thm 4.6.12) — the numbering the AINTLIB code follows.
- G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions*: Ch. 3 (the
  Hecke algebra and its integral structure, Thms 3.48/3.51/3.52).
- N. Katz, B. Mazur, *Arithmetic Moduli of Elliptic Curves* (Annals of Math. Studies 108):
  moduli problems of elliptic curves with level structure, rigidity, and representability —
  the Layer 10 modular-curve definition.
- N. Hungerbühler, M. Wasem, *Non-integer valued winding numbers and a generalized Residue
  Theorem*, arXiv:1808.00997 — the contour-integration engine behind the valence formula's
  elliptic-point weights (see the [Contour Integration roadmap](../ContourIntegration/README.md)).
- A. Atkin, J. Lehner, *Hecke operators on Γ₀(m)*; W. Stein, *Modular Forms: A Computational
  Approach*. The **LMFDB** (`https://www.lmfdb.org`) knowls fixed by the target definitions.

## Acknowledgements

The body of theory is **migrated and cleaned** from the AINTLIB `LeanModularForms` project
([github.com/CBirkbeck/AINTLIB](https://github.com/CBirkbeck/AINTLIB)), where the headline
results are already `sorry`-free; thanks to its authors. The target
definitions discharge a large set of "def-wanted" specifications from the
[LeanBridge](https://github.com/CBirkbeck/LeanBridge) project: issues #13, #18, #19, #27,
#30–#42, #54, #55, and the modular-curve specs #68–#70. The Contour Integration engine it
depends on is the sibling [Contour Integration roadmap](../ContourIntegration/README.md).
