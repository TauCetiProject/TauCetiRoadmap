# Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch

Mathlib has a rich valuation-theoretic and
Dedekind-domain substrate — `IsDedekindDomain.HeightOneSpectrum` with `ℤᵐ⁰`-valued adic
valuations, the factorization calculus `FractionalIdeal.count` (an unlabelled isomorphism
`(FractionalIdeal R⁰ K)ˣ ≅ (HeightOneSpectrum R →₀ ℤ)`), `ClassGroup`, the different ideal
with its conductor formula, `Ideal.sum_ramification_inertia`, Kähler differentials with the
full smooth/étale/separability dictionary, and even an Ostrowski theorem classifying the
places of `RatFunc K` over an arbitrary field `K` — and **no theory of algebraic curves at
all**: no genus, no Riemann–Roch theorem, no divisor type of any kind, no degree of a
closed point, no `L(D)`, no canonical divisor, no Weil differentials or repartitions, no
product formula for function fields, and no Riemann–Hurwitz. Everything downstream of a
curve — elliptic-curve arithmetic beyond the group law, the geometry of modular and
Shimura curves, Jacobians, function fields of positive characteristic, Goppa codes —
eventually stands on this theory, and Riemann–Roch has been a named target of the Lean
community for years.

This roadmap builds the theory of algebraic function fields of
one variable — places, divisors, the class group, Riemann–Roch spaces `L(D)` and `ℓ(D)`,
the genus, **Riemann–Roch** proved with Weil differentials and the canonical class by the
adele/repartition argument, its consequences (the `deg > 2g − 2` regime, Clifford,
Weierstrass gaps), extensions of function fields with ramification, the different and
**Riemann–Hurwitz**, constant-field extensions (with the inseparable traps pinned
honestly), the model classes (elliptic, hyperelliptic, smooth plane curves), automorphism
groups with the Hurwitz `84(g−1)` bound, and — as a definite later layer — the dictionary
between function fields and regular projective curves, where the comparison contracts with
the scheme-cohomological world live.

**Portfolio ownership.** This roadmap is the sole owner of general function-field places,
divisors and `L(D)`, Weil differentials and Riemann–Roch, extension ramification and
Riemann–Hurwitz, regular projective models, and the curve/function-field anti-equivalence.
`BelyiMaps` consumes these exact carriers for algebraization and Belyi-specific constructions;
it does not define a parallel place, divisor, or Riemann–Roch theory.

**Route decision (pinned).** The development is **function-field-first**, following
Stichtenoth: a curve *is* its field of algebraic functions, places are normalized discrete
valuations, and Riemann–Roch is proved by Weil's repartition argument — linear algebra over
`k` inside the restricted product `∏'_P F`, with no schemes, no sheaves, and no cohomology.
This matches where the pin is strong (valuations, Dedekind domains, `RatFunc`, Laurent
series) and where it is empty (no coherent cohomology, no scheme dimension theory, no
divisors on schemes: the sheaf-cohomological route would spend its entire budget building
`Hⁱ` before stating anything). The scheme-theoretic formulation is not abandoned but
*layered*: the merged [JacobianChallenge](../JacobianChallenge/README.md) roadmap builds
scheme divisors, coherent cohomology, and Serre duality on the way to `Pic⁰` (its Layers
A–B state Riemann–Roch as `χ(L) = deg L + 1 − g` with `g := dim H¹(X, 𝒪_X)`), and this
roadmap's final layer carries the **comparison contract** identifying the two theories over
the curves ↔ function-fields dictionary, so the two routes meet instead of duplicating
(§Coordination). Elliptic curves are deliberately *not* redeveloped here: the merged
[EllipticCurves](../EllipticCurves/README.md) roadmap
owns the arithmetic of `WeierstrassCurve.FunctionField` and proves everything it needs
"with no Riemann–Roch anywhere"; its Layer 0 builds places and divisors for Weierstrass
function fields concretely, leaving the implementation "to the upstream coordination" —
this roadmap supplies the *general* theory those places instantiate, with named
compatibility milestones (§Coordination).

Suggested home: `TauCeti/FieldTheory/FunctionField/`, with subdirectories per layer
(`Place/`, `RatFunc/`, `AffineModel/`, `Divisor/`, `RiemannRoch/`, `Consequences/`,
`Extension/`, `Different/`, `ConstantExtension/`, `Differential/`, `Examples/`,
`Automorphism/`), and the final dictionary layer under `TauCeti/AlgebraicGeometry/Curve/`.
Justification: the objects of Layers 0–11 are field-theoretic — valuations of `F` trivial
on `k`, `Finsupp` divisors, subspaces of `F` — and their Mathlib substrate lives in
`Mathlib/FieldTheory/RatFunc/`, `Mathlib/RingTheory/Valuation/`, and
`Mathlib/RingTheory/DedekindDomain/`; Mathlib's own `Mathlib/NumberTheory/FunctionField.lean`
is the *global-fields* view (finite constant field, one chosen generator) — the
finite-constant-field specialization a future CurvesOverFiniteFields roadmap would own, not
the general theory; and
`TauCeti/AlgebraicGeometry/` is where the dictionary layer's outputs belong, next to the
JacobianChallenge home, so the two roadmaps meet in one namespace. ⚠ Name hygiene: Mathlib's
`FunctionField Fq F` is an `abbrev` for `FiniteDimensional Fq⟮X⟯ F` *relative to a chosen*
`Algebra (RatFunc Fq) F` instance; the intrinsic predicate defined here gets a distinct
name (`IsFunctionField`, see conventions) and a comparison lemma, never a redefinition.
Note also the pin's notation collision: `F⟮X⟯` is scoped notation for `RatFunc F` while
`F⟮y⟯` is `IntermediateField.adjoin F {y}` — both appear in this theory; spell out
`RatFunc` where confusion is possible.

## Scope boundaries (what is deliberately not here)

