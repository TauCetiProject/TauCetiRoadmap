# Roadmap: the Ax–Kochen–Ershov principle

**Summary.** For a henselian valued field `K` whose residue field `k` has characteristic `0`, the
first-order theory of `K` as a valued field is determined by the theories of `k` as a field and of
the value group `Γ` as an ordered abelian group. This is the Ax–Kochen–Ershov principle:
`K ≡ K'` if and only if `k ≡ k'` and `Γ ≡ Γ'`. If moreover `K ⊆ K'` is an extension of henselian
valued fields with `k ≼ k'` and `Γ ≼ Γ'`, then `K ≼ K'`. The same holds in mixed characteristic
`(0, p)` for unramified fields, those in which `v(p)` is the least positive value, provided the
residue fields are perfect. The equivalence criterion also holds for finitely ramified fields,
those with finitely many values between `0` and `v(p)`, with the residue rings `O/𝔪ⁿ` in place of
the residue field.

Applied to `ℚ_p`, this gives Ax–Kochen's and Ershov's axiomatization: a valued field is
elementarily equivalent to `ℚ_p` if and only if it is henselian of characteristic `0`, with
residue field `𝔽_p`, `v(p)` least positive, and value group elementarily equivalent to `ℤ`. The
theory of `ℚ_p` is therefore complete, recursively axiomatized, decidable and model complete, with
the field of algebraic `p`-adic numbers as prime model. Applied to power series, for fields `k`,
`k'` of characteristic `0` it gives `k[[t]] ≡ k'[[t]]` as rings if and only if `k ≡ k'`. The
ring of algebraic power series `k[[t]]ᵃˡᵍ` is an elementary subring of `k[[t]]`. The theories of
`ℂ((t))` and of `ℝ((t))` are decidable. From Robinson's theorem, that algebraically closed fields
with a nontrivial valuation eliminate quantifiers, the roadmap derives that their completions are
fixed by the characteristics of the field and of the residue field.

The proofs go through Kaplansky's theory of immediate extensions. A pseudo-Cauchy sequence is a
well-ordered sequence whose successive distances eventually strictly decrease. Every one has a
limit in some immediate extension, which changes neither the residue field nor the value group.
A field is maximal when it has no proper immediate extension. In residue characteristic `0`,
henselian fields are algebraically maximal, and maximal immediate extensions are unique up to
isomorphism. These are the facts that let an isomorphism
between small subfields of two saturated valued fields extend by one element, which is what a
back-and-forth argument needs.

The roadmap builds on SaturationAndQuantifierElimination, which supplies saturated elementary
extensions, back-and-forth families, the quantifier elimination tests, the theory of `ℤ`-groups
and the passage to decidability. It builds on LocalFieldsRamificationPartII, which supplies the
henselization of a valued field and the composition and coarsening of valuations, and on Mathlib's
valuation subrings, henselian local rings and Witt vectors, and on RigidAnalyticGeometry, which
supplies quantifier elimination for algebraically closed valued fields. It feeds two planned
roadmaps: PadicallyClosedFields, whose model theory of `p`-adically closed fields of `p`-rank `d`
rests on the finitely ramified case, and CiFieldsAndArtinsConjecture, which uses the fixed-prime
theory of `ℚ_p` beside the asymptotic transfer of LogicAndDefinabilityInNumberTheory.

Layer 0 fixes the language and interprets the residue field and the value group. Layer 1 treats
algebraically closed valued fields. Layer 2 builds pseudo-Cauchy sequences and maximal fields, and Layer 3
henselian fields and the uniqueness of maximal immediate extensions. Layer 4 constructs
cross-sections and angular components in saturated models. Layer 5 proves the AKE theorems:
residue characteristic `0`, then unramified, then finitely ramified. Layer 6 draws the
consequences.

## Conventions

- **Valued fields.** As in LocalFieldsRamificationPartII: a valued field is a field `K` with a
  Mathlib `ValuationSubring K`, written `V` or `O`. The residue field is
  `IsLocalRing.ResidueField V`, written `k`. The value group `Γ` is the group of units of
  Mathlib's `ValuationSubring.ValueGroup`, written multiplicatively with `|x| ≤ 1` on `V`.
  Statements quoted in additive notation from the literature are translated: `v(x) ≥ 0` becomes
  `|x| ≤ 1`, and `v(p)` least positive becomes `|p|` greatest below `1`. An extension of valued
  fields `(L, W)/(K, V)` has `W.comap (algebraMap K L) = V`. Henselian means
  `HenselianLocalRing V`.
- **Characteristics.** Equicharacteristic `0` means `char k = 0`, which forces `char K = 0`. Mixed
  characteristic `(0, p)` means `char K = 0` and `char k = p`. Such a field is *unramified* when
  `|p|` is the largest value below `1`, and *finitely ramified* when only finitely many values lie
  in `[|p|, 1)`; their number is the ramification index `e`.
- **The language.** `valLang` is van den Dries's `L_val`: `Language.ring` together with one binary
  relation symbol `∣`. A valued field `(K, V)` is a `valLang`-structure with Mathlib's ring
  structure and `x ∣ y :↔ ∃ a ∈ V, a * x = y`. `V` is recovered as `{x | 1 ∣ x}`. A Mathlib
  `ValuativeRel K` is the same datum: `x ≤ᵥ y` holds exactly when `y ∣ x`.
