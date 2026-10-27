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
  false without it); geometric regularity of the regular projective model for
  genus invariance under arbitrary constant-field extension (Layer 8); perfect `k`
  implies that model condition, while generic separable generation alone does not.
  Separable generation plus exact constants gives a **regular field extension**
  (geometrically integral generic point), a different condition from geometric
  regularity of the whole model. Purely inseparable constants can drop genus even
  for a separably generated exact-constant field; `Algebra.EssFiniteType` on the
  actual algebra carrier used by the Kähler comparison, exactly as the pin's
  `FormallyUnramified.iff_isSeparable` carries
  them (Layer 9); separable generation of `F/k` for the one-dimensional Kähler
  module and coefficient-derivative transport (Layer 9); finite separable
  residue extension `F_P/k` for k-compatible
  completion charts and local residue transport (Layer 9); perfect `k` for the
  Kähler/Weil comparison and geometric trace-residue sum (Layer 9), and for the
  Weil-divisor conclusion of the elliptic differential comparison (Layer 10);
  characteristic-zero (or `p`-bounds) for the Hurwitz automorphism bound
  (Layer 11). Statements must carry their true hypotheses; every "char 0 for simplicity"
  shortcut in the literature is a trap flagged at its layer.

Do not fix `k` finite, algebraically closed, or of characteristic zero in the general
layers: downstream consumers live over `ℚ` and number fields (genus of modular and Shimura
curves), over finite fields (curves over `𝔽_q`), and over `ℂ` (Belyi maps); the theory is
stated over an arbitrary field with the honest hypotheses above.

