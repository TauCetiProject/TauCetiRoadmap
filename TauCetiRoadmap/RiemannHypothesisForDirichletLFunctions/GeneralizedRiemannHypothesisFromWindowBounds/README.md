# Roadmap: the generalized Riemann hypothesis from window bounds

**Summary.** This roadmap proves the generalized Riemann hypothesis for every Dirichlet
L-function: for every modulus `N ≥ 1`, every Dirichlet character `χ` modulo `N` and every `s` with
`Re s > 1/2`, `L(s, χ) ≠ 0` unless `χ` is principal and `s = 1`. In particular it proves
Mathlib's `RiemannHypothesis`. The consequences of these theorems, among them the extended Riemann
hypothesis for the Dedekind zeta function of every number field abelian over `ℚ`, the Riemann
hypothesis for every Hecke character of such a field whose class field is abelian over `ℚ`, and
the theorems of other roadmaps that assume one of these statements, with that assumption removed,
are stated in
[ConsequencesOfTheRiemannHypothesisForDirichletLFunctions](../../ConsequencesOfTheRiemannHypothesisForDirichletLFunctions/README.md).

The formal proof [FormalProof] states five theorems: `RiemannHypothesis`, and the same statement
written out; for every modulus `N ≥ 1` and every Dirichlet character `χ` modulo `N`, `L(s, χ) ≠ 0`
for `Re s > 1/2` unless `χ` is principal and `s = 1`; and every zero of `L(s, χ)` with
`0 < Re s < 1` has `Re s = 1/2`, for every `χ` and in particular for primitive `χ`. These are 5.2
and the value and strip forms of 5.3. The forms through orders (5.1) and through completed
L-functions (ConsequencesOfTheRiemannHypothesisForDirichletLFunctions §0.1) follow from them by
Mathlib's continuation, functional equation and nonvanishing on `Re s ≥ 1`. The statements on
Dedekind zeta functions and Hecke characters, and the theorems of other roadmaps, are consequences
drawn from 5.1–5.3 in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions by the published
theorems cited there; they are not statements of the formal proof.

The analytic objects are Riesz-smoothed prime sums with their main terms removed. For a primitive
finite-order ray-class character `ψ` of a number field `K`, `G_ψ(y)` is the Riesz sum
`Σ_{𝔑𝔞 ≤ y} Λ_K(𝔞) ψ(𝔞)(y/𝔑𝔞 − 1)` plus the term that removes the pole of its Mellin transform at
`s = 1`; over `ℚ` and for `ψ` trivial it is the real function
`G(y) = Σ_{n ≤ y} Λ(n)(y/n − 1) − y log y + (1 + γ) y`.
A *weighted family* is a finitely supported nonnegative function `w` on these characters, and its
remainder is `G_w(y) = Σ_ψ w(ψ) Re G_ψ(y)`. The Mellin transform of `G_w` is meromorphic on `ℂ`;
its poles in `Re s > 0` are the zeros of the `L(s, ψ)` with `w(ψ) > 0` together with their complex
conjugates, every pole is simple, and the residue at a real pole is positive.

The headline theorems, besides the Riemann hypothesis itself, are these.

- *The windowed Landau theorem for families.* Let `0 < θ < 1` and `λ > 1`. If there are
  arbitrarily large `Y` such that `G_w(y) ≤ y^θ` for every `y ∈ [Y, Y^λ]`, then no `L(s, ψ)` with
  `w(ψ) > 0` vanishes in `Re s > θ`. The bound is one-sided and is required only on windows of
  scales arbitrarily far out, never for all large `y`.
- *Window bounds are the generalized Riemann hypothesis.* For a weighted family over any number
  field and `σ ∈ [1/2, 1)`: every `L(s, ψ)` with `w(ψ) > 0` is zero-free in `Re s > σ` if and only
  if for every `ε > 0` the window bound of the previous item holds at `θ = σ + ε` for some
  `λ > 1`. In particular `RiemannHypothesis` holds if and only if, for every `ε > 0`, there are
  `λ > 1` and arbitrarily large `Y` with `G(y) ≤ y^{1/2+ε}` on `[Y, Y^λ]`.
- *Cyclic families.* For a primitive Dirichlet character `ψ`, its cyclic family `𝒦(ψ)` is the set
  of primitive characters inducing the powers of `ψ`. The family carries positive weights with
  window bounds at every exponent `1/2 + ε` if and only if every member satisfies the Riemann
  hypothesis; so window bounds for every cyclic family are equivalent to the generalized Riemann
  hypothesis for Dirichlet L-functions. The roadmap
  [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) of the family
  [RiemannHypothesisForDirichletLFunctions](../README.md) proves, by arithmetic means, the window
  bounds for the cyclic family of every primitive `ψ`; this roadmap
  turns them into the theorems above.

The roadmap builds on
[RiemannHypothesisStatementsAndConsequences](../RiemannHypothesisStatementsAndConsequences/README.md), which supplies the Riesz remainder of one
character with its Mellin transform, poles and explicit formula, the Riemann-hypothesis predicates
of Dirichlet characters, Dedekind zeta functions and ray-class characters with their equivalent
forms, the consequences of a zero-free half-plane, and the bundled primitive Dirichlet characters
with their dictionary with the characters of `ℚ`; on
[ZerosOfLFunctions](../../ZerosOfLFunctions/README.md), whose §8.6a states the explicit formula for
the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞` for every primitive finite-order ray-class character `ψ`; on
[ArithmeticDirichletSeriesPartII](../../ArithmeticDirichletSeriesPartII/README.md), whose §0.1b
states Landau's theorem for Laplace integrals of functions of one sign, which 1.1 and 1.2 apply; on
[PositivityOfDirichletSeriesWithKernels](../PositivityOfDirichletSeriesWithKernels/README.md),
whose Layer 6 proves Landau's theorem for Laplace transforms in its one-sided and its windowed forms;
on [LFunctions](../../LFunctions/README.md) for the primitive ray-class characters and their
L-functions; on [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) for the
cyclic families and on ThetaChainsAndFrobeniusPrimeSums for their window bounds; and on
[AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md), whose §1.6 states the
reduction of the hypothesis to primitive characters, of which 3.4 is a corollary. Its headline
theorems feed
[ConsequencesOfTheRiemannHypothesisForDirichletLFunctions](../../ConsequencesOfTheRiemannHypothesisForDirichletLFunctions/README.md),
which states the theorems of AnalyticNumberTheoryPartI,
[ExplicitZetaBounds](../../ExplicitZetaBounds/README.md),
[ExplicitPrimeCounting](../../ExplicitPrimeCounting/README.md) and the other roadmaps whose statements
assume the Riemann hypothesis for Dirichlet L-functions, with that assumption removed.

Layer 0 sets up weighted families, reads the cyclic families of Dirichlet characters as families
over `ℚ`, and proves the size of the remainder of a family, its Mellin transform, and the location
and residues of the poles of that transform. Layer 1 states Landau's theorem for a family from a
bound for all large `y`, as a corollary of ArithmeticDirichletSeriesPartII §0.1b, and the one-sided
converse for `ψ_K(x) − x`. Layer 2 proves the windowed
theorem for families. Layer 3 shows that window bounds at every exponent `σ + ε` are equivalent to
zero-freeness right of `σ` and reduces all Dirichlet characters to cyclic families. Layer 4
proves that window bounds for a cyclic family are equivalent to the Riemann hypothesis for its
members. Layer 5 proves the headline theorems in the forms through orders, through values and on
the critical strip.

## Conventions

- **Zeros.** A zero of `f` at `ρ` is a point of positive meromorphic order,
  `0 < meromorphicOrderAt f ρ`. `ZeroFreeRightOf σ f` is RiemannHypothesisStatementsAndConsequences
  §9.2's predicate:
  `meromorphicOrderAt f s ≤ 0` for every `s` with `Re s > σ`; poles are allowed. Mathlib's values at
  poles (`riemannZeta 1`, the value of a principal Dirichlet L-function at `1`) enter only the value
  form of `riemannZeta` in 5.3, where Mathlib's own statements read them.
- **Characters.** `K` is a number field. A *character* of `K` is a primitive finite-order
  ray-class character, a term `ψ : PrimitiveRayClassCharacter K` (LFunctions Layer 5), and
  `L(s, ψ)` is its continued L-function `heckeLFunctionC ψ.character`. The trivial character
  `1 : PrimitiveRayClassCharacter K` has L-function `dedekindZetaC K`, written `ζ_K`. A primitive
  Dirichlet character is a term of `PrimitiveDirichletCharacter`
  (RiemannHypothesisStatementsAndConsequences §10.3), and
  *PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter*
  (RiemannHypothesisStatementsAndConsequences §11.1) is the
  equivalence with the characters of `ℚ`, under which the L-functions agree.
- **Prime sums.** `Λ_K` is the ideal von Mangoldt function (Tau Ceti
  `TauCeti.IdealArithmeticFunction.vonMangoldt`, as in LFunctions Layer 8) and
  `ψ_K = TauCeti.primePsi K Set.univ`, `ψ_K(x) = Σ_{𝔑𝔞 ≤ x} Λ_K(𝔞)`; over `ℚ` it is
  `Chebyshev.psi`.
- **The remainder `G_ψ`.** `G_ψ` = *PrimitiveRayClassCharacter.rieszRemainder* `ψ`, the Riesz remainder
  of RiemannHypothesisStatementsAndConsequences §8.4a(b): the Riesz sum `rieszSum` of
  RiemannHypothesisStatementsAndConsequences §8.4a(a) of the coefficients of
  `−L′/L(·, ψ)`, plus `y · (L′/L)(1, ψ)` for `ψ ≠ 1`, and minus `y log y` plus
  `(1 + EK(K)) y` for `ψ = 1`, where `EK(K)` is the Euler–Kronecker constant
  *NumberField.eulerKroneckerConstant* `K` and `EK(ℚ) = γ`. It is complex-valued; `Re G_ψ` enters families. For a primitive Dirichlet character
  `κ`, `G_κ` denotes `PrimitiveDirichletCharacter.rieszRemainder κ`, which is the remainder of the
  character of `ℚ` attached to `κ` (RiemannHypothesisStatementsAndConsequences §8.4a(b)).
- **Windows.** `HasWindows S λ`, for `S ⊆ ℝ` and `λ > 1`, is PositivityOfDirichletSeriesWithKernels
  §6.9(a)'s predicate: for every `Y₀` there is `Y ≥ max(Y₀, 1)` with `[Y, Y^λ] ⊆ S`. Under `y = e^u`
  a window `[Y, Y^λ]` is the window `[U, λU]`, `U = log Y`, of the Laplace variable: windows have
  fixed ratio `λ` in `log y`. `λ` is always existential and may depend on every quantity fixed
  before it. The predicate is equivalent to that of [FormalProof],
  `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows`).
- **Quantifier order.** Uniformity is a quantifier order: a constant chosen before `ε` does not
  depend on `ε`; a window set chosen after `ε` may.
- **The hypotheses.** The predicates are those of RiemannHypothesisStatementsAndConsequences §§9.4–9.5:
  `χ.GeneralizedRiemannHypothesis` for `χ : DirichletCharacter ℂ N` with `[NeZero N]`
  (`ZeroFreeRightOf (1/2) χ.LFunction`), and `χ.GeneralizedRiemannHypothesis` for
  `χ : RayClassCharacter 𝔪`, read for a character `ψ` of `K` on `ψ.character`. There is no predicate
  for a family of characters, for a modulus or for all characters: such statements carry their
  quantifiers.
- **No fixed constants.** Every exponent, window ratio and weight of a statement here is a
  parameter with its true constraint.

**Statements of the formal proof.** The headline theorems that [FormalProof] states (5.2 and the
value and strip forms of 5.3) are stated here in the form that proof establishes: their hypotheses,
ranges and constants are those of the proof, including restrictions that the route written here
does not visibly use. The targets that the proof states only over `ℚ` or in a weaker form (0.4,
0.5, 0.6, 2.1, 2.2: the Layer 0 preamble), and the implications from window bounds whose step it takes
(3.3, 3.5, 4.2), are stated in the generality given with each, and the routes written here prove
them in that generality.

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The definitions of 0.1–0.3 carry the
first label only. The statements of 1.1–1.3, 2.4, 2.5 and 3.2 are not
statements of [FormalProof]: 1.1–1.3 apply published theorems, cited with each, to the objects of
this roadmap; 3.2 adapts a published bound for `ψ(x) − x` to the Riesz remainder; 2.4, 2.5, the
number-field form of 1.3 and the form of 2.3 over a number field are this roadmap's own
formulations.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels,
`*Corollary of:*`, which names a general theorem and the roadmap section that states it, and the
clauses it covers when it does not cover the whole section. As long as that general theorem is not
in the library, what the line covers is proved as [FormalProof] proves it: the
`*Method of the formal proof:*` label says how, and for which form of the statement when that proof
has a narrower one; the route given with the section is that proof's unless the label says that it
differs. Once the general theorem is in the library, the proof of what the line covers is replaced
by the deduction from it, and the lemmas that only the first proof uses are removed. The statement
does not change.

## Layer 0: weighted families and their Riesz remainders

Over `ℚ`, for families of primitive Dirichlet characters, the transform of a family with its poles
(0.5, 0.6) and the windowed theorem (2.1, 2.2) are statements of [FormalProof], there with the
transform identified on `Re s > 2` and continued to `Re s > 0`, with the bound `C y²` for the
remainders, and for `0 < θ < 1`. For a general number field `K`, and in the sharper forms stated
here (the bound `C y`, the half-plane `Re s > 1`, meromorphy on `ℂ`), they are this roadmap's
extension: the same argument, applied to the pole structure of 0.6.

### 0.1 Weighted families

*Origin:* definitions and conventions.

A *weighted family* of characters of `K` is a finitely supported function
`w : PrimitiveRayClassCharacter K →₀ ℝ` with `0 ≤ w`; its *members* are the characters of
`w.support`, those of positive weight. No new type is introduced: the operations on families are
those of `Finsupp`, and each of them preserves `0 ≤ w`. Over `ℚ` a weighted family is a case of the families of
[FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.CharFamily`).