- **Residue field and value group as structures.** `k` is a `Language.ring`-structure through
  Mathlib's `compatibleRingOfRing`. `Γ` is an `orderedGroup`-structure, SaturationAndQuantifierElimination's
  multiplicative language of ordered groups. Elementary equivalence `K ≡ K'` is
  `K ≅[valLang] K'`, and similarly `k ≅[Language.ring] k'` and `Γ ≅[orderedGroup] Γ'`.
- **Saturation without the continuum hypothesis.** Elementary equivalence is always proved by a
  back-and-forth family of partial isomorphisms between `ℵ₁`-saturated elementary extensions, in
  the sense of SaturationAndQuantifierElimination Layer 1. No statement assumes CH, and no proof
  constructs a full isomorphism of saturated models.
- **Pseudo-Cauchy sequences.** The predicates of 2.1 are defined for every linearly ordered index
  type. The theorems about them assume an index type without a largest element, and those of
  Kaplansky's theory (2.2–2.3) a well-ordered one.

## Layer 0: the language of valued fields

### 0.1 The language and the theory of valued fields

`valLang`, `valStructure K V`, and `Theory.valuedField` (a proposed name, as are
`Theory.henselianValuedField` and `Theory.acvf` below): the field axioms of Mathlib's
`Theory.field` together with van den Dries's axioms (VD1)–(VD5) for a valuation divisibility
(van den Dries Def. 3.26). The bridge, in both directions: a model of `Theory.valuedField` is a
field with the valuation subring `{x | 1 ∣ x}`, inducing the given relation, and every valued field
is a model (van den Dries Lem. 3.27(i)–(ii)). Embeddings of `valLang`-structures between valued
fields are exactly the field embeddings `f` with `W.comap f = V`. The language and the
valuation-ring axioms are those of RigidAnalyticGeometry §8.2, with the same reading of `∣`; the Lean
carriers `valLang`, `valStructure` and `Theory.valuedField`, and the bridge to Mathlib's
`ValuationSubring`, are targets here.

`Theory.henselianValuedField` adds, for each `n`, the sentence asserting Hensel's lemma for monic
polynomials of degree `n` with coefficients in `V` (van den Dries Def. 1.6). Its models are the
henselian valued fields. The theories `T_{0,0}` (equicharacteristic `0`: `1 ∣ n⁻¹` for all
`n ≥ 1`), `T_{0,p}` (mixed characteristic `(0, p)`) and `T_{0,p,e}` (finitely ramified with index
`e`) are recursively axiomatized extensions.

**Checks.**

- `ℤ_(p) ⊆ ℚ` gives a valued field that is not a model of `Theory.henselianValuedField`: for odd
  `p` choose an integer `a ≡ 1 mod p` that is not a rational square. Then `X² − a` has the simple
  root `1` modulo `p` and no root in `ℚ`.
- `ℚ_p`, `k((t))` and `k[[t]] ⊆ k((t))` are henselian (Tau Ceti `IsAdicComplete.henselianLocalRing`).
- `V = {x | 1 ∣ x}` (`mem_iff_dvd_one`, which unfolds the definition).

### 0.2 Interpretation of the residue field and the value group

For every ring formula `φ(x₁, …, xₙ)` there is a `valLang`-formula `φᵏ(y₁, …, yₙ)` such that in
every valued field, for `a₁, …, aₙ ∈ V`, `K ⊨ φᵏ(a)` if and only if `k ⊨ φ(ā)`, with `ā` the
residues. For every `orderedGroup`-formula `ψ(x₁, …, xₙ)` there is a `valLang`-formula
`ψᵛ(y₁, …, yₙ)` such that, for `a₁, …, aₙ ∈ Kˣ`, `K ⊨ ψᵛ(a)` if and only if `Γ ⊨ ψ(|a₁|, …, |aₙ|)`.
Both translations are uniform in the valued field and computable on the codes of formulas
(RandomGraphs' `boundedCode`, as in SaturationAndQuantifierElimination's conventions). In
`Suggested.lean` they are `exists_residueSentence` and `exists_valueGroupSentence`, with the value
group `valueGroup V`. The construction relativizes quantifiers to `V`
(respectively to `Kˣ`), and replaces `=` by congruence modulo the maximal ideal (respectively by
`x ∣ y ∧ y ∣ x`), and `≤` on `Γ` by `∣`.

Consequences: `K ≡ K'` implies `k ≡ k'` and `Γ ≡ Γ'`. An elementary extension of valued fields
induces elementary extensions of residue fields and of value groups.

**Checks.**

- For `φ = ∃ x, x² + 1 = 0`, `φᵏ` holds in `ℚ₅` and fails in `ℚ₃`.
- The value-group sentence "there is a least element greater than `1`" translates to a sentence
  true in `ℚ_p` and false in the Puiseux field `⋃ₙ ℂ((t^{1/n}))`.

### Dependencies

Mathlib `Language.ring`, `compatibleRingOfRing`, `Theory.field`, `ValuationSubring`,
`ValuationSubring.ValueGroup`, `IsLocalRing.ResidueField`, `HenselianLocalRing`; Tau Ceti
`IsAdicComplete.henselianLocalRing`; SaturationAndQuantifierElimination Layers 3.1 and 4.1.

