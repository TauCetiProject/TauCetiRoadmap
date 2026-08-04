# Roadmap: modular forms — Hecke theory, newforms, and L-functions

Mathlib has the *foundations* of modular forms — `SlashInvariantForm`, `ModularForm`,
`CuspForm` and their classes ([`ModularFormClass`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/ModularForms/Basic.html#ModularFormClass),
`CuspFormClass`, in `Mathlib/NumberTheory/ModularForms/Basic.lean`), the slash action
(`SlashActions.lean`), the congruence subgroups `Γ(N)`, `Γ₀(N)`, `Γ₁(N)`
(`CongruenceSubgroups.lean`), Eisenstein series and `E₄, E₆` (`EisensteinSeries/*`), the
`q`-expansion and [`cuspFunction`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/ModularForms/QExpansion.html)
(`QExpansion.lean`), the Petersson integrand (`Petersson.lean`), the cusp-form submodule, `Δ`,
`η`, the level-one dimension formula and level-one **Sturm bound** (`LevelOne/DimensionFormula.lean`),
and — new in July 2026 — the first slice of the **abstract Hecke ring**
(`NumberTheory/HeckeRing/Defs.lean`). It has **no Hecke operators acting on modular forms**, no
theory of **eigenforms / newforms / oldforms**, no **L-function of a modular
form**, no **valence formula**, and no **general dimension formulas**. We build the classical
arithmetic theory of modular forms on top of Mathlib's analytic foundation: modular forms with
character, the valence formula at general level, the Hecke algebra, the Petersson inner
product, newforms and strong multiplicity one, Atkin–Lehner and Fricke operators, the
L-function with its Euler product and functional equation, the theorem that the coefficient
field of a newform is a number field, and the level-one **Eichler–Selberg trace formula** — the
content of a masters/PhD course on the subject,
resting throughout on complex analysis, Fourier analysis, and the arithmetic of `SL₂(ℤ)`.

The hardest target is the **dimension formulas** for `M_k(Γ)` and `S_k(Γ)` at general level
(Diamond–Shurman Thms 3.5.1 and 3.6.1), proved by the **classical analytic route**: the valence
formula and the elliptic-point and cusp counts of the quotient `Γ\ℍ` for the upper bounds, and
analytic Riemann–Roch on `X(Γ)` — built inside Layer 10, not assumed — for the lower bounds. Mere
*finite-dimensionality* at general level is **not** the hard part — it arrives in Mathlib by the
elementary Sturm-bound route (see Layer 10) and this roadmap consumes it. What this roadmap adds
is the **exact dimension formula** of Diamond–Shurman Thm 3.5.1 — `dim M_k(Γ)` and `dim S_k(Γ)`
in terms of the genus `g` of `X(Γ)`, the numbers `ε₂` and `ε₃` of elliptic points of order `2`
and `3`, and the number `ε∞` of cusps — which means computing those four invariants for a given
`Γ`, not just knowing the spaces are finite-dimensional. The modular curve here
**is** the analytic quotient `Γ\ℍ`, compactified by adjoining the cusps to a compact Riemann
surface — defined directly, with no functor, no representability, and no algebraic moduli
problem.

Suggested home: `TauCeti/NumberTheory/ModularForms/`.

A large body of this theory — `sorry`-free apart from three flagged gaps (see *Provenance*) —
already exists in the AINTLIB `LeanModularForms`
project (~250 source files). This roadmap specifies the **mathematics**; the file-by-file
migration map is in the secondary *Provenance* section and in `Suggested.lean`. Porting it into
`TauCeti/` is the opportunity to restate everything in Mathlib's vocabulary and to **clean up** —
the project's own audits estimate that the newform and eigenform/SMO subtrees alone carry
~30–36% redundancy (parallel `ModularForm`/`CuspForm` chains, dead scaffolding, near-duplicate
`slash` variants) that consolidates on the way in.

## Standing hypotheses and conventions

Spell hypotheses out; **do not** bundle "a modular form with all its invariants" into one class.
Pin these conventions before writing code — implementors make bad, divergent choices otherwise.

- **Levels and characters.** Work with `Γ₁(N) ≤ Γ ≤ Γ₀(N)`, with `[NeZero N]` throughout — `N = 0` is nowhere admitted. The space with **nebentypus** `χ` is
  `M_k(N, χ) = M_k(Γ₁(N), χ)`, the simultaneous `χ`-eigenspace of the diamond operators inside
  `M_k(Γ₁(N))` — a `Submodule`, defined in Layer 0 exactly as in AINTLIB. Reserve `M_k(Γ)` for a
  bare congruence subgroup. ⚠ This gives **two ways to say `M_k(Γ₀(N))`** — as forms on the
  bare group `Γ₀(N)`, and as `M_k(N, χ)` for `χ` trivial. That is unavoidable, so decide it
  once: prove the two **isomorphic** (a named milestone), treat `M_k(Γ₀(N))` as the default
  spelling for trivial nebentypus, and convert to it where possible. The character has two faces, and AINTLIB uses both deliberately: a
  unit homomorphism `χ : (ZMod N)ˣ →* ℂˣ` where it indexes eigenspaces, and Mathlib's
  `DirichletCharacter ℂ N` (`= MulChar (ZMod N) ℂ` — use it, do not reinvent) where a formula
  evaluates `χ` at arbitrary residues with `χ(p) = 0` for `p ∣ N`, bridged by
  Mathlib's equivalence `MulChar.equivToUnitHom` (inverse `MulChar.ofUnitHom`) — the bridge is
  needed already in Layers 0–2, so it cannot be `Newform.dirichletLift`, which is the Layer-4
  per-newform packaging of the same zero-extension and is derived from the equivalence, not the
  other way around. Keep both faces and
  the maps between them; do not fuse them into a third notion.
- **The weight-`k` slash.** Use Mathlib's `SlashAction`/`ModularForm.slash` and its `k` and
  `GL₂(ℝ)⁺`/`GL₂(ℚ)⁺` conventions throughout; the Hecke double-coset operators are built from it.
  ⚠ Two normalizations of the Hecke action circulate, differing by a power of the determinant;
  use the **arithmetic** one — Diamond–Shurman's, the one with no square roots in odd weight —
  and use it *only*. The Shimura normalization is **not** wanted here: from the automorphic
  side there is no canonical representation attached to a modular form anyway (one may twist
  by `‖det‖^s`), so carrying a second normalization buys nothing this roadmap needs. AINTLIB
  has a `ShimuraHom` comparison; it is not a target. Record at Layer 0 the **parity lemma**:
  `M_k(N, χ) ≠ 0 → χ(−1) = (−1)^k` (slash by `−I ∈ Γ₀(N)`) — the emptiness criterion that odd
  weights and Eisenstein constructions consume.
- **`Tₙ` is defined for every `n`, and at `p ∣ N` it *is* `Uₚ`.** Miyake (§4.5, Lemma 4.5.7),
  Diamond–Shurman (Prop. 5.2.1–5.2.2, eq. (5.3)–(5.4)) and Shimura (3.5.12) all define `T(n)`
  for **all** `n ≥ 1`, with the nebentypus extended by `χ(d) = 0` for `(d, N) > 1`. The
  coefficient formula `aₘ(Tₚ f) = a_{mp}(f) + χ(p)p^{k−1}a_{m/p}(f)` then degenerates at
  `p ∣ N` to `aₘ(Tₚ f) = a_{mp}(f)` — which is exactly the operator modern papers write `Uₚ`.
  So there is **no second operator**: follow the sources and define `Tₙ` uniformly, then
  provide `Uₚ` as an **alias at `p ∣ N` with the lemma `Uₚ = Tₚ`** (Layer 2), so both
  vocabularies are available and provably the same. Likewise the recurrence
  `T_{p^{r+2}} = Tₚ T_{p^{r+1}} − p^{k−1}⟨p⟩T_{p^r}` is uniform per character space once the
  scalar is read as the zero-extended `χ(p)` — at bad `p` no diamond operator exists, only the
  zero-extended scalar — degenerating to `T_{p^r} = Tₚ^r`; the good-prime recurrence and the
  bad-prime identity are **separate theorems** (AINTLIB has both: the `Coprime`-hypothesis
  recurrence and `heckeT_ppow_eq_pow_of_not_coprime`), and in the coefficient formula
  `a_{m/p}` means `if p ∣ m then a_{m/p} else 0` — an explicit `if` on porting, since `Nat`
  division would silently return a wrong coefficient. ⚠ Genuine diamond operators are indexed by
  `(ZMod N)ˣ` only; the `⟨n⟩ = 0` extension to non-units is a *separate* zero-extended
  notation for uniform formulas — do not conflate the two, and do not pretend a non-unit
  indexes an automorphism.
- **What "eigenform" means — the call, made once, following the sources.** The bare word
  `Eigenform` is reserved for the **full** notion, as in **Diamond–Shurman Definition 5.8.1**:
  a nonzero form that is an eigenvector for `Tₙ` at **every** `n ≥ 1` and for the diamond
  operators (their `⟨n⟩`-clause is what pins the nebentypus — carried here by membership in a
  character space — and is vacuous only at bad `n`). This is the
  right thing to call `Eigenform` because its eigenvalue system *contains* the bad-prime data
  that the Euler factors (Layer 7) and Atkin–Lehner–Li (Layer 4) consume.
  The weaker, good-`n` notion — eigenvector for `Tₙ` whenever `(n, N) = 1` — is exactly the
  natural *hypothesis* of the newform arguments (it is the family that is normal for the
  Petersson product, hence simultaneously diagonalizable: Miyake Thm 4.5.4(3), D–S Thm 5.5.4)
  and so it needs a name of its own — but a **qualified** one, since no source gives it the
  bare word: `IsEigenformAwayFromLevel` (say "good Hecke eigenform" in prose, never plain
  "eigenform"). Miyake has no free-standing "eigenform" at all; he says "common eigenfunction"
  relative to a stated family.
- **Normalized eigenforms and newforms.** A form is `normalized` when `a₁ = 1`. A **newform**
  is defined the proof-friendly way, following Miyake's *primitive form* (§4.6): normalized,
  lying in the new subspace — the orthogonal complement of the oldspace under
  the Petersson product, defined in Layer 3, where the old/new decomposition is a milestone —
  and **eigen away from the level**. That every newform is then a *full* eigenform is a
  **theorem**, not part of the definition (D–S Thm 5.8.2 / Miyake Thm 4.6.13), and it is what
  makes the bad-prime eigenvalues (Layer 4) available. Building the full condition into the
  newform hypothesis would put a hard theorem into the hypotheses of the newform-decomposition
  argument, which is why Miyake does not do it. ⚠ The terminology deliberately differs from
  D–S, whose *newform* is **defined** as a normalized full eigenform in the newspace; D–S
  Thm 5.8.2 is exactly the bridge between their definition and the Miyake-style one used
  here — say so on porting, so no reader thinks the two books state different theorems.
  State eigenvalue results for normalized forms, so that
  `Tₙ f = aₙ(f) · f` (Hecke eigenvalue = Fourier coefficient).
- **Coefficient field.** The coefficient field of a newform is `CoefficientField f = ℚ(aₙ : n ≥ 1)
  ⊆ ℂ`, an `IntermediateField ℚ ℂ`. (Name it `CoefficientField`, not after the form: no `K_f`.)
  It is a *number field* — a theorem (Layer 8), not an assumption. The `IntermediateField ℚ ℂ`
  typing is deliberate and does real work: because the forms here are complex-analytic, the
  coefficient field comes with a **preferred embedding into `ℂ`**, and the Galois-orbit and
  self-duality statements of Layer 9 are about that embedded field, not an abstract number
  field.
- **`q`-expansions are the computational interface.** State Hecke recurrences, Euler products,
  and eigenform characterizations on the Fourier coefficients `aₙ(f)` via `qExpansion`, not on
  bespoke coefficient types.
- **Ride Mathlib's bundled form types — the analytic invariants travel *inside* the type.** State
  every target over `ModularForm` / `CuspForm` / `ModularFormClass` (and, for nebentypus spaces,
  membership in `modFormCharSpace k χ`), **never** over a raw `ℍ → ℂ`: holomorphy, boundedness /
  vanishing at the cusps, and Γ-automorphy are structure fields that cannot be silently dropped. When
  porting a result, **copy AINTLIB's hypotheses verbatim** rather than "cleaning them up" — in
  particular the `Tₚ`-recurrence's `f ∈ modFormCharSpace k χ` and `Coprime p N` (which pick the
  operator and give `χ(p)` its meaning), the `a₁ = 1` normalization (a field of `Newform`, not of
  `Eigenform`), the **shared nebentypus and finite exceptional set** in `strongMultiplicityOne`
  (Layer 5), and the `0 < k`, width-one, and Fricke-companion hypotheses of the functional
  equation (Layer 7). These are the modular-forms analogue of the curve-regularity hypotheses the Contour
  roadmap carries; keeping them visible is why this roadmap does **not** hit the "raw restatement
  drops an invariant" failure.

## What Mathlib already has (consume)

- **Forms and classes:** `ModularForm Γ k`, `CuspForm Γ k`, `SlashInvariantForm`,
  `ModularFormClass`, `CuspFormClass`, the `ℂ`-module structures, `ModularForm.mul`, `E₄`, `E₆`,
  `Δ`, `η` (`NumberTheory/ModularForms/*`).
- **Congruence subgroups:** `CongruenceSubgroup.Gamma`, `Gamma0`, `Gamma1`, and the maps between
  them (`CongruenceSubgroups.lean`).
- **The upper half-plane and the `SL₂` action:** `UpperHalfPlane`, the Möbius action, the
  fundamental domain and proper discontinuity (`Analysis/Complex/UpperHalfPlane/*`,
  `ModularForms/ProperlyDiscontinuous.lean`).
- **`q`-expansions and cusps:** `qExpansion`, `cuspFunction`, `BoundedAtCusp`, the bounds
  `|aₙ| = O(n^{k})` / `O(n^{k/2})` substrate (`QExpansion.lean`, `Bounds.lean`).
- **Eisenstein series:** `eisensteinSeries`, `gammaSet`, the level-`Γ(N)` series and their
  `q`-expansions (`EisensteinSeries/*`).
- **Petersson integrand:** `petersson k f f' τ`, the pointwise pairing (`Petersson.lean`).
- **Dirichlet characters:** `DirichletCharacter`, conductor, primitivity, `changeLevel`, Gauss
  sums, the Dirichlet L-function with its functional equation
  (`NumberTheory/DirichletCharacter/*`, `LSeries/*`).
- **L-series substrate:** `LSeries`, `LSeriesSummable`, `LSeriesHasSum`, abscissa of convergence,
  and the Euler-product API (`riemannZeta_eulerProduct`, `LSeries/Dirichlet.lean`,
  `EulerProduct/*`).
- **Number fields:** `NumberField`, `IntermediateField`, the Galois theory of `ℚ̄/ℚ` — the target
  of the coefficient-field layer.
