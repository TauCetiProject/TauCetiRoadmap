# Roadmap: ramification of complete discretely valued fields

**Summary.** This roadmap continues
[LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md) past the
nonarchimedean local fields it treats. It builds the finite ramification package over every
field complete for a discrete valuation, in equal and mixed characteristic and with a residue
field that need not be finite: the lower filtration on the integral closure, the lower index,
Hilbert's different formula, the Herbrand functions and the upper numbering with Herbrand's
quotient theorem and tower transitivity, and the Hasse–Arf theorem for abelian extensions with
separable residue extension, together with the residue-enlargement, proalgebraic-unit and
graded-norm targets its proof needs. Over a perfect residue field it then builds the absolute
upper filtration of the absolute Galois group, with inertia and wild inertia as its terms at `0`
and `0+`, the transition function `ψ_(L/K)` of a finite separable extension with the
open-subgroup identity, and the comparison with the completed maximal unramified extension. On a
nonarchimedean local field each object is the completed roadmap's, and the agreement is a target
here. The package is the ramification theory that `p`-adic Hodge theory, integral `p`-adic Hodge
theory and the unit-filtration form of local class field theory consume over bases such as
`F̄_p((t))` and `Frac W(F̄_p)`.

| Layer | Title | What it builds |
|---|---|---|
| 3a | Ramification over complete discretely valued fields | integer rings and the lower filtration on the local-ring carrier, the lower index and Hilbert's formula, Herbrand functions and the upper numbering, Hasse–Arf with its residue-enlargement, proalgebraic-unit and graded-norm inputs, the finite-local-field agreement |
| 4a | The absolute upper filtration over a perfect residue field | `G_K^u` with its finite projections, inertia and wild inertia, `ψ_(L/K)` and the open-subgroup identity, completed maximal unramified base change |

The layer labels continue those of the completed roadmap, whose Layers 0–4 (local fields and
their finite extensions, the unit filtration, unramified extensions and Frobenius, ramification
over local fields, the tame quotient of the absolute Galois group) are its suppliers here. Every
reference below of the form Layer 0–4 or §3.x is to that roadmap.

## Scope and ownership

This roadmap owns, over an arbitrary complete discretely valued field `K` with integer ring `A`
and residue field `k`:

- 3a: the identification of the integral closure `B` of `A` in a finite Galois extension `L` as
  a complete discrete valuation ring free over `A`, the formula `[L : K] = ef`, integral
  monogenicity and the computation of the lower index at a generator; the normality,
  antitonicity and eventual triviality of the lower groups `G_i` on Tau Ceti's local-ring
  carrier, the subgroup formula, the graded embeddings of `G_0/G_1` and `G_i/G_(i+1)` and their
  consequences for `G_0` and `G_1`; Hilbert's different formula; the Herbrand functions `φ`, `ψ`
  and the upper groups of a finite group acting on a local ring, with their analytic properties,
  Herbrand's theorem, tower transitivity, the intersection formula and the correspondence of
  jumps; Hasse–Arf for abelian `G` and separable residue extension, with the residue-enlargement
  construction, the proalgebraic unit groups with their norm-kernel components, and the graded
  norms with filtered norm-kernel components, all over an algebraically closed residue field; and
  the agreement of every one of these objects with the completed roadmap's on a nonarchimedean
  local field.
- 4a: over a perfect residue field, the absolute upper filtration `G_K^u` and `G_K^(u+)` of
  `Field.absoluteGaloisGroup K`, its closedness, normality, antitonicity, finite projections and
  separation, the identification of `G_K^0` with inertia and of `G_K^(0+)` with wild inertia; the
  transition function `ψ_(L/K)` of a finite separable extension, its independence of the Galois
  closure, the tower law, the open-subgroup identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` and the
  integral formula; the completion `K′` of the maximal unramified extension, the equivalence of
  finite separable extensions of `K^ur` and of `K′`, the isomorphism `G_(K′) ≅ I_K`, and the
  preservation of `e`, the different, the lower and upper groups and the absolute upper groups
  under base change to `K′`.

The completed roadmap owns everything on nonarchimedean local fields: the normalized valuation,
`e` and `f`, the unit filtration, unramified extensions and Frobenius, the lower and upper
ramification groups, Herbrand functions and the different there, wild inertia, the tame
character and the Iwasawa presentation of the tame quotient. This roadmap defines its objects on
the general carrier and proves that they restrict to those; it defines nothing a second time on
local fields.

The following belong elsewhere and are consumed, where needed, under their owners' names.
ClassFieldTheory owns local reciprocity, local duality, finite-group Tate cohomology and the
reciprocity–filtration compatibilities. LocalGaloisGroups owns the maximal pro-`p` quotient of the
absolute Galois group and its presentation. ReductiveGroups Layer 3 owns finite-type algebraic
groups, their closed subgroups, normal quotients and identity components;
SchemeAndStackFoundations §0.24 owns perfection in characteristic `p`; AdicSpacesPartII §R0.19.9
owns the generic pro-category with its limit–colimit Hom formula. PadicPeriodRings owns the
geometric reciprocity construction on the proalgebraic unit groups built in §3a.3, with its
finite-isogeny fundamental group, reciprocity map and Sen tower estimates. ReductiveGroupsPartII
§RG2.0.4 owns the completed maximal unramified extension `Breve E` of a nonarchimedean local field
`E`, its extended arithmetic Frobenius and its fixed-field results; §4a.3 proves that this
roadmap's `K′` is `Breve E` on such a field. Upper ramification of a local field itself, `G_K^u` for a nonarchimedean
local field, is this roadmap's: the completed roadmap stops at finite levels and at the tame
quotient.

## Conventions

Throughout, `A` is a complete discrete valuation ring (`IsDiscreteValuationRing A` and
`IsAdicComplete (IsLocalRing.maximalIdeal A) A`) with fraction field `K` and residue field
`k = IsLocalRing.ResidueField A`; `L/K` is a finite Galois extension with group `G`; and `B` is
the integral closure of `A` in `L`, on which `G` acts by `A`-algebra automorphisms with
`Algebra.IsInvariant A B G`. Valuations are normalized additively by `v_K(Kˣ) = v_L(Lˣ) = ℤ`,
`e = e(L/K)` is the ramification index and `f = f(L/K)` the residue degree. The residue
extension `IsLocalRing.ResidueField B / k` is assumed separable wherever a statement says so;
this holds for every `L` when `k` is perfect, and Layer 4a assumes `k` perfect throughout.

The lower filtration is Tau Ceti's filtration of a group acting on a local ring:
`TauCeti.IsLocalRing.ramificationGroup G B i` for `i : ℤ`, equal to
`Ideal.ramificationGroup G (IsLocalRing.maximalIdeal B) i` for `i ≥ 0`
(`TauCeti.IsLocalRing.ramificationGroup_natCast`), its real-indexed form
`TauCeti.IsLocalRing.ramificationGroupReal G B u`, which is `G_(⌈u⌉)`, and the lower index
`TauCeti.IsLocalRing.lowerIndex B σ = min_x v_L(σx − x)`. Upper numbering is the one functorial
under quotients, `G^(φ(u)) = G_u`, and jumps are the `u` with `G^v ≠ G^u` for every `v > u`.
Arithmetic Frobenius is primary and geometric Frobenius is its inverse. `G_K` is Mathlib's
`Field.absoluteGaloisGroup K` with the Krull topology, and its finite levels are the
`M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`. `K^ur` is the compositum of the finite
subextensions of the algebraic closure with `e = 1`, `I_K` its fixing subgroup and `P_K` the
inverse limit of the finite groups `G_1`; `K′` is the completion of `K^ur`.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `IsDiscreteValuationRing`, `IsDiscreteValuationRing.addVal`, `IsAdicComplete`,
`Algebra.IsInvariant`, `differentIdeal` and `conductor_mul_differentIdeal`,
`Polynomial.IsEisensteinAt` with its irreducibility criterion, adic completion of a Noetherian
local ring, `intervalIntegral`, `IsGalois.normalAutEquivQuotient`, `Field.absoluteGaloisGroup`,
`FiniteGaloisIntermediateField`, `IntermediateField.fixingSubgroup`, `AlgEquiv.restrictNormalHom`,
`InfiniteGalois.restrictNormalHom_continuous`, `UniformSpace.Completion` and
`IsKrasner.of_completeSpace_of_normal` (Krasner's lemma for a complete ultrametric base and a
normal extension).

Use Tau Ceti `TauCeti.IsLocalRing.ramificationGroup`, `TauCeti.IsLocalRing.ramificationGroupReal`,
`TauCeti.IsLocalRing.lowerIndex`, `TauCeti.IsLocalRing.ramificationGroup_natCast`,
`TauCeti.IsLocalRing.instNormalRamificationGroup`, `TauCeti.IsLocalRing.ramificationGroup_antitone`,
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut`,
`TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot`,
`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`,
`TauCeti.IsLocalRing.sum_addVal_smul_sub_eq_finsum_card_ramificationGroup_sub_one`,
`TauCeti.IsLocalRing.sum_min_lowerIndex_natCast`,
`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top`,
`TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top`, `TauCeti.inertiaSubgroup` and
`TauCeti.fixingSubgroup_fixedField`. These are the carriers on which Layer 3a is stated; none of
them assumes a finite residue field, and the local-field objects below are their instances.
For the agreement of §4a.3 on a local field, use Tau Ceti `TauCeti.maximalUnramifiedExtension`
and `IntermediateField.le_maximalUnramifiedExtension_iff`.