## Layer 1: algebraically closed valued fields

`Theory.acvf` is `Theory.valuedField` together with Mathlib's `Theory.ACF` axioms and
nontriviality `∃ x, ¬ 1 ∣ x`: the theory ACVF of RigidAnalyticGeometry §8.2. That roadmap owns,
as its target, the conjugacy under `Aut(Kᵃ/K)` of the prolongations of a valuation to an algebraic
closure, the extension of valued-field embeddings to relative algebraic closures and along one
transcendental element, and Robinson's theorem: ACVF eliminates quantifiers (its steps (i)–(iv);
van den Dries Cor. 3.16, Lemmas 3.21–3.23, Thm. 3.29). This layer uses that theorem, read for
`Theory.acvf` in `valLang`, and builds on it:

- *Finite and algebraic extensions.* `[k_L : k_K]·[Γ_L : Γ_K] ≤ [L : K]` (van den Dries
  Prop. 3.19), and for `L = Kᵃ` the residue field is an algebraic closure of `k_K` and the value
  group a divisible hull of `Γ_K` (Cor. 3.20).
- The general bound `rk_ℚ(Γ_L/Γ_K) + trdeg(k_L/k_K) ≤ trdeg(L/K)` is the Abhyankar inequality of
  LocalFieldsRamificationPartII §5.3.
- *Completions.* For `(a, b)` equal to `(0, 0)`, `(0, p)` or `(p, p)`, the theory `ACFval(a, b)`
  of algebraically closed nontrivially valued fields with `char K = a` and `char k = b` is
  complete (van den Dries Cor. 3.34; `elementarilyEquivalent_of_isAlgClosed`). These are all the
  completions of `Theory.acvf`.
- *Definable sets in one variable.* Every subset of `K` definable with parameters in a model of
  `Theory.acvf` is a finite Boolean combination of balls (van den Dries Cor. 3.32), and a finite
  disjoint union of Swiss cheeses: balls with finitely many smaller balls removed (Prop. 3.33).

**Checks.**

- The algebraic closure of `ℚ_p` with its unique valuation and `ℂ_p` are models of `ACFval(0, p)`,
  hence elementarily equivalent. They are not isomorphic, since only the second is complete.
- `ℂ` with the trivial valuation is not a model: nontriviality fails.
- The Puiseux field over `ℂ` is a model of `ACFval(0, 0)` (van den Dries Application 4.24).

### Dependencies

Mathlib `Theory.ACF`, `AlgebraicClosure`; RigidAnalyticGeometry §8.2;
SaturationAndQuantifierElimination §2.4; Layer 0.

## Layer 2: pseudo-Cauchy sequences and maximal fields

### 2.1 Pseudo-Cauchy sequences

`IsPseudoCauchy V a`, for `a : ι → K` with `ι` linearly ordered: there is
`i₀` with `|a_k − a_j| < |a_j − a_i|` for `i₀ ≤ i < j < k`. `IsPseudoLimit V a x`: `|x − a_i|` is
eventually strictly decreasing. API (van den Dries §4.1):

- for `ι` without a largest element: if `x` is a pseudolimit of `a`, then `y` is one exactly when
  `|x − y| < |x − a_i|` for all large `i` (van den Dries Lem. 4.1), and a sequence with a
  pseudolimit is pseudo-Cauchy;
- in an immediate extension every element outside `K` is a pseudolimit of a pseudo-Cauchy sequence
  in `K` without pseudolimit in `K` (van den Dries Lem. 4.2);
- the values `|a_i|` are eventually constant or eventually strictly decreasing (Cor. 4.4);
- for a nonconstant polynomial `f`, `f(a_i)` is pseudo-Cauchy for `i` large, and `|f(a_i)|` is eventually
  constant or eventually strictly decreasing (Prop. 4.7, Cor. 4.8).

A pseudo-Cauchy sequence is of *algebraic type* over `K` if some polynomial `f` has `|f(a_i)|`
eventually strictly decreasing, and of *transcendental type* otherwise. Its *minimal polynomial* is
a monic such polynomial of least degree.

### 2.2 Kaplansky's theorems

- *Transcendental type* (van den Dries Thm. 4.9). A pseudo-Cauchy sequence of transcendental type
  without pseudolimit in `K` has a pseudolimit `x` in an immediate simple transcendental extension
  `K(x)`. Any pseudolimit in any extension generates an isomorphic one over `K`.
- *Algebraic type* (van den Dries Thm. 4.10). For a pseudo-Cauchy sequence of algebraic type
  without pseudolimit in `K`, with minimal polynomial `f`, a root `x` of `f` gives an immediate
  extension `K(x)` in which `x` is a pseudolimit.

### 2.3 Maximal fields

`(K, V)` is *maximal* when it has no proper immediate extension, and *algebraically maximal* when
it has no proper immediate algebraic extension. API:

- maximal if and only if every pseudo-Cauchy sequence has a pseudolimit in `K` (van den Dries
  Cor. 4.12);
- every valued field has an immediate maximal extension (Cor. 4.14), by Krull's cardinality bound
  on immediate extensions;
- algebraically maximal if and only if every pseudo-Cauchy sequence of algebraic type has a
  pseudolimit in `K` (Lem. 4.15, Cor. 4.16);
