# Roadmap: local Galois groups of p-adic fields

This roadmap determines the absolute Galois group and the maximal pro-`p` Galois group of a
finite extension `K/ℚ_p` at the level visible to generators, cohomology, roots of unity,
cyclotomic orientation, and marked presentations. Its central dichotomy is Shafarevich–Demushkin:

```text
μ_p ⊄ K  =>  G_K(p) is free pro-p of rank [K : ℚ_p] + 1,
μ_p ⊆ K  =>  G_K(p) is Demushkin of rank [K : ℚ_p] + 2.
```

It also proves the distinct theorem `d(G_K) = [K : ℚ_p] + 2` for the **full** absolute Galois
group in both cases, identifies the Demushkin orientation with the descended cyclotomic
character, selects the marked Labute normal form from the roots of unity in `K`, and culminates
in the marked isomorphism

```text
G_{ℚ₂}(2) ≃ D₀ = ⟨A, S, Y | A²S⁴(S,Y)⟩.
```

The abstract group `D₀`, its generators and its standard orientation are not defined here. They
are supplied by **ProfiniteProPGroups**. This roadmap owns the arithmetic theorem identifying
the local Galois group with that marked abstract group.

## Scope and ownership

The roadmap owns:

- `G_K(p)` as the specialization of the supplier's maximal pro-`p` quotient to
  `Field.absoluteGaloisGroup K`;
- comparison of continuous cohomology across `G_K -> G_K(p)` in the degrees used here;
- finite generation and exact generator ranks of `G_K(p)`;
- the free and Demushkin cases;
- the intrinsic `p`-power roots-of-unity count of `K` and its equality with the Demushkin
  `q`-invariant;
- the local cyclotomic character, its descent to `G_K(p)`, and its identification with the
  canonical Demushkin character through Kummer theory and the cup product;
- marked local presentations and the three arithmetic acceptance examples;
- the exact finite generator rank of the full `G_K`.

It does not rebuild abstract profinite or pro-`p` group theory, continuous-cohomology operations,
ramification theory, Kummer theory, local reciprocity, or local Tate duality. In particular it
defines no copy of `IsDemushkin`, no second cup product, no second local Artin map, and no
private input record standing in for supplier theorems. There is no `LocalFieldInputs`,
`ProPOps`, or `ProPRankInputs` structure in this roadmap. Each proof consumes the named supplier
declarations directly.

## Conventions

- `p : ℕ` is prime and `K` is a finite extension of `ℚ_p`.
- `G_K` means Mathlib's `Field.absoluteGaloisGroup K`.
- `G_K(p)` means exactly
  `ProfiniteProPGroups.maximalProPQuotient p (Field.absoluteGaloisGroup K)` and is named
  `absoluteGaloisGroupProP`. No second quotient carrier is permitted.
- `N` always means `Module.finrank ℚ_[p] K`. The letter `d` denotes a generator rank, never a
  field degree.
- `μ_p ⊆ K` is written intrinsically as `∃ ζ : K, IsPrimitiveRoot ζ p`; there is no wrapper
  predicate whose only purpose is to carry this proposition.
- The local `q` is the number of roots of unity in `K` whose order is a power of `p`. It is `0`
  only in the abstract supplier's torsion-free convention; for a `p`-adic field it is a positive
  power of `p`.
- Arithmetic reciprocity is normalized so a uniformizer maps to arithmetic Frobenius. For a
  unit `u`, the cyclotomic character satisfies
  `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`. The inverse is load-bearing.
- Relators use Labute's commutator `(x,y) = x⁻¹y⁻¹xy`, the convention of
  `ProfiniteProPGroups.demushkinWordNeTwo`, `demushkinWordTwoOdd`, and
  `demushkinWordTwoEven`.
- A presentation is a quotient by the **closed** normal closure of its relator.
- A marked isomorphism records the orientation, not merely the underlying topological group.

## Exact supplier contracts

All names in this section are part of the dependency contract. Their namespaces are shown in
the table; subject descriptions without an exact declaration are not dependencies.

