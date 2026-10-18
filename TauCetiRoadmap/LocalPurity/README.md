# Roadmap: finite étale covers of punctured spectra and local purity

**Summary.** This roadmap builds the theory of finite étale covers of the punctured spectrum of a
Noetherian local ring and proves purity for regular local rings (Stacks, Lemma 58.21.3 (0BMA);
SGA 2, Exposé X, Théorème 3.4): for a regular local ring `A` of dimension `≥ 2`, every finite
étale cover of the punctured spectrum of `A` extends to a finite étale cover of `Spec A`. It then
globalizes: over a Noetherian scheme, a finite étale cover of an open `U` extends across every
point of the complement at which purity holds (Stacks, Lemma 58.21.6 (0EY7)). The route is that
of Stacks, Sections 58.19–58.21: finite normal algebras over a local ring, completion, full
faithfulness of restriction to a hypersurface section, the local Lefschetz extension theorem
(Lemma 58.20.7 (0BLM)), and an induction on the dimension whose base case uses miracle flatness
for a Cohen–Macaulay target and the discriminant of a finite free algebra. Mathlib has schemes,
finite and étale morphisms, the categories `MorphismProperty.Over`, regular local rings, adic
completion, local cohomology, discriminants and trace forms; Tau Ceti has finite étale schemes over
a base and regular local rings as domains; SchemeAndStackFoundations specifies depth,
Cohen–Macaulay rings, Serre's criterion, henselian pairs and formal completion. None of them has
finite étale covers of punctured spectra or local purity.