- **Zeta functions and everything over finite constant fields as such** (Stichtenoth Ch. 5:
  rationality, the functional equation, Hasse–Weil) → a future CurvesOverFiniteFields
  roadmap, a consumer, not a dependency, of this one. This roadmap proves the
  finite-field-relevant *inputs* that are pure Riemann–Roch (finiteness of the degree-zero
  class group over a finite constant field — the zeta-free half of Stichtenoth 5.1,
  Lemma 5.1.1 + Prop. 5.1.3; the class-number finiteness bridge to Mathlib's
  `ClassGroup (ringOfIntegers Fq F)` — Layer 5's finite-constant-field subsection), and
  stops there.
- **Jacobians and abelian varieties** → [JacobianChallenge](../JacobianChallenge/README.md)
  (construction) and a future AbelianVarieties roadmap (arithmetic). Here `Cl⁰(F)` is a
  plain abelian group; giving it a variety structure is exactly the JacobianChallenge.
- **Modular curves** — the moduli-theoretic theory (Katz–Mazur level structures, fine and
  coarse spaces) is its own subject and no part of this roadmap. The merged
  [ModularForms](../ModularForms/README.md) roadmap builds the analytic quotient `Γ\ℍ*`
  with its genus and an analytic compact-Riemann-surfaces Riemann–Roch chain **inside its
  own Layer 10**, so it consumes nothing from here; the eventual analytic ↔ algebraic
  genus comparison is an explicit scope exclusion recorded after Layer 12.
- **Elliptic-curve specifics** → the merged [EllipticCurves](../EllipticCurves/README.md)
  roadmap (isogenies, torsion, heights, Mordell–Weil, …).
  Here elliptic function fields appear once, as the genus-1 model class with the
  compatibility milestones of Layer 10.
- **Hyperelliptic arithmetic invariants** (Igusa invariants, minimal models, cluster
  pictures) → a future HyperellipticCurves roadmap; here hyperelliptic function fields are
  a model class (existence of the separable degree-2 rational subfield, the genus formula).
- **Belyi maps and dessins** → the BelyiMaps roadmap, which consumes this
  roadmap's extension/ramification layers and Riemann–Hurwitz.

## Standing hypotheses

The standing setting is a field `k` and a field `F` with `[Field k] [Field F]
[Algebra k F]`, satisfying the one-variable function-field predicate pinned below
(`IsFunctionField k F`: some `x : F` is transcendental over `k` with `F` finite over
`k(x)`). Pass this proposition explicitly as `(hF : IsFunctionField k F)`; it is not a
typeclass, because it supplies no canonical data and no downstream construction benefits from
instance synthesis. Spell the hypotheses out; do not bundle them into a structure. Two further
hypotheses appear constantly and must always be **explicit**, never absorbed:

- **Exactness of the constant field.** Pinned spelling: Mathlib's
  `IsIntegrallyClosedIn k F` — for a field extension integral = algebraic, so this says
  every element of `F` algebraic over `k` is in the image of `algebraMap k F` (the
  literature's "`k` is the full / exact field of constants"; Stichtenoth's standing
  assumption from Ch. 1 §1.4 on); equivalently `algebraicClosure k F = ⊥` in the pin's
  relative-algebraic-closure vocabulary, with both faces of the dictionary Layer-0
  milestones. The general theory of places (Layer 0) does not need it; everything from
  divisor degrees on behaves badly without it (`ℓ(0) = [k̃ : k]`, degrees rescale) — so it
  is a stated hypothesis from Layer 3 onward, and the finiteness of the constant field
  `k̃/k` (already in Mathlib as `FunctionField.finiteDimensional_of_constantExtension`)
  plus the base-change device `F/k̃` are early milestones, so a consumer can always *pass*
  to the exact situation.
- **Perfectness / separability, where the mathematics needs it.** ⚠ Never write
  `[PerfectField k]` as a blanket assumption. The core theory (Layers 0–5, through
  Riemann–Roch and its consequences) is characteristic-free and perfectness-free —
  Stichtenoth's Ch. 1 assumes nothing of `k`, and his Ch. 3's chapter-wide "`k` perfect"
  umbrella is consumed by far fewer results than it covers (the per-theorem audit is in
  Layers 6–8). The places where hypotheses genuinely enter,
  each pinned at its layer: separability of `F′/F` for the Hurwitz genus formula (Layer 7;
  false without it); `k` perfect (or the milder "`F/k` separably generated / conserved")
  for genus invariance under constant-field extension (Layer 8; **false in general** —
  inseparable constant extensions can drop the genus); `Algebra.EssFiniteType` on the
  actual algebra carrier used by the Kähler comparison, exactly as the pin's
  `FormallyUnramified.iff_isSeparable` carries
  them (Layer 9); characteristic-zero (or `p`-bounds) for the Hurwitz automorphism bound
  (Layer 11). Statements must carry their true hypotheses; every "char 0 for simplicity"
  shortcut in the literature is a trap flagged at its layer.

Do not fix `k` finite, algebraically closed, or of characteristic zero in the general
layers: downstream consumers live over `ℚ` and number fields (genus of modular and Shimura
curves), over finite fields (curves over `𝔽_q`), and over `ℂ` (Belyi maps); the theory is
stated over an arbitrary field with the honest hypotheses above.

## Pinned conventions

| object | convention | source of truth |
|---|---|---|
| function field | `IsFunctionField k F : Prop` — `∃ x : F, Transcendental k x ∧ FiniteDimensional k(x) F` (intrinsic; no chosen generator), passed explicitly as `hF`, not installed as a typeclass. Comparison lemmas to Mathlib's chosen-generator `FunctionField Fq F` and to `Algebra.trdeg k F = 1` under **`Algebra.EssFiniteType k F`** (finite generation as a field extension; equivalently `(⊤ : IntermediateField k F).FG`) are Layer-0 milestones, not definitions | Layer 0; `Mathlib/NumberTheory/FunctionField.lean` |
| place | a **normalized** discrete valuation: `v : Valuation F ℤᵐ⁰` with `Function.Surjective v` and `v` trivial on `k` (`v (algebraMap k F c) = 1` for `c ≠ 0`; Mathlib's `Valuation.IsTrivialOn`). Normalization kills the equivalence-class quotient: place equality *is* valuation equality. The unnormalized view (equivalence classes of valuations / valuation subrings `k ⊆ 𝒪 ⊊ F`) is related by early milestones, aligned with the hypotheses of the pin's `RatFunc.valuation_isEquiv_infty_or_adic` (`IsRankOneDiscrete` + `IsTrivialOn`) | Layer 0 |
| multiplicative vs additive | Mathlib's multiplicative convention: integers are `v ≤ 1`, uniformizers have `v π = exp (−1)` (matching `intValuation`); the additive order `ord_P = −WithZero.log ∘ v_P : F → ℤ` (junk value `0` at `f = 0`, flagged in every statement) with `ord_P π = 1`. The translation is one named lemma, matching the local-field convention | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean` |
| valuation ring, residue field, degree | `𝒪_P` = the valuation subring of `v_P`; residue field `F_P := IsLocalRing.ResidueField 𝒪_P` (never a bespoke quotient); **`deg P := Module.finrank k F_P`**. Finiteness `Module.Finite k F_P` is a theorem (Layer 0), not part of the definition; `finrank`'s junk value `0` is guarded by it | Layer 0 |
| divisor | **`Divisor k F := Place k F →₀ ℤ`** (`Finsupp`), with the pointwise partial order (`Mathlib/Data/Finsupp/Order.lean`), `D⁺/D⁻` decomposition, and support API for free. Effective means `0 ≤ D`. Never a quotient of formal sums, never a `Multiset` | Layer 3 |
| degree of a divisor | `Divisor.degree : Divisor k F →+ ℤ`, `D ↦ ∑ P ∈ D.support, D P * deg P` (`Finsupp.liftAddHom`). ⚠ `deg` weights by residue degrees; the naive `∑ D P` is only correct over algebraically closed `k` and is never the definition | Layer 3 |
| principal divisor | `div f := ∑ P, ord_P f · P` for `f ∈ Fˣ` — a group hom `Fˣ →+ Divisor k F` (additivized); support finiteness (zeros and poles are finite) is the enabling theorem. Zero divisor `div₀ f = (div f)⁺`, pole divisor `(div f)⁻` | Layer 3 |
| class group | `Cl(F) := Divisor ⧸ principal`, `Cl⁰(F) := ker deg ⧸ principal` (`deg (div f) = 0` is the product formula, a theorem). Bridge milestones to Mathlib's `ClassGroup` of affine models via `FractionalIdeal.count`, never a redefinition of `ClassGroup` | Layers 3, 10 |
| Riemann–Roch space | `L(D) : Submodule k F`, carrier `{f | ∀ P, v_P f ≤ exp (D P)}` (equivalently `f = 0 ∨ div f + D ≥ 0`); **`ℓ(D) := Module.finrank k (L D)`** with finiteness a Layer-3 theorem. `L(0) = k` iff the constant field is exact | Layer 3 |
| genus | `g(F/k) := sSup (Set.range fun D => (deg D + 1 − ℓ(D)).toNat)` — Stichtenoth's definition; well-defined (bounded) by Riemann's theorem, which also pins the characterization `∃ c, ∀ D, deg D ≥ c → ℓ(D) = deg D + 1 − g`. Genus is **defined before** Riemann–Roch and never via `H¹` or differentials; the identities `ℓ(W) = g`, `deg W = 2g − 2` are theorems | Layer 3 |
| repartitions / adeles | `A_F` := the restricted product `{a : Place k F → F // ∀ᶠ P in cofinite, v_P (a P) ≤ 1}` — entries in `F` itself (Chevalley's repartitions; Stichtenoth's 𝒜_F), **no completions**. The completion-level `FiniteAdeleRing` of an affine model is related by a Layer-5 comparison milestone, not used in the RR proof. `A_F(D)` := the sub-`k`-space `{a ∈ A_F ∣ ∀ P, v_P (a P) ≤ exp (D P)}` — the **multiplicative** condition, exactly as in `L(D)`, never the additive `ord_P (a P) ≥ −D P` (whose junk value `ord_P 0 = 0` would wrongly exclude zero entries wherever `D P < 0`); so `0 ∈ A_F(D)` for every `D`, definitionally | Layer 4 |
| Weil differential | a `k`-linear map `ω : A_F → k` vanishing on `A_F(D) + F` for some `D`; `Ω_F` the `F`-vector space of them (`(f · ω) a := ω (f · a)`), one-dimensional over `F`. The **canonical divisor** `(ω)` of `ω ≠ 0` is the largest `D` with `ω` vanishing on `A_F(D) + F`; canonical class `W = [(ω)]`, well-defined | Layer 4 |
| differential formalism | **Weil differentials are the formalism of record** for the canonical class and the RR proof (they exist at the pin's vocabulary level with no new analysis); Mathlib's Kähler differentials `Ω[F⁄k]` (`KaehlerDifferential`) enter in Layer 9, where `dim_F Ω[F⁄k] = 1` (separably generated case) and the comparison isomorphism Kähler ≅ Weil via residues are **named milestones** — after which `(dx)` is a canonical divisor and the two formalisms are interchangeable. Neither is redefined in terms of the other before that layer | Layers 4, 9 |
| extensions of function fields | the full scalar tower, pinned: `[Field k] [Field k′] [Field F] [Field F′]`, `[Algebra k k′] [Algebra k F] [Algebra k′ F′] [Algebra F F′] [Algebra k F′]` with `[IsScalarTower k k′ F′]` and `[IsScalarTower k F F′]`, `F/k` and `F′/k′` function fields, `[FiniteDimensional F F′]`; the constant fields are **identified, not assumed**: `k′` maps onto `algebraicClosure k′ F′`-exactness by hypothesis (`IsIntegrallyClosedIn k′ F′` where a layer needs it) and the induced `k → k′` is the constant-field inclusion, with `algebraicClosure k F′ = k′`-shaped comparison milestones in Layer 6. `P′ ∣ P` ("lies over") iff `v_{P′}` restricted to `F` is equivalent to `v_P`; `e(P′∣P)` the ramification index (`v_{P′}(x) = e · v_P(x)` on `Fˣ`, in additive form), `f(P′∣P) := [F′_{P′} : F_P]` the relative residue degree. Reconciliation lemmas with `Ideal.ramificationIdx`/`Ideal.inertiaDeg` at affine models — one bridge each, consumers never forced through the `sSup`/`if` definitions. ⚠ churn flag: the pin's own docstrings announce replacement by `ramificationIdx'`/`inertiaDeg'`. Degree formulas mixing `[F′ : F]` and `[k′ : k]` are stated **cross-multiplied** (no natural-number division): see Layers 6–7 | Layer 6 |
| the different | the different **divisor** `Diff(F′/F) := ∑ d(P′∣P) · P′` with `d(P′∣P)` the different exponent, defined via the trace dual as in the pin's `differentIdeal` (`Mathlib/RingTheory/DedekindDomain/Different.lean`) and computed at all places by the two-charts device; the identity `v_{P′}(differentIdeal) = d(P′∣P)` at affine models is the reconciliation milestone | Layer 7 |

## What Mathlib already has (consume)

Verified against the Mathlib the repository currently builds. "master:" flags newer
material, to be consumed when the repository's Mathlib reaches it rather than rebuilt.

- **The chosen-generator function-field predicate**,
  `Mathlib/NumberTheory/FunctionField.lean`: `FunctionField Fq F` (an `abbrev` for
  `FiniteDimensional Fq⟮X⟯ F` given `[Algebra (RatFunc Fq) F]` — stated for an *arbitrary*
  field `Fq`, despite the file's finite-field framing), `functionField_iff`;
  `FunctionField.ringOfIntegers := integralClosure Fq[X] F` with `IsFractionRing`,
  `IsIntegrallyClosed`, and — under `[Algebra.IsSeparable Fq⟮X⟯ F]` —
  **`IsDedekindDomain (ringOfIntegers Fq F)`**; crucially
  `FunctionField.finiteDimensional_of_adjoin_transcendental` (*any* transcendental `y` has
  `F/Fq(y)` finite — the independence-of-the-variable engine) and
  `FunctionField.finiteDimensional_of_constantExtension` (finiteness of the constant
  field). ⚠ The infinity-place API moved on 2026-04-14: use `RatFunc.inftyValuation`,
  `RatFunc.inftyValued`, `RatFunc.CompletionAtInfty` in
  `Mathlib/FieldTheory/RatFunc/Valuation.lean`; the `FunctionField.inftyValuation*` and
  `FqtInfty` names are deprecated aliases.
- **The rational function field**, `Mathlib/FieldTheory/RatFunc/`: `RatFunc K` with
  `num`/`denom`, `intDegree` (`Degree.lean`), `RatFunc.inftyValuation` with
  `v_∞(f) = exp (intDegree f)` and the instances `Valuation.IsNontrivial` and
  `Valuation.IsTrivialOn` (`Valuation.lean`); `algebraicClosure k F`
  (`FieldTheory/AlgebraicClosure.lean`, the relative algebraic closure as an
  `IntermediateField`) with `IsIntegrallyClosedIn`
  (`RingTheory/IntegralClosure/IntegrallyClosed.lean`) — the constant-field/exactness
  vocabulary; `RatFunc.algEquivOfTranscendental`
  (`RatFunc K ≃ₐ[K] K(f)` for transcendental `f`), the `X`-adic
  `Polynomial.idealX : HeightOneSpectrum K[X]`;
  `RatFunc.finrank_eq_max_natDegree` (**the degree of a rational map**:
  `[K(X) : K(f)] = max (natDegree f.num) (natDegree f.denom)`), `RatFunc.adjoin_X = ⊤`,
  and Lüroth's theorem (`Luroth.lean`: every intermediate field of `K(X)/K` other than `K`
  is again rational) — prior art for the genus-0 layer.
- **Ostrowski for `RatFunc`**, `Mathlib/NumberTheory/RatFunc/Ostrowski.lean`
  (de Frutos-Fernández–Généreux, 2025):
  `RatFunc.valuation_isEquiv_infty_or_adic` — every `[IsRankOneDiscrete]`,
  `[IsTrivialOn K]` valuation on `RatFunc K` is equivalent to exactly one of `v_∞` or a
  `(p(X))`-adic valuation, over an **arbitrary** field `K`. This *is* the classification of
  places of the rational function field; Layer 1 repackages it in the normalized-place
  vocabulary rather than reproving it.
- **The Dedekind substrate** — the affine half of the divisor theory, ready-made:
  `IsDedekindDomain.HeightOneSpectrum` with `intValuation`/`valuation K : Valuation K ℤᵐ⁰`,
  `valuation_exists_uniformizer`, `valuation_surjective`,
  `eq_of_valuation_isEquiv_valuation` (places separate), `valuationSubringAtPrime`
  (`Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`); the factorization calculus
  (`Factorization.lean`): **`FractionalIdeal.count K v I : ℤ`** with `count_mul`,
  `count_inv`, `count_zpow`, `count_finsuppProd`, `FractionalIdeal.finite_factors`
  (cofinite vanishing), and `finprod_heightOneSpectrum_factorization'` — collectively
  `(FractionalIdeal R⁰ K)ˣ ≅ (HeightOneSpectrum R →₀ ℤ)` in all but name, which is why
  divisors are pinned as `Finsupp`; `ClassGroup R` with `ClassGroup.mk0`,
  `ClassGroup.equivPic` (`Mathlib/RingTheory/PicardGroup.lean` — the new module-theoretic
  `CommRing.Pic`); S-integers/S-units (`SInteger.lean`); `Ideal.dvd_iff_le`,
  `UniqueFactorizationMonoid (Ideal A)`; `IsIntegralClosure.isDedekindDomain` and
  `integralClosure.isFractionRing_of_finite_extension` (`IntegralClosure.lean`) — the
  engine for Layer 2's affine models. Also `HeightOneSpectrum.valuationOfNeZero :
  Kˣ →* Multiplicative ℤ` (`SelmerGroup.lean`), the closest existing `ord_v`.
- **Ramification bookkeeping**, `Mathlib/NumberTheory/RamificationInertia/`:
  `Ideal.ramificationIdx`, `Ideal.inertiaDeg`, and
  **`Ideal.sum_ramification_inertia`** (`∑_{P ∣ p} e·f = finrank K L`, with `[IsDedekindDomain R]`,
  fraction fields, `[Module.Finite R S]`, `p` maximal `≠ ⊥`) — Layer 6's fundamental
  identity at affine models; `Galois.lean` (transitivity of the action on `primesOver`,
  well-defined `ramificationIdxIn`/`inertiaDegIn`), `HilbertTheory.lean` (decomposition and
  inertia fields). ⚠ Both core definitions carry docstrings announcing replacement by
  `ramificationIdx'`/`inertiaDeg'` (`Mathlib/RingTheory/RamificationInertia/`) — state
  reconciliation lemmas once and keep consumers off the raw definitions.
- **The different ideal**, `Mathlib/RingTheory/DedekindDomain/Different.lean` (962 lines,
  substantial): `Submodule.traceDual`, `FractionalIdeal.dual`, `differentIdeal A B` with
  `coeIdeal_differentIdeal`, **transitivity in towers**
  (`differentIdeal_eq_differentIdeal_mul_differentIdeal`), the **conductor formula**
  `conductor_mul_differentIdeal` (`𝔠(x) · 𝔡 = (f′(x))` for a generator), the divisibility
  `pow_sub_one_dvd_differentIdeal` (`P^{e−1} ∣ 𝔡`), and
  `dvd_differentIdeal_iff ↔ ¬Algebra.IsUnramifiedAt` (separable case). ⚠ The **exact tame
  valuation `v_P(𝔡) = e − 1`** is absent (within the scope of the file's generic
  properties-of-the-different TODO) — building it is a Layer-7 milestone, not an import.
- **Kähler differentials**, `Mathlib/RingTheory/Kaehler/` and friends:
  `KaehlerDifferential` (`Ω[S⁄R]`) with the universal derivation, base change,
  localization instances, `polynomialEquiv` (`Ω[R[X]⁄R] ≃ R[X]`), the second fundamental
  sequence (`exact_kerCotangentToTensor_mapBaseChange`), and
  `Algebra.Presentation.differentialsRelations`
  (`Mathlib/Algebra/Module/Presentation/Differentials.lean`) — the tools that compute
  `Ω[k(x,y)/(f) ⁄ k]` for a plane curve. Separability is fully wired:
  `Algebra.FormallyUnramified` *is* `Subsingleton Ω[A⁄R]`,
  `FormallyUnramified.iff_isSeparable` under `EssFiniteType`,
  `FormallySmooth.of_algebraicIndependent_of_isSeparable` (separably generated ⟹ formally
  smooth), and `exists_isTranscendenceBasis_and_isSeparable_of_perfectField`
  (`Mathlib/FieldTheory/SeparablyGenerated.lean`). ⚠ `KaehlerDifferential` appears
  **nowhere** in `Mathlib/FieldTheory/`: there is no `rank Ω[L⁄K] = trdeg K L`, no
  separating-basis basis of `Ω`, in particular no `dim_F Ω[F⁄k] = 1` — that is Layer 9's
  load-bearing gap.
- **Transcendence**, `Mathlib/RingTheory/AlgebraicIndependent/`: `Algebra.trdeg`
  (cardinal-valued), `trdeg_add_eq` (the tower formula, Stacks 030H),
  `Polynomial.trdeg_of_isDomain = 1`, `exists_isTranscendenceBasis`,
  `Algebra.Transcendental`/`Transcendental R x`; `Algebra.EssFiniteType` and
  `IntermediateField.fg_top_iff`. ⚠ No bridge `trdeg k F = 1` +
  `Algebra.EssFiniteType k F` ⟹ function field — a short, real Layer-0 gap.
- **Completions at places**: `v.adicCompletion K`/`adicCompletionIntegers`
  (`AdicValuation.lean`), and the complete `X`-adic comparison
  `RatFunc → LaurentSeries` (`Mathlib/RingTheory/LaurentSeries.lean`:
  `LaurentSeriesRingEquiv`, `powerSeriesAlgEquiv`, `coe_range_dense`, `CompleteSpace K⸨X⸩`)
  — Layer 5's local-components prior art. ⚠ Only the `X`-adic place: `CompletionAtInfty`
  is a bare type with no `≃ K((1/X))`; `FiniteAdeleRing R K` exists as a topological ring
  with **no** `A(D)` filtration, no discreteness/cocompactness of `K`, no strong
  approximation.
- **Elliptic curves**, `Mathlib/AlgebraicGeometry/EllipticCurve/`: `WeierstrassCurve` with
  **`IsElliptic`** (⚠ the old `EllipticCurve` structure is gone, no alias),
  `Affine.CoordinateRing := AdjoinRoot W.polynomial` (with `IsDomain` but ⚠ **no
  `IsDedekindDomain` instance** — supplying it via the general affine-model layer is a
  milestone the merged [EllipticCurves](../EllipticCurves/README.md) roadmap also wants),
  `Affine.FunctionField := FractionRing CoordinateRing`,
  `Point.toClass : W.Point →+ Additive (ClassGroup W.CoordinateRing)` **injective only**
  (surjectivity is that roadmap's seeded `toClass_surjective`), division polynomials, normal
  forms, `j`, minimal models and reduction types over DVRs (`Reduction.lean`), and the
  formal `WeierstrassCurve.LFunction` — the concrete curve family every genus-1 milestone
  is checked against.
- **Plane-curve toolkit**: `Polynomial.Bivariate` (`R[X][Y]`, `evalEval`, `swap`,
  `equivMvPolynomial` with `pderiv` bridges), `MvPolynomial.IsHomogeneous` +
  `homogeneousComponent` + Euler's identity, `Polynomial.resultant` and `Polynomial.discr`
  (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`), `AdjoinRoot` API. ⚠ No
  homogenization operator, no Bézout, no intersection multiplicity.
- **Scheme side (for the dictionary layer only)**: `Scheme.functionField` (stalk at the
  generic point; no valuations attached), `Spec`, `Proj` **with properness over
  `Spec 𝒜₀`** (`ProjectiveSpectrum/Proper.lean`), the valuative criterion, morphism
  properties (`IsProper`, `IsSeparated`, `LocallyOfFiniteType`, smoothness with relative
  dimension), `Geometrically/{Reduced,Integral,…}`,
  `finite_appTop_of_universallyClosed` (`Γ(X,⊤)` finite over `k` for integral proper `X`
  — the `H⁰` end of finiteness and nothing more), `Scheme.Modules` an abelian category,
  `SheafOfModules.IsQuasicoherent`. ⚠ No divisors, no `Pic(X)`, no dimension theory, no
  coherent cohomology, no `ℙⁿ` as a named scheme.

### Existing formalizations of this material

Riemann–Roch is being formalized on several fronts, and this roadmap is written with
all of them in view. None is a reason to wait, and none is a dependency; the standing
relationships are in §[Coordination](#coordination).

- **[vaca22/riemann-roch-function-fields](https://github.com/vaca22/riemann-roch-function-fields)**
  (Guanghao Li; Apache-2.0): a complete, kernel-checked, **sorry-free function-field
  Riemann–Roch** — intrinsic places, divisors, adele spaces, Weil differentials,
  canonical divisors, genus, full RR, duality, Riemann's and Clifford's inequalities,
  and genus-one applications — the same mathematics as Layers 0–5 and parts of 10, by
  the same Stichtenoth-style route, with parts being upstreamed to Mathlib as open
  pull requests. The single largest overlap; the definite plan is in §Coordination.
- **Mathlib's scheme-side campaign** (R. D. Giles): conditional Riemann–Roch
  `χ(𝒪_X(D)) = deg D + χ(𝒪_X)` in draft, with the cycle/order-of-vanishing substrate
  already on Mathlib master. That campaign owns the scheme-side divisor namespace;
  Layer 12's dictionary milestones are stated against its vocabulary when the
  repository's Mathlib reaches it, and this roadmap's function-field divisors never
  fork a rival scheme-divisor notion.
- **The [JacobianChallenge](../JacobianChallenge/README.md) roadmap** (merged, in this
  repository): scheme divisors, coherent cohomology, `χ`-form RR, and Serre duality on
  the way to `Pic⁰` — the cohomological route this roadmap meets, by contract, in
  Layer 12E.
- **Adjacent, no mathematical overlap**: graph Riemann–Roch (Baker–Norine, sorry-free
  in Lean) is a naming precedent for `Divisor`/`deg`/`genus`-style identifiers — a
  reminder to namespace ours under the function-field theory; Mathlib's elliptic-curve
  group law deliberately routes around RR via `ClassGroup`, which is why Layer 10's
  compatibility milestones close the triangle without re-proving the group law; no
  Riemann–Roch for curves or function fields exists in Isabelle's AFP or in Coq/Rocq.

## What is missing (build here)

Everything curve-theoretic. The intrinsic function-field predicate and its equivalence
with `trdeg = 1` under `Algebra.EssFiniteType` (finite generation as a field
extension, not `Algebra.FiniteType`). Places as first-class objects with the place at infinity a
citizen equal to the `HeightOneSpectrum` places; degrees of places with their finiteness
(no Zariski-lemma-shaped `FiniteDimensional k (R ⧸ m)` exists at the pin — even `deg` needs
foundational work); the classification of places of `k(x)` in place vocabulary; weak
approximation. The divisor group as `Finsupp`, degree, principal divisors with the
finiteness of zeros and poles, the **product formula `deg (div f) = 0`** (absent for
function fields despite every ingredient existing), the class group and `Cl⁰`. `L(D)`,
its finite-dimensionality, `ℓ(D)`, Riemann's theorem, the genus, the index of specialty.
Repartitions `A_F`, the filtration `A_F(D)`, `i(D) = dim (A_F / (A_F(D) + F))`, Weil
differentials, `dim_F Ω_F = 1`, the canonical divisor, **Riemann–Roch**, `deg W = 2g − 2`,
`ℓ(W) = g`, strong approximation, Clifford, Weierstrass gaps, local components. The whole
extension theory in place vocabulary (`e`, `f`, the fundamental identity, Kummer's
factoring theorem) with its affine-model reconciliations; the different divisor, the exact
tame different value, the **Hurwitz genus formula**; constant-field extension theory with
the honest inseparability hypotheses; `dim_F Ω[F⁄k] = 1` and the Kähler ↔ Weil comparison
with residues and the residue theorem; the genus computations for the model classes
(rational, elliptic, hyperelliptic, smooth plane quartics and `(d−1)(d−2)/2`); finiteness
of automorphism groups (`g ≥ 2`) and the `84(g−1)` bound; and the curves ↔ function-fields
dictionary with the cross-roadmap comparison contracts. Substantial parts exist in the
external formalizations listed under Coordination. Build the targets here, shaped so that
corresponding material in Mathlib replaces ours by deletion plus an import.

---

## The build, in layers

The ordering below is the dependency order. As each layer makes the next layer's types
expressible in `TauCeti/`, its milestones are added to `Suggested.lean` with `sorry`.
Stichtenoth (2nd ed., GTM 254) is the primary source; section citations are given per
layer, theorem-level citations per milestone.

### Layer 0: function fields, constant fields, and places

Stichtenoth I.1, I.3; Appendix A. (Ch. 1 of Stichtenoth carries **no** hypotheses on `k`
beyond `Field`; the full-constant-field assumption enters only at §1.4 — mirror that.)

- **The predicate.** `IsFunctionField k F` as pinned (intrinsic; Stichtenoth Def. 1.1.1 —
  explicit proposition argument, never a typeclass; note his definition does *not* require
  `k` exact). Milestones: any transcendental
  `y : F` works as a variable (Rem. 1.1.2; consume
  `FunctionField.finiteDimensional_of_adjoin_transcendental`); comparison with Mathlib's
  chosen-generator `FunctionField`; `IsFunctionField` ⟺ `Algebra.trdeg k F = 1` +
  **`Algebra.EssFiniteType k F`**, equivalently
  `(⊤ : IntermediateField k F).FG` via `IntermediateField.fg_top_iff` (the missing
  trdeg bridge — `Algebra.FiniteType k F` is deliberately not used, since for a field
  carrier it would force an algebraic extension by Zariski's lemma); stability under
  finite extension and under passing to the constant field `k̃`.
- **The constant field.** `k̃ := algebraicClosure k F` — the pin's relative algebraic
  closure of `k` in `F` (an `IntermediateField k F`, Stacks 09GI), consumed, not rebuilt;
  it is finite over `k` (Cor. 1.1.16; consume
  `finiteDimensional_of_constantExtension`); `IsIntegrallyClosedIn k F` as pinned, with
  the `∀`-algebraic and `algebraicClosure k F = ⊥` equivalences as milestones;
  `F/k̃` is a function field with exact constants — the normalization device every later
  layer cites.
- **Places.** The `Place k F` structure as pinned (normalized valuation, trivial on `k`);
  the valuation subring `𝒪_P` (Stichtenoth's Def. 1.1.4: `k ⊊ 𝒪 ⊊ F` with
  `z ∈ 𝒪 ∨ z⁻¹ ∈ 𝒪`) with its `IsLocalRing`/`ValuationRing` instances, maximal ideal,
  uniformizers ("prime elements"); **`𝒪_P` is a DVR** (Thm. 1.1.6: `P` principal,
  `z = tⁿu` uniquely; in Lean: `IsDiscreteValuationRing` — for a surjective
  `ℤᵐ⁰`-valuation this is direct; consume the pin's `Valuation.IsRankOneDiscrete` API and
  `valuationSubring_isDiscreteValuationRing`); `ord_P` with the mult/additive translation
  lemma (his `v_P`, Def. 1.1.12, with the strict triangle inequality Lemma 1.1.11); the
  three-way correspondence place ↔ normalized discrete valuation (his Def. 1.1.9, axioms
  incl. triviality on `k`) ↔ valuation ring (Thm. 1.1.13, including (d): valuation rings
  are maximal proper subrings of `F`).
- **Degrees.** The residue field `F_P` (Def. 1.1.14) as pinned; **`Module.Finite k F_P`**
  with `1 ≤ deg P ≤ [F : k(x)]` for any `x` with `ord_P x ≠ 0` (Prop. 1.1.15; this is
  where the Zariski-lemma-shaped gap in the pin is filled). Rational places
  (`deg P = 1`; Rem. 1.1.17: over algebraically closed `k` all places are rational) and
  the evaluation map `f ↦ f(P) ∈ F_P` for `f ∈ 𝒪_P` (Def. 1.1.14's residue map).
- **Existence and separation.** Every subring `k ⊆ R ⊆ F` with a proper nonzero ideal
  `I` admits a place with `R ⊆ 𝒪_P`, `I ⊆ P` (Thm. 1.1.19, by Zorn); hence every
  `x ∈ F ∖ k̃` has a zero and a pole and `ℙ_F ≠ ∅` (Cor. 1.1.20); `k̃ = ⋂_P 𝒪_P`
  (constants are the everywhere-regular functions); distinct places give inequivalent
  valuations (consume the shape of `eq_of_valuation_isEquiv_valuation`).
- **Weak approximation** (Thm. 1.3.1 — the *equality* form): for pairwise distinct
  places `P₁ … Pₙ`, targets `f₁ … fₙ ∈ F` and prescribed `r₁ … rₙ ∈ ℤ`, there is
  `f ∈ F` with `ord_{Pᵢ}(f − fᵢ) = rᵢ` for all `i`. Corollaries: finitely many places
  are independent; **every function field has infinitely many places** (Cor. 1.3.2);
  `∑ᵢ ord_{Pᵢ}(x) · deg Pᵢ ≤ [F : k(x)]` over zeros of `x` (Prop. 1.3.3), whence the
  finiteness of zeros and poles (Cor. 1.3.4) consumed by Layer 3.

### Layer 1: the rational function field

Stichtenoth I.2. The base case of everything, and the first acceptance suite.

- **The places of `k(x)`.** In the normalized-place vocabulary: for each monic irreducible
  `p ∈ k[X]` the place `P_p` (via `(Polynomial.idealX)`-style `HeightOneSpectrum k[X]`
  valuations) with `deg P_p = natDegree p` and residue field `k[X]/(p)` (Prop. 1.2.1(a));
  the place at infinity `P_∞` (repackage `RatFunc.inftyValuation`;
  `v_∞ f = exp (intDegree f)`, `ord_∞ f = −intDegree f`, prime element `1/x`) with
  `deg P_∞ = 1` (Prop. 1.2.1(c)); `k` is the exact constant field of `k(x)`
  (Prop. 1.2.1(d)); **these are all the places and they are distinct** (Thm. 1.2.2) —
  repackage the pin's Ostrowski `RatFunc.valuation_isEquiv_infty_or_adic` (its `Xor`
  under `IsRankOneDiscrete` + `IsTrivialOn` becomes a bijection
  `Place k (RatFunc k) ≃ {monic irreducibles} ⊕ {∞}`), do not reprove it; the degree-one
  places are `ℙ¹(k) = k ∪ {∞}` (Cor. 1.2.3).
- **Order functions on `k(x)`, concretely**: `ord_∞ f = −intDegree f` and
  `ord_{P_p} f` = the multiplicity of `p` in `f` — computation lemmas connecting the
  place vocabulary to `RatFunc.num`/`denom` arithmetic, consumed by every later
  `k(x)`-calculation. Lüroth (in Mathlib) cited as the classification of the subfields
  of `k(x)`. The divisor-level identities on `ℙ¹` (`div x`, the pole-divisor degree, the
  concrete product formula, `ℓ(n·P_∞) = n + 1`, genus `0`) are Layer 3's
  rational-function-field subsection: they need Layer 3's types, so they live there.

### Layer 2: affine models — the Dedekind bridge

Stichtenoth III.2 (subrings and integral closures), placed early because it is the
Mathlib-consumption layer: the affine half of the theory falls out of
`DedekindDomain/Factorization.lean` nearly mechanically.

- **Finite normalization, including inseparable extensions.** For `x ∈ F`
  transcendental over `k`, let `R_x` be the integral closure of `k[x]` in `F`.
  Before declaring it Dedekind, prove the missing normalization theorem in dependency
  order: `k[X]` is Japanese/Nagata (or prove exactly its one-dimensional special case);
  the normalization of `k[X]` in **every** finite extension of `k(X)` is a finite
  `k[X]`-module, with no separability hypothesis; it is Noetherian and integrally
  closed, has Krull dimension one, and has fraction field canonically equivalent to
  `F`; hence it is Dedekind. The existing
  `IsIntegralClosure.isDedekindDomain` and
  `integralClosure.isFractionRing_of_finite_extension` discharge the separable branch;
  the finite-normalization milestone supplies the purely inseparable branch rather
  than treating “Krull–Akizuki-grade” as a proof.
- **Places ↔ height-one primes, as a proved chain.** For a place `P`, first prove
  `ord_P(x) ≥ 0 ↔ k[x] ⊆ 𝒪_P`; integrality then gives `R_x ⊆ 𝒪_P`. Contract the maximal
  ideal of `𝒪_P` to a nonzero height-one prime `𝔭_P` of `R_x`, prove the local-ring
  equivalence **`(R_x)_{𝔭_P} ≃+* 𝒪_P`**, and prove that its normalized adic valuation is
  exactly `P.valuation` (not merely equivalent). Conversely, for
  `𝔭 : HeightOneSpectrum R_x`, extend the local DVR valuation to `F`, normalize it,
  and prove that contraction recovers `𝔭` and that both constructions are inverse.
  Package the resulting bijection
  `{P : Place k F | ord_P x ≥ 0} ≃ HeightOneSpectrum R_x` together with the induced
  residue-field equivalence, equality of residue degrees, and the
  `ord_P`/`intValuation` coefficient formula.
- **Two-chart compatibility.** Repeat the construction for `x⁻¹`, identify the common
  localization on the overlap, and prove that the two normalized valuations agree
  there. The places with `ord_P x < 0` are precisely the finite-chart primes for
  `x⁻¹`, equivalently the places over `P_∞`; their finiteness follows from finite
  normalization. Thus the place set is the compatible two-chart union used by the
  divisor, ramification, different, and scheme layers—not an asserted bijection.
  S-domains `𝒪_S` (holomorphy rings, Stichtenoth III.2) are then obtained through the
  pin's `Set.integer` S-integers. The divisor-level fractional-ideal and class-group
  bridge remains in Layer 3, after its types exist.

### Layer 3: divisors, `L(D)`, Riemann's theorem, and the genus

Stichtenoth I.4. From here on the standing hypothesis `IsIntegrallyClosedIn k F` is in
force (Stichtenoth's global assumption, declared at the head of §1.4).

- **Divisors.** `Divisor k F` as pinned (Def. 1.4.1); degree hom; support, partial
  order, `⊔/⊓`, positive/negative parts. **Finiteness of zeros and poles** of `f ∈ Fˣ`
  (Cor. 1.3.4, via Prop. 1.3.3's bound `∑ ord · deg ≤ [F : k(f)]`); the principal
  divisor hom `div : Fˣ → Divisor k F`, zero/pole divisors `(f)₀, (f)_∞`
  (Def. 1.4.2); `div f = 0 ↔ f ∈ kˣ` (exactness of constants entering here).
- **The product formula.** `deg (div f) = 0`, via
  **`deg (f)₀ = deg (f)_∞ = [F : k(f)]`** for nonconstant `f` (Thm. 1.4.11) — the
  theorem that makes the degree map descend to the class group. Corollaries: `Cl(F)`
  (Def. 1.4.3), `Cl⁰(F)`, the degree exact sequence `0 → Cl⁰ → Cl → deg-image → 0`;
  linear equivalence preserves `deg` and `ℓ` (Cor. 1.4.12(a)); a degree-0 divisor is
  principal iff `ℓ ≥ 1` iff `ℓ = 1` (Cor. 1.4.12(c)).
- **Riemann–Roch spaces.** `L(D)` as pinned (Def. 1.4.4, Rem. 1.4.5); `L(A) ≅ L(A′)`
  for `A ∼ A′` (Lemma 1.4.6); `L(0) = k` and `L(D) = 0` for `deg D < 0`
  (Lemma 1.4.7, Cor. 1.4.12(b)); monotonicity `D ≤ D′ ⟹ L(D) ≤ L(D′)` with
  `dim (L(D′)/L(D)) ≤ deg D′ − deg D` (Lemma 1.4.8, the one-place-at-a-time estimate);
  **finite-dimensionality** with `ℓ(D) ≤ deg D₊ + 1` (Prop. 1.4.9, Def. 1.4.10).
- **Riemann's theorem and the genus**: the quantity `deg D − ℓ(D)` is bounded above
  (Prop. 1.4.14); **the genus** `genus k F` as pinned (Def. 1.4.15:
  `g = max {deg A − ℓ(A) + 1}`; `sSup`, junk-guarded by 1.4.14), `g ≥ 0` (Cor. 1.4.16);
  **Riemann's theorem** (Thm. 1.4.17): `ℓ(D) ≥ deg D + 1 − g` for all `D`, with
  equality for `deg D ≥ c` (`∃ c` form); the **index of specialty**
  `i(D) := ℓ(D) − deg D − 1 + g ≥ 0` (Def. 1.5.1), `i(D) = 0` for large degrees.
- **The rational function field, at divisor level** (`k(x)`-specific calculations on the
  Layer-1 places, the base case and first acceptance suite): `div x = P_{(X)} − P_∞`; the
  pole divisor of nonconstant `f` has degree
  `max (natDegree f.num) (natDegree f.denom) = [k(x) : k(f)]` (consume
  `RatFunc.finrank_eq_max_natDegree`); `∑_p natDegree p · ord_p(f) = intDegree f` (the
  product formula on `ℙ¹`, concretely); **`L(n·P_∞)` is the polynomials of degree `≤ n`**
  — the model computation `ℓ(n·P_∞) = n + 1` (`n ≥ 0`), proved by hand, long before
  Riemann–Roch; hence **`g(k(x)) = 0`** (Ex. 1.4.18) and Riemann's inequality is sharp at
  every `n`.
- **The affine bridge, at divisor level** (the Layer-2 models meeting Layer-3 types): the
  group isomorphism `{D : Divisor k F | supp D ⊆ finite chart} ≅ (FractionalIdeal R_x⁰ F)ˣ`
  via `FractionalIdeal.count` (consume `count_mul/inv/zpow`, `finite_factors`,
  `finprod_heightOneSpectrum_factorization'` — zero new proof work is the design goal;
  the same dictionary, on the abstract Dedekind side, is the subject of the open Mathlib
  PR [#41729](https://github.com/leanprover-community/mathlib4/pull/41729) — shape this
  milestone the way that PR shapes it, and consume it if it lands). **Class-group
  bridge**: the restriction-to-finite-chart map induces a surjection
  `π : Cl(F) →+ ClassGroup R_x`, and its kernel is **the subgroup of `Cl(F)` generated by
  the classes `[P]` of the finitely many places `P` over `∞`** (not a free group on them:
  any function whose divisor is supported over `∞` imposes a relation), so
  `⟨[P] : P ∣ ∞⟩ → Cl(F) → ClassGroup R_x → 0` is exact. Specialization: for a model
  with a single degree-1 place at infinity, the restriction of `π` to degree zero is an
  isomorphism `Cl⁰(F) ≅ ClassGroup R_x` — the statement that makes Mathlib's
  elliptic-curve group law an instance of the general theory (Layer 10).

### Layer 4: repartitions, Weil differentials, and Riemann–Roch

Stichtenoth I.5 — the summit of the first half.

- **Repartitions.** `A_F` as pinned (Def. 1.5.2 — Stichtenoth says *adeles* and notes
  "some authors use the name repartition"; entries in `F`, cofinite integrality —
  `Filter.cofinite` vocabulary, **no completions**); the diagonal `F ↪ A_F`; the
  filtration `A_F(D)` (Def. 1.5.3), in the **multiplicative junk-free form of the
  convention table** (`v_P (a P) ≤ exp (D P)` at every place — prototyped in
  `Suggested.lean` so the additive-junk mistake cannot reappear). Its basic calculus as
  named milestones: `0 ∈ A_F(D)` (and `A_F(D)` is a `k`-submodule of `A_F`);
  monotonicity `D ≤ E ⟹ A_F(D) ≤ A_F(E)`; `A_F(D) + F` is a `k`-submodule; and
  `A_F = ⋃_D A_F(D)`.
- **The local-to-global quotient engine.** This is an explicit dependency chain, not
  folded into “Lemma 1.5.4”: for each place `P` and integers `a ≤ b`, use a uniformizer
  filtration of the DVR to prove
  `dim_k (𝔪_P^a / 𝔪_P^b) = (b-a) * deg P` (with fractional powers interpreted inside
  `F`); for `D ≤ E`, identify `A_F(E)/A_F(D)` with the finite direct sum over
  `supp(E-D)` of these local quotients. This proves finite-dimensionality and
  `dim_k (A_F(E)/A_F(D)) = deg E − deg D`. Next prove the diagonal-intersection lemma
  **`F ∩ A_F(D) = L(D)`**, then construct the exact sequence relating
  `L(E)/L(D)`, `A_F(E)/A_F(D)`, and the cokernels of
  `A_F(D)+F → A_F` and `A_F(E)+F → A_F`. Prove those cokernels finite-dimensional,
  identify their dimension difference, and only then derive the quotient interpretation
  **`i(D) = dim_k (A_F ⧸ (A_F(D) + F))`** (Thm. 1.5.4) and
  `g = dim_k (A_F ⧸ (A_F(0) + F))` (Cor. 1.5.5). This chain is the linear-algebra
  engine later used for one-dimensionality of Weil differentials.
- **Weil differentials.** `Ω_F` as pinned (Def. 1.5.6); `dim_k Ω_F(A) = i(A)`
  (Lemma 1.5.7, so `Ω_F ≠ 0`); the `F`-action (Def. 1.5.8); **`dim_F Ω_F = 1`**
  (Prop. 1.5.9); the divisor `(ω)` of `ω ≠ 0` (existence of the maximum: Lemma 1.5.10,
  Def. 1.5.11 — also `v_P(ω)`, regular/holomorphic differentials, `dim Ω_F(0) = g` per
  Rem. 1.5.12); `(f·ω) = div f + (ω)` and any two canonical divisors are equivalent
  (Prop. 1.5.13) — the **canonical class** `W ∈ Cl(F)`.
- **Duality.** The isomorphism `L(W − D) ≅ Ω_F(D)`, `x ↦ xω`, as `k`-spaces —
  **`i(D) = ℓ(W − D)`** (Thm. 1.5.14, the Duality Theorem).
- **The Riemann–Roch theorem** (Thm. 1.5.15; hypotheses: none beyond `k` exact —
  arbitrary constant field, no perfectness, no separability):
  `ℓ(D) = deg D + 1 − g + ℓ(W − D)` for every divisor `D`. Immediate corollaries pinned
  as named milestones: **`ℓ(W) = g` and `deg W = 2g − 2`** (Cor. 1.5.16); the
  characterization of canonical divisors (`deg D = 2g − 2` and `ℓ(D) ≥ g` ⟹ `D`
  canonical, Prop. 1.6.2); and **uniqueness of the RR data** (Prop. 1.6.1: if
  `(g₀, W₀)` satisfies the RR identity for all `D` then `g₀ = g` and `W₀` is canonical
  — the milestone that makes the `Suggested.lean` existential form honest).

### Layer 5: consequences of Riemann–Roch, and local components

Stichtenoth I.6–I.7.

- **The `deg > 2g − 2` regime**: `deg D ≥ 2g − 1 ⟹ ℓ(D) = deg D + 1 − g`
  (Thm. 1.5.17; the bound is sharp — `W` fails it) — the workhorse identity. Named
  reusable corollary at genus 1: for a rational place `[0]` on a genus-1 function field,
  **`ℓ(n·[0]) = n` for all `n ≥ 1`** — the section-dimension ladder every
  Weierstrass-model argument runs on (Layer 10 restates it at Mathlib's elliptic
  curves). Non-special divisors and their calculus (Def. 1.6.10, Rem. 1.6.11); every
  `P` and `n ≥ 2g` admit `x` with `(x)_∞ = nP` (Prop. 1.6.6); existence of an effective
  non-special divisor of degree `g` supported on ≥ `g` given rational places
  (Prop. 1.6.12).
- **Genus 0**: `g = 0` **and a divisor of degree 1** ⟺ `F` rational (Prop. 1.6.3 — the
  hypothesis is a degree-1 *divisor*, not a rational place; RR then produces the place);
  ⚠ genus 0 alone does *not* force rationality — non-rational genus-0 fields exist
  (conics; Rem. 1.6.4, which also notes a degree-1 divisor always exists over
  algebraically closed or finite `k`) — record the non-theorem; Lüroth (in Mathlib)
  cited for the subfield picture.
- **Strong approximation** (Thm. 1.6.5): for a *proper* subset `S ⊊ ℙ_F`, places
  `P₁ … P_r ∈ S`, targets and orders as in weak approximation, there is `x` with
  `ord_{Pᵢ}(x − xᵢ) = nᵢ` for all `i` **and** `ord_P x ≥ 0` at every other place of
  `S` — free behaviour only outside `S`. The statement Goppa-style consumers (a future
  CurvesOverFiniteFields roadmap) want; proved from RR, which is why it is here and not
  in Layer 0.
- **Weierstrass gaps** (Thm. 1.6.8): at a **rational** place `P` of a function field of
  genus `g > 0`, exactly `g` numbers `i₁ < … < i_g` are pole gaps, with `i₁ = 1` and
  `i_g ≤ 2g − 1` — characteristic-free, the theorem of record. ⚠ Char-`p` honesty: the
  refined theory (all-but-finitely-many places share one gap sequence, Weierstrass
  points; Rem. 1.6.9) is stated in Stichtenoth **without proof** and only over
  algebraically closed `k`; here it is a Layer-11 development (the Wronskian/Hasse-
  derivative route). Generic classicality (`1, …, g`) is not a Layer-5 deliverable and is
  listed under scope exclusions below — non-classical curves exist in char `p`.
- **Clifford's theorem, infinite constants** (Thm. 1.6.13): for `k` **infinite** (an
  `[Infinite k]` hypothesis on the statement), `0 ≤ deg D ≤ 2g − 2` ⟹
  `2·ℓ(D) ≤ 2 + deg D`. The hypothesis is the proof's (Lemma 1.6.14 chooses a divisor
  point off finitely many hyperplanes, which needs `k` infinite), not the theorem's:
  **the route of record for arbitrary `k` is the constant-field-extension reduction**,
  which is Layer 8's Clifford-export milestone (Thm. 3.6.3(d) transports `ℓ` along
  `F·k″/F`, and the perfect-field hypothesis there is vacuous for finite `k`). Layer 5
  proves and uses only the `[Infinite k]` form; the unrestricted theorem is stated,
  proved, and exported in Layer 8, and any consumer of unrestricted Clifford depends
  on Layer 8, as the ordering section records.
- **Finite constant field: the class number, zeta-free** (the inputs a future
  CurvesOverFiniteFields roadmap consumes, proved here because they are pure
  Riemann–Roch; Stichtenoth 5.1, stopping strictly before zeta functions). For finite
  `k = 𝔽_q`, exact constants, in dependency order:
  1. **finitely many places of each bounded degree** (each place of degree `≤ r` sits
     over a place of `k(x)` of degree `≤ r` for any fixed `x`, and fibres are finite —
     Layers 0, 2; equivalently Lemma 5.1.1's counting input);
  2. **finitely many effective divisors of bounded degree** (a `Finsupp` count from 1);
  3. **a bounded-degree representative theorem**: fix any divisor `B` with `deg B ≥ 1`
     and `n` with `n·deg B ≥ g`; then every degree-zero class is `[A − n·B]` with `A`
     **effective** of degree `n·deg B` (Riemann's theorem gives
     `ℓ(D + n·B) ≥ deg D + n·deg B + 1 − g ≥ 1`, so the class of `D + n·B` contains an
     effective divisor);
  4. **`Finite Cl⁰(F)`** (Prop. 5.1.3), packaged as a `Finite`/`Fintype` instance-level
     milestone for the degree-zero class group — **the class number** `h_F := #Cl⁰(F)`;
  5. **the affine bridge**: under Layer 3's exact sequence, finiteness transfers to
     Mathlib's `ClassGroup R_x` for every affine model (each is a quotient of a
     `Cl⁰(F)`-extension by the image of the infinite places — state the exact hypotheses
     at `∞` used), recovering `ClassGroup (ringOfIntegers Fq F)` finiteness in the
     chosen-generator setting.
  Acceptance instance: `Cl⁰(𝔽_q(x)) = 0` (so `h = 1`), through the machinery, not by
  hand.
- **Local components** (§1.7): `ι_P` and `ω_P(x) := ω(ι_P x)` (Def. 1.7.1);
  `ω(α) = ∑_P ω_P(α_P)` with cofinite vanishing (Prop. 1.7.2) — whose specialization
  `∑_P ω_P(1) = 0` (his (1.45)) is the **abstract residue theorem, valid over arbitrary
  `k`** (the analytic-looking `∑ res = 0` of Layer 9 is its refinement);
  `v_P(ω)`-characterization via local components (Prop. 1.7.3, incl. `ω_P ≠ 0` always
  and "one local component determines `ω`"); the explicit generator `η` of
  `Ω_{k(x)}` with `(η) = −2P_∞` and its local components (Prop. 1.7.4 — the seed for
  Layer 9's `δ(x) = Cotr(η)`). **Completion comparison milestone**: for every place,
  construct the completion of the fraction field from the DVR filtration and prove the
  valuation, valuation ring, maximal ideal, residue field, and chosen-uniformizer
  compatibility. The pin's `adicCompletion`/`FiniteAdeleRing` of an affine model then
  receives `A_F` by the natural map with dense image in the `D`-filtration sense. This
  comparison is developed for complete discretely valued fields with **arbitrary**
  residue field; the Local Fields and Ramification roadmap may supply additional
  results only after imposing its `IsNonarchimedeanLocalField` hypothesis, hence a
  finite residue field. Nothing in the RR proof depends on completions.

### Layer 6: extensions of function fields

Stichtenoth III.1–III.3. `F′/k′` over `F/k`, `[F′ : F] < ∞`.

- **Setup.** Extensions of function fields as pinned in the convention table — the
  full scalar-tower diagram among `k`, `k′`, `F`, `F′` with its two `IsScalarTower`
  instances, never a bare "algebra plus compatibility" (Def. 3.1.1); the constant-field
  identification milestones (`k′` is the constant field of `F′`; the tower induces the
  inclusion `k → k′`); `P′ ∣ P` characterized three ways
  (Prop. 3.1.4: `P ⊆ P′` ⟺ `𝒪_P ⊆ 𝒪_{P′}` ⟺ `v_{P′}|_F = e · v_P`), defining
  `e(P′∣P)` and `f(P′∣P)` (Def. 3.1.5); `f < ∞` ⟺ `[F′ : F] < ∞` and multiplicativity
  in towers (Prop. 3.1.6); each place of `F′` lies over exactly one place of `F`, and
  each place of `F` has at least one and finitely many extensions (Prop. 3.1.7).
  ⚠ Stichtenoth's Ch. 3 carries a chapter-wide "`k` perfect" umbrella; per the audit of
  which proofs consume it, **3.1.11, 3.3.7, 3.4.3/3.4.6, 3.4.13, 3.5.10 and 3.8.7 do
  not** — statements here carry only their true hypotheses, and each milestone records
  whether perfectness is genuinely used.
- **The conorm/pullback.** `Con : Divisor k F →+ Divisor k′ F′`,
  `P ↦ ∑ e(P′∣P) · P′` (Def. 3.1.8, transitive in towers); `Con` of principal is
  principal (Prop. 3.1.9, inducing `Cl(F) → Cl(F′)`); the degree identity in
  **cross-multiplied form, `[k′ : k] * deg (Con D) = [F′ : F] * deg D`**
  (Cor. 3.1.14 — the `[k′ : k]` factor is mandatory and a classic error site ⚠; no
  natural-number division in the statement, so no divisibility is presupposed). The
  **geometric degree** — `[k′ : k] ∣ [F′ : F]`, defining `n(F′/F)` with
  `[F′ : F] = n(F′/F) * [k′ : k]` — is its own milestone **with the hypothesis that `F`
  and `k′` are linearly disjoint over `k`** (equivalently `[F k′ : F] = [k′ : k]`;
  automatic for separable `k′/k`, hence over perfect `k` — over imperfect `k` this is
  exactly what Layer 8's pathologies break, so it is never assumed silently); only
  after it is the quotient-valued form `deg (Con D) = n(F′/F) · deg D` available as
  API.
- **The fundamental identity** `∑_{P′ ∣ P} e(P′∣P) · f(P′∣P) = [F′ : F]`
  (Thm. 3.1.11 — no perfectness consumed): proved by the affine-model reconciliation —
  consume `Ideal.sum_ramification_inertia` over `R_x ⊆ R′_x`, with the bridge lemmas
  `e = Ideal.ramificationIdx`, `f = Ideal.inertiaDeg` at the matching primes (one lemma
  each, per the convention table), plus the places-over-`∞` chart swap. Corollaries:
  `#{P′ ∣ P}, e, f ≤ [F′ : F]` (Cor. 3.1.12); splits-completely and totally-ramified
  vocabulary (Def. 3.1.13); the Eisenstein-type total-ramification criterion
  (Prop. 3.1.15, bridging to the pin's `Polynomial/Eisenstein` API).
- **Integral closures and local integral bases** (III.2–III.3): holomorphy rings
  `𝒪_S = ⋂_{P∈S} 𝒪_P` with `integrally closed ⟺ holomorphy ring` (Def. 3.2.2,
  Thm. 3.2.6, Cor. 3.2.8 — Thm. 3.2.6 needs no exact-constants hypothesis, per
  Rem. 3.2.7; `S` finite ⟹ PID, Prop. 3.2.10); `𝒪′_P = ` integral closure of `𝒪_P` in
  `F′` with **local integral bases** for separable `F′/F` (Cor. 3.3.5, Thm. 3.3.6:
  almost every basis is one); **Kummer's theorem, with its hypotheses split as in the
  source**. Hypotheses of record: `F′ = F(y)` with `y` **integral over `𝒪_P`** and `φ`
  its minimal polynomial over `F` (integrality, not just algebraicity); factor the
  reduction `φ̄ = ∏ᵢ γᵢ^{εᵢ}` into distinct monic irreducibles over `F_P`. Conclusion
  A (Thm. 3.3.7, unconditional): for each `i` a place `Pᵢ′ ∣ P` with `f(Pᵢ′∣P) ≥ deg γᵢ`,
  pairwise distinct — the factorization **bounds** the splitting but does not determine
  it. Conclusion B (Cor. 3.3.8, under the **monogenicity hypothesis
  `𝒪′_P = 𝒪_P[y]`** — equivalently, `P` prime to the conductor of `𝒪_P[y]` in `𝒪′_P`,
  the "index" condition): the `Pᵢ′` are *all* the places over `P` and
  `e(Pᵢ′∣P) = εᵢ`, `f(Pᵢ′∣P) = deg γᵢ`. Factoring an arbitrary minimal polynomial mod
  `P` without the monogenicity hypothesis does **not** determine all `e` and `f`, and no
  milestone may cite Kummer without saying which conclusion it uses — the computational
  workhorse for all worked examples (consume `AdjoinRoot` + `quotientEquiv`-style API;
  reconcile with the pin's `conductor_mul_differentIdeal` conductor vocabulary in
  Layer 7).
- **Galois extensions, first pass** (III.7): the Galois action on `{P′ ∣ P}` is
  transitive (Thm. 3.7.1); `e`, `f`, `d` constant over `P` and `e·f·r = [F′ : F]`
  (Cor. 3.7.2); decomposition groups. (The finer inertia/ramification filtration
  appears in Layer 8, scoped; the *local* filtration theory — Herbrand, upper
  numbering, Hasse–Arf — belongs to the
  Local Fields and Ramification roadmap,
  bridged at completions.)

### Layer 7: the different and the Hurwitz genus formula

Stichtenoth III.4–III.5, in the book's order: the cotrace of Weil differentials proves
Hurwitz; the different theorem computes the exponents.

- **The different exponent and divisor.** The complementary module `C_P` (Def. 3.4.1,
  Prop. 3.4.2: principal, `= 𝒪′_P` almost everywhere) defines
  **`d(P′∣P) := −v_{P′}(t)` for `C_P = t·𝒪′_P`** and
  `Diff(F′/F) := ∑ d(P′∣P) · P′ ≥ 0` (Def. 3.4.3, Rem. 3.4.4). Lean route: consume the
  pin's `differentIdeal` machinery over `R_x`-models, with the reconciliation
  `v_{P′}(differentIdeal R R′) = d(P′∣P)` as the bridge milestone and the two-charts
  device covering the places over `∞`; finite support via
  `dvd_differentIdeal_iff`/`Algebra.IsUnramifiedAt` finiteness. Hypothesis of record for
  this layer: **`F′/F` separable** (the different is degenerate otherwise; the
  inseparable case is flagged to Layer 8).
- **Dedekind's different theorem** (Thm. 3.5.1): **(a)** `d(P′∣P) ≥ e(P′∣P) − 1`
  unconditionally; **(b)** equality ⟺ `char k ∤ e(P′∣P)` (tame) — ⚠ (b)'s proof
  consumes residue-separability (Stichtenoth via `k` perfect, Lemma 3.5.3); state (b)
  with that honest hypothesis. The pin supplies `P^{e−1} ∣ 𝔡` and the ramified ⟺
  divides criterion; the **exact tame value is built here** (it is the pin's own TODO)
  — by a complete local route. First prove that localization preserves the trace dual
  and different ideal. After completion, factor a finite tame extension with separable
  residue extension into an unramified extension and a totally ramified extension;
  prove the unramified different is trivial, prove `d=e-1` in the totally ramified
  part by the uniformizer minimal-polynomial/trace computation, and combine them using
  the tower formula. Prove separately that completion preserves the different exponent,
  so the completed calculation returns the original affine-model valuation. (A direct
  local proof may replace this chain only if it covers the residue-extension part, not
  merely the totally ramified case.) This supplies the missing half of the pin's
  `Different.lean` story. Also: ramified ⟺ `P′ ∈ supp Diff`, wild ⟺ `d ≥ e`
  (Cor. 3.5.5); tame/wild vocabulary (Def. 3.5.4).
- **The cotrace of Weil differentials** (III.4): `Cotr_{F′/F} : Ω_F → Ω_{F′}` through
  the trace on fibre-constant repartitions (Def. 3.4.5, Thm. 3.4.6 — existence,
  uniqueness, and **`(Cotr ω) = Con (ω) + Diff(F′/F)`**, the divisor identity from
  which Hurwitz falls out); `F`-semilinearity and tower transitivity (Prop. 3.4.11),
  transitivity of the different `d(P″∣P) = e(P″∣P′)·d(P′∣P) + d(P″∣P′)`
  (Cor. 3.4.12 — reconcile with the pin's
  `differentIdeal_eq_differentIdeal_mul_differentIdeal`).
- **The Hurwitz genus formula** (Thm. 3.4.13 — no perfectness consumed):
  for `F′/F` finite **separable** with constant fields `k′/k`, in the
  **cross-multiplied form of record** (no division):
  `[k′ : k] * (2g′ − 2) = [F′ : F] * (2g − 2) + [k′ : k] * deg Diff(F′/F)`;
  the quotient-valued restatement through the geometric degree `n(F′/F)` is available
  exactly where Layer 6's integrality milestone applies (same-constant-field case
  included: there `[k′ : k] = 1` and the formula is the familiar
  `2g′ − 2 = n(2g − 2) + deg Diff`);
  the `F/k(x)` normalization `2g − 2 = −2[F : k(x)] + deg Diff(F/k(x))` (Cor. 3.4.14,
  via Cotr of Layer 5's `η`). Tame corollary: the inequality form
  `2g′ − 2 ≥ n(2g − 2) + ∑ (e − 1) deg P′` (same-constant-field form, `n = [F′ : F]`)
  **with equality ⟺ `F′/F` tame**
  (Cor. 3.5.6); ⚠ wild honesty: the Artin–Schreier worked
  example below is the mandatory acceptance test that no tameness assumption has crept
  in. Corollaries: `g′ ≥ g` for same-constant-field separable extensions (Cor. 3.5.7);
  every separable `F/k(x)` of degree > 1 with exact constants ramifies (Cor. 3.5.8);
  **the function-field Riemann–Hurwitz for `y² = f(x)`** (the degree-2 worked example,
  char `≠ 2`, via the Kummer-cover data `e = n/r_P`, `d = n/r_P − 1` of Prop. 3.7.3).

### Layer 8: constant-field extensions, Galois ramification, and inseparability ⚠

Stichtenoth III.6–III.11. The trap layer: everything here is about hypotheses.
Stichtenoth's §3.6 opens by declaring perfectness *"essential for the validity of most
results in this section"*, citing counterexamples to Deuring's LNM 314 **without stating
one** — this layer states them.

- **Constant-field extensions.** `F″ := F·k″` for algebraic `k″/k` (inside a fixed
  closure): `k″` is exactly the constant field of `F″` (Prop. 3.6.1(a), `k` perfect);
  linear independence over `k` persists over `k″` (3.6.1(b));
  `[F : k(x)] = [F″ : k″(x)]` (3.6.1(c)); degree bookkeeping for general algebraic
  extensions `deg Con_{F′/F}(A) = [F′ : F k′] · deg A` (Cor. 3.6.4);
  `[F′ : F] = [F′k̄ : Fk̄]·[k′ : k]` and the absolute-irreducibility criterion for
  exactness of constants (Prop. 3.6.6, Cor. 3.6.8 — the practical test for every worked
  example's `hgen` hypothesis).
- **Genus invariance, with its true hypotheses** (Thm. 3.6.3, `k` **perfect** —
  essential): constant extension is unramified (a); **the genus is unchanged** (b);
  degrees are preserved (c); **`ℓ(Con A) = ℓ(A)` with any `k`-basis of `L(A)` staying a
  basis** (d); canonical stays
  canonical (e); `Con` is injective on classes (f); residue fields compose as
  `F″_{P″} = F_P · k″` (g). Route to the honest general statement: `F/k`
  **conserved/separably generated** is the intermediate predicate — pin it, relate it to
  the pin's `SeparablyGenerated.lean` existentials, and derive the perfect-`k` case.
  **Clifford, unrestricted — the Layer 8 export**: for finite `k` (perfect, so
  Thm. 3.6.3 applies), pass to `F·k̄/k̄` with `k̄` an algebraic closure — (b) and (d)
  transport `g`, `deg`, and every `ℓ` — and apply Layer 5's `[Infinite k]` Clifford
  there; then restate **Clifford for arbitrary exact constant fields** (finite and
  infinite unified) as the exported theorem consumers cite. This is the second half of
  the split whose first half is Layer 5's `[Infinite k]` milestone.
- **⚠ The inseparable pathology, stated as a theorem-with-counterexample**: over
  imperfect `k`, an inseparable constant extension can **strictly decrease** the genus —
  the worked example below (`y² = x^p − t` over `𝔽_p(t)`) is stated and proved here
  (Stichtenoth's own text points to Deuring and gives none, so this milestone is
  genuinely additive), together with the general "genus never increases under constant
  extension" theorem and the III.11 drop estimates. These are required proved theorems of
  Layer 8, not declaration-only targets.
- **Galois II: decomposition, inertia, and the function-field ramification groups**
  (III.8, scoped): decomposition/inertia groups with
  **the general residue-field formula**: write `f = f_sep * f_ins`; then
  `|G_Z/G_T| = f_sep`, `|G_T| = e * f_ins`, and `G_Z/G_T` identifies with the
  automorphism group of the separable part of `F′_{P′}/F_P`. Under
  `Algebra.IsSeparable F_P F′_{P′}` (in particular for perfect residue fields), this
  specializes to `|G_Z| = e*f`, `|G_T| = e`, and
  `G_Z/G_T ≅ Gal(F′_{P′}/F_P)` (Def. 3.8.1, Thm. 3.8.2). The
  **`i`-th ramification groups**
  `G_i(P′∣P)` (Def. 3.8.4) with the basic structure `G₀/G₁` cyclic prime-to-`p`,
  `G_i/G_{i+1}` elementary abelian `p`, char-0 ⟹ `G₁ = 1` (Prop. 3.8.5); and
  **Hilbert's different formula `d(P′∣P) = ∑_{i≥0} (|G_i| − 1)`** (Thm. 3.8.7 — no
  perfectness consumed). ⚠ Scope wall, pinned: lower numbering only, at the
  function-field level; Herbrand functions, upper numbering, and Hasse–Arf are the
  Local Fields and Ramification roadmap's ramification-filtration layer. The completion
  bridge (`G_i` here = `G_i` of the local extension at `P′`) is proved at the general
  complete-DVR level; the sibling roadmap supplies upper numbering, Herbrand, and
  Hasse–Arf only when the completed residue field is finite, exactly the generality of
  its `IsNonarchimedeanLocalField` assumptions. Arbitrary-residue-field completions do
  not claim that supplier.
- **Composita** (III.9): **Abhyankar's lemma** (Thm. 3.9.1: `F′ = F₁F₂` with one of
  `Pᵢ∣P` tame ⟹ `e(P′∣P) = lcm(e₁, e₂)`); unramified-in-both ⟹ unramified in the
  compositum and in the Galois closure (Cor. 3.9.3); a rational place splitting
  completely in both splits completely in the compositum, with constants staying exact
  (Cor. 3.9.7) — the tower-builder's toolkit a future CurvesOverFiniteFields roadmap
  consumes.
- **Inseparable extensions and genus estimates** (III.10–III.11): a purely inseparable
  degree-`p` step has a unique place `P′` above each `P`; the residue extension is
  purely inseparable and **`e(P′∣P) * f(P′∣P) = p`**. The clean conclusion
  `e = p, f = 1` is stated only under `PerfectField F_P` (or an explicit triviality
  hypothesis on the residue extension). The counterexample
  `k = 𝔽_p(s)`, `F = k(t)`, `F′ = k(y)` with `t=y^p` at `P=(t-s)`—where `e=1` and
  `f=p`—is a required guard theorem. Over perfect `k`, **every function field is separably generated**,
  any `z` with `v_P(z) ≢ 0 (mod p)` is separating, and Frobenius gives `F^{pⁿ} ≅ F`
  with the same genus (Prop. 3.10.2 — Layer 9's entry ticket); genus bounds:
  `g ≤ 1 + n(g₁ − 1) + deg C` (Prop. 3.11.1), **Castelnuovo's inequality**
  `g ≤ n₁g₁ + n₂g₂ + (n₁−1)(n₂−1)` for `F = F₁F₂` (Thm. 3.11.3), **Riemann's
  inequality** `g ≤ ([F:k(x)] − 1)([F:k(y)] − 1)` (Cor. 3.11.4), and the plane-model
  bound `g ≤ ½(n−1)(n−2)` (Prop. 3.11.5) — required proved theorems, with the
  algebraically-closed reduction in their proofs made explicit.

### Layer 9: Kähler differentials, residues, and the comparison

Stichtenoth IV.1–IV.3. The layer that reconciles the formalism of record (Weil) with
Mathlib's formalism (`KaehlerDifferential`), so that this roadmap's consumers and the
merged [EllipticCurves](../EllipticCurves/README.md) roadmap's invariant differential
speak one language. **Dependencies, stated exactly:** the first subsection
(`dim Ω[F⁄k] = 1`) stands on Layers 0–3 alone; the comparison theorem's map is
`δ(x) := Cotr_{F/k(x)}(η)`, so the comparison and everything after it **depend on
Layer 7's cotrace** (and on Layer 5's `η` and local components) — this layer sits
after the Hurwitz/different lane, and the ordering section says so. (A cotrace-free
route — defining the Weil functional directly by local residues and proving agreement
with `Cotr` afterwards — is *not* this roadmap's route; the proof route of record is
Stichtenoth's.)

- **`Ω[F⁄k]` is one-dimensional.** For `F/k` a function field with a separating element
  `x` (equivalently `F/k` separably generated; over perfect `k` always, by
  Prop. 3.10.2): `dim_F Ω[F⁄k] = 1`, with basis `dx`; `dy = (dy/dx)·dx` and the formal
  derivative calculus (Stichtenoth's derivation module: Def. 4.1.1–Lemma 4.1.6; his
  differential module `Δ_F` with the universal property Prop. 4.1.8(d)). ⚠ Two
  formal-vocabulary traps, pinned: (i) Stichtenoth *defines* `dt := 0` for
  non-separating `t` inside his 1-dimensional `Δ_F` (Def. 4.1.7), whereas Mathlib's
  `Ω[F⁄k]` is the genuine Kähler module, which **jumps in dimension** for inseparably
  generated `F/k` — the identification `Δ_F ≅ Ω[F⁄k]` (via the shared universal
  property 4.1.8(d)) is a theorem **under separable generation**, and the inseparable
  degeneration is the honesty check; (ii) this is the pin's load-bearing gap
  (`KaehlerDifferential` never meets `FieldTheory/`). For separating `x`, consume
  `Algebra.FormallyEtale.of_isSeparable` for `F/k(x)` and
  **`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`** to obtain the full
  equivalence
  `F ⊗_{k(x)} Ω[k(x)⁄k] ≃ₗ[F] Ω[F⁄k]`; the polynomial/localization basis identifies
  its generator with `dx`, proving both injectivity and `dx ≠ 0`. The second
  fundamental sequence is supporting API, not a claim that surjectivity alone gives
  the equivalence. The finite-presentation hypotheses use the correct carrier
  `Algebra.EssFiniteType` wherever the pin's formally-unramified equivalences require it.
- **Local expansions and residues** (IV.2): starting from Layer 5's general complete-DVR
  construction, choose a uniformizer `t`. At a **rational** place, prove the completed
  valuation ring is topologically `k[[T]]` by a recursive coefficient-extraction and
  completeness argument, extend to an isomorphism of completed fraction fields with
  `k((T))`, and prove uniqueness of coefficients and change-of-uniformizer formulas.
  The pin's concrete `X`-adic Laurent-series equivalence is the base example, not the
  general theorem. At a nonrational place the same construction is over `F_P`; define
  the `F_P`-valued coefficient/residue and compose with `Algebra.trace k F_P` for the
  `k`-valued local component. Then set `res_{P,t}(z) := a₋₁` (Def. 4.2.8) and prove the
  **transformation formula `res_{P,s}(z) = res_{P,t}(z · ds/dt)`** (Prop. 4.2.9 —
  well-definedness of `res_P(ω)` on differentials, Def. 4.2.10; ⚠ a theorem in char
  `p`, not a triviality). These complete-DVR and coefficient milestones are owned here
  for arbitrary residue fields; they are not delegated to the finite-residue local-field
  roadmap.
- **The comparison theorem** (IV.3): the derivation `δ(x) := Cotr_{F/k(x)}(η)` into
  Weil differentials (Def. 4.3.1, with Layer 5's `η`); **`μ : Δ_F ≅ Ω_F` (differentials
  ≅ Weil differentials), `z dx ↦ z·δ(x)`** (Thm. 4.3.2, `k` perfect; part (d): local
  components are residues, `(z·δ(x))_P(u) = res_P(uz dx)` at rational `P`, with the
  general-degree form Rem. 4.3.7(d)); consequences: `(dx)` is a canonical divisor with
  the explicit formula **`(dx) = −2(x)_∞ + Diff(F/k(x))`** (Rem. 4.3.7(c), eq. (4.37)),
  `deg (dx) = 2g − 2`; the **residue theorem `∑_P res_P(ω) = 0`** (Cor. 4.3.3 — stated
  there over algebraically closed `k`; the arbitrary-`k` abstract form is Layer 5's
  `∑_P ω_P(1) = 0`, and the honest general-`k` residue statement goes through
  Rem. 4.3.7(d) — pin the exact hypothesis on the milestone).
- **EllipticCurves compatibility milestone**: for an elliptic `W` over `k`, the
  invariant differential of the merged [EllipticCurves](../EllipticCurves/README.md)
  roadmap lives in `Ω[W.FunctionField⁄k]`; under the comparison,
  its Weil-differential divisor is `0` — i.e. the canonical class of a genus-1 function
  field is trivial — reconciling its concrete `ω_W` with this roadmap's canonical
  class.

### Layer 10: model classes — elliptic, hyperelliptic, plane curves

Stichtenoth VI.1–VI.3; Fulton Chs. 5, 8 for the plane-curve computations.

- **Elliptic function fields** (VI.1): definition of record = Stichtenoth Def. 6.1.1 —
  **genus 1 together with a divisor of degree 1** (⚠ a *divisor*, not a rational place;
  RR then produces the rational place, Prop. 6.1.6(a)); normal forms: char ≠ 2 gives
  `y² = f(x)`, `f` squarefree cubic; in characteristic 2 the Mathlib-compatible split
  is exactly **`j ≠ 0`: `Y² + XY = X³ + a₂X² + a₆`**, and
  **`j = 0`: `Y² + a₃Y = X³ + a₄X + a₆`** (with the corresponding nonsingularity
  conditions). Prove the coordinate changes from the general Weierstrass equation and
  adapters to these two forms (Prop. 6.1.2, via the `ℓ(iP) = i` ladder); the converse with exactness of constants
  and `Diff(F/k(x)) = Q₁ + … + Q_r + Q_∞` (Prop. 6.1.3); **the degree-one places form
  an abelian group isomorphic to `Cl⁰(F)`** via `P ↦ [P − P₀]`, with
  `P ⊕ Q = R ⟺ P + Q ∼ R + P₀` (Prop. 6.1.6(b), 6.1.7 — the intrinsic group law).
  **Mathlib compatibility milestones** (the general theory meeting
  `Mathlib/AlgebraicGeometry/EllipticCurve/`; each is also a named interface of the
  merged [EllipticCurves](../EllipticCurves/README.md) roadmap, whose Layer 0 leaves
  the place implementation "to the upstream coordination"):
  (i) `genus k W.toAffine.FunctionField = 1` for `[W.IsElliptic]` (all
  characteristics);
  (ii) `W.toAffine.CoordinateRing` is the integral closure of `k[x]` in the function
  field — hence **`IsDedekindDomain` via Layer 2** (the instance the pin lacks and
  the EllipticCurves roadmap also wants);
  (iii) the point–place dictionary: `W.toAffine.Point ≃` degree-1 places (the
  EllipticCurves Layer-0 bridge, supplied here as Prop. 6.1.6's general form);
  (iv) `Cl⁰(W.FunctionField) ≅ ClassGroup W.CoordinateRing` (Layer 3's affine bridge
  specialized to the one-rational-place-at-infinity case) — which, with Mathlib's
  `Point.toClass` (injective) and the EllipticCurves roadmap's seeded
  `toClass_surjective`, closes the
  triangle `E(k) ≅ Cl⁰` **without this roadmap re-proving the group law**.
- **Hyperelliptic function fields** (VI.2). **Definition of record: `g ≥ 2` together
  with a rational subfield `k(x) ⊆ F` with `[F : k(x)] = 2` and `F/k(x)`
  separable** — separability is part of the definition, not a claimed consequence
  (over the roadmap's arbitrary `k`, an index-2 subfield in characteristic 2 can be
  inseparable, and no standing hypothesis rules it out; over **perfect** `k` the
  separability is automatic via Prop. 3.10.2, so there the definition agrees with
  Stichtenoth's index-2 Def. 6.2.1 — that equivalence is its own milestone, and the
  inseparable-index-2 case is deliberately outside the model class). `F/k(x)` cyclic
  of degree 2 (immediate from the definition); the intrinsic characterization
  `∃ A, deg A = 2 ∧ ℓ(A) ≥ 2` (with the separability hypothesis carried where char
  `k = 2`), and **every genus-2 function field over perfect `k` is hyperelliptic**
  (Lemma 6.2.2 — the canonical pencil gives the index-2 subfield; perfectness is what
  makes it separable, so the hypothesis is stated); char ≠ 2
  models `y² = f(x)`, `f` squarefree of degree `2g+1` or `2g+2`, with the **converse
  genus formula `g = (m−1)/2` (`m` odd) / `(m−2)/2` (`m` even)** and the list of
  ramified places (Prop. 6.2.3 — by Layer 7's RH with the Kummer-cover different;
  char-2 models via the Artin–Schreier calculus, flagged honest); **uniqueness of the
  degree-2 rational subfield** (`[F : k(z)] ≤ g ⟹ k(z) ⊆ k(x)`) and the
  regular-differentials description of it (Prop. 6.2.4). Boundary: models over `ℤ`,
  Igusa invariants, cluster pictures → a future HyperellipticCurves roadmap.
- **Smooth plane curves, by one function-field route** (Fulton Chs. 5, 8;
  Stichtenoth's Appendix B vocabulary): first build homogeneous coordinates, the three
  affine charts, smoothness via homogeneous partial derivatives, and the function field
  of an integral projective plane equation. After a finite separable constant extension
  if necessary, choose a projection center off the curve and its tangent/exceptional
  locus; prove that the resulting linear coordinate `x` is separating and that
  `F/k(x)` has degree `d`. Identify every place above infinity and its uniformizer,
  compute the local different exponents from the projected equation and its partial
  derivative, and sum them; prove that this computation and genus are unchanged by the
  chosen separable constant extension. Combining the result with Layer 9's
  `(dx) = −2(x)_∞ + Diff` gives the canonical divisor cut by forms of degree `d-3`
  and hence **`g = (d−1)(d−2)/2`**. This projection/different chain is the sole route
  of record; the roadmap does not appeal to an undeveloped projective adjunction or
  intersection theory. Fulton's adjoint calculation is a cross-check only. Nodal
  corrections and general singular plane curves remain out of scope.
- **Kummer and Artin–Schreier covers** (III.7 + VI.3–VI.4), **with the hypotheses on
  the statements, not implied**. **Kummer** `F′ = F(y)`, `yⁿ = u` (Prop. 3.7.3,
  Cor. 3.7.4; `y² = f` squarefree as Ex. 3.7.6) — hypotheses of record, all four
  required: (a) `n > 1`; (b) `char k ∤ n` (vacuous in char 0); (c) `k` contains a
  primitive `n`-th root of unity (this is what makes the extension **Galois with
  cyclic group `ℤ/n`** — without it `F(y)/F` need not even be normal); (d) the
  nondegeneracy `u ≠ wᵈ` for every `w ∈ F` and every divisor `d > 1` of `n` (this is
  what makes `Tⁿ − u` irreducible, so `[F′ : F] = n`; the practical sufficient form —
  some place has `gcd(v_P(u), n) = 1` — is its own lemma). Only after (a)–(d): the
  ramification data `e(P′∣P) = n / r_P`, `d(P′∣P) = n / r_P − 1` for
  `r_P = gcd(n, v_P(u)) > 0`, the exact constant field criterion, and the closed genus
  formula. **Artin–Schreier** `F′ = F(y)`, `y^p − y = u`, `char k = p > 0`
  (Prop. 3.7.8; elementary abelian generalization Prop. 3.7.10) — hypotheses of
  record: the nontriviality `u ∉ {w^p − w ∣ w ∈ F}` (otherwise `T^p − T − u` splits
  and the "extension" is trivial — this is the degree-`p`-cyclic hypothesis), and the
  **reduced local invariant `m_P` supplied with its actual hypothesis**: if `F_P` is
  perfect, prove there is a substitute `u − (w^p − w)` which is regular at `P`
  (`m_P := −1`) or has maximal valuation `−m_P < 0` with `p ∤ m_P`. For arbitrary
  residue fields, do **not** assert that representative exists: accept such a reduced
  representative as explicit input, or use the unreduced ramification filtration
  instead. The guard example in `𝔽_p(a)((t))`, `a ∉ 𝔽_p(a)^p`, shows that the
  `a t^{-p}` term cannot in general be cancelled. If `u` itself has a pole of order
  divisible by `p`, the prime-to-`p` formula never applies without this input. Under the
  perfect-residue or supplied-representative hypothesis:
  `d(P′∣P) = (p − 1)(m_P + 1)`, wildness at every ramified place,
  and the genus formula. These two families are the acceptance tests for the tame and
  wild halves of Layer 7, and the substrate the BelyiMaps roadmap and
  CurvesOverFiniteFields roadmaps would cite (Hermitian curves are VI.4/§7.4
  instances).

### Layer 11: automorphisms and the Hurwitz bound

⚠ Sourcing honesty first: **Stichtenoth contains no numbered theorem on automorphism
groups** — the `84(g−1)` bound is his Exercise 3.18 (algebraically closed `k`, tame
`gcd(|G|, char k) = 1`, with the `F/F^G` + `(2,3,7)` hint), finiteness of `Aut` for
`g ≥ 2` is a remark stated *without proof* (after Ex. 3.18 and again in the Ch. 6
exercises), and the counterexamples are Exercises 6.10/6.14 and 1.2. This layer is
therefore a genuine development, grounded in Layers 5–8, with Villa Salvador and
Hartshorne IV as the written sources of record.

- **The automorphism group.** `Aut(F/k)` = `k`-algebra automorphisms of `F`; the action
  on places (`v_{σP}(y) = v_P(σ⁻¹y)`, Lemma 3.5.2's shape), on divisors, on `L(D)`, and
  on `Ω_F`; the fixed field `F^G` of a finite `G ≤ Aut(F/k)` is a function field with
  `F/F^G` Galois of group `G` (Artin + Layer 6); non-finiteness at small genus, stated
  as theorems **with their field hypotheses** — the isomorphism
  `Aut(k(x)/k) ≅ PGL₂(k)` holds over every `k` (Stichtenoth Ex. 1.2), and witnesses
  non-finiteness exactly when **`k` is infinite**; for elliptic `F` the translations
  form a normal subgroup `≅ Cl⁰(F)` with finite quotient (Ex. 6.14), and `Cl⁰(F)` is
  infinite over **algebraically closed** `k` (the degree-one places are `E(k̄)`) but
  can be finite otherwise (over finite `k` it *is* finite, Layer 5) — so the `g ≥ 2`
  hypothesis below is visibly necessary over `k̄`, and no unqualified infinitude is
  claimed.
- **Rigidity.** An automorphism fixing `2g + 3` distinct rational places is the
  identity (Ex. 3.17's shape; via the totally-ramified criterion Ex. 3.16) — the
  finiteness engine.
- **Weierstrass points, made real.** Building on Layer 5's gap-sequence API, over algebraically
  closed `k`, char 0 first — all but finitely many rational places share the generic gap
  sequence `1, …, g`; the exceptions (Weierstrass points), counted by the vanishing of
  the Wronskian of a basis of `L(W)`, have total weight `g³ − g` for `g ≥ 2`, each
  point has weight `≤ g(g−1)/2`, so there are between `2g + 2` and `g³ − g` of them —
  **with the equality case pinned: exactly `2g + 2` Weierstrass points occur iff `F` is
  hyperelliptic** (every branch place then has the maximal weight `g(g−1)/2`), so a
  **non-hyperelliptic** `F` has **at least `2g + 3`** Weierstrass points. (The
  Wronskian route; Stichtenoth's Rem. 1.6.9 cites the counts without proof, so this is
  built here from Goldschmidt's treatment, not imported.)
- **Finiteness for `g ≥ 2`, by the exact route** — the headline theorem over
  algebraically closed characteristic-zero `k`, stated and proved as two cases, with
  every prerequisite named (finiteness of the *full* group is this milestone;
  the Hurwitz bound below is a separate statement about an already-finite subgroup):
  `Aut(F/k̄)` acts on the finite set `𝒲` of Weierstrass points (the gap sequence is
  `Aut`-invariant).
  *Non-hyperelliptic case*: `#𝒲 ≥ 2g + 3` (the equality-case count above), every place
  over `k̄` is rational, so the kernel of `Aut(F/k̄) → Sym 𝒲` fixes `≥ 2g + 3` rational
  places and is trivial by rigidity; hence `Aut ↪ Sym 𝒲` is finite.
  *Hyperelliptic case*: the hyperelliptic involution `ι` is central (uniqueness of the
  degree-2 rational subfield, Prop. 6.2.4), `Aut/⟨ι⟩` embeds into `Aut(k̄(x)/k̄) ≅ PGL₂(k̄)`
  preserving the `2g + 2 ≥ 6` branch points, an element of `PGL₂` fixing `≥ 3` points
  of `ℙ¹(k̄)` is the identity, so `Aut/⟨ι⟩ ↪ Sym(branch set)` and `Aut` is finite.
  Prerequisites consumed: rigidity (above), the Weierstrass-point counts with the
  hyperelliptic equality case (above, Goldschmidt), Prop. 6.2.4 (Layer 10), `PGL₂`
  three-point rigidity (Layer 1's `ℙ¹` API). General perfect-`k`
  positive-characteristic finiteness is not a Layer-11 deliverable and is listed under
  scope exclusions below.
- **The Hurwitz `84(g−1)` bound**: for `g ≥ 2` and `char k = 0` (or
  `gcd(|G|, char k) = 1`), a finite `G ≤ Aut(F/k̄)` has `|G| ≤ 84(g−1)` — by
  Riemann–Hurwitz on `F/F^G` and the `(2, 3, 7)` extremal analysis of branch data
  (Ex. 3.18's route, promoted to a theorem). The theorem and its optimal numerical
  constant do not require formalizing the full automorphism group of the Klein quartic;
  that projective `PSL₂(𝔽₇)` action and classification are explicitly outside this
  roadmap's acceptance suite.
- **⚠ char-`p` caveats, stated not hidden**: the bound **fails** wildly in
  characteristic `p`. Use only the subgroup needed for a counterexample: on the
  Hermitian field `y^q+y=x^{q+1}` over `𝔽_{q²}`, construct the explicit translation
  automorphisms
  `x ↦ x+a`, `y ↦ y+a^q x+b` with `b^q+b=a^{q+1}`; prove closure, preservation of the
  equation, faithfulness, and order `q³`. For sufficiently large `q`, this subgroup
  already has `q³ > 84(g−1)`, so the tame hypothesis is visibly load-bearing. No
  assertion about the full group `PGU₃(q)` or its exact order is a deliverable. The true
  positive-characteristic bounds and large-automorphism classification are outside
  this roadmap's deliverables.

### Layer 12: the dictionary — function fields ↔ curves, and the comparison contracts

Stichtenoth Appendix B; Liu Ch. 7; Hartshorne I.6. The definite later layer where this
roadmap meets the scheme world, split into sublayers 12A–12E; each lists its exact
prerequisites, its new definitions, and the theorem-level output the next sublayer
consumes. Everything is stated against the pin's `AlgebraicGeometry` vocabulary
(`Scheme`, `IsIntegral`, `IsProper`, `Scheme.functionField`). ⚠ **Regular, not smooth**
(the merged [EllipticCurves](../EllipticCurves/README.md) roadmap's convention, adopted
verbatim): over imperfect `k` the regular projective model need not be smooth; smooth =
regular + geometrically-reduced-fibre hypotheses stated exactly where used
(`Geometrically/` vocabulary at the pin).

There is one construction throughout this layer: **normalize `ℙ¹_k` in `F`**. “Glue
affine normalizations” describes its implementation on the standard two charts; `Proj`
properness and the valuative criterion are consequences or proof tools, not competing
definitions.

- **12A — dimension-one schemes, closed points, and orders of vanishing.**
  *Prerequisites*: Mathlib's `Scheme`, `IsIntegral`, `IsProper`, `IsLocallyNoetherian`,
  `Scheme.functionField`, `ringKrullDim_stalk_eq_coheight`, the DVR-characterization
  TFAE; Layer 0's `Place`. *New definitions*: "curve over `k`" := integral scheme,
  proper over `k`, of dimension 1 (dimension via `topologicalKrullDim`/stalk Krull
  dimension, with the "dim = trdeg of the function field" bridge a named milestone);
  `ord_x : k(X)ˣ → ℤ` at a regular closed point via the DVR stalk; the degree of a
  closed point. *Output consumed by 12B–12D*: for regular `X`,
  `k(X) := X.functionField` satisfies `Algebra.EssFiniteType k k(X)` and
  `Algebra.trdeg k k(X) = 1`, hence is a function field by Layer 0; closed points give
  places, matching residue fields and degrees. When the repository's Mathlib reaches
  `AlgebraicGeometry/OrderOfVanishing.lean` and `AlgebraicCycle/Basic.lean`, restate
  these milestones against that vocabulary, never against a rival one.
- **12B — normalize `ℙ¹_k` in `F`.**
  *Prerequisites*: Layer 2's finite-normalization theorem and compatible `R_x` and
  `R_{1/x}` charts; Mathlib's `Spec`, scheme gluing, finite morphisms, and projective
  morphisms. *Construction*: glue `Spec R_x` and `Spec R_{1/x}` along the common
  localization and prove the resulting `ν_F : X_F → ℙ¹_k` has the universal property
  of the normalization of `ℙ¹_k` in `F`. *Outputs, in dependency order*: the chart
  maps glue to a finite morphism; hence `X_F` is Noetherian, integral, dimension one,
  and proper because finite morphisms are proper and `ℙ¹_k` is proper. Its local rings
  are the Layer-2 normal one-dimensional local domains, hence DVRs, so `X_F` is
  regular. Prove `k(X_F) ≃ₐ[k] F` and identify closed points with places. Finally prove
  **projectivity**: a finite morphism is projective and projective morphisms compose,
  so `X_F → Spec k` is projective. This named step matches the target category; proper
  is not silently substituted for projective.
- **12C — morphisms and the anti-equivalence.**
  *Prerequisites*: 12A–12B and the universal property of normalization.
  *Categories*: on the field side, field extensions with
  `Algebra.EssFiniteType k F` and `Algebra.trdeg k F = 1` (equivalently Layer 0's
  `IsFunctionField k F`), with `k`-embeddings; on the geometric side, integral regular
  projective dimension-one `k`-schemes, with dominant `k`-morphisms. *Construction and
  outputs*: restriction at the generic point gives the contravariant function-field
  functor. An embedding `F ↪ F′` extends on the normalization charts by integrality,
  and the two maps agree on the generic overlap; separatedness gives uniqueness. Prove
  the extension finite and dominant, identity and composition laws, and thus the model
  functor. Prove full faithfulness by generic-point restriction and uniqueness; prove
  essential surjectivity by showing that every geometric-side object is canonically the
  normalization of `ℙ¹_k` in its function field (choose a nonconstant rational function
  and use the finite map it induces); then construct both natural isomorphisms. These
  milestones produce the single **anti-equivalence**, not just an object-level
  correspondence. Acceptance instance (the merged
  [EllipticCurves](../EllipticCurves/README.md) contract): specialized to
  `W.FunctionField`, the anti-equivalence induces its isogeny-to-scheme-morphism
  correspondence, and "the place at `O₁` restricting to the place at `O₂`" is the
  literature comparison its Layer 2 rests on.
- **12D — divisors and degrees, compared.**
  *Prerequisites*: 12A–12B; Layer 3's `Divisor k F` and `degree`. *New definitions*:
  Weil divisors on the regular model (free abelian group on closed points — stated
  against the Mathlib scheme-side vocabulary of the day, see 12A's flag). *Outputs*:
  under 12A/12B's point–place dictionary, **Weil divisors on `X_F` ≅ `Divisor k F`**,
  matching degrees, principal divisors, and linear equivalence — so `Pic`-style class
  groups agree with `Cl(F)`.
- **12E — cohomology compared: `H⁰ = L(D)`, the genus, and the canonical class.**
  *Prerequisites*: 12A–12D; the merged
  [JacobianChallenge](../JacobianChallenge/README.md) roadmap's Layers A–B (its sheaf
  `𝒪_X(D)`, coherent cohomology over `k`, `χ`-form Riemann–Roch, Serre duality).
  **Scope**: this supplier is used only when `F/k` is separably generated and `X_F` is
  smooth, proper, and geometrically connected over `k`; no JacobianChallenge theorem is
  claimed for an arbitrary regular model over an imperfect field. *New definitions*:
  none — this sublayer is exactly the **comparison contract**, stated
  as named milestones on this side so whichever route lands first, the other refactors
  onto it: (i) `H⁰(X, 𝒪_X(D)) ≅ L(D)` under 12D's identification; (ii) the
  cohomological genus `dim H¹(X, 𝒪_X)` equals this roadmap's `genus k F` —
  equivalently `h¹(𝒪(D)) = i(D) = ℓ(W − D)`, so **function-field RR + the dictionary ⟺
  the `χ`-form RR + Serre duality**; (iii) the dualizing sheaf `ω_{X/k}` corresponds to
  the canonical class `W` with `deg ω = 2g − 2` matching. The contract is *this list*;
  neither roadmap builds the other's side. Everything here is over the field `k`: the
  **relative** theory (proper-flat pushforwards, cohomology and base change,
  `π_*𝒪(n·[0])` locally free) is JacobianChallenge Layer-C territory and no milestone
  of this roadmap. Acceptance instance: for a genus-1 `F` with a rational place `[0]`,
  the comparison turns Layer 5's ladder `ℓ(n·[0]) = n` into
  `h⁰(X_F, 𝒪(n·[0])) = n` (`n ≥ 1`).
### Scope exclusions and future directions (not deliverables)

Nonspecial-divisor existence refinements and Brill–Noether-style statements; generic
classicality and positive-characteristic Weierstrass refinements; general perfect-field
positive-characteristic automorphism finiteness, the Stichtenoth/Henn bounds, and large-group
classification; general singular plane curves via intersection theory (Bézout is not at the
pin); the projective `PSL₂(𝔽₇)` action and full automorphism classification of the Klein
quartic, and the full `PGU₃(q)` classification for Hermitian curves; Castelnuovo-style
refinements beyond the Layer-8 inequalities; the analytic comparison
with compact Riemann surfaces over `ℂ` (which needs a GAGA-style development); and zeta functions
(the future CurvesOverFiniteFields roadmap consumes Layers 0–8). None of these is a milestone or
completion requirement of Layers 0–12.

## Worked examples (acceptance criteria)

Discharge alongside the layers; each catches a specific class of error (vacuous
definition, wrong degree convention, dropped hypothesis, sign flip, silent tameness).

- **`ℙ¹` places and degrees** (Layers 0–1): on `k(x)`: `deg P_∞ = 1`,
  `deg P_{p(X)} = natDegree p`; `ord_∞ x = −1`; `div x = P_{(X)} − P_∞` with
  `deg (div x) = 0`. Over `k = ℚ`, the place `P_{(X²+1)}` has degree 2 and residue field
  `ℚ(i)` — the degree-weighting smoke test.
- **`ℓ(n·P_∞) = n + 1` on `k(x)`** (Layers 1, 3): `L(n·P_∞)` = polynomials of degree
  `≤ n`; hence `genus k (RatFunc k) = 0` and Riemann's inequality is sharp at every `n`.
- **RR on `ℙ¹`** (Layer 4): `W = −2·P_∞` is canonical (`= (dx)`), `deg W = −2 = 2g − 2`,
  `ℓ(W) = 0 = g`; RR at `D = n·P_∞` reproduces `n + 1` two ways.
- **Exact-constants guard** (Layers 0, 3): for `F = ℂ(x)` over `k = ℝ`
  (`IsFunctionField ℝ (RatFunc ℂ)` holds), `ℓ(0) = 2 ≠ 1` — the example that keeps
  `IsIntegrallyClosedIn` an explicit hypothesis.
- **A genus-1 cubic = Mathlib's elliptic curve** (Layers 7, 10): for `[W.IsElliptic]`
  over `k`, `genus k W.toAffine.FunctionField = 1`; `ℓ(n·[O]) = n` for `n ≥ 1`
  (Layer 5's genus-one ladder at the curve of record);
  `Cl⁰ ≅ ClassGroup W.CoordinateRing`; and
  over `ℚ` with `y² = x³ − x`: the 2-torsion places, `Diff = ` the four branch places,
  Hurwitz checking `2·1 − 2 = 2·(0 − 2) + 4`.
- **Hyperelliptic genus 2** (Layers 7, 10): `y² = x⁵ − 1` over `k` with
  `char k ∉ {2, 5}` (the Kummer hypotheses hold: `n = 2 > 1`, `−1 ∈ k` is the primitive
  square root of unity, and squarefree `x⁵ − 1` is not a square in `k(x)`): genus 2; the
  different of `F/k(x)` has degree 6 (the places over
  the zeros of `x⁵ − 1` — total degree 5, regardless of how they split over `k` — plus
  the one over `∞`), Hurwitz: `2·2 − 2 = 2·(−2) + 6`. The general
  `g = ⌊(deg f − 1)/2⌋` for squarefree `f`, both parities.
- **Wild honesty: Artin–Schreier** (Layer 7): `y² − y = x³` over `𝔽₂` (or `y^p − y = x²`
  over `𝔽_p`, `p` odd) — in both, `u` has a single pole, at `∞`, of order prime to `p`,
  and every residue field is finite and perfect, so `u` is already reduced there
  (`m_∞ = 3`, resp. `2`) and `u ∉ {w^p − w}` because no
  substitute clears a prime-to-`p` pole: the nondegeneracy hypotheses hold. The unique
  place over `∞` is wildly ramified with `d > e − 1`; the genus
  from the conductor computation disagrees with the naive tame count — the acceptance
  test that no `p ∤ e` slipped into Riemann–Hurwitz.
- **Inseparable constant-extension drop** (Layer 8): the standard
  `k = 𝔽_p(t)`, `F = k(x, y)`, `y² = x^p − t` example (`p` odd): genus drops after
  adjoining `t^{1/p}` — stated as the counterexample theorem guarding Layer 8's
  hypotheses.
- **Weierstrass gaps at genus 2** (Layer 5): at a Weierstrass place of the `y² = x⁵ − 1`
  curve, the gap sequence is `{1, 3}`; at a non-Weierstrass rational place it is `{1, 2}`
  — over a field where such a place exists: take `k = ℚ(i)` and the place of the point
  `(0, i)` (`x = 0` is off the branch locus since `0⁵ − 1 ≠ 0`), or any `k` with a
  rational point off the branch locus.
- **Smooth plane quartic** (Layer 10): the projective closure of
  `x³y + y³ + x = 0` over an algebraically closed characteristic-zero field is smooth,
  and the single projection/different route gives genus
  `3 = (4−1)(4−2)/2`. Its full automorphism group is not an acceptance criterion.
- **Wild automorphism subgroup** (Layer 11): for Hermitian
  `y^q+y=x^{q+1}`, verify the explicit order-`q³` translation subgroup above and,
  for a concrete sufficiently large prime power `q`, the inequality
  `q³ > 84(g−1)`. No full automorphism-group classification is required.

## Ordering and parallelism

Layers 0–1 are first and sequential (places, then their classification on `k(x)`).
Layer 2 (affine models) needs Layer 0 only and can run in parallel with Layer 1; every
divisor-level statement lives in Layer 3, so Layers 1 and 2 contain no forward
references. Layer 3 needs Layers 0–2 (its rational-function-field and affine-bridge
subsections are exactly where Layers 1–2 meet the divisor types);
Layer 4 (RR) needs Layer 3 and the repartition vocabulary only — it is the critical path.
Layer 5 follows Layer 4; its Clifford milestone is the `[Infinite k]` form, and the
unrestricted Clifford is a Layer 8 export. Layer 6 (extensions) needs Layers 0–3 but
**not** RR, so it can
proceed in parallel with Layers 4–5; Layer 7 (different/Hurwitz) needs Layers 4 (cotrace),
5 (the local-component device `η` of Prop. 1.7.4), and 6. Layer 8 (constant extensions)
needs Layer 6 and touches Layer 7 only for genus
statements. Layer 9's first subsection (`dim Ω[F⁄k] = 1`) needs Layers 0–3 only and can
be drafted early; its comparison theorem consumes Layer 7's cotrace (and Layer 5's `η`),
so **Layer 9 as a whole follows Layer 7**. Layer 10 (models) needs
Layers 7 and 9 for its genus computations; Layer 11 needs Layers 5–8 and 10; Layer 12
needs conceptually everything but its *statements* (the contracts) should be drafted as
soon as Layer 3 exists, so the JacobianChallenge and EllipticCurves maintainers can
review the interface
early. The worked examples are spread across all layers and none is deferrable to the
end.

### Cross-roadmap milestone contracts

| Supplier | Supplied milestone | Consumer |
|---|---|---|
| This roadmap, Layers 0–5 | normalized places, residue degrees, `Finsupp` divisors, exact constants, Riemann–Roch, and the genus-one ladder `ℓ(n·[0]) = n` | the merged [EllipticCurves](../EllipticCurves/README.md) roadmap's Layer-0 place/divisor interface instantiates the general theory here; the ladder is a reusable consequence with no further current consumer (any relative base-change upgrade is JacobianChallenge Layer-C territory, not this roadmap's) |
| This roadmap, Layers 6–8 | function-field extensions, ramification indices/residue degrees, the different, Riemann–Hurwitz, and lower ramification groups | future CurvesOverFiniteFields and the BelyiMaps roadmap; these are consumers, not prerequisites of this roadmap |
| This roadmap, Layers 9–10 | Kähler/Weil differential comparison and the elliptic function-field/place/class-group dictionary | the merged [EllipticCurves](../EllipticCurves/README.md) roadmap's named comparison interfaces |
| This roadmap, Layer 12 plus merged JacobianChallenge Layers A–B | for smooth proper geometrically connected models of separably generated fields: divisors, `H^0 = L(D)`, equality of cohomological and function-field genus, and dualizing-sheaf/canonical-class comparison | both routes; neither re-proves the other's Riemann–Roch theorem |
| Local Fields and Ramification roadmap, ramification-filtration layer | upper numbering, Herbrand, and Hasse–Arf for completions with finite residue field | the finite-residue specialization of Layer 8; arbitrary-residue complete-DVR and expansion infrastructure is built in Layers 5 and 9 here |

The function-field Riemann–Roch chain itself has no sibling-roadmap prerequisite.

## References

- H. Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254, Springer,
  2009 — **the primary source**. Ch. I (places I.1, the rational function field I.2,
  independence I.3, divisors I.4, Riemann–Roch I.5, consequences I.6, local components
  I.7) = Layers 0–5; Ch. III (extensions III.1–III.3, cotrace/Hurwitz III.4, the
  different III.5, constant extensions III.6, Galois III.7–III.8, inseparable III.10,
  genus estimates III.11) = Layers 6–8; Ch. IV (differentials, `P`-adic expansions,
  Weil-differential comparison) = Layer 9; Ch. VI (elliptic VI.1, hyperelliptic VI.2,
  Kummer/Artin–Schreier VI.3–VI.4) = Layer 10; Appendix B = Layer 12's vocabulary.
  (Ch. 5 — zeta — belongs to a future CurvesOverFiniteFields roadmap; only its
  zeta-free §5.1 inputs are Layer 5's.)
- W. Fulton, *Algebraic Curves: An Introduction to Algebraic Geometry*, 2008 ed. — the
  plane-curve route: Ch. 5 (projective plane curves, Bézout, Max Noether), Ch. 8
  (divisors §8.1–8.2, Riemann's theorem §8.3 **with the ordinary-singularities genus
  formula** (Prop. 5 + Cor.), differentials §8.4, canonical divisors via adjoints §8.5
  Prop. 8, **Riemann–Roch §8.6 by the Brill–Noether/Noether-reduction argument** — ⚠
  *not* an adelic proof; "repartition" does not occur in Fulton). Layer 10's
  plane-curve computations and an independent check on Layer 4's statements.
  ⚠ Standing hypotheses: `k` **algebraically closed** from Ch. 3 on, char 0 at several
  points (§8.4 Prop. 6(2); his Appendix A discusses the char-`p` repairs) — every
  statement ported from Fulton must be re-hypothesized.
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*, Oxford GTM 6, 2002 — Ch. 7
  (divisors, RR on schemes, the dictionary), the source of record for Layer 12's
  regular-vs-smooth honesty over imperfect fields. *(Library list.)*
- R. Hartshorne, *Algebraic Geometry*, GTM 52 — I.6 (the abstract curve from its
  places), IV (curves; IV.2 Hurwitz; Ex. IV.2.5 the `84(g−1)` bound) — Layer 12 shape
  source and a Layer-11 written source. *(Library list.)*
- D. M. Goldschmidt, *Algebraic Functions and Projective Curves*, GTM 215, 2003 — an
  alternative function-field-first exposition (Weil differentials, Weierstrass points
  **with proofs**, Wronskians); the written source for Layer 11's Weierstrass-point
  development. *(Library list.)*
- G. D. Villa Salvador, *Topics in the Theory of Algebraic Function Fields*,
  Birkhäuser, 2006 — the function-field treatment of automorphism groups (finiteness
  for `g ≥ 2`) and of inseparable/constant-field pathologies; Layer 8 and Layer 11
  written source. *(Library list.)*
- M. Deuring, *Lectures on the Theory of Algebraic Functions of One Variable*, LNM 314,
  Springer, 1973 — Stichtenoth's own citation for the imperfect-constant-field
  counterexamples of §3.6 (he states none); Layer 8's counterexample provenance.
  *(Library list.)*
- M. Rosen, *Number Theory in Function Fields*, GTM 210 — the arithmetic consumer's
  view (facing a future CurvesOverFiniteFields roadmap); cited for the
  S-integer/class-group bridges of Layer 2.
  *(Library list.)*
- J.-P. Serre, *Local Fields* — the different and ramification background of Layers
  6–8 (already the local-field roadmap's primary source; cited here only for the
  trace-dual computations and the `G_i`).
- P. Roquette, *Abschätzung der Automorphismenanzahl von Funktionenkörpern bei
  Primzahlcharakteristik* (Math. Z. 117, 1970); H. Stichtenoth, *Über die
  Automorphismengruppe eines algebraischen Funktionenkörpers von Primzahlcharakteristik*
  I–II (Arch. Math. 24, 1973); H.-W. Henn, *Funktionenkörper mit großer
  Automorphismengruppe* (Crelle 302, 1978) — the char-`p` bounds and classifications of
  Layer 11's positive-characteristic scope exclusions. *(Library list.)*

## Coordination

This section contains the normative division of labor needed to implement the roadmap.

- **`vaca22/riemann-roch-function-fields`** (Guanghao Li; Apache-2.0): a complete,
  sorry-free function-field Riemann–Roch by the same Stichtenoth-style route — the
  largest overlap with this roadmap (Layers 0–5 and parts of 10) — with parts being
  upstreamed to Mathlib as open pull requests. The plan, definite: **this roadmap develops
  the mathematics independently in Tau Ceti, specifying the mathematics, not that
  code**. No code is copied or adapted from that repository — the licence would permit
  copying with attribution, but the project's coordinate-first rule reserves
  integration for a recorded agreement, and none is recorded — and nothing here waits
  on it either. Where its open Mathlib pull requests cover ground this roadmap needs
  — the Dedekind divisor group of
  [#41729](https://github.com/leanprover-community/mathlib4/pull/41729) is exactly
  Layer 3's affine dictionary — the milestones here are named and shaped the way those
  pull requests shape them, so if one lands in the Mathlib the repository builds, ours
  is deleted and the imports change. API divergence, documented: this roadmap pins
  normalized `ℤᵐ⁰`-valuations, `Finsupp` divisors, and `IsIntegrallyClosedIn`
  constants for the Mathlib-vocabulary reasons in the conventions table; that
  repository's self-contained intrinsic-DVR-subring API differs, and the divergence is
  deliberate, not accidental.
- **Mathlib's scheme-divisor and conditional-Riemann–Roch campaign** (R. D. Giles) —
  Layer 12 tracks `AlgebraicGeometry/AlgebraicCycle/*` and `OrderOfVanishing` (on
  Mathlib master) and states its
  dictionary milestones against them when the repository's Mathlib reaches them; the
  function-field divisor here is a different (field-level) object, so no namespace
  collision, but the Layer-12 "Weil divisors on the regular model" side is **Mathlib's
  namespace, not ours** — contract statements there consume Mathlib's types, and any
  gap found is a gap, not a fork.
- **[JacobianChallenge](../JacobianChallenge/README.md)** (merged roadmap;
  Merten's AG formulation). The division of labor is pinned: it builds scheme divisors,
  coherent cohomology, Serre duality, `Pic⁰`, and the Jacobian; this roadmap builds the
  function-field theory and proves RR adelically; **the Layer-12E comparison contract
  (three numbered items: `H⁰ = L(D)` over 12D's divisor identification,
  `g_cohomological = g_functionfield` via `h¹ = i(D)`, dualizing sheaf = canonical
  class) is the entire interface** — stated here, consumable by both, so the two RRs
  reconcile instead of duplicating. Its acceptance criterion `dim Jac = g` consumes
  this roadmap's genus through that contract. Draft the contract statements as soon as
  Layer 3's types exist (Ordering section) and review them with the JacobianChallenge
  maintainers. The **relative** theory (cohomology and base change) is its Layer C, no
  part of this roadmap.
- **[EllipticCurves](../EllipticCurves/README.md)** (merged roadmap) — the sibling
  instance. Its Layer 0
  deliberately leaves the place/divisor *implementation* "to the upstream coordination";
  this roadmap **is** that coordination point: the conventions table here (normalized
  valuations, `Finsupp` divisors, residue-finrank degrees) is the general theory its
  interface expects. Named compatibility milestones: the point–place dictionary in
  general form (Layer 10.iii), `Cl⁰ ≅ ClassGroup CoordinateRing` (Layer 10.iv, closing
  its `toClass_surjective` triangle without re-proving the group law), the
  `IsDedekindDomain CoordinateRing` instance both roadmaps want (Layer 10.ii), the
  fundamental identity it cites as Stichtenoth 3.1.11 (Layer 6), and the invariant
  differential in `Ω[FunctionField⁄K]` reconciled with the trivial canonical class
  (Layer 9). Its "regular, not smooth" convention over imperfect fields is adopted
  verbatim in Layer 12.
- **[ModularForms](../ModularForms/README.md)** (merged roadmap) — no interface: its
  Layer 10 builds the genus of `X(Γ)` analytically, with its own internal
  compact-Riemann-surfaces Riemann–Roch chain, so it consumes nothing from here.
  Cited so nobody wires a false dependency; the analytic ↔ algebraic genus
  comparison is excluded from Layer 12, gated on GAGA-style work no current
  roadmap owns.
- **Future consumers** (not dependencies of this roadmap): a **CurvesOverFiniteFields**
  roadmap would consume Layers 0–8 wholesale (its zeta rationality/functional equation
  are RR corollaries; the `Cl⁰` finiteness over finite `k` and strong approximation are
  supplied here); a **HyperellipticCurves** roadmap, Layer 10's model class and
  Layer 7's Hurwitz; the **BelyiMaps** roadmap, Layers 6–7 (ramification, RH) and
  Layer 12's dictionary; higher-genus genus/automorphism data semantics rest
  on Layers 10–11.
- **Siblings**: the
  Local Fields and Ramification roadmap
  owns the *local* ramification
  filtration (lower/upper numbering, Herbrand, Hasse–Arf); this roadmap's Layer 8 keeps
  the function-field-level `G_i` and Hilbert's different formula (Stichtenoth 3.8.7)
  and proves the completion bridge at arbitrary residue fields. Upper numbering,
  Herbrand, and Hasse–Arf are consumed from that roadmap only for finite residue
  fields; no such supplier is claimed for completions such as `ℚ((t))`.
  `Mathlib/RingTheory/LaurentSeries.lean` (de Frutos-Fernández–Nuccio) is the
  base example for Layer 9's general complete-DVR expansion construction.