### From TauCetiRoadmap.LocalFieldsRamification

The completed roadmap supplies, on nonarchimedean local fields, the integer-ring and
residue-field structures of a finite extension (Layer 0), local monogenicity, the lower
ramification groups `TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i`, defined as
`TauCeti.IsLocalRing.ramificationGroup (L ≃ₐ[K] L) 𝒪[L] i`, the quotient embeddings of
`G_0/G_1` and `G_i/G_(i+1)`, the different, the Herbrand objects
`TauCeti.LocalFieldsRamification.herbrandOrderIso`, `herbrand`, `inverseHerbrand`, `psiNat` with
`coe_psiNat` and `psiNat_tower`, and `TauCeti.LocalFieldsRamification.upperRamificationGroup`
with `UpperJump` (Layer 3), and the ambient model of the absolute Galois group with `inertia`,
`wildInertia`, the maximal unramified extension and the tame quotient (Layer 4). Those Herbrand
objects assume `IsNonarchimedeanLocalField` on both fields, `ValuativeExtension K L`,
`Module.Finite K L` and `IsGalois K L`; §3a.2 builds the same functions on the local-ring
carrier and proves that they agree with these under those hypotheses, and §4a.1 proves that
`G_K^0` and `G_K^(0+)` are `inertia` and `wildInertia` there. The completed roadmap's Layer 3
Hasse–Arf, `hasseArf` (every `UpperJump K L u` of a finite abelian Galois extension of
nonarchimedean local fields is an integer), is consumed and not restated: §3a.3 proves the theorem
without residue finiteness and records in a Check that, through §3a.2's agreement, it recovers
`hasseArf` on a nonarchimedean local field.

### From ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII

ReductiveGroups Layer 3 supplies finite-type closed subgroups, normal quotients and identity
components of algebraic groups; SchemeAndStackFoundations §0.24 supplies perfection in
characteristic `p`; AdicSpacesPartII §R0.19.9 supplies the generic pro-category and its
limit–colimit Hom formula. §3a.3's proalgebraic unit groups are pro-objects in the category of
perfect quasialgebraic groups built from these three suppliers; the finite-stage subgroup,
quotient and component constructions of §3a.3 are the supplied ones.

ReductiveGroupsPartII §RG2.0.4 supplies, for a nonarchimedean local field `E`, the completed
maximal unramified extension `Breve E`, the uniform completion of
`TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)` for its unique extended valuation,
with its discreteness, its algebraically closed residue field, the preservation of uniformizers
of `E`, the extended arithmetic Frobenius and its fixed field `E`. §4a.3 consumes the field and
proves that its own `K′` is `Breve E` on such a field; the Frobenius and fixed-field results
stay that roadmap's.

## How to read the build

Layer 3a is stated for a finite group acting on a local ring and specialized to the integral
closure `B` of `A` in `L`; each section ends with its *Needs* and with Checks that distinguish
the general statement from its local-field instance, usually on `F̄_p((t))` or `Frac W(F̄_p)`,
where the residue field is infinite, and on `ℚ_2(ζ_8)/ℚ_2`, where the completed roadmap already
fixes the answer. Layer 4a assumes a perfect residue field and works in `Field.absoluteGaloisGroup K`
through its finite levels. `Suggested.lean` states the two Layer 3a headlines on the general carriers,
Hilbert's different formula and the lower-numbering Hasse–Arf; the Herbrand objects of §3a.2 and
the Layer 4a objects are README targets whose carriers it does not yet have, and its module
docstring lists them.

## Layer 3a: ramification over complete discretely valued fields

The congruence definitions of the completed roadmap's Layer 3 need neither local compactness nor
a finite residue field. This layer builds the finite ramification package over every field
complete for a discrete valuation, in equal and mixed characteristic, in the setting of the
Conventions. Tau Ceti's Herbrand objects do not extend as they stand: they assume
`IsNonarchimedeanLocalField` on both fields, which forces local compactness and a finite residue
field, although their definitions use only the cardinalities of the lower groups. §3a.2 builds
them on the local-ring filtration, and the local-field functions are its instance
`G = L ≃ₐ[K] L`, `B = 𝒪[L]`.

**The perfect-residue Herbrand package.** For complete DVR fraction
fields with perfect residue field, this is the package of §§3a.1–3a.3 and §§4a.1–4a.3, in both
characteristics, including their comparisons with the finite-local-field API. Its sources are
Serre, *Local Fields*, IV §§1–3 and V §7, Theorem 1; Serre 1961, n° 3.1 and n° 3.4–3.5; and
Brinon–Conrad, Exercise 1.4.4(3), with the equal-characteristic argument in §4a.3. Its absolute
group is Mathlib's `Field.absoluteGaloisGroup`. The section numbers specify the named package.

| Export | Sections |
|---|---|
| integer rings, lower filtration, lower index and different | §3a.1 |
| finite Herbrand functions, upper numbering, quotients and towers | §3a.2 |
| full Hasse–Arf | §3a.3 |
| absolute upper filtration, finite projections, inertia and wild inertia | §4a.1 |
| finite separable transition functions and open-subgroup identity | §4a.2 |
| completed maximal unramified comparison | §4a.3 |

**Checks.**

- Over `F̄_p((t))`, `y^p − y = t⁻¹` has lower and upper break `1` and different `2(p − 1)`.
- Over `Frac W(F̄_p)`, for odd `p`, adjoining `ζ_p` has degree `p − 1`, lower and upper break
  `0`, and different `p − 2`.