- algebraically maximal fields are henselian (Lem. 4.17, Cor. 4.18);
- Hahn fields are maximal: for a field `k` and an ordered abelian group `Γ`, Mathlib's
  `HahnSeries Γ k` with Tau Ceti's multiplicative valuation `HahnSeries.valuation` (Mathlib's
  additive form is `HahnSeries.addVal`) is maximal (van den Dries Cor. 4.13). The
  valuation subring of `HahnSeries Γ k` and its identification with residue field `k` and value
  group `Γ` are targets here.

**Checks.**

- In `ℚ` with the `p`-adic valuation, the partial sums of `∑ pⁿ` form a pseudo-Cauchy sequence with
  pseudolimit `1/(1 − p)`. In `ℚ_p`, every pseudo-Cauchy sequence indexed by `ℕ` converges.
- In the Puiseux field `⋃ₙ ℂ((t^{1/n}))` the partial sums `aₙ = ∑_{m ≤ n} t^{1 − 1/m}` form a
  pseudo-Cauchy sequence. A pseudolimit would agree with `aₙ` below the exponent `1 − 1/(n+1)` for
  every `n`, so its exponents would have unbounded denominators; hence there is none. In the Hahn
  field `ℂ((t^ℚ))` the series `∑ t^{1 − 1/m}`, whose support is well-ordered, is one. So the
  Puiseux field is not maximal, though it is algebraically closed.

### Dependencies

Mathlib `ValuationSubring.valuation`, `HahnSeries`, `HahnSeries.addVal`, `Cardinal`; Tau Ceti
`HahnSeries.valuation`; Layer 0.

## Layer 3: henselian fields and uniqueness

### 3.1 Hensel configurations

`f, a` is in *Hensel configuration* when `f'(a) ≠ 0` and either `f(a) = 0` or `|f(a)| < |f'(a)|²`
with the root bound of van den Dries Def. 4.19. In a henselian field, `f` then has a unique root in
the corresponding ball (Lem. 4.20).

### 3.2 Henselian is algebraically maximal

Let `(K, V)` be of equicharacteristic `0`. The finitely ramified case of 5.8 does not pass through
3.2–3.4: its embedding step is Basarab's own.

- For a pseudo-Cauchy sequence `a` and `f` with `f(aᵢ)` tending to `0` and no derivative `f⁽ʲ⁾`,
  `j ≥ 1`, tending to `0`, the pair `f, aᵢ` is eventually in Hensel configuration, and every
  henselian extension has a unique such root `b` with `aᵢ` pseudoconverging to `b` (van den Dries
  Prop. 4.21).
- `K` is henselian if and only if it is algebraically maximal (Cor. 4.22).
- In equicharacteristic `0`, `K` is algebraically closed if and only if it is henselian with
  algebraically closed residue field and divisible value group (Cor. 4.23).

### 3.3 Henselization

The henselization `Kʰ` of LocalFieldsRamificationPartII §1.3, with its universal property and its
immediacy. Under the hypotheses of 3.2: every immediate henselian algebraic extension of `K` is a
henselization (van den Dries Thm. 4.27). An immediate algebraically maximal algebraic extension is
`K`-isomorphic to `Kʰ` by a unique isomorphism (Cor. 4.28).

### 3.4 Uniqueness of maximal immediate extensions

Under the hypotheses of 3.2:

- any two immediate maximal extensions of `K` are isomorphic over `K` (van den Dries Cor. 4.29);
- an immediate maximal extension of `K` embeds over `K` into every `|Γ|⁺`-saturated henselian
  extension of `K` (Lem. 4.30). This is the extension step of the back-and-forth in Layer 5.

### 3.5 Hahn fields as maximal fields

Let `K` be maximal of equicharacteristic `0`. If `k×` and `Γ` are divisible, `K` is isomorphic to
the Hahn field `HahnSeries Γ k` by an isomorphism inducing the identity on `k` and on `Γ`
(van den Dries Lem. 4.31, Cor. 4.32). The same holds when `Γ` is a free abelian group.

**Checks.**

- The ring of algebraic power series `k[[t]]ᵃˡᵍ`, with `k` of characteristic `0`, is the
  henselization of `k[t]_{(t)}` and is not maximal: `∑ t^{n!}` is a limit of a pseudo-Cauchy
  sequence in it with no limit there.
- Let `k` be algebraically closed of characteristic `p` and `K` the perfect hull of `k(t)` with
  the `t`-adic valuation. A root of `X^p − X − 1/t` generates an immediate extension of `K` of
  degree `p` with a unique prolongation (Kuhlmann 2010, Example 4.16). Unique prolongation makes it
  linearly disjoint from the henselization `Kʰ`, and the compositum is immediate over `Kʰ`. So
  `Kʰ` is henselian and not algebraically maximal, and the hypothesis of 3.2 cannot be dropped.

### Dependencies

LocalFieldsRamificationPartII §1.3; Mathlib `HenselianLocalRing`, `HahnSeries`; Layers 2 and 0.

## Layer 4: liftings, cross-sections and angular components

- *Lifting the residue field.* A henselian local ring with residue field of characteristic `0`
  contains a subfield mapping isomorphically onto the residue field (van den Dries Thm. 2.9).