### From `TauCetiRoadmap.ProfiniteProPGroups`

| Use here | Exact declarations |
|---|---|
| maximal pro-`p` quotient | `proPKernel`, `maximalProPQuotient`, `IsProP` |
| generation and rank | `IsTopologicallyFinitelyGenerated`, `topologicalGeneratorRank`, `topologicalGeneratorRankNat`, `topologicalGeneratorRank_le_of_surjective`, `topologicalGeneratorRankNat_le_of_isOpen`, `topologicallyGenerates_iff_frattiniQuotient` |
| free case | `freeProP`, `isFree_of_cd_p_le_one` |
| Demushkin theory | `trivialFp`, `cohomFp`, `cupFp`, `IsDemushkin`, `demushkinRank`, `demushkinQ`, `demushkinCharacter`, `demushkinCharacter_unique`, `HasPrescriptionProperty` |
| marked classification | `presentedProP`, `freeProPGen`, `presentedProPGen`, `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoEven`, `isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd`, `isDemushkin_marked_of_q_two_even` |
| marked dyadic target | `demushkinD0`, `d0A`, `d0S`, `d0Y`, `standardD0Orientation`, `standardD0Orientation_d0A`, `standardD0Orientation_d0S`, `standardD0Orientation_d0Y`, `standardD0Orientation_surjective` |

The supplier owns the definitions and all abstract classification theorems. This roadmap applies
them; it does not restate them with local-field hypotheses appended.

### From `TauCetiRoadmap.ProfiniteCohomology`

| Use here | Exact declarations |
|---|---|
| quotient comparison | `quotientToInvariants`, `quotientToInvariantsι`, `infl`, `explicitIso_infl` |
| five-term argument | `transgression`, `fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`, `transgression_comp_res`, `explicitInfl2_transgression` |
| cup compatibility | `cup`, `degreeCast`, `cup_infl`, `cup_coeffMap`, `cup_add_left`, `cup_add_right`, `cup_gradedComm` |
| cohomological dimension | `cd_p`, `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent` |

The comparison is always with Mathlib's `continuousCohomology`; this roadmap has no cohomology
carrier of its own.

### From `TauCetiRoadmap.LocalFieldsRamification`

| Use here | Exact declarations |
|---|---|
| normalized local-field arithmetic | `normalizedValuation`, `absoluteRamificationIndex` |
| units and power classes | `unitFiltration`, `card_powerClasses_mixed` |

These declarations supply the field-arithmetic count behind `H¹`, the cyclotomic filtration, and
the tame/wild frame used in the upper bound for the full `G_K`. Ramification filtrations and the
tame quotient remain owned by that roadmap even when used in the proof here.

### From `TauCetiRoadmap.ClassFieldTheory`

| Use here | Exact declarations |
|---|---|
| coefficient objects and Kummer theory | `GalRep`, `H`, `muNRep`, `kummerClass`, `kummerEquiv_mixed`, `kummerCupPairing`, `localSymbol` |
| degree two and local duality | `finite_H`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp` |
| reciprocity and orientation | `artinMap`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic` |

The `h2MuEquivZMod_mixed` theorem is the mixed-characteristic result valid at `n = p`; the
away-from-`p` theorem with `IsUnit (n : 𝒪[K])` cannot replace it. Likewise,
`h2FpEquivZMod_of_mu` carries a chosen primitive root and a coefficient identification. Omitting
that identification makes the statement false.

## How to read the build

`README.md` is normative. `Suggested.lean` pins central names and useful target signatures but is
not exhaustive. Source-extraction records are maintained in the private migration and provenance
ledger and are not prerequisites.

In the layers below, `M` denotes Mathlib, `PPG` denotes `ProfiniteProPGroups`, `PC` denotes
`ProfiniteCohomology`, `LFR` denotes `LocalFieldsRamification`, and `CFT` denotes
`ClassFieldTheory`. Every dependency points to one of those suppliers or an earlier layer here.

## Layer 0: the arithmetic carrier and intrinsic invariants