- On `ℚ_2(ζ_8)/ℚ_2`, the package gives lower jumps `1, 3` and upper jumps `1, 2`, agreeing with
  the completed roadmap's Layer 3 rather than identifying the two numberings.

### 3a.1 Integer rings, the lower filtration and the different

`B` is a complete discrete valuation ring, free of rank `[L : K]` over `A`; the valuation of `L`
is the unique one extending that of `K`, `v_L = e·v_K` on `K`, and `[L : K] = ef`. If the
residue extension is separable, there is `x ∈ B` with `Algebra.adjoin A {x} = ⊤`. For every
`x ∈ B` with `Algebra.adjoin A {x} = ⊤` and every `σ ∈ G`, `lowerIndex B σ = v_L(σx − x)`,
with or without separability. The groups `G_i` are normal in `G` and antitone in `i`,
`G_i = G` for `i ≤ −1`, `G_0` is the inertia group (the kernel of the action on
`IsLocalRing.ResidueField B`), and `G_i = 1` for all large `i`. For a subgroup `H = Gal(L/K′)`,
`H_i = H ∩ G_i`. For separable residue extension and a uniformizer `π_L`, reduction of
`σ(π_L)/π_L` embeds `G_0/G_1` in `(IsLocalRing.ResidueField B)ˣ`, and for `i ≥ 1` reduction of
`(σ(π_L) − π_L)/π_L^(i+1)` embeds `G_i/G_(i+1)` in the additive residue field. The ratio first
gives a uniformizer-independent map to `U(L,i)/U(L,i+1)`, where `U(L,i) = 1 + 𝔪_B^i`; identifying
that quotient with the additive residue field uses `π_L`. Hence `G_0/G_1` is cyclic of order prime to the residue
characteristic, `G_1` is the Sylow `p`-subgroup of `G_0` when the residue characteristic is
`p > 0`, and `G_1 = 1` when it is zero. Hilbert's formula holds: the different exponent `d(L/K)`,
the `v_L`-valuation of Mathlib's `differentIdeal A B`, is `Σ_(i ≥ 0) (#G_i − 1)`. Its
ideal-valued form, `differentIdeal A B = 𝔪_B^(Σ_(i ≥ 0) (#G_i − 1))`, is
`differentIdeal_eq_pow_maximalIdeal_of_separable_residue` in `Suggested.lean`. There it is
stated for a discrete valuation ring `B` on which `G` acts faithfully with invariants a discrete
valuation ring `A`, without completeness of `A`: `Algebra.IsInvariant` makes `B` integral over
`A`, so `B`, being integrally closed, is the integral closure of `A` in `Frac B`, which is finite
Galois over `Frac A` with group `G`, and `B` is finite over `A`. Integral monogenicity holds for
any finite faithful extension of discrete valuation rings with separable residue extension,
without completeness, and the lower index at a generator needs only the generator; these are the
pinned `TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top` and
`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top`, and are not restated.

(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), II §2, Proposition 3; III §6,
Proposition 12; IV §1, Propositions 2 and 4.) (Jean-Pierre Serre, [Sur les corps locaux à corps
résiduel algébriquement clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos),
n° 3.1, Proposition 1 with its Corollaries 1 and 2, and Proposition 2, printed pp. 126–127, for
totally ramified `L/K`.)

*Proof.* Completeness of `A` gives the unique prolongation of the valuation and makes `B` a
complete discrete valuation ring, free over `A` because `L/K` is separable; computing the
dimension of `B/𝔪_A B = B/𝔪_B^e` over `k` gives `[L : K] = ef`. Monogenicity uses the
separability of the residue extension: a lift of a primitive element of the residue extension,
corrected by a uniformizer when needed, generates `B` over `A`. Tau Ceti's
`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top` then computes the lower
index at `x`, and normality, antitonicity, the identification of `G_0` and eventual triviality
are `TauCeti.IsLocalRing.instNormalRamificationGroup`,
`TauCeti.IsLocalRing.ramificationGroup_antitone`,
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut` and
`TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot`; the subgroup formula is
`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`. The graded embeddings are the quotient
embeddings of the completed roadmap's Layer 3, whose proof uses only the residue field of `B`; a
finite subgroup of `(IsLocalRing.ResidueField B)ˣ` is cyclic of order prime to `p`, and the
additive group is killed by `p`, or torsion-free in residue characteristic zero. For Hilbert's
formula, Mathlib's `conductor_mul_differentIdeal` at a generator `x` (whose conductor is `⊤`)
gives `differentIdeal A B = (f′(x))` for the minimal polynomial `f` of `x`, and
`v_L(f′(x)) = Σ_(σ ≠ 1) v_L(σx − x) = Σ_(i ≥ 0) (#G_i − 1)` by the counting identity
`TauCeti.IsLocalRing.sum_addVal_smul_sub_eq_finsum_card_ramificationGroup_sub_one`.

*Needs:* Mathlib `IsDiscreteValuationRing`, `IsAdicComplete`, `Algebra.IsInvariant`,
`differentIdeal` and `conductor_mul_differentIdeal`; Tau Ceti
`TauCeti.IsLocalRing.ramificationGroup`, `TauCeti.IsLocalRing.lowerIndex` and the counting
identity above; the completed roadmap's Layer 3 (local monogenicity, the quotient embeddings and
the different, for the local-field instance).

**Checks.**

- For every perfect `k` of characteristic `p`, including `k = F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has `v_L(y) = −1`, the uniformizer `y⁻¹`, and a generator `σ` with
  `σ(y) = y + 1` moves it by `−1/(y(y + 1))`, of valuation `2`. So `G_0 = G_1 = G`, `G_2 = 1` and
  `d = 2(p − 1)`, over an infinite residue field when `k = F̄_p`. At level `1`, the additive
  graded character of this generator is `−1`, since
  `(σ(y⁻¹) − y⁻¹)/(y⁻¹)² = −y/(y + 1)`; the unscaled ratio instead reduces to `1`.
- For odd `p` and `K = Frac W(F̄_p)`, `((X + 1)^p − 1)/X` is Eisenstein, so `K(ζ_p)/K` is totally
  and tamely ramified of degree `p − 1`, with `G_0 = G`, `G_1 = 1` and `d = p − 2`.
- On `ℚ_2(ζ_8)/ℚ_2` the groups are those of the completed roadmap's Layer 3, `#G_0 = #G_1 = 4`,
  `#G_2 = #G_3 = 2`, `G_4 = 1`, and `d = 3 + 3 + 1 + 1 = 8`. A finite unramified `L/K` has
  `G_0 = 1` and `d = 0`.
- The separability hypothesis cannot be dropped. Over `K = F_p(s)((t))`, let `L = K(y)` with
  `y^p − y = s·t^(−p)` and put `z = ty`, so `z^p − t^(p−1) z = s`. The residue extension
  `F_p(s^(1/p))/F_p(s)` is purely inseparable of degree `p`, `e = 1`, `B = A[z]`, and the generator
  with `σ(z) = z + t` lies in `G_0` but not in `G_1`: `G_0/G_1` has order `p`, and `#G_0 ≠ e`.