- *Cross-sections in elementary extensions.* A cross-section is a group homomorphism
  `s : Γ → Kˣ` with `|s(γ)| = γ`. A partial cross-section on a pure subgroup extends to a
  cross-section of an elementary extension (van den Dries Prop. 5.4). Every valued field has an
  elementary extension with a cross-section (Cor. 5.5). An `ℵ₁`-saturated valued field has one
  (van den Dries Lemma 7.9), through the `ℵ₁`-saturated pure-injectivity of Prop. 7.7 and Cor. 7.8.
- *Angular components.* An angular component map is a multiplicative `ac : K → k` with
  `ac(0) = 0` that restricts to the residue map on units of `V`. A cross-section gives one,
  `ac(x) = res(x / s(|x|))`, so every valued field has an elementary extension with an angular
  component map (van den Dries Cor. 5.18).

The angular-component language and its relative elimination are LogicAndDefinabilityInNumberTheory's
(§§1.1–1.3). Here angular components are only data on saturated models, used inside the proofs of
Layer 5.

**Checks.**

- On `k((t))`, `s(γ) = t^n` for `γ = |t|ⁿ` is a cross-section, and the angular component is the
  leading coefficient.
- On `ℚ_p`, `s(|p|ⁿ) = pⁿ` is a cross-section, and the angular component of `pⁿu` is the residue of
  `u`.

### Dependencies

Mathlib `HenselianLocalRing`; SaturationAndQuantifierElimination Layer 0; Layer 0.

## Layer 5: the AKE theorems

### 5.1 Good maps

For valued fields `K`, `K'` with cross-sections and liftings, a *good substructure* is a subfield
`E` containing the lifted residue field, closed under the cross-section, with countable value group
(van den Dries §5.3). A *good map* is a valued-field isomorphism `E ≅ E'` of good substructures
compatible with fixed isomorphisms of the residue fields and of the value groups (van den Dries
§5.3). In the elementary form used for the Equivalence Theorem, the residue and value-group maps
are partial elementary maps instead of isomorphisms (van den Dries §5.5).

### 5.2 The Equivalence Theorem

Let `K`, `K'` be henselian of equicharacteristic `0`. Then every good map is a partial elementary
map between `K` and `K'` (van den Dries Thm. 5.21). The proof passes to `ℵ₁`-saturated
elementary extensions and shows that the good maps with small domain form a back-and-forth family
(SaturationAndQuantifierElimination Layer 1). The extension step uses Layer 3.4 and the
transcendental extensions of Layer 2.2.

### 5.3 AKE in equicharacteristic 0

- `K ≅[valLang] K'` if and only if `k ≅[Language.ring] k'` and `Γ ≅[orderedGroup] Γ'`, for
  henselian `K`, `K'` of equicharacteristic `0` (van den Dries Thm. 5.1, Cor. 5.22;
  `elementarilyEquivalent_iff_of_charZero`).
- For every `valLang`-sentence `σ` there are ring sentences `ρ₁, …, ρₘ` and ordered-group
  sentences `τ₁, …, τₘ` such that, in every henselian valued field of equicharacteristic `0`,
  `σ` holds if and only if some `ρᵢ` holds in `k` and `τᵢ` holds in `Γ` (van den Dries Cor. 5.17).
  When `Γ ≅ ℤ`, one ring sentence suffices (Cor. 5.16).
- Every henselian `K` of equicharacteristic `0` is elementarily equivalent to the Hahn field
  `HahnSeries Γ k` (van den Dries Cor. 5.12).

### 5.4 Elementary extensions in equicharacteristic 0

If `(K, V) ⊆ (L, W)` is an extension of henselian valued fields of equicharacteristic `0`, and the
induced embeddings `k_K ↪ k_L` and `Γ_K ↪ Γ_L` are elementary, then `K ↪ L` is elementary in
`valLang` (van den Dries Cor. 5.23, with Cor. 5.18 to remove the angular components).

### 5.5 Witt vectors

On Mathlib's `WittVector p k` (`𝕎 k`) for a perfect field `k` of characteristic `p`, with
`WittVector.isDiscreteValuationRing`:

- *Teichmüller representatives.* A complete local ring with perfect residue field of
  characteristic `p` has a unique multiplicative section of the residue map (van den Dries
  Thm. 6.1), and its `p`-adic expansions (Cor. 6.2). Tau Ceti's `TauCeti.teichmuller` is the case
  of a finite residue field.
- `𝕎 k` is a complete discrete valuation ring with uniformizer `p` and residue field `k`
  (van den Dries Thm. 6.10).
- *Universal property.* A strict local `p`-ring is a complete discrete valuation ring `A` with
  maximal ideal `pA` and perfect residue field `k_A`. For such an `A` and a field embedding `k → k_A` there is a
  unique ring map `𝕎 k → A` lifting it (van den Dries Thm. 6.11), and its consequence for valuation
  subrings of `𝕎 k` (Lem. 6.12).
- `FractionRing (𝕎 k)` is a henselian unramified valued field of mixed characteristic with residue
  field `k` and value group `Multiplicative ℤ`.

### 5.6 Coarsening