- Union is `w + w′`, whose members are those of `w` and of `w′`; scaling by `c ≥ 0` is `c • w`;
  restriction to a set `S` of characters is `w.filter (· ∈ S)`.
- Inversion is `w^∨ = w.mapDomain (·⁻¹)`, so `w^∨(ψ) = w(ψ⁻¹)`, the inverse of LFunctions Layer 5
  being an involution; the symmetrization `w^s = (1/2) • (w + w^∨)` has as members those of `w` and
  their inverses, and `w^s(ψ⁻¹) = w^s(ψ)`.
- The empty family `w = 0` is allowed; its remainder is `0` and every statement below is vacuous
  for it.

*Needs:* LFunctions Layer 5 (`PrimitiveRayClassCharacter`, `PrimitiveRayClassCharacter.character_inv`);
Mathlib `Finsupp`, `Finsupp.mapDomain`, `Finsupp.filter`, `Finsupp.le_def`.

**Checks.**

- Inversion: `(single ψ c)^∨ = single ψ⁻¹ c`, and `w^∨ = w` when every member of `w` is real
  (`ψ⁻¹ = ψ`); inverting the weights instead, `ψ ↦ w(ψ)⁻¹`, would send `single ψ 2` to
  `single ψ (1/2)`, which keeps the member `ψ` and is not the family of the inverse characters.
- Union needs nonnegative weights: `single ψ 1 + single ψ (−1) = 0`, so for functions of both
  signs the support of `w + w′` can be smaller than the union of the supports; for `0 ≤ w` and
  `0 ≤ w′` it is the union. Functions with weights of both signs are the non-example that 0.6
  uses.
- Scaling: `0 • w` is the empty family `0`, whatever `w`; the scaled family has the same members
  only for `c > 0`.

### 0.2 Cyclic families of Dirichlet characters as families over `ℚ`

*Origin:* definitions and conventions.