- Monogenicity needs separability too. Over `K = F_p(s, u)((t))`, adjoin roots of
  `y₁^p − y₁ = s·t^(−p)` and `y₂^p − y₂ = u·t^(−p)`. For `(i, j) ∈ F_p² ∖ {0}`, the element
  `(is + ju)·t^(−p)` is not of the form `a^p − a` with `a ∈ K`: such an `a` has valuation `−1`,
  and `is + ju` would be the `p`-th power of its leading coefficient, which it is not in
  `F_p(s, u)`. So `L/K` is Galois with group `C_p × C_p`. The elements `z_i = t·y_i`
  satisfy `z₁^p − t^(p−1) z₁ = s` and `z₂^p − t^(p−1) z₂ = u`, so the residue field of `B` is
  `F_p(s^(1/p), u^(1/p))`, `f = p²` and `e = 1`. Every element of that residue field has its
  `p`-th power in `F_p(s, u)`, so it is not generated by one element, and no `x ∈ B` has
  `Algebra.adjoin A {x} = ⊤`.

### 3a.2 Herbrand functions and the upper numbering

For a finite group `G` acting on a local ring `S`, define the Herbrand function
`φ(u) = ∫_0^u #G_t / #G_0 dt` for `u ≥ −1`, with `G_t = ramificationGroupReal G S t`, as an order
automorphism of `TauCeti.LocalFieldsRamification.RamificationIndexDomain`, the interval `[−1, ∞)`,
with forward map `φ`, inverse `ψ` and upper groups `G^v = G_(ψ(v))`. Prove that `φ` is continuous,
strictly increasing, piecewise linear and concave, the identity on `[−1, 0]`, with
`φ(m) = (#G_1 + ⋯ + #G_m)/#G_0` at every integer `m ≥ 0`; that `ψ(n)` is a natural number for
every natural number `n`; the two inverse identities; and `G^(φ(u)) = G_u`. In the setting of
3a.1, with `S = B` and `φ_(L/K)`, `ψ_(L/K)` for these functions, prove:

- Herbrand's theorem: for `H` normal in `G`, `(G/H)^v = G^v H/H`, and its field form through
  Mathlib's `IsGalois.normalAutEquivQuotient` for `K′ = L^H`;
- tower transitivity: for `M/K` finite Galois and `L` intermediate with `L/K` Galois,
  `φ_(M/K) = φ_(L/K) ∘ φ_(M/L)` and `ψ_(M/K) = ψ_(M/L) ∘ ψ_(L/K)`;
- for the same tower, `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/L)^(ψ_(L/K)(v))` for `v ≥ −1`;
- `ψ` carries the jumps of the upper filtration to those of the lower one;
- agreement: for nonarchimedean local fields, `G = L ≃ₐ[K] L` and `S = 𝒪[L]`, these are
  `TauCeti.LocalFieldsRamification.herbrandOrderIso K L`,
  `TauCeti.LocalFieldsRamification.herbrand K L`,
  `TauCeti.LocalFieldsRamification.inverseHerbrand K L`,
  `TauCeti.LocalFieldsRamification.psiNat K L` and
  `TauCeti.LocalFieldsRamification.upperRamificationGroup K L` of the completed roadmap's
  Layer 3.

(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), IV §3, Proposition 14.)
(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.1, formula
(5) with properties a–d′ of the functions φ and ψ, printed p. 127, and Propositions 3 and 4,
printed p. 128, for totally ramified `L/K`.)

*Proof.* The analytic facts are Tau Ceti's proofs in
`TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean`: the integrand is the antitone step function
`#G_t/#G_0`, equal to `1` on `(−1, 0]` and bounded below by `1/#G_0`. This positive lower bound
makes the integral tend to infinity for every finite action. Eventual equality with `1/#G_0`
holds for the faithful separated DVR action of 3a.1. These arguments carry over to the
local-ring carrier, and agreement holds because
`TauCeti.LocalFieldsRamification.lowerRamificationGroup` is defined as the local-ring filtration.
Integrality of `ψ(n)` is the finite-sum formula together with Lagrange's theorem, as in
`TauCeti.LocalFieldsRamification.coe_psiNat`. For Herbrand's theorem, the lower index of a class
`s ∈ G/H` is `(1/e(L/K′)) Σ_(σ ∈ s) lowerIndex B σ`, computed at generators of `B` over `A` and
of the integer ring of `K′` over `A` (3a.1); the truncated count
`TauCeti.IsLocalRing.sum_min_lowerIndex_natCast` turns this into Herbrand's lemma
`(G/H)_(φ_(L/K′)(u)) = G_u H/H`. Comparing the slopes of both sides of the lemma gives tower
transitivity, and the lemma with transitivity gives the theorem in upper numbering. The
intersection formula follows from `H_i = H ∩ G_i` of 3a.1 and transitivity.

*Needs:* 3a.1; Mathlib `intervalIntegral` and `IsGalois.normalAutEquivQuotient`; Tau Ceti
`TauCeti.IsLocalRing.ramificationGroupReal` and `TauCeti.IsLocalRing.sum_min_lowerIndex_natCast`;
the completed roadmap's Layer 3 (Herbrand functions and the upper numbering, for the local-field
instance).

**Checks.**

- For the Artin–Schreier extension `y^p − y = t⁻¹` of `k((t))`, `k` perfect, `φ(u) = u` for
  `−1 ≤ u ≤ 1` and `φ(u) = 1 + (u − 1)/p` for `u ≥ 1`; the only upper jump is `1`, and
  `ψ(2) = p + 1`.
- For `K(ζ_p)/K` with `K = Frac W(F̄_p)` and `p` odd, `φ(u) = u/(p − 1)` for `u ≥ 0`, and
  `ψ(1) = p − 1` is an integer although `φ(1) = 1/(p − 1)` is not.
- If `G_0 = 1`, then `φ` and `ψ` are the identity and `G^v = 1` for every `v > −1`.
- For the trivial action of `C_2` on `ℤ_2`, all lower groups are `C_2` and the density is
  constantly `1`, not eventually `1/2`; nevertheless `φ` and `ψ` are the identity.
- For `M = ℚ_2(ζ_8)` and `L = ℚ_2(√2)` over `K = ℚ_2`, `ψ_(L/K)(3) = 4` and
  `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`, while `ψ_(L/K)(ψ_(M/L)(3)) = ψ_(L/K)(5) = 8`: composing in the
  other order is wrong.

### 3a.3 Hasse–Arf over a separable residue extension

If `G` is abelian, every jump of the upper filtration `v ↦ G^v` of §3a.2 on `B`, that is every
`u` with `G^v ≠ G^u` for all `v > u`, is an integer. By the finite-sum formula of 3a.2 this says:
whenever `G_j ≠ G_(j+1)` for an integer `j ≥ 0`, `#G_0` divides `#G_1 + ⋯ + #G_j`. That
lower-numbering form is stated in `Suggested.lean` as `hasseArf_dvd_sum_card_ramificationGroup`,
on Mathlib's discrete valuation rings with `Algebra.IsInvariant A B G` and Tau Ceti's
`TauCeti.IsLocalRing.ramificationGroup`, without completeness of `A`. No finiteness of the
residue field is assumed. On a nonarchimedean local field the theorem is the completed roadmap's
Layer 3 `hasseArf`, which is consumed, not restated; the Checks record how the general statement
recovers it.