These results are the common input of two roadmaps:
[PurityOfBranchLocus](../PurityOfBranchLocus/README.md) (Zariski–Nagata purity of the branch locus,
Stacks 0BMB) and [AbhyankarLemma](../AbhyankarLemma/README.md) (extension of covers unramified in
codimension one and Abhyankar's lemma for a regular divisor, Stacks 0EYE–0EYH).

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-commutative-algebra-inputs) | Commutative algebra inputs | miracle flatness for a Cohen–Macaulay target, the discriminant criterion for étaleness of a finite free algebra |
| [1](#layer-1-finite-étale-covers-of-punctured-spectra) | Finite étale covers of punctured spectra | purity for a local ring, finite normal algebras, completion, restriction to a hypersurface, the local Lefschetz extension theorem |
| [2](#layer-2-local-purity-and-extension) | Local purity and extension | purity for regular local rings, spreading out from a local scheme, extension across points where purity holds |

```text
Mathlib + Tau Ceti → Layer 0 → Layer 1 → Layer 2
SchemeAndStackFoundations §§0.6, 0.9, 0.14, 0.17, 2.7, 4.7–4.8, 4.13 ──→ Layers 0, 1, 2
PurityOfBranchLocus §0.3 (0AFS) ─────────────────────────────────────────────→ Layer 2 §2.1
```

The §0.3 regular-local localization targets of PurityOfBranchLocus are independent of local
purity. Their target-level order is §0.3 → this roadmap's §2.1 → PurityOfBranchLocus §2.1;
the whole-roadmap arrows do not reverse this prerequisite order.

The end theorems are `IsLocalRing.purityHolds_of_isRegularLocalRing` and
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (0BMA, §2.1), and
`finiteEtale_extend_of_purity` (0EY7, §2.2).

## Scope and ownership

**This roadmap owns** the punctured spectrum of a local ring, the restriction of finite étale
covers to it, and the notion "purity holds for `A`" (Stacks, Section 58.20 (0BM7)); Stacks, Lemmas
58.20.1 (0BM8), 58.20.2 (0BLK), 58.20.3 (0BM9), 58.19.3 (0BLH), 58.20.4 (0BLL), 58.19.4 (0BLI),
58.17.1 (0EL8), 58.19.6 (0BM6), 58.19.7 (0BLJ) and 58.20.7 (0BLM), and Algebraic and Formal
Geometry, Lemma 52.15.5 (0EKS); miracle flatness for a Cohen–Macaulay target (Algebra, Lemma
10.128.1 (00R4)); the discriminant criterion for a finite free algebra over a local ring
(Discriminants, Lemma 49.3.1 (0BJF), affine form); purity for regular local rings (Lemma 58.21.3
(0BMA)); spreading out from a local scheme (Limits, Lemmas 32.20.3 (0BQ5) and 32.20.4 (0EY3)); and
the extension result 58.21.6 (0EY7).

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds
no second carrier.

- *Finite étale schemes over a base*: Tau Ceti `TauCeti.FiniteEtaleScheme S` (module
  `TauCeti.AlgebraicGeometry.FiniteEtale.Basic`), the full subcategory of `Over S` on the finite
  étale morphisms, which is Stacks' `FÉt_S` (Section 58.5 (0BL6)). It is equivalent to Mathlib's
  `(@IsFinite ⊓ @Etale).Over ⊤ S`; every restriction functor below is pullback along a morphism of
  schemes (Mathlib `MorphismProperty.Over.pullback`), and the targets are stated for either
  carrier.
- *Regular local rings*: Mathlib `IsRegularLocalRing`, `IsRegularRing`; Tau Ceti
  `TauCeti.IsRegularLocalRing.isDomain` (Algebra, Lemma 10.106.2 (00NP)) and
  `TauCeti.IsRegularLocalRing.quotient_span_singleton` (Lemma 10.106.3 (00NQ) for one element).
- *Regularity of prime localizations of a regular local ring*:
  [PurityOfBranchLocus](../PurityOfBranchLocus/README.md) §0.3
  (`IsRegularLocalRing.isRegularLocalRing_localization`, `isRegularRing_of_isRegularLocalRing`,
  Stacks 0AFS). This is the prerequisite for applying the regular-ring and regular-scheme
  results below to a regular local base; neither Mathlib's reverse implication nor the
  regular-ring theorem by itself supplies it.
- *Depth, Cohen–Macaulay rings, Serre's conditions and criterion*:
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.17 (`Module.depth`,
  `IsLocalRing.depth`, `Ring.IsCohenMacaulay`, `Ring.IsCohenMacaulay.of_isRegularRing`,
  `Module.SatisfiesSerreS`, `isCohenMacaulay_iff_forall_satisfiesSerreS`) and §4.13
  (`serre_normality_criterion`, and `IsRegular.isNormal`, Algebra, Lemma 10.157.5 (0567)).
- *Local cohomology and its vanishing below the depth*: SchemeAndStackFoundations §2.7
  (`depth_localCohomology_vanishing`, `localCohomology_module_comparison`).
- *Formal completion and coherent formal modules*: SchemeAndStackFoundations §§4.7–4.8
  (`CoherentFormalModule`).
- *Henselian pairs and finite étale algebras over them*: SchemeAndStackFoundations §0.14
  (`henselian_finiteEtale_equivalence`, More on Algebra, Lemma 15.13.2 (09ZL)).
- *Finitely presented schemes over a limit*: SchemeAndStackFoundations §0.9
  (`finite_presentation_limits`).
- *Extension of sections across a closed subset of depth `≥ 2`*: SchemeAndStackFoundations §0.6
  (`coherent_hartogs`, Divisors, Lemma 31.5.11 (0E9I)).
- *Going down and the dimension formula*: Mathlib `Algebra.HasGoingDown` (`@[stacks 00H8]`) and the
  `@[stacks 00ON]` dimension formula.
- *Discriminants and trace forms*: Mathlib `Algebra.discr`, `Algebra.traceForm`,
  `traceForm_nondegenerate_tfae` (`@[stacks 0BIL]`, finite field extensions),
  `Algebra.trace_localization`, `Algebra.TensorProduct.basis`.

Purity of the branch locus is [PurityOfBranchLocus](../PurityOfBranchLocus/README.md); extension
of covers unramified or tamely ramified in codimension one, and Abhyankar's lemma, are
[AbhyankarLemma](../AbhyankarLemma/README.md). Both cite this roadmap.

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses such as Noetherian, normal and regular are written on the statement
   that uses them, never folded into a definition.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result in a different form, the target cites the tag, carries Mathlib's `@[stacks XXXX]`
   attribute, and says how the two forms correspond; targets with no Stacks counterpart are marked
   *API*.
3. *Normal* is Stacks, Definition 10.37.11 (00GV), written in Mathlib's vocabulary: every
   localization at a prime is a domain and integrally closed,
   `∀ p : Ideal B, p.IsPrime → IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)`.
   For a local ring it is `IsDomain` together with `IsIntegrallyClosed`.
4. The dimension of a local ring is `ringKrullDim`; depth is SchemeAndStackFoundations'
   `IsLocalRing.depth`.
5. **Finite normal algebras.** A *finite normal algebra* over a Noetherian local domain `A` is a
   finite `A`-algebra `B` that is normal (Convention 3) **and torsion free as an `A`-module**
   (Mathlib `Module.IsTorsionFree A B`). Stacks, Lemma 58.20.3 (0BM9) and Lemma 58.21.3 (0BMA),
   part (2), state no torsion-freeness condition, and as written both are false: for `A` normal
   local of dimension `≥ 2`, `B = A × A/𝔪` is finite and normal, `Spec B → Spec A` is étale over
   the punctured spectrum (its second factor lies over the closed point), and `B` is not flat over
   `A`; it is not `Γ(V, 𝒪_V)` for any finite étale `V` over the punctured spectrum. Torsion
   freeness removes exactly the factors supported at the closed point, and the Stacks proofs then
   apply unchanged. §1.2 and §2.1 state the corrected forms and record the counterexample as a
   Check.
6. Names: ring-level statements live in the `Algebra` and `IsLocalRing` namespaces; scheme-level
   statements in `AlgebraicGeometry`. The suggested forms are in `TauCetiRoadmap.LocalPurity`.

## Layer 0: commutative algebra inputs

### 0.1 Miracle flatness

Prove `flat_of_isCohenMacaulay` (Stacks, Lemma 10.128.1 (00R4)): a local homomorphism `R → S` of
Noetherian local rings with `R` regular, `S` Cohen–Macaulay and
`ringKrullDim S = ringKrullDim R + ringKrullDim (S ⧸ (maximalIdeal R).map (algebraMap R S))` makes
`S` flat over `R`. Prove `flat_of_normal_dim_two` (*API*): a finite injective local homomorphism
`A → B` with `A` regular local of dimension two and `B` a normal local domain makes `B` flat over
`A` (`B` has dimension two by going down and the dimension formula, satisfies `(S_2)` by
`serre_normality_criterion`, and so is Cohen–Macaulay). ModularCurves §4D's miracle flatness
between regular local schemes of equal dimension is the case of `flat_of_isCohenMacaulay` with `S`
regular.
*Needs:* SchemeAndStackFoundations §0.17 (`Ring.IsCohenMacaulay`,
`Ring.IsCohenMacaulay.of_isRegularRing`, `isCohenMacaulay_iff_forall_satisfiesSerreS`), §4.13
(`serre_normality_criterion`); Mathlib `Module.Flat`, `IsRegularLocalRing`, `Algebra.HasGoingDown`.

**Checks.**
- `test_flat_needs_cohenMacaulay`: `k⟦x, y⟧ → k⟦x, y⟧[z]/(z², xz, yz)` is finite and local with
  target of dimension two and depth zero, so not Cohen–Macaulay, and it is not flat.

### 0.2 The discriminant criterion

Prove `Algebra.etale_iff_traceForm_nondegenerate`: a finite-dimensional algebra `B` over a field
`K` is étale (`Algebra.Etale K B`) iff its trace form `Algebra.traceForm K B` is nondegenerate.
This is the field case in the proof of Discriminants, Lemma 49.3.1 (0BJF); for `B` a field it is
Mathlib's `traceForm_nondegenerate_tfae` (0BIL), and the general case reduces to it through the
decomposition of a reduced finite-dimensional algebra into fields and the nilpotence of the
nilradical. Prove `Algebra.etale_iff_isUnit_discr` (Stacks, Lemma 49.3.1 (0BJF), affine form over
a local base): for a local ring `A`, a finite free `A`-algebra `B` and a basis `b` of `B` over `A`,
`Algebra.Etale A B ↔ IsUnit (Algebra.discr A b)`. The proof base-changes `b` to the closed fibre
(`Algebra.TensorProduct.basis`; the trace matrix commutes with base change) and uses that a finite
free algebra over a local ring is étale iff its closed fibre is. Prove the localization form
`Algebra.isUnit_discr_localization_iff` (*API*): for a prime `𝔭` of `A`, the image of
`Algebra.discr A b` in `A_𝔭` is a unit iff `B_𝔭` is étale over `A_𝔭` (`Algebra.trace_localization`).
*Needs:* Mathlib `Algebra.discr`, `Algebra.traceForm`, `traceForm_nondegenerate_tfae`,
`Algebra.trace_localization`, `Algebra.TensorProduct.basis`, `Algebra.Etale`, `Module.Free`.

**Checks.**
- `test_discr_dual_numbers`: for a field `k` of characteristic `≠ 2`, `k[x]/(x²)` with basis
  `1, x` has discriminant `0` and is not étale over `k`.
- `test_discr_quadratic`: for `A = ℤ_(p)` with `p` odd and `d` a unit of `A`, `A[x]/(x² − d)` with
  basis `1, x` has discriminant `4d`, a unit, and is étale over `A`; for `d = p` the discriminant
  is `4p` and it is not étale.

## Layer 1: finite étale covers of punctured spectra

Throughout, `(A, 𝔪)` is a Noetherian local ring, `X = Spec A` and `U = X ∖ {𝔪}`.

### 1.1 The punctured spectrum and purity for a local ring

Define `IsLocalRing.puncturedSpectrum A : (Spec A).Opens`, the complement of
`IsLocalRing.closedPoint A`, and the restriction functor from finite étale schemes over `Spec A`
to finite étale schemes over `U` as pullback along its inclusion. Define
`IsLocalRing.PurityHolds A`: the restriction functor is essentially surjective (Stacks, Section
58.20 (0BM7), the definition in the first paragraph; Stacks assumes `A` Noetherian, and every
statement using the definition does). API: `puncturedSpectrum_eq_iSup_basicOpen` (`U` is the union
of the basic opens `D(x_i)` for generators `x_i` of `𝔪`), `isCompact_puncturedSpectrum`, and
`restrictPunctured_faithful`: for `IsLocalRing.depth A ≥ 1` the restriction functor is faithful.
*Needs:* Tau Ceti `FiniteEtaleScheme`; Mathlib `MorphismProperty.Over.pullback`,
`PrimeSpectrum.basicOpen`, `IsLocalRing.closedPoint`; SchemeAndStackFoundations §0.17
(`IsLocalRing.depth`).

### 1.2 Finite normal algebras

Prove `spec_sections_of_depth` (Stacks, Lemma 58.20.1 (0BM8)): a finite morphism `π : Y ⟶ X` with
`IsLocalRing.depth 𝒪_{Y,y} ≥ 2` at every closed point `y` of `Y` is isomorphic over `X` to the
spectrum of `Γ(π⁻¹ U, 𝒪_Y)`. Prove `extends_iff_sections_finiteEtale` (Stacks, Lemma 58.20.2
(0BLK)): for `IsLocalRing.depth A ≥ 2` and `V` finite étale over `U`, `V` is the restriction of a
finite étale scheme over `X` iff `Γ(V, 𝒪_V)` is finite étale over `A`. Prove `finiteNormalEquiv`
(Stacks, Lemma 58.20.3 (0BM9), **with the correction of Convention 5**): for `A` a normal local
domain of dimension `≥ 2`, let `FiniteNormalPuncturedEtaleAlg A` be the full subcategory of
`CommAlgCat A` on finite normal, torsion-free `A`-algebras `B` such that
`Algebra.IsEtaleAt A 𝔮` for every prime `𝔮` of `B` not lying over `𝔪`, with ordinary algebra
homomorphisms as morphisms. Global sections reverses arrows, so the target is an
**anti-equivalence** `FEt U ≌ (FiniteNormalPuncturedEtaleAlg A)ᵒᵖ`, not an equivalence to the
unopposed algebra category. Its quasi-inverse takes the spectrum of an algebra and restricts it
to `U`; identify both composites with the identity. Moreover, `V` is the restriction of a finite
étale scheme over `X` iff `Γ(V, 𝒪_V)` is étale over `A`. When replacing the prototype `FEt U`
by Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin), identify the carrier
equivalence and show that it commutes with restriction and pullback; otherwise the sections
functor does not transport automatically.
*Needs:* §1.1; SchemeAndStackFoundations §0.17 (depth), §4.13 (`serre_normality_criterion`);
Mathlib `integralClosure`, `IsIntegralClosure`, `Algebra.IsEtaleAt`.

**Checks.**
- `test_closed_point_factor`: for `A = k⟦x, y⟧`, the algebras `A` and `A × A/𝔪` are finite and
  normal and are étale at every prime not lying over `𝔪`; only `A` is torsion free, and `A × A/𝔪`
  is not flat over `A`.

### 1.3 Completion and restriction to a hypersurface

Fix `f ∈ 𝔪` and set `X_0 = Spec (A ⧸ Ideal.span {f})` with punctured spectrum `U_0` (Stacks,
Situation 58.19.1 (0BLF)). Prove, each with the hypotheses and conclusion of its tag:
`finite_extend_of_completion` (Lemma 58.19.3 (0BLH)); `extends_iff_completion_extends` (Lemma
58.20.4 (0BLL)): a finite étale `V` over `U` is the restriction of a finite étale scheme over `X`
iff its base change to the punctured spectrum of the `𝔪`-adic completion `Â` is the restriction of
a finite étale scheme over `Spec Â`; `restrictHypersurface_fullyFaithful_of_completion` (Lemma
58.19.4 (0BLI)); `fullyFaithful_of_completion_coherent` (Lemma 58.17.1 (0EL8));
`completion_fullyFaithful_of_localCohomology` (Algebraic and Formal Geometry, Lemma 52.15.5
(0EKS)); `restrictHypersurface_fullyFaithful_of_localCohomology` (Lemma 58.19.6 (0BM6)): if
`H¹_𝔪(A)` and `H²_𝔪(A)` are annihilated by a power of `f` and `(A, (f))` is a henselian pair, then
restriction from finite étale schemes over `U` to finite étale schemes over `U_0` is fully
faithful; and `restrictHypersurface_fullyFaithful` (Lemma 58.19.7 (0BLJ)): the same for
`IsLocalRing.depth A ≥ 3` and `(A, (f))` a henselian pair.
For `finite_extend_of_completion`, specialize formal module gluing along `A → Â` and a finite
principal-open cover of `U` (More on Algebra, Proposition 15.91.16 (05ER)); its monoidal and
finiteness preservation (Remark 15.91.20 (05EU)) descends the algebra structure and finite
module. The target here is the finite-morphism specialization, not a second general gluing
theory. For
`completion_fullyFaithful_of_localCohomology`, use formal-section comparison (Algebraic and
Formal Geometry, Lemma 52.12.7 (0EII)) and its finite-locally-free completion criterion
(Lemma 52.15.1 (0EKP)); the §2.7 local-cohomology API supplies the vanishing hypotheses.
*Needs:* §1.2; SchemeAndStackFoundations §0.14 (henselian pairs), §0.17 (depth), §2.7
(`depth_localCohomology_vanishing`, `localCohomology_module_comparison`), §§4.7–4.8 (formal
completion, `CoherentFormalModule`); Mathlib `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`,
`localCohomology`.

### 1.4 The local Lefschetz extension theorem

Prove `finiteEtale_extend_of_hypersurface` (Stacks, Lemma 58.20.7 (0BLM)), with its route through
Lemma 58.20.6 as `finiteEtale_extend_of_localCohomology`: in Situation 58.19.1 with
`IsLocalRing.depth A ≥ 3`, if a finite étale `V` over `U` restricts on `U_0` to the restriction of
a finite étale `Y_0` over `X_0`, then `V` is the restriction of a finite étale scheme over `X`. The
proof reduces to the complete case by `extends_iff_completion_extends`, lifts `Y_0` along the
henselian pair `(Â, fÂ)` by SchemeAndStackFoundations §0.14 `henselian_finiteEtale_equivalence`,
and identifies the two covers of `U` by §1.3.
*Needs:* §1.3; SchemeAndStackFoundations §0.14.

## Layer 2: local purity and extension

### 2.1 Purity for regular local rings

Prove `IsLocalRing.purityHolds_of_isRegularLocalRing` and
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (Stacks, Lemma 58.21.3 (0BMA)): for `A`
regular local of dimension `d ≥ 2`, (1) `IsLocalRing.PurityHolds A`; (2) **with the correction of
Convention 5**, every finite normal `A`-algebra `B` (torsion free) with `Algebra.IsEtaleAt A 𝔮` for
every prime `𝔮` of `B` not lying over `𝔪` satisfies `Algebra.Etale A B`. The proof is by induction
on `d`, as in Stacks: (1) and (2) are equivalent by `finiteNormalEquiv`, since `A` is normal
(PurityOfBranchLocus §0.3 gives `IsRegularRing A` from `IsRegularLocalRing A`, then
SchemeAndStackFoundations §4.13 `IsRegular.isNormal` applies to `Spec A`). For `d = 2`, localize
at each maximal ideal `𝔮` of `B` and apply the **general** `flat_of_isCohenMacaulay` to
`A → B_𝔮`, not the finite-local helper: `B_𝔮` need not be finite as an `A`-module. It is a
normal local domain of dimension two by integrality, going down and the dimension formula; its
closed fibre over `A` has dimension zero because `B` is finite, and normality gives `(S₂)`,
hence Cohen–Macaulayness in dimension two. The finite-local `flat_of_normal_dim_two` remains a
separate corollary, not the localization argument. `Module.flat_of_isLocalized_maximal` now gives
flatness of `B` over `A`, hence freeness (`Module.free_of_flat_of_isLocalRing`); for a basis `b`,
if `Algebra.discr A b` were not a unit
it would lie in a prime `𝔭` minimal over it, of height at most one by Krull's principal ideal
theorem (`Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`), so `𝔭 ≠ 𝔪`, and
`Algebra.isUnit_discr_localization_iff` (§0.2) contradicts étaleness over `A_𝔭`; so `B` is étale by
`Algebra.etale_iff_isUnit_discr`. For `d ≥ 3`, an element `f ∈ 𝔪 ∖ 𝔪²` gives `A ⧸ Ideal.span {f}`
regular of dimension `d − 1` (Tau Ceti `TauCeti.IsRegularLocalRing.quotient_span_singleton`), and
`finiteEtale_extend_of_hypersurface` (§1.4) lifts the inductive extension; regular local rings
have depth `d` by a local parameter induction using
`TauCeti.IsRegularLocalRing.quotient_span_singleton` and the SchemeAndStackFoundations §0.17
depth/regular-element API. This local Cohen–Macaulay consequence does not assume
`IsRegularRing A` before 0AFS is available.
*Needs:* §§0.1, 0.2, 1.2, 1.4; PurityOfBranchLocus §0.3 (0AFS);
SchemeAndStackFoundations §§0.17, 4.13; Tau Ceti
`TauCeti.IsRegularLocalRing.quotient_span_singleton`; Mathlib `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`,
`Module.free_of_flat_of_isLocalRing`, `Module.flat_of_isLocalized_maximal`.

**Checks.**
- `test_closed_point_factor_not_etale`: for `A = k⟦x, y⟧` and `B = A × A/𝔪`, `B` is finite and
  normal, étale at every prime not lying over `𝔪`, and not étale over `A`; it is excluded by
  torsion freeness.
- `test_purity_needs_regular`: over a field `k` of characteristic `≠ 2`, for
  `A = k[x², xy, y²]` localized at the origin, the cover given by `k[x, y]` localized at the origin
  is finite étale over the punctured spectrum and does not extend to a finite étale cover of
  `Spec A`; so `IsLocalRing.PurityHolds A` fails for this normal, non-regular local ring of
  dimension two.

### 2.2 Spreading out and extension across points where purity holds

Prove `spread_from_localScheme` (Limits, Lemmas 32.20.3 (0BQ5) and 32.20.4 (0EY3)): for a scheme
`S`, a retrocompact open `U ⊆ S` and `s ∉ U`, with `V = Spec 𝒪_{S,s} ×_S U`, finitely presented
schemes over `U` and over `Spec 𝒪_{S,s}` whose restrictions to `V` are isomorphic glue to a finitely
presented scheme over an open `U' ⊇ U ∪ {s}`, uniquely up to shrinking `U'`; and if both are
separated, proper, finite or étale, the glued scheme has the same property after shrinking `U'`.
The proof applies SchemeAndStackFoundations §0.9 `finite_presentation_limits` to `Spec 𝒪_{S,s}` as
the limit of its affine open neighbourhoods. Prove `finiteEtale_extend_of_purity` (Stacks, Lemma
58.21.6 (0EY7)): for a Noetherian scheme `X` and an open `U ⊆ X` with
`IsLocalRing.PurityHolds 𝒪_{X,x}` for every `x ∉ U`, restriction from finite étale schemes over
`X` to finite étale schemes over `U` is essentially surjective. The proof is Noetherian induction
on the complement, extending across the generic point of an irreducible component of `X ∖ U` by
`spread_from_localScheme`. Prove `restrictOpen_fullyFaithful_of_depth` (*API*): for a locally
Noetherian scheme `X` and an open `U` with `IsLocalRing.depth 𝒪_{X,x} ≥ 2` for every `x ∉ U`,
restriction from finite étale schemes over `X` to finite étale schemes over `U` is fully faithful
(a finite étale scheme over `X` is the relative spectrum of a finite locally free algebra, whose
sections extend uniquely across `X ∖ U` by SchemeAndStackFoundations §0.6 `coherent_hartogs`).
Prove the corollary `finiteEtale_extend_of_regular_codimTwo` (*API*): for a locally Noetherian
scheme `X` and an open `U` such that `𝒪_{X,x}` is a regular local ring of dimension `≥ 2` for every
`x ∉ U`, restriction is essentially surjective. On each affine open it is
`finiteEtale_extend_of_purity` with `purityHolds_of_isRegularLocalRing`, and the local extensions
glue by `restrictOpen_fullyFaithful_of_depth` (regular local rings of dimension `d` have depth `d`).
*Needs:* §2.1; SchemeAndStackFoundations §§0.6, 0.9, 0.17; Mathlib `IsNoetherian`,
`IsLocallyNoetherian`, `Scheme.Opens`, `IsAffineOpen`.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Adapted*: same mathematics
in a different packaging, with the difference stated at the target. *Corrected*: the tag as
written is false and the target adds the missing hypothesis (Convention 5). *API*: no Stacks
counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 0.1 | `flat_of_isCohenMacaulay` | 10.128.1 (00R4) | exact |
| 0.1 | `flat_of_normal_dim_two` | — | API |
| 0.2 | `Algebra.etale_iff_traceForm_nondegenerate` | step of 49.3.1 (0BJF) | adapted (fibre case) |
| 0.2 | `Algebra.etale_iff_isUnit_discr` | 49.3.1 (0BJF) | adapted (affine, local base) |
| 0.2 | `Algebra.isUnit_discr_localization_iff` | — | API |
| 1.1 | `puncturedSpectrum`, `PurityHolds` | Section 58.20 (0BM7) | exact |
| 1.2 | `spec_sections_of_depth` | 58.20.1 (0BM8) | exact |
| 1.2 | `extends_iff_sections_finiteEtale` | 58.20.2 (0BLK) | exact |
| 1.2 | `finiteNormalEquiv` | 58.20.3 (0BM9) | corrected |
| 1.3 | Situation | 58.19.1 (0BLF) | exact |
| 1.3 | `finite_extend_of_completion` | 58.19.3 (0BLH) | exact |
| 1.3 | `extends_iff_completion_extends` | 58.20.4 (0BLL) | exact |
| 1.3 | `restrictHypersurface_fullyFaithful_of_completion` | 58.19.4 (0BLI) | exact |
| 1.3 | `fullyFaithful_of_completion_coherent` | 58.17.1 (0EL8) | exact |
| 1.3 | `completion_fullyFaithful_of_localCohomology` | 52.15.5 (0EKS) | exact |
| 1.3 | `restrictHypersurface_fullyFaithful_of_localCohomology` | 58.19.6 (0BM6) | exact |
| 1.3 | `restrictHypersurface_fullyFaithful` | 58.19.7 (0BLJ) | exact |
| 1.4 | `finiteEtale_extend_of_hypersurface` | 58.20.7 (0BLM) | exact |
| 2.1 | `purityHolds_of_isRegularLocalRing` | 58.21.3 (0BMA) (1) | exact |
| 2.1 | `etale_of_finiteNormal_of_isRegularLocalRing` | 58.21.3 (0BMA) (2) | corrected, affine |
| 2.2 | `spread_from_localScheme` | 32.20.3 (0BQ5), 32.20.4 (0EY3) | exact |
| 2.2 | `finiteEtale_extend_of_purity` | 58.21.6 (0EY7) | exact |
| 2.2 | `restrictOpen_fullyFaithful_of_depth`, `finiteEtale_extend_of_regular_codimTwo` | — | API |

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib, no `sorry`) contains a development of much of this material, built for
the "PCF all the way down" theorem. Paths are under `lean/Pcf/Stacks/`.

