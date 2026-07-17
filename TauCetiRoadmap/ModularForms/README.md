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

The summit is the **dimension formulas** for `M_k(Γ)` and `S_k(Γ)` at general level
(Diamond–Shurman Thm 3.5.1), proved by the **classical analytic route**: the valence formula
together with the elliptic-point and cusp counts of the quotient `Γ\ℍ`. Mere
*finite-dimensionality* at general level is **not** the summit — it arrives in Mathlib by the
elementary Sturm-bound route (see Layer 10) and this roadmap consumes it; the summit is the exact
`ε₂, ε₃, ε∞, g` bookkeeping. The modular curve here
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

- **Levels and characters.** Work with `Γ₁(N) ≤ Γ ≤ Γ₀(N)`. The space with **nebentypus** `χ` is
  `M_k(N, χ) = M_k(Γ₁(N), χ)`, the simultaneous `χ`-eigenspace of the diamond operators inside
  `M_k(Γ₁(N))` — a `Submodule`, defined in Layer 0 exactly as in AINTLIB. Reserve `M_k(Γ)` for a
  bare congruence subgroup. The character has two faces, and AINTLIB uses both deliberately: a
  unit homomorphism `χ : (ZMod N)ˣ →* ℂˣ` where it indexes eigenspaces, and Mathlib's
  `DirichletCharacter ℂ N` (`= MulChar (ZMod N) ℂ` — use it, do not reinvent) where a formula
  evaluates `χ` at arbitrary residues with `χ(p) = 0` for `p ∣ N`, bridged by
  `DirichletCharacter.toUnitHom` one way (so AINTLIB's conductor-theorem statements) and the
  zero-extension `Newform.dirichletLift` the other (so its Euler product). Keep both faces and
  the named bridges; do not fuse them into a third notion.
- **The weight-`k` slash.** Use Mathlib's `SlashAction`/`ModularForm.slash` and its `k` and
  `GL₂(ℝ)⁺`/`GL₂(ℚ)⁺` conventions throughout; the Hecke double-coset operators are built from it.
  ⚠ Two normalizations of the Hecke action circulate (Shimura's vs Diamond–Shurman's, differing
  by a power of the determinant); **pin Diamond–Shurman's** as primary, and provide the
  Shimura-normalized action as a named bridge (AINTLIB has both via `ShimuraHom`), so any
  half-integral-weight work downstream can use it without a silent reconvention.
- **Normalized eigenforms.** An eigenform is `normalized` when `a₁ = 1`; a **newform** is a
  normalized eigenform in the new subspace. State eigenvalue results for normalized forms, so that
  `Tₙ f = aₙ(f) · f` (Hecke eigenvalue = Fourier coefficient).
- **Coefficient field.** The coefficient field of a newform is `CoefficientField f = ℚ(aₙ : n ≥ 1)
  ⊆ ℂ`, an `IntermediateField ℚ ℂ`. (Name it `CoefficientField`, not after the form: no `K_f`.)
  It is a *number field* — a theorem (Layer 8), not an assumption.
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
  [#41253](https://github.com/leanprover-community/mathlib4/pull/41253)–[#41328](https://github.com/leanprover-community/mathlib4/pull/41328),
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
  finite-dimensionality from here; the exact dimension formulas remain this roadmap's summit.

## What is missing (build here)

The valence formula at general level; the diamond operators `⟨d⟩` and the character spaces
`M_k(N,χ)`; the Hecke operators `Tₙ`, `Tₚ` and the (commutative) Hecke-ring action on
`M_k(N,χ)` — the abstract ring is Mathlib's, its `GL₂` realization and action are not; the Petersson inner product as
an actual inner product and the self-adjointness of `Tₙ` for `(n,N)=1`; the old/new decomposition
and its orthogonality; eigenforms, newforms, oldforms, primitive forms; the Main Lemma, the
conductor theorem, and **strong multiplicity one**; Atkin–Lehner and Fricke operators and their
signs; the L-function of a modular form with its **Euler product**, **completed form**,
**functional equation**, and **analytic continuation**; the **coefficient field** and the proof
that it is a number field; the LMFDB invariants (Satake parameters, Hecke characteristic
polynomials, Galois orbits, labels, …); the **modular curve** `X(Γ)` as the compactified analytic
quotient `Γ\ℍ`, with its cusps, elliptic points, and genus; the **dimension formulas** for
`M_k(Γ)` and `S_k(Γ)` by the valence-formula route; and the level-one **Eichler–Selberg trace
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
  (mapGL ℝ)) k)`). This needs only Mathlib's slash action and the normality of `Γ₁(N)` — no
  Hecke theory.
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
  eigenform theory below lives on them. The classical **nebentypus transformation law is the
  bridge theorem**, not the definition (AINTLIB `modFormCharSpace_iff_nebentypus`):
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
- **Eisenstein series with character** `E_k^{χ,ψ}` (#37): the character-twisted series as named
  modular forms on `Γ₀(N)` with nebentypus, their `q`-expansions in terms of generalized
  Bernoulli numbers and twisted divisor sums, and the Eisenstein subspace.
  ⚠ Match Mathlib's `eisensteinSeries`/`gammaSet` indexing; do not introduce a second Eisenstein
  API.

### Layer 1: the valence formula (general level)
- Consumes the [Contour Integration roadmap](../ContourIntegration/README.md). For a nonzero
  `f ∈ M_k(SL₂(ℤ))`, the **valence formula** is a sum over the
  `SL₂(ℤ)`-**orbits** of points of `ℍ` — `ord_P(f)` is constant on an orbit, hence well-defined
  on it — with the two **elliptic orbits** `[i]`, `[ρ]` weighted by the reciprocal `1/e_P` of
  their stabilizer orders (`e_i = 2`, `e_ρ = 3`) and the cusp `∞` contributing `ord_∞`. The
  statement is AINTLIB's, already proved — port it as it stands
  (`ForMathlib/ValenceFormulaFinal.lean`):
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
  sit **on** that contour, so their `½` and `⅓` weights are the Hungerbühler–Wasem generalized
  winding numbers of points on a cycle (Contour roadmap) — the precise reason the elliptic weights
  are `1/e_P`.
- **General level:** push to a finite-index `Γ ≤ SL₂(ℤ)` via the degree-`[SL₂(ℤ):±Γ]` covering,
  giving `Σ_{P ∈ Γ\ℍ*} (1/e_P)·ord_P(f) = k·[SL₂(ℤ):±Γ]/12` over the `Γ`-orbits, the input both to
  low-weight vanishing and to the dimension formulas (Layer 10).
- The **Sturm bound** heading into Mathlib (`sturm_bound_finiteIndex`, Layer 10) is the
  *inequality shadow* of this formula — `ord_∞(f) ≤ k·[SL₂(ℤ):Γ]/12` for `f ≠ 0`, since every
  other term is `≥ 0` — proved there by the elementary norm-map route with no contour
  integration. The valence formula is what upgrades that inequality to the exact `k/12` mass
  count, and it is absent from Mathlib at every level; it is this roadmap's route to the exact
  dimension formulas.

### Layer 2: Hecke operators and the Hecke algebra
- **(a) The abstract Hecke ring — consume Mathlib's.** The double-coset ring of a Hecke pair is
  landing in Mathlib (`NumberTheory/HeckeRing/Defs.lean` #41251, merged; the convolution ring
  structure in review, #41253–#41328 — see *What Mathlib already has*): `IsHeckeTriple`,
  `HeckeCoset`, `𝕋 Δ H Z`, with the finiteness (`Γ ∩ gΓg⁻¹` of finite index, so `ΓgΓ = ⊔ᵢ gᵢΓ`
  is a finite union of cosets) packaged in the commensurator conditions. What this roadmap adds
  on top: the classical `GL₂(ℚ)` instances — `Γ₀(N)`, `Γ₁(N)` inside the integral-matrix
  submonoid (AINTLIB `Gamma0_pair`, `Gamma1Pair.lean`) — the degree map, and **commutativity**
  via the transpose anti-involution fixing every double coset (AINTLIB
  `mul_comm_of_antiInvolution`, `GLn/TransposeAntiInvolution.lean`). Keep the
  abstract ring separate from its action, so the structural facts (commutativity, generation by
  `T_p`, `⟨p⟩`) are proved once.
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
  zero-extension), so the single recurrence also covers the bad-prime operator `Uₚ` (`p ∣ N`);
  AINTLIB's `p ∣ N` branch indeed carries no `χ` term.
- **The diamond operators land in the Hecke algebra.** The slash-defined `⟨d⟩` of Layer 0 are
  recovered here as the double cosets of `Γ₀(N)/Γ₁(N) ≅ (ℤ/N)ˣ` (the diamond part of AINTLIB's
  `heckeRingDn : 𝕋 (Gamma0_pair N) ℤ`), and on `M_k(N, χ)` the ring acts through
  `heckeRingHomCharSpace` with `⟨d⟩` acting by the scalar `χ(d)` — immediate from Layer 0's
  `mem_modFormCharSpace_iff`. The compatibility of the two descriptions is a **theorem** here,
  not a definition.
  ⚠ The action must preserve cuspidality and the nebentypus; prove that, don't assume it.

- The Hecke algebra in this roadmap is the classical double-coset ring of (a)–(b). Its adelic
  reformulation is **out of scope** here and left to a future roadmap.

### Layer 3: the Petersson inner product, adjoints, oldforms and newforms
- **The Petersson inner product** as a genuine positive-definite Hermitian inner product on
  `S_k(Γ)` (integrate Mathlib's `petersson` integrand over a fundamental domain against the
  hyperbolic measure — AINTLIB's level-`N` pairing `petN`, `Modularforms/PeterssonLevelN.lean`),
  and **`Tₙ` is self-adjoint** for `(n,N)=1` (`⟨T_n f, g⟩ = ⟨f, T_n g⟩` — AINTLIB
  `heckeT_n_adjoint`, hypotheses `[NeZero n]` and `Nat.Coprime n N`,
  `HeckeRIngs/GL2/AdjointTheoryPetersson.lean`), so the Hecke algebra away from the
  level is simultaneously diagonalizable.
- **Oldforms and newforms (the spaces):** the old subspace `S_k(N)^{old}` spanned by
  level-raising images `f(τ), f(dτ)` from proper divisors, the **new** subspace `S_k(N)^{new}` as
  its Petersson-orthogonal complement (AINTLIB `cuspFormsOld`, `cuspFormsNew`,
  `Newforms/Basic.lean`), and their orthogonality and `Tₙ`-stability.
  ⚠ Old-subspace stability under the **bad-prime** `Uₚ` (`p ∣ N`; Diamond–Shurman Prop 5.6.2) is
  a flagged open `sorry` in AINTLIB (`peterssonInner_aggregate_eq_zero_of_new_old`,
  `Newforms/AdjointTheoryBadPrime.lean`), with a source-faithful Fricke-route replacement in
  progress (`Newforms/{BadPrimeFDTiling,BadPrimeTraceFricke,FrickeOldStable}.lean`) — a proof
  obligation of this layer, not a finished migration.

### Layer 4: eigenforms, newforms, primitive forms; the conductor
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
  Two design points the packaging encodes, to keep: eigen-ness is demanded **only at `n`
  coprime to `N`** (the bad-`n` ring element lives in other double cosets), with the all-`n`
  upgrade for a `Newform` the **Atkin–Lehner–Li theorem** (`Newform.isFullEigenform`), not a
  structure field; and bad-index eigenvalue data is **pinned to `0`**, so an `Eigenform` is
  determined by its underlying form and `χ`.
- **The Main Lemma** (Diamond–Shurman Thm 5.7.1 / Miyake §4.6, the Atkin–Lehner key lemma): a
  cusp form `f ∈ S_k(Γ₁(N))` whose Fourier coefficients vanish at every index coprime to `N`
  (`aₙ = 0` whenever `(n, N) = 1`) is an **oldform**. In the latest AINTLIB this is **fully
  proved**, global statement included: `mainLemma` (`Newforms/MainLemmaProof.lean`) follows by
  nebentypus decomposition from the per-character route `mainLemma_charSpace_routeB`
  (`StrongMultiplicityOne.lean`, Miyake's sieve/conductor descent) — a migration, not a new
  proof obligation.
- **The conductor dichotomy** (Miyake Thm 4.6.4). What AINTLIB proves — `sorry`-free, hypotheses
  and all (`conductor_theorem_dichotomy_cuspForm_strong`, `Eigenforms/ConductorTheorem.lean`) —
  is the level-lowering step: for `l ∣ N`, `χ : DirichletCharacter ℂ N`, and a `T`-periodic
  `f : ℍ → ℂ` whose level-raise by `l` lies in `S_k(N, χ)`, **either** `χ` factors through `N/l`
  and `f` is itself a cusp form in `S_k(N/l, χ↓)` for the lowered character, **or** `f = 0`.
  Port that statement as-is; the packaged **conductor theorem** — every normalized eigenform is
  the level-raise of a newform of a unique minimal level `M ∣ N`, its **conductor** — is the
  target assembled from the dichotomy and the Main Lemma.

### Layer 5: strong multiplicity one and the eigenform characterization
- **Strong multiplicity one** (Diamond–Shurman Thm 5.8.2 / Miyake Thm 4.6.12), **as proved in
  AINTLIB** (`strongMultiplicityOne`, `StrongMultiplicityOne/ConstantMultiple.lean`): two
  `Newform N k` **with the same nebentypus** — both underlying forms in `modFormCharSpace k χ` —
  whose eigenvalues agree at every index `n` coprime to `N` outside a **finite exceptional set**
  are equal. Keep all three hypothesis groups: same level and weight (in the type), the shared
  `χ`, and the finite exceptional set of coprime indices (that finite slack is the "strong";
  nothing is assumed at `p ∣ N`). The engine is `strongMultiplicityOne_constMul` — a `Newform`
  and an `Eigenform` sharing eigenvalues are proportional — and `a₁ = 1` pins the constant to
  `1`.
- On top of the migrated theorem, the further targets of this layer: **multiplicity one** (each
  simultaneous Hecke eigenspace in the new subspace is one-dimensional) and the newforms as an
  **orthogonal basis** of `S_k(Γ₁(N))^{new}`.
- **Diamond–Shurman Proposition 5.8.5** (the coefficient characterization): for `f ∈ M_k(N,χ)`,
  `f` is a normalized eigenform **iff** its Fourier coefficients satisfy
  ```text
  (1)  a₁ = 1
  (2)  a_{p^r} = a_p·a_{p^{r-1}} − χ(p)·p^{k-1}·a_{p^{r-2}}   for all primes p and r ≥ 2
  (3)  a_{mn} = a_m·a_n   whenever (m,n) = 1.
  ```
  This is the bridge to the Euler product (Layer 7): conditions (2)–(3) are exactly
  multiplicativity of the Dirichlet series.

### Layer 6: Atkin–Lehner and Fricke operators
- The Atkin–Lehner involutions `W_Q` for each exact divisor `Q ‖ N` (#18), the **Fricke
  involution** `W_N` (the `Q = N` slash by `[0,-1;N,0]`), their relations with `Tₙ` (commute away
  from `Q`), and on a newform the **signs** `W_Q f = ε_Q(f)·f` with `ε_Q ∈ {±1}` for real
  nebentypus, multiplying to the Fricke sign — the sign of the functional equation.
- AINTLIB provides the Fricke side to migrate — `frickeOperator`/`frickeOperatorCusp`, the
  normalizing `frickeScalar`, and the character-space transport `frickeCharRestrict`/
  `frickeCharEquiv` (`HeckeRIngs/GL2/Fricke.lean`), with old-space stability in
  `Newforms/{FrickeOldStable,BadPrimeTraceFricke}.lean`. The general `W_Q` family for `Q ‖ N`
  and the sign theory on newforms are **new** here.

### Layer 7: L-functions
- **The L-function** `L(s,f) = Σ_{n≥1} aₙ(f)·n^{-s}` (AINTLIB `lCoeff`/`lSeries`,
  `Modularforms/LFunction.lean`), built on Mathlib's `LSeries`, with **convergence** as proved
  (Diamond–Shurman Prop 5.9.1, on arithmetic subgroups — the `Γ.IsArithmetic` class): abscissa
  `≤ k/2 + 1` for cusp forms (`abscissaOfAbsConv_lCoeff_le_cuspForm`); `≤ k + 1` for modular
  forms **of weight `k ≥ 0`** (`abscissaOfAbsConv_lCoeff_le` carries the hypothesis `0 ≤ k` —
  keep it).
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
  the self-dual `Λ(s,f) = ε·Λ(k−s,f)` with a **sign** is the corollary once Layer 6 gives
  `W_N f = ε·f` on newforms with real nebentypus.
- **Analytic rank and analytic conductor** (#31): the order of vanishing of `L(f,·)` at the central
  point `s = k/2`, and the conductor `N·(…Γ-factor…)`.

### Layer 8: coefficient fields and the integral Hecke algebra
- **The coefficient field** `CoefficientField f = ℚ(aₙ : n) ⊆ ℂ` of a newform (#34), and the
  headline result that **it is a number field** — AINTLIB's shapes
  (`Labels/{NewformOrbit,HeckeFieldArithmetic,HeckeAlgFiniteFinal}.lean`; port name
  `CoefficientField` per the conventions):
  ```lean
  def coeffField (f : Newform N k) : IntermediateField ℚ ℂ
  instance instNumberFieldCoeffField (f : Newform N k) : NumberField (coeffField f)
  theorem coeffField_numberField_of_two_le (f : Newform N k) (hk : 2 ≤ k) :
      NumberField (coeffField f)          -- the axiom-clean route, no weight-1 input
  ```
  proved via the **integral Hecke algebra `heckeAlgℤ N k` is a finitely generated ℤ-module** (the
  integral `q`-expansion / Eichler–Shimura lattice, Shimura Thm 3.48/3.51/3.52, Miyake Thm
  4.5.9/4.5.19).
  ⚠ **Status (latest AINTLIB `dev/leanmodularforms`, 2026-07-17):** largely proved, not a lone gap.
  For `k ≥ 2` the finiteness is `heckeAlgℤ_finite_of_two_le` via the integral modular-symbol
  period route (`ModularSymbols.heckeAlgℤ_finite_of_period` — axiom-clean), and
  `heckeAlgℤ_finite_of_lattice` covers `k < 2` from a Hecke-stable lattice; the unconditional
  instance case-splits between the two. The residual `sorry`s are the **weight-1 Hecke-stable
  lattice** `exists_HeckeStableLattice_one` (Deligne–Serre 1974 Prop 2.7, a citable classical
  input — with `U_p`-stability at `p ∣ N` needing separate care) and the research-scale
  Eichler–Shimura **Stokes / boundary-period step** `interior_edges_cancel_sum`
  (`ModularSymbols/PeterssonStokes.lean`), which the `k ≥ 2` finiteness route does **not** pass
  through — the deepest remaining analytic input for the LMFDB layer.

### Layer 9: the LMFDB invariant layer
Each is a named definition with its basic API, mostly short once Layer 8 exists:
- **Hecke characteristic polynomials** (#35): `charpoly(Tₙ | S_k(N,χ)^{new})`, its coefficients as
  traces of Hecke operators, and the factorization into Galois orbits.
- **Satake parameters and angles** (#32): `α_p, β_p` the roots of `X² − aₚX + χ(p)p^{k-1}`,
  `θ_p = arg α_p`. The Ramanujan–Deligne bound `|aₚ| ≤ 2 p^{(k-1)/2}` is used **only to frame the
  definition** (it places `θ_p` on the real line); it is **not a target of this roadmap** — proving
  it needs the Weil conjectures and Deligne's reduction of Ramanujan to them, which are far outside
  the analytic scope here.
- **Galois-conjugate forms and orbits** (#38): `f^σ` (act on coefficients), the orbit `{f^σ}` and
  `#orbit = dim` of the newform; **inner twists** (#42).