(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), V §7, Theorem 1.)
(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.4,
Propositions 6 and 7, printed pp. 132–134, and n° 3.5, Proposition 8 with its Corollary 1, printed
pp. 135–136, for totally ramified abelian `L/K` with algebraically closed residue field.)
(Alexander Grothendieck, [Éléments de géométrie algébrique III, première
partie](#source-grothendieck-éléments-de-géométrie-algébrique-iii-première-partie), Chapitre 0,
(10.3.1) and the completion remark after its proof, printed pp. 20–23, for the extension of the
residue field.)

The following prerequisites are targets of this section.

**Residue enlargement and preservation of ramification.** For a complete DVR `R` with residue
field `κ` and a specified algebraic closure `κ̄/κ`, construct a faithfully flat local map
`R → R′` to a complete DVR with residue field `κ̄` and `𝔪_(R′) = 𝔪_R R′`. Every uniformizer of
`R` stays a uniformizer. For a totally ramified finite Galois extension `E/Frac R` with group
`H`, a uniformizer `π_E` with Eisenstein polynomial `f` gives a field
`E′ = (Frac R′)[X]/(f)` of the same degree, integral closure `R′[π_E]`, and the same Galois group.
Prove that the normalized values of `σπ_E − π_E`, the lower groups, and the Herbrand functions
are preserved: the Eisenstein generator remains a uniformizer, and expansion in its integral
power basis preserves the valuation of each displacement. Sources: EGA III, Chapitre 0,
(10.3.1), its associated-graded formula (10.3.1.5) and completion remark, printed pp. 20–23;
§3a.1's monogenic lower-index formula (Serre, *Local Fields*, IV §1, Proposition 1).

**Checks.**

- For algebraically closed `κ`, `R′ = R` satisfies the target.
- For `R = κ[[t]]`, the map to `κ̄[[t]]` keeps the uniformizer `t`; in characteristic `p`, the
  Artin–Schreier extension of §3a.1 keeps its lower break `1` and different `2(p − 1)`.
- A totally ramified tame extension of degree `e` retains `G_0` of order `e` and `G_1 = 1`;
  an unramified extension of degree greater than one splits after this base change, so the
  field-and-degree assertion requires total ramification.

**Proalgebraic units and norm-kernel components.** For a complete discretely valued field `F`
with algebraically closed residue field `κ`, construct the commutative proalgebraic unit group
`U_F` from the unit groups of its truncated valuation rings, using their perfect
quasialgebraic structures in positive residue characteristic. In residue characteristic zero,
construct a coefficient-field section `κ → 𝒪_F` and use its induced section in each finite
extension `E`. Construct closed principal-unit subgroups, kernels, images, quotients and identity
components `H⁰`, with component group `π₀(H) = H/H⁰`. Supply right exactness of `π₀` and its
compatibility with inverse limits. The unit groups and all principal-unit subgroups are
connected. For finite Galois `E/F` with group `H`, the norm is a surjective proalgebraic morphism
`U_E → U_F`. Put `V = ker N` and `I_H U_E = ⟨σ(a)/a : σ ∈ H, a ∈ U_E⟩`. Prove `V⁰ = I_H U_E` and
the canonical isomorphism `H/[H,H] ≅ π₀(V)`, sending `σ` to the component of `σ(π_E)/π_E`,
independently of `π_E`. Sources: Serre 1961, §1, n° 1.1–1.6, printed pp. 106–113, and §2,
n° 2.1–2.3, especially Propositions 2–3 and their corollaries, printed pp. 118–120. This target
includes the specialized quasialgebraic and proalgebraic group and component-group theory used
by those statements. Use ReductiveGroups Layer 3 for finite-type closed subgroups, normal
quotients and identity components; SchemeAndStackFoundations §0.24 for perfection in
characteristic `p`; and AdicSpacesPartII §R0.19.9 for the generic pro-category and its
limit–colimit Hom formula. Identify perfect quasialgebraic groups with the perfections of the
relevant smooth finite-type groups, and realize the proalgebraic unit groups as pro-objects in
that category. The finite-stage subgroup, quotient and component constructions must agree with
the supplied ones, and the principal-unit filtration must agree with the kernels of the
truncation maps. The exactness and inverse-limit assertions for components above belong to this
specialized package. These comparisons do not require geometric reciprocity, which
PadicPeriodRings builds on these unit groups.

**Checks.**

- For `E = F`, `V = 1` and `π₀(V) = 1`; the constant pro-object has the supplied finite-type
  component group, and the identity perfection comparison is the identity.
- For `F = κ((t))`, `U_F/U_F¹ ≅ κˣ` and `U_Fⁿ/U_F^(n+1) ≅ (κ,+)` for `n ≥ 1` are connected,
  although a norm kernel can be disconnected.
- In characteristic `p`, for `E/F` given by `y^p − y = t⁻¹`, `π₀(V) ≅ C_p`: connectedness of
  `U_E` and `U_F` does not imply connectedness of the norm kernel.

**Graded norms and filtered norm-kernel components.** Keep the preceding algebraically closed
residue field and a finite Galois `E/F` with group `H`, without assuming `H` abelian. Write
`U_Eⁿ = 1 + 𝔪_Eⁿ` for `n ≥ 1` and `U_E⁰ = U_E`. For every integer `s ≥ 0`, prove
`N(U_E^(ψ(s))) = U_Fˢ` and `N(U_E^(ψ(s)+1)) = U_F^(s+1)`, and exactness as quasialgebraic groups of
`1 → H_(ψ(s))/H_(ψ(s)+1) → U_E^(ψ(s))/U_E^(ψ(s)+1) → U_Fˢ/U_F^(s+1) → 1`,
where the first map is the uniformizer ratio and the second is induced by the norm.
Put `V_s = V ∩ U_E^(ψ(s))`. Construct the exact sequence of quasialgebraic groups
`1 → U_E^(ψ(s)+1)/U_E^(ψ(s+1)) → V_s/V_(s+1) → H_(ψ(s))/H_(ψ(s)+1) → 1`:
the first map lifts a unit by multiplying by an element of `U_E^(ψ(s+1))` to make its norm
one, and the last map uses the preceding graded norm kernel. Prove
`π₀(V_s/V_(s+1)) ≅ H_(ψ(s))/H_(ψ(s)+1)`, the bound
`#π₀(V_s) ∣ ∏_(n ≥ s) [H_(ψ(n)) : H_(ψ(n)+1)]` (only finitely many factors differ from one),
and the surjection `δ_s : H_(ψ(s)) → π₀(V_s)` given by `σ(π_E)/π_E`.
For abelian `H`, prove `H_(ψ(s)+1) = H_(ψ(s+1))`, that `δ_s` is an isomorphism, and that
`π₀(V_s) → π₀(V)` is injective. Sources: Serre 1961, n° 3.4, Propositions 6–7 with their
corollaries, printed pp. 132–135, and n° 3.5, Proposition 8(i)–(iii), printed p. 135.

**Checks.**

- For `E = F`, every graded norm is the identity and all `V_s` are trivial.
- For a tame cyclic extension of degree `e`, the depth-zero norm has kernel `μ_e`, while every
  positive-depth graded norm is bijective; `π₀(V_0) ≅ C_e` and `π₀(V_s) = 1` for `s ≥ 1`.
- In characteristic `p`, for `y^p − y = t⁻¹`, the depth-one graded norm has kernel `C_p`;
  `π₀(V_1) ≅ C_p` and `π₀(V_2) = 1`. Its additive norm polynomial is surjective over `κ = F̄_p`,
  whereas over `F_p` an additive polynomial with kernel of order `p` is not surjective on residue
  points.

*Proof.* Completeness of `A` may be assumed: `B` is finite over `A` (§3a.1) and local, so
`B ⊗_A Â` is the completion `B̂`, again a discrete valuation ring; `G` acts on it with invariants
`Â` because `Â` is flat over `A`, and `B̂/𝔪_(B̂)^(i+1) = B/𝔪_B^(i+1)` keeps the residue fields and
every `G_i`. A jump at `−1` is an integer. For `v ≥ 0` the upper groups of `G` are those of its
inertia group `G_0 = Gal(L/K_0)`, where `K_0` is the maximal unramified subextension: both have
the same lower groups `G_i`, `i ≥ 0`, hence the same Herbrand function on `[0, ∞)`. Because the
residue extension is separable, `L/K_0` is totally ramified, so `L = K_0(π_L)` for a root `π_L` of
an Eisenstein polynomial. Let `A′` be the completion of a flat local `A_0`-algebra, `A_0` the
integer ring of `K_0`, whose maximal ideal is generated by `𝔪_(A_0)` and whose residue field is
an algebraic closure of `k`; it exists by EGA (10.3.1) and is a complete discrete valuation ring
with the same uniformizer. The Eisenstein polynomial stays Eisenstein over `A′`, so
`L′ = K′(π_L)` is a totally ramified Galois extension of `K′ = Frac A′` with group `G_0`, integer
ring `A′[π_L]` and the same values `v_L(σπ_L − π_L)`: the lower filtration, hence the upper one,
is unchanged. The proalgebraic and graded-norm targets give `π₀(V) ≅ G_0` in the abelian case.
Its order, together with the bound on `#π₀(V_0)`, forces `G_(ψ(s)+1) = G_(ψ(s+1))` for every
integer `s ≥ 0`: a strict inclusion would make the product of graded indices smaller than `#G_0`.
A lower jump `m` with nonintegral `φ(m)` would lie between `ψ(s)` and `ψ(s+1)` and contradict
that equality (Serre 1961, n° 3.5, Corollary 1 to Proposition 8).

*Needs:* 3a.1; 3a.2; this section's residue-enlargement, proalgebraic-unit and filtered
norm-kernel targets; Mathlib `Polynomial.IsEisensteinAt` and its irreducibility criterion, and
adic completion of a Noetherian local ring.

**Checks.**

- On `ℚ_2(ζ_8)/ℚ_2` the lower jumps are `1` and `3`, with `φ(1) = 4/4 = 1` and
  `φ(3) = (4 + 2 + 2)/4 = 2`. At the non-jump `j = 2` the quotient `(4 + 2)/4` is not an integer:
  divisibility is asserted only at jumps.
- For every perfect `k` of characteristic `p`, including `F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has its single upper jump at the integer `1`.
- A tamely ramified `L/K` with `G_0 ≠ 1` has its only nonnegative jump at `0`, and `L = K` has
  none.
- Commutativity cannot be dropped: for the quaternion extension of Serre's *Local Fields*, IV §3,
  Exercise 3, the upper jumps are not all integers.
- On a nonarchimedean local field, with `A = 𝒪[K]`, `B = 𝒪[L]` and `G = Gal(L/K)`, the residue
  extension is separable because the residue fields are finite; at each nonnegative lower jump `j`
  the divisibility statement and the finite-sum formula `φ(j) = (#G_1 + ⋯ + #G_j)/#G_0` make the
  corresponding upper jump integral, the jump at `−1` is integral already, and §3a.2's agreement
  of filtrations turns this into the completed roadmap's `hasseArf`. For `ℚ_2(ζ_8)/ℚ_2` the lower
  jumps `1, 3` give the upper jumps `1, 2`.
- The abstract filtration on `C_9` with `G_0 = G_1 = C_9`, `G_2 = ⋯ = G_5 = C_3` and `G_6 = 1`
  has `φ(5) = 1 + 4/3 = 7/3`, although the subgroup and Herbrand quotient have integral breaks
  `5` and `1`. It cannot be the ramification filtration of an abelian local-field extension:
  at the lower jump `5`, the sum `9 + 3 + 3 + 3 + 3 = 21` is not divisible by `#G_0 = 9`.
  Prime-degree integrality and tower transitivity alone do not imply Hasse–Arf.

### Examples

The two fields with infinite residue field `F̄_p` that run through the layer: the
Artin–Schreier extension `y^p − y = t⁻¹` of `F̄_p((t))`, with its break at `1` and different
exponent `2(p − 1)`, and the tame extension `Frac W(F̄_p)(ζ_p)` of `Frac W(F̄_p)`, with its break
at `0` and different exponent `p − 2`; and `ℚ_2(ζ_8)/ℚ_2`, on which every general statement must
return the completed roadmap's values.

### Dependencies

Mathlib and Tau Ceti as in the supplier contracts; the completed roadmap's Layers 0 and 3 for
the local-field instances, including its Layer 3 `hasseArf`; ReductiveGroups Layer 3,
SchemeAndStackFoundations §0.24 and AdicSpacesPartII §R0.19.9 for §3a.3's proalgebraic targets.

## Layer 4a: the absolute upper filtration over a perfect residue field

Keep the setting of Layer 3a and assume the residue field `k` perfect, of characteristic `p ≥ 0`,
so that every finite extension of `K` has separable residue extension. `G_K` is
`Field.absoluteGaloisGroup K` with the Krull topology, the ambient model of the completed
roadmap's Layer 4. Its finite levels are the `M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`,
each with integer ring the integral closure of `A` in `M` and with the filtrations of Layer 3a.

### 4a.1 The absolute upper filtration, inertia and wild inertia

For real `u ≥ −1` let `G_K^u` be the set of `σ ∈ G_K` whose restriction to every finite Galois
`M/K` lies in `Gal(M/K)^u`, and put `G_K^(u+) = closure(⋃_(w > u) G_K^w)`. Each `G_K^u` is a
closed normal subgroup, the family is antitone, restriction maps `G_K^u` onto `Gal(M/K)^u` for
every `M`, `G_K^(−1) = G_K`, and the intersection of all `G_K^u` is trivial. `G_K^0` is inertia `I_K`, the fixing subgroup of the
maximal unramified extension `K^ur`. `G_K^(0+)` is wild inertia `P_K`, the inverse limit of the
finite `G_1`; it is pro-`p` when `p > 0` and trivial when `p = 0`. On a nonarchimedean local
field, `G_K^0` and `G_K^(0+)` are the completed roadmap's `inertia` and `wildInertia`.

(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.1, the
paragraph after Proposition 3, printed p. 128.)

*Proof.* By Herbrand's theorem (3a.2), restriction maps `Gal(M′/K)^u` onto `Gal(M/K)^u` for
`M ⊆ M′`, so `G_K^u` is the inverse limit of these nonempty finite sets along surjections; it is
closed, and it maps onto each of them. Normality and antitonicity hold at every finite level. A
`σ ≠ 1` moves an element of some finite `M`, and `Gal(M/K)^u = 1` for large `u`. `Gal(M/K)^0` is
the inertia group of `M/K`, whose fixed field is the maximal unramified subextension of `M`, so
`σ ∈ G_K^0` exactly when `σ` fixes every finite unramified subextension. For small `w > 0`,
`Gal(M/K)^w = G_1(M/K)`, so `G_K^(0+)` and `P_K` are closed subgroups with the same image `G_1` in
every finite quotient, hence equal; each `G_1` is a `p`-group by 3a.1. On a nonarchimedean local
field these are the definitions of the completed roadmap's `inertia` (Tau Ceti's
`TauCeti.inertiaSubgroup`) and `wildInertia`.

*Needs:* 3a.1; 3a.2; the completed roadmap's Layer 4 (the ambient model, `inertia` and
`wildInertia`); Mathlib `Field.absoluteGaloisGroup`, `FiniteGaloisIntermediateField`,
`AlgEquiv.restrictNormalHom` and `InfiniteGalois.restrictNormalHom_continuous`.