| § | Existing declarations | Files |
| --- | --- | --- |
| 0.1 | dimension-two miracle flatness | `Purity/MiracleFlatnessTwo.lean` |
| 1.1–1.2 | punctured spectrum, `FiniteNormalPuncturedEtalePurity`, the 0BM9 equivalence | `Purity/PuncturedSpectrum.lean`, `Purity/Tag0BM9.lean`, `Purity/Tag0BM9Equivalence.lean` |
| 1.4 | 0BLM for complete regular local rings | `Purity/HypersurfaceLiftingComplete.lean` |
| 2.1 | `puncturedSpectrumPurity_of_isRegularLocalRing`, `finiteNormalPuncturedEtalePurity_of_isRegularLocalRing` (0BMA, (2) corrected) | `Purity/Tag0BMA.lean` |

Its proof of 0BMA differs from Stacks': it proves clause (1) for the completion by an elementary
formal lifting and descends clause (2) along `A → Â`, instead of 0BLL/0BLH and 0BM6/0EKS.

## References

- The Stacks Project, Chapters 10 (Algebra), 32 (Limits), 49 (Discriminants), 52 (Algebraic and
  Formal Geometry) and 58 (Fundamental Groups of Schemes), https://stacks.math.columbia.edu.
- A. Grothendieck, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et
  globaux* (SGA 2), Exposé X, Théorème 3.4: a regular Noetherian local ring of dimension `≥ 2` is
  pure.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Théorème 3.1.