For `K` of mixed characteristic `(0, p)`, let `Δ` be the convex subgroup of `Γ` generated by `|p|`.
The coarsening of `V` by `Δ` (LocalFieldsRamificationPartII §5.1) is a valuation of
equicharacteristic `0`, henselian when `V` is (van den Dries Lem. 7.13). Its residue field carries
the induced valuation with value group `Δ`, and when `K` is unramified (or finitely ramified) and
`ℵ₁`-saturated the corresponding valuation ring is a complete discrete valuation ring
(Lem. 7.14). For `K` unramified with perfect
residue field it is `𝕎 k` (Lem. 7.15, via 5.5).

### 5.7 AKE for unramified fields

Let `K`, `K'` be henselian, unramified, of mixed characteristic `(0, p)`, with perfect residue
fields.

- `K ≅[valLang] K'` if and only if `k ≅[Language.ring] k'` and `Γ ≅[orderedGroup] Γ'` (van den
  Dries Thm. 7.1; `elementarilyEquivalent_iff_of_unramified`). In particular a henselian unramified `K` with `[Γ : Γⁿ] = n` for all `n ≥ 1` is
  elementarily equivalent to `FractionRing (𝕎 k)`.
- If `K ⊆ K'` and the induced embeddings of residue fields and value groups are elementary, then
  `K ↪ K'` is elementary (Thm. 7.2).
- Every subset of `kⁿ` definable in `K` is definable in the field `k` (Thm. 7.3).

The proof combines the coarsening of 5.6 with the elementary Equivalence Theorem in
equicharacteristic `0` enriched by structure on the residue field (van den Dries Thms. 7.11–7.12),
the functorial back-and-forth on Witt vectors (Lemmas 7.16–7.17) and van den Dries Thm. 7.18. That
theorem is used in its corrected form, with the hypotheses that the residue field of `E` is
perfect and that the value group of `E` is the given one (van den Dries, final remarks to Ch. 7).

### 5.8 AKE for finitely ramified fields

Let `K`, `K'` be henselian of mixed characteristic `(0, p)` and finitely ramified, with maximal
ideals `𝔪`, `𝔪'` of their valuation rings `O`, `O'`. No condition is put on the residue fields. Then
`K ≅[valLang] K'` if and only if `O/𝔪ⁿ ≅[Language.ring] O'/𝔪'ⁿ` for every `n ≥ 1` and
`Γ ≅[orderedGroup] Γ'` (Basarab Cor. 3.2; `elementarilyEquivalent_iff_of_finitelyRamified`).

- `𝔪ⁿ` is the set of products of `n` elements of `𝔪`, so `O/𝔪ⁿ` is interpretable in `(K, V)`
  without parameters, uniformly in `n`, and the condition is necessary.
- The ramification index is read off the invariants: `e` is the `i` with `p ∈ 𝔪ⁱ \ 𝔪ⁱ⁺¹`, a
  sentence of `O/𝔪ᵉ⁺¹`.

The proof goes through Basarab's model-completeness criterion (Thm. 2.3.1): the theory of
henselian fields with prescribed theories of the `O/𝔪ⁿ` and of `Γ`, in `valLang` expanded by the
relations pulled back from the residue rings, is model complete when those theories are. The
embedding step is Lemmas 2.4.2–2.4.3, an extension of cross-section-preserving embeddings into a
pseudocomplete field along totally ramified extensions, through Layers 2 and 4. Completeness
(Thm. 3.1) follows by embedding any two models into one Hahn-series model built from the completion
of a `ℤ`-valued model (Serre, *Corps locaux* II §1) and Ershov's realization of maximal fields with
given residue field and value group. Saturation is SaturationAndQuantifierElimination Layer 0.

**Checks.**

- The residue field and the value group alone do not suffice when `e > 1`. `ℚ₂(√-2)` and
  `ℚ₂(π)` with `π² + 2π + 2 = 0` are complete, with residue field `𝔽₂`, value group `ℤ` and
  `e = 2`, but `∃ x, x² + 2 = 0` holds only in the first (Basarab §1). Both `O/𝔪³` are
  `(ℤ/4)[x]/(x² − 2, 2x)`, while `n = 4` separates them: `y² = −2` has the solution `x` in
  `(ℤ/4)[x]/(x² + 2)` and none in `(ℤ/4)[π]/(π² + 2π + 2)`.
- For `e = 1`, `𝔪 = pO` and the statement covers imperfect residue fields, where 5.7 does not
  apply.

### Dependencies

SaturationAndQuantifierElimination Layers 0, 1 and 3; LocalFieldsRamificationPartII §§1.3, 5.1;
Mathlib `WittVector`, `WittVector.isDiscreteValuationRing`, `WittVector.teichmuller`,
`FractionRing`; Tau Ceti `TauCeti.teichmuller`; Layers 2–4.

## Layer 6: consequences

### 6.1 The theory of `ℚ_p`

- A valued field is elementarily equivalent to `ℚ_p` if and only if it is henselian of
  characteristic `0` with residue field isomorphic to `𝔽_p`, unramified, and with value group
  elementarily equivalent to `Multiplicative ℤ` (Ax–Kochen II, Thm. 2; Ershov 1965, Thm. 2;
  `elementarilyEquivalent_padic_iff`, with `ℤ_p` as `padicValuationSubring p`). This
  follows from 5.7 and SaturationAndQuantifierElimination §3.3.
- These axioms are recursively enumerable, so `Th(ℚ_p, ℤ_p)` is decidable (Ax–Kochen II, Thm. 3;
  Ershov 1965, Thm. 3), through SaturationAndQuantifierElimination §4.3.