**Checks.**

- The image of `G_(ℚ_2)^u` in `Gal(ℚ_2(ζ_8)/ℚ_2) = (ℤ/8)ˣ` is everything for `u ≤ 1`, `{1, 5}` for
  `1 < u ≤ 2`, and trivial for `u > 2`.
- If `k` is algebraically closed, then `K^ur = K` and `G_K = G_K^0 = I_K`.
- For odd `p` and `K = Frac W(F̄_p)`, the tame extension `K(ζ_p)/K` shows `G_K^(0+) ≠ G_K^0`: `I_K`
  maps onto `Gal(K(ζ_p)/K)`, of order `p − 1`, while `P_K` maps to `G_1 = 1`.

### 4a.2 Finite separable extensions: ψ_(L/K) and the open-subgroup identity

For a finite separable `L/K` inside `AlgebraicClosure K`, with `G_L ≤ G_K` the open subgroup
fixing `L`, and a finite Galois `M/K` containing `L`, define `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)` on
`[−1, ∞)` and `φ_(L/K)` its inverse. Prove:

- `ψ_(L/K)` does not depend on `M`, agrees with 3a.2 when `L/K` is Galois, is continuous, strictly
  increasing, piecewise linear and the identity on `[−1, 0]`, and `ψ_(N/K) = ψ_(N/L) ∘ ψ_(L/K)` for
  every finite separable `N ⊇ L`;