- **The abstract Hecke ring (landing now — July 2026):**
  [`NumberTheory/HeckeRing/Defs.lean`](https://github.com/leanprover-community/mathlib4/pull/41251)
  has the Hecke-triple compatibility class `IsHeckeTriple Δ H₁ H₂` (commensurable subgroups of a
  common submonoid `Δ` lying in their commensurator — the finiteness making `H₁gH₂` a finite
  union of left cosets), the double-coset basis `HeckeCoset Δ H₁ H₂`, the coset module
  `HeckeCosetModule Δ H₁ H₂ Z`, and the Hecke ring `HeckeRing Δ H Z` (notation `𝕋`), on top of
  `GroupTheory/DoubleCoset` and `GroupTheory/Commensurable`. The **convolution product, identity,
  and associativity** are the open review stack
  [#41253](https://github.com/leanprover-community/mathlib4/pull/41253)–[#41256](https://github.com/leanprover-community/mathlib4/pull/41256), [#41277](https://github.com/leanprover-community/mathlib4/pull/41277), [#41279](https://github.com/leanprover-community/mathlib4/pull/41279), and [#41328](https://github.com/leanprover-community/mathlib4/pull/41328),
  upstreamed from AINTLIB's `HeckeRIngs/AbstractHeckeRing/*`. Layer 2 **consumes** this; do not
  re-found the abstract ring in `TauCeti/`.
- **The Sturm bound — level one merged, finite index in review:**
  `ModularForm.sturm_bound_levelOne` and the even-weight dimension formula
  `ModularForm.dimension_level_one` (`LevelOne/DimensionFormula.lean`,
  [#38993](https://github.com/leanprover-community/mathlib4/pull/38993)); the finite-index Sturm
  bound `ModularForm.sturm_bound_finiteIndex` with a `Module.Finite ℂ (ModularForm 𝒢 k)`
  instance — finite-dimensionality at **every** level — is the open stack
  [#39000](https://github.com/leanprover-community/mathlib4/pull/39000)
  (+[#39083](https://github.com/leanprover-community/mathlib4/pull/39083)/[#39086](https://github.com/leanprover-community/mathlib4/pull/39086)/[#39087](https://github.com/leanprover-community/mathlib4/pull/39087)/[#39088](https://github.com/leanprover-community/mathlib4/pull/39088):
  cusp widths, the modular norm map and its `q`-expansion decomposition). Layer 10 **consumes**
  finite-dimensionality from here; the exact dimension formulas remain the hard target.

⚠ **Dependency policy, stated once.** In-review Mathlib stacks are consumed **with a named
fallback**: if the Sturm stack (#39000 + companions) stalls, AINTLIB's `dim_gen_cong_levels`
(which it upstreams) is vendored; if the Hecke-ring convolution stack (#41253–#41328) stalls,
AINTLIB's `AbstractHeckeRing/*` is. No milestone rests on an unmerged PR without its fallback.

## What is missing (build here)

The valence formula at general level; the diamond operators `⟨d⟩` and the character spaces
`M_k(N,χ)`; the Hecke operators `Tₙ` (`Tₚ` is the prime case, not a separate object) and the (commutative) Hecke-ring action on
`M_k(N,χ)` — the abstract ring is Mathlib's, its `GL₂` realization and action are not; the Petersson inner product as
an actual inner product and the Petersson adjoint `Tₙ* = ⟨n⟩⁻¹Tₙ` for `(n,N)=1` — normality, not
self-adjointness at general nebentypus; the old/new decomposition
and its orthogonality; eigenforms, newforms, oldforms, primitive forms; the Atkin–Lehner Main
Lemma (D–S 5.7.1), the newform decomposition with its conductor, the bad-prime eigenvalue
classification, and **strong multiplicity one**; Atkin–Lehner and Fricke operators and their
signs; the L-function of a modular form with its **Euler product**, **completed form**,
**functional equation**, and **analytic continuation**; the **coefficient field** and the proof
that it is a number field — both **already constructed in AINTLIB**, so this one is a migration
(§Layer 8, §Provenance); the LMFDB invariants (Satake parameters, Hecke characteristic
polynomials, Galois orbits, labels, …); the **modular curve** `X(Γ)` as the compactified analytic
quotient `Γ\ℍ`, with its cusps, elliptic points, and genus; the **dimension formulas** for
`M_k(Γ)` and `S_k(Γ)` — the valence formula for the upper bounds, the lower bounds by **analytic
Riemann–Roch on `X(Γ)`, built inside Layer 10** (finiteness of `H¹`, Serre duality,
Riemann–Hurwitz — see there); and the level-one **Eichler–Selberg trace
formula** together with the **Hurwitz class numbers** it needs (absent from Mathlib). Apart from
the abstract Hecke ring and the
Sturm-bound finiteness now landing in Mathlib (consumed above), none of this is upstream.

---

## The build, in layers

The ordering is the dependency order; independent lanes (e.g. L-functions vs. the modular curve)
can proceed in parallel once their inputs exist. As each layer makes the next layer's *types*
expressible in `TauCeti/`, its milestones go into `Suggested.lean` (with `sorry`). Embedded Lean
below sketches signatures; it is illustrative, not required to compile.

### Layer 0: diamond operators and modular forms with character (nebentypus)
- **Diamond operators first — from the slash action alone.** `Γ₁(N) ⊴ Γ₀(N)` with
  `Γ₀(N)/Γ₁(N) ≅ (ℤ/N)ˣ` via the lower-right entry, so slashing by (any lift of) `d ∈ (ZMod N)ˣ`
  is a well-defined `ℂ`-linear endomorphism of `M_k(Γ₁(N))` and of `S_k(Γ₁(N))`: the **diamond
  operator** `⟨d⟩`, packaged as monoid homs into the endomorphism algebras (AINTLIB `diamondOp`
  / `diamondOpCusp`, `diamondOpHom : (ZMod N)ˣ →* Module.End ℂ (ModularForm ((Gamma1 N).map
  (mapGL ℝ)) k)`). This needs Mathlib's slash action and the `Γ₀(N)/Γ₁(N)` package — `Gamma0Map` (unit-valued
  form, surjectivity onto `(ZMod N)ˣ`, kernel `Γ₁' N`), independence of the chosen lift, and
  preservation of the cusp conditions — but no Hecke theory.
- **Modular forms with character `M_k(N, χ)` and `S_k(N, χ)` — as in AINTLIB**: the simultaneous
  `χ`-eigenspace of the diamond operators, a `Submodule` of Mathlib's `ModularForm`, **not** a
  new bundled type with a twisted transformation law:
  ```lean
  -- AINTLIB (HeckeRIngs/GL2/Gamma1Pair.lean), verbatim:
  noncomputable def modFormCharSpace [NeZero N] (k : ℤ) (χ : (ZMod N)ˣ →* ℂˣ) :
      Submodule ℂ (ModularForm ((Gamma1 N).map (mapGL ℝ)) k) :=
    ⨅ d : (ZMod N)ˣ, Module.End.eigenspace (diamondOpHom k d) (↑(χ d))   -- and cuspFormCharSpace
  ```
  These spaces are the general setting for the entire roadmap; all of the Hecke, Petersson, and
  eigenform theory below lives on them. The classical **nebentypus transformation law is a
  theorem here**, not the definition (AINTLIB `modFormCharSpace_iff_nebentypus`):
  `f ∈ M_k(N, χ) ↔ ∀ γ ∈ Γ₀(N), f ∣[k] γ = χ(d_γ) • f`.
  ⚠ Do **not** re-found these spaces by re-defining the slash action with a character built in
  (a `ModularFormWithChar` type): the eigenspace-in-a-`Submodule` definition keeps every Mathlib
  lemma about `ModularForm Γ k` applicable to elements of `M_k(N,χ)` for free, matches the
  AINTLIB corpus this roadmap migrates (so its theorems restate verbatim), and makes the
  decomposition below a statement about honest subspaces of one fixed space.
- **The nebentypus decomposition** of `M_k(Γ₁(N))` — **already proved in AINTLIB**; migrate,
  don't re-derive. The diamond action is simultaneously diagonalizable with the `M_k(N,χ)` as
  its isotypic components, an **internal** direct sum:
  ```lean
  -- AINTLIB (HeckeRIngs/GL2/CharacterDecomp.lean): iSupIndep + iSup = ⊤, packaged as
  theorem ModularForm_Gamma1_charSpace_directSum (k : ℤ) [DecidableEq ((ZMod N)ˣ →* ℂˣ)] :
      DirectSum.IsInternal (fun χ : (ZMod N)ˣ →* ℂˣ ↦ modFormCharSpace k χ)
  ```
  (halves: `ModularForm_Gamma1_iSupIndep_charSpace`, `ModularForm_Gamma1_iSup_charSpace`; cusp
  versions alongside). ⚠ This is an internal direct sum of subspaces of `M_k(Γ₁(N))`, **not** a
  naive equality of a type with an external `⨁`.
- **Eisenstein series with character** (#37) — specified, not gestured at: for **primitive**
  `ψ mod u` and `φ mod v` with parity `ψ(−1)φ(−1) = (−1)^k` and a raising parameter `t` with
  `tuv ∣ N`, the series `E_k^{ψ,φ,t} ∈ M_k(N, ψφ)` (zero-extended nebentypus at the level),
  with `q`-expansions via generalized Bernoulli numbers and twisted divisor sums, and the
  Eisenstein subspace they span. The exceptional weights are stated, not smoothed over: at
  `k = 2` the trivial pair is not modular and the corrected combination `E₂(z) − t·E₂(tz)`,
  `t > 1`, replaces it (at `t = 1` it is zero and replaces nothing); weight `1` carries its
  own parity constraints. Connecting these to Mathlib's
  `eisensteinSeries` (an additive congruence-lattice sum at level `Γ(N)`) is a genuine
  translation layer — finite Fourier inversion and Gauss sums — and is part of this milestone,
  not bookkeeping.
  ⚠ Match Mathlib's `eisensteinSeries`/`gammaSet` indexing; do not introduce a second Eisenstein
  API.
- **The cusp–Eisenstein decomposition** `M_k(N,χ) = S_k(N,χ) ⊕ E_k(N,χ)` — the theorem, not
  just the series: define the constant-term maps at **all** cusps, identify their common
  kernel with `S_k(N,χ)`, prove the specified series span the image, and conclude directness
  with the dimension of the Eisenstein subspace — the exceptional weights separated (at
  `k = 2` the image satisfies the residue relation and the corrected combinations enter; at
  `k = 1` spanning and the linear relations are their own statement). Layer 7's sharp
  noncuspidal coefficient bound consumes exactly this decomposition; without it, an estimate
  "on the Eisenstein part" applies only to forms already known to be Eisenstein.

### Layer 1: the valence formula (general level)
- Consumes the [Contour Integration roadmap](../ContourIntegration/README.md). For a nonzero
  `f ∈ M_k(SL₂(ℤ))`, the **valence formula** is a sum over the
  `SL₂(ℤ)`-**orbits** of points of `ℍ` — `ord_P(f)` is constant on an orbit, hence well-defined
  on it — with the two **elliptic orbits** `[i]`, `[ρ]` weighted by the reciprocal `1/e_P` of
  their stabilizer orders (`e_i = 2`, `e_ρ = 3`) and the cusp `∞` contributing `ord_∞`. The
  statement is AINTLIB's, already proved — port the statement as it stands
  (`ForMathlib/ValenceFormulaFinal.lean`), under a Mathlib-style name: the `_textbook` suffix
  is an AINTLIB-internal disambiguator and does **not** survive the port (`valence_formula`):
  ```lean
  theorem valence_formula_textbook {k : ℤ} (f : ModularForm (Gamma 1) k) (hf : f ≠ 0) :
      (orderAtCusp' f : ℂ) +
      (1/2 : ℂ) * ↑(orderOfVanishingAt' (⇑f) ellipticPointI') +
      (1/3 : ℂ) * ↑(orderOfVanishingAt' (⇑f) ellipticPointRho') +
      ∑ᶠ (q : NonEllOrbitFM), ordOrbitQ f q =
      (k : ℂ) / 12
  ```
  in text: `ord_∞(f) + ½·ord_i(f) + ⅓·ord_ρ(f) + Σ_q ord_q(f) = k/12`, the sum running over the
  non-elliptic `SL₂(ℤ)`-orbits of `ℍ`; equivalently `Σ_{P ∈ SL₂(ℤ)\ℍ*} (1/e_P)·ord_P(f) = k/12`
  over the orbits of the extended upper half-plane `ℍ* = ℍ ∪ {cusps}`. ⚠ The summation index is
  **orbits in `ℍ`, not points** — exactly the `∑ᶠ` over `NonEllOrbitFM` above.
- The proof is the contour integral of `f'/f` around the fundamental-domain boundary; `i` and `ρ`
  sit **on** that contour, so their weights are the Hungerbühler–Wasem generalized
  winding numbers of points on a cycle (Contour roadmap): `½` at `i`, and `1/6` at **each** of
  the two `ρ`-corners of the standard domain, summing to the orbit's `⅓` after boundary
  identification — the precise reason the elliptic weights are `1/e_P`.
- **General level — by the coset norm, not "the covering".** The compactified map
  `X(Γ) → X(1)` is ramified, and a level-`Γ` form is not the pullback of a level-one form, so
  nothing follows by "pushing through the covering". The elementary route is the **norm map**, indexed by the
  **full** coset space — `Nm(f) = ∏_{γ ∈ Γ\SL₂(ℤ)} f∣[k]γ`, a level-one form of weight
  `k·[SL₂(ℤ):Γ]`, exactly as in AINTLIB's `dim_gen_cong_levels` — and ⚠ never by projective
  cosets: for odd `k` with `−I ∉ Γ` (the only case admitting nonzero odd-weight forms),
  `f∣[k](−γ) = −f∣[k]γ`, so a `±Γ`-indexed product changes sign with the choice of
  representatives and is not well-defined. When `−I ∈ Γ` or `k` is even the cosets pair under
  `γ ↔ −γ` and the full-coset computation is twice the projective one — divide by `2` at the
  end; equivalently, in odd weight one may apply the projective norm to `f²`, whose even
  weight also doubles the half-integral irregular-cusp orders into integers, the cleanest way
  to keep the order bookkeeping integral. Applying the level-one formula to `Nm(f)` and
  distributing orders over the product with the orbit/stabilizer/cusp-width bookkeeping
  yields `Σ_{P ∈ Γ\ℍ*} (1/e_P)·ord_P(f) = k·[SL₂(ℤ):±Γ]/12`, the input both to low-weight
  vanishing and to the dimension formulas (Layer 10). The order dictionary this needs is a milestone set
  of this layer, stated here because the theorem quantifies over every finite-index `Γ`:
  orders at interior points through the finite `PSL₂`-stabilizers; orders at cusps read in the
  **width parameter** (`ℚ`-valued at irregular cusps in odd weight — the errata convention of
  Layer 10 is *hoisted here*, a standing convention from this layer on); and finite support of
  the order divisor of a nonzero form — proved **here**, from the norm map and the level-one
  finite-zeros statement (the zeros of `Nm(f)` dominate those of `f`), keeping this layer
  independent of the Layer-10 compactification.
- The **Sturm bound** heading into Mathlib (`sturm_bound_finiteIndex`, Layer 10) is the
  *inequality shadow* of this formula — `ord_∞(f) ≤ k·[SL₂(ℤ):±Γ]/12` for `f ≠ 0` (the
  projective index; the `[SL₂(ℤ):Γ]` form is the weaker consequence when `−I ∉ Γ`), with
  `ord_∞` read in the width parameter — proved there by the same norm-map device with no
  contour integration. The valence formula is what upgrades that inequality to the exact `k/12` mass
  count, and it is absent from Mathlib at every level; it is this roadmap's route to the exact
  dimension formulas.

### Layer 2: Hecke operators and the Hecke algebra
- **(a) The Hecke ring, stated at `GL_n` — consume Mathlib's abstract ring, migrate AINTLIB's
  `GLn/` development.** The double-coset ring of a Hecke pair is
  landing in Mathlib (`NumberTheory/HeckeRing/Defs.lean` #41251, merged; the convolution ring
  structure in review, #41253–#41256, #41277, #41279, #41328 — see *What Mathlib already has*): `IsHeckeTriple`,
  `HeckeCoset`, `𝕋 Δ H Z`, with the finiteness (`Γ ∩ gΓg⁻¹` of finite index, so `ΓgΓ = ⊔ᵢ gᵢΓ`
  is a finite union of cosets) packaged in the commensurator conditions. On top of it this
  roadmap states the concrete theory at **general `n`**, where AINTLIB has already built most of
  it (`HeckeRIngs/GLn/*`): the pair `(SL_n(ℤ), Δ_n)` with `Δ_n` the positive-determinant
  integral matrices (Shimura §3.2; `GLn/Basic.lean`); **commutativity** via the transpose
  anti-involution fixing every double coset (Shimura Prop 3.8; `mul_comm_of_antiInvolution`,
  `GLn/TransposeAntiInvolution.lean` — sorry-free at general `n`); the degree map
  (`GLn/Degree.lean`); the elementary-divisor parametrization of double cosets by diagonal
  representatives with coprime factorization (`GLn/DiagonalCosets.lean`,
  `GLn/PrimeDecomposition.lean`, `GLn/CoprimeMul.lean`); and the `p`-local ring `R_p` with
  **Shimura's Theorem 3.20**: `R_p ≅ ℤ[T(p,1,…,1), …, T(p,…,p)]`, a polynomial ring on the `n`
  diagonal prime cosets (`GLn/PolynomialRing.lean` — proved for `n = 2`; at general `n` two
  named steps remain, and they must contain: uniqueness of the leading double coset in the
  triangular expansion, leading coefficient `1` — a triangular formula whose leading coefficient
  is a power of `p` gives rational but not integral generation — well-foundedness of the
  weight-then-dominance order, and recovery of the generator exponents from the leading
  elementary-divisor vector). Congruence level stays at `n = 2` (Shimura §3.3; AINTLIB
  `GLn/CongruenceHecke/*`): the pairs `(Γ₀(N), Δ₀(N))`, `Γ₁(N)` (`Gamma0_pair`,
  `Gamma1Pair.lean`), the surjection `R(SL₂(ℤ), Δ) →+* R(Γ₀(N), Δ₀(N))` of Shimura Thm 3.35
  with kernel generated by `T(p,p)` for `p ∣ N`, and commutativity at level `N` by the
  Atkin–Lehner anti-involution. Keep the abstract ring separate from its action, so the
  structural facts are proved once, at the generality where they live.
- **(a′) The hand-off to the automorphic-representations roadmap.** That roadmap's spherical
  Hecke algebras are instances of this layer, so two milestones are stated here for it to
  consume. First, the identification of the `p`-integral part with the genuinely `p`-adic
  double-coset ring of the pair `(GL_n(ℤ_p), M_n(ℤ_p) ∩ GL_n(ℚ_p))`; Rhodes–Shemanske §2 give
  the comparison chain `H(SL_n(ℤ), M_n^+(ℤ)) ↪ H(SL_n(ℤ), GL_n^+(ℚ)) ≅ H(GL_n(ℤ), GL_n(ℚ))`,
  the left map an injection only. ⚠ The identification is more than a bijection of double-coset
  bases: the structure constants must agree, which is a lattice-counting comparison under
  `L ↦ L ⊗ ℤ_p` (finite-index sublattices of `ℤⁿ` with `p`-primary quotient correspond to
  finite-index `ℤ_p`-lattices, preserving relative elementary divisors) — state "local–global
  compatibility of the coset decompositions and structure constants" as its own milestone,
  together with the determinant-sign lemmas (Smith normal form with positive diagonal entries
  via `SL_n(ℤ)`-changes of basis; `−Iₙ` creates no new double coset for either parity of `n`;
  embedding matrices into `ℚ_p` gives the ring homomorphism only once the coset decompositions
  are matched, not before). Second, inverting the central coset `T(p,…,p)` to obtain the full
  local algebra `ℤ[T_{p,1}, …, T_{p,n−1}, T_{p,n}^{±1}]` (Rhodes–Shemanske) — the ring on which
  that roadmap's Satake theory begins. (Consumer and status, so this block is not caught
  between "required here" and "handed off": the consumer is the **automorphic-representations
  roadmap, TauCetiRoadmap PR #120**, whose review pins exactly these two milestones as its
  Hecke hand-off; the `n = 2` theory is complete in AINTLIB; general `n` has exactly the two
  named steps recorded in (a); and the completion criterion is `R_p_isPolynomialRing`
  sorry-free at general `n` together with the two hand-off milestones. Only the `n = 2`
  specialization is consumed by the classical trunk of this roadmap.)
- **(b) The action on forms.** `Tₙ`, `Tₚ` as `ℂ`-linear endomorphisms of `M_k(Γ₁(N))` preserving
  `M_k(N,χ)` and `S_k(N,χ)`, the ring homomorphism from the abstract ring, and the explicit
  **`q`-expansion recurrences** — AINTLIB's shapes:
  ```lean
  -- the operator (HeckeRIngs/GL2/HeckeT_n.lean) and the ring action on the χ-space
  -- (HeckeRIngs/GL2/Unified/NebentypusHeckeRingHom.lean):
  def heckeT_n [NeZero N] (k : ℤ) (n : ℕ) [NeZero n] :
      Module.End ℂ (ModularForm ((Gamma1 N).map (mapGL ℝ)) k)
  noncomputable def heckeRingHomCharSpace :   -- Φ_χ
      𝕋 (Gamma0_pair N) ℤ →+* Module.End ℂ (modFormCharSpace k χ)
  -- a_m(T_p f) = a_{mp}(f) + χ(p) p^{k-1} a_{m/p}(f)   (p ∤ N case), etc. (Diamond–Shurman §5.2–5.3)
  ```
  with `Tₘ Tₙ = Tₘₙ` for `(m,n)=1` and the prime-power recurrence
  (`MultiplicationTable.lean`: `T_sum_mul_coprime`, `T_sum_ppow_recurrence`, and the general
  `T_sum_mul`). The Fourier-side statements (`FourierHecke.lean`) carry
  `f ∈ modFormCharSpace k χ` and `Nat.Coprime n N` — keep those hypotheses.
  ⚠ Adopt Diamond–Shurman's convention `χ(p) = 0` for `p ∣ N` (the `Newform.dirichletLift`
  zero-extension), so the single recurrence also covers the bad-prime operator (`p ∣ N`);
  AINTLIB's `p ∣ N` branch indeed carries no `χ` term.
  ⚠ State and keep one **normalization lemma** identifying the abstract double coset
  `[Γ₁(N)·diag(1,p)·Γ₁(N)]`, acting through the slash action, with the classical `Tₚ` of these
  recurrences; without it, powers of `p` drift between the abstract and classical sides of the
  ring homomorphism.
- **`Uₚ` is an alias, and that is a milestone.** With the convention above, at `p ∣ N` the
  recurrence reads `aₘ(Tₚ f) = a_{mp}(f)` — which is the *definition* of the operator modern
  papers call `Uₚ`. Following Miyake, D–S and Shimura, `Tₙ` is the primitive notion, defined
  for **all** `n`; `Uₚ` is introduced as notation at `p ∣ N` together with the lemma
  **`Uₚ = Tₚ`**, so that literature stated either way can be consumed without a translation
  layer. Similarly `T_{p^r} = Tₚ^r` at `p ∣ N` (AINTLIB `heckeT_ppow_eq_pow_of_not_coprime`),
  the degenerate case of the prime-power recurrence once `⟨p⟩ = 0`. ⚠ Do not introduce `Uₚ` as
  an independent operator, and do not let the zero-extended `⟨n⟩` masquerade as a diamond
  automorphism at non-units (conventions).
- **The diamond operators land in the Hecke algebra — in the right ring.** In the
  `Γ₁(N)`-pair ring the diamonds are honest double cosets `Γ₁(N)·γ·Γ₁(N)` for `γ ∈ Γ₀(N)`
  (`Γ₀(N)/Γ₁(N) ≅ (ℤ/N)ˣ`). In the `Γ₀(N)`-pair ring (`Gamma0_pair`, whose subgroup is
  `Γ₀(N)` itself) those cosets are the identity, and the diamond direction enters instead
  through the scalar cosets — AINTLIB's `heckeRingDn : 𝕋 (Gamma0_pair N) ℤ` — with the ring
  acting on each `M_k(N, χ)` through `heckeRingHomCharSpace`, `⟨d⟩` by the scalar `χ(d)`
  (immediate from Layer 0's `mem_modFormCharSpace_iff`). Keeping the two rings and their two
  diamond descriptions straight is part of the layer; their compatibility with the
  slash-defined `⟨d⟩` of Layer 0 is a **theorem** here, not a definition.
  ⚠ The action must preserve cuspidality and the nebentypus; prove that, don't assume it.

- The Hecke algebra in this roadmap is the classical double-coset ring of (a)–(b). Its adelic
  reformulation is **out of scope** here: the automorphic-representations roadmap consumes the
  `GL_n` ring of (a)/(a′) and builds the convolution comparison on its own side.

### Layer 3: the Petersson inner product, adjoints, oldforms and newforms
- **The Petersson inner product** as a genuine positive-definite Hermitian inner product on
  `S_k(Γ)` — AINTLIB's level-`N` pairing `petN` (`Modularforms/PeterssonLevelN.lean`), whose
  migrated construction carries its own milestone list rather than one verb "integrate": the
  invariant measure `dx dy/y²`, the effective `PSL₂` quotient (`−I` acts trivially), a
  measurable finite-volume fundamental domain for every finite-index subgroup with
  independence of the choice, convergence from decay at **every** cusp (not only `∞`), and
  positive-definiteness (`∫ = 0 ⟹ f = 0`),
  and **the Petersson adjoint of `Tₙ`** for `(n,N)=1`: `⟨Tₙ f, g⟩ = ⟨f, ⟨n⟩⁻¹Tₙ g⟩`, i.e.
  `Tₙ* = ⟨n⟩⁻¹Tₙ` on `S_k(Γ₁(N))` — AINTLIB `heckeT_n_adjoint`, hypotheses `[NeZero n]` and
  `Nat.Coprime n N`, `HeckeRIngs/GL2/AdjointTheoryPetersson.lean`. On `S_k(N,χ)` this reads
  `Tₙ* = χ(n)⁻¹Tₙ`, so the good `Tₙ` are **normal** (AINTLIB `heckeT_n_normal`), commuting,
  and hence admit a simultaneous **orthonormal** eigenbasis (AINTLIB
  `exists_simultaneous_eigenform_basis`; porting note — Mathlib's simultaneous-diagonalization
  API is stated for self-adjoint families, so the normal case is reached by splitting into
  commuting self-adjoint real and imaginary parts, or by porting AINTLIB's proof as is). They are genuinely self-adjoint on the
  trivial-character component, and more generally whenever `χ(n) = 1`; for non-real `χ` the
  eigenvalues need not be real, which is why normality — not self-adjointness — is the correct
  statement, and any old/new-stability argument must use the twisted adjoint together with
  diamond-operator stability.
- **Oldforms and newforms (the spaces):** the old subspace `S_k(N)^{old}` spanned by
  level-raising images `f(τ), f(dτ)` from proper divisors, the **new** subspace `S_k(N)^{new}` as
  its Petersson-orthogonal complement (AINTLIB `cuspFormsOld`, `cuspFormsNew`,
  `Newforms/Basic.lean`), their orthogonality and `Tₙ`-stability, and the fixed-character
  refinement with the **exact indexing**, since the conductor and bad-prime statements later
  hang on it: `S_k(N,χ)^{old} = Σ_{M ∣ N, cond χ ∣ M} Σ_{d ∣ N/M} V_d S_k(M, χ_M)`, where
  `χ_M` is the level-`M` descent of the primitive character of `χ` (its `changeLevel` back to
  `N` is `χ`), `V_d f(z) = f(dz)` is the level-raise in the fixed normalization, and the
  level- and character-transport lemmas are part of the degeneracy-map API; then
  `S_k(N,χ)^{new}` is the orthogonal complement of that subspace inside `S_k(N,χ)`, equal to
  `S_k(Γ₁(N))^{new} ∩ S_k(N,χ)` by diamond stability — a named lemma, not a remark.
  ⚠ **New**-subspace stability under the bad-prime `Uₚ` (`p ∣ N`) — equivalently the pairing
  statement `⟨Uₚ f_new, g_old⟩ = 0`, which is AINTLIB's flagged open `sorry`
  (`peterssonInner_aggregate_eq_zero_of_new_old`, `Newforms/AdjointTheoryBadPrime.lean`) — is a
  proof obligation of this layer, not a finished migration. The Fricke route is pinned
  theorem-by-theorem, so the gap has a definite closure and not a list of filenames:
  (i) the fundamental-domain tiling / trace identity relating levels `N` and `N/p`
  (`BadPrimeFDTiling`); (ii) Fricke transport of the degeneracy maps and of the oldspace
  (`FrickeOldStable`); (iii) the adjoint formula for `Uₚ` in each `p`-adic exponent case;
  (iv) orthogonality `⟪Uₚ f_new, V_d g⟫ = 0` against every degeneracy image; (v) the
  stability `MapsTo Uₚ S^{new} S^{new}`; (vi) the simultaneous bad-prime eigenbehaviour of a
  newform; (vii) the all-`Tₙ` upgrade (D–S Thm 5.8.2 / Miyake 4.6.13). State separately the
  cases `p ‖ N`, `p² ∣ N`, and `p ∣ cond χ` — the adjoint formula and the classification of
  Layer 4 differ across them.
  Note the direction: oldspace stability alone gives only `Uₚ*`-stability of the complement
  (`Uₚ` is not normal at `p ∣ N`); D–S Prop 5.6.2 asserts stability of **both** spaces under
  all operators, and that full statement is the target.

### Layer 4: eigenforms, newforms, primitive forms; the conductor

⚠ **Naming, on porting.** The structure below is AINTLIB's, and it is the *good-`n`* notion:
it constrains only `(n, N) = 1`. Per the conventions, it therefore ports as
**`EigenformAwayFromLevel`**, and the bare name `Eigenform` is reserved for the full
(all-`Tₙ`) notion of D–S Def. 5.8.1 — which AINTLIB currently carries as the predicate
`IsFullEigenform`. (AINTLIB's docstring cites "DS Definition 5.5.4" for its structure; D–S
5.5.4 is a *Theorem* — the good-Hecke simultaneous diagonalization — and the definition of
"eigenform" is 5.8.1. Fix the citation with the rename.)

- **Definitions — AINTLIB's actual shapes** (`Newforms/{Basic,Newform}.lean`), abridged:
  ```lean
  structure Eigenform (N : ℕ) [NeZero N] (k : ℤ)
      extends CuspForm ((Gamma1 N).map (mapGL ℝ)) k where     -- Γ₁(N) as a GL₂(ℝ)-subgroup
    χ : (ZMod N)ˣ →* ℂˣ                                       -- the nebentypus travels with the form
    mem_charSpace : toCuspForm.toModularForm' ∈ modFormCharSpace k χ
    ringEigenvalue : ℕ+ → ℂ                                   -- packaged eigenvalue data
    isRingEigen : ∀ n : ℕ+, Nat.Coprime n.val N → …           -- heckeRingDn n acts by ringEigenvalue n
                                                              --   via heckeRingHomCharSpace; good n only
    ringEigen_bad : ∀ n : ℕ+, ¬ Nat.Coprime n.val N → ringEigenvalue n = 0  -- pin bad n: no junk data

  structure Newform (N : ℕ) [NeZero N] (k : ℤ) extends Eigenform N k where
    isNew  : toCuspForm ∈ cuspFormsNewExtended N k            -- new-subspace membership
    isNorm : (UpperHalfPlane.qExpansion 1 toCuspForm).coeff 1 = 1   -- a₁ = 1
  ```
  with `PrimitiveForm := Newform` (the object that carries an LMFDB label), the eigenvalue API
  `Eigenform.eigenvalue`/`ringEigenvalue`, and the propositional `IsEigenform`/`IsFullEigenform`.
  Note the `Newform` shape matches Miyake's *primitive form* exactly — new subspace,
  normalized, eigen away from the level — which is why `PrimitiveForm := Newform` is the right
  identification and why the all-`n` upgrade stays a theorem.
  Two design points the packaging encodes, to keep: eigen-ness is demanded **only at `n`
  coprime to `N`** (the bad-`n` ring element lives in other double cosets), with the all-`n`
  upgrade for a `Newform` the **Atkin–Lehner–Li theorem** (`Newform.isFullEigenform`; D–S Thm
  5.8.2 / Miyake Thm 4.6.13), not a
  structure field. ⚠ **The bad-index slot carries no arithmetic.** `ringEigenvalue n` for
  `(n, N) > 1` is *not* the `Uₙ`-eigenvalue — the operator `Tₙ = Uₙ` exists perfectly well
  (Layer 2) and a newform *is* an eigenvector for it; the point is only that this *ring-side
  packaging* does not record it: the bad-prime ring element lies in a disjoint
  double-coset class and is not packaged by `isRingEigen` at all, so the slot is unconstrained
  and is **normalized to `0`** purely to avoid over-specification (without it, infinitely many
  `Eigenform` terms sit over one cusp form; with it, `Eigenform.ext_of_toCuspForm`). It is
  emphatically **not** a claim that `U_p f = 0` for `p ∣ N` — see the bad-prime milestone
  below, where the genuine eigenvalues live. `IsFullEigenform` quantifies over a *fresh*
  eigenvalue function, so no statement here is weakened by the convention.
  Two further **pinned porting decisions**: **(a) nonzeroness** — as displayed, the structure
  admits the zero cusp form (with arbitrary `χ`), while the conventions above define an
  eigenform as a *nonzero* simultaneous eigenvector; the port adds `ne_zero : toCuspForm ≠ 0`
  to `EigenformAwayFromLevel` (for `Newform` the `a₁ = 1` field already excludes zero).
  **(b) the total eigenvalue slot is implementation, not API** — the ported *public* eigenvalue
  interface exposes eigenvalues at good indices only (hypothesis-guarded by `Nat.Coprime n N`,
  or on a good-index subtype); the total `ringEigenvalue` with its zero-filled bad slots stays
  an internal representation detail (it exists to make `Eigenform.ext_of_toCuspForm` true), so
  no downstream statement can quietly consume a meaningless `0` at a bad index.
- **Bad-prime eigenvalues** (Atkin–Lehner–Li; Miyake Thm 4.6.17). The real content the slot
  above deliberately omits: for a newform `f ∈ S_k(N, χ)` and `p ∣ N`, the eigenvalue of `U_p`
  is the Fourier coefficient `a_p`, and with `c = v_p(cond χ)`,
  **`a_p ≠ 0 ⟺ v_p(N) = max(1, c)`** — explicitly, `a_p² = χ^{(p)}(p)·p^{k-2}` (so
  `|a_p| = p^{(k-2)/2}`, and `a_p = ±p^{(k-2)/2}` exactly when `χ^{(p)}(p) = 1`, e.g. trivial
  nebentypus) when `v_p(N) = 1` and `c = 0`; `|a_p| = p^{(k-1)/2}` — note the **different
  exponent** — when `v_p(N) = c ≥ 1`; and `a_p = 0` otherwise (`c = 0` with `v_p(N) ≥ 2`, or
  `0 < c < v_p(N)`). Here `χ^{(p)}` is the prime-to-`p` part of `χ` — defined through the CRT factorization of
  the primitive character attached via the conventions' `MulChar` bridge (a definition
  milestone of this layer, with `p^{(k−2)/2}` and the absolute values read in `ℝ`). Worked instances: the
  level-`11` weight-`2` newform has `a₁₁ = 1 = ±11^0`; the level-`7` weight-`3` newform
  `7.3.b.a` has `a₇ = −7`, matching `7^{(3-1)/2}` and *not* `7^{(3-2)/2}`. This milestone is
  where the bad-prime data actually lives.
- **The Atkin–Lehner Main Lemma** (Diamond–Shurman Thm 5.7.1 — D–S title §5.7 "The Main Lemma"
  and label the theorem so; outside that book the bare phrase is ambiguous, so always cite it):
  a cusp form `f ∈ S_k(Γ₁(N))` whose Fourier coefficients vanish at every index coprime to `N`
  (`aₙ = 0` whenever `(n, N) = 1`) is an **oldform** — in the sharp form D–S prove,
  `f = Σ_{p ∣ N} ι_p f_p` with `f_p ∈ S_k(Γ₁(N/p))` and `(ι_p f_p)(z) = f_p(pz)`, which is
  what the decomposition arguments downstream actually consume. In the latest AINTLIB this is **fully
  proved**, global statement included: `mainLemma` (`Newforms/MainLemmaProof.lean`) follows by
  nebentypus decomposition from the per-character route `mainLemma_charSpace_routeB`
  (`StrongMultiplicityOne.lean`, Miyake's sieve/conductor descent) — a migration, not a new
  proof obligation.
- **The level-lowering dichotomy for rescaled forms** (Miyake Thm 4.6.4 — this *is* 4.6.4;
  the packaged theorem below is Miyake **Cor 4.6.20**, so do not cite 4.6.4 for it). What
  AINTLIB proves — `sorry`-free, hypotheses
  and all (`conductor_theorem_dichotomy_cuspForm_strong`, `Eigenforms/ConductorTheorem.lean`) —
  is the level-lowering step: for `l ∣ N`, `χ : DirichletCharacter ℂ N`, and a `T`-periodic
  `f : ℍ → ℂ` whose level-raise by `l` lies in `S_k(N, χ)`, **either** `χ` factors through `N/l`
  and `f` is itself a cusp form in `S_k(N/l, χ↓)` for the lowered character, **or** `f = 0`.
  Port that statement as-is; the packaged **newform decomposition** — the existence and
  uniqueness of the associated primitive form; "the conductor theorem" is *not* standard
  terminology and is avoided (Miyake Cor 4.6.20; Diamond–Shurman Thm 5.8.3 with Prop 5.8.4 and
  Exercise 5.8.6(b), the last invoking strong multiplicity one for uniqueness) — every normalized good-Hecke
  eigenform at level `N` shares its eigenvalues away from `N` with a **unique** newform `g` of
  a **unique** minimal level `M ∣ N`, its **conductor**, and lies in the associated oldspace
  `span { g(dz) : d ∣ N/M }` — with the character stated, or the degeneracy maps do not
  type-check: `g ∈ S_k(M, χ_M)` where `χ_M` is the level-`M` descent of the primitive
  character of `χ` and `changeLevel` returns it to `χ` at level `N` (in particular
  `cond χ ∣ M`), and the level-raise is `V_l f(z) = f(lz)` (this normalization, fixed once) —
  is the target assembled from the dichotomy and the Main Lemma. ⚠ The target splits in two, and the split is part of the dependency graph: **(4A,
  existence)** — every normalized `EigenformAwayFromLevel` at ambient level `L` has an
  associated primitive pair `(M, g)` with `M ∣ L`, lying in the oldspace generated by `g` —
  is assembled here from the dichotomy and the Main Lemma; **(4B, uniqueness)** — the pair
  `(M, g)` is unique — closes only after Layer 5, by the **newform–newform cross-level**
  strong multiplicity one stated there (Miyake Thm 4.6.19; a different theorem from the
  fixed-space 4.6.12). The uniqueness is of `(M, g)` — **not** of the eigenform
  itself: an `EigenformAwayFromLevel` records eigen-ness only at `n` coprime to `N`, so at level `2M` every
  normalized `g(z) + c·g(2z)` qualifies (generally *not* a `Uₚ`-eigenvector, hence not a full `Eigenform`), and the `Uₚ`-eigenvectors in the oldspace are the
  `p`-stabilizations — nontrivial combinations, not single degeneracy images `g(dz)`. Do not
  strengthen the conclusion to "`f` *is* a level-raise of `g`"; it is false in exactly these
  examples.

### Layer 5: strong multiplicity one and the eigenform characterization
- **Strong multiplicity one, fixed space** (Miyake Thm 4.6.12 — the fixed-`(N, χ)` form;
  Miyake's own hypothesis is agreement at all `n` prime to an auxiliary `L`, while AINTLIB's
  migrated packaging allows failure at a finite exceptional `Finset` of good indices — state
  the migrated form, note the variant; Diamond–Shurman Thm 5.8.2 is the all-`(n,N) = 1`
  version, and D–S defer the strong form to [Miy89]),
  **as proved in
  AINTLIB** (`strongMultiplicityOne`, `StrongMultiplicityOne/ConstantMultiple.lean`): two
  `Newform N k` **with the same nebentypus** — both underlying forms in `modFormCharSpace k χ` —
  whose eigenvalues agree at every index `n` coprime to `N` outside a **finite exceptional set**
  are equal. Keep all three hypothesis groups: same level and weight (in the type), the shared
  `χ`, and the finite exceptional set of coprime indices (that finite slack is the "strong";
  nothing is assumed at `p ∣ N`). The key step is `strongMultiplicityOne_constMul` — a `Newform`
  and an `EigenformAwayFromLevel` (AINTLIB's `Eigenform` structure, per the naming note of
  Layer 4) sharing eigenvalues are proportional — and `a₁ = 1` pins the constant to `1`.
- On top of the migrated theorem, the further targets of this layer: **multiplicity one**
  (each simultaneous eigenspace of the good `Tₙ` **within a fixed character space**
  `S_k(N,χ)^{new}` is one-dimensional) and the newforms as an **orthogonal basis** of
  `S_k(Γ₁(N))^{new}` (the closing clause of Diamond–Shurman Thm 5.8.2; Miyake Thm 4.6.13(2)).
- **Cross-level strong multiplicity one, for newforms** (Miyake Thm 4.6.19): two normalized
  newforms `f`, `g` of the same weight and of levels `N`, `M` whose eigenvalues `a_p` agree at
  all but finitely many primes `p ∤ NM` satisfy `N = M`, have the same nebentypus, and are
  equal. ⚠ The hypothesis must be **newform against newform** — a good-Hecke eigenform at an
  ambient level does *not* determine its level: a newform `g` of level `N`, viewed at level
  `Nq` for `q ∤ N`, is a normalized `EigenformAwayFromLevel` with the same good eigensystem at
  the larger level, and so is every member of its oldspace. (Miyake's own 4.6.19 compensates
  differently, assuming eigen-ness under `T(M) ∪ T*(M)`, adjoints included; the
  newform–newform form is the one this roadmap consumes.) This is a **different theorem**
  from the fixed-space statement above, it is what Layer 4's conductor uniqueness (its part
  4B) actually consumes, and it is a named target of this layer.
- **Diamond–Shurman Proposition 5.8.5** (the coefficient characterization): for `f ∈ M_k(N,χ)`,
  `f` is a normalized eigenform **iff** its Fourier coefficients satisfy
  ```text
  (1)  a₁ = 1
  (2)  a_{p^r} = a_p·a_{p^{r-1}} − χ(p)·p^{k-1}·a_{p^{r-2}}   for all primes p and r ≥ 2
  (3)  a_{mn} = a_m·a_n   whenever (m,n) = 1.
  ```
  This is what the Euler product (Layer 7) rests on: conditions (2)–(3) are exactly
  multiplicativity of the Dirichlet series.

### Layer 6: Atkin–Lehner and Fricke operators
- The Atkin–Lehner involutions `W_Q` for each **exact divisor** `Q ‖ N` — meaning `Q ∣ N` with
  `gcd(Q, N/Q) = 1`; standard (also "unitary divisor", "Hall divisor"), but **define the
  notation**, since `pʳ ‖ N` elsewhere means exact `p`-adic divisibility — the **Fricke
  operator** — under the arithmetic normalization the raw slash by `[0,−1;N,0]` is *not* an
  involution: the normalized operator is `𝒲_N = (√N)^{2−k}·(· ∣[k] [0,−1;N,0])` (AINTLIB's
  `frickeScalar` normalization), defined once, and every statement below is about the
  normalized `𝒲_Q` — and their relations with `Tₙ` (commute away from `Q`). Every exact divisor is `∏_{p ∈ S} p^{v_p(N)}` for a set `S` of
  primes dividing `N`, so the family is generated by the prime-power `W_{p^{v_p(N)}}` and (for
  trivial nebentypus) the abstract Atkin–Lehner group `(ℤ/2)^{ω(N)}` **acts** through the
  `𝒲_{p^{v_p(N)}}` with `𝒲_Q 𝒲_R = 𝒲_{QR/gcd(Q,R)²}` — an action, possibly with kernel, not
  an isomorphism onto an operator subgroup: general `Q` is packaging convenience, and the
  prime-power case alone suffices for the sign theory.
- **The signs, at the right generality.** For **trivial nebentypus** — Atkin–Lehner's
  setting, where the space vanishes in odd weight (parity lemma), so `k` is even and
  `𝒲_Q² = 1` — the `𝒲_Q` are involutions of `S_k(Γ₀(N))` commuting with the good `Tₙ`, and on
  a newform `𝒲_Q f = ε_Q(f)·f` with `ε_Q ∈ {±1}`, the signs multiplying to the Fricke
  eigenvalue `ε_N`. ⚠ The sign of the functional equation is `i^k·ε_N = (−1)^{k/2}·ε_N`, not
  `ε_N` alone — Layer 7's equation carries `i^k`; pin the convention once. For **general nebentypus** the `𝒲_Q` need not even preserve the
  `χ`-space (the `Q`-part of the character conjugates: `χ_Q·χ_{N/Q} ↦ χ̄_Q·χ_{N/Q}`): the Fricke operator sends a primitive form to a scalar multiple of its **conjugate
  form** (`f ∣ W_N = c·f_ρ`, with `f_ρ` the primitive form with conjugated coefficients —
  Miyake Thm 4.6.15(2)), and the right invariants are the Atkin–Li **pseudo-eigenvalues**
  `λ_Q(f)` of modulus `1`. State the `±1` sign theorems for trivial `χ` only; a genuine FE sign
  beyond that needs `f` self-dual (`f = f_ρ`).
- AINTLIB provides the Fricke side to migrate — `frickeOperator`/`frickeOperatorCusp`, the
  normalizing `frickeScalar`, and the character-space transport `frickeCharRestrict`/
  `frickeCharEquiv` (`HeckeRIngs/GL2/Fricke.lean`), with old-space stability in
  `Newforms/{FrickeOldStable,BadPrimeTraceFricke}.lean`. The general `W_Q` family for `Q ‖ N`
  and the sign theory on newforms are **new** here.

### Layer 7: L-functions
- **The L-function** `L(s,f) = Σ_{n≥1} aₙ(f)·n^{-s}` (AINTLIB `lCoeff`/`lSeries`,
  `Modularforms/LFunction.lean`), built on Mathlib's `LSeries`, with **convergence** as proved,
  on arithmetic subgroups (the `Γ.IsArithmetic` class): abscissa `≤ k/2 + 1` for cusp forms
  (`abscissaOfAbsConv_lCoeff_le_cuspForm` — the cusp-form half of Diamond–Shurman Prop 5.9.1,
  from Hecke's `aₙ = O(n^{k/2})`), and `≤ k + 1` for modular forms **of weight `k ≥ 0`**
  (`abscissaOfAbsConv_lCoeff_le` carries the hypothesis `0 ≤ k` — keep it). ⚠ The non-cuspidal
  bound comes from Mathlib's `aₙ = O(nᵏ)` and is **weaker** than D–S Prop 5.9.1, whose
  non-cuspidal statement is `Re s > k` (via `aₙ = O(n^{k−1})`); **tightening the non-cuspidal
  abscissa to `≤ k` is a milestone of this layer** — for `k ≥ 3` by the divisor-sum estimate
  `aₙ = O(n^{k−1})` on the Eisenstein part; ⚠ at `k = 1, 2` that estimate is **false**
  (`σ₁(n)` is not `O(n)`), and the abscissa `≤ k` is reached instead through the ε-family
  `aₙ = O(n^{k−1+ε})` and `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable` —
  aligning the roadmap with the result it cites without claiming a false bound.
- ⚠ **Where the character lives in the Euler product.** The formula below mentions `χ(p)`
  while `f` has type `Newform N k`, which looks as though the type has lost the nebentypus. It
  has not: `χ` is a **field of the structure** (conventions, Layer 4), carried by the form
  itself, and the Euler product evaluates it through the zero-extension
  `Newform.dirichletLift`. **Decided (v1): `χ` stays a field.** The port keeps AINTLIB's
  shape — migration fidelity, and `mem_charSpace` already recovers every per-`χ` statement.
  The parameter variant `Newform N k χ` (with `Σ χ, Newform N k χ` for uses that genuinely
  range over characters, e.g. LMFDB orbits, and Galois conjugation typed as
  `Newform N k χ → Newform N k (σ • χ)`) was weighed and is **not** v1: if a downstream
  application needs typed character preservation, that refactor is a scoped follow-up with its
  own review, not an implementor's choice mid-migration — consistent with the character-space
  definition of Layer 0 either way.
- **The Euler product** for a newform (from Prop 5.8.5; AINTLIB `lSeries_eulerProduct`,
  `Modularforms/LFunctionEuler.lean`): for `f : Newform N k` and `Re s > k/2 + 1`,
  `L(s,f) = ∏_p (1 − aₚ p^{-s} + χ(p) p^{k-1-2s})^{-1}` (#30), the nebentypus zero-extended to
  `p ∣ N` by `Newform.dirichletLift`.
- **The completed L-function and Hecke's functional equation — in AINTLIB's proved form**
  (`Modularforms/LFunctionFEqN.lean`): the completed `Λ_N(s, f)` via the Mellin transform of the
  imaginary-axis restriction, and, for weight `k > 0` on width-one-at-`∞` arithmetic carriers
  with `g = (√N)^{2−k} • (f ∣[k] W_N)` the Petersson-normalized **Fricke companion**,
  `Λ_N(k − s, f) = i^k · Λ_N(s, g)` (`lcompletedN_functional_equation`, specialized to the
  `Γ₁(N)` carrier as `…_Gamma1`); `Λ_N(·, f)` is **entire** (`differentiable_lcompletedΛN`) and
  `L(s,f)` has **analytic continuation** to `ℂ` (`lSeriesN_hasEntireExtension`). Port the
  two-form statement with its hypotheses (`0 < k`, strict width one, the companion equation);
  the one-form `Λ_N(s,f) = ±Λ_N(k−s,f)` with a genuine **sign** (Diamond–Shurman Thm 5.10.2, on
  the eigenspaces of the **normalized** `𝒲_N` of Layer 6) is the corollary once Layer 6 gives
  `𝒲_N f = ε·f` — trivial nebentypus, or self-dual `f = f_ρ` — with the sign `i^k·ε`, the
  `i^k` from the companion equation, per Layer 6's convention.
- **Analytic rank and analytic conductor** (#31): the analytic rank is the order of vanishing
  **of the entire continuation** at the central point `s = k/2` — the extension produced by
  `lSeriesN_hasEntireExtension`, with independence of the choice and its nonvanishing as
  stated lemmas. ⚠ Mathlib's raw `LSeries` is a `tsum`, identically `0` outside the
  summability half-plane, so `analyticOrderAt (LSeries …) (k/2)` is meaningless; the
  definition must never touch it. The conductor: and the **analytic conductor pinned** as Iwaniec–Kowalski (5.7) for
  the weight-`k` gamma factor: with `s_an := s − (k−1)/2` the analytic normalization (the
  central point `s = k/2` is `s_an = 1/2`, and the Γ-factor is
  `Γ_ℝ(s_an + (k−1)/2)·Γ_ℝ(s_an + (k+1)/2)` up to an explicit nonzero constant from the
  duplication formula, irrelevant to the conductor),
  `𝔮(f, s) := N · (|s_an + (k−1)/2| + 3) · (|s_an + (k+1)/2| + 3)`, and `𝔮(f) := 𝔮(f, k/2)`
  at the central point. This is the definition; do not substitute another normalization
  without renaming.

### Layer 8: modular symbols, the integral Hecke algebra, and coefficient fields

⚠ **This layer contains the roadmap's one genuinely non-elementary machine, and it is named
here rather than hidden in a file path** (review): the coefficient field is a number field
*because* of an integral structure, and the only route to that structure which stays inside
this roadmap's analytic scope is **Eichler–Shimura via modular symbols**. (The alternative —
`S_k(Γ) ≅ H⁰(X(Γ), ω^k)` over `ℚ` by GAGA and algebraic geometry — is a far bigger project
than this roadmap and is **out of scope**.) **Part of this development already exists, due to
Nicola Falciola** ([@Nicola9Falciola](https://github.com/Nicola9Falciola), VU Amsterdam) —
coordinate with that work rather than duplicating it, and credit it on migration; the AINTLIB
files below are attributed collectively, so check with him which pieces are his before
reassigning any milestone as new work. The milestones:

- **The modular-symbol module `𝕄 N k` — no group cohomology.** ⚠ The lattice is built
  **homologically and concretely**, not as parabolic cohomology: `𝕄 N k` is the
  `Γ₁(N)`-**coinvariants** of `Div⁰(ℙ¹(ℚ)) ⊗_ℤ Sym^{k−2}(ℤ²)` — degree-zero divisors on the
  cusps tensored with the weight coefficient system, modulo the group action. This is
  deliberate: it needs no `H¹`, no parabolic subgroup bookkeeping, and no cohomological
  comparison, and it is what the provenance actually uses. The milestone is that **`𝕄 N k` is a
  finite `ℤ`-module**, by AINTLIB's proved two-layer Manin-style argument (`ModuleMFinite`):
  a finite set whose `Γ₁(N)`-orbit spans `Div⁰` (via finitely many cusps and the difference
  description), then the `Sym^{k−2}`-tensor layer — port that argument as it stands. (The
  coinvariants may carry torsion and boundary/Eisenstein symbols: "lattice" here means the
  finitely generated integral Hecke module; pass to the torsion-free quotient where a lattice
  in the strict sense is wanted.) This is the Hecke-stable lattice of the whole story, and note
  where it lives: on the *symbol* side, so **no lattice inside the space of forms is ever
  constructed**
  (AINTLIB `ModularSymbols/{ModuleM,ModuleMFinite,CoefficientSystem,FinitelyManyCusps,CoinvariantsFinite}.lean`).
- **Manin symbols and the fundamental domain.** The `SL₂(ℤ)`-generation and fundamental-domain
  boundary apparatus that presents the symbol module concretely
  (`ModularSymbols/{SL2Generation,ManinFD,FundamentalDomainBoundary}.lean`) — also the entry
  point for any downstream *computation* (worked examples).
- **The Hecke action on symbols**, its commutativity, and its integrality
  (`ModularSymbols/{HeckeSymbol,HeckeCommute,HeckeFinite}.lean`).
- **The period map — into the `ℤ`-dual of the symbols, in three steps.** ⚠ It is **not** a map
  from forms to symbols: it is
  `periodMap' : S_k(Γ₁(N)) →ₗ[ℂ] (𝕄 N k →ₗ[ℤ] ℂ)`, so a cusp form becomes a `ℤ`-linear
  **functional on** the lattice. (That is the natural direction — symbols are cycles, forms are
  the things you integrate over them — and it is why the lattice sits on the *source* of the
  functionals and never has to be transported anywhere.) Build it as the provenance does:
  **(i) the raw pairing.** `rawPairing f : (Div⁰ ℤ ⊗_ℤ Sym^{k−2} ℤ) →ₗ[ℤ] ℂ`, sending
  `{α, β} ⊗ P` to `∫_β^α f(z)·P(z, 1) dz` along the geodesic — defined before any quotient,
  hence with no well-definedness obligation yet. ⚠ Both endpoints are cusps, so **absolute
  convergence of the improper integral** — from cusp decay of `f` after moving each endpoint
  to `i∞` — is its own milestone, before anything else about the pairing means anything.
  **(ii) `Γ₁(N)`-invariance — the one analytic input of this step.** `IsPeriodInvariant f`:
  precomposing `rawPairing f` with the diagonal action of `γ` leaves it unchanged
  (Shimura (8.2.15)/(8.2.16)). Its algebraic half is the `Sym^{k−2}`-action identity; its
  analytic half: the substitution `z ↦ γz` carries the geodesic `β → α` to the geodesic
  `γβ → γα` (the endpoints of the translated symbol), and path-independence **within `ℍ`**
  (holomorphic integrand on a simply connected domain, improper endpoints handled by the
  convergence milestone) compares the geodesic to the substituted path — never Cauchy between
  *different* endpoint pairs. State this as its own milestone; it
  is small, but it is where the analysis actually enters the *construction* (as opposed to the
  injectivity proof).
  **(iii) descent.** Given the invariance, `rawPairing f` descends through the coinvariants to
  `𝕄 N k →ₗ[ℤ] ℂ`, and `periodMap'` is the resulting `ℂ`-linear map.
  Then the **equivariance** milestones (`periodMap'_heckeEnd`, `periodMap'_diamond`):
  `periodMap' (Tₙ f) = (periodMap' f) ∘ Tₙ^{sym}` — note the operator appears by
  **precomposition**, i.e. as a transpose, which is exactly what the dual placement forces
  (`ModularSymbols/{PeriodMap,PeriodIntegral,PeriodInvariant,PeriodHecke}.lean`).
- **Injectivity of the period map** — the analytic heart, and there are two routes; the
  roadmap takes the one the provenance actually proves.
  **Route of record — the Eichler integral (Bol).** For `f ∈ S_k` let `E_f` be its **Eichler
  integral**, the `(k−1)`-fold antiderivative, so that Bol's identity gives
  `f = ((2πi)^{−1})^{k−1}·D^{k−1}E_f`. Assume every period of `f` vanishes. Then, in order:
  **(i)** `E_f∣[2−k]γ − E_f` is the *period polynomial* of `f` at `γ`, of degree `≤ k−2` with
  the periods as coefficients — so it vanishes, and `E_f` is genuinely `Γ₁(N)`-invariant in
  weight `2 − k`;
  **(ii)** `E_f` is **bounded at every cusp** — this is where the analysis sits, and it splits
  in two: at `i∞` from cusp decay of `f` by a dominated-integral bound; at a **finite** cusp
  (`γ·∞ ≠ ∞`) by slashing — the transformation discrepancy `E_f∣[2−k]γ − E_g`, `g = f∣[k]γ`,
  is a polynomial of degree `≤ k − 2` whose coefficients are periods of `f` (AINTLIB
  `eichler_slash_invariant` is the proved form; the display here compresses it), so vanishing
  periods make `E_f∣[2−k]γ` an Eichler integral of the conjugate form, bounded by the same
  `i∞` estimate;
  **(iii)** so `E_f` is holomorphic, invariant in weight `2 − k ≤ 0`, and bounded at all cusps.
  ⚠ The step "bounded + invariant of weight `≤ 0` ⟹ constant (zero if the weight is negative)"
  is a **named sub-theorem**, not a remark — the maximum-principle argument on a fundamental
  domain with cusp neighbourhoods (the lemma underlying AINTLIB `eichler_eq_zero`), proved
  **locally in this layer**: nothing is consumed from Layer 10's compactification. Record it
  as a milestone. For `k > 2` the strictly negative weight then forces `E_f = 0` outright; at
  `k = 2` the weight is `0` and one gets only **constancy** — the constant then vanishes because the `q`-expansion
  Eichler integral is normalized with zero constant term (`eichlerCoeff f m = a_m/m^{k−1}`,
  `m ≥ 1`, so `E_f → 0` at `i∞`). Either way `f = D^{k−1}E_f = 0` — and constancy alone would
  already suffice, since the derivative kills constants.
  ⚠ Note `k ≥ 2` is used twice (Bol needs `k − 1 ≥ 1`; step (iii) needs `2 − k ≤ 0`), which is
  precisely why weight `1` is outside this method. And note what never appears: no Stokes
  theorem, no Petersson product, no cup product — only contour manipulation and growth
  estimates, which is why this route came out axiom-clean while the alternative below did not
  (`ModularSymbols/EichlerInjective.lean`: `eichler_slash_invariant`, `eichler_bdd_at_cusp`,
  `eichler_eq_zero`, `bol_iterated_eichler`, capstone `periodMap'_injective_eichler`).
  **Alternative — Shimura's period pairing.** The real bilinear pairing `A(f, g)` of Shimura
  §8.2 (8.2.17)/(8.2.22): a Green's/region-Stokes identity rewrites the Petersson *area*
  integral over a fundamental domain as a *boundary* integral of an exact form, and
  non-degeneracy of `A` then forces `f = 0`. This is the classical "periods determine the
  Petersson norm" argument. ⚠ It is carried in the provenance in Shimura's **integral** form
  (`ModularSymbols/{PeriodInjective,PeterssonStokes}.lean`), and `PeterssonStokes.lean` is
  where the open analytic input (`interior_edges_cancel_sum`) sits. Its usual cohomological
  packaging — Haberland's cup-product formula on parabolic cohomology — is **not** used here
  and is **not** in the provenance; this roadmap deliberately keeps group cohomology out of
  the layer entirely, so do not describe the analytic heart as "a cup product".
- **The transfer to the form side — a free-algebra kernel inclusion, and no analysis at all.**
  This is the step that answers "where is the Hecke-stable lattice?", so state it in full.
  There is **no lattice inside `S_k`**: the integral object is `𝕄 N k`, integral by
  construction, and Hecke-stable for free because the operators are *defined* on symbols. The
  transfer is then pure algebra (`heckeAlgℤ_finite_of_period`):
  **(i)** index the generators by `Idx = ℕ⁺ ⊕ (ZMod N)ˣ` and form two evaluation `ℤ`-algebra
  maps out of the **free** `ℤ`-algebra on `Idx` — `evalS` into `End_ℂ(S_k)`, whose range *is*
  `heckeAlgℤ N k`, and `evalM` into `End_ℤ(𝕄 N k)`. Free, so the universal property applies
  even though the endomorphism rings are noncommutative.
  **(ii)** `𝕄` is `ℤ`-finite and `ℤ` is noetherian, so `End_ℤ(𝕄)` is `ℤ`-finite, hence so is
  `range evalM`.
  **(iii)** the generator equivariance extends along the free algebra by induction, and
  injectivity of `periodMap'` then gives **`ker evalM ≤ ker evalS`**.
  **(iv)** so `FreeAlgebra ⧸ ker evalM ↠ FreeAlgebra ⧸ ker evalS ≅ range evalS = heckeAlgℤ`,
  and `ℤ`-finiteness transports along the surjection.
  ⚠ One hypothesis in (iii) is not decoration: the transpose `dualPrecomp` is an
  **anti**-homomorphism, so the multiplicative step of the induction needs the two images to
  commute — which is why **Hecke commutativity on the symbol side** is an explicit input.
  Note what this argument does *not* need: no Eichler–Shimura **isomorphism**. Injectivity
  alone makes the form-side algebra a *quotient* of the symbol-side one, which is all that
  `ℤ`-module-finiteness requires. The comparison `𝕄 ⊗ ℂ ≅ S_k ⊕ \overline{S_k}` — which holds for the **cuspidal
  (boundary-kernel) part** of the symbol module; the full module carries boundary/Eisenstein
  symbols — would upgrade the quotient to a faithful embedding, and is **not** a milestone
  here.
- **And then the coefficient field, in two lines.** `heckeAlgℤ` module-finite over `ℤ` makes
  every `Tₙ` integral over `ℤ`, hence every eigenvalue `aₙ` an **algebraic integer**; the
  eigenvalue homomorphism therefore has `ℤ`-finite range (`newformEigenHom_range_finite`), so
  `ℚ(aₙ : n)` is a finite-dimensional `ℚ`-algebra which is a domain, hence a field — a number
  field (`finiteDimensional_coeffField_of_rangeFinite`).

- **The coefficient field** `CoefficientField f = ℚ(aₙ : n) ⊆ ℂ` of a newform (#34), and the
  headline result that **it is a number field**. ⚠ **This is already constructed and proved in
  AINTLIB** — the layer's headline is a *migration*, not new mathematics: `Labels/NewformOrbit.lean`
  defines `coeffField` and proves `coeffSeq_isIntegral` (the coefficients are algebraic
  integers), `finiteDimensional_coeffField_of_rangeFinite`, the live **instance**
  `instNumberFieldCoeffField`, and `coeffField_numberField_of_two_le`, on top of
  `Labels/{HeckeFieldArithmetic,HeckeAlgFiniteFinal}.lean` (the integral Hecke algebra and its
  finiteness) and the modular-symbol period route above. What is *not* already done is the
  weight-1 branch (below) and the CI/axiom audit the migration owes. AINTLIB's shapes
  (port name `CoefficientField` per the conventions):
  ```lean
  def coeffField (f : Newform N k) : IntermediateField ℚ ℂ
  instance instNumberFieldCoeffField (f : Newform N k) : NumberField (coeffField f)
  theorem coeffField_numberField_of_two_le (f : Newform N k) (hk : 2 ≤ k) :
      NumberField (coeffField f)          -- the axiom-clean route, no weight-1 input
  ```
  proved via the **integral Hecke algebra `heckeAlgℤ N k` is a finitely generated ℤ-module** —
  from the modular-symbol lattice above, so that every `Tₙ` is integral over `ℤ`, every
  eigenvalue `aₙ` is an **algebraic integer**, and `ℚ(aₙ : n)` is a finite-dimensional domain
  over `ℚ`, hence a number field (Shimura Thm 3.48/3.51/3.52; Miyake §4.5 — cite the section, not a
  single theorem number).
  ⚠ **The weight split is real and is stated, not smoothed over.** For `k ≥ 2` the finiteness
  is the modular-symbol period route above
  (AINTLIB `heckeAlgℤ_finite_of_two_le` / `ModularSymbols.heckeAlgℤ_finite_of_period`,
  axiom-clean), needing **no** lattice on the form side. **Weight 1 is outside this method
  entirely** — `Sym^{−1}` does not exist and weight-one forms are not cohomological in this
  sense. The headline theorem of this layer is therefore stated for `k ≥ 2`; weight `1`
  closes only through its own pinned sublayer **8W**, whose route is Deligne–Serre 1974
  Prop 2.7 — the *integral-`q`-expansions-at-all-cusps* lattice argument, preceding their
  Artin-representation construction, not via it — with the steps named: integral forms at
  all cusps; the finite free Hecke-stable lattice; stability under the good `Tₚ` and the
  diamonds (what Prop 2.7 itself gives); the `Uₚ` step as its **own** milestone, from
  Layer 4's bad-prime classification; and the passage from the lattice to algebraic-integral
  eigenvalues. No alternative route is left to the implementor. AINTLIB's `k < 2` branch
  (`heckeAlgℤ_finite_of_lattice`) still rests on the isolated unproved
  `exists_HeckeStableLattice_one`; sublayer 8W is its closure. `k ≤ 0` rests on the vanishing `S_k = 0` for `k ≤ 0` — cite the declaration on port, do not
  call it definitional. Do not present the unconditional statement as though one
  argument covered all weights.

### Layer 8G: Galois stability, the character field, and rationality

⚠ **This sublayer exists because "the coefficients are algebraic, so `σ` acts" is not a
proof.** An automorphism `σ ∈ Aut(ℂ/ℚ)` is not continuous, so it cannot be applied termwise
to analytic limits or to the transformation law; and AINTLIB's `Labels/NewformOrbit.lean` is
explicit that the well-definedness of `f ↦ f^σ` — that the conjugated system is again a
newform — is a deep stability statement **not proved there** (its orbit relation only relates
newforms already known to exist). The closure is algebraic, through the Hecke algebra, and is
**new formalization**:

- **The character field.** `CharacterField χ`, the subfield of `ℂ` generated by the values of
  `χ`, with the elementary but load-bearing inclusion `CharacterField χ ≤ CoefficientField f`
  for a newform `f ∈ S_k(N,χ)`: for `p ∤ N` the recurrence gives
  `χ(p) = (a_p² − a_{p²})/p^{k−1} ∈ CoefficientField f`, and every unit mod `N` has a
  positive representative coprime to `N`, whose prime factors are good, so multiplicativity
  extends the membership to every `χ(d)`. This is what types the relative orbit statements
  below.
- **The semisimple Hecke-algebra correspondence.** The finite Hecke algebra of the newspace
  over `ℚ(χ)` (or over `ℚ`, after summing the character orbit); the theorem that after
  `⊗ ℂ` its characters — equivalently its eigenlines — are exactly the normalized newforms
  of the space; and the observation that conjugating an algebra character by an embedding of
  its value field produces another character of the same algebra, hence another occurring
  eigensystem.
- **Galois stability and the conjugate newform.** `f^σ` is *defined* as the unique normalized
  newform with the conjugated eigensystem (uniqueness by Layer 5), for an **embedding**
  `σ : CoefficientField f ↪ ℂ` — embeddings of `K_f`, not chosen extensions to `Aut(ℂ)` —
  and the theorems `aₙ(f^σ) = σ(aₙ(f))` and `χ_{f^σ} = σ ∘ χ_f` follow. The orbit sizes are
  then theorems: `#orbit = [CoefficientField f : ℚ]` over the character orbit, and
  `[CoefficientField f : ℚ(χ)]` for embeddings fixing `CharacterField χ`.
- **Rationality of characteristic polynomials.** For fixed `χ`, the newspace has a
  `ℚ(χ)`-structure and `charpoly(Tₙ | S_k(N,χ)^{new}) ∈ ℚ(χ)[X]`, with the factorization
  `∏_{[f]} Norm_{K_f/ℚ(χ)}(X − aₙ(f))` (repeated and reducible factors allowed); summing over
  the character Galois orbit produces the corresponding polynomial over `ℚ`. These descent
  statements precede — and are consumed by — every Layer-9 bullet that mentions a Galois
  orbit or a characteristic polynomial.

### Layer 9: the LMFDB invariant layer
Each is a named definition with its basic API, mostly short once Layers 8 and 8G exist:
- **Hecke characteristic polynomials** (#35): `charpoly(Tₙ | S_k(N,χ)^{new})`, its
  coefficients from traces of powers via Newton's identities, and the factorization into the
  norm factors of the newform orbits — **consumed from Layer 8G's rationality statements**,
  which define the base field (`ℚ(χ)` for fixed `χ`; `ℚ` over the character orbit) and prove
  the descent. A single `Tₙ` need not separate orbits or generate the coefficient field, so
  the orbit decomposition is a statement about the joint Hecke algebra, of which any one
  charpoly is a shadow.
- **Satake parameters and angles** (#32): the unconditional object is the **unordered pair**
  `{α_p, β_p}` of roots of `X² − aₚX + χ(p)p^{k-1}` — defined for every good `p`, no hypotheses.
  A single **angle** is defined only where it is canonical: for trivial nebentypus (more
  generally, self-dual `f`), where `a_p/p^{(k-1)/2} ∈ ℝ`, and **under the Ramanujan–Deligne
  bound `|aₚ| ≤ 2p^{(k-1)/2}` as an explicit hypothesis**, set `θ_p ∈ [0, π]` by
  `a_p = 2p^{(k-1)/2}·cos θ_p`. For general complex `χ` there is no canonical single angle
  (one must choose a square root of `χ(p)` and quotient by the root swap), so the roadmap does
  not pretend to furnish one. Proving Ramanujan–Deligne is **not a target** — it needs the Weil
  conjectures and Deligne's reduction of Ramanujan to them, far outside the analytic scope
  here — which is exactly why the angle is packaged as conditional rather than presented as an
  unconditional invariant.
- **Galois-conjugate forms and orbits** (#38): `f^σ`, **as constructed in Layer 8G** — the
  unique newform with the conjugated eigensystem, not a termwise action on an analytic
  object — with the orbit over the **character orbit** `[χ]` (as in the LMFDB) of size
  `[CoefficientField f : ℚ]`, and the relative orbit within fixed `χ` of size
  `[CoefficientField f : ℚ(χ)]`, both from 8G.
- **Inner twists** (#42) — a sublayer of its own, since the notion presupposes a twisting
  API: the twist `f ⊗ ψ` of a `q`-expansion by a Dirichlet character `ψ`, with its
  modularity and cuspidality, a level bound (dividing `lcm(N, cond(ψ)·cond(χψ), cond(ψ)²)`),
  and nebentypus `χψ²`; the good-prime formula `a_p(f ⊗ ψ) = ψ(p)·a_p(f)`; the passage from
  the twist to its **primitive associate** (Layer 4); the definition of an inner twist as a
  pair `(σ, ψ)` with `f^σ = primitive(f ⊗ ψ)`; and the basic structure — the group law,
  triviality for `ψ = 1`, and self-twists (CM forms) as the special case `σ = id`, `ψ ≠ 1`. These consume Layer 8's integrality —
  the coefficients must be algebraic for `σ` to act at all — so they sit downstream of the
  modular-symbol machinery, not beside it.
- **Galois-group certification** (what the weight-60 example needs): the Galois closure
  of `CoefficientField f` and a decision procedure for its **solvability**, presented as a
  *certificate checker* rather than a search, and honestly scoped: Dedekind/Frobenius
  **cycle-type certificates** (factor the minimal polynomial modulo well-chosen primes — with
  squarefreeness of each reduction checked and the certifying primes avoiding the
  discriminant — read off cycle types) and the discriminant square test decide the classified
  small-degree patterns this roadmap needs, the weight-60 `S₅` instance in full; **no general
  solvability decision procedure is claimed** — cycle types and the discriminant do not
  determine an arbitrary Galois group. This is the API a
  downstream computational repo calls; `CBirkbeck/CertifyingInvariantsNF`, bridged into
  LeanBridge, is the existing implementation (§Provenance).
- **Dual / self-dual** (#55): `f̄` (conjugate coefficients — which sends `χ ↦ χ̄`) and, for a
  normalized newform with its fixed embedding and in the literal contragredient sense,
  `IsSelfDual f ↔ ∀n, (aₙ).im = 0`; "self-dual up to twist" is a different notion and is not
  this predicate.
- **Labels** (#33, #13): the LMFDB label `N.k.a.x` (level, weight, character Galois-orbit, newform
  Galois-orbit), Conrey labels and Galois orbits of Dirichlet characters.
- **Bad primes** (#54): `badPrimes f = N.primeFactors`.

### Layer 10: the modular curve `Γ\ℍ` and the dimension formulas
The modular curve here is the **analytic quotient `Γ\ℍ`**, compactified to a compact Riemann
surface `X(Γ) = Γ\ℍ*` by adjoining the cusps `Γ\ℙ¹(ℚ)` — defined directly, with **no functor, no
representability, no moduli problem**.

- **The Sturm bound and finite-dimensionality — consume from Mathlib, don't re-prove.** A
  nonzero `f ∈ M_k(Γ)` has `q`-order at `∞` at most `k·[SL₂(ℤ):Γ]/12`; consequently `M_k(Γ)`
  and `S_k(Γ)` are **finite-dimensional at every level**. Level one is merged
  (`ModularForm.sturm_bound_levelOne`, #38993); the finite-index/arithmetic case —
  `ModularForm.sturm_bound_finiteIndex` and the `Module.Finite ℂ (ModularForm 𝒢 k)` instance —
  is the in-review stack #39000 (+#39083/#39086/#39087/#39088), proved by the elementary
  **modular norm map** route (`∏_γ f∣[k]γ` over coset representatives lands at level one, where
  the level-one bound kills it) — the same argument as AINTLIB's `dim_gen_cong_levels`
  (`Modularforms/DimGenCongLevels/*`), which it upstreams. Downstream, the Sturm bound is this
  layer's **main computational criterion**: two forms agreeing on the first `⌊k·[SL₂(ℤ):Γ]/12⌋ + 1`
  coefficients are equal, which is how the concrete dimension instances in `Suggested.lean` and
  the LMFDB layer's equality checks (Layer 9) become finite computations.
#### 10A — the analytic modular curve

- **The analytic theory of cusps and compactification.** Build `X(Γ) = Γ\ℍ*` as a compact
  Riemann surface — with the point-set work stated as milestones, not assumed: the effective
  `PSL₂` action, proper discontinuity (Mathlib's `ProperlyDiscontinuous.lean`), Hausdorffness
  of the quotient including the separation of cusp neighborhoods, second countability,
  compactness after adjoining the finitely many cusps, and chart compatibility. The charts: at
  ordinary points the quotient chart; at an elliptic point, `w ↦ w^{e_P}` in the
  stabilizer-linearizing coordinate `w = (τ − τ₀)/(τ − τ̄₀)` (not in `τ` itself); at the cusps
  the `q`-disc chart; the **cusp count** `ε∞ = #Γ\ℙ¹(ℚ)`
  and the **elliptic-point counts** `ε₂, ε₃` (periods `2, 3`, counted in the `PSL₂(ℤ)`-image where
  the elliptic stabilizers are cyclic of order `2, 3`); and the **genus** `g` of `X(Γ)` — defined
  **analytically**, `g := finrank ℂ H¹(X(Γ), 𝒪)` — a definition available only *after* the
  finiteness theorem below, so the order is `H¹`, finiteness, then `g` (equivalently
  `dim H⁰(Ω¹)`, by the duality below),
  and computed by Riemann–Hurwitz over `X(1)` in the Riemann–Roch chain below, replacing
  Diamond–Shurman's topological Euler-characteristic route (§3.1): no triangulations enter the
  roadmap. These
  counts and the genus are the inputs to the dimension formulas; building them is part of this
  layer, not assumed.
- **The finite map to level one.** `X(Γ) → X(1)` as a finite holomorphic map of compact
  Riemann surfaces, with the fiber-counting identities (`Σ e_x = d` over every fiber, the
  stabilizer indices at elliptic orbits, the cusp-width sum `Σ h_s = d`) as named lemmas —
  the inputs Riemann–Hurwitz consumes in 10B(vi). ⚠ This construction is **self-contained
  relative to 10B's compact-surface API**: it consumes no Schwarz reflection, no boundary
  correspondence, and no universal covers.

#### 10B — compact-Riemann-surface cohomology

- **The Riemann–Roch input — built here, not assumed.** The lower bounds need analytic
  Riemann–Roch on `X(Γ)`, and no compact-Riemann-surfaces roadmap exists to cite; so the
  minimal chain is part of this layer (in the spirit of the PR #36 review's advice — analytic
  curve, no GAGA — with Riemann–Roch actually supplied; Forster, *Lectures on Riemann
  Surfaces*, GTM 81, §§14–17, is the reference for exactly this route). The milestones, in
  order:
  (i) the structure sheaf and the sheaves `𝒪_D` of a divisor on a compact Riemann surface,
  Čech `H⁰` and `H¹` (refinement-independent via Forster's degree-one Leray theorem: a cover
  by `𝒪`-acyclic opens computes `H¹`, with acyclicity of discs from the **local `∂̄`-lemma**
  — the one piece of genuine PDE input, used again in (ii)); `H⁰(X, 𝒪) = ℂ` by compactness
  and the maximum principle.
  (ii) **finiteness**, `dim H¹(X, 𝒪_D) < ∞` — Forster §14: `L²` norms on Čech cochains over a
  finite cover, Cauchy–Taylor estimates making restriction to a nested cover small in norm off
  a finite-codimensional subspace, partitions of unity plus the local `∂̄`-lemma to compare
  cocycles, the open-mapping theorem for a uniform lifting estimate, and iteration. This is
  the hardest single input of the layer: Mathlib has the Čech complex, sheaf cohomology,
  compact operators, and the open-mapping theorem, but no Riemann-surface structure sheaf,
  no Leray theorem, no `∂̄`-solver — price it as a project, not an import.
  (iii) **Riemann–Roch** in Euler-characteristic form, `χ(𝒪_D) = deg D + 1 − g` with
  `g := dim H¹(X, 𝒪)` defined analytically, by induction along
  `0 → 𝒪_D → 𝒪_{D+P} → ℂ_P → 0` and the six-term exact sequence — which ends at `H¹` because
  the skyscraper is acyclic (`H¹(ℂ_P) = 0`, proved directly; no appeal to general
  cohomological dimension).
  (iv) meromorphic differentials and their divisors, and **Serre duality** by the residue
  pairing (Forster §17): `H¹(𝒪_D)^* ≅ H⁰(Ω_{−D})`, whence `ℓ(D) − ℓ(K−D) = deg D + 1 − g`,
  `dim H⁰(Ω¹) = g`, `deg K = 2g − 2`, and the vanishing `H¹(𝒪_D) = 0` for `deg D > 2g − 2`
  that the exact formulas below actually use.
  (v) **Riemann–Hurwitz** for a finite holomorphic map of compact Riemann surfaces, from the
  local normal form and the canonical-divisor pullback — with the fiber-counting identities as
  explicit inputs: `Σ_{x ↦ y} e_x = d` for every `y`, the stabilizer-index formula at the
  elliptic orbits, and the cusp-width sum `Σ_s h_s = d`.
  (vi) `X(1) ≅ ℙ¹` via the `j`-function, as an explicit lemma chain: `j` descends through the
  elliptic charts (the orders of `j` and `j − 1728` at `ρ` and `i` are what make the descended
  map regular there), one simple pole at the cusp and no others, the degree of a map to `ℙ¹`
  equals the degree of its pole divisor, nonconstant maps from a compact surface are proper,
  open, and surjective, and degree one forces a biholomorphism **via the local normal form**
  (a continuous bijection gives only a homeomorphism). Then the **genus of `X(Γ)`** falls out
  of (v) applied to `X(Γ) → X(1)`, with ramification from the stabilizer indices at the
  elliptic orbits and the cusp widths:
  `g = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2`, `d = [PSL₂(ℤ) : Γ̄]` — ⚠ the `PSL₂`-index, not
  `[SL₂(ℤ) : Γ]`. `dim S₂(Γ) = g` is then `S₂(Γ) ≅ H⁰(X(Γ), Ω¹)` plus (iv).
  A fuller compact-Riemann-surfaces roadmap (Abel–Jacobi, uniformization, …) remains
  desirable later and would absorb and extend (i)–(v); nothing here waits for it.
#### 10C — modular forms as section spaces, and the dimension formulas

- **The automorphy sheaf, constructed and not gestured at.** The weight-`k` transformation
  data on `Γ\ℍ` is orbifold data; the object with a Riemann–Roch theory is the induced
  **invertible sheaf on the coarse compact curve** `X(Γ)`, built by explicit local descent:
  at an elliptic point the invariant sections in the linearizing coordinate, at a (regular or
  irregular) cusp the sections in the width parameter with the errata order convention — and
  the local transition-function computation at each chart overlap is its own milestone, since
  the `⌊·⌋`-corrections of the divisor are precisely its output. The `j`-function enters 10C
  concretely: `j = E₄³/Δ`, `j − 1728 = E₆²/Δ`, with the orders of `j` and `j − 1728` at `ρ`
  and `i` read off these identities — the inputs 10B(vi) needs.
- **The dimension formulas** (Diamond–Shurman Thm 3.5.1 for even weight, Thm 3.6.1 for odd) —
  honest about their two halves. The
  Layer-1 valence formula with the `ε₂, ε₃, ε∞` counts and the genus `g` above yields the
  **upper bounds**: enough imposed zeros force a form to vanish. It does **not** by itself
  produce the required number of independent forms. The **lower bounds are Riemann–Roch**:
  identify `M_k(Γ)` and `S_k(Γ)` with section spaces of the weight-`k` automorphy divisor on
  `X(Γ)` (with the `⌊·⌋`-corrections at elliptic points and cusps — D–S §§3.5–3.6), and apply
  **analytic Riemann–Roch** `ℓ(D) − ℓ(K−D) = deg D + 1 − g` on the compact Riemann surface
  `X(Γ)`, together with `S_2(Γ) ≅ H⁰(X(Γ), Ω¹)` and `dim H⁰(X, Ω¹) = g`.
  The Riemann–Roch input is the chain above — built in this layer, so the exact formulas
  below sit inside this roadmap's grounded portion. That input is *not* the Jacobian Challenge's algebraic
  `χ(L) = deg L + 1 − g` (its Layer B): identifying the analytic and algebraic theories is a
  comparison this roadmap deliberately does not own.
  ⚠ **Even and odd weight are genuinely different, and the textbook's odd-weight route is not
  the one to formalize.** For even `k`, identifying `M_k(Γ)` and `S_k(Γ)` with `L(D)` for the
  floor-corrected divisors (D–S §3.5) needs only the chart-level statements this layer already
  builds, after exhibiting a nonzero **meromorphic** automorphic form of the given even
  weight (quotients of `E₄`, `E₆`, `Δ` in every even weight; at level one there is no
  holomorphic weight-`2` choice, and none is needed — meromorphic suffices for the
  dictionary). For odd `k`, D–S's own existence argument for a nonzero
  odd-weight form (their pp. 91–92) runs through Abel's theorem on the Jacobian, a meromorphic
  square root, and a possible degree-two function-field extension — machinery far beyond this
  roadmap. **Route around it**: prove the chain for the **weight-`k` automorphy line bundle
  directly** — the invertible sheaf given by the explicit chart trivializations with the
  elliptic/cusp floor corrections — rather than only for `𝒪_D` of a global divisor. Two of
  the three pieces transfer verbatim: the finiteness proof of (ii) and the duality of (iv)
  apply to any invertible sheaf. The induction of (iii) does **not** — it computes `χ(L(D))`
  only relative to a base value `χ(L)` — so one further milestone closes the gap: **every
  holomorphic line bundle on a compact Riemann surface admits a nonzero meromorphic
  section**, proved from finiteness alone by the staircase `h⁰(L(nP))` — each point-twist
  raises `h⁰` by `0` or `1`, and whenever it fails to rise, `h¹` strictly drops, which can
  happen only `h¹(L) < ∞` times — hence `L ≅ 𝒪_D` for the divisor `D` of that section, with
  `deg D` well-defined (the divisor of a global meromorphic function has degree `0`: the
  residue theorem applied to `df/f`, a lemma of (iv)). With that, both parities of `k ≥ 3`
  follow uniformly; the existence of the reference section is *proved*, not chosen, and is
  far short of the Abel–Jacobi machinery the D–S route needs. Weight `1` stays exceptional and is stated as
  such (bounds and the `M₁`/`S₁` relation; no closed formula in `g, ε₂, ε₃, ε∞` exists).
  ⚠ **Adopt the corrected irregular-cusp order convention before proving anything.** The
  official D–S errata (their pp. 74–75) fix the definition: at an irregular cusp of width `h`
  the relevant period is `2h` **independently of the weight**, the order is read from the
  `q_{2h}`-expansion and equals `m/2` — half-integral exactly when odd weight forces `m` odd —
  and with this convention orders are additive under multiplication. The regular/irregular
  bookkeeping of Thm 3.6.1 is then sound as printed (the errata also fix the `ε_{3,i}` typo on
  their p. 90). Record alongside: at odd weight with `−I ∉ Γ` there are no period-`2` elliptic
  points, and the `⌊·⌋`-identities for the rational divisors are proved coefficientwise.
  With those inputs, the formulas —
  extending Mathlib's level-one `ModularForm.dimension_level_one` to general level — read,
  for **even `k`**:
  ```text
  dim M_k(Γ) = (k-1)(g-1) + ⌊k/4⌋·ε₂ + ⌊k/3⌋·ε₃ + (k/2)·ε∞          (k ≥ 2)
  dim S_k(Γ) = (k-1)(g-1) + ⌊k/4⌋·ε₂ + ⌊k/3⌋·ε₃ + (k/2 - 1)·ε∞      (k ≥ 4),   dim S_2(Γ) = g
  ```
  (`dim M_0 = 1`, `dim S_0 = 0`, both `0` for `k < 0`); and for **odd `k ≥ 3`** — necessarily
  with `−I ∉ Γ`, else the spaces vanish (parity lemma), and with `ε∞ = ε∞^{reg} + ε∞^{irr}`
  under the errata convention:
  ```text
  dim M_k(Γ) = (k-1)(g-1) + ⌊k/3⌋·ε₃ + (k/2)·ε∞^{reg} + ((k-1)/2)·ε∞^{irr}
  dim S_k(Γ) = (k-1)(g-1) + ⌊k/3⌋·ε₃ + ((k-2)/2)·ε∞^{reg} + ((k-1)/2)·ε∞^{irr}
  ```
  (D–S Thm 3.6.1; no `ε₂` term, since odd weight admits no period-`2` elliptic points; the
  apparently half-integral right-hand sides are integers, and those integrality facts are part
  of the theorem, proved with it, not assumed). Weight `1` is stated with its two D–S cases
  (`ε∞^{reg} > 2g − 2` or not), as bounds and the `M₁`/`S₁` relation. `dim S_2(Γ) = g` is the
  statement that weight-two cusp forms are the holomorphic differentials on `X(Γ)`.
- `Suggested.lean` seeds this layer with concrete instances at levels `> 1`: `dim S_2(Γ₀(11)) = 1`,
  `dim S_2(Γ₀(23)) = 2`, `dim S_2(Γ₀(2)) = 0`, `dim M_2(Γ₀(11)) = 2`, and the non-`Γ₀`
  instance `dim S_2(Γ₁(13)) = 2`. The general even-weight
  formula above is the layer's headline target; it is stated here in the README (its inputs are
  the `ε₂, ε₃, ε∞, g` of `X(Γ)` from this same layer **plus the Riemann–Roch chain above, built in
  this same layer**; the concrete instances below consume that same general theorem — their
  role is acceptance, not independent grounding), and is **not** seeded
  as a
  free-parameter `example` in `Suggested.lean`, since with `g, ε₂, ε₃, ε∞` as free variables it is
  false for the wrong data. We keep only the concrete, verifiable instances and pin the general
  statement in prose.

### Layer 11: the Eichler–Selberg trace formula (level one)
A lane off Layers 2–3 **and Layer 8** — its route of record consumes the Layer-8
modular-symbol machinery — and **not an AINTLIB migration**: neither AINTLIB nor Mathlib
has any of it (no Hurwitz class numbers, no trace formula) — this layer is new formalization
ground, and we found no Lean prior art (as of July 2026).

- **Hurwitz class numbers, combinatorially.** `H : ℕ → ℚ` with `H 0 = −1/12` and, for `D > 0`
  with `D ≡ 0, 3 (mod 4)` (the `D % 4` form, since `D : ℕ`), `H D` = the number of `SL₂(ℤ)`-classes of positive-definite integral
  binary quadratic forms `ax² + bxy + cy²` of discriminant `b² − 4ac = −D`, counting the classes
  of multiples of `x² + y²` with weight `1/2` and of `x² + xy + y²` with weight `1/3`
  (`H D = 0` for `D ≡ 1, 2 (mod 4)`). Define it by **reduced forms** — a finite, decidable
  count: **no class groups, no class field theory** — with canonical representatives pinned
  (`|b| ≤ a ≤ c`, and `b ≥ 0` whenever `|b| = a` or `a = c`), so the boundary identifications
  cannot double-count and the weighted count is representative-independent — and ship it with
  the first values
  `H 3 = 1/3`, `H 4 = 1/2`, `H 7 = 1`, `H 8 = 1` as `decide`-style tests. Independently
  Mathlib-worthy.
- **The weight polynomials.** `P_k(t, n)`, the coefficient family with generating function
  `Σ_{k ≥ 2} P_k(t,n)·x^{k−2} = (1 − tx + nx²)⁻¹`, i.e.
  `P_k(t,n) = (ρ^{k−1} − ρ̄^{k−1})/(ρ − ρ̄)` for `ρ + ρ̄ = t`, `ρρ̄ = n` — Miyake's elliptic
  weight `a_k(t)` (§6.8) — equivalently `n^{(k−2)/2}·U_{k−2}(t/(2√n))`: relate it to Mathlib's
  Chebyshev polynomials (`Polynomial.Chebyshev.U`), do not re-found a polynomial family. ⚠ The
  root-quotient formula is undefined at the repeated root `t² = 4n` — exactly where `H(0)`
  contributes — so the *definition* is the generating series/recurrence, the quotient a lemma
  for `ρ ≠ ρ̄`, and at the boundary `P_k(±2√n, n) = (k−1)·(±√n)^{k−2}`.
- **The trace formula** (even `k ≥ 4`, `n ≥ 1`):
  ```text
  tr(Tₙ | S_k(SL₂(ℤ))) = −½·Σ_{t ∈ ℤ, t² ≤ 4n} P_k(t,n)·H(4n − t²) − ½·Σ_{d·d′ = n, d,d′ > 0} min(d,d′)^{k−1}
  ```
  ⚠ Pin the packaging before writing code: this is Zagier's normalization, in which
  `H 0 = −1/12` makes the `t² = 4n` terms absorb the identity/volume contribution
  (`P_k(±2√n, n) = (k−1)·n^{(k−2)/2}`) and the divisor sum carries the hyperbolic and parabolic
  mass; Miyake Thm 6.8.4 keeps these contributions separate. Either bookkeeping works; do not
  mix them. The `k = 2` variant carries a `σ₁(n)`-type correction term — the quasi-modular
  `E₂`/regularization phenomenon — and is **out of scope**: the scope wall below applies to it
  as to general level, and nothing on this roadmap consumes it (the acceptance criteria live
  at `k ≥ 4` and `k = 12`).
- **The route of record is the period-polynomial route** (Popa–Zagier): compute the Hecke
  action and its trace on **period polynomials** — the world of AINTLIB's
  `HeckeRIngs/GL2/ModularSymbols/*` (`HeckeSymbol`, `PeriodHecke`, `SL2Generation`) — where
  the trace identity is provable with **no analytic input**; the transfer to `S_k(SL₂(ℤ))`
  uses the Eichler–Shimura comparison. ⚠ **The transfer route is pinned now, not left to the
  implementor: the dimension-count route, with the comparison space named exactly.** Let
  `w = k − 2` and define the period-polynomial space
  `W_w = ker(1 + S) ∩ ker(1 + U + U²)` inside the homogeneous binary forms of degree `w` (one
  fixed model — the inhomogeneous degree-`≤ w` picture is its dehomogenization, with the
  equivalence and the right slash action of `S`, `U` stated once), where
  `S = (0, −1; 1, 0)` and `U = (1, −1; 1, 0)` are the standard order-`2` and order-`3`
  elements of `PSL₂(ℤ)`, with its even and odd parts `W_w^±`. Construct the **odd** period
  map `S_k → W_w⁻` and the **extended even** period map `M_k → W_w⁺`, whose even part
  includes the Eisenstein polynomial `X^w − Y^w` representing `E_k`; prove both
  **Hecke-equivariant and injective** (the odd map is Layer 8's injectivity in
  period-polynomial clothing); compute `dim W_w^±` **algebraically** — finite linear algebra
  on polynomial spaces — and conclude from Mathlib's `ModularForm.dimension_level_one` the
  Hecke-equivariant isomorphism `M_k ⊕ S_k ≅ W_w` by dimension count. Popa–Zagier's algebraic
  trace computation then runs on the **full** `W_w`, and since `W_w ≅ M_k ⊕ S_k` with
  `tr(Tₙ | M_k) = tr(Tₙ | S_k) + σ_{k−1}(n)`, the cusp-form trace is isolated as
  **`tr(Tₙ | S_k) = (tr(Tₙ | W_w) − σ_{k−1}(n))/2`** — the division by `2` is essential, not a
  normalization choice. ⚠ And "Popa–Zagier's algebraic trace computation" is itself the
  layer's hard core (their *A simple proof of the Eichler–Selberg trace formula*,
  arXiv:1711.00327), expanded into checkable milestones, not consumed as a black box:
  (i) the determinant-`n` matrix module `ℳₙ = {M ∈ M₂(ℤ) : det M = n}/{±1}` and the group
  ring `ℛₙ = ℚ[ℳₙ]` with the left, right, and conjugation actions of `PSL₂(ℤ)`; (ii) the
  standard representative set `Tₙ^∞` from representatives fixing `∞`; (iii) the construction
  of the special element `T̃ₙ ∈ ℛₙ` satisfying the period relation
  `(1 − S)·T̃ₙ − Tₙ^∞·(1 − S) ∈ (1 − T)·ℛₙ`; (iv) the theorem that its action on period
  polynomials agrees with the Hecke action; (v) the two exchange relations
  `T̃ₙ·(1 + S) ∈ (1 + U + U²)·ℛₙ` and `T̃ₙ·(1 + U + U²) ∈ (1 + S)·ℛₙ`, whence `T̃ₙ`
  preserves `W_w = ker(1 + S) ∩ ker(1 + U + U²)`; (vi) the right-coset identity `⟨T̃ₙ, K⟩ = −1` for
  every right `Γ`-coset `K`, and — a separate statement — the conjugacy-class weight
  identity `⟨T̃ₙ, X⟩ = w(X)`; (vii) the trace reduction
  `tr(T̃ₙ | W_w) = tr(T̃ₙ | V_w)` to the ambient polynomial space, from the exchange of the
  two kernels `A = ker(1 + S)`, `B = ker(1 + U + U²)` and `A + B = V_w`; (viii) the
  contribution of every conjugacy type in the case split — scalar, elliptic, split
  hyperbolic, non-split hyperbolic, parabolic — including the zero-contribution cases;
  (ix) the matrix-orbit ↔ binary-quadratic-form correspondence with its orientation and
  automorphism weights; (x) the comparison of the resulting operator with this roadmap's
  arithmetic normalization `aₘ(Tₙ f) = Σ_{d ∣ (m,n)} d^{k−1}·a_{mn/d²}(f)` (transposes and
  powers of `n` differ between conventions). Two conventions are pinned now, once: the
  extended even period polynomial of `E_k` is a nonzero **scalar multiple** of `X^w − Y^w` —
  either carry that scalar or renormalize the extended even period map so the image is
  exactly `X^w − Y^w`, decided once; and the parity involution and the right-action
  convention are stated explicitly, since "even" and "odd" swap under differing
  polynomial/action conventions. Two consequences, both deliberate:
  Layer 8's injectivity never touches `interior_edges_cancel_sum`, so that open `sorry`
  acquires **no** second consumer — what this route avoids is the *cohomological*
  (coboundary / parabolic-cohomology) packaging, **not** the even/odd and Eisenstein
  bookkeeping, which is real work and is named above as targets; and the `tr T(1) = dim S_k`
  acceptance criterion below becomes a **consistency check** of the transfer, not an
  independent re-derivation of the dimension formula, which is now one of its inputs. Chosen over the kernel route (Miyake
  §§6.1–6.4; Zagier's appendix in Lang: the two-variable kernel
  `ω_n(z, w) = Σ_{ad−bc=n} (czw + dz + aw + b)^{−k}` as the Petersson kernel of `Tₙ`, unfolded
  over conjugacy classes — ⚠ and note that appendix's **published error**: Case 3 (p. 53,
  hyperbolic matrices with rational fixed points) interchanges a sum and an integral without
  absolute convergence, plus a sign slip; the fix, via truncated fundamental domains, is
  Zagier's own *Correction* in LNM 627 (references), which anyone taking this route must
  follow) because the kernel route requires the Petersson-coefficient /
  Poincaré-series machinery of Miyake Thms 2.6.9–2.6.10, which neither Mathlib nor AINTLIB
  has — that machinery is **out of scope for this layer** (it would be a subproject of its
  own), while the period-polynomial route consumes only rails Layers 2 and 8 already lay. The
  class `H(4n − t²)` enters either way by counting integer matrices of determinant `n` and
  trace `t` up to conjugacy ↔ binary quadratic forms of discriminant `t² − 4n` — **in the
  elliptic range `t² < 4n`**, with orientation and stabilizer weights; the scalar/parabolic
  classes at `t² = 4n` and the split-hyperbolic classes at `t² > 4n` are separate counts, and
  the case split is real.
- **Acceptance criteria:** `tr T(1) = dim S_k(SL₂(ℤ))` against Mathlib's
  `ModularForm.dimension_level_one` — a **consistency check** of the pinned transfer route
  (which consumes that dimension formula), not an independent re-derivation of it;
  `tr T(2) | S₁₂ = τ(2) = −24` — the Δ worked example, reached from a second direction;
  the characteristic polynomial of `T₂` on `S_k(SL₂(ℤ))` for a few `k`, feeding Layer 9's
  `charpoly` targets at level one.
- **Scope wall.** The general-level formula — `tr(Tₙ | S_k(Γ₀(N), χ))`, Miyake Thm 6.8.4, proved
  there for orders in indefinite quaternion algebras via §§6.5–6.7 (local conjugacy classes,
  optimal-embedding counts, Eichler symbols, class numbers of non-maximal orders of `ℚ[α]`) — is
  **out of scope**: that apparatus shares nothing with this roadmap's layers and belongs to a
  future roadmap (Hijikata's formula), not to an extension of this layer.
- **A second route to the weight-60 example, once this layer works.** The characteristic
  polynomial of `T₂` on `S_k(SL₂(ℤ))` is determined by the traces `tr(T_{2ⁿ})` for
  `1 ≤ n ≤ dim S_k` (Newton's identities on the eigenvalues of `T₂`, since `T_{2ⁿ}` is a
  polynomial in `T₂`), and at `k = 60` that is `n ≤ 5` — all computable from this layer's trace
  formula. Whether that is cheaper than the Victor Miller route of the worked examples is an
  open practical question and worth trying; record the answer when someone does. Either way it
  gives Layer 11 a concrete downstream consumer.

## Worked examples (acceptance criteria, keeping the theory honest)

⚠ **How the examples are computed — the policy, stated once.** There are two ways to get
`q`-expansions of actual eigenforms. (1) Develop enough theory to compute at any weight and
level; that means modular symbols with an explicit presentation and Hecke matrices, and it is
substantial work. (2) Restrict to forms with an **eta-quotient expansion**, where the
coefficients come out of a product formula by elementary manipulation. **This roadmap does
(2).** The rule of thumb is `(N+1)k = 24`: `Δ` (`N = 1`, `k = 12`), the level-`11` weight-`2`
newform (`12 · 2 = 24`), the level-`7` weight-`3` form (`8 · 3 = 24`; `η(z)³η(7z)³ ∈ S₃(Γ₀(7), χ₋₇)` — odd weight
forces the odd quadratic nebentypus, by the parity lemma) — and one is in good
shape when the relevant cusp-form space is `1`-dimensional, so the eta quotient *is* the
newform. Anything outside that class — level `37`, the weight-`60` charpoly, non-rational
coefficient fields — is **not** an acceptance criterion of this roadmap and is routed to the
downstream computational repository (weight-`60` entry below). Note the consequence for
route (2): eta quotients have **rational** coefficients, so no example with non-real `aₙ` can
be reached this way.

- **Δ at level one** (`k = 12`, `N = 1`): the unique normalized cusp form; `τ(p)` are its Hecke
  eigenvalues; `aₙ` multiplicative with the `τ(p^r)` recurrence (Prop 5.8.5). The first eigenvalue
  is concrete: **`T₂` acts on `Δ` by `−24`** (`a₂(Δ) = τ(2) = −24`, from the coefficient of `q²`
  in `Δ = q∏(1−qⁿ)²⁴`, equivalently `(E₄³ − E₆²)/1728`) — a fully computable acceptance test of the
  Hecke action (Layer 2).
- **Level 11, weight 2** (`S₂(Γ₀(11))`, dimension 1): a single newform, the elliptic curve `11a`;
  its Fricke sign (Layer 6) and the root-number-`+1` functional equation (Layer 7) — the sign
  forces only *even* analytic rank; rank `0` itself would additionally need a central-value
  nonvanishing argument this roadmap does not claim. Like `Δ`, it has a
  **product formula** making the coefficients computable by the same route:
  `f = η(z)²η(11z)² = q∏_{n≥1}(1−qⁿ)²(1−q^{11n})²` — note the squares, and note that
  `η(z)η(11z)` is *not* the weight-`1` form to reach for: it fails the standard eta-quotient
  criterion (`Σ d·r_d = 1 + 11 = 12 ≢ 0 (mod 24)`, Ligozat/Newman), so it carries a weight-`1`
  transformation law only with a nontrivial finite **eta multiplier** on `Γ₀(11)` — a perfectly
  meaningful law, but not one with a Dirichlet nebentypus, hence outside this roadmap's
  transformation-law conventions; the genuine weight-`1` eta quotient with a Dirichlet
  character is `η(z)η(23z)`, from the same `(N+1)k = 24` rule — so `a₂ = −2`, and `a₁₁ = 1` — computed
  from the product expansion; Layer 4's classification at `v₁₁(N) = 1`, `χ` trivial, pins it
  only to `±11^{(2−2)/2} = ±1`, so the sign is a computation, not a prediction.
- **Level 37, weight 2** — the honest version, split by what is *derivable* and what is
  *computed*. Derivable here: `dim S₂(Γ₀(37)) = 2` (Layer 10); the space is **entirely new**,
  since `37` is prime and `S₂(SL₂(ℤ)) = 0` leaves no oldforms; semisimplicity of the commuting
  good Hecke operators plus multiplicity one (Layer 5) gives **exactly two normalized complex
  eigenforms**, each — since `w₃₇` commutes with the good `Tₙ` and squares to `1` — an
  Atkin–Lehner eigenvector of sign `±1` (Layer 6), so `tr(w₃₇) ∈ {−2, 0, 2}`. **Not** derivable
  from those facts: that the two are *rational* newforms rather than one quadratic Galois orbit,
  and that their signs are **opposite** (`tr w₃₇ = 0`). Both are computations — Manin symbols,
  or the genus of `X₀(37)/w₃₇` — and belong to the downstream computational repo described in
  the weight-60 entry below, not to this roadmap's acceptance criteria.
- **A newform with non-real `aₙ`** — ⚠ **not an acceptance criterion here**, and the entry is
  kept only to say why. Such a form would exercise the coefficient-field (Layer 8) and
  not-self-dual (Layer 9) statements, but eta quotients have rational coefficients, so the
  computational policy above cannot reach one: exhibiting it needs an explicit `q`-expansion at
  a specific level and weight, i.e. modular symbols. It therefore belongs to the downstream
  computational repository, together with a definite target (a nebentypus newform such as
  `13.2.e.a`) rather than an unnamed "some newform".
- **`η²⁴ = Δ`** as a weight-12 eta quotient (#19): develop `η = q^{1/24}∏(1−qⁿ)` and its `SL₂(ℤ)`
  transformation, and the Ligozat criterion, as an explicit worked example of a modular form rather
  than as general theory.
- **The coefficient-field example — a weight-60 level-one eigenform with non-solvable
  coefficient field.** There is a normalized eigenform `f ∈ S₆₀(SL₂(ℤ))` whose coefficient field
  `CoefficientField f` has a Galois closure over `ℚ` that is **not solvable** — the first known
  example, computed by Buzzard in 1992 in answer to a question of Ramakrishnan
  ([*J. Number Theory* **57** (1996)](https://www.sciencedirect.com/science/article/pii/S0022314X96900396)),
  and suggested for this roadmap by its author on the predecessor PR.
  ⚠ **Scope split (review).** The explicit numerical verification is *not* a target of this
  roadmap: it is an exact power-series-and-linear-algebra calculation of a different character
  from everything above, and it belongs in a **separate repository depending on Tau Ceti**
  (`CBirkbeck/LeanBridge` is the existing instance of exactly that — see §Provenance). What
  this roadmap owes is the **reusable API that makes such a verification a finite calculation
  and nothing more**, namely:
  - the level-one **graded-ring structure** `M_*(SL₂(ℤ)) = ℂ[E₄, E₆]` with `S_k = Δ·M_{k−12}`
    (Mathlib has `Δ = (E₄³ − E₆²)/1728` in `LevelOne/GradedRing.lean` but **not** the
    generation statement — a genuine gap this roadmap fills), so any level-one form is named by
    a polynomial in `E₄, E₆`;
  - a **`q`-expansion evaluation interface**: the coefficients of such a polynomial expression
    as computable rational data;
  - the **Sturm-bound comparison lemma** — two level-one forms of weight `k` agreeing to
    `⌊k/12⌋` are equal — which turns "match finitely many coefficients" into an identity
    (Mathlib's `sturm_bound_levelOne`, consumed in Layer 10);
  - the **`Tₙ` action on `q`-expansions** in the form `aₘ(Tₙf) = Σ_{d ∣ (m,n)} d^{k−1} a_{mn/d²}(f)`
    (Layer 2), so Hecke matrices are extractable;
  - the Layer-8 identification `CoefficientField f = ℚ(α)` for the eigenvalue field, and the
    Layer-9 **Galois-group certification interface** (below), so that "non-solvable" is a
    checkable property of an explicit minimal polynomial.
  With those in place the remaining work is the calculation itself: at `k = 60` the cusp space has
  `dim S₆₀(SL₂(ℤ)) = 5` (the full `M₆₀` has dimension `6`), the Sturm bound is `5`, expansions through `q¹⁰` suffice, and the
  characteristic polynomial of `T₂` is an irreducible quintic whose Galois group is `S₅` —
  certified by Frobenius cycle types (irreducible mod `83`, factoring as `2+1+1+1` mod `17`:
  transitive plus a transposition in prime degree forces `S₅`); the shipped certificate
  carries the explicit quintic, the two factorizations, and squarefreeness of both reductions
  (the certifying primes avoid the discriminant).

## Ordering — the dependency graph

Not a linear order: a graph, with the consumption edges named ("→" means "consumes").

- **Layer 0** (diamonds, nebentypus, Eisenstein series, the cusp–Eisenstein decomposition) → Mathlib only. Trunk root.
- **Layer 1** (valence formula, the order dictionary, the full-coset norm map) → the [Contour Integration roadmap](../ContourIntegration/README.md). Independent of Layers 0/2; finite support of the divisor is proved *inside* the layer via the norm map — no Layer-10 input.
- **Layer 2** (the Hecke ring at `GL_n`; the `n = 2` congruence theory and the action) → Layer 0, Mathlib's abstract Hecke ring (fallback: AINTLIB). The general-`n` block is consumed by the automorphic-representations roadmap (PR #120), not by this trunk.
- **Layer 3** (Petersson, adjoints, old/new with the exact fixed-`χ` oldspace) → Layers 0, 2. Carries the pinned bad-prime stability route (known source gap).
- **Layer 4A** (existence of the primitive associate; bad-prime eigenvalues; the Main Lemma) → Layers 2, 3.
- **Layer 5** (fixed-space SMO; multiplicity one; **newform–newform cross-level SMO**) → Layers 3, 4A.
- **Layer 4B** (uniqueness of the primitive pair — the conductor) → Layer 5. Layer 4 closes only here.
- **Layer 6** (Atkin–Lehner and Fricke, normalized) → Layers 2, 3, and 4A for the newform sign statements.
- **Layer 7** (L-functions) → Layers 4A/5 (Euler product), 6 (the sign), and Layer 0's cusp–Eisenstein decomposition (the sharp noncuspidal bound).
- **Layer 8** (modular symbols, the integral Hecke algebra, the coefficient field at `k ≥ 2`) → Layers 2, 4A; the negative-weight maximum principle is proved inside the layer, not consumed from Layer 10.
- **Layer 8W** (the weight-one lattice, Deligne–Serre route) → Layers 2, 4A.
- **Layer 8G** (Galois stability, the character field, rationality) → Layers 5, 8.
- **Layer 9** (LMFDB invariants; inner twists) → Layers 8, 8G, and 4A (primitive associates of twists).
- **Layer 10A** (the analytic curve) → Layer 0 conventions only. **10B** (surface cohomology) → 10A. **10C** (section spaces and dimension formulas) → 10A, 10B, Layer 1 (upper bounds), Mathlib's Sturm finiteness (fallback: AINTLIB).
- **Layer 11** (the level-one trace formula) → Layers 2, 8 (the period-polynomial route), Mathlib's level-one dimension formula; feeds Layer 9's charpoly targets and cross-checks 10C at level one.

**Status, per major block** — so "three source `sorry`s" is never read as "three remaining pieces of work":

| Block | Status |
|---|---|
| Layer 0 diamonds/nebentypus | migrate (AINTLIB); the cusp–Eisenstein decomposition is **new** |
| Layer 1 valence formula | migrate (level one); the order dictionary and general level are **new** |
| Layer 2 abstract ring | upstream Mathlib PR stack, AINTLIB fallback |
| Layer 2 `GL_n` block | migrate; general `n`: two named steps open (**source gap**); consumer PR #120 |
| Layer 3 Petersson, old/new | migrate; bad-prime newspace stability a **known source gap**, route pinned |
| Layers 4A/5/4B newforms, SMO | migrate (fixed-space); cross-level newform SMO **new** |
| Layer 6 Atkin–Lehner | migrate (Fricke side); the `𝒲_Q` family and sign theory **new** |
| Layer 7 L-functions | migrate; abscissa tightening and rank-via-continuation **new** |
| Layer 8 (`k ≥ 2`) | migrate; `interior_edges_cancel_sum` a **source gap** the Bol route avoids |
| Layer 8W weight one | **new**, route pinned; closes `exists_HeckeStableLattice_one` |
| Layer 8G Galois/rationality | **new**; closes the stability AINTLIB explicitly leaves unproved |
| Layer 9 LMFDB, inner twists | **new** definitions over Layers 8/8G |
| Layers 10A/10B/10C | **new**; hardest single input: `H¹` finiteness (10B) |
| Layer 11 trace formula | **new**; hardest single input: the `T̃ₙ` construction |
| Worked examples | consume the general theorems; eta-quotient computations |

## Provenance (migrate and clean from AINTLIB `LeanModularForms`)

**The downstream computational repository.** Distinct from the migration map below, and worth
naming first because it fixes this roadmap's boundary: `CBirkbeck/LeanBridge` ("Link LMFDB and
Lean") is a **separate repository that depends on the library**, where explicit numerical
verifications live — exactly the split the weight-60 entry pins. It already contains, `sorry`-free,
generated `q`-expansion certifications for level-one weights `12`–`316` (≈2150 files under
`LeanBridge/ForMathlib/QExpansion/LMFDB/`), each constructing the LMFDB orbit explicitly in the
`(E₄, E₆)` basis and proving a Sturm-bound **uniqueness theorem**. `Weight_60.lean` is the
weight-60 case: the orbit `1.60.a.a`, the explicit degree-`5` minimal polynomial of `α`, the
`q`-coefficients decomposed over `ℚ(α)`, and `identifies_lmfdb_1_60_a_orbit` via
`ModularForm.eq_of_sturm_bound`. Its `add-galois-certification` branch bridges
`CBirkbeck/CertifyingInvariantsNF` (Dedekind/Frobenius cycle-type certificates, the discriminant
square test), which is the Layer-9 certification interface's implementation. Nothing in that
repository is a target *of this roadmap*; it is the consumer that tells us which **API** the
roadmap owes (Layer 9 and the weight-60 worked example list them), and the evidence that the
remaining work there is calculation rather than theory.

Secondary to the mathematics above: the migration map. The reference is the AINTLIB monorepo's
`projects/LeanModularForms/` on branch **`dev/leanmodularforms`** (resynced **2026-07-17**, re-verified **2026-07-23**, at
`112d12d95`); paths are relative to its `LeanModularForms/`. The tree is **actively
restructured**, so verify names against the live tree before porting. Headline theorems are
`sorry`-free unless flagged; the flagged **literal source `sorry`s** are exactly three —
`exists_HeckeStableLattice_one` (L8), `interior_edges_cancel_sum` (L8), and
`peterssonInner_aggregate_eq_zero_of_new_old` (L3, bad primes) — plus the
`ModularSymbols/Skeleton.lean` spec file. In addition, the **active** general-`n` target in
`GLn/PolynomialRing.lean` has the two named source gaps recorded in Layer 2 and the status
table; "three" counts literal source `sorry`s, not every unfinished target of the roadmap.

- **Nebentypus / characters (L0):** `HeckeRIngs/GL2/Gamma1Pair.lean` (`diamondOp*`,
  `diamondOpHom`, `modFormCharSpace`, `cuspFormCharSpace`, the `*_iff_nebentypus` bridges);
  `HeckeRIngs/GL2/CharacterDecomp.lean` (`ModularForm_Gamma1_charSpace_directSum` and its
  `iSupIndep`/`iSup` halves, plus the cusp-form versions).
- **Valence formula (L1):** `ForMathlib/ValenceFormulaFinal.lean` (`valence_formula_textbook`)
  on top of `ForMathlib/ValenceFormula*.lean` and `ForMathlib/ValenceFormula/WindingWeights/*`,
  with the FD-boundary bridge (`ForMathlib/*FDBoundary*`, `*CornerFTC*`, `*CrossingAt*`) over
  the Contour Integration roadmap's results.
- **Hecke theory (L2):** `HeckeRIngs/AbstractHeckeRing/*` (the abstract ring — **being
  upstreamed** as Mathlib #41251 merged + #41253–#41256, #41277, #41279, #41328 in review; commutativity via
  `mul_comm_of_antiInvolution` with `GLn/TransposeAntiInvolution.lean`);
  `HeckeRIngs/GL2/{Basic,HeckeT_p,HeckeT_p_Gamma0,HeckeT_p_Gamma1,HeckeT_p_GLpair,HeckeT_n,FourierHecke,MultiplicationTable,CongruenceIndex,Degree,LevelEmbed,LevelRaise}.lean`;
  the ring-action layer
  `HeckeRIngs/GL2/Unified/{Gamma0RingDn,NebentypusHeckeRingHom,RingTransport,TwistedHeckeRing}.lean`
  (`heckeRingDn`, `heckeRingHomCharSpace`). ⚠ `ShimuraHom.lean` and
  `heckeRingHomCharSpaceShimura` are **deliberately not ported**: the conventions fix the
  arithmetic normalization as the only one, so the Shimura-normalized action stays behind.
- **Petersson / old–new (L3):** `Modularforms/{PeterssonInner,PeterssonInnerProduct,PeterssonLevelN}.lean`
  (`petN`, `μ_hyp`), `HeckeRIngs/GL2/AdjointTheory*.lean` (`heckeT_n_adjoint`),
  `HeckeRIngs/GL2/Newforms/Basic.lean` (`cuspFormsOld`, `cuspFormsNew`, orthogonality,
  `isCompl`). ⚠ Bad-prime old-stability is the flagged `sorry`
  `peterssonInner_aggregate_eq_zero_of_new_old` (`Newforms/AdjointTheoryBadPrime.lean`); the
  source-faithful Fricke replacement route is
  `Newforms/{BadPrimeFDTiling,BadPrimeTraceFricke,FrickeOldStable}.lean`.
- **Newforms / conductor (L4):**
  `HeckeRIngs/GL2/Newforms/{Basic,Newform,FullEigenform,CoeffSeq,MainLemmaProof,Molteni}.lean`,
  `HeckeRIngs/GL2/Unified/EigenformFromRing.lean`, `Eigenforms/{MainLemma,AtkinLehner}.lean`
  (Miyake §4.6 coprime sieving and the `q`-support/descent machinery),
  `Eigenforms/ConductorTheorem.lean` (proved: `conductor_theorem_dichotomy_cuspForm_strong`).
  The Main Lemma is **fully proved**: global `mainLemma` (`Newforms/MainLemmaProof.lean`) via
  `mainLemma_charSpace_routeB` (`StrongMultiplicityOne.lean`).
- **Strong multiplicity one (L5):** `StrongMultiplicityOne.lean` and `StrongMultiplicityOne/*`
  (`InductiveStep`, `HeckeDescent`, `DescentCharSpace`, `ConstantMultiple` — the `sorry`-free
  `strongMultiplicityOne` and `strongMultiplicityOne_constMul`); the §5.8.5 characterization in
  `HeckeRIngs/GL2/Newforms/{FullEigenform,CoeffSeq}.lean` and `HeckeRIngs/GL2/FourierHecke.lean`.
- **Fricke (L6):** `HeckeRIngs/GL2/Fricke.lean` (`frickeOperator`, `frickeScalar`,
  `frickeCharRestrict`/`frickeCharEquiv`),
  `HeckeRIngs/GL2/Newforms/{FrickeOldStable,BadPrimeTraceFricke}.lean`. The general `W_Q` family
  and the newform signs are **new** here.
- **L-functions (L7):**
  `Modularforms/{LFunction,LFunctionEuler,LFunctionFEq,LFunctionFEqN,ResToImagAxis,AtImInfty}.lean`
  (`lCoeff`, `lSeries`, `lSeries_eulerProduct`, `lcompletedΛN`,
  `lcompletedN_functional_equation`, `differentiable_lcompletedΛN`,
  `lSeriesN_hasEntireExtension`).
- **Coefficient field (L8) — constructed, not to build:** `Labels/{HeckeFieldArithmetic,HeckeAlgFiniteFinal,NewformOrbit}.lean`
  (`heckeAlgℤ`, `heckeAlgℤ_finite_of_two_le`/`heckeAlgℤ_finite_of_lattice`, `coeffField`,
  `coeffSeq_isIntegral`, `finiteDimensional_coeffField_of_rangeFinite`, the instance
  `instNumberFieldCoeffField`, `newformEigenHom_range_finite`,
  `coeffField_numberField_of_two_le`) plus the integral-period route in
  `HeckeRIngs/GL2/ModularSymbols/*` — where the working injectivity route is
  `EichlerInjective.lean` (`periodMap'_injective_eichler`, proved, `#print axioms` clean, and
  *not* passing through `interior_edges_cancel_sum`), while `PeterssonStokes.lean` carries the alternative
  Shimura/Green's-identity route and is where the open analytic input sits. Largely proved
  (`k ≥ 2` axiom-clean); residual `sorry`s are
  the weight-1 lattice `exists_HeckeStableLattice_one` (`Labels/HeckeFieldArithmetic.lean`) and
  the Eichler–Shimura boundary-cancellation step `interior_edges_cancel_sum`
  (`ModularSymbols/PeterssonStokes.lean`). ⚠ **Attribution:** part of the modular-symbol
  development is due to **Nicola Falciola** (VU Amsterdam); the files carry a collective
  "LeanModularForms contributors" header, so establish per-file authorship with him before
  porting, and carry it into the ported headers.
- **LMFDB layer (L9):** `Labels/{Label,Encoding,NewformOrbit,CharacterOrbit}.lean`.
- **Dimensions / curve (L10):** `Modularforms/DimensionFormulas.lean` with
  `Modularforms/DimGenCongLevels/*` (`dim_gen_cong_levels` — general-level
  finite-dimensionality by the norm-map route, the content being upstreamed as the Mathlib Sturm
  stack #39000; `cuspform_weight_lt_12_zero`); the general-level analytic
  cusp/compactification theory and the general dimension formula are **new** here.
- **Trace formula (L11):** no AINTLIB source — entirely **new**; route B's substrate is the
  `ModularSymbols` subtree above.

The two structural audits `.mathlib-quality/{newforms,eigenforms-smo}-overview-2026-05-31.md`
catalogue the redundancy to collapse during migration.

## References

- F. Diamond, J. Shurman, *A First Course in Modular Forms* (GTM 228): Ch. 3 (dimension formulas,
  the genus, the analytic theory of `Γ\ℍ*`), Ch. 5 (Hecke operators, newforms, Thm 5.8.2, Props
  5.8.4–5.8.5, §5.9 L-functions).
- T. Miyake, *Modular Forms*: §4.5–4.6 (the integral structure, the conductor theorem, and strong
  multiplicity one Thm 4.6.12) — the numbering the AINTLIB code follows; Ch. 6 (the trace
  formula: §§6.1–6.8, Thm 6.8.4 — Layer 11's kernel route, and the general-level scope wall).
- D. Zagier, *The Eichler–Selberg trace formula on SL₂(ℤ)*, appendix to S. Lang, *Introduction to
  Modular Forms* — the level-one normalization of Layer 11. ⚠ **Must be read with** D. Zagier,
  *Correction to "The Eichler–Selberg trace formula on SL₂(ℤ)"*, in *Modular Functions of One
  Variable VI*, Lecture Notes in Mathematics **627** (Springer, 1977), 171–173
  ([doi:10.1007/BFb0065300](https://doi.org/10.1007/BFb0065300)): the appendix's Case 3
  (p. 53) unfolds a non-absolutely-convergent expression by interchanging a sum and an
  integral, and carries a sign error; the final formula is right, the printed derivation is
  not. A. Popa, D. Zagier, *A simple proof
  of the Eichler–Selberg trace formula*
  ([arXiv:1711.00327](https://arxiv.org/abs/1711.00327)) — the period-polynomial route of record.
- G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions*: Ch. 3 (the Hecke
  algebra and its integral structure, Thms 3.48/3.51/3.52).
- K. Buzzard, *On the eigenvalues of the Hecke operator T₂*, J. Number Theory **57** (1996) — the
  weight-60 non-solvable coefficient-field example (worked examples).
- J. Sturm, *On the congruence of modular forms*, in *Number Theory* (New York 1984–85), Springer
  LNM **1240** — the Sturm bound (Layer 10), heading into Mathlib via the modular norm map
  (#38993 merged, #39000 in review).
- N. Hungerbühler, M. Wasem, *Non-integer valued winding numbers and a generalized Residue
  Theorem*, arXiv:1808.00997 — the contour-integration result behind the valence formula's
  elliptic-point weights (see the [Contour Integration roadmap](../ContourIntegration/README.md)).
- A. Atkin, J. Lehner, *Hecke operators on Γ₀(m)*; A. Atkin, W. Li, *Twists of newforms and
  pseudo-eigenvalues of W-operators*, Invent. Math. **48** (1978) — Layer 6's sign theory at
  general nebentypus; W. Stein, *Modular Forms: A Computational
  Approach* (the small-level dimension tables). The **LMFDB** (`https://www.lmfdb.org`) knowls
  fixed by the target definitions.

## Acknowledgements

The body of theory is **migrated and cleaned** from the AINTLIB `LeanModularForms` project
([github.com/CBirkbeck/AINTLIB](https://github.com/CBirkbeck/AINTLIB)), where the headline results
are already `sorry`-free; thanks to its authors. The target definitions discharge a large set of
"def-wanted" specifications from the [LeanBridge](https://github.com/CBirkbeck/LeanBridge)
project: issues #13, #18, #19, #30–#35, #37, #38, #42, #54, #55. The contour-integration results the valence
formula depends on come from the sibling
[Contour Integration roadmap](../ContourIntegration/README.md).