For a primitive Dirichlet character `ψ` of order `o`, its cyclic family `𝒦(ψ)` is that of
FrobeniusRestrictedRieszSums §0.5: the set of primitive
Dirichlet characters inducing the powers `ψ^k`, `k ∈ ℤ/o`, with `k ↦ (ψ^k)*` a bijection onto it,
`1, ψ ∈ 𝒦(ψ)`, closed under inversion, and every conductor dividing that of `ψ`. This roadmap
uses that definition unchanged, reading `𝒦(ψ)` as a finite set of bundles,
`PrimitiveDirichletCharacter.cyclicFamily ψ : Finset PrimitiveDirichletCharacter`
(RiemannHypothesisStatementsAndConsequences §10.3 for the bundles), the image of `l ↦ (ψ^l)*` on
`0 ≤ l < o`. Write `𝒦_ℚ(ψ)` for its image under
*toPrimitiveRayClassCharacter*, a finite
set of characters of `ℚ`, and, for weights `w : PrimitiveDirichletCharacter → ℝ`, write
`w_ℚ = (Finsupp.indicator 𝒦(ψ) fun κ _ ↦ w κ).mapDomain toPrimitiveRayClassCharacter`, the
finitely supported function on the characters of `ℚ` with
`w_ℚ(toPrimitiveRayClassCharacter κ) = w(κ)` for `κ ∈ 𝒦(ψ)` and `0` elsewhere
(`Finsupp.mapDomain_apply_of_injective`, `Finsupp.indicator_apply`). As a set of characters, `𝒦(ψ)` is that of [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean`
(`Formalism.HC.Level.cyc`, `Formalism.HC.Level.ofSub`, `Formalism.HC.Level.mem_cyc`).

- `#𝒦_ℚ(ψ) = o`; `𝒦_ℚ(ψ)` contains the trivial character of `ℚ` and the image of `ψ`, and is closed
  under inversion, the equivalence commuting with `1` and `⁻¹`.
- The image of `κ ∈ 𝒦(ψ)` has finite conductor `(κ.level)`, which divides the finite conductor of
  the image of `ψ`.
- `w_ℚ` is a weighted family exactly when `w(κ) ≥ 0` for every `κ ∈ 𝒦(ψ)`, whatever the values
  of `w` off `𝒦(ψ)`, and its members are the images of the `κ ∈ 𝒦(ψ)` with `w(κ) > 0`.

*Needs:* 0.1; FrobeniusRestrictedRieszSums §0.5; RiemannHypothesisStatementsAndConsequences §10.3
(`PrimitiveDirichletCharacter`),
§11.1 (*PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter*, its values, conductors and
compatibility with `1` and `⁻¹`); Mathlib `Finsupp.indicator`, `Finsupp.indicator_apply`,
`Finsupp.mapDomain_apply_of_injective`.

**Checks.**

- `ψ = χ₋₄`: `𝒦(ψ) = {1, χ₋₄}`, and `𝒦_ℚ(ψ)` consists of the trivial character of `ℚ` and the
  character of conductor `ratModulus 4`, the real place included.
- Let `φ` be a character of order `4` modulo `5` and `ψ = χ₋₄ φ`, primitive of conductor `20` and
  order `4`. Then `ψ² = φ²` on integers prime to `20`, and `φ² = (·/5)`, so
  `𝒦(ψ) = {1, ψ, (·/5), ψ³}`, of conductors `1, 20, 5, 20`. Taking the powers of `ψ` as characters
  modulo `20` instead would put the imprimitive square into the family, whose L-function is
  `L(s, (·/5))(1 + 2^{−s})` since `(2/5) = −1`: a different function, with a different remainder.

### 0.3 The remainder of a family

*Origin:* definitions and conventions.

For a finitely supported `w : PrimitiveRayClassCharacter K →₀ ℝ` define its *remainder*
`G_w(y) = Σ_ψ w(ψ) Re G_ψ(y)`, that is `w.sum fun ψ c ↦ c * (ψ.rieszRemainder y).re`; a real function
of `y`. Over `ℚ` it is the remainder of a family of [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.Gm`, `Deduction.Gchi`), and the
conjugation `G_{ψ⁻¹} = conj G_ψ` below is
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/GchiConj.lean` (`Deduction.Gchi_conj`).

- `G_{w+w′} = G_w + G_{w′}` and `G_{c•w} = c G_w`.
- `Re G_ψ = (G_ψ + G_{ψ⁻¹})/2`, by the conjugation clause of
  RiemannHypothesisStatementsAndConsequences §8.4a(b),
  `G_{ψ⁻¹} = conj G_ψ`; hence `G_{w^∨} = G_w` and `G_{w^s} = G_w`, and if `w = w^∨` then
  `G_w = Σ_ψ w(ψ) G_ψ`.
- Over `ℚ`, for a primitive Dirichlet character `ψ` and weights `w` on `𝒦(ψ)` (0.2),
  `G_{w_ℚ}(y) = Σ_{κ ∈ 𝒦(ψ)} w(κ) Re G_κ(y)`, by the agreement of the Dirichlet and the ray-class
  remainders in RiemannHypothesisStatementsAndConsequences §8.4a(b) and the injectivity of
  *toPrimitiveRayClassCharacter*.

*Needs:* 0.1, 0.2; RiemannHypothesisStatementsAndConsequences §8.4a(b) (the remainder, its
conjugation, the Dirichlet form);
Mathlib `Finsupp.sum`, `Finsupp.sum_add_index'`, `Finsupp.sum_smul_index'`.

**Checks.**

- `K = ℚ`, `w = single 1 1`: `G_w = G`. At `y = 1` the Riesz sum is empty (`Λ(1) = 0`), so
  `G(1) = 1 + γ ≈ 1.5772`. At `y = 2` the sum is `Λ(2)(2/2 − 1) = 0`, so
  `G(2) = 2(1 + γ − log 2) ≈ 1.7681`. A main term `+ y log y` in place of `− y log y` gives
  `G(2) ≈ 4.541`.
- `K = ℚ`, `w = single χ₋₄ 1`: `χ₋₄` is real, so `G_{χ₋₄}` is real and `G_w = G_{χ₋₄}`.

### 0.4 Size of the remainder of a family

*Origin:* adapted from Ihara, Murty and Shimura (2009): the explicit formula for the first Riesz
mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞`, for every primitive finite-order ray-class character `ψ` of a number field
(ZerosOfLFunctions §8.6a), bounds the remainder `G_ψ` by `C′ y`; here the remainder of a weighted
family, with its continuity and the bounds `C y²` and `C′ y`. Its continuity and the integrability
of `|G_w(y)| y^{−σ−1}` on `[1, ∞)` for `σ > 1` are this roadmap's own formulation.

*Method of the formal proof:* over `ℚ`, for a family of Dirichlet characters with positive weights,
the remainder is measurable and bounded by `C y²` for `y ≥ 1`; the bound is obtained term by term
from the size of each term of the Riesz sum.

For a weighted family `w`, `G_w : ℝ → ℝ` is continuous on `ℝ`, hence measurable, and there is
`C_w` with `|G_w(y)| ≤ C_w y²` for every `y ≥ 1`: with measurability, the hypotheses on `G` of
PositivityOfDirichletSeriesWithKernels §6.9(b) in the form of the formal proof, under which the Mellin integral of `G_w`
converges absolutely on `Re s > 2`. Sharper, there is `C′_w` with `|G_w(y)| ≤ C′_w y` for every `y ≥ 1`. Hence
`∫_1^∞ |G_w(y)| y^{−σ−1} dy < ∞` for every real `σ > 1`: with measurability, the hypotheses on `G` of the extension of
PositivityOfDirichletSeriesWithKernels §6.9(b) at `A = 1`.

Route: `rieszSum` is continuous on `ℝ` (RiemannHypothesisStatementsAndConsequences §8.4a(a)), and so
are `y ↦ y log y`
(Mathlib `Real.continuous_mul_log`) and `y ↦ y`; so each `G_ψ`, its real part and the finite
sum `G_w` are continuous, and measurable (`Continuous.measurable`). The size clause of
RiemannHypothesisStatementsAndConsequences §8.4a(b),
`‖G_ψ(y)‖ ≤ C_ψ y²`, termwise, and its sharper form `‖G_ψ(y)‖ ≤ C′_ψ y`, by the explicit formula
of ZerosOfLFunctions §8.6a; the triangle
inequality with `C_w = Σ_ψ w(ψ) C_ψ` and `C′_w = Σ_ψ w(ψ) C′_ψ`; and `∫_1^∞ y^{−σ} dy = 1/(σ − 1)`.

*Needs:* 0.3; RiemannHypothesisStatementsAndConsequences §8.4a(a)–(b); ZerosOfLFunctions §8.6a;
Mathlib `Real.continuous_mul_log`, `Continuous.measurable`.

### 0.5 The transform of a family

*Origin:* adapted from Ihara, Murty and Shimura (2009): the explicit formula for the first Riesz
mean comes from the kernel `y^s/(s(s − 1))` against `−L′/L(·, ψ)`, for every primitive finite-order
ray-class character `ψ` (ZerosOfLFunctions §8.6a); here the transform of a weighted family, as a
meromorphic function analytic at `1`, with its conjugation as an identity of germs; these clauses,
and the identity on `Re s > 1` for the family, are this roadmap's own formulation.

*Method of the formal proof:* over `ℚ`, for a family of Dirichlet characters: for one character
the transform is computed term by term on `Re s > 1` and written as an explicit quotient of `L′/L`
by `s(s − 1)`; for the family it is identified with the Laplace integral of the remainder on
`Re s > 2`.

For a weighted family `w` put `Φ_w = Σ_ψ w(ψ)(Φ_ψ + Φ_{ψ⁻¹})/2`, with `Φ_ψ` the Mellin transform
of `G_ψ` in RiemannHypothesisStatementsAndConsequences §8.4a(b).

- For `Re s > 1`, `∫_1^∞ G_w(y) y^{−s−1} dy = Φ_w(s)`, absolutely, and
  `HasLaplace (u ↦ G_w(e^u)) s (Φ_w s)`.
- `Φ_w` is meromorphic on `ℂ` and analytic at `1`.
- Conjugation, as an identity of meromorphic germs: the function `s ↦ conj Φ_w(s̄)` agrees with
  `Φ_w` on a punctured neighbourhood of every point of `ℂ`, and on all of `Re s > 1`. Hence
  `meromorphicOrderAt Φ_w s̄ = meromorphicOrderAt Φ_w s` for every `s`, the principal part of
  `Φ_w` at `s̄` is the conjugate of that at `s`, and `Φ_w(s̄) = conj Φ_w(s)` at every `s` at which
  `Φ_w` is analytic both at `s` and at `s̄`.

Route: the Mellin-transform and continuation clauses of RiemannHypothesisStatementsAndConsequences
§8.4a(b) for `ψ` and `ψ⁻¹`, and 0.3
(`Re G_ψ = (G_ψ + G_{ψ⁻¹})/2`); absolute convergence by 0.4, and the substitution `y = e^u` of
PositivityOfDirichletSeriesWithKernels §6.9(b). From `G_{ψ⁻¹} = conj G_ψ`, `Φ_{ψ⁻¹}(s̄) = conj Φ_ψ(s)` on
`Re s > 1`. The function `s ↦ conj Φ_w(s̄)` is meromorphic on `ℂ` and agrees with `Φ_w` on
`Re s > 1`, so by the identity theorem for meromorphic functions on the connected set `ℂ` the two
agree on a punctured neighbourhood of every point; orders and principal parts are read from these
germs, and the values agree where both functions are analytic, by continuity. At a pole the value
of a total function is not determined by its germ, so the identity is not asserted there.

*Needs:* 0.3, 0.4; RiemannHypothesisStatementsAndConsequences §8.4a(b);
ArithmeticDirichletSeriesPartII §0.1 (`HasLaplace`);
PositivityOfDirichletSeriesWithKernels §6.9(b).

### 0.6 Poles and residues of the transform

*Origin:* adapted from Ihara, Murty and Shimura (2009): the coefficients `m_ρ/(ρ(1 − ρ))` of the
zero sum of the explicit formula for the first Riesz mean, for every primitive finite-order
ray-class character (ZerosOfLFunctions §8.6a), read as the residues of the transform; here the poles
and residues of the transform of a weighted family, with the nonvanishing on the line `Re s = 1` of
ZerosOfLFunctions §6.5 and, for the nontrivial members, on `Re s ≥ 1` of LFunctions Layer 7.

*Method of the formal proof:* for one character the transform is the explicit quotient
`−(L′/L(s) − s·L′/L(1) + k(1 − s))/(s(s − 1))` with a constant `k` (with `(s − 1)ζ(s)` in place of
`L` for the trivial character), which has at a zero `ρ` of order `m` a simple pole with coefficient `m/(ρ(1 − ρ))` by
the local form of the logarithmic derivative; the members and their inverses are added with the
positive weights, a zero of `L(·, ψ⁻¹)` being a zero of `L(·, ψ)` at the conjugate point, so the
coefficients do not cancel, and the nonvanishing on `Re s ≥ 1` puts the poles in `0 < Re ρ < 1`.

*Corollary of:* ZerosOfLFunctions §8.6a (the explicit formula for the first Riesz mean of
`Λ_K(𝔞) ψ(𝔞)/𝔑𝔞`, whose zero sum has the coefficients `m_ρ/(ρ(1 − ρ))`).

Let `w` be a weighted family and let `Z(w)` be the set of `ρ` with `Re ρ > 0` such that
`L(·, ψ)` has positive order at `ρ` or at `ρ̄` for some member `ψ`. Over `ℚ` the statements below follow from
[FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/poleData.lean`
(`Deduction.poleData`, `Deduction.poleData_char`), with `Z(w)` the set
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean` (`Deduction.zeroSet`).

- In `Re s > 0` the poles of `Φ_w` are exactly the points of `Z(w)`. Every pole is simple, with
  residue `S_w(ρ)/(ρ(1 − ρ))`, where
  `S_w(ρ) = ½ Σ_ψ w(ψ)(ord_ρ L(·, ψ) + ord_{ρ̄} L(·, ψ)) > 0`.
- `Z(w)` is closed under conjugation and lies in `0 < Re ρ < 1`; a real pole lies in `(0, 1)` and
  its residue is positive.

Route: by the continuation-and-poles clause of RiemannHypothesisStatementsAndConsequences §8.4a(b),
in `Re s > 0` the poles of `Φ_ψ` are the
zeros of `L(·, ψ)`, each simple with residue `m/(ρ(1 − ρ))`, `m` the order; and
`ord_ρ L(·, ψ⁻¹) = ord_{ρ̄} L(·, ψ)` (RiemannHypothesisStatementsAndConsequences §9.5, inverse clause, through
`TauCeti.meromorphicOrderAt_conj_conj`). The residues of the summands at `ρ` have the common
factor `1/(ρ(1 − ρ))` and nonnegative integer coefficients weighted by positive reals, so they do
not cancel. No member has a zero on `Re s ≥ 1`: for a nontrivial member `ψ`,
`heckeLFunction_ne_zero_of_one_le_re` (LFunctions Layer 7), stated for nontrivial primitive
characters; for the trivial member `ζ_K`, nonvanishing on `Re s > 1` by the Euler product (Tau Ceti
`TauCeti.dedekindZeta_ne_zero_of_one_lt_re`) and, on `Re s = 1`, ZerosOfLFunctions §6.5: order `0`
at `1 + it`, `t ≠ 0` (`meromorphicOrderAt_dedekindZetaC_one_add`), and `−1` at `1`
(`meromorphicOrderAt_dedekindZetaC_one`). So `Z(w)` lies in `0 < Re ρ < 1`, and a real pole `ρ` has
`0 < ρ < 1` and `ρ(1 − ρ) > 0`.

*Needs:* 0.5; ZerosOfLFunctions §6.5 and RiemannHypothesisStatementsAndConsequences §§8.4a(b), 9.2,
9.5; LFunctions Layers 3, 7; Tau Ceti
`TauCeti.dedekindZeta_ne_zero_of_one_lt_re`.

**Checks.**

- Positivity of the weights is what makes `Z(w)` the union of the zero sets: for the function with
  weights `1` and `−1` at `ψ` and `ψ⁻¹`, not a weighted family, the remainder is identically `0`
  (0.3) and the transform has no pole at all, whatever the zeros of `L(·, ψ)`.
- `K = ℚ`, `w = single 1 1`: `Z(w)` is the set of nontrivial zeros of `ζ`; at the first,
  `ρ = 1/2 + it`, `t = 14.1347…`, the residue is `1/(ρ(1 − ρ)) = 1/(1/4 + t²) ≈ 0.0049990`, real
  and positive.

### Examples

Over `ℚ` the family `single 1 1` has the remainder `G`, with `G(1) = 1 + γ ≈ 1.5772` and
`G(2) = 2(1 + γ − log 2) ≈ 1.7681` (0.3); its transform has at the first zero `1/2 + it`,
`t = 14.1347…`, of `ζ` a simple pole with residue `1/(1/4 + t²) ≈ 0.0049990` (0.6). The cyclic
family of `χ₋₄` is `{1, χ₋₄}`; that of the primitive character `χ₋₄ φ` of conductor `20` and order
`4`, `φ` of order `4` modulo `5`, is `{1, ψ, (·/5), ψ³}`, of conductors `1, 20, 5, 20` (0.2).
Inversion sends `single ψ c` to `single ψ⁻¹ c` (0.1).

### Dependencies

RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2, 9.5, 10.3, 11.1;
FrobeniusRestrictedRieszSums §0.5; PositivityOfDirichletSeriesWithKernels §6.9; ZerosOfLFunctions
§§6.5, 8.6a; ArithmeticDirichletSeriesPartII §0.1; LFunctions Layers 3, 5 and 7; Tau Ceti's Dedekind zeta
function on `Re s > 1` and the conjugation of meromorphic orders; Mathlib's finitely supported functions.

## Layer 1: Landau's theorem for weighted families

These statements take a one-sided bound for all large `y`. Their zero-free conclusions at `θ > 0` are also
special cases of Layer 2, where the bound is needed only on windows; their convergence conclusions
are not. 1.1 and 1.2 are corollaries of Landau's theorem for Laplace integrals of functions of one
sign, ArithmeticDirichletSeriesPartII §0.1b, for the remainders of Layer 0, and 1.3 applies it to
`ψ_K(x) − x`; all three take it in its one-sided form, PositivityOfDirichletSeriesWithKernels §6.4.
None of them is a statement of [FormalProof].

### 1.1 Upper bounds for the remainder

*Origin:* adapted from Landau (1905): Landau's theorem for Laplace integrals of functions of one
sign (ArithmeticDirichletSeriesPartII §0.1b), applied to the remainder of a weighted family under an
upper bound.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `w` be a weighted family of characters of `K`,
`0 ≤ θ < 1` and `C`, `y₀` real. If `G_w(y) ≤ C y^θ` for every `y ≥ y₀`, then every member `ψ`
satisfies `ZeroFreeRightOf θ (heckeLFunctionC ψ.character)`, and
`∫_1^∞ |C y^θ − G_w(y)| y^{−σ−1} dy < ∞` for every real `σ > θ`.

Route: PositivityOfDirichletSeriesWithKernels §6.4(b), Landau's theorem (ArithmeticDirichletSeriesPartII
§0.1b) in its one-sided form, with `A = 1` for `g(u) = G_w(e^u)`: its transform
`Φ_w` on `Re s > 1` is meromorphic on `ℂ` (0.5), and its real poles in `(θ, 1]` lie in `(0, 1)`,
are simple and have positive residue, which at a simple pole is the leading coefficient (0.6).
PositivityOfDirichletSeriesWithKernels §6.4(b) gives that `Φ_w` has no pole in `Re s > θ` and that
`∫_0^∞ |C e^{θu} − g(u)| e^{−σu} du < ∞`
for real `σ > θ`, the stated integral after `y = e^u`. A zero of `L(·, ψ)` with `Re ρ > θ ≥ 0`
would be a pole (0.6).

*Needs:* 0.5, 0.6; ArithmeticDirichletSeriesPartII §0.1b, through its one-sided form
PositivityOfDirichletSeriesWithKernels §6.4; RiemannHypothesisStatementsAndConsequences §9.2.

**Checks.**

- The sign of the residue at a real pole is what excludes a real zero above `θ`: a real zero
  `β ∈ (θ, 1)` contributes `y^β/(β(1 − β)) > 0` to `G_w` through the explicit formula, which an
  upper bound `C y^θ` forbids.

### 1.2 Lower bounds for the remainder

*Origin:* adapted from Landau (1905): Landau's theorem for Laplace integrals of functions of one
sign (ArithmeticDirichletSeriesPartII §0.1b), applied to the remainder of a weighted family under a
lower bound and, through the negativity of `ζ` on `(0, 1)`, to `ζ_K` and `ζ`.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `w` be a weighted family of
characters of `K`, `0 ≤ θ < 1` and `C`, `y₀` real. If `G_w(y) ≥ −C y^θ` for every `y ≥ y₀`, then
either every member is zero-free right of `θ` and the Mellin integral of `G_w` converges absolutely
on `Re s > θ`, or some member has a real zero `β ∈ (θ, 1)` such that every zero of every member in
`Re s > 0` has real part at most `β`, and the integral converges absolutely on `Re s > β`. If no
member has a real zero in `(θ, 1)`, the first alternative holds. So if the trivial character is a
member (`w(1) > 0`) and no member has a zero in the real interval `(θ, 1)`, then
`ZeroFreeRightOf θ ζ_K`; for `w = single 1 1` the condition is that `ζ_K` has no zero in
`(θ, 1)`, and for `K = ℚ`, `w = single 1 1`, a lower bound alone gives
`ZeroFreeRightOf θ riemannZeta`.

Route: PositivityOfDirichletSeriesWithKernels §6.4(d), Landau's theorem (ArithmeticDirichletSeriesPartII
§0.1b) in its one-sided form for lower bounds, for `g(u) = G_w(e^u)`
(PositivityOfDirichletSeriesWithKernels §6.4(b) and (c) for `−g`). The
real poles of `Φ_w` have positive leading coefficients (0.6), so either `Φ_w` has no real pole in
`(θ, 1]`, and then no pole in `Re s > θ`, or the rightmost pole right of `θ` is real, a real zero
`β ∈ (θ, 1)` of a member (0.6), and bounds the real parts of all poles; the convergence is that of
PositivityOfDirichletSeriesWithKernels §6.4(b), (c). The conclusion on `ζ_K` is the first
alternative at the member `1`, whose L-function
is `ζ_K`. `ζ` is negative, so nonzero, on `(0, 1)` (ExplicitZetaBounds §0.3,
its case `q = 1`, which takes no record), and
`ZeroFreeRightOf θ (dedekindZetaC ℚ) ↔ ZeroFreeRightOf θ riemannZeta`
(RiemannHypothesisStatementsAndConsequences §9.5,
rational bullet, stated for every real threshold).

*Needs:* 0.5, 0.6; ArithmeticDirichletSeriesPartII §0.1b, through its one-sided form
PositivityOfDirichletSeriesWithKernels §6.4; RiemannHypothesisStatementsAndConsequences §§9.2, 9.5;
ExplicitZetaBounds §0.3 (the negativity of `ζ` on `(0, 1)`).

**Checks.**

- The trivial character must be a member: for `K = ℚ`, `w = 0`, `θ = 0` and `C = 1` the lower
  bound `G_w = 0 ≥ −1` holds and `ζ` has no zero in `(0, 1)`, while `1/2 + 14.1347…i` is a zero of
  `ζ`; the empty family, like any family without the member `1`, says nothing about `ζ_K`.

### 1.3 One-sided bounds for `ψ_K(x) − x`

*Origin:* published for `K = ℚ`: Ingham (1932), chapter V, the one-sided bounds for `ψ(x) − x` and
the zero-free half-planes of `ζ` that they give, by Landau's theorem (Landau (1905)), with (c) as
their consequence; the number-field form is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `0 ≤ θ < 1`.

- (a) if `ψ_K(x) − x ≥ −C x^θ` for every
  `x ≥ x₀`, then `ZeroFreeRightOf θ ζ_K`.
- (b) if `ψ_K(x) − x ≤ C x^θ` for every
  `x ≥ x₀` and `ζ_K` has no zero in the real interval `(θ, 1)`, then `ZeroFreeRightOf θ ζ_K`.
- (c) `RiemannHypothesis` holds if and only if for every
  `ε > 0` there are `C` and `x₀` with `ψ(x) − x ≤ C x^{1/2+ε}` for `x ≥ x₀`; and
  if and only if the same holds with
  `ψ(x) − x ≥ −C x^{1/2+ε}`.

Route: put `g(u) = ψ_K(e^u) − e^u`. By the Chebyshev bound `ψ_K(x) ≤ C_K x` for `x ≥ 1`, a
consequence of Tau Ceti's `TauCeti.primeIdealTheorem` (`ψ_K(x) ~ x`), `|g(u)| ≤ (C_K + 1) e^u`, so
`∫_0^∞ |g(u)| e^{−σu} du < ∞` for every real `σ > 1`: the integrability hypothesis of
PositivityOfDirichletSeriesWithKernels Layer 6 at `A = 1`. For `Re s > 1` the transform of `g` is
`−(ζ_K′/ζ_K)(s)/s − 1/(s − 1)` (ArithmeticDirichletSeriesPartII §4.1 for the norm coefficients of
`Λ_K`, whose series is `−ζ_K′/ζ_K` on `Re s > 1` by LFunctions Layer 8, with
`∫_1^∞ y · y^{−s−1} dy = 1/(s − 1)`); it is meromorphic on `ℂ`, analytic at `1` (the simple pole of
`ζ_K`, LFunctions Layer 3), and in `Re s > 0` its poles are the zeros `ρ` of `ζ_K`, simple with
residue `−m/ρ`, `m` the order. (a): PositivityOfDirichletSeriesWithKernels §6.4(b) for `−g`, whose
real poles have residue `m/β > 0`.
(b): PositivityOfDirichletSeriesWithKernels §6.4(b) for `g`, which has no real pole in `(θ, 1]`.
(c): the bounds follow from
`RiemannHypothesis` by RiemannHypothesisStatementsAndConsequences §9.9 at `ℚ`
(`ψ(x) − x = O(√x log² x)`); conversely, an
upper bound at every `1/2 + ε` gives `ZeroFreeRightOf (1/2 + ε) (dedekindZetaC ℚ)` by (b) at
`K = ℚ`, `ζ` having no zero in `(0, 1)` (ExplicitZetaBounds §0.3,
its case `q = 1`), and a lower bound gives it by
(a); then the monotonicity clause of RiemannHypothesisStatementsAndConsequences §9.2 and the
rational bullet of its §9.5 at `σ = 1/2`.

*Needs:* ArithmeticDirichletSeriesPartII §4.1; PositivityOfDirichletSeriesWithKernels §6.4;
RiemannHypothesisStatementsAndConsequences §§9.2, 9.5, 9.9; LFunctions
Layers 3, 8; ExplicitZetaBounds §0.3 (the negativity of `ζ` on `(0, 1)`); Tau Ceti
`TauCeti.primeIdealTheorem`.

**Checks.**

- The signs of 1.1 and 1.3 are opposite: a real zero `β` contributes `+y^β/(β(1 − β))` to `G` and
  `−x^β/β` to `ψ(x) − x`. Accordingly an upper bound excludes real zeros for `G` and a lower bound
  does for `ψ − x`.

### Examples

A real zero `β` contributes `+y^β/(β(1 − β))` to `G` and `−x^β/β` to `ψ(x) − x`, so an upper bound
for `G` and a lower bound for `ψ(x) − x` exclude real zeros (1.1, 1.3). For `K = ℚ`, the empty
family satisfies the lower bound `G_w = 0 ≥ −1` while `ζ` has the zero `1/2 + 14.1347…i`: a family
without the member `1` says nothing about `ζ_K` (1.2).

### Dependencies

Layer 0; ArithmeticDirichletSeriesPartII §§0.1b, 4.1; PositivityOfDirichletSeriesWithKernels §6.4;
RiemannHypothesisStatementsAndConsequences §§9.2, 9.5, 9.9; ExplicitZetaBounds §0.3; LFunctions Layers 3
and 8; Tau Ceti's prime ideal theorem.

## Layer 2: the windowed Landau theorem for weighted families

PositivityOfDirichletSeriesWithKernels §6.8, read through its Mellin form §6.9(b), is the theorem this
layer applies. In the form of the formal proof: let `G : ℝ → ℝ` be measurable with `|G(y)| ≤ C₀ y²` for `y ≥ 1`, let
`Ψ` be meromorphic on `Re s > 0` with `Ψ(s) = ∫_1^∞ G(y) y^{−s−1} dy` for `Re s > 2`, with simple poles only in
`Re s > 0` and a positive real residue at every real pole there, and let `0 < θ < 1`. If for some `λ > 1` and every
`η > 0` there are arbitrarily large `Y` with `∫_Y^{Y^λ} G⁺(y) y^{−θ−1} dy ≤ Y^η`, which holds in particular when
`HasWindows {y ≥ 1 | G(y) ≤ C y^θ} λ` for some real `C`, then `Ψ` has no pole in `Re s > θ`. 2.1–2.3 and the first
statement of 2.5 rest on this form. Its extension takes, in place of the size bound, `∫_1^∞ |G(y)| y^{−σ−1} dy < ∞`
for every real `σ > A`, any `θ < A`, and `Ψ`, the integral on `Re s > A`, meromorphic on `Re s > θ` only, with no
condition on its poles; under the same windows, either `Ψ` has no pole in `Re s > θ`, or `Ψ` has a real pole `β > θ`
such that every pole in `Re s > θ` has real part at most `β` and the leading coefficient at `β` is negative. At a
simple pole the leading coefficient is the residue (PositivityOfDirichletSeriesWithKernels §6.8, simple-pole
corollary). 2.4 and the second statement of 2.5 rest on the extension, at `A = 1`: they are this roadmap's own
consequences, not statements of [FormalProof].

### 2.1 Pointwise windows

*Origin:* adapted from Landau's theorem: the one-sided bound is required only on windows `[Y, Y^λ]`
with `Y` arbitrarily large, for a family with positive weights; the window form is that of
PositivityOfDirichletSeriesWithKernels §6.8; nearest published results: Pintz (1980) and
Kaczorowski (1984), window theorems for the remainder terms of the prime number theorem.

*Method of the formal proof:* in the variable `u = log y` the remainder has a Laplace transform
with simple poles at the zeros; for a suitable `σ > 2` and `k` proportional to the logarithm of the
window, the `k`-th Taylor coefficient at `σ + iγ` is an integral against a kernel concentrated on
the window, so a one-sided bound on the window bounds the modulus of that coefficient plus the real
part of the coefficient at `σ`; a pole to the right of `θ` nearest to a suitable centre would make
that coefficient larger, by Cauchy estimates after removal of its principal part. This departs from
Landau's proof, which needs the one-sided bound for all large `y` and uses the convergence of a
Taylor expansion with coefficients of one sign.

Let `w` be a weighted family of characters of `K`, `0 < θ < 1`,
`C` real and `λ > 1`. If `HasWindows {y | G_w(y) ≤ C y^θ} λ`, then every member `ψ` satisfies
`ZeroFreeRightOf θ (heckeLFunctionC ψ.character)`. The ratio `λ` may be any number above `1`.
Over `ℚ` it follows from [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean`
(`Deduction.zeroFree_of_rpow_window`).

Route: PositivityOfDirichletSeriesWithKernels §6.9(b) in the form of the formal proof, with `G = G_w`, measurable
with `|G_w(y)| ≤ C_w y²` for `y ≥ 1` by 0.4, and `Ψ = Φ_w`, meromorphic on `ℂ`, hence on `Re s > 0`, and the
integral on `Re s > 1`, hence on `Re s > 2` (0.5). Its poles in `Re s > 0` are simple, and its residue at a real pole is
positive (0.6), so `Φ_w` has no pole in `Re s > θ`; a zero of a member with `Re ρ > θ` would be a pole (0.6).

*Needs:* 0.4, 0.5, 0.6; PositivityOfDirichletSeriesWithKernels §§6.8, 6.9;
RiemannHypothesisStatementsAndConsequences §9.2.

**Checks.**

- `K = ℚ`, `w = single 1 1`, `θ = 1/4`: the conclusion would make `ζ` zero-free right of `1/4`,
  which the zero `1/2 + 14.1347…i` contradicts; so for every `C` and `λ > 1` the set
  `{y | G(y) ≤ C y^{1/4}}` has no windows of ratio `λ` beyond some point: `G(y) > C y^{1/4}` somewhere
  in every far window, which 2.3 states in general.
- The empty family `w = 0`: `G_w = 0`, the hypothesis holds for every `C ≥ 0` and the conclusion
  is vacuous; for `C < 0` the set `{y ≥ 1 | 0 ≤ C y^θ}` is empty and has no windows.

### 2.2 Windows in mean

*Origin:* adapted from Landau's theorem: as for pointwise windows (2.1), with the bound on each window
required only in mean; the window form is that of PositivityOfDirichletSeriesWithKernels §6.8;
nearest published results: Pintz (1980) and Kaczorowski (1984), window theorems for the remainder
terms of the prime number theorem.

*Method of the formal proof:* the same as for the pointwise form: the mean of a majorant of the
positive part over the window bounds the Taylor coefficients of high order of the Laplace transform
at points `σ + iγ`, and a pole to the right of `θ` would make one of them too large. The usual proof
of Landau's theorem needs the bound for all large `y`.

Let `w` be a weighted family, `0 < θ < 1` and `λ > 1`. If for
every `η > 0` there are arbitrarily large `Y` with `∫_Y^{Y^λ} G_w(y)⁺ y^{−θ−1} dy ≤ Y^η`, the
conclusion of 2.1 holds. Over `ℚ` it follows from [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/lemmaL.lean` (`Deduction.lemmaL`), with its
hypothesis `Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.WindowHyp`).

Route: this is the mean hypothesis of PositivityOfDirichletSeriesWithKernels §6.9(b), in the form of the formal proof,
for `G = G_w`; the rest is 2.1's.

*Needs:* as 2.1.

### 2.3 Large values in every window

*Origin:* particular to this proof: for a finite positively weighted family of Dirichlet
characters, a zero of a member with real part above `θ` forces the weighted remainder above
`C·y^θ` somewhere in every far window `[Y, Y^λ]`, for every `λ > 1` and every `C`; nearest
published results: Pintz (1980), one-sided large values of the remainder of the prime number
theorem in windows whose length depends on the height of the zero, and Knapowski and Turán (1962)
for differences between residue classes. The form over a number field other than `ℚ` is this
roadmap's own formulation.

*Method of the formal proof:* only the contrapositive is proved, over `ℚ`: a Taylor coefficient of
high order of the Laplace transform of the weighted remainder, at a point `σ` and at `σ + iγ`, is
concentrated on the window, so a one-sided bound on the window bounds it, while a nearest-pole
dichotomy (a real pole with positive residue, or a single nearest complex pole) forces it to be
large. Landau's theorem needs the bound for all large `y`; here one Taylor coefficient whose order
is tied to the window localises the argument.

Let `w` be a weighted family of characters of `ℚ`, the characters attached to primitive Dirichlet
characters (Conventions), and `0 < θ < 1`. If some
member `ψ` has a zero `ρ` of `L(·, ψ)` with `Re ρ > θ`, then for every `λ > 1` and every `C` there
is `Y₀` such that every window `[Y, Y^λ]` with `Y ≥ Y₀` contains a `y` with `G_w(y) > C y^θ`.
The same holds, in the same words, for a weighted family of characters of any number field `K`;
this form is not a statement of [FormalProof].

Route: the contrapositive of 2.1, over `ℚ` and over `K`.

*Needs:* 2.1.

### 2.4 Lower bounds on windows

*Origin:* this roadmap's own formulation: the windowed form of Landau's theorem for lower bounds,
with the alternative of a dominant real zero, drawn from the extension of
PositivityOfDirichletSeriesWithKernels §6.9(b).

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `w` be a weighted
family, `0 ≤ θ < 1`, `C` real and `λ > 1`. If `HasWindows {y | G_w(y) ≥ −C y^θ} λ`, then either
every member is zero-free
right of `θ`, or some member has a real zero `β ∈ (θ, 1)` and every zero of every member in
`Re s > 0` has real part at most `β`. For `K = ℚ` and `w = single 1 1` the first alternative holds.
This statement is this roadmap's own, drawn from the extension of PositivityOfDirichletSeriesWithKernels §6.9(b); it is
not a statement of [FormalProof].

Route: the extension of PositivityOfDirichletSeriesWithKernels §6.9(b) at `A = 1` for `G = −G_w`, measurable and
integrable by 0.4, with `Ψ = −Φ_w`, meromorphic on `ℂ` (0.5): the rightmost pole of `−Φ_w`,
if there is one right of `θ`, is real
with negative leading coefficient, that is a real pole of `Φ_w` with positive residue, which 0.6
allows; it bounds the real parts of all poles. For `ζ` there is no real zero in `(0, 1)`
(ExplicitZetaBounds §0.3, its case `q = 1`).

*Needs:* 0.4, 0.5, 0.6; PositivityOfDirichletSeriesWithKernels §6.9(a) and the extensions of its §§6.8, 6.9(b);
ExplicitZetaBounds §0.3 (the negativity of `ζ` on `(0, 1)`).

### 2.5 Windowed bounds for `ψ_K(x) − x`

*Origin:* this roadmap's own formulation: one-sided bounds for `ψ_K(x) − x` required only on
windows, the first statement drawn from the windowed theorem in the form of the formal proof, the
second, with the alternative of a dominant real zero, from its extension
(PositivityOfDirichletSeriesWithKernels §6.9(b)).

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `0 ≤ θ < 1`, `C` real and `λ > 1`.

- If `0 < θ` and `HasWindows {x | ψ_K(x) − x ≥ −C x^θ} λ`,
  then `ZeroFreeRightOf θ ζ_K`.
- If
  `HasWindows {x | ψ_K(x) − x ≤ C x^θ} λ`, then
  either `ZeroFreeRightOf θ ζ_K`, or `ζ_K` has a real zero `β ∈ (θ, 1)` and every zero of `ζ_K` in
  `Re s > 0` has real part at most `β`. For `K = ℚ` the first alternative holds. This statement is this
  roadmap's own, drawn from the extension of PositivityOfDirichletSeriesWithKernels §6.9(b); it is not a statement
  of [FormalProof].

Route: the transform of `ψ_K(y) − y` is that of 1.3, meromorphic on `ℂ`, with poles in `Re s > 0` simple with residue
`−m/ρ` at the zeros `ρ` of `ζ_K`, `m` the order. The first statement: PositivityOfDirichletSeriesWithKernels §6.9(b),
in the form of the formal proof, for `G(y) = −(ψ_K(y) − y)`, with `|G(y)| ≤ (C_K + 1) y ≤ (C_K + 1) y²` for `y ≥ 1` by
the Chebyshev bound of 1.3; the residues of its transform, `m/ρ`, are positive at the real poles. The second: the
extension of that §6.9(b) at `A = 1` for `G(y) = ψ_K(y) − y`, with the integrability of 1.3. For `K = ℚ`, `ζ` has no
real zero in `(0, 1)` (ExplicitZetaBounds §0.3, its case `q = 1`).

*Needs:* 1.3; PositivityOfDirichletSeriesWithKernels §§6.8, 6.9 and the extensions of its §§6.8, 6.9(b);
ExplicitZetaBounds §0.3 (the negativity of `ζ` on `(0, 1)`).

### Examples

For `K = ℚ`, `w = single 1 1` and `θ = 1/4`, the zero `1/2 + 14.1347…i` of `ζ` shows that for every
`C` and every `λ > 1` the set `{y | G(y) ≤ C y^{1/4}}` has no windows of ratio `λ` beyond some point
(2.1, 2.3). For the empty family the hypothesis of 2.1 holds for every `C ≥ 0` and the conclusion is
vacuous (2.1).

### Dependencies

Layers 0 and 1; PositivityOfDirichletSeriesWithKernels §§6.8, 6.9;
RiemannHypothesisStatementsAndConsequences §9.2; ExplicitZetaBounds §0.3.

## Layer 3: window bounds as a form of the generalized Riemann hypothesis

A *window bound* for a finitely supported `w : PrimitiveRayClassCharacter K →₀ ℝ` at the exponent
`θ` is the statement `∃ λ > 1, HasWindows {y | G_w(y) ≤ y^θ} λ`; it is written out wherever it
occurs, and no predicate names it.

### 3.1 Window bounds

*Origin:* particular to this proof: bounds are asked only on windows `[Y, Y^λ]` with `Y`
arbitrarily large; the properties stated are elementary.

*Method of the formal proof:* directly from the definition: if `S` has windows and `S′` contains
every point of `S` beyond a threshold `x₀`, the window of `S` found beyond `max(y, x₀)` is a window
of `S′`.

Let `w : PrimitiveRayClassCharacter K →₀ ℝ` be finitely supported and `λ > 1`.

- For `θ ≤ θ′`,
  `HasWindows {y | G_w(y) ≤ y^θ} λ` implies `HasWindows {y | G_w(y) ≤ y^{θ′}} λ`, since
  `y^θ ≤ y^{θ′}` on `y ≥ 1`.
- If `HasWindows {y | G_w(y) ≤ C y^θ} λ` for
  some real `C`, then `HasWindows {y | G_w(y) ≤ y^{θ′}} λ` for every `θ′ > θ`, with the same `λ`,
  because `C y^θ ≤ y^{θ′}` for large `y` and windows of a set that contains `S ∩ [y₀, ∞)` exist when
  those of `S` do (this follows from [FormalProof],
  `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows.mono`)).
- The sets are unchanged under inversion and symmetrization of `w`, `G_{w^∨} = G_{w^s} = G_w`
  (0.3); scaling by `c > 0` multiplies `G_w` by `c`, and the previous item moves the bound to every
  `θ′ > θ`.

*Needs:* 0.3; PositivityOfDirichletSeriesWithKernels §6.9(a) (`HasWindows`, monotonicity in the set and in
`λ`, windows beyond a threshold).

### 3.2 Zero-free half-planes give window bounds

*Origin:* adapted from Ingham (1932), chapters III–IV: the bound `ψ(x) − x = O(x^σ log² x)` when
`ζ` is zero-free right of `σ`, obtained from the explicit formula; here the bound `C y^σ`, without
the logarithm, for the remainder of a weighted family of characters of a number field whose members
are zero-free right of `σ`, from the bound for each member (RiemannHypothesisStatementsAndConsequences
§9.6(c)), which rests on the explicit formula of Ihara, Murty and Shimura (2009) for the first Riesz
mean (ZerosOfLFunctions §8.6a), and the window bounds that it gives.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `w` be a weighted family and
`σ ∈ [1/2, 1)`. If every member `ψ` satisfies `ZeroFreeRightOf σ (heckeLFunctionC ψ.character)`,
then there is `C` with `|G_w(y)| ≤ C y^σ` for every `y ≥ 2`; hence
`HasWindows {y | G_w(y) ≤ y^θ} λ` for every `θ > σ` and every `λ > 1`.

Route: RiemannHypothesisStatementsAndConsequences §9.6(c) for each member, `|Re z| ≤ |z|` and the
triangle inequality; the
set `{y | G_w(y) ≤ C y^σ}` contains `[2, ∞)`, so it has windows of every ratio, and the constant is
absorbed by 3.1.

*Needs:* 3.1; RiemannHypothesisStatementsAndConsequences §9.6(c);
PositivityOfDirichletSeriesWithKernels §6.9(a).

### 3.3 The equivalence

*Origin:* adapted from Landau (1905): the classical equivalence of a zero-free half-plane with
one-sided bounds for prime sums, by Landau's theorem and, for the converse, the explicit formula
(3.2), with the bounds required only on windows.

*Method of the formal proof:* only the implication from window bounds, at `σ = 1/2`: for `s` with
`Re s > 1/2` put `δ = min(Re s − 1/2, 1/2)`, choose `ε` so small that the window bound holds at an
exponent at most `θ = 1/2 + δ/2`, enlarge the exponent to `θ` on the points `y ≥ 1` of the windows,
and apply the windowed Landau theorem 2.1 once at `θ < Re s`.

Let `w` be a weighted family and
`σ ∈ [1/2, 1)`. Then
`(∀ ε > 0, ∃ λ > 1, HasWindows {y | G_w(y) ≤ y^{σ+ε}} λ) ↔ ∀ ψ ∈ w.support, ZeroFreeRightOf σ (heckeLFunctionC ψ.character)`.
At `σ = 1/2` the right side is `ψ.character.GeneralizedRiemannHypothesis` for every member. The
window ratio `λ` may depend on `ε`. A single exponent does not suffice: the window bound at one
`θ ∈ (σ, 1)` gives zero-freeness right of `θ` (2.1), not right of `σ`.
Of this equivalence, the implication from the window bounds to the hypothesis is the step of
[FormalProof]; the converse is classical, by the bound of 3.2 for the remainder under a zero-free
half-plane, and is not part of that proof. Over `ℚ` the implication from the window bounds follows from
[FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean`
(`Deduction.zeroFree_of_rpow_window`); at `σ = 1/2` it is the step
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean` (`Formalism.HC.level_of_tiedWin`).

Route: (←) 3.2. (→) for `0 < ε < 1 − σ`, 2.1 at `θ = σ + ε` gives zero-freeness right of
`σ + ε`, and the monotonicity clause of RiemannHypothesisStatementsAndConsequences §9.2 (zero-free
right of `σ` exactly when zero-free right of every `σ′ > σ`) gives it right of `σ`.

*Needs:* 2.1, 3.2; RiemannHypothesisStatementsAndConsequences §9.2.

**Checks.**

- The empty family `w = 0`: both sides hold, the left because `G_w = 0 ≤ y^{σ+ε}` for every `y ≥ 0`,
  the right vacuously.
- At `0 ≤ θ < 1/2` the window bound fails for every nonempty family: every `L(s, ψ)` has infinitely
  many zeros in the critical strip (ZerosOfLFunctions §§7.5, 7.6), and its zero set is invariant under
  `ρ ↦ 1 − ρ̄` (RiemannHypothesisStatementsAndConsequences §9.3), so it has zeros with real part at
  least `1/2`, which 2.1
  would exclude (at `θ = 0` after 3.1 moves the bound to `θ′ = 1/4`).

### 3.4 Reduction to cyclic families

*Origin:* adapted from Davenport (2000), chapter 5: the reduction of the hypothesis to primitive
characters (AnalyticNumberTheoryPartI §1.6, primitive induction), with the primitive characters
grouped in cyclic families, the units in which the proof bounds prime sums.

*Method of the formal proof:* the `L`-function of a character modulo `N` is that of its primitive
character times the factors `1 − χ*(p)p^{−s}` for `p | N`, which do not vanish for `Re s > 0`; and
a primitive character `ψ` is a member of its own cyclic family `𝒦(ψ)`, so a statement for all
members of all cyclic families is a statement for all primitive characters.

*Corollary of:* AnalyticNumberTheoryPartI §1.6 (primitive induction: the hypothesis holds for a
Dirichlet character exactly when it holds for the primitive character inducing it).

The hypothesis for every Dirichlet character reduces to cyclic families:
`(∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.GeneralizedRiemannHypothesis) ↔
∀ ψ : PrimitiveDirichletCharacter, ∀ κ ∈ 𝒦(ψ), κ.character.GeneralizedRiemannHypothesis`.
The implication (←) follows from [FormalProof],
`Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean` (`UpperTheory.Top.imprimitive`) and
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean`
(`Formalism.HC.zeroFreeOn_of_levels`, `Formalism.HC.Level.mem_cyc`).

Route: (→) every member of `𝒦(ψ)` is a primitive Dirichlet character. (←) `ψ ∈ 𝒦(ψ)`
(FrobeniusRestrictedRieszSums §0.5); for `χ` modulo `N` the bundle
*PrimitiveDirichletCharacter.of* `χ` has character `χ.primitiveCharacter`
(RiemannHypothesisStatementsAndConsequences §10.3), and
RiemannHypothesisStatementsAndConsequences §9.4's
`generalizedRiemannHypothesis_primitiveCharacter_iff` passes from it to
`χ`.

*Needs:* 0.2; FrobeniusRestrictedRieszSums §0.5; RiemannHypothesisStatementsAndConsequences §§9.4, 10.3.

### 3.5 The Riemann hypothesis as a window bound

*Origin:* adapted from Landau's theorem: the classical equivalence of the Riemann hypothesis with
one-sided bounds for prime sums, by that theorem and, for the converse, the explicit formula, with
the bound for the Riesz remainder of `ζ` required only on windows.

*Method of the formal proof:* only the implication from the window bound, as a step of the proof
of 5.2 and not as a separate statement: the windowed criterion (4.2) at the cyclic family `{1}` of
the trivial character modulo `1`, whose remainder is `G`, gives `ζ(s) ≠ 0` for `Re s > 1/2`,
`s ≠ 1`; a zero with `Re s < 1/2` is then excluded by the functional equation
`ζ(s) = 2 (2π)^{s−1} Γ(1 − s) cos(π(1 − s)/2) ζ(1 − s)`, in which `Γ(1 − s)` does not vanish,
`ζ(1 − s) ≠ 0` by the first part, and the cosine vanishes for `Re s < 1/2` only at `s = 0`, where
`ζ(0) ≠ 0`, and at the trivial zeros.

`riemannHypothesis_iff_forall_exists_windows`:
`RiemannHypothesis ↔ ∀ ε > 0, ∃ λ > 1, HasWindows {y | Re G(y) ≤ y^{1/2+ε}} λ`, with
`G` = *PrimitiveRayClassCharacter.rieszRemainder* `1` the remainder of the trivial character of `ℚ`,
`G(y) = Σ_{n ≤ y} Λ(n)(y/n − 1) − y log y + (1 + γ) y` (RiemannHypothesisStatementsAndConsequences
§8.4a(b)). The trivial
character is real, so `G` is real-valued (the conjugation clause of
RiemannHypothesisStatementsAndConsequences §8.4a(b)) and `Re G = G`.
Of this equivalence, the implication from the window bounds to the hypothesis is the step of
[FormalProof]; the converse is classical, by the bound of 3.2 for the remainder under a zero-free
half-plane, and is not part of that proof. The implication from the window bounds follows from [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean`
(`Deduction.zeroFree_of_rpow_window`) and `Formalism/GammaFactorNonvanishing/RhOfRight.lean`
(`Formalism.VW.rh_of_right`), with `G` as in
`Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.G`).

Route: 3.3 at `σ = 1/2` for `w = single 1 1` over `ℚ`, for which `G_w = Re G`. The L-function of
the trivial character is `dedekindZetaC ℚ` (RiemannHypothesisStatementsAndConsequences §9.5, trivial
character), and the
rational bullet of its §9.5 at `σ = 1/2` identifies its hypothesis with `RiemannHypothesis`.

*Needs:* 3.3; RiemannHypothesisStatementsAndConsequences §§8.4a(b), 9.5.

### Examples

The empty family satisfies both sides of 3.3. At `0 ≤ θ < 1/2` the window bound fails for every
nonempty family, since every `L(s, ψ)` has zeros with real part at least `1/2` (3.3). For the
trivial character of `ℚ` the window bound at every `1/2 + ε` is `RiemannHypothesis` (3.5).

### Dependencies

Layers 0 and 2; RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.6, 10.3;
FrobeniusRestrictedRieszSums §0.5; PositivityOfDirichletSeriesWithKernels §6.9; ZerosOfLFunctions §§7.5, 7.6.

## Layer 4: cyclic families and the Riemann hypothesis

ThetaChainsAndFrobeniusPrimeSums states its window bounds (its §10.11, for every primitive
Dirichlet character `ψ`) through the remainders `G_κ` of RiemannHypothesisStatementsAndConsequences
§8.4a(b), the predicate
`HasWindows` of PositivityOfDirichletSeriesWithKernels §6.9 and the cyclic family of
FrobeniusRestrictedRieszSums §0.5, and
depends on nothing here; this layer reads the conclusion of its §10.11 through 0.2 and 0.3 and
proves what it is equivalent to.

### 4.1 A family containing a character

*Origin:* adapted from Landau's theorem: the windowed criterion applied to a character of positive
weight in families that may vary with `ε`.

*Method of the formal proof:* one family and one ratio `λ` serve every `ε`: for `s` with
`Re s > 1/2` the exponent `1/2 + Cε` of the window bound is brought below
`θ = 1/2 + min(Re s − 1/2, 1/2)/2` by the choice of `ε`, and the windowed Landau theorem at `θ`
shows that no member of the family vanishes at `s`.

Let `ψ` be a character of `K`. If for every
`ε ∈ (0, 1/2)` there are a weighted family `w_ε` of characters of `K` with `w_ε(ψ) > 0` and a ratio
`λ_ε > 1` with `HasWindows {y | G_{w_ε}(y) ≤ y^{1/2+ε}} λ_ε`, then
`ψ.character.GeneralizedRiemannHypothesis`. The families and the window ratios may depend on `ε`.
Over `ℚ`, for one fixed family and ratio, this is the step of [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean` (`Formalism.HC.level_of_tiedWin`).

Route: 2.1 at `θ = 1/2 + ε`, `C = 1`, for `w_ε`, of which `ψ` is a member, gives
`ZeroFreeRightOf (1/2 + ε) (heckeLFunctionC ψ.character)` for every `ε ∈ (0, 1/2)`; then the
monotonicity clause of RiemannHypothesisStatementsAndConsequences §9.2.

*Needs:* 2.1; RiemannHypothesisStatementsAndConsequences §§9.2, 9.5.

**Checks.**

- The weight must be positive at `ψ`: a family with `w(ψ) = 0` gives no information on `L(·, ψ)`
  (0.6).

### 4.2 Cyclic families of Dirichlet characters

*Origin:* adapted from Landau's theorem: the criterion in the form the proof uses, window bounds for
a positive combination over a cyclic family; that these bounds hold is the conclusion of the
arithmetic part of the proof.

*Method of the formal proof:* the windowed Landau theorem is proved once for every finite set of
primitive Dirichlet characters that contains `1` and is closed under inversion, with weight `1` on
the trivial character and `1/(3o + 1)` on the others (and `1` on at most one distinguished real odd
member; a cyclic family has none), by rewriting the set as a positively weighted family; it is
applied to the cyclic family of `ψ` with `o` the order of `ψ`, the window inequality at the
exponents `1/2 + Cε` coming from the arithmetic part, and `ψ` is a member of its own family.

`forall_exists_windows_cyclicFamily_iff`: let `ψ` be a primitive Dirichlet
character. The following are equivalent:

- (i) for every `ε > 0` there are positive reals `w(κ)`, `κ ∈ 𝒦(ψ)`, and `λ > 1` with
  `HasWindows {y | Σ_{κ ∈ 𝒦(ψ)} w(κ) Re G_κ(y) ≤ y^{1/2+ε}} λ`;
- (ii) `κ.character.GeneralizedRiemannHypothesis` for every `κ ∈ 𝒦(ψ)`.

Statement (i) holds for every primitive Dirichlet character `ψ`, by
ThetaChainsAndFrobeniusPrimeSums §10.11. Further, (i) for every primitive Dirichlet character `ψ`
is equivalent to the generalized Riemann hypothesis for every Dirichlet character (3.4).
Of the equivalence of (i) and (ii), the implication from the window bounds to the hypothesis is
the step of [FormalProof]; the converse is classical, by the bound of 3.2 for the remainder under a
zero-free half-plane, and is not part of that proof. That step is [FormalProof],
`Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean` (`UpperTheory.Comparison₂.formB`). [FormalProof]
has statement (i), with one fixed weight system and a fixed ratio, in the proof of
`Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean` (`UpperTheory.Top.zeroFreeAll_of_topG`),
through `Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean`
(`UpperTheory.Comparison₂.level_gm_le_on_family_scales`).

Route: by 0.3 the sum in (i) is `G_{w_ℚ}`, and `w_ℚ` is a weighted family whose members form
`𝒦_ℚ(ψ)` (0.2). The hypothesis of the image of `κ` is that of `κ.character`:
RiemannHypothesisStatementsAndConsequences §11.1, by the definition of the equivalence, writes the
image as the primitive character of
`(ratDirichletEquiv q _).symm κ.character`, `q` the level of `κ`,
the ray-class clause of QuasiRiemannHypothesis §1.1 passes to that presentation, and the rational bullet of
RiemannHypothesisStatementsAndConsequences §9.5 to `κ.character.LFunction`.
(i) ⇒ (ii): 4.1 at each member of `𝒦_ℚ(ψ)`. (ii) ⇒ (i): 3.2 at `σ = 1/2` with all weights `1`
gives the bound at every `1/2 + ε`, with every `λ`. The last sentence: 3.4.

*Needs:* 0.2, 0.3, 3.2, 3.4, 4.1; RiemannHypothesisStatementsAndConsequences §§9.5, 11.1;
QuasiRiemannHypothesis §1.1 (the ray-class clause); for the sentence
on the supplier, ThetaChainsAndFrobeniusPrimeSums §10.11.

**Checks.**

- `ψ = 1`: `𝒦(1) = {1}`, and (i) is the window bound for `w(1) · G` at every `1/2 + ε`, which for
  `w(1) > 0` is equivalent to the window bound for `G` at every `1/2 + ε` (3.1), that is to
  `RiemannHypothesis` by 3.5.

### Examples

For `ψ = 1` the cyclic family is `{1}`, and statement (i) of 4.2 is the window bound for `G` at
every `1/2 + ε`, that is `RiemannHypothesis` (4.2, 3.5). A family with `w(ψ) = 0` gives no
information on `L(·, ψ)` (4.1).

### Dependencies

Layers 0, 2 and 3; RiemannHypothesisStatementsAndConsequences §§9.2, 9.5, 11.1; QuasiRiemannHypothesis §1.1;
ThetaChainsAndFrobeniusPrimeSums §10.11, for the sentence of 4.2 on statement (i).

## Layer 5: the headline theorems

The forms of these theorems for the completed L-functions of primitive Dirichlet characters, for
the Dedekind zeta functions of fields abelian over `ℚ` and for the Hecke characters of abelian
extensions of `ℚ` are drawn from 5.1 and 5.2 in
ConsequencesOfTheRiemannHypothesisForDirichletLFunctions §§0.1–0.3, through ZerosOfLFunctions
§9.1, AnalyticNumberTheoryPartI §2.42 and QuasiRiemannHypothesis §§5.4, 5.4a.

### 5.1 The generalized Riemann hypothesis for Dirichlet L-functions

*Origin:* particular to this proof: the theorem itself, obtained here from the window bounds for
cyclic families by the windowed form of Landau's theorem.

*Method of the formal proof:* for a primitive character `ψ` and a point `s` with `Re s > 1/2` put
`δ = min(Re s − 1/2, 1/2)`; the proof chooses `ε` so small that the exponent `1/2 + Cε`, `C` a fixed
constant, of the window inequality that the arithmetic part gives for the cyclic family of `ψ` is at
most `θ = 1/2 + δ/2`, applies the windowed criterion once at `θ < Re s` to get `L(s, κ) ≠ 0` for every
member `κ` of the family, `ψ` among them, and passes to imprimitive characters through the finite
product of the factors `1 − χ*(p)·p^{−s}`, `p` dividing the modulus, which do not vanish for
`Re s > 0`.

`meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`: for every `N` with `NeZero N` and every
`χ : DirichletCharacter ℂ N`, `χ.GeneralizedRiemannHypothesis`, that is
`ZeroFreeRightOf (1/2) χ.LFunction`: `meromorphicOrderAt χ.LFunction s ≤ 0` for every `s` with
`Re s > 1/2`. Hence
`∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.GeneralizedRiemannHypothesis`.
It follows from [FormalProof], `Supplements/Kernels/MainTheorems.lean` (`allChi`).
The theorem gives `DirichletGRH χ` of AnalyticNumberTheoryPartI §1.6 for every `χ`, that predicate
being the second strip form of RiemannHypothesisStatementsAndConsequences §9.4, hence `GRH` of
AnalyticNumberTheoryPartI §1.6 and `GRHMod q` of ExplicitNumberFields §0.5 (`DirichletGRH χ` for
every `χ` modulo `q`) for every `q ≥ 1`.

Route: let `ψ` = *PrimitiveDirichletCharacter.of* `χ`. Statement (i) of 4.2 holds at `ψ` by
ThetaChainsAndFrobeniusPrimeSums §10.11, so by 4.2 every member of `𝒦(ψ)` satisfies the
hypothesis, `ψ` among them (FrobeniusRestrictedRieszSums §0.5).
`ψ.character = χ.primitiveCharacter` (RiemannHypothesisStatementsAndConsequences §10.3), and the
hypothesis passes from `ψ` to `χ` as in 3.4. The route uses
the window bounds at the cyclic family of *PrimitiveDirichletCharacter.of* `χ` only.

*Needs:* 3.4, 4.2; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §10.11;
RiemannHypothesisStatementsAndConsequences §§9.4,
10.3.

### 5.2 The Riemann hypothesis

*Origin:* particular to this proof: the theorem itself, the case of the trivial character of the
theorem for Dirichlet L-functions.

*Method of the formal proof:* the case of modulus one of the theorem for all characters, with the
functional equation of `ζ`.

`riemannHypothesis`: `RiemannHypothesis`, a theorem of [FormalProof], `Supplements/Kernels/MainTheorems.lean` (`rhOfAll`).

Route: 5.1 at modulus one, and the clause "modulus one and the principal character" of
RiemannHypothesisStatementsAndConsequences §9.4, as in [FormalProof],
`Formalism/GammaFactorNonvanishing/CritLine.lean` (`Formalism.VW.rh_of_every`).
The route uses the window bounds at the trivial character only, whose cyclic family is `{1}`
(ThetaChainsAndFrobeniusPrimeSums §10.11 at `ψ = 1`).

*Needs:* 5.1; RiemannHypothesisStatementsAndConsequences §9.4.

### 5.3 Values and the critical strip

*Origin:* particular to this proof: the headline theorems in their value and strip forms; the
passage between the forms is classical.

*Method of the formal proof:* the value form is the final theorem; the strip forms follow by the
functional equation of the primitive character and the Euler factors of an imprimitive one.

For every `N ≥ 1` and `χ : DirichletCharacter ℂ N`:

- the hypothesis holds for `χ`, for `χ⁻¹` and for `χ.primitiveCharacter` (5.1);
- `LFunction_ne_zero_of_one_half_lt_re`: if `1/2 < Re s` and (`χ ≠ 1` or
  `s ≠ 1`), then `χ.LFunction s ≠ 0`, a theorem of [FormalProof], `Supplements/Kernels/MainTheorems.lean` (`allChi`);
- `re_eq_half_of_LFunction_eq_zero`: if `0 < Re s < 1` and
  `χ.LFunction s = 0`, then `Re s = 1/2`, imprimitive characters included, a theorem of [FormalProof],
  `Supplements/Kernels/MainTheorems.lean` (`claimAll`), and for primitive `χ`
  `Supplements/Kernels/MainTheorems.lean` (`critAll`);
- `riemannZeta_ne_zero_of_one_half_lt_re`: `riemannZeta s ≠ 0` whenever `1/2 < Re s` (at `s = 1`
  Mathlib's value `(γ − log 4π)/2` is not `0`); and every zero of `riemannZeta` with
  `0 < Re s < 1` has `Re s = 1/2`, the case `N = 1` of the strip form
  (`DirichletCharacter.LFunction_modOne_eq`). The first follows from [FormalProof],
  `Supplements/Kernels/MainTheorems.lean` (`allChi`), the second from
  `Development/AutomorphicArithmetic/CharacterBoxes/ClaimStrip.lean` (`Claim.zeta`).

Route: 5.1 with RiemannHypothesisStatementsAndConsequences §9.4's consumer forms, which rest on its
value form (`generalizedRiemannHypothesis_iff_LFunction_ne_zero`) and its strip form
(`generalizedRiemannHypothesis_iff_re_eq_half`) for every character, primitive or not (the strip form as in
[FormalProof], `Development/AutomorphicArithmetic/CharacterBoxes/ClaimStrip.lean` (`Claim.strip`)); 5.2 with
RiemannHypothesisStatementsAndConsequences §9.3's `riemannHypothesis_iff_riemannZeta_ne_zero`.

*Needs:* 5.1, 5.2; RiemannHypothesisStatementsAndConsequences §§9.3, 9.4.

**Checks.**

- The principal character modulo `2` has `L(s) = (1 − 2^{−s}) ζ(s)`, with zeros `2πik/log 2` on
  `Re s = 0`; the strip form excludes them through `0 < Re s`, and a form with `0 ≤ Re s` would be
  false.
- `ζ(−2) = 0`, with `Re(−2) < 0`: the strip form does not constrain the trivial zeros.

### Examples

The principal character modulo `2` has `L(s) = (1 − 2^{−s}) ζ(s)`, with zeros on `Re s = 0` that the
open strip of 5.3 excludes, and `ζ(−2) = 0` lies outside the strip (5.3).

### Dependencies

Layers 3 and 4; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §10.11;
RiemannHypothesisStatementsAndConsequences §§9.2–9.4, 10.3.

## Downstream consumers

- [ConsequencesOfTheRiemannHypothesisForDirichletLFunctions](../../ConsequencesOfTheRiemannHypothesisForDirichletLFunctions/README.md)
  takes the headline theorems 5.1–5.3. The consequences of this roadmap for other roadmaps are
  stated there: the hypothesis for the completed L-functions of primitive Dirichlet characters, the
  extended Riemann hypothesis for the Dedekind zeta functions of fields abelian over `ℚ` and the
  Riemann hypothesis for the Hecke characters of abelian extensions of `ℚ` (its §§0.1–0.3), and the
  theorems of AnalyticNumberTheoryPartI, ExplicitZetaBounds, ExplicitPrimeCounting and the other
  roadmaps that assume the Riemann hypothesis for Dirichlet L-functions, with that assumption
  removed.
- AnalyticNumberTheoryPartI §1.6 (`DirichletGRH χ`, `GRH`) and ExplicitNumberFields §0.5
  (`GRHMod q`) write the hypothesis for Dirichlet characters in their own predicates, which 5.1
  gives.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

Window bounds for cyclic families are equivalent to the generalized Riemann hypothesis for
Dirichlet L-functions (4.2). They are the point at which the arithmetic input enters: the other
layers are classical analysis, the windowed Landau theorem and its corollaries, and none of them
adds strength to that statement. The bounds for quadratic twists that the arithmetic side needs
(QuadraticTwistSelectionOverPrimes §§2.7c–2.7d) enter through ThetaChainsAndFrobeniusPrimeSums only;
nothing here uses them.

### Owned here

- weighted families of primitive finite-order ray-class characters as finitely supported
  functions, the reading of the cyclic families of Dirichlet characters as families over `ℚ`, and
  for a family: its remainder, the size of the remainder, its Mellin transform and the location
  and residues of the poles of that transform (Layer 0);
- the application of Landau's theorem (ArithmeticDirichletSeriesPartII §0.1b) to weighted families
  from bounds for all large `y`, and the one-sided converse for `ψ_K(x) − x` (Layer 1);
- the windowed Landau theorem for weighted families, in pointwise, mean, large-value and
  lower-bound forms, and its form for `ψ_K(x) − x` (Layer 2);
- window bounds and their equivalence with zero-free half-planes, the reduction of the
  Dirichlet characters to cyclic families, and the window-bound form of `RiemannHypothesis`
  (Layer 3);
- the equivalence of window bounds for a family containing a character, and for a cyclic family,
  with the Riemann hypothesis for its members (Layer 4);
- the Riemann hypothesis and the generalized Riemann hypothesis for Dirichlet L-functions in
  every form of Layer 5 (Layer 5).

### Consumed, not redefined

- `ZeroFreeRightOf` and the Riemann-hypothesis predicates of Dirichlet characters and of ray-class
  characters, with their equivalent forms and the `ζ` bridge:
  RiemannHypothesisStatementsAndConsequences §§9.2–9.5; the Riesz sums, and for one character the
  Riesz remainder, its
  conjugation, Mellin transform, continuation and poles, explicit formula and size:
  RiemannHypothesisStatementsAndConsequences
  §8.4a; the bound under a zero-free half-plane and the conditional prime counts:
  RiemannHypothesisStatementsAndConsequences
  §§9.6, 9.9;
- the explicit formula for the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞`, for every primitive
  finite-order ray-class character `ψ`: ZerosOfLFunctions §8.6a;
- the orders of `ζ_K` on `Re s = 1`, and the count of the zeros in the critical strip with its
  corollary that they are infinitely many: ZerosOfLFunctions §§6.5, 7.5, 7.6; the clause of
  `ZeroFreeRightOf` for a ray-class character and its primitive source: QuasiRiemannHypothesis §1.1;
- `HasLaplace`, and Landau's theorem for Laplace integrals of functions of one sign with its Mellin
  form: ArithmeticDirichletSeriesPartII §§0.1, 0.1b, 4.1; Landau's theorem in its one-sided and
  windowed forms, and `HasWindows`: PositivityOfDirichletSeriesWithKernels
  Layer 6;
- the continued Dedekind zeta and Hecke L-functions and primitive ray-class characters:
  LFunctions Layers 3, 5, 7 and 8; the bundled primitive Dirichlet characters and the
  rational dictionary: RiemannHypothesisStatementsAndConsequences §§10.3, 11.1;
- the cyclic family of a primitive Dirichlet character, and the window bounds for the cyclic
  family of every primitive Dirichlet character: FrobeniusRestrictedRieszSums §0.5 and
  ThetaChainsAndFrobeniusPrimeSums §10.11;
- the reduction of the hypothesis for a Dirichlet character to its primitive character, the
  general theorem of which 3.4 is a corollary: AnalyticNumberTheoryPartI §1.6 (primitive induction);
- the Chebyshev bound `ψ_K(x) ≪ x`: Tau Ceti `TauCeti.primeIdealTheorem`;
- the negativity of `ζ` on `(0, 1)`: ExplicitZetaBounds §0.3, its case `q = 1`.

### Not owned here

- the proof of the window bounds for cyclic families (ThetaChainsAndFrobeniusPrimeSums Layer 10):
  this roadmap cites them from its §10.11;
- Landau's theorem for Laplace integrals of functions of one sign (ArithmeticDirichletSeriesPartII
  §0.1b) and its one-sided and windowed forms for transforms in general
  (PositivityOfDirichletSeriesWithKernels Layer 6); this roadmap applies them to L-functions;
- the explicit formula for the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞` (ZerosOfLFunctions §8.6a);
- the Riemann hypothesis for the Dedekind zeta functions of fields other than `ℚ`, for their
  ray-class characters and for Artin, automorphic and Rankin–Selberg L-functions: no statement here
  proves it unconditionally, and 3.3 and 4.1 derive it from window bounds only;
- nonvanishing at the central point, simplicity of zeros, the Dedekind conjecture and every
  numerical record;
- the consequences of the headline theorems for other roadmaps, among them the forms of the
  headline theorems for completed L-functions, for the Dedekind zeta functions of fields abelian
  over `ℚ` and for the Hecke characters of abelian extensions of `ℚ`:
  ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (Downstream consumers).

## Exact supplier contracts

### From Mathlib

- `RiemannHypothesis`, `riemannZeta`, `riemannZeta_ne_zero_of_one_le_re`;
- `DirichletCharacter.LFunction`, `DirichletCharacter.primitiveCharacter`,
  `DirichletCharacter.IsPrimitive`;
- `meromorphicOrderAt`; `Finsupp`, `Finsupp.sum`, `Finsupp.mapDomain`,
  `Finsupp.mapDomain_apply_of_injective`, `Finsupp.indicator`, `Finsupp.indicator_apply`,
  `Finsupp.filter`, `Finsupp.sum_add_index'`, `Finsupp.sum_smul_index'`; `Chebyshev.psi`;
  `Real.continuous_mul_log`, `Continuous.measurable` (0.4).

### From Tau Ceti

- `TauCeti.primeIdealTheorem` (`ψ_K(x) ~ x`, for the Chebyshev bound in 1.3 and 2.5),
  `TauCeti.primePsi`, `TauCeti.IdealArithmeticFunction.vonMangoldt`;
- `TauCeti.meromorphicOrderAt_conj_conj`
  and `TauCeti.dedekindZeta_ne_zero_of_one_lt_re` (0.6).

### From TauCetiRoadmap.ZerosOfLFunctions

- §6.5: the orders of `ζ_K` on `Re s = 1`, `0` off `1` and
  `−1` at `1` (for 0.6); §§7.5, 7.6: the count of the zeros of `L(s, ψ)` in `0 < Re s < 1`, for
  every character `ψ` of `K`, and its corollary that they are infinitely many (for the Checks of
  3.3); §8.6a: the explicit formula for the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞` for every
  primitive finite-order ray-class character `ψ` (for the bound `C′ y` of 0.4).

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

- §8.4a (a): `rieszSum`, its continuity.
- §8.4a (b): *PrimitiveRayClassCharacter.rieszRemainder* `ψ` and `PrimitiveDirichletCharacter.rieszRemainder`,
  their agreement over `ℚ`; the Euler–Kronecker constant *NumberField.eulerKroneckerConstant*; the
  conjugation
  `rieszRemainder ψ⁻¹ = conj (rieszRemainder ψ)`; the Mellin transform `Φ_ψ` on `Re s > 1`; `Φ_ψ`
  meromorphic on `ℂ`, analytic at `1`, with poles in `Re s > 0` exactly at the zeros of `L(·, ψ)`,
  simple with residue `m_ρ/(ρ(1 − ρ))`; the size bound `‖rieszRemainder ψ y‖ ≤ C_ψ y²` for `y ≥ 1`, and its sharper
  form `‖rieszRemainder ψ y‖ ≤ C_ψ y`.
- §9.2: `ZeroFreeRightOf`, the limit form of monotonicity (zero-freeness right of `σ` equivalent to zero-freeness
  right of every `σ′ > σ`), the converse product clause.
- §9.3: the `ζ` bridge
  (`riemannHypothesis_iff_zeroFreeRightOf`, `riemannHypothesis_iff_riemannZeta_ne_zero`), the
  invariance of the zero set of a completed function under `ρ ↦ 1 − ρ̄`.
- §9.4: `DirichletCharacter.GeneralizedRiemannHypothesis`; its value form
  (`generalizedRiemannHypothesis_iff_LFunction_ne_zero`), strip forms
  (`generalizedRiemannHypothesis_iff_re_eq_half`; the second is `DirichletGRH χ`), inverse,
  change of level and primitive character
  (`generalizedRiemannHypothesis_primitiveCharacter_iff`), the clause on
  modulus one and the principal character, quantified forms and consumer forms.
- §9.5: *RayClassCharacter.GeneralizedRiemannHypothesis*;
  the inverse clause; the trivial
  character; the rational
  bullet, at every threshold `σ`: `ZeroFreeRightOf σ (dedekindZetaC ℚ) ↔ ZeroFreeRightOf σ riemannZeta`
  and
  `ZeroFreeRightOf σ (heckeLFunctionC ((ratDirichletEquiv q hq).symm χ)) ↔ ZeroFreeRightOf σ χ.LFunction`,
  with their cases `σ = 1/2`.
- §9.6: (c) the remainder under a zero-free half-plane (for 3.2).
- §9.9: the conditional prime counts, used in 1.3 (c) at `ℚ`.
- §10.2: the nonvanishing and analyticity of the gamma factor on `Re s > 0`, used through §9.4.
- §10.3: `PrimitiveDirichletCharacter` with `of`, `1`, `⁻¹` and `LFunction`.
- §11.1: *PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter*, with its values, conductors,
  compatibility with `1` and `⁻¹`, its definition (the image of the bundle of a character of level
  `q` is the primitive character of `(ratDirichletEquiv q _).symm χ`), and the agreement of the
  L-functions.

### From TauCetiRoadmap.LFunctions

- Layer 3: `dedekindZetaC K`, its simple pole at `1` (`meromorphicOrderAt_dedekindZetaC_one`).
- Layer 5: `PrimitiveRayClassCharacter K`, its inverse, `heckeLFunctionC`, entire for
  nontrivial primitive characters.
- Layer 7: `heckeLFunction_ne_zero_of_one_le_re` (no zero on `Re s ≥ 1`, `L(1, χ) ≠ 0`), for
  nontrivial primitive characters only; the trivial character goes through ZerosOfLFunctions §6.5
  (`meromorphicOrderAt_dedekindZetaC_one_add`).
- Layer 8: the series of `−ζ_K′/ζ_K` on `Re s > 1` (`TauCeti.hasSum_idealTerm_vonMangoldt`).

### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII

- §0.1: `HasLaplace f s z`.
- §0.1b: Landau's theorem for Laplace integrals of functions of one sign: if `g ≥ 0` for large `u`,
  `HasLaplace g s (F s)` for `Re s > A`, and `F` agrees on `Re s > A` near `A` with a function
  analytic on a disc about `A`, then `HasLaplace g s` holds on `Re s > A′` for some real `A′ < A`;
  and its Mellin form (for 1.1, 1.2: the theorem through its one-sided form
  PositivityOfDirichletSeriesWithKernels §6.4, the Mellin form for the integrals after `y = e^u`).
- §4.1: the Laplace transform of the logarithmic counting function of a Dirichlet series with
  nonnegative coefficients is `F(s)/s` (for 1.3).

### From PositivityOfDirichletSeriesWithKernels, a sub-roadmap of this family

- §6.4: (b) if `g ≤ C e^{θu}` almost everywhere for large `u`, `HasLaplace g s (Φ s)` on `Re s > A`,
  `Φ` meromorphic on `Re s > θ`, and the leading coefficient of `Φ` at every real pole in
  `(θ, A]` is positive, then `Φ` has no pole in `Re s > θ`, `HasLaplace g s` holds on `Re s > θ` and
  `∫_0^∞ |C e^{θu} − g| e^{−σu} du < ∞` for real `σ > θ` (for 1.1 and 1.3); (c) without the sign
  condition, either no pole, or the rightmost pole is real with negative leading coefficient and
  `HasLaplace g s` holds right of it; (d) the same for lower bounds with the signs reversed ((b) to (d)
  for 1.2).
- §6.8: the windowed theorem in the form of the formal proof (`windowedLandau_simplePole`: `|g(u)| ≤ C₀ e^{2u}`,
  continuation to `Re s > 0` with simple poles and a positive residue at every real pole, `0 < θ < 1`; for 2.1–2.3 and
  the first statement of 2.5), and its extension (`windowedLandau`: poles of finite order under the integrability
  hypothesis, with the dichotomy) with its simple-pole corollary (for 2.4 and the second statement of 2.5), in the
  forms stated at the head of Layer 2.
- §6.9: (a) `HasWindows S λ` with its monotonicity in `S` and `λ`, windows of `[x₀, ∞)` and of sets
  containing `S ∩ [x₀, ∞)`; (b) the Mellin form of §6.8, in the form of the formal proof under `|G(y)| ≤ C₀ y²` for
  `y ≥ 1` (`windowedLandau_mellin_simplePole`) and in its extension under `∫_1^∞ |G(y)| y^{−σ−1} dy < ∞` for
  `σ > A` (`windowedLandau_mellin`), each including the conversion of pointwise windows of `{y ≥ 1 | G(y) ≤ C y^θ}`
  into the mean hypothesis.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §0.5: the cyclic family `𝒦(ψ)` of a primitive Dirichlet character `ψ` of order `o`, with the
  bijection `ℤ/o → 𝒦(ψ)`, `1, ψ ∈ 𝒦(ψ)`, closure under inversion, conductors dividing that of `ψ`.

### From ThetaChainsAndFrobeniusPrimeSums, a sub-roadmap of this family

- §10.11: for every primitive Dirichlet character `ψ` and the constants as in §10.6, the window
  bounds of §10.11 hold: for every `ε > 0` there are positive reals `w(κ)`, `κ ∈ 𝒦(ψ)`, and
  `λ > 1` with `HasWindows {y | Σ_κ w(κ) Re G_κ(y) ≤ y^{1/2+ε}} λ`. This is statement (i) of 4.2
  at every `ψ` (for 4.2 and 5.1). Of its Layer 10 this roadmap uses §10.11 only.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §1.6: `DirichletGRH χ`, the second strip form of RiemannHypothesisStatementsAndConsequences §9.4,
  and its bullet "Primitive induction": `DirichletGRH χ` holds if and only if it holds for the
  primitive character inducing `χ` (the general theorem of which 3.4 is a corollary).

### From TauCetiRoadmap.ExplicitZetaBounds

- §0.3, its case `q = 1`: `riemannZeta s < 0` for real `0 < s < 1`, with no
  record (for 1.2, 1.3, 2.4, 2.5).

### From TauCetiRoadmap.QuasiRiemannHypothesis

- §1.1: the clauses of `ZeroFreeRightOf` on germs, products, values and a ray-class character with its primitive
  source (4.2).

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for
  Dirichlet L-functions announced in [Announcement], which gives its source as fourteen archive
  parts on the author's site, <https://alpo.ge/lean.tar.gz.part01> to `lean.tar.gz.part14`
  (footnote 1, p. 1). A repository with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. The formalization is the source of
  the route of this roadmap: of the transform of a family with its positive residues
  (0.5, 0.6), of the windowed Landau theorem for families in its upper-bound forms (2.1–2.3, through
  PositivityOfDirichletSeriesWithKernels §6.8 in the form of the formal proof; the form 2.5 for `ψ_K(x) − x` is drawn
  here, its first statement from that form, and its second, like the lower-bound form 2.4, from the extension of
  that §6.8, as this roadmap's own), and of the passage from the window
  bounds for cyclic families to the hypothesis (Layer 4, 5.1).
- [Announcement] Levent Alpöge, the announcement of that proof (2026):
  <https://alpo.ge/remark.pdf>, p. 1: the announcement of proofs of the Riemann hypothesis and of
  the generalized Riemann hypothesis, formalized in Lean (Layer 5), and the location of the Lean
  source (footnote 1).
- Y. Ihara, V. K. Murty and M. Shimura, *On the logarithmic derivatives of Dirichlet L-functions at
  s = 1*, Acta Arith. 137 (2009), 253–276, §2.2, Theorem 1, formula (2.2.1), p. 257: the explicit
  formula for the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞` for every primitive finite-order ray-class
  character `ψ` of a number field (0.4–0.6, 3.2, through ZerosOfLFunctions §8.6a).
- Y. Ihara, *On the Euler–Kronecker constants of global fields and primes with small norms*, in
  *Algebraic Geometry and Number Theory*, Progress in Mathematics 253 (2006), 407–451, formulas
  (1.2.1) and (1.4.1): the same formula for the trivial character (through ZerosOfLFunctions §8.6a).
- E. Landau, *Über einen Satz von Tschebyschef*, Math. Ann. 61 (1905), 527–550: Landau's theorem on
  Laplace and Mellin transforms of functions bounded on one side (1.1, 1.2, through
  ArithmeticDirichletSeriesPartII §0.1b; 1.3; 3.3).
- A. E. Ingham, *The Distribution of Prime Numbers*, Cambridge Tracts in Mathematics and
  Mathematical Physics 30 (1932), chapters III–IV: the explicit formula and the bound for
  `ψ(x) − x` under a zero-free half-plane (3.2); chapter V: one-sided bounds for `ψ(x) − x` and
  zero-free half-planes of `ζ`, over `ℚ` (1.3, its case `K = ℚ`).
- H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I. Classical Theory*, Cambridge
  Studies in Advanced Mathematics 97 (2007), chapter 15, Lemma 15.1: Landau's theorem and its use for
  oscillation over `ℚ` (1.1, 1.2, through ArithmeticDirichletSeriesPartII §0.1b; 1.3).
- H. Davenport, *Multiplicative Number Theory*, third edition (2000), chapters 5 and 9: primitive
  characters and the functional equation of Dirichlet L-functions (3.4, 5.3).
- J. Kaczorowski and J. Pintz, *Oscillatory properties of arithmetical functions* I and II, Acta
  Math. Hungar. (1986, 1987); J. Pintz, *On the remainder term of the prime number formula* I and
  II, Acta Arith. (1980), I in vol. 36, 341–365: localized oscillation theorems, context for
  Layer 2; Pintz's part I is a nearest published result for 2.1, 2.2 and 2.3.
- J. Kaczorowski, *On sign-changes in the remainder-term of the prime-number formula I*, Acta Arith.
  44 (1984), 365–377, sections 3–7: the remainder term localized to a window by iterated averages,
  with the nearest pole dominant; a nearest published result for 2.1 and 2.2, whose window form is
  that of PositivityOfDirichletSeriesWithKernels §6.8.
- S. Knapowski and P. Turán, *Comparative prime-number theory* I–III, Acta Math. Acad. Sci. Hungar.
  13 (1962), 299–364: one-sided large values for differences between residue classes, a nearest
  published result for 2.3.