- Define `absoluteGaloisGroupProP p K` as a reducible abbreviation for
  `PPG.maximalProPQuotient p (Field.absoluteGaloisGroup K)`. Prove the quotient is profinite and
  pro-`p`, assembling supplier quotient instances and closedness of `proPKernel`.
  *Needs:* PPG `proPKernel`, `maximalProPQuotient`; M `Field.absoluteGaloisGroup`.
- Define `pPowerRootsOfUnity p K` intrinsically as the subtype of `x : K` satisfying
  `x^(p^n)=1` for some `n`, and define `localRootOfUnityOrder p K` as its cardinality. Prove it
  is finite for `K/ℚ_p`, is a positive power of `p`, and equals the largest `p^n` for which `K`
  contains a primitive `p^n`-th root.
  *Needs:* LFR unit filtration and power-class theory.
- Define `localCyclotomicCharacter p K : G_K -> ℤ_pˣ` from Mathlib's cyclotomic character and
  prove continuity. This is the actual local character, not a field of an input package.
  *Needs:* M `cyclotomicCharacter`.

Basic API for the roots-of-unity carrier includes closure under multiplication and inverse, the
inclusions as `n` increases, invariance under field isomorphism over `ℚ_p`, behavior in finite
towers, and the equivalence between `p ∣ localRootOfUnityOrder p K` and
`∃ ζ : K, IsPrimitiveRoot ζ p`.

## Layer 1: local cohomology with trivial coefficients

Fix `T = PPG.trivialFp p G_K`. Prove, by the CFT coefficient dictionary rather than by defining a
new representation, the following exact statements:

- `H⁰(G_K, 𝔽_p)` is finite-dimensional of dimension `1`.
- `H¹(G_K, 𝔽_p)` and `H²(G_K, 𝔽_p)` are finite-dimensional. Finiteness is a separate theorem
  from each finrank calculation: `Module.finrank` alone is `0` on an infinite-dimensional module.
- If `μ_p ⊆ K`, then `H²(G_K, 𝔽_p) ≃ 𝔽_p`, using a chosen primitive root and
  `CFT.h2FpEquivZMod_of_mu`.
- If `μ_p ⊄ K`, then `H²(G_K, 𝔽_p)` actually vanishes. State `Subsingleton`, not merely
  `finrank = 0`.
- The Euler characteristic gives
  `dim H¹ = 1 + dim H² + [K:ℚ_p]`, hence the two counts `N+2` and `N+1`.
- When `μ_p ⊆ K`, the cup square on `H¹(G_K,𝔽_p)` is nondegenerate on both sides. Obtain this
  from `CFT.tateDualityPairing_perfect_mixed`, the chosen-root coefficient dictionary, and
  `CFT.kummerCupPairing`; do not introduce an untyped assertion that “local duality holds.”