- The theory is model complete (Ax–Kochen II, Thm. 4; Ershov 1965, Thm. 1;
  `realize_embedding_of_elementarilyEquivalent_padic`), and the field
  `ℚ_p ∩ ℚᵃˡᵍ` of algebraic `p`-adic numbers, the henselization of `(ℚ, ℤ_(p))`, is its prime model
  and an elementary substructure of `ℚ_p` (Ershov 1965, proof of Thm. 2).
- The valuation ring is definable in the ring language: `ℤ_p = {x | ∃ y, y² = 1 + p x²}` for odd
  `p`, and `ℤ₂ = {x | ∃ y, y³ = 1 + 2 x³}`. Consequently `Th(ℚ_p)` in `Language.ring` is
  decidable as well.

### 6.2 Power series

For fields `k`, `k'` of characteristic `0`:

- `k((t)) ≅[valLang] k'((t))` if and only if `k ≅[Language.ring] k'`, and `PowerSeries k
  ≅[Language.ring] PowerSeries k'` if and only if `k ≅[Language.ring] k'` (van den Dries 1.1;
  Ax–Kochen III, Thm. 4; the second is `elementarilyEquivalent_powerSeries_iff`);
- for every ring sentence `σ` there is a ring sentence `ρ` with `k[[t]] ⊨ σ ↔ k ⊨ ρ` for every `k`
  of characteristic `0` (van den Dries 1.2);
- `k[[t]]ᵃˡᵍ ≼ k[[t]]` as rings (van den Dries 1.3);
- if `Th(k)` is decidable, so are `Th(k((t)))` in `valLang` and `Th(k[[t]])` in `Language.ring`
  (Ax–Kochen III, Thm. 6). In particular `ℂ((t))`, `ℝ((t))` and `ℚ_p((t))` have decidable
  theories (Ershov 1965, Thm. 3, for the first two).

### 6.3 The unramified analogue

For a perfect field `k` of characteristic `p`, `FractionRing (𝕎 k) ≅[valLang] FractionRing (𝕎 k')`
if and only if `k ≅[Language.ring] k'`. If `Th(k)` is decidable, so is `Th(FractionRing (𝕎 k))`
(Ershov 1965b, Thms. 2″ and 4″).

**Checks.**

- `ℚ_p` and `ℚ_p(√p)` are henselian with residue field `𝔽_p` and value groups isomorphic to `ℤ`,
  yet not elementarily equivalent, since `p` is a square in one. Here `ℚ_p(√p)` is ramified, so
  5.7 does not apply. AKE in mixed characteristic needs the ramification hypothesis.
- `ℚ` with `ℤ_(p)` and `ℚ_p` have the same residue field and value group but are not elementarily
  equivalent (0.1, Check): henselianity cannot be dropped.
- `ℚ₂` and `𝔽₂((t))` are not elementarily equivalent as rings, since `−1` is a square in the
  second only. Equicharacteristic `p` and mixed characteristic are not comparable by these
  theorems.
- `ℂ((t))` and `ℚᵃˡᵍ((t))` are elementarily equivalent by 6.2. `ℂ[[t₁, t₂]]` and
  `ℚᵃˡᵍ[[t₁, t₂]]` are not (van den Dries, Introduction). AKE is a statement about valuation
  rings.
- In the definition of `ℤ_p` for odd `p`, `x = p⁻¹` gives `1 + p⁻¹`, of odd valuation `−1`, hence
  not a square.

### Dependencies

SaturationAndQuantifierElimination Layers 3 and 4; LocalFieldsRamificationPartII §1.3; Mathlib
`Padic`, `Padic.mulValuation`, `PowerSeries`, `LaurentSeries`; Layers 0 and 5.

## Downstream consumers

PadicallyClosedFields and CiFieldsAndArtinsConjecture are planned roadmaps of the same series.

- **PadicallyClosedFields.** Layer 5.8 and Layer 6.1, for the completeness of the theory of
  `p`-adically closed fields of `p`-rank `d` and the classification of its completions; Layers 2–3
  for `p`-adic closures.
- **CiFieldsAndArtinsConjecture.** Layer 6.1 for the fixed-prime theory of `ℚ_p`.
- **LogicAndDefinabilityInNumberTheory.** Its §1.4 is the angular-component form of 5.3. The two
  are stated independently, in different languages.

## Scope and ownership

This roadmap owns: the Lean carriers of the one-sorted language of valued fields and its
interpretations of the residue field and value group; the completions and one-variable definable
sets of algebraically closed valued fields; pseudo-Cauchy
sequences, Kaplansky's theorems, maximal and algebraically maximal fields and the uniqueness of
maximal immediate extensions; liftings, cross-sections and angular components as structure on
saturated models; the Equivalence Theorem and AKE in equicharacteristic `0`, in unramified and in
finitely ramified mixed characteristic; and the consequences of Layer 6.

Boundaries:

- **LogicAndDefinabilityInNumberTheory** owns the Denef–Pas language, angular-component
  structures, Pas's relative elimination of valued-field quantifiers (its §1.3), the AKE principle
  in that language (§1.4), the asymptotic transfer between `ℚ_p` and `𝔽_p((t))` (§1.5) and
  Macintyre's elimination over a fixed finite extension of `ℚ_p` (§2.2). Van den Dries's relative
  elimination (Cor. 5.24) and its consequences for definable sets (Cor. 5.25) are that roadmap's
  and are not restated here.