- the open-subgroup identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` for every `u ≥ −1`;
- `ψ_(L/K)(u) = (1/f) ∫_0^u [G_K : G_K^t G_L] dt` for `u ≥ 0`, with `f = f(L/K)`.

(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.1,
Proposition 4 and the Remarque after it, printed p. 128.) (Jean-Pierre Serre, [Local
Fields](#source-serre-local-fields), IV §1, Proposition 2.)

*Proof.* For `M ⊆ M′` both Galois over `K`, tower transitivity (3a.2) for `M′ ⊇ M ⊇ L` and for
`M′ ⊇ M ⊇ K` gives
`φ_(M′/L) ∘ ψ_(M′/K) = φ_(M/L) ∘ φ_(M′/M) ∘ ψ_(M′/M) ∘ ψ_(M/K) = φ_(M/L) ∘ ψ_(M/K)`, and
any two choices of `M` lie in a common one; the other properties follow from those of the
Galois functions. At a finite level `M`, the subgroup formula of 3a.1 gives
`Gal(M/K)^u ∩ Gal(M/L) = Gal(M/L)_(ψ_(M/K)(u))`, which is `Gal(M/L)^(ψ_(L/K)(u))` by the
definition of `ψ_(L/K)`; the open-subgroup identity is its limit over `M`. For the integral
formula, write `G = Gal(M/K)` and `H = Gal(M/L)`: by the identity
`G^t ∩ H = H^(ψ_(L/K)(t))`, away from the finitely many jumps the derivative of
`φ_(M/L) ∘ ψ_(M/K)` at `t` is `[G^0 : G^t] · #H^(ψ_(L/K)(t)) / #H^0`, which equals
`[G : G^t H]/f` because `#G^0/#H^0 = e(L/K) = [L : K]/f`.

*Needs:* 4a.1; 3a.1; 3a.2; Mathlib `IntermediateField.fixingSubgroup`; Tau Ceti
`TauCeti.fixingSubgroup_fixedField`.

**Checks.**

- For finite unramified `L/K`, `ψ_(L/K)(u) = u` and `G_K^u ∩ G_L = G_L^u`.
- For totally tamely ramified `L/K` of degree `e`, `ψ_(L/K)(u) = eu` for `u ≥ 0`, so
  `G_K^u ∩ G_L = G_L^(eu)`; for `L = K` both sides are `G_K^u`.
- For `K = ℚ_3` and `L = ℚ_3(ζ_3)`, `ψ_(L/K)(u) = 2u` for `u ≥ 0`. The extension
  `ℚ_3(ζ_9)/ℚ_3(ζ_3)` is cyclic of order `3` with upper jump `2`, so the image of `G_K^(3/2) ∩ G_L`
  in its Galois group is trivial while that of `G_L^(3/2)` is the whole group: the identity needs
  the shifted index `G_L^3`.

### 4a.3 Completed maximal unramified base change

Let `K′` be the completion of `K^ur` for the unique extension of the valuation. Then `K′` is
complete for a discrete valuation with `e(K′/K) = 1` and residue field an algebraic closure of
`k`. Prove that `L₀ ↦ L₀ ⊗_(K^ur) K′` is an equivalence from finite separable extensions of `K^ur`
to finite separable extensions of `K′`, so that restriction is a topological isomorphism
`G_(K′) ≅ I_K`. For a finite separable `L/K` and an embedding of `L` in a separable closure of
`K′`, put `L′ = LK′`; prove `e(L′/K′) = e(L/K)` and `d(L′/K′) = d(L/K)`, so the normalized
differents `d/e` agree. For `L/K` Galois, `Gal(L′/K′)` is identified with the inertia group
`G_0(L/K)`, with `G_i(L′/K′) = G_i(L/K)` for `i ≥ 0` and `G^v(L′/K′) = G^v(L/K)` for `v ≥ 0`;
under `G_(K′) ≅ I_K`, `G_(K′)^v` corresponds to `G_K^v` for every `v ≥ 0`. This holds in both
characteristics. The residue degree and the full Galois group of `L/K` are not preserved.

(Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](#source-brinonconrad-cmi-summer-school-notes-on-p-adic-hodge-theory), Exercise 1.4.4(3),
printed p. 10, and the proof of Lemma 13.1.6, printed p. 201, in mixed characteristic.)

*Proof.* `K^ur` carries the unique prolongation of the valuation (3a.1), so it is henselian, and it
is dense in `K′`. Krasner's lemma (Mathlib's `IsKrasner.of_completeSpace_of_normal`, applied in
a finite Galois extension of `K′` containing a primitive element of the given extension and the
roots of a nearby polynomial over `K^ur`, which supplies its `Normal` hypothesis) shows that a
finite separable extension of `K′` is generated by a root of a separable polynomial over `K^ur`
close to a defining polynomial, so the functor is essentially surjective; henselianity makes `K^ur`
separably closed in `K′`, so it is fully faithful. The argument uses only separability and
completeness, so it applies in equal characteristic as well. For `L/K` Galois with
`K_0 = L ∩ K^ur`, `L/K_0` is totally ramified, `L = K_0(π_L)` for an Eisenstein `π_L`, and the
Eisenstein polynomial stays Eisenstein over the integer ring of `K′` because `e(K′/K_0) = 1`.
Hence the integer ring of `L′` is generated by `π_L`, the values `v_L(σπ_L − π_L)` are unchanged,
and the lower filtration of `G_0(L/K) = Gal(L/K_0) ≅ Gal(L′/K′)`, the Herbrand function on
`[0, ∞)`, the upper groups at `v ≥ 0` and, by Hilbert's formula, the different agree. A finite
separable `L` is handled through a Galois closure, and the absolute statement is the limit over
`M`, by 4a.1.

*Needs:* 3a.1; 3a.2; 4a.1; Mathlib `UniformSpace.Completion`, `IsKrasner.of_completeSpace_of_normal`,
`Polynomial.IsEisensteinAt` and `differentIdeal`.