*Needs:* CFT `finite_H`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`,
`tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp`, `kummerEquiv_mixed`; PPG
`trivialFp`, `cohomFp`, `cupFp`.

## Layer 2: inflation from the maximal pro-p quotient

Let `R = PPG.proPKernel p G_K`.

- Prove `R` acts trivially on `𝔽_p`, identify the quotient coefficient object
  `PC.quotientToInvariants R T` with `PPG.trivialFp p G_K(p)`, and pin the comparison. This
  coefficient isomorphism is the only adapter; it is not a new coefficient carrier.
- Prove `inflH1AbsoluteGaloisProP`, the degree-one inflation isomorphism
  `H¹(G_K(p),𝔽_p) ≃ H¹(G_K,𝔽_p)`.
- Prove degree-two inflation is injective from the five-term sequence. Name the transgression
  and exactness steps used; do not appeal to a generic spectral sequence without constructing
  the maps.
- Prove degree-two inflation is surjective in the two arithmetic cases. When `μ_p ⊄ K`, the
  target vanishes. When `μ_p ⊆ K`, use cup compatibility and nondegeneracy to exhibit a nonzero
  class, then use one-dimensionality. Conclude the degree-two inflation isomorphism in the form
  consumed by the Demushkin construction.
- Transport the `H¹` dimension, `H²` vanishing or dimension-one result, and cup
  nondegeneracy to `G_K(p)`.

*Needs:* L1; PC `infl`, `explicitIso_infl`, the five-term declarations, and `cup_infl`; PPG
`proPKernel`, `maximalProPQuotient`.

The degree-two proof is deliberately split into injectivity and surjectivity. A five-term
sequence supplies the first; it does not by itself supply the second.

## Layer 3: finite generation and generator ranks of `G_K(p)`

- Prove `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP` from the finite-dimensional
  `H¹` comparison and the pro-`p` Burnside basis theorem. Do not use finite generation of the
  full `G_K`; that theorem comes later.
- Prove
  `topologicalGeneratorRankNat_absoluteGaloisGroupProP_of_mu`:
  `d(G_K(p)) = N + 2` when `μ_p ⊆ K`.
- Prove
  `topologicalGeneratorRankNat_absoluteGaloisGroupProP_of_not_mu`:
  `d(G_K(p)) = N + 1` when `μ_p ⊄ K`.

*Needs:* L2; PPG `topologicallyGenerates_iff_frattiniQuotient`,
`topologicalGeneratorRankNat`.

## Layer 4: the Shafarevich-Demushkin dichotomy

- **Free case.** If `μ_p ⊄ K`, prove `cd_p G_K(p) <= 1` by dévissage from the degree-two
  vanishing, then apply `PPG.isFree_of_cd_p_le_one`. The marked rank statement is
  `absoluteGaloisGroupProP_iso_freeProP_of_not_mu`, an isomorphism with
  `freeProP p (Fin (N+1))`.
- **Demushkin case.** If `μ_p ⊆ K`, construct
  `isDemushkin_absoluteGaloisGroupProP_of_mu` using the supplier's exact `IsDemushkin` fields:
  pro-`p`, finite `H¹`, one-dimensional `H²`, and left and right nondegeneracy of cup.
- Recover the rank results of L3 from the two structural theorems and prove their compatibility
  with the independently computed `H¹` dimensions.

*Needs:* L2–L3; PPG `isFree_of_cd_p_le_one`, `IsDemushkin` and its finite-generation theorem;
PC cohomological-dimension reductions.

## Layer 5: roots of unity, q, and cyclotomic orientation

- Prove `demushkinQ_absoluteGaloisGroupProP`: the supplier's abstract `demushkinQ` of `G_K(p)`
  equals `localRootOfUnityOrder p K`. The proof identifies torsion in the topological
  abelianization through local reciprocity; it does not store the equality as input data.
- Prove the image of `localCyclotomicCharacter p K` is pro-`p` when `μ_p ⊆ K`. Therefore
  `proPKernel p G_K` lies in its kernel and the character descends to the named
  `cyclotomicOrientation p K : G_K(p) -> ℤ_pˣ`.
- Pin the descent pointwise in `cyclotomicOrientation_mk`, prove continuity, and compute its
  closed range through `CFT.artinMap` and `CFT.cyclotomicCharacter_artinMap`.
- Use `CFT.kummerEquiv_mixed`, the Kummer/cup compatibility and local duality to prove that the
  descended character has `PPG.HasPrescriptionProperty`. Apply
  `PPG.demushkinCharacter_unique` to obtain
  `demushkinCharacter_absoluteGaloisGroupProP`.

*Needs:* L1–L4; CFT Kummer, local-duality, Artin-map and cyclotomic-normalization declarations;
PPG `demushkinQ`, `HasPrescriptionProperty`, `demushkinCharacter_unique`.

The orientation proof must keep two directions distinct: the quotient map is composed with the
descended character to recover `χ_cyc` on `G_K`, while a marked isomorphism to a presented group
pulls the standard orientation back to `G_K(p)`.

## Layer 6: arithmetic marked presentations

Apply the supplier's marked classification only after L5 has computed `q`, rank, and the
orientation image.

- If `q != 2`, obtain the marked normal form
  `x₁^q(x₁,x₂)(x₃,x₄)...` on `N+2` generators. The marked theorem records the supplier's
  character values, not just an unmarked isomorphism.
- If `q = 2` and `N` is odd, prove the cyclotomic image is all of `ℤ₂ˣ`, hence the parameter is
  `f=2`, and obtain
  `x₁²x₂⁴(x₂,x₃)(x₄,x₅)...`.
- If `q = 2` and `N` is even, compute the cyclotomic image and select the correct one of the two
  even-rank families. State separately the `{±1} x U^(f)` and `U^[f]` branches. Do not infer
  the branch from `q` alone.
- Prove functoriality of each marked result under an isomorphism of local fields over `ℚ_p` and
  compatibility with finite extensions.

*Needs:* L5; PPG three marked classification theorems and their relator words; LFR unit
filtration; CFT cyclotomic normalization.

## Layer 7: exact rank of the full absolute Galois group

This layer proves topological finite generation before computing the exact rank. It does not use
an unqualified statement `scd(G_K)=2`; conventions for strict cohomological dimension differ, and
that assertion is not an input to the argument.

- **Degree-one counts at every prime.** Compute
  `dim_{𝔽_ℓ} H¹(G_K,𝔽_ℓ)` for every prime `ℓ`: it is
  `N+1+dim H⁰(G_K,μ_p)` at `ℓ=p` and at most `2` for `ℓ!=p`. These counts feed the generation
  argument but do not prove it alone. The profinite group `∏_ℕ A₅` has trivial degree-one
  cohomology at every prime and is not topologically finitely generated.
  *Needs:* L1; CFT Kummer and duality; LFR power classes.
- **The tame frame.** Use the LFR presentation of the tame quotient to obtain two topological
  generators and its identification of wild inertia as pro-`p`. Apply the PPG Burnside criterion
  in its relative form to reduce finite generation of `G_K` to finite generation of the
  `ℤ_p[[G_K^t]]`-coinvariants of the pro-`p` abelianization of wild inertia.
  *Needs:* LFR tame quotient and wild inertia; PPG Frattini/Burnside API.
- **The multiplicative relation module.** For finite Galois `L/K`, construct the completed
  multiplicative module
  `A(L)=lim_m Lˣ/(Lˣ)^(p^m) ≃ G_L^ab(p)`. Prove
  `A(L)⊗ℚ_p ≃ ℚ_p[Gal(L/K)]^N ⊕ ℚ_p` from the deep-unit logarithm and normal basis theorem,
  and prove the required cohomological triviality for the tame unit quotients. This is the
  reciprocity-side input to the relation-module count; it is not replaced by an unproved claim
  that local reciprocity controls generators.
  *Needs:* CFT local existence/reciprocity; LFR deep units and ramification; M normal basis.
- **Finite generation of `G_K`.** Combine the tame frame and relation module to construct a
  finite topological generating set. Name this theorem separately so the natural-valued rank
  accessor is never applied before its hypothesis is available.

Then prove the public theorem `rank_absoluteGaloisGroup` directly, with no anonymous or
unconstructed package hypothesis:

```text
d(G_K) = [K : ℚ_p] + 2.
```

Its Lean form says that `N+2` is the least cardinality of a finite subset whose generated subgroup
is dense. Build the upper bound from the relation-module count of NSW VII §4, including the
degree-two comparison of L2 and lifting through the Frattini reduction. For the lower bound:

- if `μ_p ⊆ K`, use the continuous surjection `G_K -> G_K(p)` and L3;
- if `μ_p ⊄ K`, put `L = K(μ_p)` and `m=[L:K]`. Then `m | p-1`, L3 gives
  `d(G_L(p))=mN+2`, monotonicity gives that as a lower bound for `d(G_L)`, and the supplier's
  Schreier bound for the open subgroup `G_L <= G_K` forces `d(G_K) >= N+2`.

The count `N+1` belongs only to the free pro-`p` quotient. No theorem may state it for the full
absolute Galois group.

*Needs:* L3–L4; PPG `topologicalGeneratorRank_le_of_surjective` and
`topologicalGeneratorRankNat_le_of_isOpen`; LFR tame/wild ramification theory; CFT reciprocity and
Euler characteristic.

## Layer 8: marked arithmetic acceptance instances

- **`K=ℚ₂`.** Prove `localRootOfUnityOrder 2 ℚ_[2] = 2`, rank `3`, and the marked theorem
  `absoluteGaloisGroupProP_two_ratPadic_marked`:
  there is `e : G_{ℚ₂}(2) ≃ D₀` such that
  `standardD0Orientation ∘ e = cyclotomicOrientation 2 ℚ_[2]`, and this character is
  surjective. By the supplier's named value theorems, the pulled-back marked generators have
  values `(-1, 1, (-3)⁻¹)`. The unmarked isomorphism is a corollary of this theorem, not a
  separate classification choice.
- **`K=ℚ₂(√-2)`.** Prove degree `2`, `q=2`, and cyclotomic image
  `U^[2]=closure<3>`, of index `2` in `ℤ₂ˣ`. Select the even-rank marked presentation
  `⟨x,y,z,w | x⁶(x,y)(z,w)⟩`. This example detects loss of the `U^[f]` family.
- **`K=ℚ_p(μ_p)`, `p` odd.** Prove degree `p-1`, `q=p`, rank `p+1`, and the marked normal form
  `x₁^p(x₁,x₂)(x₃,x₄)...(x_p,x_{p+1})`.

Each acceptance result must pass through the arithmetic invariant computations and the supplier's
marked theorem. A direct unmarked existence proof does not discharge the milestone.

## Ordering and parallel work

L0 and L1 can begin independently once the supplier declarations exist. L2 depends on both. L3
then feeds two branches: L4–L6, the maximal pro-`p` classification, and L7, the full-group rank.
L8 joins those arithmetic computations at the end. Within L6 the `q != 2`, odd dyadic, and even
dyadic presentation cases can be developed in parallel after L5.

## Acceptance checklist

- There is exactly one definition of `G_K(p)`, reducibly specialized from the supplier.
- No private structure collects arithmetic facts already exported by CFT, LFR, PC, or PPG.
- `H²=0` in the free case is actual vanishing, not only `finrank=0`.
- Degree-two inflation has separate injectivity and surjectivity proofs.
- `d(G_K)` is `N+2` in both roots-of-unity cases; `N+1` appears only for `G_K(p)`.
- The cyclotomic formula contains the field norm for general `K` and an inverse for the
  arithmetic Artin convention.
- The `q=2` even-rank branch is selected from the orientation image, not from `q` alone.
- `D₀` and its standard orientation are imported from PPG; only the marked local isomorphism is
  proved here.
- The `ℚ₂` theorem preserves the values `(-1,1,(-3)⁻¹)` and surjectivity.

## References

- J. P. Labute, *Classification of Demushkin groups*, Canad. J. Math. 19 (1967), 106–132,
  especially §5 and Theorems 7–9 for local fields, the marked cases, and the
  `ℚ₂(√-2)` example.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., VII
  (7.5.11) for the free/Demushkin dichotomy and (7.5.12) for explicit presentations; VII
  (7.4.1) for the full generator bound.
- I. R. Shafarevich, *On p-extensions*, Mat. Sb. 20 (1947), 351–363; English translation,
  AMS Transl. Ser. 2, 4 (1956), 59–72, for the free case.
- M. Jarden and A. Shusterman, *The absolute Galois group of a p-adic field*, Theorem 2.1,
  for the exact generator rank of the full absolute Galois group.
- J.-P. Serre, *Galois Cohomology*, I §§3–4 and II §5, for pro-`p` cohomological dimension,
  Demushkin groups, and local duality.
- H. Koch, *Galois Theory of p-Extensions*, Chapters 4, 6, and 10, for free pro-`p` groups,
  generator/relation ranks, and arithmetically normalized local presentations.