- **LocalFieldsRamificationPartII** owns henselization, prolongations and coarsening.
- **RigidAnalyticGeometry** (§8.2) owns the theory ACVF, the conjugacy of prolongations to an
  algebraic closure, and Robinson's quantifier elimination for ACVF.
- **SaturationAndQuantifierElimination** owns the model-theoretic toolkit.
- **PadicallyClosedFields** (planned) owns `p`-valuations, `p`-adic closures and Macintyre's elimination for
  `p`-adically closed fields.
- Positive residue characteristic beyond the unramified and finitely ramified cases (tame and
  separably tame fields, the existential theory of `𝔽_q((t))`) is outside this roadmap.

## Exact supplier contracts

### From SaturationAndQuantifierElimination

`IsSaturated`, `exists_elementaryEmbedding_isSaturated` (0.3), `isSaturated_aleph_one_product`
(0.4), `IsBackAndForth` with `IsBackAndForth.realize_iff` and
`IsBackAndForth.elementarilyEquivalent` (1.1–1.2), `hasQuantifierElimination_of_isSaturated_extend`
(2.3), `IsModelComplete` (2.5), `orderedGroup` and `orderedGroupStructure` (3.1), `IsPresburgerGroup` and
`elementarilyEquivalent_multiplicative_int_iff` (3.3), and the decidability of complete recursively
enumerable theories (4.3).

### From RigidAnalyticGeometry

§8.2: the language of rings with `∣` read `x ∣ y ⟺ |y| ≤ |x|`, the axioms of ACVF, the conjugacy of
prolongations of a valuation to an algebraic closure (its step (iii)), and the theorem that ACVF
eliminates quantifiers.

### From LocalFieldsRamificationPartII

§1.3: the henselization `Kʰ` of a valued field, its universal property, immediacy, functoriality,
and the characterization of henselian fields. §5.1: the composite `V ∘ R` and the coarsening of a
valuation subring, with the exact sequence of value groups.

### From Mathlib

`FirstOrder.Language.ring`, `FirstOrder.Ring.compatibleRingOfRing`, `Theory.field`, `Theory.ACF`,
`ValuationSubring`, `ValuationSubring.ValueGroup`, `ValuationSubring.valuation`,
`ValuationSubring.mapOfLE`, `IsLocalRing.ResidueField`, `HenselianLocalRing`, `HahnSeries`, `HahnSeries.addVal`, `WittVector`,
`WittVector.isDiscreteValuationRing`, `WittVector.teichmuller`, `FractionRing`, `Padic`,
`Padic.mulValuation`, `PowerSeries`, `LaurentSeries`, `ValuativeRel`.

### From Tau Ceti

`IsAdicComplete.henselianLocalRing` (`TauCeti/RingTheory/Henselian/Basic.lean`),
`TauCeti.teichmuller` (`TauCeti/RingTheory/Henselian/Teichmuller.lean`), `HahnSeries.valuation`
(`TauCeti/RingTheory/HahnSeries/Valuation.lean`),
`FirstOrder.Language.group` and `TauCeti.Group.structureOfGroup`
(`TauCeti/ModelTheory/Algebra/Group/Basic.lean`).

## References

- J. Ax and S. Kochen, Diophantine problems over local fields I, *Amer. J. Math.* 87 (1965),
  605–630; II. A complete set of axioms for p-adic number theory, *ibid.*, 631–648; III. Decidable
  fields, *Ann. of Math.* 83 (1966), 437–456.
- Yu. L. Ershov, On elementary theories of local fields, *Algebra i Logika* 4:2 (1965), 5–30.
  Cited: Thms. 1–3.
- Yu. L. Ershov, On the elementary theory of maximal normed fields, *Dokl. Akad. Nauk SSSR* 165:1
  (1965), 21–23. Cited: Thms. 2″, 4″.
- L. van den Dries, Lectures on the model theory of valued fields, in *Model Theory in Algebra,
  Analysis and Arithmetic*, LNM 2111, Springer, 2014, 55–157. Cited: 1.1–1.3, Def. 1.6, Thm. 2.9,
  Cor. 3.16, Prop. 3.19, Cor. 3.20, Lemmas 3.21–3.23, Cor. 3.25, Def. 3.26, Lem. 3.27, Thm. 3.29,
  Cor. 3.32, Prop. 3.33, Cor. 3.34, §4, Thm. 5.1, §§5.1–5.5, Cors. 5.12, 5.16–5.18, 5.22–5.23,
  Thm. 5.21, Ch. 6, Ch. 7.
- A. Robinson, *Complete Theories*, North-Holland, 1956.
- I. Kaplansky, Maximal fields with valuations, *Duke Math. J.* 9 (1942), 303–321.
- S. A. Basarab, Some model theory for henselian valued fields, *J. Algebra* 55 (1978), 191–212.
  Cited: §1, Thm. 2.3.1, Lemmas 2.4.2–2.4.3, Thm. 3.1, Cor. 3.2.
- F.-V. Kuhlmann, A classification of Artin–Schreier defect extensions and characterizations of
  defectless fields, *Illinois J. Math.* 54 (2010), 397–448. Cited: Example 4.16.