**Checks.**

- Completed maximal unramified base change of `ℚ_3(ζ_9)/ℚ_3` keeps `e = 6`, the lower groups
  `#G_0 = 6`, `#G_1 = #G_2 = 3`, `G_3 = 1`, the different `d = 9`, the normalized different
  `d/e = 3/2` and the upper jumps `0` and `1`.
- A finite unramified `L/K` becomes trivial over `K′`, keeping `G_0 = 1` and `d = 0`, while its
  Galois group and its residue degree are lost.
- For a finite residue field `K^ur` is not complete (Brinon–Conrad, Exercise 1.4.4(2), printed
  p. 10), so the comparison is made with `K′`, not with `K^ur`.

**Agreement with `Breve E` on a local field.** Let `E` be a nonarchimedean local field. Prove that
this roadmap's `K^ur` for `E` is `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`, the
union of the unramified extensions of every degree from the completed roadmap's Layer 2, and that
`K′` is ReductiveGroupsPartII §RG2.0.4's `Breve E` as a valued field: both are the uniform
completion of that intermediate field for the unique extension of the valuation of `E`. Under this
identification the discreteness of the valuation of `K′`, the algebraic closedness of its residue
field and `e(K′/E) = 1`, proved above on the general perfect-residue domain, are that section's
statements that the valuation of `Breve E` is discrete, that its residue field is algebraically
closed and that a uniformizer of `E` remains one of `Breve E`. This section owns the completed
field and these properties on the general domain; the Frobenius of `Breve E` and its fixed field
stay that roadmap's and are not used here.

(Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](#source-brinonconrad-cmi-summer-school-notes-on-p-adic-hodge-theory), Exercise 1.4.4(2)
and (3), printed p. 10, in mixed characteristic: `K^un` as the compositum of the finite unramified
subextensions with its unique valuation, and its completion as a complete discretely valued field
whose residue field is an algebraic closure of `k`.)

*Proof.* The residue field of `E` is finite, hence perfect, so a finite subextension of
`AlgebraicClosure E` has `e = 1` over `E` exactly when it is unramified. With the local-field
structure that the completed roadmap's Layer 0 puts on a finite extension, Tau Ceti's
`IntermediateField.le_maximalUnramifiedExtension_iff` says that such a subextension of a separably
closed field lies in `TauCeti.maximalUnramifiedExtension` exactly when it is unramified. Every
element of either compositum lies in a finite unramified subextension, so the two fields coincide.
Both constructions give this field the unique valuation extending that of `E` (3a.1), so the
uniform structures, the completions and the three properties agree. Nothing in the argument
depends on the characteristic of `E`.

*Needs:* the preceding target of this section (valuation, residue field and `e(K′/K) = 1` of
`K′`); 3a.1 (unique prolongation of the valuation); the completed roadmap's Layers 0 and 2 (the
local-field structure of a finite extension and `TauCeti.maximalUnramifiedExtension`); Tau Ceti
`IntermediateField.le_maximalUnramifiedExtension_iff`; ReductiveGroupsPartII §RG2.0.4 (`Breve E`);
Mathlib `UniformSpace.Completion`.

**Checks.**

- For `E = ℚ_p`, `K′` is `Breve ℚ_p = W(F̄_p)[1/p]`: the uniformizer `p` of `ℚ_p` stays a
  uniformizer and the residue field is `F̄_p`.
- For `E = F_q((t))`, `K^ur` is the union of the fields `F_(q^n)((t))` and `K′ = F̄_q((t))`, with
  uniformizer `t` and residue field `F̄_q`. A Laurent series whose coefficients generate extensions
  of `F_q` of unbounded degree lies in `K′` but in no `F_(q^n)((t))`, so the identification is with
  the completion, not with `K^ur`, in equal characteristic as well.
- `√p ∉ Breve ℚ_p`: its valuation `1/2` is outside the value group `ℤ` of a field with
  `e(K′/ℚ_p) = 1`. The Eisenstein polynomial `X² − p` stays irreducible over `Breve ℚ_p` and gives
  a quadratic extension with `e = 2`, as the base change of this section requires.

### Examples

`ℚ_2` and `ℚ_3` with their cyclotomic extensions, on which the absolute filtration
and `ψ_(L/K)` must return the completed roadmap's finite-level values; `Frac W(F̄_p)`, where
`K^ur = K` and inertia is everything; and `ℚ_3(ζ_9)/ℚ_3` under base change to `K′`.

### Dependencies

Layer 3a; the completed roadmap's Layers 0, 2 and 4 for the local-field structure of finite
extensions, the maximal unramified extension, the ambient model, `inertia` and `wildInertia`;
ReductiveGroupsPartII §RG2.0.4 for `Breve E`;
Mathlib's absolute Galois group, finite Galois intermediate fields, uniform completion and
Krasner's lemma.

## Dependency order

The external dependency order is **[Continuous Cohomology of Profinite
Groups](../ProfiniteCohomology/README.md) → [Profinite and Pro-`p`
Groups](../../Completed/ProfiniteProPGroups/README.md) → [LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md)
→ this roadmap**, with ReductiveGroups, SchemeAndStackFoundations and AdicSpacesPartII supplying
§3a.3's proalgebraic inputs. Within this roadmap the order is §3a.1 → §3a.2 → §3a.3 (its three
prerequisite targets, then the theorem) → §4a.1 → §4a.2 → §4a.3.

## Downstream consumers

PadicPeriodRings consumes §§3a.1–3a.3 (the lower numbering, Herbrand functions and Hasse–Arf
over a general complete discretely valued field with perfect residue field, and the proalgebraic
unit groups of §3a.3 on which it builds geometric reciprocity) and §§4a.1 and 4a.3 (inertia and
the completed maximal unramified base change) for its Sen tower estimates and completed
unramified descent. ClassFieldTheory consumes §4a.1 (the absolute upper filtration with its
finite projections) for the reciprocity–filtration compatibilities over a perfect residue field.
Integral `p`-adic Hodge theory and `p`-adic Galois representations over `F̄_p((t))` and
`Frac W(F̄_p)` reach the package through PadicPeriodRings.

## References

The mathematical spine is Serre, *Local Fields*; the sources cited by number follow.

### Source: Serre, *Local Fields*

Jean-Pierre Serre, *Local Fields*, Graduate Texts in Mathematics 67, Springer, 1979, the
translation of *Corps locaux*, Hermann, 1962. Located by chapter, section and statement number.

### Source: Serre, *Sur les corps locaux à corps résiduel algébriquement clos*

Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](http://www.numdam.org/item?id=BSMF_1961__89__105_0), Bulletin de la Société Mathématique de
France 89 (1961), 105–154. Located by numbered paragraph and printed page; its n° 3.1 treats
totally ramified extensions of an arbitrary complete discretely valued field, and from n° 3.2 on
it assumes an algebraically closed residue field.

### Source: Grothendieck, *Éléments de géométrie algébrique III, première partie*

Alexander Grothendieck, [Éléments de géométrie algébrique : III. Étude cohomologique des faisceaux
cohérents, première partie](http://www.numdam.org/item?id=PMIHES_1961__11__5_0), Publications
mathématiques de l'IHÉS 11 (1961), 5–167. Located by the numbering of Chapitre 0 and printed page.

### Source: Brinon–Conrad, *CMI summer school notes on p-adic Hodge theory*

Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](https://math.stanford.edu/~conrad/papers/notes.pdf), 2009, the authors' posted notes.
Located by exercise or lemma number and printed page.