Additional target signatures for the field tensor-domain, pole fibre, trace Gram
matrix and actual smooth/proper/geometrically-integral base-change structures are
in `ConstantExtensionSuggested.lean`, reusing the unchanged `Suggested.lean`
carriers. Layers7–8's local integral-basis/length and12B.0's model/section maps
are the definite producers below, not assumed black-box propositions.

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
  Kˣ →* Multiplicative ℤ` (`SelmerGroup.lean`), the closest existing additive order `ord_P`.
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
  properties of the different, which the file leaves open) — building it is a Layer-7 milestone, not an import.
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
- **The pinned Tau Ceti carriers of this roadmap's own targets.** Layer 0's predicate
  and places are `TauCeti.IsFunctionField` (`TauCeti/FieldTheory/FunctionField/Basic.lean`)
  and `TauCeti.Place` (`TauCeti/FieldTheory/FunctionField/Place/Basic.lean`, with the
  inverse-order and valuation/order lemmas used by Layer 2's pole fibre); Layer 8's
  perfect-field separating element is
  `TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_perfectField`
  (`TauCeti/FieldTheory/FunctionField/SeparablyGenerated.lean`, Prop. 3.10.2); Layer 10's
  Weierstrass equation over arbitrary exact constants, without a discriminant condition,
  is `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one`
  (`TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean`). New targets
  are stated on these carriers, through a comparison with any differently spelled
  statement, never on a parallel copy.
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
  there. The places with `ord_P x < 0` correspond precisely to the primes of
  `R_{1/x}` **over the base ideal `(x⁻¹)`**, equivalently the places over `P_∞`.
  A prime elsewhere on that finite chart is not a pole: on `k(x)` the prime
  `(x⁻¹−1)` has `ord_P x=0`. Identify the pole fibre's local rings and residue maps;
  its finiteness follows from the finite normalization fibre, not from finiteness
  of the full chart. Thus the place set is the compatible two-chart union used by the
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
  for each finite separable extension of these excellent DVRs, including inseparable
  residue extensions; **(b)** under `Algebra.IsSeparable F_P F′_{P′}`, equality
  holds iff the residue characteristic does not divide `e(P′∣P)`. In general define
  **tame** by BOTH residue separability and that prime-to-characteristic condition;
  **unramified** means `e=1` AND residue separability. Do not call an `e=1` fierce
  extension unramified. Prove the general equivalence `d=0 ↔ unramified` via
  the different ideal's unramified criterion. The equality/tame proof uses the
  displayed residue hypothesis (Stichtenoth via `k` perfect, Lemma3.5.3); The pin supplies `P^{e−1} ∣ 𝔡` and the ramified ⟺
  divides criterion; the **exact tame value is built here** (the pin's file leaves it open)
  — by a complete local route. First prove that localization preserves the trace dual
  and different ideal. After completion, factor a finite tame extension with separable
  residue extension into an unramified extension and a totally ramified extension;
  prove the unramified different is trivial, prove `d=e-1` in the totally ramified
  part by the uniformizer minimal-polynomial/trace computation, and combine them using
  the tower formula. Prove separately that completion preserves the different exponent,
  so the completed calculation returns the original affine-model valuation. (A direct
  local proof may replace this chain only if it covers the residue-extension part, not
  merely the totally ramified case.) This supplies the missing half of the pin's
  `Different.lean` story. Here ramified means failure of the full unramified
  condition, and is equivalent to `P′ ∈ supp Diff` for arbitrary residue fields.
  In the residue-separable branch, wild means the residue characteristic divides e,
  and is equivalent to `d≥e` (Cor.3.5.5). Without residue separability retain the
  actual `e`, inseparable residue degree and trace-dual different separately:
  failure of tameness can be fierce (`e=1`, nontrivial inseparable residue), so
  it must not be restated as `p∣e`. The general computation in Layer8 below covers
  this case, rather than silently imposing perfect constants.
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
  **with equality iff every ramified local extension is tame**, with finite
  separable residue extensions at every place as explicit input to this equality
  criterion (Cor.3.5.6). The inequality itself keeps arbitrary residue fields;
  without that input compare the actual local different exponents, not merely e; ⚠ wild honesty: the Artin–Schreier worked
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

- **Constant-field extensions and their three distinct inputs.** For every chosen
  algebraic `K/k` and compositum `F_K=F·K`, first state the embeddings/scalar towers,
  the actual relative algebraic constant field of `F_K`, and its normalization.
  No field structure is asserted on `K⊗[k]F` unless a domain theorem supplies it.
  Keep the original perfect-k constant-extension package (Prop.3.6.1,
  Cor.3.6.4, Prop.3.6.6, Cor.3.6.8), and prove the following sharper dictionary:
  1. **Generic separable generation** means a separating transcendental x with
     `F/k(x)` finite separable. It gives the Layer9 one-dimensional Kähler module
     and geometric reducedness of the generic field. The actual native
     `SeparablyGenerated.lean` existential is the comparison target. It gives
     neither geometric regularity of the complete model nor conserved genus.
  2. **Regular field extension** means generic separable generation AND
     `IsIntegrallyClosedIn k F`. Prove its equivalent tensor-domain criterion:
     for every extension K/k, `K⊗[k]F` is a domain; its fraction field has exact
     constants K and is again a one-variable function field. Prove the induced
     scalar maps, linear disjointness and `[F:k(x)]=[F_K:K(x)]`. Over perfect k,
     exact constants imply this regular-field condition. None of these generic
     statements says that all closed local rings remain regular after base change.
  3. **Conservative smooth-model branch** takes the one canonical regular
     projective model X_F, together with an actual smooth structure morphism and
     geometric connectedness (equivalently geometric integrality here). It uses
     early cut12B.0, available from Layer2, not the later12E cohomology dictionary.
     Prove that its K-base-change is smooth proper geometrically integral and is
     the regular model of `Frac(K⊗[k]F)`. The identity map of fraction fields
     extends uniquely to a model isomorphism. This condition holds over perfect k
     with exact constants, and over characteristic zero; over imperfect k it is
     additional data, not a synonym for item1 or item2.
  The perfect-k specialization retains each original degree/irreducibility
  milestone explicitly: for F′/F with full constants k′/k,
  `deg_(k′)(Con_(F′/F) A)=[F′:F k′]*deg_k A` (Cor.3.6.4), and
  `[F′:F]=[F′kbar:F kbar]*[k′:k]` (Prop.3.6.6) with the indicated compatible
  composita and the degree integrality from Layer6. Prove the geometric
  irreducibility/exact-constants criterion (Cor.3.6.8) over perfect k, and the
  arbitrary-k form with separable generation explicitly present. These formulas
  keep the specified full constants; they do not identify a raw tensor with a field.
- **Genus and divisor base change, retaining the imperfect smooth case.** Under
  item3 and for arbitrary K/k, construct the flat pullback `Con` of Cartier
  divisors and its place expression. For a closed P, the finite Artinian fibre
  `κ(P)⊗[k]K` may have several local factors AND nilpotents. Its support gives
  the places Q over P and its local lengths give the coefficients in Con(P).
  Prove the residue maps, length/degree identity and
  `deg_K(Con D)=deg_k D`; do not replace the fibre by a reduced compositum.
  Prove the **actual K-linear isomorphism**
  `K⊗[k]L_k(D) ≃ₗ[K] L_K(Con D)` by the finite affine-cover section equalizer
  of12B.0 and flatness, with its multiplication/principal-divisor compatibilities.
  Riemann's large-divisor equality on both fields then proves `g(F_K/K)=g(F/k)`:
  use a positive-degree effective divisor and a common sufficiently large multiple,
  not an invocation of12E or a definition of genus via H¹. RR uniqueness proves
  that the pulled-back canonical class is canonical. A line bundle becoming
  trivial has a descended nonzero global section which becomes nowhere vanishing,
  proving injectivity of Con on classes. These supply all genus, basis, degree,
  canonical and class outputs of Thm.3.6.3 without losing imperfect smooth models.
- **Unramified constant extensions are a separate branch.** For algebraic K/k
  separable, prove that every place Q over P is unramified in Layer7's full
  sense (`e(Q/P)=1` and κ(Q)/κ(P) separable), with the selected
  component/residue-field identifications made explicit. Over perfect k every
  algebraic K/k is separable, so this recovers Thm.3.6.3(a),(g) and the
  original simple compositum statement, for each chosen place and common
  ambient embedding. Separately, for arbitrary algebraic K/k with κ(P)/k
  separable, prove only the weaker conclusion: the fibre `κ(P)⊗[k]K` is
  reduced, so `e(Q/P)=1` for every Q over P, and κ(Q) is identified with the
  corresponding field factor of that fibre. In this branch κ(Q)/κ(P) is
  separable iff K/k is separable (an element of K separable over κ(P) is
  separable over k, because κ(P)/k is separable), so full unramifiedness is
  obtained only by adding separability of κ(Q)/κ(P), never from separability
  of κ(P)/k alone. Neither conclusion may be inferred merely from smoothness
  of X_F. Two imperfect regressions are required, both with `k=F_p(a)`,
  F=k(t), `K=k(a^(1/p))`, where the model is the smooth projective line and
  genus stays0. At P=(t^p−a): `Con(P)=pQ`, `e(Q/P)=p`, with Q=(t−a^(1/p));
  its Artinian fibre length is p. At the rational place P=(t): κ(P)=k is
  separable over k, the fibre is the field K, `Con(P)=Q` with Q=(t),
  `e(Q/P)=1` and `deg_K Q=deg_k P=1`, but κ(Q)/κ(P)=K/k is purely
  inseparable of degree p, so Q/P is not unramified. The two places separate
  `e>1` from `e=1` with inseparable residue extension. Keep them with the
  finite-separable-residue completion chart guard.
- **Clifford, unrestricted — the Layer8 export.** For finite k (perfect), pass
  to its algebraic closure. The preceding base-change isomorphism preserves
  genus, divisor degrees and all ℓ values, so Layer5's infinite-field Clifford
  applies and descends. Combine finite and infinite k into the same theorem
  for arbitrary exact constant fields. The stronger imperfect-field genus claim
  is neither needed for this deduction nor asserted.
- **Inseparable constant-extension pathology and general drop estimates.** Keep
  the general genus-never-increases theorem for algebraic constant extension:
  specify the chosen reduced compositum/normalization and its full constant field,
  then compare the normalized genus, rather than calling a possibly nonreduced
  tensor product a field. First prove the finite-extension case on the SAME
  two-affine model cover, using12B.0c's elementary Čech complex. Its H¹ is
  finite dimensional and equals the function-field genus over the exact constants
  by the repartition/approximation comparison. Flat base change preserves this
  H¹. For a nonreduced base change first use the nilradical exact sequence:
  the two-affine complex has no H², so H¹ surjects onto H¹ of the reduction.
  For its normalization, the cokernel is supported at finitely many closed points,
  whose higher Čech cohomology vanishes, giving a further H¹ surjection.
  Thus the normalized genus cannot increase; if its full constants enlarge K,
  record the additional factor `[constants:K]` in the H¹ dimension before
  dividing to the normalized genus. In the geometrically integral case there is
  no nilradical, the normalization quotient has finite length, and with the same
  global constants equality of genera holds iff that quotient vanishes, i.e. the
  base-changed model is normal. This does not apply that finite-length argument
  directly to a nonreduced scheme. Extend to
  arbitrary algebraic K by finite presentation/descent of the defining model and
  finitely many section/normalization data. Retain all III.11 drop estimates as
  separate quantitative targets with their inseparability and constant-field
  hypotheses. For the required odd-p example `k=F_p(t)`, `y²=x^p−t`, prove
  BOTH generic separable generation and exact constants. At p3 the regular cubic
  has genus1 and geometric cusp normalization genus0. After adjoining a with
  a^p=t, put `u=y/(x−a)^((p−1)/2)`; `u²=x−a`, `u^p=y` give the rational
  normalized field. Thus even a regular field extension in item2 need not be
  conservative. The genus drop is retained as a positive theorem, not removed
  by assuming k perfect everywhere.
- **Galois II: decomposition, inertia and lower ramification over every residue
  field.** For a finite Galois extension of the function fields and a chosen
  place P′ over P, construct D, I and the induced residue action. Writing
  `f=f_sep*f_ins`, prove `|D/I|=f_sep`, `|I|=e*f_ins` and identify D/I with
  the automorphism group of the separable part of `κ(P′)/κ(P)`; here `|D|=e*f`
  follows from the fundamental identity and transitivity. Under
  `Algebra.IsSeparable κ(P) κ(P′)`, recover `|I|=e` and the full residue Galois
  quotient. No generic separability of F′/F eliminates residue inseparability.
  Define `G_i` intrinsically by `v_P′(σb−b)≥i+1` for **every b in O_P′**,
  i≥0, with D as G_-1 and I=G_0. Prove normality in D, descending inclusion,
  eventual triviality and completion compatibility before any structure formula.
  This all-elements definition works for fierce extensions too; testing only a
  uniformizer is not equivalent without the requisite residue-generation proof.
- **Classical residue-separable branch.** With finite separable residue extension
  as an explicit hypothesis, prove `G_0/G_1` cyclic of order prime to the positive
  residue characteristic, `G_i/G_(i+1)` elementary abelian p for i≥1,
  characteristic-zero residue ⇒G_1=1, and
  `d(P′/P)=Σ_(i≥0)(|G_i|−1)`. The sum is finite by eventual triviality.
  The proof supplies an unramified residue extension then a totally ramified
  monogenic DVR extension, computes its minimal-polynomial derivative and proves
  the ramification-number/group-sum identity. This is Thm.3.8.7 with its actual
  residue hypothesis; it does not cover arbitrary inseparable residues.
- **General different computation, including fierce/wild residue.** Keep Layer7's
  native trace-dual different on the same finite normalization/DVR carriers.
  Prove localization and completion preserve it, without assuming separable
  residue. For a finite extension of complete excellent DVRs B/A with separable
  fraction fields L/K, build an A-integral basis b_i, its trace Gram matrix
  `T_ij=Tr_(L/K)(b_i*b_j)` and the trace-dual basis from T^-1. Its determinant
  is nonzero by separability. These dual basis vectors span the complementary
  module C; its inverse fractional B-ideal is the different. Prove its valuation
  d, nonnegativity and tower law. Smith/elementary divisors over A give
  `v_A(det T)=length_A(C/B)=f*d`, with f the FULL residue degree, including
  its inseparable factor. Thus the discriminant, e, f and d are constructible
  on actual rings even when no uniformizer generates B over the unramified part.
  The monogenic case specializes via the existing conductor/derivative identity;
  otherwise use the integral basis, not a guessed Hilbert sum. Expose the residue
  separability predicate and the classical comparison theorem as separate API
  outputs so a consumer must choose the correct branch.
- **Required fierce regression.** In characteristic2 take
  `k=F₂(s,u)`, A=k[t]_(t), `y²+ty=s`, `z²+tz=u`, B=A[y,z]. Prove s,u
  are p-independent and B/tB=k(sqrt(s),sqrt(u)) is a field of degree4. B is
  finite free rank4, local with maximal ideal(t), hence a DVR and the full
  integral closure. Its fraction extension is V4-Galois, with translations by t;
  e=1, f_ins=4, G_0=V4, G_1=1 by the all-elements definition. Each quadratic
  monogenic step has different(t), so the tower different is(t²), d=2, while
  the unqualified group sum is3. Retain the general inertia formula, and make
  both false classical conclusions fail their hypothesis rather than deleting
  the example or reclassifying it as unramified. This also checks the Gram
  discriminant length: f*d=8.
- **Completion and sibling scope.** Prove the same chosen-place lower groups,
  valuation normalization, residue maps and trace-dual different survive
  completion at arbitrary residue fields, with no new classical formula inferred.
  Upper numbering/Herbrand/Hasse–Arf are consumed from LocalFieldsRamification
  only for its actual finite-residue local-field inputs; Hasse–Arf additionally
  requires its abelian Galois-extension hypothesis. General complete-DVR
  constructions and fierce computations remain here, rather than importing a
  finite-residue theorem outside its scope.
- **Composita** (III.9): **Abhyankar's lemma** (Thm. 3.9.1: `F′ = F₁F₂` with one of
  `Pᵢ∣P` tame in the full sense (separable residue and prime-to-characteristic e)
  ⟹ `e(P′∣P) = lcm(e₁, e₂)`); unramified-in-both ⟹ unramified in the
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
  generated `F/k`. Use `Ω[F⁄k]` as the carrier throughout; Stichtenoth's `Δ_F`
  is reference vocabulary for its separably generated specialization, with
  universal property 4.1.8(d). Require the inseparably generated dimension-jump
  examples on the genuine Kähler module; (ii) this is the pin's load-bearing gap
  (`KaehlerDifferential` never meets `FieldTheory/`). For separating `x`, consume
  `Algebra.FormallyEtale.of_isSeparable` for `F/k(x)` and
  **`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`** to obtain the full
  equivalence
  `F ⊗_{k(x)} Ω[k(x)⁄k] ≃ₗ[F] Ω[F⁄k]`; the polynomial/localization basis identifies
  its generator with `dx`, proving both injectivity and `dx ≠ 0`. The second
  fundamental sequence is supporting API, not a claim that surjectivity alone gives
  the equivalence. The finite-presentation hypotheses use the correct carrier
  `Algebra.EssFiniteType` wherever the pin's formally-unramified equivalences require it.
- **Local expansions and residues** (IV.2): retain the separably generated F/k
  hypothesis above (automatic for perfect k). Starting from Layer 5's general complete-DVR
  construction, choose a uniformizer `t`. At a **rational** place, prove the completed
  valuation ring is topologically `k[[T]]` by a recursive coefficient-extraction and
  completeness argument with T↦t, extend to an isomorphism of completed fraction fields with
  `k((T))`, and prove uniqueness of coefficients. Consume
  [FormalLaurentPuiseux L1–L3](../FormalLaurentPuiseux/README.md) for the coordinate
  substitution and residue transformation formulas in every characteristic;
  transport them along these completion isomorphisms.
  The pin's concrete `X`-adic Laurent-series equivalence is the base example, not the
  general theorem. At a nonrational place require the finite residue extension
  `F_P/k` to be separable (in particular this holds for perfect k). Construct
  the unique k-compatible coefficient-field section `F_P → Ô_P` by Hensel
  lifting the finite separable residue extension. Prove it is a k-algebra map,
  splits reduction and gives a topological ring isomorphism
  `Ô_P ≃ₐ[k] F_P[[T]]`, extending to the completed fraction fields. Prove the
  uniformizer t is separating: the coefficient-field-killing derivation on
  `F_P((T))` restricts to a k-derivation F→F_P((T)) sending t to 1. Thus dt
  is nonzero in the one-dimensional `Ω[F⁄k]` proved above and is a basis.
  Transitivity for k⊆k(t)⊆F gives `Ω[F⁄k(t)]=0`; F/k(t) is finite, so it
  is separable. Here t is transcendental over k by its positive valuation
  and trivial valuation on constants. The coefficient derivative and F's
  d/dt then agree on k(t), and separability makes their extensions into
  F_P((T)) unique. This proves continuous extension, vanishing on the
  coefficient field and correspondence with `LaurentSeries.derivative F_P`.
  These are the algebraic and differential
  compatibility targets needed for the transport. Define
  the `F_P`-valued coefficient/residue and compose with `Algebra.trace k F_P` for the
  `k`-valued local component. Then set `res_{P,t}(z) := a₋₁` (Def. 4.2.8) and prove the
  **transformation formula `res_{P,s}(z) = res_{P,t}(z · ds/dt)`** by that
  coordinate-level transport (Prop. 4.2.9), including characteristic `p`
  under these separability hypotheses. Define `res_P(z dt) := res_{P,t}(z)`
  on differentials and prove independence of t (Def. 4.2.10). The
  general complete-DVR construction is owned by Layer 5; these k-compatible
  coefficient and geometric residue milestones use finite separable
  residue extensions and are not delegated to the finite-residue local-field
  roadmap.
- **The comparison theorem** (IV.3): assume k perfect on this milestone,
  including its geometric residue theorem. Fix one separating x and define
  `δ(z)=(dz/dx)·Cotr_{F/k(x)}(η_x)` in Weil differentials, with Layer 5's
  rational η_x. Prove δ is a k-derivation and, for every other separating y,
  `Cotr_{F/k(y)}(η_y)=(dy/dx)·Cotr_{F/k(x)}(η_x)`; deduce independence
  of the separating coordinate. Construct `μ : Ω[F⁄k] ≃ₗ[F] Ω_F`,
  `z dx ↦ z·δ(x)` (Thm. 4.3.2).
  Prove its local component at every place P is the trace residue
  `(z·δ(x))_P(u)=Tr_(F_P/k)(res_P(uz dx))`. Perfectness makes each
  finite residue extension separable, so the preceding completion charts
  define these components. Deduce the canonical divisor formula
  `(dx)=−2(x)_∞+Diff(F/k(x))`, degree 2g−2, and
  `Σ_P Tr_(F_P/k)(res_P(ω))=0`. For algebraically closed k this is
  the ordinary sum of coefficient residues. Keep Layer 5's abstract
  Weil-differential sum identity at its stated generality; the geometric
  trace-residue comparison here has the displayed perfectness hypothesis.

### Layer 10: model classes — elliptic, hyperelliptic, plane curves

Stichtenoth VI.1–VI.3; Fulton Chs. 5, 8 for the plane-curve computations.

- **Elliptic function fields** (VI.1): definition of record = Stichtenoth Def. 6.1.1 —
  **genus 1 together with a divisor of degree 1** (⚠ a *divisor*, not a rational place;
  RR then produces the rational place, Prop. 6.1.6(a)). **Weierstrass equation over
  arbitrary k:** with exact constants, at a rational place P₀ the `ℓ(iP₀) = i` ladder
  gives x, y with pole divisors 2P₀ and 3P₀, `F = k(x,y)`, satisfying a long
  Weierstrass equation over k (Prop. 6.1.2); no nonsingularity is asserted. Normal
  forms of that equation: char ≠ 2 gives `y² = f(x)` with `f` a squarefree cubic in
  `k[X]` (a repeated factor of a cubic is linear and would make F rational), and
  conversely every squarefree cubic gives genus 1 with exact constants; in
  characteristic 2 the coordinate changes reach Mathlib's two shapes
  `IsCharTwoJNeZeroNF`, **`Y² + XY = X³ + a₂X² + a₆`**, and `IsCharTwoJEqZeroNF`,
  **`Y² + a₃Y = X³ + a₄X + a₆`**, again with no discriminant condition.
  **Nonsingularity is the smooth-model branch.** For such a Weierstrass equation W
  of F, `W.IsElliptic` holds iff the regular projective model X_F is smooth over k
  (Layer8 item3, 12B.0b): the projective cubic is the regular model, because its
  arithmetic genus equals the genus 1 of its normalization. Over perfect k the model
  is smooth, so every genus-one field with a degree-one divisor is the function field
  of a nonsingular Weierstrass curve; over imperfect k smoothness is an explicit
  hypothesis of this implication. In the normal forms it reads: `f` separable
  (char ≠ 2), `a₆ ≠ 0` (`j ≠ 0`), `a₃ ≠ 0` (`j = 0`). Required negative control:
  `k = F₂(a)`, `y² = x³ + a`. F/k(y) has degree 3; the place `y² + a` (degree 2)
  and the place at infinity each have `e = 3`, `f = 1`, different exponent 2, all
  other places are unramified, so `2g − 2 = 3·(−2) + 2·2 + 2·1 = 0`; the rational
  place over infinity gives exact constants and y is separating. Yet the equation is
  of `j = 0` shape with `a₃ = 0`, so `Δ = a₃⁴ = 0`, and over `k(√a)` the field
  becomes rational (`v = y + √a`, `u = v/x`, `x = u²`, `v = u³`); by uniqueness of
  the regular model F has no nonsingular Weierstrass model over k. The
  characteristic-3 cubic `y² = x³ − t` of Layer8 is the squarefree-but-inseparable
  control (`Δ = −27b₆² = 0`). The converse, a nonsingular Weierstrass equation
  defining a genus-one field with exact constants, holds in every characteristic
  over arbitrary k. For the odd-characteristic squarefree cubic only,
  `Diff(F/k(x))` is the reduced sum of the places above its finite branch
  divisor plus Q_∞ (Prop.6.1.3), with each closed-place coefficient1 and
  residue-degree weights when taking its degree. Characteristic2 uses the
  **weighted** different computed from the actual long Weierstrass derivative
  and the infinity DVR, not this reduced sum. In particular `y²+y=x³` over F₂
  has `Diff=4Q_∞`; this weighted computation is made for the nonsingular
  characteristic2 normal forms of the smooth branch above; **the degree-one places form
  an abelian group isomorphic to `Cl⁰(F)`** via `P ↦ [P − P₀]`, with
  `P ⊕ Q = R ⟺ P + Q ∼ R + P₀` (Prop. 6.1.6(b), 6.1.7 — the intrinsic group law).
  **Mathlib compatibility milestones** (the general theory meeting
  `Mathlib/AlgebraicGeometry/EllipticCurve/`; each is also a named interface of the
  merged [EllipticCurves](../EllipticCurves/README.md) roadmap, whose Layer 0
  consumes the early local-ring/place milestone below):
  (i) `genus k W.toAffine.FunctionField = 1` for `[W.IsElliptic]` (all
  characteristics);
  (ii) `W.toAffine.CoordinateRing` is the integral closure of `k[x]` in the function
  field; the elliptic **`IsDedekindDomain`** instance already follows from the
  early milestone below: A is a Noetherian domain and its maximal-ideal
  localizations are DVRs, using Mathlib's `isDedekindDomain_iff_isDiscreteValuationRing_atPrime`;
  (iii) the point–place dictionary: `W.toAffine.Point ≃` degree-1 places (the
  EllipticCurves Layer-0 bridge) follows directly from the early affine/infinity
  classification below: degree-one affine places are the k-rational maximal
  ideals, identified with Mathlib's `CoordinateRing.XYIdeal`; Prop. 6.1.6
  supplies the general genus-one function-field form independently;
  (iv) `Cl⁰(W.FunctionField) ≅ ClassGroup W.CoordinateRing` (Layer 3's affine bridge
  specialized to the one-rational-place-at-infinity case) — which, with Mathlib's
  `Point.toClass` (injective) and the EllipticCurves roadmap's seeded
  `toClass_surjective`, closes the
  triangle `E(k) ≅ Cl⁰` **without this roadmap re-proving the group law**.
- **Elliptic invariant differential comparison.** In Mathlib's Kähler module
  define the expression `ω=dx/(2y+a₁x+a₃) ∈ Ω[W.FunctionField⁄k]` and
  prove its denominator is nonzero for elliptic W. This is the same expression
  used by EllipticCurves Layer 1. The all-characteristic local computation needs only
  Layer 0's places and the smooth Weierstrass local-ring constructions specified
  in this milestone, independently of the genus-one comparison, Layers 7–9
  and translation-invariance. Layer 9 supplies the k-perfect
  Weil-differential comparison for the final divisor deduction.
  Prove in all characteristics that `Ω[O_P⁄k]` maps injectively into
  Ω[W.FunctionField⁄k] and ω generates its image at each place, including
  over imperfect k; this is its intrinsic regular/nonvanishing meaning.
  For the affine coordinate ring A, prove its defining equation and its two
  partial derivatives generate the unit ideal, using the unit discriminant and
  nonsingularity over every residue field. Thus A is smooth of dimension one
  over k, and its Kähler module is free on ω, using the dx and alternate dy
  charts. Construct the affine places from A's local DVRs A_m. Prove every
  place with ord_P(x)≥0 has ord_P(y)≥0 by the monic Weierstrass equation,
  and O_P=A_m for its center m in A; the center is maximal since the place
  is nontrivial. These arguments include imperfect k.
  At infinity use the algebraic chart z=−x/y, w=−1/y with equation
  `f=w−z³−a₁zw−a₂z²w−a₃w²−a₄zw²−a₆w³=0`.
  Construct `infinityPlace` from the normalized valuation of the localization
  R of k[z,w]/(f) at (z,w). As a polynomial in z over k[w], −f is monic
  and Eisenstein at (w): every nonleading coefficient is divisible by w,
  and its constant coefficient −w(1−a₃w−a₆w²) is not divisible by w².
  Use `Polynomial.IsEisensteinAt.irreducible`; thus k[z,w]/(f) is a domain
  integral over k[w]. Its map to the function field by z↦−x/y and w↦−1/y
  is injective: w is transcendental, since otherwise y and then x would
  be algebraic over k by the Weierstrass equation, contradicting x's
  native polynomial-basis independence. The kernel therefore lies over zero
  in k[w], hence is zero by `Ideal.eq_bot_of_under_eq_bot`.
  Identify its fraction field and prove R is a DVR
  since ∂f/∂w(0,0)=1; z is its uniformizer and its residue field is k.
  Prove uniqueness of the place at infinity: ord_P(x)<0 forces
  2ord_P(y)=3ord_P(x), so ord_P(z),ord_P(w)>0. Hence O_P dominates R
  inside their common fraction field, and equality follows from R being a DVR.
  Together with the affine classification this accounts for every place.
  Prove the function field has exact constants directly from the rational
  infinity place: reduction embeds its algebraic constant subfield into k,
  since every nonzero algebraic constant has valuation zero.
  Prove its local Kähler module is free on dz since f_w is a unit in R.
  Prove the algebraic identity `ω=dz/f_w` from `f_z dz+f_w dw=0` and
  `w f_w+z f_z=w(−2+a₁z+a₃w)` modulo f. Since f_w(0,0)=1,
  ω/dz lies in O_∞ˣ, including characteristic 2; cancel the nonzero
  function-field denominator before evaluating at infinity.
  Deduce the zero Weil divisor assertion under k perfect using Layer 9.
  In this divisor/genus comparison, consume Layer 7's different theory to
  prove the affine different over k[x] is generated by `2y+a₁x+a₃`,
  including wild characteristic 2.
  This computes the canonical divisor and reconciles the concrete ω_W,
  without using a tame ramification formula in characteristic 2.
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
  chosen separable constant extension. For arbitrary imperfect k, the given
  smooth geometrically integral model uses12B.0/L8 to pass to an algebraic
  closure without changing genus; compute the same projection/different data
  there, where Layer9's perfect-k `(dx)=−2(x)_∞+Diff` applies, and descend the
  canonical divisor/space-of-forms comparison using12B.0c and faithful flatness.
  Over perfect k this is the same route directly. Thus no perfect-k Kähler/Weil
  statement is silently used at an inseparable residue over k. The canonical
  divisor is cut by forms of degree d−3 and **`g=(d−1)(d−2)/2`**. This projection/different chain is the sole route
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
verbatim): over imperfect `k` the regular projective model need not be smooth.
For a locally finite-type k-scheme, smoothness is equivalent to **geometric
regularity**, meaning every field base change has regular local rings. Geometric
reducedness is weaker, even together with regularity of the original model: the
cusp in Layer8 is a required counterexample. Use the pin's actual `Smooth` and
`GeometricallyIntegral` morphism predicates; geometric regularity is the displayed
all-field-base-change/local-regular-ring condition until that exact native
predicate is available. Construct its equivalence to Smooth as a theorem, not a
renamed geometric-reducedness assumption. The generic regular-field condition
also is weaker than geometric regularity of the full model.

There is one construction throughout this layer: **normalize `ℙ¹_k` in `F`**. “Glue
affine normalizations” describes its implementation on the standard two charts; `Proj`
properness and the valuative criterion are consequences or proof tools, not competing
definitions.

- **12B.0 — early regular model, regular constants and smooth-model base change.**
  This is an early extraction of the SAME12B normalization construction, not a
  second curve owner and not a prerequisite on all later12C–12E theorems.
  Its inputs are Layer0's function field/places, Layer2's finite normalization and
  two compatible charts, and native Spec/gluing/finite-projective morphisms/DVRs.
  Construct X_F by those charts, its regular projective structure, function-field
  algebra equivalence and closed-point/place/local-ring/residue dictionaries.
  For maps use the rational map on function fields extended through every DVR
  by properness; refine affine charts as necessary. This does not assume that
  independently chosen normalization charts directly map into one another.

  **12B.0a, generic regular constants.** Prove the regular-field equivalence in
  Layer8 item2 using separable generation and relative algebraic closure, then
  build its actual tensor-domain/fraction-field maps for every K/k. Prove
  identity, composition, commuting scalar maps and uniqueness of the induced
  fraction-field extension under the specified embeddings. These are field-map
  statements, not full faithfulness of base change on all curves or morphisms.
  Characteristic zero plus exact constants supplies separable generation by
  the native perfect-field theorem. For specified separating t, identify
  `Frac(K⊗[k]F) ≃ₐ[K] K(t)⊗[k(t)]F`: localize pure tensors at the nonzero
  polynomials in t, prove that this finite algebra over K(t) is a domain, hence
  a field, and extend to fraction fields. Give both maps on pure tensors, inverse
  equations, basis transport and `[F:k(t)]=[F_K:K(t)]`. The raw tensor K⊗F
  need not itself be that field. Prove scalar stability of regular extensions,
  also for arbitrary (not necessarily finitely generated) extensions by finite
  subextension descent. In particular, if k is algebraically closed, K/k is
  regular and F is relatively algebraically closed in Frac(F⊗[k]K).
  This char0 cut, with X_F smooth and geometrically integral by12B.0b, is the
  generic supplier for BelyiMaps9.1C; the fixed-t finite-Hom restriction/extension
  proof belongs to that consumer and is not full faithfulness for arbitrary maps.

  **12B.0b, whole-model geometric regularity.** Prove smooth↔geometrically regular
  for the locally finite-type model; establish geometric integrality from generic
  regularity, and establish smoothness of the regular model over perfect k.
  Over imperfect k keep geometric regularity as additional model input. Smooth
  and proper/geometrically integral base change uses the native base-change
  structures. The resulting model has the fraction field of12B.0a and is the
  unique regular projective model, so normalization/base-change comparisons are
  actual scheme isomorphisms. Normality alone on the original model does not
  justify commuting normalization with purely inseparable constants.

  **12B.0c, sections and divisor transport before cohomology.** After Layer3's
  divisors exist, identify L(D) with the rational functions obeying the local
  Cartier bounds on the same regular model. A finite affine cover with affine
  pairwise intersections expresses its sections as the kernel of the two
  restriction maps; tensoring by the flat field K preserves that kernel.
  Prove all restriction/multiplication diagrams, independence of the cover,
  composition of K-base-change maps and the actual isomorphism on L(D).
  Finite Artinian fibre lengths give the pulled-back divisor coefficients and
  the weighted degree identity, even at inseparable closed residues. This is
  absolute field-extension/finite-cover algebra only. It neither implements
  JacobianChallenge relative pushforwards nor consumes its later Serre duality.
  Also build the two-affine Čech complex of these normalization charts: H⁰ is
  the restriction equalizer and H¹ is the overlap section space modulo the sum
  of chart restrictions. Prove flat-field base change on both kernel and cokernel,
  the exact sequence for a coherent module, vanishing above degree1, and higher
  vanishing for finite-support modules. The repartition/strong-approximation
  comparison identifies H¹(O_X_F) with the Layer4 repartition quotient of
  dimension g (over the full constants); prove that comparison after Layers4–5,
  without Serre duality or a definition of genus by H¹. This finite-cover
  construction supplies the general reduction/normalization genus-drop proof;
  later12E identifies it with the established sheaf-cohomology API, rather than
  leaving a second competing H¹ carrier.
  Layer8 uses Riemann's large-divisor theorem to obtain genus and canonical-class
  conservation. Full12E later identifies these same maps with sheaf cohomology;
  it does not define a second base-change operation or feed back into12B.0.

  **12B.0d, characteristic-zero finite-map and finite-model descent.** A finite
  separable map between the smooth models stays finite after field extension;
  construct the pullback square, fraction-field maps and normalized local-order
  and residue comparisons. The morphism of relative cotangent line bundles
  commutes with flat field extension. Its zero divisor is the Cartier
  ramification divisor, also preserved by pullback; prove agreement with the
  trace-dual different using the actual separable-residue local branch.
  For extensions of algebraically closed characteristic-zero constants this
  proves preservation of every geometric ramification index and no new branch
  values. Outside that branch retain the Artinian fibre multiplicities and
  explicit residue conditions from Layer8, not an unrestricted e-invariance.
  For a finite collection of such finite models/maps over an algebraically
  closed characteristic-zero field, descend the finite presentations, gluing
  maps, finite bases/multiplication tables/inverse and separability witnesses,
  degree and specified three branch sections to a finitely generated subfield
  over Q. Pass to its algebraic closure in the ambient field. Faithful field
  extension reflects geometric integrality and finite étaleness off those
  sections; retain the witnesses and all scalar diagrams. This is a definite
  finite-model producer before Belyi10.6, with no Belyi theorem/topological
  enumeration/profinite comparison prerequisite. Belyi9.1C owns the fixed-t
  Hom comparison and Belyi10.6 combines it with its own finite enumeration.
  The generic cuts remain in this single AlgebraicCurves owner.

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
  morphisms. *Construction*: reuse the12B.0 gluing of `Spec R_x` and `Spec R_{1/x}` along
  the common localization and prove the resulting `ν_F : X_F → ℙ¹_k` has the universal property
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
  functor. An embedding `F ↪ F′` gives a rational map, which extends over every
  DVR by properness; identify its refined affine-normalization chart maps by
  integrality wherever those charts are compatible. Independently chosen variables
  need not send one chosen full affine chart into another. The local extensions
  agree generically and hence glue; separatedness gives uniqueness. Prove
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
  place over `∞` is wildly ramified; for the characteristic2 curve explicitly
  prove `d=4`, `Diff=4Q_∞` and genus1. In its infinity chart
  `f=w+z³+w²`, one has `dw=z²dz`, `t=1/x=w/z`,
  `dt=(w²/z²)dz`, `ord_∞w=3`, `ord_∞z=1`, hence different exponent4.
  The genus from the conductor computation disagrees with the naive tame count — the acceptance
  test that no `p ∤ e` slipped into Riemann–Hurwitz.
- **Inseparable constant-extension drop** (Layer 8): the standard
  `k = 𝔽_p(t)`, `F = k(x, y)`, `y² = x^p − t` example (`p` odd): genus drops after
  adjoining `t^{1/p}`. Prove explicitly that F/k is separably generated with
  exact constants; at p3 its regular model has genus1, while the normalized
  constant extension has genus0. The original model is geometrically reduced
  but not geometrically regular. This guards BOTH Layer8's conservative-model
  hypothesis and Layer12's smoothness criterion. The rational-function-field
  example `P=(t^p−a)` from Layer8 separately guards constant-extension
  ramification: smooth/conservative does not imply e=1 at every closed place.
  Its rational place `P=(t)` guards the opposite conflation: κ(P)/k is
  separable and `e=1`, yet κ(Q)/κ(P)=K/k is purely inseparable of degree p,
  so the place is not unramified.
- **Genus one without a smooth model** (Layers8, 10): over `k=F₂(a)`,
  `F=k(x,y)` with `y²=x³+a` has exact constants (rational place at infinity),
  is separably generated (y is separating) and has genus1 (computed from
  F/k(y) in Layer10), yet its Weierstrass coefficients give `Δ=a₃⁴=0`, and
  after adjoining `b=√a` the substitution `v=y+b`, `u=v/x` gives `x=u²`,
  `v=u³`: a rational normalization. Likewise, in characteristic3 the Layer8
  cubic `y²=x³−t` is squarefree but inseparable, with `Δ=−27b₆²=0`. These
  guard Layer10's rule that nonsingular normal forms and `W.IsElliptic`
  need the smooth model.
- **Fierce residue, separable field extension** (Layers6–8): discharge the full
  `F₂(s,u)` biquadratic example in Layer8, including integral basis/DVR,
  V4 action, e1/f_ins4, d2, G0/G1 and discriminant exponent8. This is the
  regression that prevents a classical Hilbert sum or a prime-to-e test from
  replacing the general trace-dual different.
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
needs Layer6; its field-regularity branch consumes early12B.0a, while its
smooth-model divisor/section branch consumes12B.0b–c plus Layer3 and Riemann's
large-divisor equality. Early12B.0 is extracted from Layer2/native scheme algebra;
it has no Layer8 genus, Layer11, full12C category,12E or JacobianChallenge input.
The general genus-drop/different statements also consume Layer7 where specified. Layer 9's first subsection (`dim Ω[F⁄k] = 1`) needs Layers 0–3 only and can
be drafted early; its coordinate residue transport consumes
FormalLaurentPuiseux L1–L3, and its comparison theorem consumes Layer 7's cotrace
(and Layer 5's `η`),
so **Layer 9 as a whole follows Layer 7**. Layer 10 (models) needs
Layers 7 and 9 for its genus computations. Its local elliptic-differential
computation starts after Layer 0, constructing smooth affine/infinity local
DVRs and their place classification directly, with ω expressed in Mathlib's
Kähler module. It consumes no EllipticCurves milestone.
The rational infinity place supplies exact constants.
EllipticCurves' regular/nonvanishing differential and separable-isogeny
unramifiedness milestones consume this local-generation result. Its
translation-invariance identity uses native addition formulas independently
of this supplier; the k-perfect Weil-divisor deduction also consumes Layer 9.
Layer11 needs Layers5–8 and10. Layer12B.0 and the requisite12A/12B model
construction are early; the complete12C anti-equivalence follows that construction,
12D follows Layer3, and12E alone consumes the later JacobianChallenge comparison.
Their *statements* (the contracts) should be drafted as
soon as Layer 3 exists, so the JacobianChallenge and EllipticCurves maintainers can
review the interface
early. The worked examples are spread across all layers and none is deferrable to the
end.

### Cross-roadmap milestone contracts

| Supplier | Supplied milestone | Consumer |
|---|---|---|
| This roadmap, Layers 0–5 | normalized places, residue degrees, `Finsupp` divisors, exact constants, Riemann–Roch, and the genus-one ladder `ℓ(n·[0]) = n` | the merged [EllipticCurves](../EllipticCurves/README.md) roadmap's Layer-0 general normalized-place/degree/divisor API consumes Layers 0 and 3; Layer 1's unramifiedness milestone also consumes Layer 0's `k̃=⋂_P O_P`. Its elliptic exact-constants and place-classification inputs come from the early Layer-10 milestone below. The RR ladder has no further current consumer (any relative base-change upgrade is JacobianChallenge Layer-C territory, not this roadmap's) |
| This roadmap, Layers 6–8 | function-field extensions, ramification indices/residue degrees, the different, Riemann–Hurwitz, and lower ramification groups | EllipticCurves Layer 0 consumes Layer 6's induced-place API and fundamental identity; future CurvesOverFiniteFields and the BelyiMaps roadmap consume these extension/ramification results. These are consumers, not prerequisites of this roadmap |
| This roadmap, Layers 9–10 | Kähler/Weil differential comparison, elliptic genus-one statement (i) and class-group bridge (iv) | the merged [EllipticCurves](../EllipticCurves/README.md) roadmap's named comparison interfaces; the Layer-0 point–place dictionary consumes the early milestone below |
| This roadmap, Layer 12 plus merged JacobianChallenge Layers A–B | for smooth proper geometrically connected models of separably generated fields: divisors, `H^0 = L(D)`, equality of cohomological and function-field genus, and dualizing-sheaf/canonical-class comparison | both routes; neither re-proves the other's Riemann–Roch theorem |
| FormalLaurentPuiseux L1–L3 | coordinate substitutions, continuous Laurent derivations, all-characteristic residue transformation | Layer 9's k-compatible completion charts at places with finite separable residue extension |
| This roadmap, Layer 10's early local elliptic-differential computation (after Layer 0) | affine/infinity place classification, exact constants from the rational infinity place, and `ω=dx/(2y+a₁x+a₃)` generating every local Kähler image, in every characteristic | EllipticCurves Layer 0's places/Dedekind instance/point dictionary and Layer 1's Kähler basis, regular/nonvanishing differential and unramifiedness, using the same Mathlib Kähler expression |
| Local Fields and Ramification roadmap, ramification-filtration layer | upper numbering, Herbrand, and Hasse–Arf for completions with finite residue field | the finite-residue specialization of Layer 8; Layer 5 builds complete-DVR infrastructure for arbitrary residue fields, while Layer 9's k-compatible charts require finite separable residue extension |

The function-field Riemann–Roch chain itself has no sibling-roadmap prerequisite.
At places with inseparable residue extension over imperfect k, k-compatible
Laurent coefficient charts and their geometric residue transport are outside
this roadmap's scope. Layer 5's general valuation/completion and abstract
Weil-differential theory retain their stated arbitrary-field generality.

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
  interface expects. Named compatibility milestones: the early elliptic point–place dictionary
  (Layer 10.iii), `Cl⁰ ≅ ClassGroup CoordinateRing` (Layer 10.iv, closing
  its `toClass_surjective` triangle without re-proving the group law), the
  `IsDedekindDomain CoordinateRing` instance both roadmaps want (Layer 10.ii), the
  fundamental identity it cites as Stichtenoth 3.1.11 (Layer 6), and the invariant
  differential in `Ω[FunctionField⁄K]`: the early local-generation computation
  in Layer 10 constructs its local theory directly on Mathlib's expression,
  which EllipticCurves' regular/nonvanishing and unramifiedness milestones consume;
  the zero Weil divisor then uses Layer 9's k-perfect comparison.
  Its "regular, not smooth" convention over imperfect fields is adopted
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
  in the explicitly residue-separable branch and computes the trace-dual different
  at arbitrary residues, with the same complete-DVR bridge. Upper numbering and
  Herbrand are consumed only for that roadmap's finite-residue local fields;
  Hasse–Arf also carries its abelian-extension hypothesis; no such supplier is claimed for completions such as `ℚ((t))`.
  `Mathlib/RingTheory/LaurentSeries.lean` (de Frutos-Fernández–Nuccio) is the
  base example for Layer 5's general complete-DVR construction.
  [FormalLaurentPuiseux](../FormalLaurentPuiseux/README.md) L1–L3 supplies the
  coordinate substitutions, continuous derivatives and residue transformation
  transported through Layer 9's k-compatible charts with finite separable
  residue extension.