- **Galois-group certification** (the coefficient-field summit's milestone): the Galois closure of
  `CoefficientField f` and a decision procedure for its **solvability** — what the weight-60
  non-solvable eigenform (worked examples) is certified against.
- **Dual / self-dual** (#55): `f̄` (conjugate coefficients) and `IsSelfDual f ↔ ∀n, (aₙ).im = 0`.
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
  layer's **workhorse certificate**: two forms agreeing on the first `⌊k·[SL₂(ℤ):Γ]/12⌋ + 1`
  coefficients are equal, which is how the concrete dimension instances in `Suggested.lean` and
  the LMFDB layer's equality checks (Layer 9) become finite computations.
- **The analytic theory of cusps and compactification.** Build `X(Γ) = Γ\ℍ*` as a compact Riemann
  surface: the topology and complex charts at ordinary points, at the elliptic points (where the
  chart is `z ↦ z^{e_P}`), and at the cusps (the `q`-disc chart); the **cusp count** `ε∞ = #Γ\ℙ¹(ℚ)`
  and the **elliptic-point counts** `ε₂, ε₃` (periods `2, 3`, counted in the `PSL₂(ℤ)`-image where
  the elliptic stabilizers are cyclic of order `2, 3`); and the **genus** `g` of `X(Γ)` as
  the genus of this compact Riemann surface — via the Euler characteristic of the
  `SL₂(ℤ)\ℍ*`-covering (Diamond–Shurman §3.1, §3.9). These
  counts and the genus are the inputs to the dimension formulas; building them is part of this
  layer, not assumed.
- **The dimension formulas** (Diamond–Shurman Thm 3.5.1), by the **valence / counting route**:
  derive the dimension of `M_k(Γ)` and `S_k(Γ)` from the Layer-1 valence formula together with the
  `ε₂, ε₃, ε∞` counts and the genus `g` above, extending Mathlib's level-one
  `ModularForm.dimension_level_one` to general level. For **even `k`**:
  ```text
  dim M_k(Γ) = (k-1)(g-1) + ⌊k/4⌋·ε₂ + ⌊k/3⌋·ε₃ + (k/2)·ε∞          (k ≥ 2)
  dim S_k(Γ) = (k-1)(g-1) + ⌊k/4⌋·ε₂ + ⌊k/3⌋·ε₃ + (k/2 - 1)·ε∞      (k ≥ 4),   dim S_2(Γ) = g
  ```
  (`dim M_0 = 1`, `dim S_0 = 0`, both `0` for `k < 0`); the **odd-`k`** formulas (D–S §3.6) split
  the cusps into regular and irregular and drop the `ε₂` term. `dim S_2(Γ) = g` is the statement
  that weight-two cusp forms are the holomorphic differentials on `X(Γ)`.
- `Suggested.lean` seeds this layer with concrete instances at levels `> 1`: `dim S_2(Γ₀(11)) = 1`,
  `dim S_2(Γ₀(23)) = 2`, `dim S_2(Γ₀(2)) = 0`, `dim M_2(Γ₀(11)) = 2`. The general even-weight
  formula above is the layer's headline target; it is stated here in the README (it needs the
  `ε₂, ε₃, ε∞, g` of `X(Γ)` from this same layer, so it is grounded), and is **not** seeded as a
  free-parameter `example` in `Suggested.lean`, since with `g, ε₂, ε₃, ε∞` as free variables it is
  false for the wrong data. We keep only the concrete, verifiable instances and pin the general
  statement in prose.

### Layer 11: the Eichler–Selberg trace formula (level one)
An independent lane off Layers 2–3 and **not an AINTLIB migration**: neither AINTLIB nor Mathlib
has any of it (no Hurwitz class numbers, no trace formula) — this layer is new formalization
ground, and no Lean prior art exists anywhere.

- **Hurwitz class numbers, combinatorially.** `H : ℕ → ℚ` with `H 0 = −1/12` and, for `D > 0`
  with `−D ≡ 0, 1 (mod 4)`, `H D` = the number of `SL₂(ℤ)`-classes of positive-definite integral
  binary quadratic forms `ax² + bxy + cy²` of discriminant `b² − 4ac = −D`, counting the classes
  of multiples of `x² + y²` with weight `1/2` and of `x² + xy + y²` with weight `1/3`
  (`H D = 0` for `−D ≡ 2, 3 (mod 4)`). Define it by **reduced forms** — a finite, decidable
  count: **no class groups, no class field theory** — and ship it with the first values
  `H 3 = 1/3`, `H 4 = 1/2`, `H 7 = 1`, `H 8 = 1` as `decide`-style tests. Independently
  Mathlib-worthy.
- **The weight polynomials.** `P_k(t, n)`, the coefficient family with generating function
  `Σ_{k ≥ 2} P_k(t,n)·x^{k−2} = (1 − tx + nx²)⁻¹`, i.e.
  `P_k(t,n) = (ρ^{k−1} − ρ̄^{k−1})/(ρ − ρ̄)` for `ρ + ρ̄ = t`, `ρρ̄ = n` — Miyake's elliptic
  weight `a_k(t)` (§6.8) — equivalently `n^{(k−2)/2}·U_{k−2}(t/(2√n))`: relate it to Mathlib's
  Chebyshev polynomials (`Polynomial.Chebyshev.U`), do not re-found a polynomial family.
- **The trace formula** (even `k ≥ 4`, `n ≥ 1`):
  ```text
  tr(Tₙ | S_k(SL₂(ℤ))) = −½·Σ_{t ∈ ℤ, t² ≤ 4n} P_k(t,n)·H(4n − t²) − ½·Σ_{d·d′ = n, d,d′ > 0} min(d,d′)^{k−1}
  ```
  ⚠ Pin the packaging before writing code: this is Zagier's normalization, in which
  `H 0 = −1/12` makes the `t² = 4n` terms absorb the identity/volume contribution
  (`P_k(±2√n, n) = (k−1)·n^{(k−2)/2}`) and the divisor sum carries the hyperbolic and parabolic
  mass; Miyake Thm 6.8.4 keeps these contributions separate. Either bookkeeping works; do not
  mix them. The `k = 2` variant carries a `σ₁(n)`-type correction term — a later refinement, not
  the first target.
- **Two proof routes, both substantially on rails this roadmap already lays; choose one:**
  - *(A) the kernel route* (Miyake §§6.1–6.4; Zagier's appendix in Lang): the two-variable
    kernel `ω_n(z, w) = Σ_{ad−bc=n} (czw + dz + aw + b)^{−k}` — absolute convergence for
    `k ≥ 4` is the same lattice-sum technology as Mathlib's Eisenstein series — is, up to an
    explicit constant, the **Petersson kernel of `Tₙ`** (the reproducing property; this is the
    Petersson-coefficient / Poincaré-series machinery of Miyake Thms 2.6.9–2.6.10, built here
    since neither Mathlib nor AINTLIB has it), and `tr Tₙ = ∫_{Γ\ℍ} ω_n(z, ·)`-on-the-diagonal
    unfolds over `SL₂(ℤ)`-conjugacy classes into closed-form elliptic and hyperbolic integrals —
    on Layer 3's `petN`/`μ_hyp`/fundamental-domain apparatus, the same unfolding pattern as
    AINTLIB's `heckeT_n_adjoint`. The class `H(4n − t²)` enters by counting integer matrices of
    determinant `n` and trace `t` up to conjugacy ↔ binary quadratic forms of discriminant
    `t² − 4n`.
  - *(B) the period-polynomial route* (Popa–Zagier): compute the Hecke action and its trace on
    **period polynomials** — the world of AINTLIB's `HeckeRIngs/GL2/ModularSymbols/*`
    (`HeckeSymbol`, `PeriodHecke`, `SL2Generation`) — where the trace identity is provable with
    **no analytic input**; the transfer to `S_k(SL₂(ℤ))` rides the Eichler–Shimura isomorphism,
    so the Layer-8 Stokes wall `interior_edges_cancel_sum` gains a second consumer.
- **Acceptance criteria:** `tr T(1) = dim S_k(SL₂(ℤ))` against Mathlib's
  `ModularForm.dimension_level_one` — the trace formula re-derives the level-one dimension
  formula; `tr T(2) | S₁₂ = τ(2) = −24` — the Δ worked example, reached from a second direction;
  the characteristic polynomial of `T₂` on `S_k(SL₂(ℤ))` for a few `k`, feeding Layer 9's
  `charpoly` targets at level one.
- **Scope wall.** The general-level formula — `tr(Tₙ | S_k(Γ₀(N), χ))`, Miyake Thm 6.8.4, proved
  there for orders in indefinite quaternion algebras via §§6.5–6.7 (local conjugacy classes,
  optimal-embedding counts, Eichler symbols, class numbers of non-maximal orders of `ℚ[α]`) — is
  **out of scope**: that apparatus shares nothing with this roadmap's layers and belongs to a
  future roadmap (Hijikata's formula), not to an extension of this layer.

## Worked examples (acceptance criteria, keeping the theory honest)

- **Δ at level one** (`k = 12`, `N = 1`): the unique normalized cusp form; `τ(p)` are its Hecke
  eigenvalues; `aₙ` multiplicative with the `τ(p^r)` recurrence (Prop 5.8.5). The first eigenvalue
  is concrete: **`T₂` acts on `Δ` by `−24`** (`a₂(Δ) = τ(2) = −24`, from the coefficient of `q²`
  in `Δ = q∏(1−qⁿ)²⁴`, equivalently `(E₄³ − E₆²)/1728`) — a fully computable acceptance test of the
  Hecke action (Layer 2).
- **Level 11, weight 2** (`S₂(Γ₀(11))`, dimension 1): a single newform, the elliptic curve `11a`;
  its Fricke sign (Layer 6) and the rank-0 functional equation (Layer 7).
- **Level 37, weight 2** (two newforms with opposite Atkin–Lehner signs): the multiplicity-one /
  sign acceptance test (Layers 5–6).
- **A newform with non-real `aₙ`** (CM coefficient field): `CoefficientField f` a genuine
  imaginary-quadratic field, not totally real — the coefficient-field acceptance test (Layer 8) and
  the not-self-dual test (Layer 9).
- **`η²⁴ = Δ`** as a weight-12 eta quotient (#19): develop `η = q^{1/24}∏(1−qⁿ)` and its `SL₂(ℤ)`
  transformation, and the Ligozat criterion, as an explicit worked example of a modular form rather
  than as general theory.
- **The aspirational coefficient-field summit — a weight-60 level-one eigenform with non-solvable
  coefficient field.** There is a normalized eigenform `f ∈ S₆₀(SL₂(ℤ))` whose coefficient field
  `CoefficientField f` has a Galois closure over `ℚ` that is **not solvable** — the first known
  example, computed by Buzzard in 1992 in answer to a question of Ramakrishnan
  ([*J. Number Theory* **57** (1996)](https://www.sciencedirect.com/science/article/pii/S0022314X96900396)).
  It is a finite, fully grounded computation once Layers 8–9 exist (the coefficient field of a
  level-one eigenform and its Galois group), and is the headline acceptance test for the
  coefficient-field layer.

## Ordering

Layer 0 (diamond operators and nebentypus) and Layer 2 (Hecke operators) are the trunk and come
first; the valence
formula (Layer 1) is an independent early lane that only needs the Contour Integration roadmap.
Layers 3–5 (Petersson → newforms → strong multiplicity one) are the core arithmetic and must be
sequential. Layers 6–7 (Atkin–Lehner → L-functions) and Layer 8 (coefficient fields) consume
Layer 5; Layer 9 (LMFDB invariants) consumes Layer 8. Layer 10 (the modular curve `Γ\ℍ` and the
dimension formulas) consumes Layer 1 and Mathlib's Sturm-bound finiteness, and is otherwise
independent. Layer 11 (the level-one trace formula) consumes Layers 2–3 on the kernel route or
the Layer-8 modular-symbol machinery on the period-polynomial route, is otherwise independent,
and feeds Layer 9's characteristic-polynomial targets while cross-checking Layer 10 at level
one.

## Provenance (migrate and clean from AINTLIB `LeanModularForms`)

Secondary to the mathematics above: the migration map. The reference is the AINTLIB monorepo's
`projects/LeanModularForms/` on branch **`dev/leanmodularforms`** (resynced **2026-07-17**, at
`112d12d95`); paths are relative to its `LeanModularForms/`. The tree is **actively
restructured**, so verify names against the live tree before porting. Headline theorems are
`sorry`-free unless flagged; the flagged open `sorry`s are exactly three —
`exists_HeckeStableLattice_one` (L8), `interior_edges_cancel_sum` (L8), and
`peterssonInner_aggregate_eq_zero_of_new_old` (L3, bad primes) — plus the
`ModularSymbols/Skeleton.lean` spec file and the out-of-scope `GLn/PolynomialRing.lean`
general-`n` branch.

- **Nebentypus / characters (L0):** `HeckeRIngs/GL2/Gamma1Pair.lean` (`diamondOp*`,
  `diamondOpHom`, `modFormCharSpace`, `cuspFormCharSpace`, the `*_iff_nebentypus` bridges);
  `HeckeRIngs/GL2/CharacterDecomp.lean` (`ModularForm_Gamma1_charSpace_directSum` and its
  `iSupIndep`/`iSup` halves, plus the cusp-form versions).
- **Valence formula (L1):** `ForMathlib/ValenceFormulaFinal.lean` (`valence_formula_textbook`)
  on top of `ForMathlib/ValenceFormula*.lean` and `ForMathlib/ValenceFormula/WindingWeights/*`,
  with the FD-boundary bridge (`ForMathlib/*FDBoundary*`, `*CornerFTC*`, `*CrossingAt*`) over
  the Contour Integration engine.
- **Hecke theory (L2):** `HeckeRIngs/AbstractHeckeRing/*` (the abstract ring — **being
  upstreamed** as Mathlib #41251 merged + #41253–#41328 in review; commutativity via
  `mul_comm_of_antiInvolution` with `GLn/TransposeAntiInvolution.lean`);
  `HeckeRIngs/GL2/{Basic,HeckeT_p,HeckeT_p_Gamma0,HeckeT_p_Gamma1,HeckeT_p_GLpair,HeckeT_n,FourierHecke,MultiplicationTable,CongruenceIndex,Degree,LevelEmbed,LevelRaise}.lean`;
  the ring-action layer
  `HeckeRIngs/GL2/Unified/{Gamma0RingDn,NebentypusHeckeRingHom,RingTransport,ShimuraHom,TwistedHeckeRing}.lean`
  (`heckeRingDn`, `heckeRingHomCharSpace`, the Shimura-normalized
  `heckeRingHomCharSpaceShimura`).
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
- **Coefficient field (L8):** `Labels/{HeckeFieldArithmetic,HeckeAlgFiniteFinal,NewformOrbit}.lean`
  (`heckeAlgℤ`, `heckeAlgℤ_finite_of_two_le`/`heckeAlgℤ_finite_of_lattice`, `coeffField`,
  `coeffField_numberField_of_two_le`) plus the integral-period route in
  `HeckeRIngs/GL2/ModularSymbols/*`. Largely proved (`k ≥ 2` axiom-clean); residual `sorry`s are
  the weight-1 lattice `exists_HeckeStableLattice_one` (`Labels/HeckeFieldArithmetic.lean`) and
  the Eichler–Shimura Stokes wall `interior_edges_cancel_sum`
  (`ModularSymbols/PeterssonStokes.lean`).
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
  Modular Forms* — the level-one normalization of Layer 11; A. Popa, D. Zagier, *A simple proof
  of the Eichler–Selberg trace formula*
  ([arXiv:1711.00327](https://arxiv.org/abs/1711.00327)) — the period-polynomial route.
- G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions*: Ch. 3 (the Hecke
  algebra and its integral structure, Thms 3.48/3.51/3.52).
- K. Buzzard, *On the eigenvalues of the Hecke operator T₂*, J. Number Theory **57** (1996) — the
  weight-60 non-solvable coefficient-field example (worked examples).
- J. Sturm, *On the congruence of modular forms*, in *Number Theory* (New York 1984–85), Springer
  LNM **1240** — the Sturm bound (Layer 10), heading into Mathlib via the modular norm map
  (#38993 merged, #39000 in review).
- N. Hungerbühler, M. Wasem, *Non-integer valued winding numbers and a generalized Residue
  Theorem*, arXiv:1808.00997 — the contour-integration engine behind the valence formula's
  elliptic-point weights (see the [Contour Integration roadmap](../ContourIntegration/README.md)).
- A. Atkin, J. Lehner, *Hecke operators on Γ₀(m)*; W. Stein, *Modular Forms: A Computational
  Approach* (the small-level dimension tables). The **LMFDB** (`https://www.lmfdb.org`) knowls
  fixed by the target definitions.

## Acknowledgements

The body of theory is **migrated and cleaned** from the AINTLIB `LeanModularForms` project
([github.com/CBirkbeck/AINTLIB](https://github.com/CBirkbeck/AINTLIB)), where the headline results
are already `sorry`-free; thanks to its authors. The target definitions discharge a large set of
"def-wanted" specifications from the [LeanBridge](https://github.com/CBirkbeck/LeanBridge)
project: issues #13, #18, #19, #30–#35, #37, #38, #42, #54, #55. The Contour Integration engine the valence
formula depends on is the sibling [Contour Integration roadmap](../ContourIntegration/README.md).
