# LocalFieldsRamification: completion audit

The historical actual-main audit verified all three independent implementation PRs on upstream
[`302238ea98ea621d689041f67e935f0b4eb1285e`](https://github.com/TauCetiProject/TauCeti/commit/302238ea98ea621d689041f67e935f0b4eb1285e):
[#22018](https://github.com/TauCetiProject/TauCeti/pull/22018) (tame-generator bridge and marked
example, `5d2883167f8a0b24d9ea580342c683f7960277ca`),
[#22046](https://github.com/TauCetiProject/TauCeti/pull/22046) (canonical finite-level wild inertia,
`d9c5dce54b5fea21635e6da1a34cf5b53d03da64`), and
[#22047](https://github.com/TauCetiProject/TauCeti/pull/22047) (explicit dyadic boundary witness,
`02a131ed10be0817018d4211f13c97771a665896`). Every changed source path is byte-identical to its
reviewed head on that main revision, and the obsolete Teichmüller module is absent after its
canonical relocation. The original inventory baseline is upstream
`36f24f5d94ccf25e167520cf4c0f1a028c064fb0`; the historical actual-main replay is recorded below.
Their source contracts remain verified on actual main
[`ec93262aafc8`](https://github.com/TauCetiProject/TauCeti/commit/ec93262aafc8c3daaa4057352705faab817907e4).
The prepared catalog now has 85 modules, adding `TamelyRamified/Comparison.lean` to compare the
canonical local-field and DVR tame predicates. Its final native replay within the shared
922-root, sixteen-probe, 128-report inventory has not run.

The review reads the whole normative README: Layers 0–4, their API lists and hypotheses, the Counting Totally Ramified Extensions consumer boundary, the acceptance examples, and the implementation-provenance appendix. The table groups implementations by mathematical requirement, rather than equating the admitted suggested forms with completion. `Suggested.lean` is retained at the roadmap repository's older `358314d4ab97` pin as a prototype; it contains target placeholders and old finite-extension aliases. It is not a proof certificate for current source.

## Whole-roadmap implementation inventory

Paths in the tables link to the exact reviewed upstream baseline, except the three final implementations linked at their reviewed revisions. Unqualified neighboring paths refer to the same `TauCeti/NumberTheory/LocalField` directory. The Teichmüller construction uses Tau Ceti's `RingTheory/Henselian/Teichmuller.lean`; canonical local-field and cohomological carriers remain those of Mathlib/Tau Ceti.

| Normative requirement | Source entry point | Implementation and supporting API |
|---|---|---|
| 0: p-adic normalization and uniformities | [Padic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Padic.lean) | `rightUniformSpace_eq`, normalized valuation and absolute-value comparisons, integer-ring compactness |
| 0: normalized valuation and topology | [NormalizedValuation](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/NormalizedValuation.lean) | `normalizedValuation`, `normalizedAbsoluteValue`, negative-log translation, uniformizer values and valuation kernel |
| 0: induced structures and uniqueness | [AlgebraicExtension/Basic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.lean) | `algebraicExtensionNormedField`, `algebraicExtensionValuativeRel`, valuation uniqueness, integer-ring and residue maps; finite-extension local compactness in `FiniteExtension/Basic` |
| 0: towers and finite intermediate fields | [AlgebraicExtension/Tower](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/AlgebraicExtension/Tower.lean) | Structure tower equalities; `FiniteExtension/IntermediateField` installs the canonical structures used at finite Galois levels |
| 0: relative e and f | [InertiaDegree](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/InertiaDegree.lean) | Positivity, `e*f=[L:K]`, tower laws and Dedekind comparisons; `RamificationIndex` supplies the valuation characterization |
| 0: absolute index and natural-number valuation | [AbsoluteRamificationIndex](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean) | `FinitePadicExtension`, mixed-characteristic index and tower law; `NatCastValuation` supplies the general exponent and its vanishing criterion |
| 1: filtration, graded pieces and naturality | [UnitFiltration/Basic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean) | Both membership forms, compact open neighborhood basis, counts and degree-zero residue-units equivalence; `Uniformizer`, `Conjugation` and `Subgroup` give positive graded pieces and θ compatibility |
| 1: Teichmüller and multiplicative decompositions | [UnitsDecomposition](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean) | Topological product decompositions and change of uniformizer; `RingTheory/Henselian/Teichmuller` supplies the characterized multiplicative section |
| 1: principal units and torsion | [RootsOfUnity/Torsion](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/RootsOfUnity/Torsion.lean) | Finite torsion and prime-to-p/p-primary product decomposition; `UnitFiltration/ProP` supplies the finite-quotient pro-p property |
| 1: logarithm and p-adic module coordinates | [DeepUnits/Coordinates](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/DeepUnits/Coordinates.lean) | `deepUnitExpLogEquiv` from `DeepUnits/Basic` at the strict integer threshold; `deepUnitEquivPiPadicInt` gives the degree-N module coordinates |
| 1: power classes and openness | [PowerSubgroup/Basic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/PowerSubgroup/Basic.lean) | Both characteristic regimes, the natural-cardinality and absolute-value forms, dyadic count; `PowerSubgroup/Open` and `Squares` give actual containment, openness and sharp square depth |
| 2: unramifiedness and étale comparison | [Unramified/Basic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Unramified/Basic.lean) | `IsUnramified`, e=1 and formally-unramified comparison; `Unramified/Criterion` supplies the ideal-local comparison |
| 2: Frobenius and residue automorphisms | [Frobenius](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Frobenius.lean) | Canonical arithmetic Frobenius, order, generation, valuation congruence, tower restriction, Teichmüller and roots-of-unity compatibility; `ResidueCorrespondence` gives the automorphism equivalence |
| 2: existence, chosen-residue rigidity and base change | [Unramified/Rigidity](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Unramified/Rigidity.lean) | `existsUnique_algEquiv_residueFieldHom_eq`; `Existence`, `Reduction` and `BaseChange` give all finite degrees, the residue-extension comparison, composita and base change |
| 2: finite unramified lattice and maximal extension | [Unramified/Lattice](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Unramified/Lattice.lean) | Positive-integer divisibility lattice; `Maximal` and `ZHat` give the maximal field, Frobenius, finite-level compatibility, closed subgroups and the profinite-integer coordinate |
| 2: norm equations | [Norm/Unramified/Basic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean) | Norm surjectivity at every unit depth and `mem_normGroup_iff_dvd_normalizedValuation`; `Norm/Basic` gives the valuation identity and norm group |
| 3: Eisenstein equivalence and unramified factorization | [Eisenstein/TotallyRamified](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Eisenstein/TotallyRamified.lean) | `isTotallyRamified_iff_exists_eisenstein_generator`, integral generator and uniformizer consequences; `Unramified/Factorization` gives the maximal unramified subextension |
| 3: tame radicals and Galois criterion | [TamelyRamified/Galois](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/TamelyRamified/Galois.lean) | Radical and roots-of-unity Galois criterion, automorphism embedding; `Basic`, `Subextension`, `BaseChange` and `Tame/Layer` supply the tower, compositum and maximal tame layer |
| 3: monogenicity and counting exports | [Monogenic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Monogenic.lean) | `exists_integerRing_adjoin_eq_top` with integral power basis; `Eisenstein/PowerBasis.addVal_sum_eisenstein_powerBasis` is the exact no-cancellation formula |
| 3: lower filtration and θ embeddings | [RamificationGroup](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/RamificationGroup.lean) | Integer/real indices, normality, inertia comparisons, eventual triviality and subgroup compatibility; `UnitFiltration/Conjugation` gives the graded action and the finite Frobenius twist |
| 3: Herbrand domain, inversion and quotients | [Herbrand/UpperQuotient](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean) | Abstract and field-theoretic quotient compatibility; `Basic`, `Jump` and `Tower` give the domain order isomorphism, analytic properties, jump transport and both tower orders |
| 3: integral inverse-Herbrand depths | [Herbrand/Tower](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Herbrand/Tower.lean) | `psiNat`, its exact real comparison and transitivity; the prime-degree closed form is in `Herbrand/HasseArf/PrimeDegree` |
| 3: shifted norms and the four graded regimes | [Norm/Graded](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Norm/Graded.lean) | The tame zero break, zero/positive depths before a wild break, and positive wild break with its kernel and cokernel; `Norm/Herbrand`, `AfterBreak` and `Surjectivity` supply shifted containment and surjectivity after the break |
| 3: norm indices, conductor and Hasse–Arf | [Herbrand/HasseArf/Abelian](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Herbrand/HasseArf/Abelian.lean) | `hasseArf` for every finite abelian Galois extension, through `CyclicPGroup` and `PrimeDegree`; `Norm/Index` and `Norm/Conductor` give the break indices and conductor criterion |
| 3: different/discriminant and sharp bounds | [Different/Wild](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Different/Wild.lean) | Sharp general upper bound; `Different/Basic`, `Herbrand`, `Tower`, `AlgEquiv`, `Discriminant/Basic` and `Different/Basic` supply ideals, invariance, Hilbert formula, tame criterion and tower laws |
| 4: ambient model, inertia and canonical finite levels | [FiniteGalois](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/FiniteGalois.lean) | `finiteGaloisLowerRamificationGroup` uses the induced local-field structures; `Unramified/Inertia/SeparableClosure`, `Unramified/Coordinate` and `Unramified/Inertia/Basic` provide the ambient comparison and unramified exact sequence |
| 4: wild inertia and maximal tame extension | [WildInertia](https://github.com/TauCetiProject/TauCeti/blob/d9c5dce54b5fea21635e6da1a34cf5b53d03da64/TauCeti/NumberTheory/LocalField/WildInertia.lean) | Canonical finite-level membership iff, closedness/normality, full G1 images, pro-p Sylow characterization, maximal tame fixed field and radical description |
| 4: tame character, prime factors and intrinsic twist | [Tame/Quotient](https://github.com/TauCetiProject/TauCeti/blob/5d2883167f8a0b24d9ea580342c683f7960277ca/TauCeti/NumberTheory/LocalField/Tame/Quotient.lean) | Tame inertia, intrinsic Frobenius q-power action and generation; `Tame/Character` supplies the root-system character and choice independence, and `Tame/PadicCharacter` identifies the product of prime-adic factors |
| 4: marked Iwasawa and geometric translation | [Tame/Geometric](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/Tame/Geometric.lean) | `Tame/Presentation` gives the marked equivalence, its values, coordinate, kernel and choice-free consequences; geometric translation reverses the Frobenius marker and coordinate |

## Acceptance examples

| Contract | Source | Checked content |
|---|---|---|
| ℚ₂ and ℚ₅ Teichmüller values | [WorkedExamples/Padic/Teichmuller](https://github.com/TauCetiProject/TauCeti/blob/5d2883167f8a0b24d9ea580342c683f7960277ca/TauCeti/NumberTheory/LocalField/WorkedExamples/Padic/Teichmuller.lean) | The trivial ℚ₂ unit section and the specified ℚ₅ root values |
| ℚ₂ square classes and sharp square depth | [WorkedExamples/Padic/Two/Units](https://github.com/TauCetiProject/TauCeti/blob/02a131ed10be0817018d4211f13c97771a665896/TauCeti/NumberTheory/LocalField/WorkedExamples/Padic/Two/Units.lean) | The implementation proves 5 belongs to U2; existing `Padic.not_isSquare_five` proves it is nonsquare. U3 containment is compiled directly from the generic square theorem below. `PowerSubgroup/Basic` specializes the generic count to eight classes |
| Unramified quadratic, Frobenius and norm equations | [WorkedExamples/DyadicSqrt/Five/Basic](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Five/Basic.lean) | Explicit √5 arithmetic Frobenius, norm formula and even-valuation criterion; `WorkedExamples/UnramifiedQuadratic` gives an independent canonical construction |
| ℚ₂(√2), its breaks and attained different bound | [WorkedExamples/DyadicSqrt/Two](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Two.lean) | Existing e=2, d=3 and lower filtration; equality in d=e−1+vL(e) is the compiled calculation below; `DyadicSqrt/Herbrand` gives upper filtration, φ, ψ and ψℕ |
| ℚ₂(i), the other wild endpoint | [WorkedExamples/DyadicSqrt/NegOne/Ramification](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/NegOne/Ramification.lean) | d=e=2 and strictness of the wild upper bound |
| ℚ₂(μ₈), quotient failure and upper repair | [WorkedExamples/CyclotomicEight/Quotient](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/WorkedExamples/CyclotomicEight/Quotient.lean) | Witness to failure of lower quotient compatibility; `Basic` and `Herbrand` compute the lower/upper groups, φ(2)=3/2 and d=8 |
| Tame norm counterexample at residue characteristic3 | [WorkedExamples/TriadicSqrtThree](https://github.com/TauCetiProject/TauCeti/blob/36f24f5d94ccf25e167520cf4c0f1a028c064fb0/TauCeti/NumberTheory/LocalField/WorkedExamples/TriadicSqrtThree.lean) | e=2,d=1 and explicit failure of unshifted depth-two norm containment |
| Marked tame quotient over ℚ₂ | [WorkedExamples/Padic/Two/Tame](https://github.com/TauCetiProject/TauCeti/blob/5d2883167f8a0b24d9ea580342c683f7960277ca/TauCeti/NumberTheory/LocalField/WorkedExamples/Padic/Two/Tame.lean) | Generator comes from intrinsic procyclicity, passes through the new iff to the character hypothesis, and gives the marked presentation with arithmetic conjugation τ↦τ² |

## Interface corrections and boundaries

The construction/uniqueness names formerly beginning `finiteExtension` now begin `algebraicExtension`: `NormedField`, `NormedFieldTopology`, `ValuativeRel`, `_valuativeExtension`, `_isValuativeTopology`, `Valuation_isEquiv`, and the corresponding topology/equality/tower lemmas. `finiteExtension_isNonarchimedeanLocalField` and `finiteIntermediateField*` retain their finite hypotheses and current names. The README uses current source names; the historical prototype deliberately retains names that exist at its own pin.

The new finite-level wild-inertia iff quantifies over `FiniteGaloisIntermediateField` with canonical induced structures, rather than universally quantifying over choices of local-field structures. The new `topologicalClosure_zpowers_toTameQuotient_eq_iff` supplies the previously missing direction from intrinsic generation to the character-generator hypothesis of the marked equivalence. Both are substantive completion interfaces. The marked example exercises the tame bridge; the dyadic witness supplies the requested explicit boundary membership without duplicating generic square-depth theorems.

The reviewed assertions use the hypotheses of the README: mixed characteristic and the strict integer threshold for deep logarithms; nonzero natural-number casts in general power-class and different bounds; separability for different/discriminant formulas; normality/Galois hypotheses for quotient and tower theorems; abelian Galois groups for Hasse–Arf; arithmetic Frobenius and its q-power action for the marked presentation. No assertion about a full absolute Galois group rank, local reciprocity, or the arithmetic maximal pro-p quotient is included. Counting families, Haar measures and mass formulas are owned downstream by #226; the single-extension arithmetic, its invariance under equivalence and Eisenstein orthogonality are realized here.

## Source-pinned acceptance calculations

The following exact input was compiled with `lake env lean` against the existing source at `36f24f5d94ccf25e167520cf4c0f1a028c064fb0` (Lean 4.36.0-rc1, Mathlib `2cabef97`). Its imported source and supporting API are unchanged by the three final PRs. It proves the attained different bound and the U3 square example directly; no specialized public wrapper is needed. All four supporting endpoint axiom inspections reported only `propext`, `Classical.choice` and `Quot.sound`.

```lean
import TauCeti.NumberTheory.LocalField.WorkedExamples.DyadicSqrt.Two
import TauCeti.NumberTheory.LocalField.Squares

open TauCeti ValuativeRel

namespace TauCeti.DyadicSqrtTwo

-- Q₂(√2) attains d ≤ e − 1 + v_L(e), since d=3, e=2 and v_L(2)=2.
example :
    differentExponent ℚ_[2] DyadicSqrtTwo = ramificationIndex ℚ_[2] DyadicSqrtTwo - 1 +
      natCastValuation DyadicSqrtTwo (ramificationIndex ℚ_[2] DyadicSqrtTwo)
        (by simp [ramificationIndex_eq_two]) := by
  simp only [differentExponent_eq_three, ramificationIndex_eq_two]
  rw [← absoluteRamificationIndex_eq_natCastValuation, absoluteRamificationIndex_eq_two]

end TauCeti.DyadicSqrtTwo

-- Every element of 1+8Z₂ is a square, directly from the generic square-depth API.
example : unitFiltration ℚ_[2] 3 ≤ Subgroup.square ℚ_[2]ˣ := by
  have h := unitFiltration_le_square (K := ℚ_[2]) (by norm_num : (2 : ℚ_[2]) ≠ 0)
  rw [dyadicLevel_def, _root_.Padic.natCastValuation_self] at h
  exact h

#print axioms TauCeti.DyadicSqrtTwo.differentExponent_eq_three
#print axioms TauCeti.DyadicSqrtTwo.absoluteRamificationIndex_eq_two
#print axioms TauCeti.unitFiltration_le_square
#print axioms Padic.not_isSquare_five
```

## Validation and limits

The historical replay used a clean, unmodified actual-main checkout at `302238ea98ea`, with Lean
`4.36.0-rc1` and Mathlib `2cabef97b63d`. All 84 expanded inventory modules and their dependencies
built successfully (10,321 Lake jobs). The exact Lean block above was extracted verbatim and
compiled with warnings treated as errors. A separate scope probe checked canonical wild inertia,
tame intrinsic generation and the marked presentation, Hasse–Arf, all four graded-norm regimes,
and the dyadic examples. All 26 axiom reports use only `propext`, `Classical.choice` and
`Quot.sound`. This is actual merged source, with no integration-only proof changes.


A local integration of the exact three heads above, commit `587640b6e0154273a3d71f0a72c686e57017de01`, rebuilt all 41 source entry modules and their dependencies successfully (10,467 jobs). This includes the canonical `Padic/Teichmuller` relocation and the explicit continuous-hom coercion normalization. The source-pinned acceptance calculations, including the sharp different equality and the `U₃` square calculation, also compile in that integration. Axiom inspection of 19 key endpoints reports only `propext`, `Classical.choice` and `Quot.sound`. That earlier local integration was not pushed; it is superseded by the actual-main replay above.

The tame, wild-inertia and dyadic-witness PRs independently passed targeted builds (7149, 7095 and 6595 jobs), all 13 trusted environment linters, endpoint axiom inspections and `git diff --check`. The combined source audit was refreshed on that recorded merged revision.

This is a scope, signature and implementation review backed by the listed builds and kernel axiom checks. It is not a new independent line-by-line mathematical review of every imported library proof. The admitted prototype was not used as evidence that a target was proved. Source review and preparation: Codex (GPT-6), 2026-10-28.
