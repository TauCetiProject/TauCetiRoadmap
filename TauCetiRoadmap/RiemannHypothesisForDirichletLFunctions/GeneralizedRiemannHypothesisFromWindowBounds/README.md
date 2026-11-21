# Roadmap: the generalized Riemann hypothesis from window bounds

**Summary.** This roadmap proves the generalized Riemann hypothesis for every Dirichlet
L-function: for every modulus `N ≥ 1`, every Dirichlet character `χ` modulo `N` and every `s` with
`Re s > 1/2`, `L(s, χ) ≠ 0` unless `χ` is principal and `s = 1`. In particular it proves
Mathlib's `RiemannHypothesis`, the extended Riemann hypothesis for the Dedekind zeta function of
every number field abelian over `ℚ`, and the Riemann hypothesis for every Hecke character of such
a field whose class field is abelian over `ℚ`. It then proves the theorems of other roadmaps that
assume one of these statements, with that assumption removed.

The formal proof [FormalProof] states five theorems: `RiemannHypothesis`, and the same statement
written out; for every modulus `N ≥ 1` and every Dirichlet character `χ` modulo `N`, `L(s, χ) ≠ 0`
for `Re s > 1/2` unless `χ` is principal and `s = 1`; and every zero of `L(s, χ)` with
`0 < Re s < 1` has `Re s = 1/2`, for every `χ` and in particular for primitive `χ`. These are 5.2
and the value and strip forms of 5.3. The forms through orders and through completed L-functions
(5.1, 5.4) follow from them by Mathlib's continuation, functional equation and nonvanishing on
`Re s ≥ 1`. The statements on Dedekind zeta functions and Hecke characters (5.5, 5.6) and those of
Layer 6 are consequences drawn here from 5.1 by the published theorems cited with each; they are
not statements of the formal proof.

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

- *The windowed Landau theorem for families.* Let `0 ≤ θ < 1` and `λ > 1`. If there are
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
[PositivityOfDirichletSeriesWithKernels](../PositivityOfDirichletSeriesWithKernels/README.md),
whose Layer 6 proves Landau's theorem for Laplace transforms in its classical and its windowed form;
on [LFunctions](../../LFunctions/README.md) for the primitive ray-class characters and their
L-functions; on [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) for the
cyclic families and on ThetaChainsAndFrobeniusPrimeSums for their window bounds; and on
[AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md) and
[RieszSumsOverPrimesAndExceptionalZeros](../RieszSumsOverPrimesAndExceptionalZeros/README.md) for the
factorization of Dedekind zeta functions of abelian extensions into L-functions of characters and
for the Riemann hypothesis of Artin L-functions, which carry the theorem from Dirichlet characters to
abelian fields. Its last layer feeds AnalyticNumberTheoryPartI,
[ExplicitZetaBounds](../../ExplicitZetaBounds/README.md),
[ExplicitPrimeCounting](../../ExplicitPrimeCounting/README.md) and the other roadmaps whose statements
assume the Riemann hypothesis for Dirichlet L-functions.

Layer 0 sets up weighted families, reads the cyclic families of Dirichlet characters as families
over `ℚ`, and proves the size of the remainder of a family, its Mellin transform, and the location
and residues of the poles of that transform. Layer 1 proves Landau's theorem for a family from a
bound for all large `y`, and the one-sided converse for `ψ_K(x) − x`. Layer 2 proves the windowed
theorem for families. Layer 3 shows that window bounds at every exponent `σ + ε` are equivalent to
zero-freeness right of `σ` and reduces all Dirichlet characters to cyclic families. Layer 4
proves that window bounds for a cyclic family are equivalent to the Riemann hypothesis for its
members. Layer 5 proves the headline theorems in every standard form, and Layer 6 the theorems
of other roadmaps that assume them, with that assumption removed, grouped by roadmap; where
another roadmap obtains explicit bounds from an unconditional general estimate, Layer 6 derives
them instead from the bounds that the Riemann hypothesis gives.

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
  `PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter`
  (RiemannHypothesisStatementsAndConsequences §11.1) is the
  equivalence with the characters of `ℚ`, under which the L-functions agree.
- **Characters of a Galois group.** For a finite abelian extension `L/K` of number fields let
  `𝔣 = abelianConductor K L` and `Φ_{L/K} = rayClassArtinMap 𝔣 _ : RayClassGroup 𝔣 →* Gal(L/K)`,
  the ray-class Artin map at the conductor (ClassFieldTheory Layer 12: surjective, with the
  splitting law `rayClassArtinMap_idealClass`), a reciprocity dictionary in the sense of
  ZerosOfLFunctions §8.8. For a character `φ : Gal(L/K) →* ℂˣ` write
  `φ̃ = PrimitiveRayClassCharacter.of (φ.comp Φ_{L/K})`, a character of `K`. Two dictionaries
  induce the same primitive characters (RiemannHypothesisStatementsAndConsequences §8.8,
  *PrimitiveRayClassCharacter.of_comp_dictionary_eq*), so `φ̃` may be computed from any of them. At
  a prime `𝔭 ∤ 𝔣` it takes the value `φ(Frob_𝔭)` (the splitting law, `Gal(L/K)` being abelian),
  which is the value there of the character that AnalyticNumberTheoryPartI §2.18a attaches to `φ`
  by global reciprocity.
- **Prime sums.** `Λ_K` is the ideal von Mangoldt function (Tau Ceti
  `TauCeti.IdealArithmeticFunction.vonMangoldt`, as in LFunctions Layer 8) and
  `ψ_K = TauCeti.primePsi K Set.univ`, `ψ_K(x) = Σ_{𝔑𝔞 ≤ x} Λ_K(𝔞)`; over `ℚ` it is
  `Chebyshev.psi`.
- **The remainder `G_ψ`.** `G_ψ = PrimitiveRayClassCharacter.rieszRemainder ψ`, the Riesz remainder
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
  before it.
- **Quantifier order.** Uniformity is a quantifier order: a constant chosen before `ε` does not
  depend on `ε`; a window set chosen after `ε` may.
- **The hypotheses.** The predicates are those of RiemannHypothesisStatementsAndConsequences §§9.3–9.5:
  `χ.GeneralizedRiemannHypothesis` for `χ : DirichletCharacter ℂ N` with `[NeZero N]`
  (`ZeroFreeRightOf (1/2) χ.LFunction`); `NumberField.ExtendedRiemannHypothesis K`
  (`ZeroFreeRightOf (1/2) (dedekindZetaC K)`); `χ.GeneralizedRiemannHypothesis` for
  `χ : RayClassCharacter 𝔪`, read for a character `ψ` of `K` on `ψ.character`; and
  `d.GeneralizedRiemannHypothesis` for a record `d`. There is no predicate for a family of
  characters, for a modulus or for all characters: such statements carry their quantifiers.
- **No fixed constants.** Every exponent, window ratio and weight of a statement here is a
  parameter with its true constraint.

## Layer 0: weighted families and their Riesz remainders

Over `ℚ`, for families of primitive Dirichlet characters, the transform of a family with its poles
(0.5, 0.6) and the windowed theorem (2.1, 2.2) are statements of [FormalProof], there with the
transform identified on `Re s > 2` and continued to `Re s > 0`, with the bound `C y²` for the
remainders, and for `0 < θ < 1`. For a general number field `K`, and in the sharper forms stated
here (the bound `C y`, the half-plane `Re s > 1`, meromorphy on `ℂ`), they are this roadmap's
extension: the same argument, applied to the pole structure of 0.6.

### 0.1 Weighted families

A *weighted family* of characters of `K` is a finitely supported function
`w : PrimitiveRayClassCharacter K →₀ ℝ` with `0 ≤ w`; its *members* are the characters of
`w.support`, those of positive weight. No new type is introduced: the operations on families are
those of `Finsupp`, and each of them preserves `0 ≤ w`.

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

For a primitive Dirichlet character `ψ` of order `o`, its cyclic family `𝒦(ψ)` is that of
FrobeniusRestrictedRieszSums §0.5: the set of primitive
Dirichlet characters inducing the powers `ψ^k`, `k ∈ ℤ/o`, with `k ↦ (ψ^k)*` a bijection onto it,
`1, ψ ∈ 𝒦(ψ)`, closed under inversion, and every conductor dividing that of `ψ`. It is not
redefined here; it is read as a finite set of bundles, a `Finset PrimitiveDirichletCharacter`
(RiemannHypothesisStatementsAndConsequences §10.3). Write `𝒦_ℚ(ψ)` for its image under
`toPrimitiveRayClassCharacter`, a finite
set of characters of `ℚ`, and, for weights `w : PrimitiveDirichletCharacter → ℝ`, write
`w_ℚ = (Finsupp.indicator 𝒦(ψ) fun κ _ ↦ w κ).mapDomain toPrimitiveRayClassCharacter`, the
finitely supported function on the characters of `ℚ` with
`w_ℚ(toPrimitiveRayClassCharacter κ) = w(κ)` for `κ ∈ 𝒦(ψ)` and `0` elsewhere
(`Finsupp.mapDomain_apply_of_injective`, `Finsupp.indicator_apply`).

- `#𝒦_ℚ(ψ) = o`; `𝒦_ℚ(ψ)` contains the trivial character of `ℚ` and the image of `ψ`, and is closed
  under inversion, the equivalence commuting with `1` and `⁻¹`.
- The image of `κ ∈ 𝒦(ψ)` has finite conductor `(κ.level)`, which divides the finite conductor of
  the image of `ψ`.
- `w_ℚ` is a weighted family exactly when `w(κ) ≥ 0` for every `κ ∈ 𝒦(ψ)`, whatever the values
  of `w` off `𝒦(ψ)`, and its members are the images of the `κ ∈ 𝒦(ψ)` with `w(κ) > 0`.

*Needs:* 0.1; FrobeniusRestrictedRieszSums §0.5; RiemannHypothesisStatementsAndConsequences §10.3
(`PrimitiveDirichletCharacter`),
§11.1 (`PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter`, its values, conductors and
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

For a finitely supported `w : PrimitiveRayClassCharacter K →₀ ℝ` define its *remainder*
`G_w(y) = Σ_ψ w(ψ) Re G_ψ(y)`, that is `w.sum fun ψ c ↦ c * (ψ.rieszRemainder y).re`; a real function
of `y`.

- `G_{w+w′} = G_w + G_{w′}` and `G_{c•w} = c G_w`.
- `Re G_ψ = (G_ψ + G_{ψ⁻¹})/2`, by the conjugation clause of
  RiemannHypothesisStatementsAndConsequences §8.4a(b),
  `G_{ψ⁻¹} = conj G_ψ`; hence `G_{w^∨} = G_w` and `G_{w^s} = G_w`, and if `w = w^∨` then
  `G_w = Σ_ψ w(ψ) G_ψ`.
- Over `ℚ`, for a primitive Dirichlet character `ψ` and weights `w` on `𝒦(ψ)` (0.2),
  `G_{w_ℚ}(y) = Σ_{κ ∈ 𝒦(ψ)} w(κ) Re G_κ(y)`, by the agreement of the Dirichlet and the ray-class
  remainders in RiemannHypothesisStatementsAndConsequences §8.4a(b) and the injectivity of
  `toPrimitiveRayClassCharacter`.

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

For a weighted family `w`, `G_w : ℝ → ℝ` is continuous on `ℝ`, hence measurable, and there is
`C_w` with `|G_w(y)| ≤ C_w y` for every `y ≥ 1`. Hence `∫_1^∞ |G_w(y)| y^{−σ−1} dy < ∞` for every
real `σ > 1`: with measurability, the hypotheses of PositivityOfDirichletSeriesWithKernels §6.9(b) on `G`
at `A = 1`.

Route: `rieszSum` is continuous on `ℝ` (RiemannHypothesisStatementsAndConsequences §8.4a(a)), and so
are `y ↦ y log y`
(Mathlib `Real.continuous_mul_log`) and `y ↦ y`; so each `G_ψ`, its real part and the finite
sum `G_w` are continuous, and measurable (`Continuous.measurable`). The size clause of
RiemannHypothesisStatementsAndConsequences §8.4a(b),
`‖G_ψ(y)‖ ≤ C_ψ y`, the triangle inequality with `C_w = Σ_ψ w(ψ) C_ψ`, and
`∫_1^∞ y^{−σ} dy = 1/(σ − 1)`.

*Needs:* 0.3; RiemannHypothesisStatementsAndConsequences §8.4a(a)–(b); Mathlib `Real.continuous_mul_log`,
`Continuous.measurable`.

### 0.5 The transform of a family

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

Let `w` be a weighted family and let `Z(w)` be the set of `ρ` with `Re ρ > 0` such that
`L(·, ψ)` has positive order at `ρ` or at `ρ̄` for some member `ψ`.

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
`TauCeti.dedekindZeta_ne_zero_of_one_lt_re`) and, on `Re s = 1`, ZerosOfLFunctions 6.5: order `0`
at `1 + it`, `t ≠ 0` (`meromorphicOrderAt_dedekindZetaC_one_add`), and `−1` at `1`
(`meromorphicOrderAt_dedekindZetaC_one`). So `Z(w)` lies in `0 < Re ρ < 1`, and a real pole `ρ` has
`0 < ρ < 1` and `ρ(1 − ρ) > 0`.

*Needs:* 0.5; ZerosOfLFunctions 6.5 and RiemannHypothesisStatementsAndConsequences §§8.4a(b), 9.2,
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
§6.5; ArithmeticDirichletSeriesPartII §0.1; LFunctions Layers 3, 5 and 7; Tau Ceti's Dedekind zeta
function on `Re s > 1` and the conjugation of meromorphic orders; Mathlib's finitely supported functions.

## Layer 1: Landau's theorem for weighted families

These statements take a one-sided bound for all large `y`. Their zero-free conclusions are also
special cases of Layer 2, where the bound is needed only on windows; their convergence conclusions
are not.

### 1.1 Upper bounds for the remainder

Let `w` be a weighted family of characters of `K`,
`0 ≤ θ < 1` and `C`, `y₀` real. If `G_w(y) ≤ C y^θ` for every `y ≥ y₀`, then every member `ψ`
satisfies `ZeroFreeRightOf θ (heckeLFunctionC ψ.character)`, and
`∫_1^∞ |C y^θ − G_w(y)| y^{−σ−1} dy < ∞` for every real `σ > θ`.

Route: PositivityOfDirichletSeriesWithKernels §6.4(b) with `A = 1` for `g(u) = G_w(e^u)`: its transform
`Φ_w` on `Re s > 1` is meromorphic on `ℂ` (0.5), and its real poles in `(θ, 1]` lie in `(0, 1)`,
are simple and have positive residue, which at a simple pole is the leading coefficient (0.6).
PositivityOfDirichletSeriesWithKernels §6.4(b) gives that `Φ_w` has no pole in `Re s > θ` and that
`∫_0^∞ |C e^{θu} − g(u)| e^{−σu} du < ∞`
for real `σ > θ`, the stated integral after `y = e^u`. A zero of `L(·, ψ)` with `Re ρ > θ ≥ 0`
would be a pole (0.6).

*Needs:* 0.5, 0.6; PositivityOfDirichletSeriesWithKernels §6.4;
RiemannHypothesisStatementsAndConsequences §9.2.

**Checks.**

- The sign of the residue at a real pole is what excludes a real zero above `θ`: a real zero
  `β ∈ (θ, 1)` contributes `y^β/(β(1 − β)) > 0` to `G_w` through the explicit formula, which an
  upper bound `C y^θ` forbids.

### 1.2 Lower bounds for the remainder

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

Route: PositivityOfDirichletSeriesWithKernels §6.4(d) for `g(u) = G_w(e^u)`
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

*Needs:* 0.5, 0.6; PositivityOfDirichletSeriesWithKernels §6.4;
RiemannHypothesisStatementsAndConsequences §§9.2, 9.5;
ExplicitZetaBounds §0.3 (the negativity of `ζ` on `(0, 1)`).

**Checks.**

- The trivial character must be a member: for `K = ℚ`, `w = 0`, `θ = 0` and `C = 1` the lower
  bound `G_w = 0 ≥ −1` holds and `ζ` has no zero in `(0, 1)`, while `1/2 + 14.1347…i` is a zero of
  `ζ`; the empty family, like any family without the member `1`, says nothing about `ζ_K`.

### 1.3 One-sided bounds for `ψ_K(x) − x`

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

Layer 0; PositivityOfDirichletSeriesWithKernels §6.4; RiemannHypothesisStatementsAndConsequences
§§9.2, 9.5, 9.9; ArithmeticDirichletSeriesPartII §4.1; ExplicitZetaBounds §0.3; LFunctions Layers 3
and 8; Tau Ceti's prime ideal theorem.

## Layer 2: the windowed Landau theorem for weighted families

PositivityOfDirichletSeriesWithKernels §6.8, read through its Mellin form §6.9(b), is the theorem this
layer applies. In that form: let `G : ℝ → ℝ` be measurable with `∫_1^∞ |G(y)| y^{−σ−1} dy < ∞`
for every real `σ > A`, let `θ < A`, and let `Ψ(s) = ∫_1^∞ G(y) y^{−s−1} dy`, `Re s > A`, continue
to a function meromorphic on `Re s > θ`. If for some `λ > 1` and every `η > 0` there are
arbitrarily large `Y` with `∫_Y^{Y^λ} G⁺(y) y^{−θ−1} dy ≤ Y^η`, which holds in particular when
`HasWindows {y ≥ 1 | G(y) ≤ C y^θ} λ` for some real `C`, then either `Ψ` has no pole in `Re s > θ`,
or `Ψ` has a real pole `β > θ` such that every pole in `Re s > θ` has real part at most `β` and the
leading coefficient at `β` is negative. At a simple pole the leading coefficient is the residue
(PositivityOfDirichletSeriesWithKernels §6.8, simple-pole corollary). Every application below takes `A = 1`.

### 2.1 Pointwise windows

Let `w` be a weighted family of characters of `K`, `0 ≤ θ < 1`,
`C` real and `λ > 1`. If `HasWindows {y | G_w(y) ≤ C y^θ} λ`, then every member `ψ` satisfies
`ZeroFreeRightOf θ (heckeLFunctionC ψ.character)`. The ratio `λ` may be any number above `1`.

Route: PositivityOfDirichletSeriesWithKernels §6.9(b) with `G = G_w` and `A = 1`, measurable and
integrable by 0.4, and `Ψ = Φ_w`,
meromorphic on `ℂ` (0.5). Its real poles in `(θ, 1]` lie in `(0, 1)`, are simple and have positive
residue (0.6), so the second alternative is excluded and `Φ_w` has no pole in `Re s > θ`; a zero of
a member with `Re ρ > θ` would be a pole (0.6).

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

Let `w` be a weighted family, `0 ≤ θ < 1` and `λ > 1`. If for
every `η > 0` there are arbitrarily large `Y` with `∫_Y^{Y^λ} G_w(y)⁺ y^{−θ−1} dy ≤ Y^η`, the
conclusion of 2.1 holds.

Route: this is the mean hypothesis of PositivityOfDirichletSeriesWithKernels §6.9(b) for `G = G_w`;
the rest is 2.1's.

*Needs:* as 2.1.

### 2.3 Large values in every window

Let `w` be a weighted family and `0 ≤ θ < 1`. If some
member `ψ` has a zero `ρ` of `L(·, ψ)` with `Re ρ > θ`, then for every `λ > 1` and every `C` there
is `Y₀` such that every window `[Y, Y^λ]` with `Y ≥ Y₀` contains a `y` with `G_w(y) > C y^θ`.

Route: the contrapositive of 2.1.

*Needs:* 2.1.

### 2.4 Lower bounds on windows

Let `w` be a weighted
family, `0 ≤ θ < 1`, `C` real and `λ > 1`. If `HasWindows {y | G_w(y) ≥ −C y^θ} λ`, then either
every member is zero-free
right of `θ`, or some member has a real zero `β ∈ (θ, 1)` and every zero of every member in
`Re s > 0` has real part at most `β`. For `K = ℚ` and `w = single 1 1` the first alternative holds.

Route: PositivityOfDirichletSeriesWithKernels §6.9(b) for `G = −G_w`: the rightmost pole of `−Φ_w`,
if there is one right of `θ`, is real
with negative leading coefficient, that is a real pole of `Φ_w` with positive residue, which 0.6
allows; it bounds the real parts of all poles. For `ζ` there is no real zero in `(0, 1)`
(ExplicitZetaBounds §0.3, its case `q = 1`).

*Needs:* 0.4, 0.5, 0.6; PositivityOfDirichletSeriesWithKernels §§6.8, 6.9; ExplicitZetaBounds §0.3
(the negativity of `ζ` on `(0, 1)`).

### 2.5 Windowed bounds for `ψ_K(x) − x`

Let `0 ≤ θ < 1`, `C` real and `λ > 1`.

- If `HasWindows {x | ψ_K(x) − x ≥ −C x^θ} λ`,
  then `ZeroFreeRightOf θ ζ_K`.
- If
  `HasWindows {x | ψ_K(x) − x ≤ C x^θ} λ`, then
  either `ZeroFreeRightOf θ ζ_K`, or `ζ_K` has a real zero `β ∈ (θ, 1)` and every zero of `ζ_K` in
  `Re s > 0` has real part at most `β`. For `K = ℚ` the first alternative holds.

Route: PositivityOfDirichletSeriesWithKernels §6.9(b) with `A = 1` for `G(y) = −(ψ_K(y) − y)` in the
first statement and
`G(y) = ψ_K(y) − y` in the second, with the integrability and the transform of 1.3, whose poles in
`Re s > 0` are simple with residue `−m/ρ`. For `K = ℚ`, `ζ` has no real zero in `(0, 1)`
(ExplicitZetaBounds §0.3, its case `q = 1`).

*Needs:* 1.3; PositivityOfDirichletSeriesWithKernels §§6.8, 6.9; ExplicitZetaBounds §0.3
(the negativity of `ζ` on `(0, 1)`).

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

Let `w : PrimitiveRayClassCharacter K →₀ ℝ` be finitely supported and `λ > 1`.

- For `θ ≤ θ′`,
  `HasWindows {y | G_w(y) ≤ y^θ} λ` implies `HasWindows {y | G_w(y) ≤ y^{θ′}} λ`, since
  `y^θ ≤ y^{θ′}` on `y ≥ 1`.
- If `HasWindows {y | G_w(y) ≤ C y^θ} λ` for
  some real `C`, then `HasWindows {y | G_w(y) ≤ y^{θ′}} λ` for every `θ′ > θ`, with the same `λ`,
  because `C y^θ ≤ y^{θ′}` for large `y` and windows of a set that contains `S ∩ [y₀, ∞)` exist when
  those of `S` do.
- The sets are unchanged under inversion and symmetrization of `w`, `G_{w^∨} = G_{w^s} = G_w`
  (0.3); scaling by `c > 0` multiplies `G_w` by `c`, and the previous item moves the bound to every
  `θ′ > θ`.

*Needs:* 0.3; PositivityOfDirichletSeriesWithKernels §6.9(a) (`HasWindows`, monotonicity in the set and in
`λ`, windows beyond a threshold).

### 3.2 Zero-free half-planes give window bounds

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

Let `w` be a weighted family and
`σ ∈ [1/2, 1)`. Then
`(∀ ε > 0, ∃ λ > 1, HasWindows {y | G_w(y) ≤ y^{σ+ε}} λ) ↔ ∀ ψ ∈ w.support, ZeroFreeRightOf σ (heckeLFunctionC ψ.character)`.
At `σ = 1/2` the right side is `ψ.character.GeneralizedRiemannHypothesis` for every member. The
window ratio `λ` may depend on `ε`. A single exponent does not suffice: the window bound at one
`θ ∈ (σ, 1)` gives zero-freeness right of `θ` (2.1), not right of `σ`.
Of this equivalence, the implication from the window bounds to the hypothesis is the step of
[FormalProof]; the converse is classical, by the bound of 3.2 for the remainder under a zero-free
half-plane, and is not part of that proof.

Route: (←) 3.2. (→) for `0 < ε < 1 − σ`, 2.1 at `θ = σ + ε` gives zero-freeness right of
`σ + ε`, and the monotonicity clause of RiemannHypothesisStatementsAndConsequences §9.2 (zero-free
right of `σ` exactly when zero-free right of every `σ′ > σ`) gives it right of `σ`.

*Needs:* 2.1, 3.2; RiemannHypothesisStatementsAndConsequences §9.2.

**Checks.**

- The empty family `w = 0`: both sides hold, the left because `G_w = 0 ≤ y^{σ+ε}` for every `y ≥ 0`,
  the right vacuously.
- At `0 ≤ θ < 1/2` the window bound fails for every nonempty family: every `L(s, ψ)` has infinitely
  many zeros in the critical strip (ZerosOfLFunctions Layer 7), and its zero set is invariant under
  `ρ ↦ 1 − ρ̄` (RiemannHypothesisStatementsAndConsequences §9.3), so it has zeros with real part at
  least `1/2`, which 2.1
  would exclude.

### 3.4 Reduction to cyclic families

The hypothesis for every Dirichlet character reduces to cyclic families:
`(∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.GeneralizedRiemannHypothesis) ↔
∀ ψ : PrimitiveDirichletCharacter, ∀ κ ∈ 𝒦(ψ), κ.character.GeneralizedRiemannHypothesis`.

Route: (→) every member of `𝒦(ψ)` is a primitive Dirichlet character. (←) `ψ ∈ 𝒦(ψ)`
(FrobeniusRestrictedRieszSums §0.5); for `χ` modulo `N` the bundle
`PrimitiveDirichletCharacter.of χ` has character `χ.primitiveCharacter`
(RiemannHypothesisStatementsAndConsequences §10.3), and
RiemannHypothesisStatementsAndConsequences §9.4's
`generalizedRiemannHypothesis_primitiveCharacter_iff` passes from it to
`χ`.

*Needs:* 0.2; FrobeniusRestrictedRieszSums §0.5; RiemannHypothesisStatementsAndConsequences §§9.4, 10.3.

### 3.5 The Riemann hypothesis as a window bound

`riemannHypothesis_iff_forall_exists_windows`:
`RiemannHypothesis ↔ ∀ ε > 0, ∃ λ > 1, HasWindows {y | Re G(y) ≤ y^{1/2+ε}} λ`, with
`G = PrimitiveRayClassCharacter.rieszRemainder 1` the remainder of the trivial character of `ℚ`,
`G(y) = Σ_{n ≤ y} Λ(n)(y/n − 1) − y log y + (1 + γ) y` (RiemannHypothesisStatementsAndConsequences
§8.4a(b)). The trivial
character is real, so `G` is real-valued (the conjugation clause of
RiemannHypothesisStatementsAndConsequences §8.4a(b)) and `Re G = G`.
Of this equivalence, the implication from the window bounds to the hypothesis is the step of
[FormalProof]; the converse is classical, by the bound of 3.2 for the remainder under a zero-free
half-plane, and is not part of that proof.

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
FrobeniusRestrictedRieszSums §0.5; PositivityOfDirichletSeriesWithKernels §6.9; ZerosOfLFunctions Layer 7.

## Layer 4: cyclic families and the Riemann hypothesis

ThetaChainsAndFrobeniusPrimeSums states its window bounds (its §10.11, for every primitive
Dirichlet character `ψ`) through the remainders `G_κ` of RiemannHypothesisStatementsAndConsequences
§8.4a(b), the predicate
`HasWindows` of PositivityOfDirichletSeriesWithKernels §6.9 and the cyclic family of
FrobeniusRestrictedRieszSums §0.5, and
depends on nothing here; this layer reads the conclusion of its §10.11 through 0.2 and 0.3 and
proves what it is equivalent to.

### 4.1 A family containing a character

Let `ψ` be a character of `K`. If for every
`ε ∈ (0, 1/2)` there are a weighted family `w_ε` of characters of `K` with `w_ε(ψ) > 0` and a ratio
`λ_ε > 1` with `HasWindows {y | G_{w_ε}(y) ≤ y^{1/2+ε}} λ_ε`, then
`ψ.character.GeneralizedRiemannHypothesis`. The families and the window ratios may depend on `ε`.

Route: 2.1 at `θ = 1/2 + ε`, `C = 1`, for `w_ε`, of which `ψ` is a member, gives
`ZeroFreeRightOf (1/2 + ε) (heckeLFunctionC ψ.character)` for every `ε ∈ (0, 1/2)`; then the
monotonicity clause of RiemannHypothesisStatementsAndConsequences §9.2.

*Needs:* 2.1; RiemannHypothesisStatementsAndConsequences §§9.2, 9.5.

**Checks.**

- The weight must be positive at `ψ`: a family with `w(ψ) = 0` gives no information on `L(·, ψ)`
  (0.6).

### 4.2 Cyclic families of Dirichlet characters

Let `ψ` be a primitive Dirichlet
character. The following are equivalent:

- (i) for every `ε > 0` there are positive reals `w(κ)`, `κ ∈ 𝒦(ψ)`, and `λ > 1` with
  `HasWindows {y | Σ_{κ ∈ 𝒦(ψ)} w(κ) Re G_κ(y) ≤ y^{1/2+ε}} λ`;
- (ii) `κ.character.GeneralizedRiemannHypothesis` for every `κ ∈ 𝒦(ψ)`.

Statement (i) holds for every primitive Dirichlet character `ψ`, by
ThetaChainsAndFrobeniusPrimeSums §10.11. Further, (i) for every primitive Dirichlet character `ψ`
is equivalent to the generalized Riemann hypothesis for every Dirichlet character (3.4).
Of the equivalence of (i) and (ii), the implication from the window bounds to the hypothesis is
the step of [FormalProof]; the converse is classical, by the bound of 3.2 for the remainder under a
zero-free half-plane, and is not part of that proof.

Route: by 0.3 the sum in (i) is `G_{w_ℚ}`, and `w_ℚ` is a weighted family whose members form
`𝒦_ℚ(ψ)` (0.2). The hypothesis of the image of `κ` is that of `κ.character`:
RiemannHypothesisStatementsAndConsequences §11.1, by the definition of the equivalence, writes the
image as the primitive character of
`(ratDirichletEquiv q _).symm κ.character`, `q` the level of `κ`,
RiemannHypothesisStatementsAndConsequences §9.2's
ray-class clause passes to that presentation, and the rational bullet of its §9.5 to `κ.character.LFunction`.
(i) ⇒ (ii): 4.1 at each member of `𝒦_ℚ(ψ)`. (ii) ⇒ (i): 3.2 at `σ = 1/2` with all weights `1`
gives the bound at every `1/2 + ε`, with every `λ`. The last sentence: 3.4.

*Needs:* 0.2, 0.3, 3.2, 3.4, 4.1; RiemannHypothesisStatementsAndConsequences §§9.2, 9.5, 11.1; for
the sentence
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

Layers 0, 2 and 3; RiemannHypothesisStatementsAndConsequences §§9.2, 9.5, 11.1;
ThetaChainsAndFrobeniusPrimeSums §10.11, for the sentence of 4.2 on statement (i).

## Layer 5: the headline theorems

### 5.1 The generalized Riemann hypothesis for Dirichlet L-functions

`meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`: for every `N` with `NeZero N` and every
`χ : DirichletCharacter ℂ N`, `χ.GeneralizedRiemannHypothesis`, that is
`ZeroFreeRightOf (1/2) χ.LFunction`: `meromorphicOrderAt χ.LFunction s ≤ 0` for every `s` with
`Re s > 1/2`. Hence
`∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.GeneralizedRiemannHypothesis`.
The theorem gives `DirichletGRH χ` of AnalyticNumberTheoryPartI §1.6 for every `χ`, that predicate
being the second strip form of RiemannHypothesisStatementsAndConsequences §9.4, hence `GRH` of
AnalyticNumberTheoryPartI §1.6 and `GRHMod q` of ExplicitNumberFields §0.5 (`DirichletGRH χ` for
every `χ` modulo `q`) for every `q ≥ 1`.

Route: let `ψ = PrimitiveDirichletCharacter.of χ`. Statement (i) of 4.2 holds at `ψ` by
ThetaChainsAndFrobeniusPrimeSums §10.11, so by 4.2 every member of `𝒦(ψ)` satisfies the
hypothesis, `ψ` among them (FrobeniusRestrictedRieszSums §0.5).
`ψ.character = χ.primitiveCharacter` (RiemannHypothesisStatementsAndConsequences §10.3), and
RiemannHypothesisStatementsAndConsequences §9.4's
`generalizedRiemannHypothesis_primitiveCharacter_iff` gives the hypothesis for `χ`. The route uses
the window bounds at the cyclic family of `PrimitiveDirichletCharacter.of χ` only.

*Needs:* 4.2; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §10.11;
RiemannHypothesisStatementsAndConsequences §§9.4,
10.3.

### 5.2 The Riemann hypothesis

`riemannHypothesis`: `RiemannHypothesis`.

Route: 5.1 at modulus one, and RiemannHypothesisStatementsAndConsequences §9.4's
`generalizedRiemannHypothesis_modOne_iff`.
The route uses the window bounds at the trivial character only, whose cyclic family is `{1}`
(ThetaChainsAndFrobeniusPrimeSums §10.11 at `ψ = 1`).

*Needs:* 5.1; RiemannHypothesisStatementsAndConsequences §9.4.

### 5.3 Values and the critical strip

For every `N ≥ 1` and `χ : DirichletCharacter ℂ N`:

- the hypothesis holds for `χ`, for `χ⁻¹` and for `χ.primitiveCharacter` (5.1);
- `LFunction_ne_zero_of_one_half_lt_re`: if `1/2 < Re s` and (`χ ≠ 1` or
  `s ≠ 1`), then `χ.LFunction s ≠ 0`;
- `re_eq_half_of_LFunction_eq_zero`: if `0 < Re s < 1` and
  `χ.LFunction s = 0`, then `Re s = 1/2`, imprimitive characters included;
- `riemannZeta_ne_zero_of_one_half_lt_re`: `riemannZeta s ≠ 0` whenever `1/2 < Re s` (at `s = 1`
  Mathlib's value `(γ − log 4π)/2` is not `0`), and `re_eq_half_of_riemannZeta_eq_zero`: every
  zero of `riemannZeta` with `0 < Re s < 1` has `Re s = 1/2`.

Route: 5.1 with RiemannHypothesisStatementsAndConsequences §9.4's consumer forms, which rest on its
value form (`generalizedRiemannHypothesis_iff_LFunction_ne_zero`) and its strip form
(`generalizedRiemannHypothesis_iff_re_eq_half`) for every character, primitive or not; 5.2 with
RiemannHypothesisStatementsAndConsequences §9.3's `riemannHypothesis_iff_riemannZeta_ne_zero`.

*Needs:* 5.1, 5.2; RiemannHypothesisStatementsAndConsequences §§9.3, 9.4.

**Checks.**

- The principal character modulo `2` has `L(s) = (1 − 2^{−s}) ζ(s)`, with zeros `2πik/log 2` on
  `Re s = 0`; the strip form excludes them through `0 < Re s`, and a form with `0 ≤ Re s` would be
  false.
- `ζ(−2) = 0`, with `Re(−2) < 0`: the strip form does not constrain the trivial zeros.

### 5.4 Completed L-functions

`re_eq_half_of_meromorphicOrderAt_completedLFunction_pos`: for a primitive
Dirichlet character `χ`, `(dirichletData χ hχ).GeneralizedRiemannHypothesis`: every
point of positive order of its completed function, Mathlib's
`DirichletCharacter.completedLFunction χ`, has real part `1/2`. And
`riemannZetaData.GeneralizedRiemannHypothesis`.

Route: 5.1 and RiemannHypothesisStatementsAndConsequences §9.4's completed-function clause, which
rests on the uncompleted form of its §9.3: the
record has a meromorphic continuation and a functional equation (LFunctions Layer 4,
`dirichletData`), its gamma shifts `0` or `1` have real part at least `−1/2`, so the gamma factor
has neither zero nor pole on `Re s > 1/2`, and its continued L-function is `χ.LFunction`; 5.2 and
the `ζ` bridge of its §9.3.

*Needs:* 5.1, 5.2; RiemannHypothesisStatementsAndConsequences §§9.3, 9.4; LFunctions Layer 4.

### 5.5 Dedekind zeta functions of abelian fields

`meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois`: for every number field `K` with
`IsAbelianGalois ℚ K`, `NumberField.ExtendedRiemannHypothesis K`. In particular
`NumberField.ExtendedRiemannHypothesis (CyclotomicField q ℚ)` for every `q ≥ 1`.
The theorem gives ERH(`K`) of AnalyticNumberTheoryPartI §2.42, which ExplicitNumberFields writes
`DedekindERH K`, and `DedekindERH K` of ClassicalArithmeticCompletion §5.0: both are the strip form
of RiemannHypothesisStatementsAndConsequences §9.5 for `dedekindZetaC K`.

Route: by Kronecker–Weber (ClassFieldTheory Layer 13, `kroneckerWeber`) `K` embeds in `ℚ(ζ_f)` for
some `f ≥ 1`, and AnalyticNumberTheoryPartI §2.42 for that `f` (its abelian equivalence of ERH(`K`)
with `RiemannHypothesis` and `DirichletGRH χ` for the nontrivial characters `χ` of the product
`ζ_K = ∏_χ L(s, χ*)`) gives ERH(`K`) from 5.2 and from 5.1 in the form `DirichletGRH χ`; the strip
form of RiemannHypothesisStatementsAndConsequences §9.5 turns it into
`NumberField.ExtendedRiemannHypothesis K`. The cyclotomic case is the
case `K = ℚ(ζ_q)`, `f = q`.

*Needs:* 5.1, 5.2; AnalyticNumberTheoryPartI §§1.6, 2.42; RiemannHypothesisStatementsAndConsequences
§§9.4, 9.5; ClassFieldTheory Layer 13.

**Checks.**

- `K = ℚ(i)`: `ζ_K = ζ · L(·, χ₋₄)`; the theorem is 5.2 together with 5.1 at `χ₋₄`.
- For a non-Galois cubic field `K` the factorization of `ζ_K` involves the Artin L-function of a
  two-dimensional representation, which is not a Dirichlet L-function: no target here gives
  `NumberField.ExtendedRiemannHypothesis K`.

### 5.6 Hecke characters of abelian extensions of `ℚ`

`meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois`: let `K ⊆ L` be
number fields with `L/ℚ` abelian, so that `L/K` is abelian, let `φ : Gal(L/K) →* ℂˣ`
and let `φ̃ = PrimitiveRayClassCharacter.of (φ.comp Φ_{L/K})` (Conventions). Then
`φ̃.character.GeneralizedRiemannHypothesis`. This gives GRH(`φ̃`) of AnalyticNumberTheoryPartI §2.42,
the strip form of the same hypothesis (RiemannHypothesisStatementsAndConsequences §9.5).

- *The norm-composed characters.* `K` is abelian over `ℚ`, being contained in `L`. As `L` and `φ`
  vary, the characters `φ̃` of `K` so obtained are exactly the primitive characters inducing the
  norm-composed characters `χ ∘ N_{K/ℚ}` of QuasiRiemannHypothesis §5.4, the
  ray-class characters `𝔞 ↦ χ(N_{K/ℚ} 𝔞)` of the modulus `m𝒪_K` times the real places, `χ` a
  Dirichlet character modulo `m`, `m ≥ 1`.

Route: 5.5 gives `NumberField.ExtendedRiemannHypothesis L`. The irreducible representations of the
abelian group `Gal(L/K)` are its characters, and each satisfies Artin holomorphy
(AnalyticNumberTheoryPartI §2.41, one-dimensional `ρ`); for `φ ≠ 1` its order at `1` is therefore
`0`, the trivial representation not occurring in `φ`. So RieszSumsOverPrimesAndExceptionalZeros §2.41a, last
bullet, for `L/K` gives `ZeroFreeRightOf (1/2)` of the Brauer continuation `L_K(·, φ)` of every
`φ`. By the one-dimensional comparison of AnalyticNumberTheoryPartI §2.18a, `L_K(·, φ)` is the
L-function of the character
attached to `φ` by reciprocity, whose Euler factor at a prime `𝔭 ∤ 𝔣` is
`(1 − φ(Frob_𝔭) N𝔭^{−s})⁻¹`, the Euler factor of `φ̃` there (Conventions). On `Re s > 1` the two
Euler products therefore differ by finitely many factors `(1 − a N𝔭^{−s})^{±1}`, `|a| ≤ 1`, at the
primes dividing `𝔣`, a function analytic and nonzero on `Re s > 0`; the identity extends to the
continuations (`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`), and
RiemannHypothesisStatementsAndConsequences
§9.2 (germs, products) gives `ZeroFreeRightOf (1/2) (heckeLFunctionC φ̃.character)`.

The identification of the bullet: by Kronecker–Weber (ClassFieldTheory Layer 13) `L ⊆ ℚ(ζ_m)` for
some `m`; inflate `φ` to `Gal(ℚ(ζ_m)/K)`, a subgroup of `Gal(ℚ(ζ_m)/ℚ) ≅ (ℤ/m)ˣ`, and extend it to
a character `χ` of `(ℤ/m)ˣ` (a character of a subgroup of a finite abelian group extends, `ℂˣ`
being divisible). For a prime `𝔭 ∤ m` of `K` above `p`, of residue degree `f`, the Frobenius of `𝔭`
in `ℚ(ζ_m)/K` is, as an element of `Gal(ℚ(ζ_m)/ℚ)`, the `f`-th power of the Frobenius of `p`, which
sends `ζ_m` to `ζ_m^p` (ClassFieldTheory C.6); so it sends `ζ_m` to `ζ_m^{N𝔭}`, and
`φ̃(𝔭) = χ(N𝔭)`. Hence `φ.comp Φ_{L/K}` and `χ ∘ N_{K/ℚ}`, induced to a common multiple `𝔐` of
their moduli (`RayClassCharacter.induced`), agree at the class of every prime `𝔭 ∤ 𝔐`, hence at
the class of every integral ideal prime to `𝔐`, a product of such primes; so the two induced
characters are equal (Tau Ceti `RayClassGroup.hom_ext`), and
`PrimitiveRayClassCharacter.of_induced` gives `φ̃ = PrimitiveRayClassCharacter.of (χ ∘ N_{K/ℚ})`.
Conversely, the class field of `χ ∘ N_{K/ℚ}` lies in `K(ζ_m)`, which is abelian over `ℚ`, and its
primitive character is the `φ̃` of a character `φ` of `Gal(K(ζ_m)/K)`.

*Needs:* 5.5; AnalyticNumberTheoryPartI §§2.18a, 2.41 and RieszSumsOverPrimesAndExceptionalZeros
§2.41a; ZerosOfLFunctions §8.8; QuasiRiemannHypothesis §5.4;
RiemannHypothesisStatementsAndConsequences §§8.8, 9.2, 9.5;
ClassFieldTheory C.6, Layers 12, 13; LFunctions Layer 5 (`PrimitiveRayClassCharacter.of_induced`);
Tau Ceti `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`,
`TauCeti.GlobalNumberFields.RayClassCharacter.induced`,
`TauCeti.GlobalNumberFields.RayClassGroup.hom_ext`.

**Checks.**

- `K = L = ℚ`: `Gal(L/K)` is trivial, `φ = 1` and `φ̃ = 1`, whose L-function is `dedekindZetaC ℚ`;
  the theorem is 5.2, read through RiemannHypothesisStatementsAndConsequences §9.5's rational bullet.
- `K = ℚ`, `L ⊆ ℚ(ζ_q)` the field cut out by a primitive Dirichlet character `κ` modulo `q` (the
  fixed field of the kernel of `κ` on `Gal(ℚ(ζ_q)/ℚ) ≅ (ℤ/q)ˣ`), `φ` the character of `Gal(L/ℚ)`
  that `κ` induces: at a prime `p ∤ q`, `φ̃(p) = φ(Frob_p) = κ(p)`, the Frobenius of `p` acting by
  `ζ_q ↦ ζ_q^p` (ClassFieldTheory C.6). The modulus `(q)∞` is admissible for `ℚ(ζ_q)`, hence for
  `L`, so the conductor of `L` divides it (ClassFieldTheory Layers 12–13,
  `isAdmissibleModulus_iff_abelianConductor_dvd`). Induced to `(q)∞`, `φ.comp Φ_{L/ℚ}` and the
  character `(ratDirichletEquiv q _).symm κ` agree on the class of every prime `p ∤ q`, hence on
  the class of every integral ideal prime to `q`, a product of such primes, so the two are equal
  (`RayClassGroup.hom_ext`) and
  `PrimitiveRayClassCharacter.of_induced` makes `φ̃` the image of `κ` under
  `toPrimitiveRayClassCharacter` (RiemannHypothesisStatementsAndConsequences §11.1, by the
  definition of the equivalence); the
  theorem is 5.1 for `κ`, read through RiemannHypothesisStatementsAndConsequences §9.5's rational bullet.
- `K = ℚ(i)`, `L = ℚ(i, √−3)`, `φ` the nontrivial character of `Gal(L/K)`: `φ̃` is the character
  `(·/3) ∘ N` of modulus `(3)`, of order `2`, and the theorem applies.
- `K = ℚ(√−3)` and a ray-class character of order `3` whose class field is not abelian over `ℚ`
  (a cubic residue character): it is not of the form `φ̃` for an `L` abelian over `ℚ`, and no target
  here gives its Riemann hypothesis.

### Examples

The principal character modulo `2` has `L(s) = (1 − 2^{−s}) ζ(s)`, with zeros on `Re s = 0` that the
open strip of 5.3 excludes, and `ζ(−2) = 0` lies outside the strip (5.3). For `K = ℚ(i)`,
`ζ_K = ζ · L(·, χ₋₄)`, and 5.5 is 5.2 together with 5.1 at `χ₋₄`. For `K = ℚ(i)`, `L = ℚ(i, √−3)`
and the nontrivial character `φ` of `Gal(L/K)`, `φ̃` is `(·/3) ∘ N`, of modulus `(3)` (5.6).

### Dependencies

Layer 4; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §10.11;
RiemannHypothesisStatementsAndConsequences §§8.8, 9.2–9.5, 10.3, 11.1;
RieszSumsOverPrimesAndExceptionalZeros §2.41a; AnalyticNumberTheoryPartI §§1.6, 2.18a, 2.41, 2.42;
ZerosOfLFunctions §8.8; QuasiRiemannHypothesis §5.4; ClassFieldTheory C.6, Layers 12 and 13;
LFunctions Layers 4 and 5; Tau Ceti's ray-class characters, their induction and the meromorphic
identity theorem on half-planes.

## Layer 6: consequences for the conditional theorems of other roadmaps

Each target below is a statement of another roadmap with the hypotheses that 5.1–5.6 give
removed. Every other hypothesis of the statement stays and is named, except where the conclusion
of the cited statement follows from 5.1–5.3 alone: a zero-free region inside `Re s > 1/2`, a
count of zeros right of `1/2` bounded by a nonnegative quantity, a statement about real zeros right
of `1/2` (6.14(a)–(b), the zero inputs of 6.19, 6.22 and 6.24). Such a statement is given with no
hypothesis, its records included. Where the cited statement is an unconditional estimate whose
proof weighs every zero, an explicit formula smoothed with split heights or a positivity criterion
for primes in a short interval, the target states its instances, the bounds that the cited
roadmap quotes, as consequences of the bounds of 6.17 and 6.18 with the finite records
those need, and not the estimate itself (6.19, 6.20, 6.24); in the same way 6.23 derives the
cyclotomic least-prime bound from its headline, with the headline's records. The statements are
those of the cited sections, with the removed hypotheses read in the predicates of
RiemannHypothesisStatementsAndConsequences §§9.2–9.5; 5.1, 5.5, 5.6, 6.1 and 6.10 name the
predicates in which the cited roadmaps write them. Each hypothesis list after
"given" below is the cited statement's own hypothesis list with the removed hypotheses taken out,
together with every named proposition that the cited statement's route uses and its list does
not name; such an addition says where the route uses it. Where the cited roadmap states the
implication from the hypothesis to one of its own records, the route inserts 5.1–5.6 into that
implication; no such implication is proved again here.

6.11 gives `RiemannHypothesisUpTo H` and `GRH*(q, H)` at every height `H` and modulus `q`, 6.12 the
records `PlattRecord` and `LuZamanZhaoRecord`, and 6.14 the zero-free regions and zero-density
bounds of ExplicitZetaBounds Layers 7–8 and those of `ζ` at the parameters stated in 6.14(d).
Every statement of ExplicitZetaBounds and of ExplicitPrimeCounting that takes such hypotheses
therefore holds with them removed. The targets 6.11–6.24 name the statements whose
discharge removes more than a bounded-height hypothesis, and those that other targets use or that
other roadmaps quote; the others, among them ExplicitPrimeCounting §§2.1, 3.2, 3.3, 3.7, 3.8,
4.2, 4.3, 5.3, 6.4 and 7.4, lose those hypotheses by 6.11, 6.12 and 6.14 alone and keep every
other, together with the named propositions that their routes use besides their lists (such as
Rosser's zero count and the reciprocal-zero records, below). Two general theorems of
ExplicitPrimeCounting are not discharged here: the smoothed explicit formula with split heights
of its §3.1(c), and the positivity criterion of its §7.3; their instances are the statements of
6.19 and 6.24. A statement of ExplicitPrimeCounting whose route takes as input one of the bounds
that 6.19 proves directly, such as `trudgian_interval` of its §7.4, which takes Trudgian's
`|θ(t) − t| ≤ 0.0045 t/log² t` for `t ≥ e³⁵`, holds with that input taken from 6.19,
under the hypotheses listed there, in place of *FaberKadiriTable*.

The truncated explicit formula of ExplicitPrimeCounting §2.1 and its *DudekExplicitFormula* bound
the short sums of `Λ` by the Brun–Titchmarsh inequality of that roadmap's §0.1, which is proved
under `MVDiagonalFiniteRange` and `BrunTitchmarshFiniteRange`: below, *the Brun–Titchmarsh
ranges*. The formula's Dudek shape (error `2 x log² x/T` for `x ≥ e⁴⁰` and
`max(51, log x) < T < (√x − 2)/2`) is the row `(40, 1/2, 0.48, 6.431)` of its table proposition
*CullyHugillJohnstonTable*: below, *the Dudek row*. A statement below whose route uses the formula
is given the Brun–Titchmarsh ranges, the rows of that table it uses, and Rosser's zero count
(below), through which the formula's contour argument counts the zeros near the truncation height.

Three inputs on the counting of zeros recur, and each is named once here.

- *Rosser's zero count* is the pair of records `ZetaZeroFreeUpTo 14` (no zero of `ζ` with
  `0 < Re s < 1` and `|Im s| ≤ 14`) and `ZetaArgumentBoundUpTo 6800000 2` of ExplicitZetaBounds
  §0.4, under which its §5.2 states Rosser's bound
  `|N(T) − M(T)| ≤ 0.137 log T + 0.443 log log T + 1.588` for every `T ≥ 2`
  (`zetaZeroCountBound_rosser_of_recorded`, ExplicitPrimeCounting's *ZeroCountBound*
  `0.137 0.443 1.588 0 2`); from `T = 1467` on it states the bound with no record. The zero count
  that ExplicitPrimeCounting's routes take from `gap:explicit-zero-count-error` is this bound from
  `T = 2`, and the lemmas of its §§2.1 and 3.1 that bound sums over the ordinates assume the count
  from `T = 2`. A statement below whose route uses that count is given Rosser's zero count, unless
  the route takes the count below the height `10⁹` from `ZetaZeroCountLowRange` instead (Lee–Nosal's
  bounds and Chirre–Helfgott's, which carry that record).
- *The reciprocal-zero records* are `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange` and
  *ZetaZeroReciprocalLowRange*, the finite record
  `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π)` for every real `T` with `4πe ≤ T ≤ 200` (the left side is
  constant between consecutive ordinates and the right side increases, so it is this inequality at
  `T = 4πe` and at the `74` ordinates in `(4πe, 200]`). Under them Johnston–Yang's two-sided bound
  of ExplicitPrimeCounting §2.1,
  `(1/4π) log²(T/2π) − 0.9321 ≤ ∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π)` for `T ≥ 4πe`, holds. Write
  `N = M + Q`: `ZetaZeroCountLowRange` gives `|Q(t)| ≤ 0.28 log t` on `[2π, 10⁹]`, and Rosser's
  bound, which ExplicitZetaBounds §5.2 states from `1467` with no record, gives it above `10⁹`
  (`0.137 log t + 0.443 log log t + 1.588 ≤ 0.28 log t` there). Since `dM(t) = (1/2π) log(t/2π) dt`,
  Stieltjes integration of `1/t` over `(U, V]`, `2π ≤ U ≤ V`, gives
  `∑_{U < γ ≤ V} 1/γ = (1/4π)(log²(V/2π) − log²(U/2π)) + Q(V)/V − Q(U)/U + ∫_U^V Q(t) t⁻² dt`,
  and the last three terms have absolute value at most `0.28 (2 log U + 1)/U`. Lower side: the record
  at `2π` gives `N(2π) ≤ −1/8 + 0.28 log 2π < 1`, so `N(2π) = 0`, `Q(2π) = 1/8`, and for `T ≥ 4πe`
  the error from `U = 2π` is at least `−1/(16π) − 0.28 log T/T − 0.28 (1 + log 2π)/(2π) ≥ −0.1754`.
  Upper side: `ZetaZeroReciprocalSum` lies below `(1/4π) log²(10⁷/2π) = 16.2278074617` by
  `m₇ = 0.0171594248`; for `200 ≤ T ≤ 10⁷` the identity on `(T, 10⁷]` gives
  `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π) − m₇ + 0.28 (2 log T + 1)/T`, and
  `0.28 (2 log T + 1)/T ≤ 0.0162353 < m₇` for `T ≥ 200`; for `T > 10⁷` the identity on `(10⁷, T]`
  costs at most `0.28 (2 log 10⁷ + 1)/10⁷ < 10⁻⁶`; on `[4πe, 200]` it is *ZetaZeroReciprocalLowRange*.
  The first two records alone do not give the upper side on that range (a Check of 6.19). The bound
  is the one behind the term `s₁` of §3.1(d) and behind Broadbent–Kadiri–Lumley–Ng–Wilk's (A.10); a
  statement whose route bounds `s₁` that way is given these three records.
- *The Dirichlet zero counts* are, for a primitive character of conductor `k > 1`, the count of
  ExplicitZetaBounds §5.3, given *BennettMartinOBryantRechnitzerRecord*, and, for the trivial
  character, of conductor `1`, Rosser's zero count. A route that sums a zero count over all the
  characters modulo `q` takes the first for each nonprincipal character, through its primitive
  character (in `0 < Re s < 1` an imprimitive character has the zeros of its primitive character,
  the Euler factors at the primes dividing `q` vanishing only on `Re s = 0`: ExplicitZetaBounds
  §0.2), and the second for the principal character, whose zeros in `0 < Re s < 1` are those of
  `ζ`. §5.3 is stated for `k > 1` only: at `k = 1` and `T = 15` its formula would give
  `ℓ = log(17/2π) = 0.995 ≤ 1.567`, hence no zero, while `ζ` has the two zeros `1/2 ± 14.1347…i`.

ExplicitPrimeCounting §3.7 has many hypotheses, and several statements below take them. After 6.11
and 6.14 those that remain are the zero count, which is Rosser's zero count (it contains the
absence of zeros with `0 < Re s < 1` and `|Im s| ≤ 14` that §3.7 lists), `ZetaZeroCubeSum`,
*BKLNWPsiTable*, *BKLNWThetaTables*, `ButheVerified` and *BKLNWRange*, and, for the rows
`b ≥ 2500` of *BKLNWPsiTable*, which use the truncated explicit formula and bound the term `s₁` of
§3.1(d) through Johnston–Yang's bound, the Dudek row, the Brun–Titchmarsh ranges and the
reciprocal-zero records: below, *the remaining hypotheses of §3.7*.
§3.7 proves *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)` under them, so a statement given
"*PsiThetaUpper* or the remaining hypotheses of §3.7" holds under either of the two.

Some conditional statements of other roadmaps are Layer 5 itself and have no target here: the
hypothesis for every Dirichlet character (AnalyticNumberTheoryPartI §1.6) is 5.1; the extended
Riemann hypothesis for every field abelian over `ℚ` and for the cyclotomic fields
(AnalyticNumberTheoryPartI §2.42; ClassicalArithmeticCompletion §5.0 for Dedekind zeta functions)
is 5.5; the Dirichlet parts of QuasiRiemannHypothesis §§10.7 and 11.1 at the exponent `1/2` are 5.1
and the strip form of 5.3.

No target removes a hypothesis that 5.1–5.6 do not give: the Riemann hypothesis of a field not
abelian over `ℚ`, of a Hecke character not of the form of 5.6, or of an Artin, automorphic or
Rankin–Selberg L-function; nonvanishing at the central point; simplicity of zeros; the Dedekind
conjecture. The one exception is the gap hypothesis of 6.28 at the nine quadratic fields with
`d_F ≤ 13`, where 5.3 reduces it to `L(1/2, χ_F) ≠ 0` and a finite verification proved there
supplies that. A finite computational record is removed only where what it supplies to the cited
statement follows from 5.1–5.3 together with the hypotheses that the statement keeps: in the
statements of 6.14(a)–(b); with the regions and densities that the statements of 6.19 and 6.22
take from ExplicitZetaBounds, whose records (`BrentPlattTrudgianRecord`, `HiaryRecord` and the
others that ExplicitZetaBounds lists with each region and density) go with the object they serve;
*PlattCentralRecord* in 6.22, whose only role there is to exclude an exceptional zero;
*JohnstonTable* in 6.17, whose only role is to carry Johnston's bounds beyond the range in which
ExplicitPrimeCounting §2.3 proves sharper ones at a fixed verified height, a range that 5.2,
through 6.11, makes unbounded; and the table propositions and the records on low zeros and on
zero counts of the statements that 6.19, 6.20 and 6.24 prove from the bounds of 6.17 and 6.18
(among them *FaberKadiriTable*, *KadiriLumleyTable*, *CullyHugillLeeTable*, *RamareSaouterTable*,
*DusartThesisTable*, *PlattTrudgianTable*, *OdlyzkoZeroSums*, *LMFDBZeroSums*,
*RosserSchoenfeldLowZeros* and *VanDeLuneZeroCount*, as those statements list them in
ExplicitPrimeCounting), which are given the records of 6.17 and 6.18 instead, with the finite
ranges named with each. The records behind a zero count stay with the zero count, and
wherever a statement rests on a record in any other way, the record stays.

### 6.1 First consequences (RiemannHypothesisStatementsAndConsequences §§9.3, 9.6)

Let `ψ` be the character of `ℚ` attached to a primitive Dirichlet character, or the trivial
character or a character `φ̃` of 5.6 of a field `K` abelian over `ℚ`.

- (a) no real `β` satisfies *IsExceptionalZero* `ψ β` (ZerosOfLFunctions
  6.3); at `ℚ` the exceptional branch of `dirichletLFunction_zeroFreeRegion` occurs for no
  Dirichlet character, primitive or not.
- (b) there is `C_ψ` with `‖rieszRemainder ψ y‖ ≤ C_ψ √y` for every
  `y ≥ 2`, and the same for `PrimitiveDirichletCharacter.rieszRemainder`.
- (c) `(dedekindZetaData K).GeneralizedRiemannHypothesis` for every `K` abelian over `ℚ`;
  `(heckeData ψ).GeneralizedRiemannHypothesis` for every
  `ψ` above. With `riemannZetaData` and `dirichletData χ hχ` for primitive `χ` (5.4):
  `zeroCount d.completed univ R = 0` for each of these four records
  `d` and every bounded `R` disjoint from the line `Re s = 1/2`. The hypotheses of
  `dedekindZetaData K` and `heckeData ψ` are *GRH* of ZerosOfLFunctions Layer 9 for these records
  (every point of positive divisor of the completed function has real part `1/2`), by the divisor
  form of RiemannHypothesisStatementsAndConsequences §9.3.

Route: (a) is §9.6(a) at `σ = 1/2 < 3/4`, and (b) is §9.6(c) at `σ = 1/2`, their hypothesis given by
5.1 (through §9.5's rational bullet), 5.5 and 5.6; (c) is 5.4 and §9.5's record clause with 5.5 and
5.6, and the zero count is the Check of §9.6.

*Needs:* 5.1, 5.4, 5.5, 5.6; ZerosOfLFunctions 6.3 and RiemannHypothesisStatementsAndConsequences
§§9.3, 9.5, 9.6.

### 6.2 Growth on vertical lines (RiemannHypothesisStatementsAndConsequences §9.7)

- (i) For every `δ > 0` and `ε > 0` there is `C` with
  `‖ζ(σ + it)‖ ≤ C |t|^ε` and `‖ζ(σ + it)‖⁻¹ ≤ C |t|^ε` for
  `σ ≥ 1/2 + δ` and `|t| ≥ 2`; and, for every L-function `L` of 6.1, with `𝔮` its analytic
  conductor and `C` depending only on the degree, `δ` and `ε`,
  `‖L(σ + it)‖ ≤ C 𝔮(σ + it)^ε` and
  `‖L(σ + it)‖⁻¹ ≤ C 𝔮(σ + it)^ε` on `σ ≥ 1/2 + δ` at every height that §9.7 calls admissible
  (every `t` for an entire `L`, `|t| ≥ 2` for a Dedekind zeta function).
- (ii) `log |ζ(1/2 + it)| ≤ C log |t|/log log |t|` for
  `|t| ≥ 16`; Lindelöf's bound: for every `ε > 0`,
  `‖ζ(σ + it)‖ ≤ C_ε |t|^ε` for `σ ≥ 1/2` and `|t| ≥ 2`;
  for a primitive `χ ≠ 1` modulo `q`, with an
  absolute `C`, `log |L(1/2 + it, χ)| ≤ C log(q(|t| + 3))/log log(q(|t| + 3))`; and Littlewood's
  bounds: for `q ≥ 3`,
  `(C log log q)⁻¹ ≤ |L(1, χ)| ≤ C log log q` and `|L′/L(1, χ)| ≤ C log log q`. The bounds
  (a)–(d) of §9.7(ii) at `σ₀ = 1/2` hold for the L-functions of 6.1, (c) being Lindelöf's
  bound.

Route: §9.7 at `σ₀ = 1/2`, with its hypothesis given by 5.2, 5.1 (through §9.5's rational bullet),
5.5 and 5.6.

*Needs:* 5.1, 5.2, 5.5, 5.6; RiemannHypothesisStatementsAndConsequences §§9.5, 9.7.

### 6.3 The argument on the critical line (RiemannHypothesisStatementsAndConsequences §9.8)

There is `C` with `|S(T)| ≤ C log T/log log T` for every `T ≥ 16`
that is not an ordinate; and §9.8(ii) at `σ₀ = 1/2`, the
bound `C log 𝔮/log log 𝔮` for the variation of the argument along `[2 + it, 1/2 + it]`, holds for
every L-function of 6.1, with its conditions (`𝔮 ≥ 16`, `L(1/2 + it) ≠ 0`, `t` admissible).

Route: §9.8(i) with 5.2; §9.8(ii) at `σ₀ = 1/2` with 5.1 (through §9.5's rational bullet), 5.5, 5.6.

*Needs:* 5.1, 5.2, 5.5, 5.6; RiemannHypothesisStatementsAndConsequences §9.8.

### 6.4 Prime counts (RiemannHypothesisStatementsAndConsequences §9.9)

- `ψ(x) − x = O(√x log² x)`; `θ(x) − x = O(√x log² x)`; and `π(x) − Li x = O(√x log x)` (von Koch).
  The first strengthens AnalyticNumberTheoryPartI §1.9(i) (`psi_sub_self_isBigO_of_riemannHypothesis`,
  `ψ(x) − x = O_ε(x^{1/2+ε})` under `RiemannHypothesis`), whose conclusion therefore holds with no
  hypothesis.
- For every `q ≥ 1`, the primes in a reduced class modulo
  `q` number `Li x/φ(q) + O_q(√x log x)`.
- For `K` abelian over `ℚ`: `ψ_K(x) = x + O_K(√x log² x)`, and `π_K(x) = Li x + O_K(√x log x)`.
- For `L/K` with `L/ℚ` abelian and a reciprocity dictionary `Φ` at a modulus (ZerosOfLFunctions
  §8.8): `frobeniusPsi C x = (#C/#G) x + O(√x log² x)`,
  and `frobeniusPrimeCount C x = (#C/#G) Li x + O(√x log x)`. This sharpens ZerosOfLFunctions §8.8
  for these `L/K`, whose *exceptionalChebotarevTerm* vanishes by 6.1(a).

Route: §9.9 at `σ = 1/2`: (i) with 5.2 at `ℚ` and 5.5 for `K`; its rational case at `(q)∞` with 5.1;
(iii) with 5.6, the primitive character of each `ψ ∘ Φ` being the `ψ̃` of 5.6, since it does not
depend on the dictionary (RiemannHypothesisStatementsAndConsequences §8.8,
*PrimitiveRayClassCharacter.of_comp_dictionary_eq*),
through §9.5's presented-versus-primitive clause.

*Needs:* 5.1, 5.2, 5.5, 5.6; ZerosOfLFunctions §8.8; RiemannHypothesisStatementsAndConsequences
§§8.8, 9.5, 9.9.

### 6.5 Primes in progressions (AnalyticNumberTheoryPartI §1.9(ii))

`psiAP_isBigO`: for every `q ≥ 1` and `a` prime to `q`, `ψ(x; a, q) − x/φ(q) = O(√x log² x)`,
the implied constant depending on `q`. Hence the conclusion of AnalyticNumberTheoryPartI §1.9(ii),
`ψ(x; a, q) − x/φ(q) = O_{q,ε}(x^{1/2+ε})` for every `ε > 0` (`psiAP_isBigO_of_dirichletGRH`), holds
with no hypothesis.

Route: RiemannHypothesisStatementsAndConsequences §9.9(ii) at the modulus `(q)∞` and `σ = 1/2`, in
its rational case for the primes in a reduced class modulo `q`, whose hypothesis for every Dirichlet
character modulo `q` is 5.1 (through §9.5's rational bullet), as in 6.4. The weaker form follows
from `log² x ≤ C_ε x^ε` for `x ≥ 2`.

*Needs:* 5.1; RiemannHypothesisStatementsAndConsequences §§9.5, 9.9; AnalyticNumberTheoryPartI §1.9.

### 6.6 Littlewood's class-number bound (RiemannHypothesisStatementsAndConsequences §9.7)

There is an absolute `c > 0` with
`h(D) ≥ c √|D|/log log |D|` for every fundamental discriminant `D < −4`, `h(D)` the class number of
the imaginary quadratic field of discriminant `D`. It is the lower bound for `L(1, χ)` of
Littlewood's bounds in 6.2(ii) read through the class number formula. The bound implies
ImaginaryQuadraticClassNumber H2.4 (`imaginary_classNumber_lower_bound`, `h(D) ≥ C_ε |D|^{1/2−ε}`).

Route: let `K` be the imaginary quadratic field of discriminant `D` and `χ_D` its quadratic
character, primitive of conductor `|D| ≥ 7` (Tau Ceti
`TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantCharCast`), hence nontrivial. As
`D ≠ −3, −4`, `K` has two units and `h(D) = √|D| L(1, χ_D)/π` (Tau Ceti
`TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne`), so `L(1, χ_D) = π h(D)/√|D| > 0`.
Littlewood's lower bound of 6.2(ii) at `q = |D| ≥ 3` gives `L(1, χ_D) ≥ (C log log |D|)⁻¹`, hence the
bound with `c = 1/(πC)`.

*Needs:* 6.2; Tau Ceti `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne`,
`TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantCharCast`.

### 6.7 The mod-eight zero clause (AnalyticNumberTheoryPartI §0.16; ErdosProgressionPowers §0.9)

Every zero of `L(s, χ)` with `0 < Re s < 1` and `|Im s| ≤ 10000`, for every
Dirichlet character `χ` modulo `8`, has `Re s = 1/2`; this is the zero clause of
`ModEightFiniteInput`. Hence `thetaAP_eight_interval_ge` holds under the theta clause of
`ModEightFiniteInput` alone. ErdosProgressionPowers §0.9 carries its own copy of
`ModEightFiniteInput`, with the same two clauses; with its zero clause supplied, the following
hold with `ModEightFiniteInput` replaced by its theta clause, their other hypotheses remaining:
the Case-I projection of its §2.3, one of the
primitive characters of the squareclasses of `λ`, `−λ`, `2λ`, `−2λ` has absolute prime-weighted
sum over `(k/2, k]` at least `(1 − 3·0.002811) k/8` and odd conductor `≠ 1`, and the Case-II
projection of its §2.6, the same for the
squareclasses of `ω t v`, `ω ∈ {±1, ±2}`, where `λ = 2t²` and `1 − λ = 2v²` as in its §2.4, with
odd conductor dividing its deletion level `M_a` and `≠ 1`, through which the input enters; and its
headline theorems `character_family`, `effective_prime_bound` and `fixed_length_finiteness`, the
three that carry it.

Route: §0.16's observation that the zero clause follows from the hypothesis for every character
modulo `8` (RiemannHypothesisStatementsAndConsequences §9.4, strip form), with 5.1;
ErdosProgressionPowers §0.9 defines its
copy by the statement of §0.16.

*Needs:* 5.1; AnalyticNumberTheoryPartI §0.16; ErdosProgressionPowers §§0.9, 2.3, 2.6.

### 6.8 The effective Chebotarev theorem for abelian fields (AnalyticNumberTheoryPartI §2.49)

For every finite Galois extension `L/F` with `L` abelian over `ℚ` and `n = [L:ℚ] > 1`, with
`D = |disc L|`, and every conjugacy class `C` of `Gal(L/F)`:
the error of §2.49(ii) is `O(x^{1/2} log(D x^n))` for
`x ≫ (log D)²`; and some unramified
degree-one prime of `F` with Frobenius class `C` has norm `≪ (log D)²` (§2.49(iii)).

Route: §2.49(ii)–(iii) with their hypothesis ERH(`L`) by 5.5.

*Needs:* 5.5; AnalyticNumberTheoryPartI §2.49.

**Checks.**

- `L = F = ℚ` is excluded by `n > 1`: there `D = 1` and `(log D)² = 0`; the degree-one field is
  §2.49's rational case, written with `max(1, log D)²`.

### 6.9 Abelian fields (ClassicalArithmeticCompletion §5.16a)

For every `K` abelian over `ℚ`, with `n = [K:ℚ]` and `Δ_K = |d_K|`:
`|ψ_K(x) − x| ≤ √x((log x/(2π) + 2) log Δ_K + (log² x/(8π) + 2) n)`
for every `x ≥ 100` (§5.16a(i)); and `|log κ_K − S_K(T)| ≤ ε_K(T)` for every `T ≥ 100` (§5.16a(ii)).

Route: §5.16a(i)–(ii) with `DedekindERH K` (§5.0) by 5.5 and `RiemannHypothesis`
by 5.2.

*Needs:* 5.2, 5.5; ClassicalArithmeticCompletion §5.16a.

### 6.10 Fields whose Hilbert class field is abelian over `ℚ` (ClassicalArithmeticCompletion §§5.0, 5.1b, 5.1c)

Let `K` be a number field whose Hilbert class field `H` is abelian over `ℚ`.
`χ.GeneralizedRiemannHypothesis` for every
`χ : RayClassCharacter (Modulus.one K)`, so for every character of `Cl(K)` read through
`TauCeti.GlobalNumberFields.oneEquivClassGroup` (§5.0); and
`NumberField.ExtendedRiemannHypothesis K`. Hence every nontrivial
character `χ` of `Cl(K)` has `χ([P]) ≠ 1` for some prime `P` with `N(P) ≤ 12 (log Δ_K)²`, and
`IsFactorBaseBound K (12 (log Δ_K)²)` (§5.1b); and the
factor-base criterion of §5.1c holds without its premise.

Route: `H = hilbertClassField K` is `rayClassField (Modulus.one K)`, for which `Modulus.one K` is
admissible (`isAdmissibleModulus_rayClassField`); so `abelianConductor K H` divides `Modulus.one K`
(`isAdmissibleModulus_iff_abelianConductor_dvd`) and equals it
(`TauCeti.GlobalNumberFields.Modulus.eq_one_of_dvd_one`). The map `Φ_{H/K}` of the Conventions is
therefore the ray-class Artin map at `Modulus.one K`, which is
`rayClassArtinEquiv (Modulus.one K) : RayClassGroup (Modulus.one K) ≃* Gal(H/K)`
(`rayClassArtinEquiv_apply`); on the class group it is `hilbertClassArtinEquiv K`
(`hilbertClassArtinEquiv_oneEquivClassGroup`) (ClassFieldTheory Layers 12–13). For
`χ : RayClassCharacter (Modulus.one K)` put `φ = χ.comp (rayClassArtinEquiv (Modulus.one K)).symm`;
then `χ = φ.comp Φ_{H/K}`, so `PrimitiveRayClassCharacter.of χ` is the `φ̃` of 5.6 for `L = H`,
with no comparison of dictionaries. 5.6 gives its hypothesis, and
RiemannHypothesisStatementsAndConsequences §9.5's
presented-versus-primitive clause gives `χ.GeneralizedRiemannHypothesis`. `K ⊆ H` is abelian over
`ℚ`, so 5.5 gives the hypothesis for `ζ_K`. These are the premises of §§5.1b and 5.1c, which §5.0
writes as `HeckeGRH χ` for the characters `χ` of `Cl(K)` and `DedekindERH K`, each the strip form
of the hypothesis here (RiemannHypothesisStatementsAndConsequences §9.5).

*Needs:* 5.5, 5.6; ClassFieldTheory Layers 12–13 (`abelianConductor`,
`isAdmissibleModulus_iff_abelianConductor_dvd`, `rayClassField`, `isAdmissibleModulus_rayClassField`,
`rayClassArtinEquiv`, `rayClassArtinEquiv_apply`, `hilbertClassField`, `hilbertClassArtinEquiv`,
`hilbertClassArtinEquiv_oneEquivClassGroup`); RiemannHypothesisStatementsAndConsequences §9.5;
ClassicalArithmeticCompletion §§5.0, 5.1b, 5.1c; Tau Ceti
`TauCeti.GlobalNumberFields.oneEquivClassGroup`,
`TauCeti.GlobalNumberFields.Modulus.eq_one_of_dvd_one`.

**Checks.**

- `K = ℚ(√−5)`: `h = 2` and `H = ℚ(√−5, i)`, abelian over `ℚ`; the theorem applies.
- `K = ℚ(√−23)`: `h = 3` and `H` has Galois group `S₃` over `ℚ`; the theorem does not apply, and
  the class-group characters of order `3` have L-functions that are not Dirichlet L-functions.

### 6.11 Bounded-height hypotheses (ExplicitZetaBounds §§0.2, 0.4; ExplicitPrimeCounting §1.2)

`RiemannHypothesisUpTo H` for every real `H`; `DirichletGRHUpTo q H` for every `q ≥ 1` and every
real `H`. Hence `GRH*(q, H)` of
ExplicitPrimeCounting §1.2 for every `q` and `H`, and the four recorded verifications of §0.4,
`RiemannHypothesisUpTo` at `545 439 823`, `10⁹`, `30 610 046 000` and `3 000 175 332 800`.

Route: §0.2's law `(∀ H, RH(H)) ↔ RiemannHypothesis` with 5.2; §0.2's implication from the
hypothesis for every primitive character modulo `q` to `DirichletGRHUpTo q H` with 5.1; the passage
to imprimitive characters of §0.2 for `GRH*`.

*Needs:* 5.1, 5.2; ExplicitZetaBounds §§0.2, 0.4; ExplicitPrimeCounting §1.2.

### 6.12 Platt's and Lu–Zaman–Zhao's records (ExplicitZetaBounds §§0.4b, 9.3)

`PlattRecord`. `LuZamanZhaoRecord`: for every `q ≤ 10¹⁰`, every
nonprincipal quadratic `χ` modulo `q` and every real `σ ≥ 1 − 1/(5 log q)`, `L(σ, χ) ≠ 0`.
`PlattCentralRecord` and the other records of §0.4b (values, ordinates, `L(1, χ)` tables) are not
given. Lu–Zaman–Zhao's lower bound `L(1, χ) ≥ 1/(8 log q)` holds
for every primitive quadratic `χ ≠ 1` modulo `q`, of every conductor `q`, given
`LuZamanZhaoLOneRecord` alone (ExplicitZetaBounds §9.3 states it for `q ≤ 10¹⁰`, given also
`LuZamanZhaoRecord`).

Route: §0.4b's implications from the hypothesis for the primitive characters of modulus
`2 ≤ q ≤ 400 000` to `PlattRecord`, and from the hypothesis for every nonprincipal quadratic
character of modulus at most `10¹⁰` to `LuZamanZhaoRecord`, with 5.1. Such a character has modulus
`q ≥ 3`, where `1 − 1/(5 log q) > 1/2`, and the value form of 5.3 applies. For the lower bound:
`LuZamanZhaoLOneRecord` is the range `q ≤ 10⁶`; above it, Hoffstein's lemma of §9.3 (for `χ` real
primitive of conductor `q > 10⁶` with `L(σ, χ) ≠ 0` for every real `σ > 1 − 1/(11.657 log q)`,
`L(1, χ) > 1.507/(11.657 log q)`) has its hypothesis by 5.3, since `χ ≠ 1` and
`1 − 1/(11.657 log q) > 1/2`, and `1.507/11.657 = 0.12928 > 1/8`. The cap `q ≤ 10¹⁰` of §9.3 comes
only from `LuZamanZhaoRecord`, which gives Hoffstein's hypothesis there.

*Needs:* 5.1, 5.3; ExplicitZetaBounds §§0.4b, 9.3 (with Hoffstein's lemma).

**Checks.**

- The record concerns nonprincipal characters: for a principal `χ` at `σ = 1` its condition would
  read Mathlib's value of `χ.LFunction` at its pole, which no theorem here addresses.

### 6.13 The zero count of `ζ` (ExplicitZetaBounds §2.9)

There is `C` with
`|N(T) − (T/2π) log(T/(2πe)) − 7/8| ≤ C log T/log log T` for every `T ≥ 16`.

Route: §2.9's corollary of RiemannHypothesisStatementsAndConsequences §9.8(i) under
`RiemannHypothesis`, with 5.2.

*Needs:* 5.2; ExplicitZetaBounds §2.9.

### 6.14 Zero-free regions, zero densities and `1/ζ` near the line one (ExplicitZetaBounds §§7.2–7.6, 7.10, 8.1, 8.3–8.5)

- (a) With no hypothesis: Ford's regions of §7.2, that is the exact
  region for `t ≥ 5.45·10⁸`, with `log 3` or with `log 0.618` in `J`,
  the narrower region, for `t ≥ 1.88·10¹⁴` with `log 3` and
  for `|t| ≥ 3` with `log 0.618` and the classical form
  `σ ≥ 1 − 1/(8.464 log |t|)` for `|t| ≥ 3`; `riemannZeta_ne_zero_classical` (§7.3) and the
  instances of the classical region stated in §7.3, each a case of the first statement of (d);
  `riemannZeta_ne_zero_littlewood` (§7.4);
  `LFunction_zeroFree_mcCurley` and `LFunction_ne_zero_kadiri` (§7.5), and the regions stated there
  of Kadiri's thesis, of Thorner–Zaman's Theorem 2.6
  and of Lu–Zaman–Zhao's Corollary 1.2; and `riemannZeta_ne_zero_vinogradovKorobov` (§7.6).
- (b) With no hypothesis: `zetaZeroCountRight_le_kadiri` (§8.1); the two bounds of §8.3,
  the form with `log(1 + C₁ …)` and
  the power form, at every verification height `H₀` and
  at every choice of the parameters of §8.3 with `σ ≤ 1`, where `C₁ > 0` and `C₂ > 0` (Checks), and
  their instance `zetaZeroDensityCount_nine_tenths_lt`; `primitiveLZeroCount_le_thornerZaman`
  (§8.4); and `zetaZeroDensityCount_le_bellotti` (§8.5).
- (c) The four statements of §7.10 with their bounded-height hypotheses removed, their other
  records remaining: `inv_norm_riemannZeta_one_add_le` without `RiemannHypothesisUpTo 30610046000`,
  given `BrentPlattTrudgianRecord`, `HiaryRecord`, `PatelRecord`, `YangRecord` and
  `HiaryLeongYangRecord`; and, without `RiemannHypothesisUpTo 3000175332800`, Leong's three
  bounds, each given `BrentPlattTrudgianRecord` and *LeongRecord*:
  `1/|ζ(1 + it)| ≤ 29.388 log t` for `t ≥ 2`,
  `1/|ζ(σ + it)| ≤ 30.812 log t` for `σ ≥ 1`, `t ≥ 13` and
  `7.59·10³¹ log t` on `σ ≥ 1 − 1/(5.56 log t)`,
  `t ≥ 13`; Lee–Leong's bound
  (`1237 (log t)^{11/12}` on `σ ≥ 1 − 1/(5.56 log t)`, `t ≥ 3 000 175 332 800`), given
  `BrentPlattTrudgianRecord`; and Lee–Leong's bound below that height
  (`29.388 t^{4.964} log t` on `σ ≥ 3/4`, `14 ≤ t ≤ 3 000 175 332 800 − 1/2`), given
  `BrentPlattTrudgianRecord` and *LeongRecord*.
- (d) Regions and densities at their parameters.
  `ClassicalZeroFreeRegion R t₀` (§7.3a) for all reals
  `R > 0` and `t₀ > e^{2/R}`; so the classical-shape region (`|t| ≥ 2`,
  `σ ≥ 1 − 1/(R log |t|)`) holds when `R log 2 > 2`, and the region of
  ExplicitPrimeCounting §3.1(a) (`|t| ≥ 2π`) when `R log 2π > 2` (and, with the absence of zeros
  up to height `14`, when `R log 14 > 2`: 6.19(a)).
  `ζ` has no zero with `|t| ≥ 21` and
  `σ ≥ 1 − 1/(R log(|t|/17))` when `R log(21/17) > 2`, that is `R > 9.4648…`.
  for real `H` and `ν : ℝ → ℝ` with `ν(t) < 1/2` for every
  `t ≥ H`, `ζ` has no zero with `|γ| ≥ H` and `β ≥ 1 − ν(|γ|)`.
  `N(σ, T) = 0` for `σ > 1/2` and
  `N°(σ, T) = 0` for `σ ≥ 1/2`, at every `T`; so every bound `N(σ, T) ≤ B(T)` with `σ > 1/2`, or
  `N°(σ, T) ≤ B(T)` with `σ ≥ 1/2`, holds at every `T` with `B(T) ≥ 0`; and
  *ZetaZeroDensityBound* `T₀ S c₁ c₂ p q` (§8.3a) holds whenever
  `T₀ ≥ 1`, `S ⊆ [1/2, ∞)` and `c₁ ≥ 0`, `c₂ ≥ 0` on `S`.

Route: (a) every region named lies in `Re s > 1/2`: the least real part of its boundary is
`1 − 1/(5.558691 log 2) ≈ 0.74` for `riemannZeta_ne_zero_classical`, `0.89246` for Ford's region at
`|t| = 3` (his other forms have width `1 − σ` below `0.06`), above `0.98` for §7.4, above `0.96` for
§7.6 and above `0.71` for the regions of §7.5, and the instances of §7.3 are stated at heights
where their boundaries lie right of `1/2`; so 5.3 (and 5.1 for every character modulo `q`, the
principal ones through `ζ`, read through orders) leaves no zero there, and the clauses on an
exceptional zero are vacuous. (b) every count is of zeros with real part above `17/20`, `9/10`,
`1/2 + d/log H₀`, `39/40` or `0.9927`, hence `0` by (d), while each right side is nonnegative: for
§8.1 and §8.4–8.5 at the stated constants (for §8.4 the factor `min(1, (1 − β₁(Q)) log Q)` is
nonnegative since `β₁(Q) ≤ 1`), and for §8.3 because `C₁ > 0`, `C₂ > 0` for `σ ≤ 1`, `d > 0` and
`T > H`, so that `log(1 + C₁ …/(T − H)) > 0`. (c) 6.11. (d) at those parameters the region lies in
`Re s > 1/2`: `t₀ > e^{2/R} > 1` gives `R log |t| ≥ R log t₀ > 2` for `|t| ≥ t₀`,
`R log(|t|/17) ≥ R log(21/17) > 2` and `1 − ν > 1/2`; `ζ` has no zero on `Re s ≥ 1` (Mathlib
`riemannZeta_ne_zero_of_one_le_re`), its trivial zeros are real, below the heights `t₀ > 1`, `21`,
and have `Re s < 0 < 1 − ν`, and 5.3 leaves none in `1/2 < Re s < 1`; the counts are of zeros
with `β > 1/2`, of which 5.3 leaves none. At `R log t₀ ≤ 2`, `t₀ > 1`, the region of the first item
meets the line `Re s = 1/2`, and the absence of a zero there is a record (ExplicitZetaBounds §0.4's
`ZetaZeroFreeUpTo`), not a consequence of 5.3.

*Needs:* 5.1, 5.3, 6.11; ExplicitZetaBounds §§7.2–7.6, 7.3a, 7.10, 8.1, 8.3, 8.3a, 8.4, 8.5;
Mathlib `riemannZeta_ne_zero_of_one_le_re`.

**Checks.**

- The sign of `t₀` (negative control): with Mathlib's `Real.log`, `R log t₀ > 2` alone admits
  `t₀ < 0`; at `R = 0.7`, `t₀ = −20` it reads `0.7 log 20 = 2.097 > 2`, the predicate then speaks
  of every zero, and at `1/2 + 14.1347…i` its boundary is `1 − 1/(0.7 · log 14.1347) = 0.4606`, so
  *ClassicalZeroFreeRegion* `0.7 (−20)` is false under 5.3. The condition `t₀ > e^{2/R}`
  (`e^{2/0.7} = 17.4`) excludes it.
- The closed forms of §8.3 (the source's (4.72)–(4.73)): `C₁` is a product of positive factors,
  and `C₂ = C₇(η, H)(μ − σ + d/log H₀) + C₈(k, μ)` with `C₇ > 0`, `C₈ > 0` and `μ > 1`, so `C₂ > 0`
  for every `σ ≤ 1`. At the parameters of the source's Table 1 (`H₀ = 3.0610046·10¹⁰`,
  `H = H₀ − 1`, `η = 0.25618`, `k = 1`, `μ = 1.245`): `C₇ = 17.7457` and `C₈ = 0.3181`, and at
  `σ = 9/10`, `d = 0.334`, `C₂ = 6.686` and `C₂/(2πd) = 3.186`, the constant of
  `zetaZeroDensityCount_nine_tenths_lt`, with `C₁ = 2πd · 11.499 = 24.13`. There `C₂` vanishes at
  `σ = 1.2768` and is `−12.83` at `σ = 2` (negative control): beyond `σ ≈ 1.28` the right side of
  §8.3 is no longer nonnegative by its shape, while `N°(σ, T) = 0`; the source's theorem is for
  `σ ≤ 1`.

### 6.15 The numerical Landau–Siegel gap (ExplicitZetaBounds §7.9)

*HasLandauSiegelGap* `c ∞` for every `c ≤ (log 3)/2`; in particular its
instances `(1/5) 10¹⁰` and `(3.0·10⁻³) ∞` hold without `LuZamanZhaoRecord`.
This makes the constant of AnalyticNumberTheoryPartI §0.34 (`landau_siegel_exclusion`) explicit:
`c_LS = (log 3)/2`. *HasLandauSiegelGap* is *RealZeroGap* of ExplicitPrimeCounting §1.7, so the
premise *RealZeroGap* `c ∞` of its §6.7(a) holds with `c = (log 3)/2 > 1/6.50 > 1/9.645908801`, for
the regions of Kadiri and of McCurley (6.22 shows directly that no modulus is exceptional for
either).

Route: §7.9's implication from the hypothesis for every real primitive character of conductor
`q ≥ 3` to *HasLandauSiegelGap* `((log 3)/2) ∞`, with 5.1; antitonicity in `c`.

*Needs:* 5.1; ExplicitZetaBounds §7.9.

**Checks.**

- 5.1 gives no `c > (log 3)/2`: it allows a real zero at `1/2` of the character of conductor `3`,
  which *HasLandauSiegelGap* `c ∞` with such `c` excludes. Excluding central zeros needs a further
  input, such as `PlattCentralRecord`, which the Riemann hypothesis does not give.

### 6.16 Bounds under the Riemann hypothesis (ExplicitPrimeCounting §2.2)

- The bounds of `schoenfeld_of_riemannHypothesis`, each given `ButheVerified`,
  `Schoenfeld1976Range` and Rosser's zero count (for `x > 10¹⁹` the route bounds the sum over the
  zeros by the explicit partial sums of `∑ 1/γ` of ExplicitPrimeCounting §2.1, which take the zero
  count from `T = 2` and the absence of zeros below height `2`), with
  `A(x) = √x log² x/(8π)`: `|ψ(x) − x| < A(x)` for `x > 73.2`; `ψ(x) − x > −A(x)` for
  `x > 59`; `|θ(x) − x| < A(x)` for `x > 599`;
  `θ(x) − x < A(x)` for `x > 0`; `|ψ(x) − x|`, `|θ(x) − x| < (1/8π) √x (log x − 2) log x` for
  `x > 23·10⁸`; `|π(x) − li x| < √x log x/(8π)` for
  `x > 2657`; and `π(x) − li x < √x log x/(8π)` for
  `x > 3/2`.
- Lee–Nosal's bounds, each given `ButheVerified`, `LeeNosalRange`, `ZetaZeroReciprocalSum`,
  `ZetaZeroCountLowRange`, `HiaryRecord`, `PatelRecord` and `YangRecord`:
  `|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for `x ≥ 101` and
  Lee–Nosal's Theorem 1.1, for `x ≥ 11`; and
  the `θ` bound of `leeNosal_theta_of_riemannHypothesis` for
  `x ≥ 2657`, given the same and *PsiThetaUpper*. Their route takes the zero count below `10⁹`
  from `ZetaZeroCountLowRange`, and above it from Rosser's bound, which ExplicitZetaBounds §5.2
  states there with no record, and from Bellotti–Wong's, given the three records of the list; so
  Rosser's zero count is not among their hypotheses.

Route: 5.2.

*Needs:* 5.2; ExplicitPrimeCounting §2.2; ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero count).

### 6.17 Bounds from verified heights (ExplicitPrimeCounting §§2.3, 2.6)

- The four bounds of §2.3 hold for every `x` in their ranges, each given `ButheVerified`,
  `Buthe2016Range` and Rosser's zero count, through which the route of §2.3 counts the zeros for
  `x ≥ 10¹⁹` (`buthe_of_riemannHypothesisUpTo` and `johnston_of_riemannHypothesisUpTo` give
  the same four): `|ψ(x) − x| ≤ √x log² x/(8π)` for `x > 59`,
  `|θ(x) − x| ≤ √x log² x/(8π)` for `x > 599`,
  `|π*(x) − li x| ≤ √x log x/(8π)` for `x ≥ 97` and
  `|π(x) − li x| ≤ √x log x/(8π)` for `x > 2657`.
- Büthe's general theorem of §2.3 without `RH(c/ε)`, at all its
  parameters; and its table rows (*Buthe2016Table1*,
  *Buthe2016Table2*), each given its table proposition, without the height `RH(T)` of the row.
- With no hypothesis, the initial ranges: `|ψ(x) − x| < √x log² x` for `3 ≤ x ≤ 59`,
  `|θ(x) − x| < √x log² x` for `3 ≤ x ≤ 599`, `|π*(x) − li x| < √x log x` for `2 ≤ x < 97`, and
  `|π(x) − li x| < √x log x` for `2 ≤ x ≤ 2657`: the four inequalities of Johnston's Theorem 4.1 at
  the constant `a = 1` on the ranges below those of the four bounds above. Route: a finite
  verification. The four step functions jump only at integers, so on each piece
  `[u, v) = [j/16, (j + 1)/16)` meeting a range they are constant, equal to some `c`;
  `|c − F(x)| ≤ max(|c − F(u)|, |c − F(v)|)` for `F(x) = x` or `F = li`, both increasing, and
  `√x log² x` and `√x log x` are increasing on `x ≥ 2`; so the inequality on `[u, v)` follows
  from `max(|c − F(u)|, |c − F(v)|) < √u log^k u` (`k = 2` for `ψ`, `θ`, `k = 1` for `π*`, `π`),
  an inequality between explicit numbers, decided with rational enclosures of the logarithms (the
  series of `2 atanh((m − 1)/(m + 1))` with its geometric tail), of the square roots, of `γ` and of
  `li x = γ + log log x + ∑_{n ≥ 1} (log x)ⁿ/(n·n!)` (truncated with a bound for the tail).
- Johnston's Theorem 4.1 for every real `a ≥ 1`, in particular at every row `(a, K)` of
  *JohnstonTable* (`a = 1, 10, …, 10⁷`), and every `x` in its ranges, each given `ButheVerified`,
  `Buthe2016Range` and Rosser's zero count, the hypotheses of the four bounds above, and without
  the table proposition:
  `|ψ(x) − x| < a √x log² x`, `x ≥ 3`,
  `|θ(x) − x| < a √x log² x`, `x ≥ 3`,
  `|π*(x) − li x| < a √x log x`, `x ≥ 2` and
  `|π(x) − li x| < a √x log x`, `x ≥ 2`.
- The general theorem of §2.6 at every `T ≥ 10⁷` without `RH(T)`, given `ZetaZeroCountLowRange`,
  through which its route bounds the zero count below `10⁹`: its
  bound for `ψ` and its bound for
  `∑_{n ≤ x} Λ(n)/n − log x + γ`; and its instance
  `|ψ(x) − x| ≤ (π/(3·10¹²)) x + 113.67 √x` for `x ≥ 1`, given `ZetaZeroCountLowRange` and
  `ButheVerified`, which its route uses on `11 < x ≤ 10¹⁹`.

Route: 6.11 gives `RiemannHypothesisUpTo T` for every `T`, so Büthe's criterion
`4.92 √(x/log x) ≤ T`, Johnston's criteria and the heights of the rows are met at every `x`. For
Johnston's statements: on the ranges of the four bounds above (`x > 59`, `x > 599`, `x ≥ 97`,
`x > 2657`) those bounds, since `√x log² x` and `√x log x` are positive there and
`1/(8π) < 1 ≤ a`; below them the initial ranges of the third item, since `1 ≤ a`. So the iteration that
*JohnstonTable* asserts beyond the range of the four bounds at a fixed height is not used.

*Needs:* 6.11; ExplicitPrimeCounting §§1.3, 2.3, 2.6; ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero
count); Mathlib `Chebyshev.psi`, `Chebyshev.theta`.

**Checks.**

- The initial ranges are needed (negative control): the four bounds of §2.3 start at `59`, `599`,
  `97` and `2657`, while Johnston's statements start at `3` and `2`; and the verification is at
  the constant of the smallest row only: at `x = 3`, `|ψ(3) − 3| = 3 − log 6 = 1.2082` against
  `√3 log² 3 = 2.0905`, so the constant `1/2` in place of `1` would fail there.
- The partition: on a whole unit interval the comparison of the route can fail where the
  inequality holds: on `[3, 4)`, `ψ = log 6` and `|log 6 − 4| = 2.2082` exceeds `√3 log² 3`. With
  the pieces of length `1/16` the largest ratio of the left side to the right is `0.6082` for `ψ`
  and `θ` (on `[49/16, 25/8)`) and `0.6301` for `π*` and `π` (on `[47/16, 3)`).

### 6.18 Short intervals under the Riemann hypothesis (ExplicitPrimeCounting §2.5)

Schoenfeld's corollary (`(x − √x log² x/(4π), x]` contains a
prime for every `x > 599`), given `ButheVerified`, `Schoenfeld1976Range` and Rosser's zero count,
the hypotheses of 6.16 for the bounds from which it follows; Dudek's
theorem (`(x − (4/π) √x log x, x]` for every `x ≥ 2`) and Ramaré–Saouter's interval
(`(x − (8/5) √x log x, x]` for every `x ≥ 2`), given
`PrimeGapLogSquareVerified` and Rosser's zero count, the explicit zero count of Dudek's route
(ExplicitPrimeCounting §2.5 takes it from `gap:explicit-zero-count-error`); and
Carneiro–Milinovich–Soundararajan's theorem, given
`PrimeGapLogSquareVerified`, the Brun–Titchmarsh ranges, through which its route bounds the prime
powers and the edges of the smoothed interval, and Rosser's zero count, from which it takes the
count of zeros for every height `T ≥ e`.

Route: 5.2, and 6.16 for Schoenfeld's corollary.

*Needs:* 5.2, 6.16; ExplicitPrimeCounting §2.5; ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero
count).

### 6.19 Bounds for `ψ`, `θ` and `π` from zero-free regions and densities (ExplicitPrimeCounting §§3.1, 3.4, 3.6)

- The general forms (a), (b) and (d) of §3.1 hold with their bounded-height hypotheses removed,
  every other hypothesis remaining; the zero-free region and the zero density they take are
  parameters with their hypotheses, which remain in general and are dropped too at the parameters
  stated (the smoothed form (c) of §3.1 is not stated here; its instances are the bounds of the
  third item):
  - (a) `dusart_of_zeroFreeRegion` without its region hypothesis
    `ClassicalZeroFreeRegion R (2π)`, for every `R` with `R log 14 > 2` (`R > 0.7578…`), given
    Rosser's zero count, which contains the absence of zeros with `0 < Re s < 1` and
    `|Im s| ≤ 14` that the statement names and through which its route counts the zeros from the
    height `T₀ = 9.6769…` of `M(T₀) = 0 = N(T₀)` on (ExplicitPrimeCounting §3.1(a), Rosser's
    bound), and `ZetaZeroCubeSum`, which bounds the sums `S₁ + S₂` over all the zeros.
  - (b) §3.1(b) without `RH(A)`, `N(A) = M(A)`
    remaining; without the Rosser–Schoenfeld-shape region as well when `R log(21/17) > 2`.
  - (d) §3.1(d) in each of its published forms, without `RH(H)`; without
    the region hypothesis as well when `ν(t) < 1/2` for every `t ≥ H`, and without the density
    hypothesis as well when `D ≥ 0` on `[H, ∞)`. In the forms whose term `s₁` is bounded by
    Johnston–Yang's bound for `∑_{0 < γ ≤ T} 1/γ` (the statement of (d) itself, and the forms of
    Johnston–Yang, Platt–Trudgian and Broadbent–Kadiri–Lumley–Ng–Wilk), the truncation height
    satisfies `T ≥ 4πe`, added to the hypotheses, and the reciprocal-zero records are given: that
    bound holds for `T ≥ 4πe` only, ExplicitPrimeCounting §3.1(d) asks `H ≥ 4πe` and nothing of
    `T`, and for `T ≤ H` its `s₁ = x^{−1/2} (1/2π) log²(T/2π)` uses the bound at `T` (Checks).
    Fiori–Kadiri–Swidinsky's form bounds the low zeros through `B₁` of §2.1 and
    *FioriKadiriSwidinskyZeroSums*, which it takes as hypotheses, with its zero count.
- The two zero inputs of §3.4 that are densities hold: *FioriKadiriSwidinskyDensity*, at every row
  of its tables and in both its forms; and
  *JohnstonYangDensityTable*, at every row and between consecutive
  rows.
- The bounds that ExplicitPrimeCounting §3.4 obtains from §3.1(c) and *FaberKadiriTable* hold,
  each given exactly the hypotheses listed with it. Here `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}` with
  `X = √(log x/6.455)`, `ε_MT(x) = √(8/(17π)) Y^{1/2} e^{−Y}` with `Y = √(log x/6.315)`, and
  *Büthe's hypotheses* are `ButheVerified`, `Buthe2016Range` and Rosser's zero count, under which
  6.17 states the four bounds of ExplicitPrimeCounting §2.3.
  - Faber–Kadiri's Corollary 1.2: `|ψ(x) − x| ≤ 5.3688·10⁻⁴ x` for
    every `x ≥ e²⁰`, given Büthe's hypotheses.
  - Trudgian's bounds (Theorems 1–2 and Lemma 1), each given Büthe's hypotheses, and the first
    three also *TrudgianRange*: `|θ(x) − x| ≤ x ε₀(x)` for `x ≥ 149`;
    `|ψ(x) − x| ≤ x ε₀(x)` for `x ≥ 23`;
    `|π(x) − li x| ≤ 0.2795 x (log x)^{−3/4} exp(−√(log x/6.455))` for `x ≥ 229`; and
    `|θ(x) − x| ≤ 0.0045 x/log² x` for `x ≥ e³⁵`.
  - Mossinghoff–Trudgian's bound: `|θ(x) − x| ≤ x ε_MT(x)`
    for `x ≥ 149`, given Büthe's hypotheses and *MossinghoffTrudgianRange*.
- The other named instances hold with their bounded-height hypotheses, the two density inputs above,
  and the zero-free regions and zero-density bounds that they take from ExplicitZetaBounds Layers
  7–8, with the records under which that roadmap states those regions and densities, removed. Each
  is given exactly the hypotheses listed with it.
  - Platt–Trudgian's bounds (§3.4), each given Rosser's zero count (its zero-count error),
    *PsiThetaUpper* or the remaining hypotheses of §3.7, the Dudek row and the Brun–Titchmarsh
    ranges (for the truncated explicit formula in its Dudek shape), the reciprocal-zero records
    (for the term `s₁` of §3.1(d)), and *PlattTrudgianTable*:
    at each row `(X, A, B, C, ε₀)`,
    `|ψ(x) − x| ≤ A (log x/R)^B exp(−C √(log x/R)) x` and
    `|ψ(x) − x| ≤ ε₀ x` for `log x ≥ X`; the first with `A + 0.1`
    for `θ`; and `|π(x) − li x| ≤ 235 x (log x)^{0.52} exp(−0.8 √log x)` for `log x ≥ 2000`.
  - Fiori–Kadiri–Swidinsky's bounds (§3.4), each given *the remaining hypotheses of
    FioriKadiriSwidinskyPsiRow*: Rosser's zero count (their zero count, and the count from `T = 2`
    that the bound `B₁` of §2.1 assumes), *PsiThetaUpper* or the remaining hypotheses of §3.7, the
    Dudek row and the Brun–Titchmarsh ranges (for the truncated explicit formula in its Dudek
    shape), *FioriKadiriSwidinskyZeroSums* (for the term `ε₂` of their form of §3.1(d), the zeros
    with `β < 0.9`), *FioriKadiriSwidinskyPsiRow* and `ButheVerified`.
    `|ψ(x) − x| ≤ 9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` for `x ≥ 2`;
    `|ψ(x) − x| ≤ 4.9678·10⁻¹⁵ x`
    for `log x ≥ 3000`; and `|π(x) − Li x| ≤ 9.2211 x √(log x) exp(−0.84768363 √log x)` for `x ≥ 2`.
  - Johnston–Yang's bounds (§3.4, Theorem 1.1 and Corollaries 1.2–1.3), each given Rosser's zero
    count (its zero-count error), *JohnstonYangExplicitFormula*, *JohnstonYangTable*, the
    reciprocal-zero records (for the term `s₁` of §3.1(d) at the rows), the remaining hypotheses
    of *FioriKadiriSwidinskyPsiRow*, `ButheVerified` and *JohnstonYangRange*:
    `|ψ(x) − x| ≤ 9.39 x (log x)^{1.515} exp(−0.8274 √log x)` for
    `x ≥ 2`; at each row, `|ψ(x) − x| ≤ A x (log x)^B
    exp(−C √log x)` and `≤ ε₀ x` for `log x ≥ X`; the rows for `θ`
    with `A + 0.01`; and `|π(x) − li x| ≤ 9.59 x (log x)^{0.515} exp(−0.8274 √log x)` for `x ≥ 2`.
  - Johnston–Yang's Vinogradov–Korobov bounds (§3.6, Theorem 1.4), each given Rosser's zero count
    (its zero-count error, and the count of the bounds of §2.3), *JohnstonYangExplicitFormula*,
    *JohnstonYangVKRow*, *JohnstonYangTable*, the reciprocal-zero records (for the term `s₁` of
    §3.1(d)), the remaining hypotheses of *FioriKadiriSwidinskyPsiRow*, *PsiThetaUpper* or the
    remaining hypotheses of §3.7, *BKLNWPsiTable*, `ButheVerified`, `Buthe2016Range` (for the
    bounds of §2.3, which its route uses from `59` on and which are `Buthe2016Range` below `5000`)
    and *JohnstonYangRange*,
    with `E(x) = exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})`:
    `|ψ(x) − x| ≤ 0.026 x (log x)^{1.801} E(x)`
    for `x ≥ 23`; `|θ(x) − x| ≤ 0.027 x (log x)^{1.801} E(x)` for `x ≥ 59`; and
    `|π(x) − li x| ≤ 0.028 x (log x)^{0.801} E(x)` for `x ≥ 71`.
  - §3.6, Fiori–Jaskari's Theorem 1.1: without
    `RH(3 000 175 332 800)`; without its Vinogradov–Korobov-type region as well when the width `ν`
    of that region has `ν(t) < 1/2` on its range of heights, and without its zero-density input as
    well when that input bounds `N(σ, T)` with `σ > 1/2`, or `N°(σ, T)` with `σ ≥ 1/2`, by a
    quantity nonnegative on its range; otherwise those inputs remain. ExplicitPrimeCounting takes
    both with the paper's constants as parameters and does not display them.

Route: 6.11 for the heights. For the general forms: (a) a zero of `ζ` with `|t| ≥ 2π` lies in the
open strip (none has `Re s ≥ 1`, and the trivial zeros are real), so by the absence of zeros up to
height `14`, which remains (in Rosser's zero count), it has `|t| > 14`, and by 5.3 its real part is
`1/2 < 1 − 1/(R log |t|)`, since `R log |t| > R log 14 > 2`; (b) and (d) are 6.14(d) at the
parameters stated: the region of (b) has the Rosser–Schoenfeld shape, that of (d) is given by `ν`,
and the density of (d) bounds `N°(σ, t)` with `σ > 1/2`, which 6.14(d) makes `0`. In (d) the term
`s₁` is Johnston–Yang's bound of ExplicitPrimeCounting §2.1, under the reciprocal-zero records, at
`T` when `T ≤ H` and at `H` and `T` when `T > H`; both heights are at least `4πe`. The two density
inputs bound `N°(σ, T)` at `σ ≥ 0.6` and at `σ ≥ 0.98`, which 6.14(d) makes `0`, by right
sides that are nonnegative: in each form and at each row the constants (`c̃₁`, `c̃₂`; `C₁`, `C₂`,
`c₁`, `c₂`, `d`; `C₁`, `C₂`) are positive, as Kadiri–Lumley–Ng's closed forms are (6.14's Checks;
among them `(3.7669, 5.2954)`, `(12.0272, 2.9717)`, `(25.3876, 6.0986, 0.336)`, `(16.281, 2.231)`
and `(17.418, 2.069)`), `T ≥ 3·10¹²` and, in the logarithmic form, `T − H > 0`. For the other
instances: their regions are the classical shape with the constants `5.573412` and `5.5666305`
(`R log 2 > 2`), the region `ν₂` (`ν₂ ≤ 0.085`) and the regions of Ford and of Vinogradov–Korobov,
all inside `Re s > 1/2` (6.14(a), (d)); the densities of ExplicitZetaBounds §8.3 at the parameters
the rows use hold with no hypothesis by 6.14(b), and the two density inputs hold as above. The records
under which ExplicitZetaBounds states those regions and densities (`BrentPlattTrudgianRecord`,
`HiaryRecord`) go with them; the records behind a zero count stay with it.

Route of the bounds of Faber–Kadiri, Trudgian and Mossinghoff–Trudgian: three ranges, joined at
`10¹⁹` and at the ends of the finite ranges.

- On `x ≤ 10¹⁹`, `ButheVerified`: `|ψ(x) − x| ≤ 0.94 √x` for `11 < x ≤ 10¹⁹`;
  `0.05 √x < x − θ(x) ≤ 1.95 √x` for `1427 ≤ x ≤ 10¹⁹`, so `|θ(x) − x| ≤ 1.95 √x` there; and
  `0 < li x − π(x) ≤ (√x/log x)(1.95 + 3.9/log x + 19.5/log² x)` for `2 ≤ x ≤ 10¹⁹`. Each of these
  is below the bound it serves from the left end of its range: `5.3688·10⁻⁴ x` from `x = 3.07·10⁶`
  (at `e²⁰` the quotient of the bound by `0.94 √x` is `12.58`); `x ε₀(x)` for `ψ` from `x = 35.08`
  (quotient `1.012` at `36`); `x ε₀(x)` and `x ε_MT(x)` for `θ` from `1427` (quotients `2.673` and
  `2.657`); Trudgian's bound for `π` from `x = 359.3` (quotient `1.001` at `360`); and
  `0.0045 x/log² x` from `e³⁵` (quotient `75.0`). Each quotient increases with `x`: in `L = log x`
  the logarithmic derivative of `√x ε₀(x)` is `1/2 − (1 − 1/(2X))/(12.91 X) ≥ 1/2 − 1/25.82`
  (the maximum of `(1 − 1/(2X))/X` is `1/2`, at `X = 1`), the same with `12.63` for `ε_MT`, that of
  `√x L^{1/4} e^{−√(L/6.455)}` is `1/2 + 1/(4L) − 1/(2 √(6.455 L)) > 0`, the denominator
  `1.95 + 3.9/L + 19.5/L²` decreasing, and that of `√x/L²` is `1/2 − 2/L > 0` for `L ≥ 35`.
- Below those left ends, *TrudgianRange* (`ψ` on `[23, 36]`, `θ` on `[149, 1427]`, `π` on
  `[229, 360]`) and *MossinghoffTrudgianRange* (`θ` on `[149, 1427]`).
- Beyond `10¹⁹`, 6.17: `|ψ(x) − x|, |θ(x) − x| ≤ √x log² x/(8π)` and
  `|π(x) − li x| ≤ √x log x/(8π)`. The quotient of each bound by these is, at `x = 10¹⁹`, `22 293`
  (Faber–Kadiri), `1.92·10⁶` (Trudgian, `ψ` and `θ`), `1.88·10⁶` (Mossinghoff–Trudgian),
  `2.21·10⁶` (Trudgian, `π`) and `97.6` (`0.0045 x/log² x`), and it increases with `x`: the
  logarithmic derivatives in `L` are those above less `2/L`, positive for `L ≥ 43`.

*Needs:* 5.3, 6.11, 6.14, 6.17; ExplicitPrimeCounting §§1.1, 1.3 (`ButheVerified`, *TrudgianRange*,
*MossinghoffTrudgianRange*), 2.1, 3.1, 3.4, 3.6; ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero
count).

**Checks.**

- The range `T ≥ 4πe` of (d) (negative control): take `H = 100`, `T* = T = 14.14`, `x = 10`,
  `σ = 3/4`, `ν = 0.1` and `D = 0`. Under 5.3 the region and the density hypotheses hold, and only
  the first pair of zeros has `|γ| ≤ 14.14`; with `ψ(10) = log 2520 = 7.832014` and
  `2 Re(10^ρ/ρ) = 0.411001` at `ρ = 1/2 + 14.134725…i`, the truncated formula holds with
  `ε₁ = 0.176`: `|ψ(10) − 10 + 0.411001| = 1.756985 ≤ 1.76`. Since `T ≤ H`, `s₂ = 0` and the
  conclusion would read `|ψ(10) − 10| = 2.167986 ≤ 1.76 + (√10/2π) log²(14.14/2π) = 2.091132`,
  which is false; the range `T ≥ 4πe` excludes this choice. Johnston–Yang's upper bound fails
  there: `1/14.134725 = 0.070748` against `(1/4π) log²(14.14/2π) = 0.052357`. At
  `T = 4πe = 34.1589` it holds (`0.221530 ≤ 0.228129`, the five zeros below that height).
- The record *ZetaZeroReciprocalLowRange* is needed besides the other two reciprocal-zero records
  (negative control): move the sixth and seventh positive ordinates of `ζ`, `37.586178` and
  `40.918719`, to `36.5` and `42.466882` (the second chosen so that `∑ 1/(1/4 + γ²)` is unchanged),
  with their conjugates. The count changes only on `[36.5, 37.586)` and `[40.919, 42.467)`, where it
  is `6` and stays within `0.28 log t` of `M`; the sum up to `10⁷` decreases by `0.000099`; but the
  sum up to `T = 36.5` becomes `0.248927 > (1/4π) log²(36.5/2π) = 0.246341`. The third record fails
  for this set at `T = 36.5` and excludes it. For the zeros of `ζ` the record holds with margin at
  least `0.00104` (at the eighth ordinate `43.327`), and the first two records alone give the upper
  side from `T = 188` on.
- The range of (a) (negative control): at `R = 0.7`, `R log 14 = 1.847 < 2`, and
  `ClassicalZeroFreeRegion 0.7 (2π)` contains `1/2 + 14.1347…i` (its boundary there is
  `1 − 1/(0.7 log 14.1347) = 0.4606`), so it is false under 5.3 and (a) keeps it as a hypothesis.
- The hypotheses cannot be dropped at every parameter. In (d) take `D ≡ −M` with `M > 0`, which is
  continuous and nondecreasing: the hypothesis `N°(σ, t) ≤ D(t)` is false, while the single-term
  form gives `s₂ = 2 D(T)/T < 0` and `s₁ + s₂ + ε₁ < 0` for large `M`, a false bound. The range
  `D ≥ 0` excludes it.
- The finite ranges are needed (negative control): the bounds fail just below their thresholds,
  as `x → 23⁻`, where `23 − ψ(x) → 3.7343` against `23 ε₀(23) = 3.7016`, and as `x → 149⁻` for
  Mossinghoff–Trudgian's, where `149 − θ(x) → 22.3564` against `149 ε_MT(149) = 22.3395`; and
  `ButheVerified` reaches Trudgian's `ψ` bound only from `x = 35.072` and his `π` bound only from
  `359.29`. At `e²⁰` the bound `√x log² x/(8π)` of 6.17 gives `7.2256·10⁻⁴ x`, above
  `5.3688·10⁻⁴ x`, so Faber–Kadiri's bound needs `ButheVerified` up to `e²¹`.
- Numerical test of the four bounds that start below `10⁷`, against `ψ`, `θ`, `π` and `li` on both
  sides of every jump up to `10⁷`, each quotient of the left side by the right taken at its own
  argument (between two jumps the quotient first decreases and then increases, so its supremum
  there is its value at one end or its limit at the other): the suprema are `0.839888` (Trudgian,
  `ψ`, as `x → 29⁻`), `0.879691` (Trudgian, `θ`, as `x → 223⁻`), `0.883754`
  (Mossinghoff–Trudgian, as `x → 223⁻`) and `0.869237` (Trudgian, `π`, as `x → 233⁻`), each a
  limit from the left and not attained.
- At `R = 9.645908801` the Rosser–Schoenfeld-shape region is inside `Re s > 1/2`
  (`R log(21/17) = 2.0383 > 2`); at `R = 6.455` the same shape, which starts at `|t| = 21`, would
  contain the zero `1/2 + 21.022…i` of `ζ`, which is why (b) has the range `R > 9.4648…`; Trudgian's
  region with that constant starts at `|t| = 24` and lies right of `1/2`.

### 6.20 Ramanujan's inequality and Axler's bound (ExplicitPrimeCounting §3.5)

- Given `ButheVerified`, `Schoenfeld1976Range`,
  `DudekPlattRange` and Rosser's zero count, which Schoenfeld's bounds of 6.16, used in its route,
  take.
- Without `RiemannHypothesisUpTo 3000175332800`, given its `θ`-input,
  `ButheVerified`, `Buthe2016Range`, Rosser's zero count (these three for Johnston's range of §2.3,
  6.17) and `AxlerPrimeCountingUpperRange`.
- Axler's other three bounds of §3.5, without the same height, each given the same `θ`-bound
  (`|θ(t) − t| < 0.024334 t/log³ t` for `t ≥ 1 757 126 630 797`), the remaining hypotheses of §3.7
  (Rosser's zero count among them, which Johnston's range uses as well), `ButheVerified`,
  `Buthe2016Range` and *Axler2024Range*:
  `π(x) > x/(log x − 1 − 1/log x − 2.975666/log² x − 13.024334/log³ x − 70.951332/log⁴ x
  − 460.634397856444/log⁵ x − 3444.031844143556/log⁶ x)` for `x ≥ 1 751 189 194 177`;
  `π(x) > x/(log x − 1 − 1/log x − 3/log² x)` for `x ≥ 65 405 887`; and
  `π(x) < x/(log x − 1 − 1/log x − 3/log² x − 70.935/log³ x)`
  for `x ≥ 29.53`.
- With `P₄(x) = x ∑_{k=0}^{4} k!/log^{k+1} x`, each given Büthe's hypotheses (6.19):
  `π(x) − P₄(x) > −1194 x/log⁶ x` for every
  `x > e³⁹¹⁴`; `π(x) − P₄(x) < 1426 x/log⁶ x` for
  every `x > e³⁹¹⁴`; and `π(x)² < (ex/log x) π(x/e)` for every
  `x > e³⁹¹⁵`.

Route: 5.2; 6.11; 6.17. In ExplicitPrimeCounting §3.5, "the tables of §3.7"
are all the hypotheses of §3.7, and "Johnston's range" is `johnston_of_riemannHypothesisUpTo` at
`T = 3 000 175 332 800`, whose hypotheses besides the heights are `ButheVerified` and
`Buthe2016Range`, its route taking Rosser's zero count as well (6.17); 6.11 and 6.14 remove the
rest. The five-term bounds come from 6.17's `|π(x) − li x| ≤ √x log x/(8π)` (`x > 2657`) and the
expansion of `li`: five integrations by parts give
`li x − P₄(x) = 120 ∫₂ˣ dt/log⁶ t + li 2 − P₄(2)`, with `li 2 − P₄(2) = −369.9942…`; and
`∫₂ˣ dt/log⁶ t ≤ x/log⁶ x + 6 ∫₂ˣ dt/log⁷ t`, where, split at `√x`,
`∫₂ˣ dt/log⁷ t ≤ √x/log⁷ 2 + 2⁷ x/log⁷ x`. So, with `L = log x`,
`−369.995 − √x L/(8π) ≤ π(x) − P₄(x) ≤ 120 (1 + 768/L) x/L⁶ + 720 √x/log⁷ 2 + √x L/(8π)`; for
`L ≥ 3914` the coefficient `120 (1 + 768/L)` is at most `143.55`, and each term in `√x` is below
`e^{−1898} x/L⁶`, so `π(x) − P₄(x)` lies in `(−1194 x/L⁶, 1426 x/L⁶)`. Ramanujan's inequality is
then ExplicitPrimeCounting §3.5's criterion at `x_a = e³⁹¹⁴` with `M = 1426` and `m = −1194`,
whose condition `ε_M(x) − ε′_m(x) < log x` holds for `x > e³⁹¹⁵` (the difference is `3914.50` at
`e³⁹¹⁵` and decreases).

*Needs:* 5.2, 6.11, 6.16, 6.17; ExplicitPrimeCounting §§0.3a, 3.5.

### 6.21 Mertens sums (ExplicitPrimeCounting §4.7)

`|Σ_{p ≤ x} (log p)/p − log x − E| ≤ 3 log² x/(8π√x)` for
`x ≥ 43.1`; `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for
`x ≥ 24.4`; each given `ButheVerified`, *LeeNosalMertensRange*, `ZetaZeroReciprocalSum`,
*PsiThetaUpper* or the remaining hypotheses of §3.7, `ZetaZeroCountLowRange`, `HiaryRecord`,
`PatelRecord` and `YangRecord`.

Route: 5.2.

*Needs:* 5.2; ExplicitPrimeCounting §4.7.

### 6.22 Primes in progressions (ExplicitPrimeCounting §§6.1, 6.3, 6.6)

- §6.1. *RamareRumelyRegion* `q H C` for every `q ≥ 1`, `H ≥ 1000` and
  `0 < C ≤ 32π`. The general theorem in the shape of Ramaré–Rumely
  and Dusart for every `q > 1`, `H > 1000` and `9.14 ≤ C₁(q) ≤ 32π`, without `GRH*(q, H)` and
  *RamareRumelyRegion* `q H C₁(q)`, given the Dirichlet zero counts (Layer 6 introduction).
  no modulus `q ≥ 2` is exceptional in McCurley's sense, so
  the theorem in McCurley's shape, holds for every `q > 10^b` without
  the hypothesis that `q` is not exceptional and without its region and the records with it, given
  the Dirichlet zero counts and *McCurleyTable*. The route of both shapes
  (`gap:dirichlet-zero-count-error` for the counts) sums a zero count over all the characters
  modulo `q`, the principal one included, whose zeros in `0 < Re s < 1` are those of `ζ`: the
  Dirichlet zero counts, ExplicitZetaBounds §5.3 given *BennettMartinOBryantRechnitzerRecord* for
  the others and Rosser's zero count for it. 5.1 places the zeros and does not count them.
- §6.1, the tabulated rows. The rows `(k, ε, x₀)` of Ramaré–Rumely's Table 1 (among them
  `(1, 0.000213, 10¹⁰)` and `(8, 0.002811, 10¹⁰)`) and of Dusart's table are not instances of the
  general shape: at `x₀ = 10¹⁰`, `X = √(log x₀/9.645908801) = 1.5450`, below the threshold
  `X₄ ≥ 10` of the shape; the row `k = 1` lies outside its `q > 1`; and at the row
  `(8, 0.002811, 10¹⁰)` the error function of the shape, even at its most favourable constant
  `C₁ = 32π`, is `ε(X) = 0.11219`, against the row's `0.002811/φ(8) = 0.00070275`. So the table
  propositions *RamareRumelyTable1* and *Dusart2002Table* of ExplicitPrimeCounting §6.1, which
  compare the rows with that error function, do not give them. Write *RamareRumelyRows* for the
  proposition that for each row `(k, ε, x₀)` of those two tables and every unit `a` modulo `k`, if
  `GRH*(k, H)` holds for every `H`, then `|ψ(y; k, a) − y/φ(k)| ≤ ε x/φ(k)` and
  `|θ(y; k, a) − y/φ(k)| ≤ ε x/φ(k)` for every `x ≥ x₀` and every `y` with `1 ≤ y ≤ x` (a supremum
  over `y`, which need not be attained: Checks): the rows as their sources
  obtain them, by a finite-height smoothed estimate evaluated at each row from the zeros up to the
  verified height and the region for the modulus, both of which the premise contains (the region
  as in the route below). Given *RamareRumelyRows*, every
  row holds, for every unit `a` modulo `k` and every `x ≥ x₀`.
- §6.3. The three bounds of Bennett, Martin, O'Bryant and Rechnitzer hold for every `q ≥ 3` and
  every unit `a` modulo `q`, with `c₀(q)`, `x₀(q)` as there: for `ψ`,
  for `θ` and for `π` against
  `Li x/φ(q)`, each without `GRH*(q, 10⁸/q)`, *PlattRecord*, *PlattCentralRecord*, the regions for
  the high zeros with their records and the exceptional clause, and each given the Dirichlet zero
  counts (`gap:dirichlet-zero-count-error` for the nonprincipal characters, Rosser's zero count for
  the principal one, of conductor `1`) and *BMORTables*.
- §6.6. No modulus is exceptional in Kadiri's sense;
  the zero input *LiuWangFourZeros* holds. Kadiri's existence theorem for every `q ≥ 3`, given the
  Dirichlet zero counts (its route counts
  the zeros of every `L(s, χ)` modulo `q`, the principal character included); and
  its quantitative instances for every
  `q ≥ max(q₀, 8·10⁹)`, given the same and *Kadiri2008Table*; both without
  `RiemannHypothesisUpTo 3000175332800`, *PlattRecord*, the regions of ExplicitZetaBounds §7.5 with
  their records, *LiuWangFourZeros* and the exclusion of exceptional moduli.

Route: 6.11 for `GRH*`, 6.12 for *PlattRecord*, 6.14 for the regions. *RamareRumelyRegion* `q H C`
holds by 5.1: every zero with `0 < β < 1` has `β = 1/2`, and `1/2 ≥ 1/(R log(q|γ|/C))` because
`q|γ|/C ≥ 1000/(32π) > e^{2/R}`. An exceptional modulus needs a real zero `β` of a real character
modulo `q` with `β > 1 − 1/(9.645908801 log q)`, which is at least `0.8504` for `q ≥ 2`, in
McCurley's sense, and a zero of some `L(s, χ)` modulo `q ≥ 3` with real part at least
`1 − 1/(6.50 log 3) = 0.85996…`, so above `0.85`, in Kadiri's; 5.1 excludes both, the principal
characters through `ζ` (at `q = 1` McCurley's boundary `1 − 1/(R log 1)` is undefined, and the
statement is for `q ≥ 2`). The zeros that *LiuWangFourZeros* counts have real part at least
`1 − 1/(3.82 log x) > 0.98` for `x ≥ 8·10⁹`, so 5.1 leaves none. The exceptional clause of §6.3
enters only for `q > 10⁵`, as the bound `β ≤ 1 − 40/(√q log² q)` for a real zero `β ∈ (0, 1)` of a
quadratic character modulo `q`: by 5.1 such a zero is `1/2`, and `40/(√q log² q) < 1/2` for
`q > 10⁵` (at `q = 10⁵` it is `9.5·10⁻⁴`, and it decreases). *PlattCentralRecord* serves §6.3 only
to exclude that zero for `10⁵ < q ≤ 400 000`, which the same inequality does. The tabulated rows:
6.11 gives `GRH*(k, H)` for every `H`, the premise of *RamareRumelyRows*.

*Needs:* 5.1, 5.3, 6.11, 6.12, 6.14; ExplicitPrimeCounting §§1.2, 6.1, 6.3, 6.6; ExplicitZetaBounds
§0.2 (the passage to imprimitive characters), §5.3 (the count for conductors `k > 1`, given
*BennettMartinOBryantRechnitzerRecord*), §§0.4, 5.2 (Rosser's zero count, for the conductor `1`).

**Checks.**

- The principal characters need the count for `ζ`: §5.3 is stated for conductors `k > 1`, and at
  `k = 1`, `T = 15` its formula would give `ℓ = log(17/2π) = 0.995 ≤ 1.567` and so no zero with
  `|γ| ≤ 15`, while `ζ` has two.
- The rows are not instances of the general shape (negative control): with
  `X = √(log 10¹⁰/9.645908801) = 1.54503` and the largest admissible `C₁ = 32π`, its error at `q = 8`
  is `3 √(8/(4 · 32π)) X^{1/2} e^{−X} = 0.11219`, `160` times the row's `0.00070275`.
- The rows bound a supremum, not a maximum (negative control for the reading with `max`): at
  `k = 1` and `x = p` prime with `θ(y) < y` on `[1, p]` (`ButheVerified` gives this for
  `p ≤ 10¹⁹`), `y − θ(y)` increases on each interval between consecutive primes and drops by
  `log q` at each prime `q`, so `sup_{1 ≤ y ≤ p} |θ(y) − y|` is a left limit at a prime and no `y`
  attains it; at `p = 10 007` it is `162.4755`, the left limit at `8597`, where the value is
  `153.4163`. The inequality for every `y ≤ x` is the same as the bound for the supremum.

### 6.23 The least prime in a progression (ExplicitPrimeCounting §6.5)

For every `q > 3` and every unit `a` modulo `q`, given
`LamzouriLiSoundararajanRange` and the Dirichlet zero counts (Layer 6 introduction:
*BennettMartinOBryantRechnitzerRecord* and Rosser's zero count), there is a prime `p ≡ a (mod q)`
with `p ≤ (φ(q) log q)²`. For every `q ≥ 2` and every
unit `m` modulo `q`, a prime `p ≡ m (mod q)` with `p < 2 (q log q)²`, given the same, through which
§6.5's route for `q > 3` passes. Bach–Sorenson's
bound at the cyclotomic fields, for every `q ≥ 1` and every unit `m` modulo `q` a prime
`p ≡ m (mod q)` with `p ≤ (4 log |disc ℚ(ζ_q)| + 2.5 φ(q) + 5)²`, given the same.

Route: §6.5's hypothesis, `χ.GeneralizedRiemannHypothesis` for every `χ : DirichletCharacter ℂ q`,
is 5.1. The route of the headline for `q > 20 000` sums a zero count over all the characters
modulo `q` (the `gap:dirichlet-zero-count-error` of §6.5; for `3 < q ≤ 20 000` the headline is
`LamzouriLiSoundararajanRange`). The principal
character modulo `q` occurs in each sum and has the zeros of `ζ` in `0 < Re s < 1`; its conductor
is `1`, which ExplicitZetaBounds §5.3 excludes, so its term is bounded by Rosser's zero count, with
`N(T) = 0` below `14` and Rosser's bound from `T = 2` (ExplicitZetaBounds §5.2), and the term of
each nonprincipal character by §5.3 at the conductor `k > 1` of its primitive character, given
*BennettMartinOBryantRechnitzerRecord*. 5.1 places the zeros on the line and does not count them,
so the records stay, as in 6.22. The cyclotomic bound is a consequence of the headline, with no
Chebotarev statement for `ℚ(ζ_q)`: for `q > 3`, §6.5's bound
`log |disc ℚ(ζ_q)| ≥ (φ(q)/2) log(q/2)` gives
`4 log |disc ℚ(ζ_q)| + 2.5 φ(q) + 5 ≥ φ(q)(2 log q − 2 log 2 + 2.5) + 5 > φ(q) log q`, so the
headline's `(φ(q) log q)²` is below the bound; for `q ≤ 3` directly: at `q = 1` and `q = 2`,
`ℚ(ζ_q) = ℚ`, the bound is `7.5² = 56.25` and `2`, respectively `3`, serves; at `q = 3` it is
`(4 log 3 + 10)² = 207.2`, and `7` and `2` serve.

*Needs:* 5.1; ExplicitPrimeCounting §6.5 (the headline, Bach–Sorenson's form, and the size of the
cyclotomic discriminant); ExplicitZetaBounds §0.2 (the passage to imprimitive
characters), §5.3 (the count for conductors `k > 1`, given *BennettMartinOBryantRechnitzerRecord*),
§§0.4, 5.2 (Rosser's zero count, for the principal characters).

**Checks.**

- The principal character cannot be counted by §5.3 (negative control): at conductor `1` and
  `T = 15` its formula gives `ℓ = log(17/2π) = 0.99534 ≤ 1.567`, that is no zero with
  `|γ| ≤ 15`, while `ζ` has the two zeros `1/2 ± 14.134725…i`. Rosser's bound is consistent with
  them: `N(15) = 1`, `M(15) = (15/2π) log(15/2πe) + 7/8 = 0.5651`, and `|1 − M(15)| = 0.4349` is
  below its right side `2.4003`.
- Bach–Sorenson's Chebotarev bound read at `E = ℚ(ζ_q)` does not by itself give a prime in the
  class (negative control): for `q = 6`, `ℚ(ζ_6) = ℚ(ζ_3)`, the prime `2` is unramified and its
  Frobenius is the class `5` of `(ℤ/6)^×` (`2 ≡ 5 (mod 3)`), while `2 ≢ 5 (mod 6)`; the same
  happens at every `q = 2r` with `r > 1` odd (the odd class `m ≡ 2 (mod r)`: `7` at `q = 10`, `9`
  at `q = 14`). Their theorem also asks `E ≠ ℚ`, which excludes `q = 1, 2`. The route above uses
  neither.
- Numerical test: for every `q ≤ 1000` and every unit class modulo `q`, the least prime of the
  class is at most `0.0534` times the cyclotomic bound (the largest quotient is `3/56.25`, at
  `q = 2`), and for `3 < q ≤ 1000` at most `0.651` times `(φ(q) log q)²` (at `q = 4`).

### 6.24 Short intervals containing a prime (ExplicitPrimeCounting §§7.1–7.3, 7.5)

Every statement below except the zero inputs of §7.5 is given *Dudek's hypotheses*,
`PrimeGapLogSquareVerified` and Rosser's zero count, under which 6.18 states Dudek's theorem (for
every `y ≥ 2`, `(y − (4/π) √y log y, y]` contains a prime), and the further hypotheses listed with
it.

- §7.1. `(x, x + x/16597)` contains a prime for every `x > 2 010 759.9`,
  given Dudek's hypotheses and `Schoenfeld1976Range`.
- §7.2. For each of Ramaré–Saouter's three rows, the
  interval `(x(1 − Δ⁻¹), x]` contains a prime for every `x > 10 726 905 041` at `Δ = 28 314 000`,
  every `x ≥ e⁵³` at `Δ = 204 879 661` and every `x ≥ e⁶⁰` at `Δ = 14 500 755 538`; given Dudek's
  hypotheses, and for the first row also *RamareSaouterGapRange*: `p⁺ − p < 360` for consecutive
  primes `p < p⁺` with `10 726 905 041 ≤ p < 1.6·10¹⁰`.
- §7.3, Kadiri–Lumley's rows. For every row `(x₀, Δ)`
  of Kadiri–Lumley's table (`x₀` from `4·10¹⁸` to `e¹⁵⁰`; among them `(4·10¹⁸, 36 082 898)`,
  `(e⁵⁹, 1 946 282 821)` and `(e⁶⁰, 1 966 196 911)`) and every `x ≥ x₀`, `(x(1 − Δ⁻¹), x)` contains
  a prime; given Dudek's hypotheses.
- §7.3, Cully-Hugill–Lee's rows. For every row `(x₀, Δ)` of
  Cully-Hugill–Lee's table (`log x₀` from `log(4·10¹⁸)` to `600`; among them
  `(4·10¹⁸, 3.90970·10⁷)`, `(e⁶⁰, 7.69184·10¹⁰)` and `(e⁶⁰⁰, 2.51949·10¹¹)`) and every `x ≥ x₀`,
  `(x(1 − Δ⁻¹), x]` contains a prime; given Dudek's hypotheses and the Brun–Titchmarsh ranges, the
  hypotheses of Carneiro–Milinovich–Soundararajan's theorem (6.18).
- §7.5, the zero inputs. *CullyHugillDensity* holds; and
  *RamareRevisedDensity* holds.
- §7.5, primes between powers. For every real `x ≥ 1`,
  `(x, x + 3x^{2/3}]` contains a prime; for all reals `c ≥ 3`,
  `θ ≥ 2/3` and `x ≥ 1`, `(x, x + c x^θ]` contains a prime, among them Cully-Hugill–Johnston's
  interval `(x, x + 140 x^{139/140}]`; and for every integer
  `k ≥ 3` and every integer `n ≥ 1` there is a prime `p` with `n^k < p < (n + 1)^k`, among them the
  primes between consecutive cubes (Dudek's and Cully-Hugill's theorems, which ExplicitPrimeCounting
  states for `n ≥ exp(exp(33.219))` and `n ≥ exp(exp(32.892))`), between consecutive `155`-th powers
  (Cully-Hugill's) and between consecutive `140`-th powers (Cully-Hugill–Johnston's). Each is given
  Dudek's hypotheses.

Route: each interval statement is an inclusion into the interval of Dudek's theorem (6.18), or of
Carneiro–Milinovich–Soundararajan's for Cully-Hugill–Lee's rows, for large `x`, and a bound for the
gaps between consecutive primes for small `x`. Write `p` for the largest prime `≤ x` and `p⁺` for
the next; a prime lies in `(x, x + h)` as soon as `p⁺ − p < h`, since `p⁺ − x ≤ p⁺ − p`, and in
`(x(1 − Δ⁻¹), x]` as soon as `Δ (p⁺ − p) ≤ p⁺`, since `x < p⁺`. The comparisons with the
intervals of 6.18 are monotone (`log x/√x` and `log² x/x` decrease for `x > e²`), so each is checked
at the left end of its range.

- Schoenfeld's interval: `Schoenfeld1976Range` for `2 010 759.9 < x ≤ 10⁸`; for
  `10⁸ ≤ x ≤ 4·10¹⁸`, `PrimeGapLogSquareVerified` gives `p⁺ − p < log² p ≤ log² x < x/16597`
  (`339.3 < 6025` at `10⁸`); for `x ≥ 4·10¹⁸`, Dudek's theorem at `y = x(1 + 1/16598)` puts a prime
  in `(x, y] ⊂ (x, x + x/16597)`, since `(4/π) √y log y ≤ x/16598` (`1.091·10¹¹ ≤ 2.410·10¹⁴` at
  `4·10¹⁸`).
- Ramaré–Saouter's rows: Dudek's theorem at `x` itself gives a prime in
  `(x − (4/π) √x log x, x] ⊂ (x(1 − Δ⁻¹), x]` as soon as `(4/π) Δ log x/√x ≤ 1`: for the second and
  third rows at every `x ≥ x₀` (the left side is `0.0428` and `0.1037` at `x₀`), and for the first
  from `x = 4·10¹⁸` (`0.7721`). For the first row on `10 726 905 041 < x < 4·10¹⁸`: `p` is at least
  `10 726 905 041`, a prime; for `p < 1.6·10¹⁰`, *RamareSaouterGapRange* gives `p⁺ − p < 360` and
  `360 Δ = 1.0193·10¹⁰ < p⁺`; for `1.6·10¹⁰ ≤ p < 4·10¹⁸`, `PrimeGapLogSquareVerified` gives
  `p⁺ − p < log² p ≤ p/Δ`, since `p/log² p` increases and is `2.898·10⁷ > Δ` at `1.6·10¹⁰`.
- Kadiri–Lumley's rows: 6.18 at `x − 1/2 ≥ 2` gives a prime in `(x − 1/2 − (4/π) √x log x, x − 1/2]`,
  which lies inside `(x(1 − Δ⁻¹), x)` when `1/(2x) + (4/π) log x/√x ≤ 1/Δ`; the left side decreases
  for `x > e²`, and at each row's `x₀` it is below `1/Δ` (Checks).
- Cully-Hugill–Lee's rows: Carneiro–Milinovich–Soundararajan's theorem at `y = x(1 − Δ⁻¹) + 1`
  puts a prime in `[y, y + (22/25) √y log y]`, which lies in `(x(1 − Δ⁻¹), x]` when
  `1 + (22/25) √x log x ≤ x/Δ`, that is `Δ ((22/25) log x/√x + 1/x) ≤ 1`; the left side decreases,
  and at the rows' `x₀` it is at most `0.73684`, at `x₀ = 4·10¹⁸`.
- `(x, x + 3x^{2/3}]`: for `1 ≤ x < 11`, the primes `2, 3, 5, 7, 11, 13` (the next prime after `x`
  is within `0.365 · 3x^{2/3}` of `x`, the largest quotient being at `x = 7`); for
  `11 ≤ x < 4·10¹⁸`, `PrimeGapLogSquareVerified` gives `p⁺ − p < log² p ≤ log² x < 3x^{2/3}`, since
  `3 e^{2L/3}/L² ≥ 3e²/9 = 2.46` for every `L > 0`; for `x ≥ 4·10¹⁸`, Dudek's theorem at
  `y = x + 3x^{2/3} ≤ 2x` puts a prime in `(x, y]`, since `(4/π) √y log y ≤ 3x^{2/3}`: the quotient
  of the left side by the right is at most `(4/(3π)) √2 (log 2 + L) e^{−L/6}`, decreasing for
  `L > 6`, and `0.021` at `L = log(4·10¹⁸)` (the inclusion holds from `x = 3257`). The general
  form: `c x^θ ≥ 3x^{2/3}` for `x ≥ 1`, `c ≥ 3`, `θ ≥ 2/3`. The powers: at `x = n^k`,
  `(n + 1)^k ≥ n^k + k n^{k−1} + 1` for `k ≥ 2`, and `k n^{k−1} ≥ 3 n^{2k/3}` for `k ≥ 3`, `n ≥ 1`
  (`log(k/3) + (k/3 − 1) log n ≥ 0`), so `(n^k, n^k + 3 n^{2k/3}] ⊂ (n^k, (n + 1)^k)`.
- The zero inputs of §7.5 bound `N°(σ, T)` at `σ ≥ 0.6` and at `σ ≥ 0.52`, which 6.14(d) makes `0`,
  by right sides that are positive (`17.418`, `5.272`; `965`, `51.5`; `T ≥ 2000`).

*Needs:* 6.14, 6.18; ExplicitPrimeCounting §§1.3 (`Schoenfeld1976Range`), 1.4
(`PrimeGapLogSquareVerified`), 7.1, 7.2, 7.3, 7.5.

**Checks.**

- The rows of Kadiri–Lumley from 6.18: `1/(2x₀) + (4/π) log x₀/√x₀` against `1/Δ` is
  `2.726822·10⁻⁸ < 2.771396·10⁻⁸` at `x₀ = 4·10¹⁸` (margin `1.6 %`), `2.517951·10⁻⁸ < 2.580382·10⁻⁸`
  at `e⁴³`, and the margin grows along the table, to `98.6 %` at `e⁶⁰`.
- Carneiro–Milinovich–Soundararajan's interval is needed at the first rows of Cully-Hugill–Lee
  (negative control for Dudek's): there `Δ ((4/π) log x₀/√x₀ + 1/(2x₀))` is `1.0661` at
  `x₀ = 4·10¹⁸` and `1.0529` at `e⁴³`, above `1`; it is below `1` from the row `e⁴⁶` on (`0.9853`).
- The first row of Ramaré–Saouter needs a record of the gaps near `x₀` (negative control): at
  `x₀ = 10 726 905 041`, `(4/π) Δ log x₀/√x₀ = 8039`, and `log² x₀ = 533.4` exceeds
  `x₀/Δ = 378.9`, so neither Dudek's theorem nor `PrimeGapLogSquareVerified` reaches it; and the
  gap of `382` from the prime `10 726 904 659` to `x₀` exceeds `x₀/Δ`, which is why the row starts
  at `x₀`. *RamareSaouterGapRange* holds: a sieve of `[10 726 905 041, 16 000 002 001]`
  (`226 229 823` primes; the right end is a prime, and the first prime above `1.6·10¹⁰` is
  `16 000 000 039`) finds no gap of `360` or more.
- The finite range of `(x, x + 3x^{2/3}]` is needed (negative control for Dudek's theorem alone):
  at `x = 1000`, `y = 1300` and `(4/π) √y log y = 329 > 300 = 3x^{2/3}`. Numerical test: every gap
  after a prime `p ≤ 10⁷` is at most `0.365 · 3p^{2/3}`, and a sieve finds a prime between `n³` and
  `(n + 1)³` for every `n ≤ 214`.

### 6.25 Norm-composed characters (QuasiRiemannHypothesis §5.4)

For every number field `K` abelian over `ℚ` and every
Dirichlet character `χ`, `heckeLFunctionC (χ ∘ N_{K/ℚ})` is zero-free right of `1/2`, where
`χ ∘ N_{K/ℚ}` is the norm-composed character of QuasiRiemannHypothesis §5.4.

Route: a corollary of 5.6. The primitive characters of the `χ ∘ N_{K/ℚ}` are the characters `φ̃`
of 5.6 (5.6, its bullet), so this is 5.6 for them, read through
RiemannHypothesisStatementsAndConsequences §9.5's presented-versus-primitive clause.

*Needs:* 5.6; QuasiRiemannHypothesis §5.4; RiemannHypothesisStatementsAndConsequences §9.5.

### 6.26 Least character values (QuasiRiemannHypothesis §§11.2, 11.3; SieveMethodsAndPrimePatterns §2.9)

There is an absolute `C` such that every nonprincipal Dirichlet
character `χ` modulo `q ≥ 2` has *leastNonOne* `χ ≤ C (log q)²`; hence
`SieveApplications.leastNonresidue p ≤ C (log p)²` for every odd
prime `p`. The Hecke analogue of §11.2 at `θ = 1/2`, for
every field `K` abelian over `ℚ`, every modulus `𝔪` of `K` and every nontrivial
`η : RayClassCharacter 𝔪` whose primitive character is a `φ̃` of 5.6: some nonzero prime ideal `𝔭`
with `η(𝔭) ∉ {0, 1}` has `N𝔭 ≤ C_K (log N𝔪₀ + 2)²`, `𝔪₀` the finite part of `𝔪`.
The bound for `leastNonresidue` implies `SieveApplications.linnik_exceptional` of
SieveMethodsAndPrimePatterns §2.9: for each `ε > 0` only finitely many odd primes `p` have
`leastNonresidue p > p^ε`.

Route: §11.2 at `θ = 1/2` with 5.1, and with 5.6 for the Hecke analogue; the least nonresidue as in
§11.3 with the exponent `1/(1 − θ) = 2`.

*Needs:* 5.1, 5.6; QuasiRiemannHypothesis §§11.2, 11.3; SieveMethodsAndPrimePatterns §2.9.

### 6.27 Primitive roots (ExplicitNumberFields 6.4)

For every prime `p ≥ 10⁹`,
`ĝ(p) ≤ ((8/5)(2^{ω(p−1)} − 1) log p)²`; the sieved bound of
§6.4 for every prime `p`; and Grosswald's conjecture, each given *GrosswaldFiniteRange*,
*GrosswaldPrimeFiniteRange*, *GrosswaldSieveVerification* and *PrimorialTableVerified* `26`:
`ĝ(p) < √p − 2` for every prime `p > 2791`, and
`g(p) < √p − 2` for every prime `p > 409`.

Route: the hypothesis of §6.4, `GRHMod p` (§0.5), is given by 5.1, which gives
`DirichletGRH χ` for every `χ : DirichletCharacter ℂ p`.

*Needs:* 5.1; ExplicitNumberFields §0.5, 6.4.

### 6.28 Quadratic zero gaps and small fields (ExplicitNumberFields §0.5)

With no hypothesis: `L(1/2, χ_F) > 0` at the nine quadratic fields
`F` with `d_F ≤ 13`, of discriminants `−3, −4, 5, −7, 8, −8, −11, 12, 13`, `χ_F` the primitive real
character of conductor `d_F`. *UniformQuadraticZeroGap* `c` for every
`0 < c ≤ (log 3)/2`; the condition of *QuadraticRealZeroGap* `c`
and of *ImaginaryQuadraticRealZeroGap* `c` at every quadratic field `F` with `c √d_F ≥ 2`, and, for
every `c > 0`, at the nine fields with `d_F ≤ 13`; and *QuadraticRealZeroGap*
`c`, hence *ImaginaryQuadraticRealZeroGap* `c`, for every `c ≥ 2/√15`, among them `c = π/6`. Hence,
without the gap hypothesis: §4.7's bound
`κ_K > (1/c₄) min(1/(starkAlpha K · log d_K), 1/(c₈ d_K^{1/n}))` for `n ≥ 3` at every
`c₈ ≥ 2/√15`; its consequence at `c₈ = π/6`,
`κ_K > 0.0014480/(n · t_K · d_K^{1/n})` for `n ≥ 3`;
§4.7's instance under the uniform gap,
`κ_K > (1/c₄) min(1/(starkAlpha K · log d_K), e c₀/(2 d_K^{1/n}))` for `n ≥ 3` at every
`0 < c₀ ≤ (log 3)/2`; and §4.9's two real-zero bounds at every `0 < c₀ ≤ 1/4`,
`(1 − β) log d_K ≥ c₀` for `K/ℚ` Galois of degree
`n ≥ 2` and `(1 − β) log d_K ≥ c₀/m_N` for `K` of degree `n ≥ 2` with
normal closure of degree `m_N`. The clause of
*DGLSWSmallFieldGRH* for the fields abelian over `ℚ`: no such `K` with `n = 2` and
`d_K ≤ 400 000`, with `n = 3` and `d_K ≤ 239`, or with `n = 4` and `d_K ≤ 320` has a zero `β + iγ`
of `ζ_K` with `β > 1/2` and `|γ| ≤ 1`; this is its whole quadratic part.

Route: for a quadratic field `F`, `ζ_F = ζ · L(·, χ_F)` and `ζ` has no zero in `(0, 1)`
(ExplicitZetaBounds §0.3, its case `q = 1`), so by 5.3 a real zero `β ∈ (0, 1)`
of `ζ_F` is `1/2`, and it is one exactly when `L(1/2, χ_F) = 0`; then
`(1 − β) log d_F = (log d_F)/2 ≥ (log 3)/2`, and `β ≤ 1 − 1/(c √d_F)` exactly when `c √d_F ≥ 2`,
which holds for every `d_F ≥ 15` when `c ≥ 2/√15`. At the nine fields with `d_F ≤ 13`
the positivity of `L(1/2, χ_F)` leaves no real zero in `(0, 1)`, so the condition holds there at every
`c > 0`; the next field, `d_F = 15`, is why the range of the gap *QuadraticRealZeroGap* `c` stops at `2/√15`
(`π/6 = 0.5236 ≥ 2/√15 = 0.5164`). The bound at `c₈ = π/6` is §4.7's derivation of
that consequence from the clause at `c₈ = π/6`. *DGLSWSmallFieldGRH* asks for no zero with
`β > 1/2`, which 5.5 gives for every abelian field, and every quadratic field is abelian.

Route of the positivity of `L(1/2, χ_F)` at the nine fields: a finite verification. For a
nonprincipal character `χ` the
partial sums `∑_{n ≤ x} χ(n) n^{−s}` converge locally uniformly on `Re s > 0` (Abel summation,
`sum_mul_eq_sub_sub_integral_mul`, the sums of `χ` over intervals being bounded), so the limit is
analytic there, equal to `L(s, χ)` on `Re s > 1` (`DirichletCharacter.LFunction_eq_LSeries`) and
hence on `Re s > 0` (`DirichletCharacter.differentiable_LFunction`,
`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`); so `L(1/2, χ_F) = ∑ χ_F(n) n^{−1/2}`. With
`q = d_F`, sum to `M = 1000 q`, enclosing each `n^{−1/2}` between consecutive multiples of `10⁻¹²`
(`⌊10¹²/√n⌋ = ⌊√⌊10²⁴/n⌋⌋`, an integer square root); since `q` divides `M` and `χ_F` sums to `0` over
a period, Abel summation bounds the tail beyond `M` by `B_q (M + 1)^{−1/2}`, `B_q` the largest
`|∑_{n ≤ j} χ_F(n)|` for `j ≤ q` (`1, 1, 1, 2, 1, 2, 3, 1, 2`). The lower bounds obtained, in the
order of the discriminants above, are `0.4565`, `0.6439`, `0.2176`, `1.1107`, `0.3625`, `1.0668`,
`0.9534`, `0.4894` and `0.4220`, all positive.

*Needs:* 5.3, 5.5; ExplicitNumberFields §§0.5, 4.7, 4.9; ExplicitZetaBounds §0.3
(the negativity of `ζ` on `(0, 1)`); Mathlib `DirichletCharacter.LFunction_eq_LSeries`,
`DirichletCharacter.differentiable_LFunction`, `sum_mul_eq_sub_sub_integral_mul`,
`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`.

**Checks.**

- The nine fields are needed for *QuadraticRealZeroGap* `(π/6)` (negative control): at `d_F ≤ 13`,
  `(π/6) √d_F ≤ (π/6) √13 = 1.888 < 2`, so a central zero would violate the condition there, and 5.3
  does not exclude one; three of them (`−3`, `−4`, `5`) are already zero-free on `(0, 1)` by
  ExplicitNumberFields' Checks of §0.5, the other six only by the computation.
- The lower end `2/√15` of the range of *QuadraticRealZeroGap* `c` is where these inputs stop: at
  `c < 2/√15` the
  condition at `ℚ(√−15)` asks `L(1/2, χ₋₁₅) ≠ 0`, which neither 5.3 nor the computation above
  provides.

### 6.29 Residues and Mertens sums (ExplicitNumberFields 3.5, 3.6)

Write `M` for the Meissel–Mertens constant `TauCeti.LFunctions.mertensConstant ℚ` (the constant `B`
of ExplicitPrimeCounting §4.7); *SchoenfeldMertensSmallRange* for the proposition that
`|Σ_{p ≤ x} 1/p − log log x − M| < (3 log x + 4)/(8π√x)` for every real `x` with `13.5 ≤ x < 24.4`;
and *the Mertens hypotheses* for *GarciaLeeMertensSmallRange*, *SchoenfeldMertensSmallRange* and
the hypotheses under which 6.21 states its bound for `Σ_{p ≤ x} 1/p` (`ButheVerified`,
*LeeNosalMertensRange*, `ZetaZeroReciprocalSum`, *PsiThetaUpper* or the remaining hypotheses of
§3.7, `ZetaZeroCountLowRange`, `HiaryRecord`, `PatelRecord` and `YangRecord`).

- Schoenfeld's estimate
  `|Σ_{p ≤ x} 1/p − log log x − M| < (3 log x + 4)/(8π√x)` for every real `x ≥ 13.5`, given
  *SchoenfeldMertensSmallRange* and the hypotheses under which 6.21 states its bound for
  `Σ_{p ≤ x} 1/p`.
- Garcia–Lee's Mertens lemma (§3.5), given the Mertens
  hypotheses.
- The explicit Duke short-sum theorem (§3.5), given the Mertens hypotheses,
  for the record of every primitive Dirichlet character of conductor at least `3` (nontrivial, so
  its completion is entire) and for the quotient record `𝒬_K` of every `K` abelian over `ℚ` with
  `n ≥ 2`, whose *GRH* (ZerosOfLFunctions Layer 9) §3.5 derives from `DedekindERH K` (the
  Dedekind conjecture
  holding for Galois `K`).
- The von Mangoldt–log sum of §3.6, given
  *GGLMPsiSmallRange*, `ButheVerified`, `Schoenfeld1976Range` and Rosser's zero count (the
  hypotheses of Schoenfeld's `ψ` bound, 6.16, from which its route proceeds for `x ≥ 73.2`).
- Garcia–Lee's two-sided bound for `κ_K` (§3.6), for every
  `K` abelian over `ℚ` with `n ≥ 2`, given the Mertens hypotheses.

Route: 5.2 for `RiemannHypothesis`; 5.4 for the Dirichlet records, read as their *GRH* through the
divisor form of RiemannHypothesisStatementsAndConsequences §9.3; for abelian `K`,
`DedekindERH K` by 5.5 and *DedekindConjecture* `K` because `K` is Galois
(ExplicitNumberFields §0.5). Schoenfeld's estimate: for `x ≥ 24.4`, 6.21 bounds the left side by
`3 log x/(8π√x)`, which is less than `(3 log x + 4)/(8π√x)`; on `[13.5, 24.4)` it is
*SchoenfeldMertensSmallRange*. ExplicitNumberFields 3.5 proves Garcia–Lee's Mertens lemma, the bound
`(3 log x + 4)/(8π√x) + 5/x²` for every `x ≥ 1.048`, from Schoenfeld's estimate for `x ≥ 13.5` and
*GarciaLeeMertensSmallRange* below `13.5`; with the estimate proved here that route gives the lemma
under the Mertens hypotheses. The short-sum theorem uses the lemma in its route, and Garcia–Lee's
two-sided bound uses the short-sum theorem at `𝒬_K` and the lemma at `(log d_K)^{1/2}`; the von
Mangoldt–log sum uses neither.

*Needs:* 5.2, 5.4, 5.5, 6.16, 6.21; ExplicitNumberFields §§0.5, 3.5, 3.6;
RiemannHypothesisStatementsAndConsequences §9.3; Tau Ceti
`TauCeti.LFunctions.mertensConstant`.

**Checks.**

- *SchoenfeldMertensSmallRange* is a computation with the primes up to `23`. Between consecutive
  primes the left side, `Σ_{p ≤ x} 1/p − log log x − M`, is positive and falls at the rate
  `1/(x log x)`, faster than the bound, whose derivative is `(2 − 3 log x)/(16π x^{3/2})`; so the
  proposition is the four inequalities at `x = 13.5, 17, 19, 23`: `0.125980 < 0.127871`,
  `0.099937 < 0.120624`, `0.114062 < 0.117145` and `0.094672 < 0.111227` (`M = 0.2614972…`). Just
  below `24.4` the left side is `0.076002`.
- The interval is needed: 6.21's bound `3 log x/(8π√x)` does not hold below `24.4`; at `x = 23`
  the left side is `0.094672` and `3 log 23/(8π√23) = 0.078041`.

### 6.30 Chebotarev and the least prime ideal (ExplicitNumberFields 7.2, 7.4)

For every Galois extension `L/K` with `L` abelian over `ℚ`, each given *GrenieMolteniSmallCases*,
`ButheVerified`, `Schoenfeld1976Range`, `Buthe2016Range` and Rosser's zero count (the last, with
the first two, for Schoenfeld's `ψ` bound of 6.16, which the route of §7.2 takes at `L = ℚ` for
`x > 73.2`): Grenié–Molteni's bound for `ψ_C` (§7.2, Theorem 1.1); its corollary for `π_C`
(Corollary 1.2); and the
prime ideal theorem of §7.2's case `L = K` for every `x ≥ 1` (6.9 has it for `x ≥ 100`), for `K`
abelian over `ℚ`. And, for `L ≠ ℚ`,
Bach–Sorenson's prime `𝔭` of `K` with Frobenius class `C`,
unramified in `L`, of rational prime norm `N𝔭 ≤ (4 log d_L + 2.5 n_L + 5)²` (§7.4).

Route: §§7.2 and 7.4 with `DedekindERH L` by 5.5. §7.4 states its
hypothesis as *GRH* (ZerosOfLFunctions Layer 9) for the Hecke L-functions; read as the
hypothesis for the Hecke characters of the abelian extensions `L/E`, `K ⊆ E ⊆ L`, that the
argument uses, it is 5.6 for each `L/E`, `L` being abelian over `ℚ`. Either reading is covered.

*Needs:* 5.5, 5.6, 6.16; ExplicitNumberFields 7.2, 7.4.

### 6.31 The Mertens function and Mertens' product (ExplicitMultiplicativeFunctions §§0.7, 1.9, 8.1)

- The part `RH(T)` of clause (a) of *ZetaResidueSumVerified*
  `T S Z` holds, so that clause holds exactly when the zeros up to height `T` are simple.
- Lee–Leong's bound of §1.9,
  `|M(x)| < 33.56 x (log x) exp(−√(log x/5.56))` for `x ≥ e^{4589.20}`,
  Leong's bound (a) and
  Leong's bound (b), `1/|ζ(σ + it)| ≤ 1719 log t`, hold
  with `RH(H₀)` removed, given `BrentPlattTrudgianRecord`, `LeongRecord` and
  *ZetaReciprocalSegmentVerified* `(3/4) 14 16`, as each statement uses them.
- Mertens' product in its form under the Riemann hypothesis (§8.1),
  `e^{−ε_RH(x)} < e^γ (log x) ∏_{p ≤ x} (1 − 1/p) < e^{ε_RH(x) + 1/(x − 1)}` and its reciprocal
  form for every real `x ≥ 24.4`, `ε_RH(x) = 3 log x/(8π √x)`, given the estimate of
  ExplicitPrimeCounting §4.7, which 6.21 supplies with its records.
- `moebiusSum x = O(x^{1/2+ε})` for every `ε > 0`, for the Mertens function `moebiusSum` of
  §0.1 (Littlewood's theorem that the Riemann hypothesis gives this bound).

Route: 6.11 for `RH(T)` and `RH(H₀)`; 5.2 for §8.1 and, through Littlewood's theorem, for
`moebiusSum`.

*Needs:* 5.2, 6.11, 6.21; ExplicitMultiplicativeFunctions §§0.1, 0.7, 1.9, 8.1.

### 6.32 Li and Weil positivity (WeilPositivityAndLiCriterion §§3.2, 4.2, 5.2)

`0 < liCoeff n` for every `n ≥ 1`; every Li Gram matrix of
§4.2 is positive definite; `0 < Re (weilForm g g)` for every nonzero test function
`g` of §5.2.

Route: 5.2 in `liCoeff_pos_of_riemannHypothesis` and `liGramMatrix_posDef_of_riemannHypothesis`.
The positivity of the Weil form is proved here. By 5.2 every `ρ` with `zetaZeroMult ρ ≠ 0` has `Re ρ = 1/2`
(WeilPositivityAndLiCriterion 1.1, the bridge), so `1 − conj ρ = ρ` and the summable family of
§5.1 has the terms `zetaZeroMult ρ |ĝ(ρ)|² ≥ 0`; `Re (weilForm g g)` is at least each of them, and
it suffices to find one zero `ρ` with `ĝ(ρ) ≠ 0`. Let `g ≠ 0` vanish off `[a, b] ⊂ (0, ∞)` and
`A = max(|log a|, |log b|)`.

- `ĝ` is entire, `|ĝ(s)| ≤ ‖g‖₁ e^{A(|s| + 1)}`, and `ĝ` is not identically `0`: its values
  `ĝ(n + 1) = ∫ tⁿ g(t) dt`, `n ∈ ℕ`, cannot all vanish, since then `∫ p g = 0` for every
  polynomial `p`, and polynomials approximating `conj g` uniformly on `[a, b]` (Mathlib
  `polynomialFunctions_closure_eq_top`, for the real and imaginary parts) give `∫ |g|² = 0`.
- Fix `s₀` with `ĝ(s₀) ≠ 0`. Jensen's inequality (Mathlib `AnalyticOnNhd.sum_divisor_le`, on the
  discs about `s₀` of radii `R` and `eR`) bounds the number of zeros of `ĝ` in `|s − s₀| ≤ R`,
  counted with multiplicity, by `A(eR + |s₀| + 1) + C₀`, `C₀` independent of `R`: it is `O(R)`.
- The multiplicities of the zeros of `ζ` are small. Let `ρ = 1/2 + iγ` be a zero with `γ ≥ 17`; by
  5.2 it is the only zero of ordinate `γ`, so for `0 < η < 1` its multiplicity is at most
  `N(γ) − N(γ − η)`. 6.13 at `γ` and at `γ − η` bounds this by the increase of
  `(T/2π) log(T/(2πe))` over `[γ − η, γ]` plus `2C log γ/log log γ`, `log T/log log T` being
  increasing on `T ≥ 16`; as `η → 0`, `zetaZeroMult ρ ≤ 2C log γ/log log γ`.
- So the zeros with `17 < γ ≤ T`, counted without multiplicity, number at least
  `(N(T) − N(17)) log log T/(2C log T)`, which by 6.13 is at least `c T log log T` for large `T`,
  with some `c > 0`. They lie in the disc `|s − s₀| ≤ T + |s₀| + 1`. If `ĝ` vanished at all of them
  it would have at least `c T log log T` zeros there, against the bound `O(T)` of the second item.
  So `ĝ(ρ) ≠ 0` at some zero `ρ`.

*Needs:* 5.2, 6.13; WeilPositivityAndLiCriterion §§1.1, 3.2, 4.2, 5.1, 5.2; Mathlib
`polynomialFunctions_closure_eq_top`, `AnalyticOnNhd.sum_divisor_le`.

**Checks.**

- The multiplicity bound is what the count needs, since `ĝ` vanishes at a zero of every
  multiplicity as soon as it vanishes there once: the points `1/2 ± in`, `n ≥ 1`, taken with
  multiplicity `⌊log(n + 1)⌋`, number `≍ R log R` with multiplicity in the disc of radius `R`
  about `1/2`, and all of them are zeros of `sinh(π(s − 1/2))`, an entire function with
  `|f(s)| ≤ e^{π|s − 1/2|}`, which has `O(R)` zeros there. The comparison of a count with
  multiplicity against the `O(R)` zeros of an entire function of exponential type therefore proves
  nothing; counted without multiplicity those points number `≍ R`, and so do the zeros.

### Examples

Rosser's bound is consistent with the two zeros `1/2 ± 14.134725…i` of `ζ`: `N(15) = 1` and
`M(15) = 0.5651` (6.23). Johnston's inequality at `x = 3` reads `|ψ(3) − 3| = 1.2082 < 2.0905`
(6.17). Schoenfeld's small range of 6.29 is the four inequalities at `x = 13.5, 17, 19, 23`. The
computed lower bounds for `L(1/2, χ_F)` at the nine quadratic fields with `d_F ≤ 13` are positive,
the least being `0.2176`, at the discriminant `5` (6.28). A gap of `382` precedes the first row of
Ramaré–Saouter, which is why that row starts at `10 726 905 041` (6.24).

### Dependencies

Layers 4 and 5; RiemannHypothesisStatementsAndConsequences §§8.8, 9.3–9.9; ZerosOfLFunctions §§6.3,
8.8 and Layer 9; AnalyticNumberTheoryPartI; ClassicalArithmeticCompletion; ExplicitZetaBounds;
ExplicitPrimeCounting; ErdosProgressionPowers; QuasiRiemannHypothesis; SieveMethodsAndPrimePatterns;
ExplicitNumberFields; ExplicitMultiplicativeFunctions; WeilPositivityAndLiCriterion;
ClassFieldTheory Layers 12 and 13; Tau Ceti's class-group equivalence, moduli, Mertens constant and
class number formula of imaginary quadratic fields;
Mathlib's Chebyshev functions, Dirichlet L-functions, Weierstrass approximation and Jensen's inequality.

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
- Landau's theorem for weighted families from bounds for all large `y`, and the one-sided converse
  for `ψ_K(x) − x` (Layer 1);
- the windowed Landau theorem for weighted families, in pointwise, mean, large-value and
  lower-bound forms, and its form for `ψ_K(x) − x` (Layer 2);
- window bounds and their equivalence with zero-free half-planes, the reduction of the
  Dirichlet characters to cyclic families, and the window-bound form of `RiemannHypothesis`
  (Layer 3);
- the equivalence of window bounds for a family containing a character, and for a cyclic family,
  with the Riemann hypothesis for its members (Layer 4);
- the Riemann hypothesis and the generalized Riemann hypothesis for Dirichlet L-functions in
  every form of Layer 5, the extended Riemann hypothesis for fields abelian over `ℚ`, and the
  Riemann hypothesis for the Hecke characters of 5.6 (Layer 5);
- the statements of Layer 6, including Schoenfeld's Mertens estimate from `13.5`, given the
  finite range *SchoenfeldMertensSmallRange*, which 6.29 states as a hypothesis; the initial ranges
  of Johnston's bounds at the constant `1`, a finite verification
  proved here (6.17); the positivity of `L(1/2, χ_F)` at the nine quadratic fields with
  `d_F ≤ 13`, a finite verification proved here (6.28); the record
  *ZetaZeroReciprocalLowRange*, which the Layer 6 introduction states and its statements take as a
  hypothesis; the proposition *RamareRumelyRows*, in which 6.22 states the tabulated rows of
  Ramaré–Rumely and Dusart as a hypothesis; the record *RamareSaouterGapRange*, which 6.24 states
  and takes as a hypothesis; and the derivations of the instances of the general
  estimates of ExplicitPrimeCounting §§3.1(c) and 7.3, and of its intervals of §§7.1, 7.2 and 7.5,
  from the bounds of 6.17 and 6.18 (6.19, 6.20, 6.24), and of the cyclotomic least-prime bound
  from the headline of 6.23.

### Consumed, not redefined

- `ZeroFreeRightOf` and the Riemann-hypothesis predicates of records, of Dirichlet characters, of
  Dedekind zeta functions and of ray-class characters, with their equivalent forms:
  RiemannHypothesisStatementsAndConsequences §§9.2–9.5; the Riesz sums, and for one character the
  Riesz remainder, its
  conjugation, Mellin transform, continuation and poles, explicit formula and size:
  RiemannHypothesisStatementsAndConsequences
  §8.4a; the bound under a zero-free half-plane and the other consequences:
  RiemannHypothesisStatementsAndConsequences
  §§9.6–9.9;
- `HasLaplace`, Landau's theorem for Laplace transforms in its classical, meromorphic, signed and
  windowed forms, and `HasWindows`: ArithmeticDirichletSeriesPartII §§0.1, 4.1 and
  PositivityOfDirichletSeriesWithKernels
  Layer 6;
- the continued Dedekind zeta and Hecke L-functions, primitive ray-class characters and the
  Dirichlet records: LFunctions Layers 3–8; the bundled primitive Dirichlet characters and the
  rational dictionary: RiemannHypothesisStatementsAndConsequences §§10.3, 11.1;
- the cyclic family of a primitive Dirichlet character, and the window bounds for the cyclic
  family of every primitive Dirichlet character: FrobeniusRestrictedRieszSums §0.5 and
  ThetaChainsAndFrobeniusPrimeSums §10.11;
- the Artin formalism of induction and one-dimensional comparison, Artin holomorphy of
  one-dimensional representations, the equivalence between the Riemann hypothesis of `ζ_L` and
  that of the irreducible representations of `Gal(L/K)`, and the factorization of the Dedekind zeta
  function of a field abelian over `ℚ` into Dirichlet L-functions: AnalyticNumberTheoryPartI
  §§2.18a, 2.41, 2.42
  and RieszSumsOverPrimesAndExceptionalZeros §2.41a; the reciprocity dictionary: ZerosOfLFunctions
  §8.8; the independence of
  its primitive characters: RiemannHypothesisStatementsAndConsequences §8.8; the Frobenius
  normalization, the ray-class Artin map at the
  conductor, Kronecker–Weber and the Hilbert class field: ClassFieldTheory C.6, Layers 12–13;
- the Chebyshev bound `ψ_K(x) ≪ x`: Tau Ceti `TauCeti.primeIdealTheorem`;
- the negativity of `ζ` on `(0, 1)`: ExplicitZetaBounds §0.3, its case `q = 1`;
- the statements that the targets of Layer 6 cite, in their form under the hypothesis that
  Layer 5 proves: the roadmap named there.

### Not owned here

- the proof of the window bounds for cyclic families (ThetaChainsAndFrobeniusPrimeSums Layer 10):
  this roadmap cites them from its §10.11;
- Landau's theorem for Laplace transforms and its windowed form for transforms in general
  (PositivityOfDirichletSeriesWithKernels Layer 6); this roadmap applies them to L-functions;
- the Riemann hypothesis for Dedekind zeta functions of fields not abelian over `ℚ`, for
  ray-class characters not of the form of 5.6, and for Artin, automorphic and Rankin–Selberg
  L-functions: no roadmap here proves them, and no target of Layer 6 removes them;
- nonvanishing at the central point (beyond the nine quadratic characters of 6.28), simplicity
  of zeros, the Dedekind conjecture and every numerical record; so the explicit zero count of
  ExplicitZetaBounds §5.3, whose only hypothesis
  is such a record, Rosser's bound for `N(T)` below the height `1467` (its records
  `ZetaZeroFreeUpTo 14` and `ZetaArgumentBoundUpTo 6800000 2`), the reciprocal-zero records, the
  smoothed approximation of `log κ_K` and the bounds of
  Garcia–Grenié–Lee–Molteni and Palojärvi–Simonič (ExplicitNumberFields 3.6), which need
  `ζ_K(1/2) ≠ 0`, and the theta clause of `ModEightFiniteInput`, are not proved here and keep
  their hypotheses;
- the equivalences between the Riemann hypothesis of a Dedekind zeta function of an abelian
  extension and that of the characters of its Galois group (RieszSumsOverPrimesAndExceptionalZeros
  §2.41a and AnalyticNumberTheoryPartI
  §2.42): this roadmap applies them in 5.5 and 5.6.
- the general unconditional estimates of ExplicitPrimeCounting from which its instances come, the
  explicit formula smoothed with split heights of its §3.1(c) and the positivity criterion for
  primes in short intervals of its §7.3, with the table propositions that evaluate them: this
  roadmap states the instances by other routes and does not state the estimates.

## Exact supplier contracts

### From Mathlib

- `RiemannHypothesis`, `riemannZeta`, `riemannZeta_ne_zero_of_one_le_re`;
- `DirichletCharacter.LFunction`, `DirichletCharacter.primitiveCharacter`,
  `DirichletCharacter.IsPrimitive`;
- `meromorphicOrderAt`; `Finsupp`, `Finsupp.sum`, `Finsupp.mapDomain`,
  `Finsupp.mapDomain_apply_of_injective`, `Finsupp.indicator`, `Finsupp.indicator_apply`,
  `Finsupp.filter`, `Finsupp.sum_add_index'`, `Finsupp.sum_smul_index'`; `Chebyshev.psi`,
  `Chebyshev.theta` (6.17);
  `Real.continuous_mul_log`, `Continuous.measurable` (0.4); `MulChar.IsQuadratic`;
  `CyclotomicField`, `IsAbelianGalois`;
- `polynomialFunctions_closure_eq_top` (Weierstrass approximation on `[a, b]`) and
  `AnalyticOnNhd.sum_divisor_le` (Jensen's inequality: the zeros, with multiplicity, of a function
  analytic on a closed disc, bounded by `M ≥ 1` on its boundary and nonzero at its centre) (6.32);
- `DirichletCharacter.LFunction_eq_LSeries`, `DirichletCharacter.differentiable_LFunction`,
  `sum_mul_eq_sub_sub_integral_mul` (Abel summation on an interval) and
  `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq` (the identity theorem), for the series of
  `L(1/2, χ)` in 6.28.

### From Tau Ceti

- `TauCeti.primeIdealTheorem` (`ψ_K(x) ~ x`, for the Chebyshev bound in 1.3 and 2.5),
  `TauCeti.primePsi`, `TauCeti.IdealArithmeticFunction.vonMangoldt`;
- `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane` (5.6), `TauCeti.meromorphicOrderAt_conj_conj`
  and `TauCeti.dedekindZeta_ne_zero_of_one_lt_re` (0.6);
- `TauCeti.GlobalNumberFields.oneEquivClassGroup` and
  `TauCeti.GlobalNumberFields.Modulus.eq_one_of_dvd_one` (6.10);
- `TauCeti.GlobalNumberFields.RayClassCharacter.induced` (the pullback of a ray-class character
  of modulus `𝔪` to a multiple `𝔫` of `𝔪` along the transition map
  `RayClassGroup 𝔫 → RayClassGroup 𝔪`, evaluated by `RayClassCharacter.induced_apply`) and
  `TauCeti.GlobalNumberFields.RayClassGroup.hom_ext` (two homomorphisms out of `RayClassGroup 𝔪`
  whose composites with `idealClass 𝔪` agree, that is which agree on the classes of all integral
  ideals prime to `𝔪`, are equal) (5.6);
- `TauCeti.LFunctions.mertensConstant` (the Mertens constant of a number field; over `ℚ` the
  Meissel–Mertens constant) (6.29);
- `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne` (the class number formula
  `h = √|D| L(1, χ_D)/π` of an imaginary quadratic field of discriminant `D ≠ −3, −4`) and
  `TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantCharCast` (`χ_D` is primitive of
  conductor `|D|`) (6.6).

### From TauCetiRoadmap.ZerosOfLFunctions

- §6.3: *IsExceptionalZero* (for 6.1); §6.5: the orders of `ζ_K` on `Re s = 1`, `0` off `1` and
  `−1` at `1` (for 0.6); Layer 7: infinitely many zeros in the critical strip (for the Checks of
  3.3); §8.8: the reciprocity dictionary (Conventions, for 5.6 and 6.4); Layer 9: *GRH* for the
  records (6.1, 6.29, 6.30).

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

- §8.4a (a): `rieszSum`, its continuity.
- §8.4a (b): `PrimitiveRayClassCharacter.rieszRemainder ψ` and `PrimitiveDirichletCharacter.rieszRemainder`,
  their agreement over `ℚ`; the Euler–Kronecker constant *NumberField.eulerKroneckerConstant*; the
  conjugation
  `rieszRemainder ψ⁻¹ = conj (rieszRemainder ψ)`; the Mellin transform `Φ_ψ` on `Re s > 1`; `Φ_ψ`
  meromorphic on `ℂ`, analytic at `1`, with poles in `Re s > 0` exactly at the zeros of `L(·, ψ)`,
  simple with residue `m_ρ/(ρ(1 − ρ))`; the size bound `‖rieszRemainder ψ y‖ ≤ C_ψ y` for `y ≥ 1`.
- §8.8: *PrimitiveRayClassCharacter.of_comp_dictionary_eq*, the independence of the primitive
  characters `PrimitiveRayClassCharacter.of (ψ ∘ Φ)` from the dictionary (Conventions, for 5.6 and 6.4).
- §9.2: `ZeroFreeRightOf`, monotonicity (with zero-freeness right of `σ` equivalent to zero-freeness
  right of every `σ′ > σ`), germs, products and the converse product clause, values.
- §9.3: `AnalyticLFunctionData.GeneralizedRiemannHypothesis`, its half-plane form, the `ζ` bridge
  (`riemannHypothesis_iff_zeroFreeRightOf`, `riemannHypothesis_iff_riemannZeta_ne_zero`,
  `riemannZetaData.GeneralizedRiemannHypothesis ↔ RiemannHypothesis`), the invariance of the zero
  set of a completed function under `ρ ↦ 1 − ρ̄`, the divisor form (6.1, 6.29).
- §9.4: `DirichletCharacter.GeneralizedRiemannHypothesis`; its value form
  (`generalizedRiemannHypothesis_iff_LFunction_ne_zero`), strip forms
  (`generalizedRiemannHypothesis_iff_re_eq_half`), inverse, change of level and primitive character
  (`generalizedRiemannHypothesis_primitiveCharacter_iff`), completed-function clause, modulus one
  (`generalizedRiemannHypothesis_modOne_iff`), quantified forms and consumer forms.
- §9.5: `NumberField.ExtendedRiemannHypothesis`, `RayClassCharacter.GeneralizedRiemannHypothesis`;
  the inverse clause; the strip forms (5.5, 5.6, 6.10); presented and primitive; the trivial
  character; the records; the rational
  bullet, at every threshold `σ`: `ZeroFreeRightOf σ (dedekindZetaC ℚ) ↔ ZeroFreeRightOf σ riemannZeta`
  and
  `ZeroFreeRightOf σ (heckeLFunctionC ((ratDirichletEquiv q hq).symm χ)) ↔ ZeroFreeRightOf σ χ.LFunction`,
  with their cases `σ = 1/2`.
- §9.6: (a) exceptional zeros, (c) the remainder under a zero-free half-plane (for 3.2, 6.1), the
  Check on zero counts.
- §§9.7, 9.8: discharged in 6.2, 6.3, and through 6.2 the lower bound for `L(1, χ)` in 6.6. §9.9: the
  conditional prime counts, used in 1.3 (c) at `ℚ` and discharged in 6.4, and at the modulus `(q)∞`
  for `ψ(x; a, q)` in 6.5.
- §10.2: the nonvanishing and analyticity of the gamma factor on `Re s > 0`, used through §9.4.
- §10.3: `PrimitiveDirichletCharacter` with `of`, `1`, `⁻¹` and `LFunction`.
- §11.1: `PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter`, with its values, conductors,
  compatibility with `1` and `⁻¹`, its definition (the image of the bundle of a character of level
  `q` is the primitive character of `(ratDirichletEquiv q _).symm χ`), and the agreement of the
  L-functions.

### From TauCetiRoadmap.LFunctions

- Layer 3: `dedekindZetaC K`, its simple pole at `1` (`meromorphicOrderAt_dedekindZetaC_one`).
- Layer 4: the record `dirichletData χ hχ`, with its meromorphic continuation and functional
  equation.
- Layer 5: `PrimitiveRayClassCharacter K`, `PrimitiveRayClassCharacter.of`, its inverse,
  `PrimitiveRayClassCharacter.of_induced` (a character and the character it induces at a multiple
  of its modulus have the same primitive character; 5.6), `heckeLFunctionC`, entire for
  nontrivial primitive characters.
- Layer 7: `heckeLFunction_ne_zero_of_one_le_re` (no zero on `Re s ≥ 1`, `L(1, χ) ≠ 0`), for
  nontrivial primitive characters only; the trivial character goes through ZerosOfLFunctions §6.5
  (`meromorphicOrderAt_dedekindZetaC_one_add`).
- Layer 8: the series of `−ζ_K′/ζ_K` on `Re s > 1` (`TauCeti.hasSum_idealTerm_vonMangoldt`).

### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII

- §0.1: `HasLaplace f s z`.
- §4.1: the Laplace transform of the logarithmic counting function of a Dirichlet series with
  nonnegative coefficients is `F(s)/s` (for 1.3).

### From PositivityOfDirichletSeriesWithKernels, a sub-roadmap of this family

- §6.4: (b) if `g ≤ C e^{θu}` almost everywhere for large `u`, `HasLaplace g s (Φ s)` on `Re s > A`,
  `Φ` meromorphic on `Re s > θ`, and the leading coefficient of `Φ` at every real pole in
  `(θ, A]` is positive, then `Φ` has no pole in `Re s > θ`, `HasLaplace g s` holds on `Re s > θ` and
  `∫_0^∞ |C e^{θu} − g| e^{−σu} du < ∞` for real `σ > θ`; (c) without the sign condition, either no
  pole, or the rightmost pole is real with negative leading coefficient and `HasLaplace g s` holds
  right of it; (d) the same for lower bounds with the signs reversed.
- §6.8: the windowed theorem for poles of finite order under the integrability hypothesis, with its
  simple-pole corollary, in the form stated at the head of Layer 2.
- §6.9: (a) `HasWindows S λ` with its monotonicity in `S` and `λ`, windows of `[x₀, ∞)` and of sets
  containing `S ∩ [x₀, ∞)`; (b) the Mellin form of §6.8 under `∫_1^∞ |G(y)| y^{−σ−1} dy < ∞` for
  `σ > A`, including the conversion of pointwise windows of `{y ≥ 1 | G(y) ≤ C y^θ}` into the mean
  hypothesis.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §0.5: the cyclic family `𝒦(ψ)` of a primitive Dirichlet character `ψ` of order `o`, with the
  bijection `ℤ/o → 𝒦(ψ)`, `1, ψ ∈ 𝒦(ψ)`, closure under inversion, conductors dividing that of `ψ`.

### From ThetaChainsAndFrobeniusPrimeSums, a sub-roadmap of this family

- §10.11: for every primitive Dirichlet character `ψ` and the constants as in §10.6, the window
  bounds of §10.11 hold: for every `ε > 0` there are positive reals `w(κ)`, `κ ∈ 𝒦(ψ)`, and
  `λ > 1` with `HasWindows {y | Σ_κ w(κ) Re G_κ(y) ≤ y^{1/2+ε}} λ`. This is statement (i) of 4.2
  at every `ψ` (for 4.2 and 5.1). Of its Layer 10 this roadmap uses §10.11 only.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.18a: the one-dimensional comparison: the Artin L-function of a character `φ` is the
  L-function of the Hecke character attached to `φ` by reciprocity, with value `φ(Frob_𝔭)` at the
  unramified primes `𝔭` (for 5.6).
- §2.41: Artin holomorphy, and that a one-dimensional representation satisfies it (for 5.6).
- §2.42: for `K ⊆ ℚ(ζ_f)` abelian, `ζ_K = ∏_χ L(s, χ*)` as meromorphic functions over the
  characters modulo `f` trivial on the subgroup fixing `K`, and the equivalence of
  ERH(`K`), every zero of `ζ_K` with `0 < Re s < 1` on `Re s = 1/2`, with `RiemannHypothesis` and
  `DirichletGRH χ` for the nontrivial ones (for 5.5).
- §1.6: `DirichletGRH χ` (for 5.5, through the equivalence of §2.42).
- §§0.16, 1.9(i), 1.9(ii), 2.49: discharged in 6.7, 6.4, 6.5 and 6.8.

### From RieszSumsOverPrimesAndExceptionalZeros, a sub-roadmap of this family

- §2.41a, last bullet: under Artin holomorphy of every irreducible `ρ` of `Gal(L/K)`,
  `NumberField.ExtendedRiemannHypothesis L` holds exactly when `ZeroFreeRightOf (1/2)` holds for
  `L_K(·, ρ)` for every irreducible `ρ` (for 5.6, used from left to right with `L/K` abelian).

### From TauCetiRoadmap.ClassFieldTheory

- C.6: arithmetic Frobenius; the Artin symbol of `(ℓ)` on `ℚ(ζ_m)` sends `ζ_m` to `ζ_m^ℓ`.
- Layer 12: `abelianConductor`, `isAdmissibleModulus_abelianConductor`,
  `isAdmissibleModulus_iff_abelianConductor_dvd`, `rayClassArtinMap` with
  `rayClassArtinMap_surjective` and the splitting law `rayClassArtinMap_idealClass` (Conventions,
  5.6, 6.10).
- Layer 13: `kroneckerWeber` (for 5.5, 5.6); `rayClassField`, `isAdmissibleModulus_rayClassField`,
  `rayClassArtinEquiv`, `rayClassArtinEquiv_apply`, `hilbertClassField K`, `hilbertClassArtinEquiv`,
  `hilbertClassArtinEquiv_oneEquivClassGroup` (for 6.10).

### From TauCetiRoadmap.ExplicitZetaBounds

- §0.3, its case `q = 1`: `riemannZeta s < 0` for real `0 < s < 1`, with no
  record (for 1.2, 1.3, 2.4, 2.5, 6.28).
- §§0.2, 0.4, 0.4b, 2.9, 7.2–7.6, 7.9, 7.10, 8.1, 8.3–8.5, 9.3: the statements discharged in
  6.11–6.15, with the implications from the hypothesis to `DirichletGRHUpTo`, `PlattRecord`,
  `LuZamanZhaoRecord`, *HasLandauSiegelGap* `((log 3)/2) ∞` and the count `N(T)` that §§0.2, 0.4b,
  7.9 and 2.9 state, and Hoffstein's lemma of §9.3 (for 6.12).
- §7.3a: *ClassicalZeroFreeRegion*; §8.3a: *ZetaZeroDensityBound* (6.14(d)).
- §0.4, the records `ZetaZeroFreeUpTo 14` and `ZetaArgumentBoundUpTo 6800000 2`, and §5.2, Rosser's
  bound `|N(T) − M(T)| ≤ 0.137 log T + 0.443 log log T + 1.588` for every `T ≥ 2` under them
  (`zetaZeroCountBound_rosser_of_recorded`) and for `T ≥ 1467` with no record: *Rosser's zero
  count* of the Layer 6 introduction, carried by the statements of 6.16–6.20, 6.22–6.24, 6.29 and
  6.30 whose routes count the zeros of `ζ` at low heights; and Rosser's bound from `1467` with no
  record, which with `ZetaZeroCountLowRange` gives the count in the reciprocal-zero records' route.
- §0.2, the passage to imprimitive characters (an imprimitive character has the zeros of its
  primitive character in `0 < Re s < 1`), and §5.3, the explicit zero count for primitive
  Dirichlet L-functions of conductor `k > 1`, given *BennettMartinOBryantRechnitzerRecord*: with
  Rosser's zero count for the conductor `1`, *the Dirichlet zero counts* that the routes of 6.22
  and 6.23 sum over the characters modulo `q`, which those statements carry.

### From TauCetiRoadmap.ExplicitPrimeCounting

- §1.2 (`GRH*`), §§2.2, 2.3, 2.5, 2.6, 3.1, 3.4–3.6, 4.7, 6.1, 6.3, 6.5, 6.6, 7.1–7.3, 7.5: the
  statements and the zero inputs discharged in 6.11 and 6.16–6.24; §3.7: its hypotheses and its
  discharge of *PsiThetaUpper* (Layer 6 introduction).
- The named propositions that the routes of those statements use besides their lists (Layer 6
  introduction): §0.1, `MVDiagonalFiniteRange` and `BrunTitchmarshFiniteRange`, under which
  `brun_titchmarsh` is proved; §1.1, *FioriKadiriSwidinskyZeroSums*, and `ZetaZeroReciprocalSum`
  and `ZetaZeroCountLowRange`, which with *ZetaZeroReciprocalLowRange* (stated in the Layer 6
  introduction) are *the reciprocal-zero records* of §2.1's two-sided bound for
  `∑_{0 < γ ≤ T} 1/γ` (`T ≥ 4πe`), which bounds the term `s₁` of §3.1(d); §2.1, that bound, whose
  finite-height part the Layer 6 introduction derives from the three records; §1.3, `ButheVerified` and
  `Buthe2016Range`; §2.1, *CullyHugillJohnstonTable* at its row `(40, 1/2, 0.48, 6.431)`; §3.1,
  *ZeroCountBound* at Rosser's triple `0.137 0.443 1.588 0 2`, the bound that Rosser's zero count
  gives.
- §2.3, the four bounds of Büthe and Johnston, from which 6.17 derives Johnston's Theorem 4.1 at
  every `a ≥ 1` together with its initial ranges, without *JohnstonTable*; §6.1, the rows
  of *RamareRumelyTable1* and *Dusart2002Table*, which 6.22 states as *RamareRumelyRows*, the
  implication from `GRH*(k, H)` for every `H` to each row, and not through the general shape.
- §§3.4, 7.1–7.3, 7.5: the statements of 6.19's third item and of 6.24, as statements (their
  bounds, intervals, rows and thresholds); 6.19 and 6.24 prove them from 6.17 and 6.18 and use
  neither the general estimates of §§3.1(c) and 7.3 nor *FaberKadiriTable*, *KadiriLumleyTable*,
  *CullyHugillLeeTable*, *RamareSaouterTable* or *DusartThesisTable*. §1.3: *TrudgianRange*,
  *MossinghoffTrudgianRange* and `Schoenfeld1976Range` (its interval of Theorem 12 on
  `2 010 759.9 < x ≤ 10⁸`); §1.4: `PrimeGapLogSquareVerified`. §3.5: the criterion for Ramanujan's
  inequality from two-sided five-term bounds (6.20). §6.5: the size of the cyclotomic discriminant,
  `log |disc ℚ(ζ_q)| ≥ (φ(q)/2) log(q/2)` for every `q ≥ 1` (6.23).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

- §§5.0, 5.1b, 5.1c, 5.16a: the statements discharged in 6.9, 6.10, and the predicates
  `DedekindERH K` and `HeckeGRH χ` of §5.0 in which they are stated.

### From TauCetiRoadmap.ErdosProgressionPowers

- §0.9: its copy of `ModEightFiniteInput`; §§2.3, 2.6 and the headline theorems
  `character_family`, `effective_prime_bound`, `fixed_length_finiteness`, which carry it (6.7).

### From TauCetiRoadmap.QuasiRiemannHypothesis

- §5.4: the norm-composed character `χ ∘ N_{K/ℚ}` (5.6, 6.25); §§11.2, 11.3: discharged in 6.26.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §2.9: `SieveApplications.leastNonresidue` (6.26).

### From TauCetiRoadmap.ExplicitNumberFields

- §§0.5 (`GRHMod`, *QuadraticRealZeroGap*, *ImaginaryQuadraticRealZeroGap*, *UniformQuadraticZeroGap*, the
  Dedekind conjecture for Galois fields), 3.5, 3.6, 4.7, 4.9, 6.4, 7.2, 7.4, and *DGLSWSmallFieldGRH*
  of its list of computational hypotheses before §0.1: the statements discharged in 6.27–6.30; of 4.7 also its consequence at `c₈ = π/6`,
  `κ_K > 0.0014480/(n · t_K · d_K^{1/n})` (6.28).
- §3.5: the route of Garcia–Lee's Mertens lemma from Schoenfeld's estimate for `x ≥ 13.5` and
  *GarciaLeeMertensSmallRange* below; 6.29 supplies the estimate.

### From TauCetiRoadmap.ExplicitMultiplicativeFunctions

- §§0.7, 1.9, 8.1: discharged in 6.31; §0.1: `moebiusSum` (6.31).

### From TauCetiRoadmap.WeilPositivityAndLiCriterion

- §§3.2, 4.2: `liCoeff_pos_of_riemannHypothesis`, `liGramMatrix_posDef_of_riemannHypothesis`,
  discharged in 6.32.
- §§1.1, 5.1, 5.2: `zetaZeroMult` and the bridge between `RiemannHypothesis` and the zeros (1.1);
  the test functions, `ĝ = mellin g`, `weilForm` and the summability of its family (5.1); the
  statement of `weilForm_pos_of_riemannHypothesis` (5.2), which 6.32 proves with a route of its
  own.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for
  Dirichlet L-functions announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of the route of
  this roadmap: of the transform of a family with its positive residues
  (0.5, 0.6), of the windowed Landau theorem for families in its upper-bound forms (2.1–2.3, through
  PositivityOfDirichletSeriesWithKernels §6.8; the lower-bound form 2.4 and the form 2.5 for
  `ψ_K(x) − x` are drawn here from the dichotomy of that §6.8), and of the passage from the window
  bounds for cyclic families to the hypothesis (Layer 4, 5.1).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026:
  <https://alpo.ge/remark.pdf> (Layers 4–5).
- E. Landau, *Über einen Satz von Tschebyschef*, Math. Ann. 61 (1905): Landau's theorem on Laplace
  and Mellin transforms of functions bounded on one side (1.1–1.3).
- A. E. Ingham, *The Distribution of Prime Numbers*, Cambridge Tracts in Mathematics 30 (1932),
  chapter V: one-sided bounds and zero-free half-planes (1.3).
- H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I. Classical Theory* (2007),
  chapter 15: Landau's theorem and its use for oscillation (1.1–1.3).
- H. Davenport, *Multiplicative Number Theory*, third edition (2000), chapters 5 and 9: primitive
  characters and the functional equation of Dirichlet L-functions (3.4, 5.3).
- H. Heilbronn, *Zeta-functions and L-functions*, in J. W. S. Cassels and A. Fröhlich (eds.),
  *Algebraic Number Theory* (1967), chapter VIII: the factorization of the Dedekind zeta function of
  an abelian extension into Hecke L-functions (5.5, 5.6, through
  RieszSumsOverPrimesAndExceptionalZeros §2.41a and AnalyticNumberTheoryPartI
  §2.42).
- H. Kadiri and A. Lumley, *Short effective intervals containing primes*, Integers 14 (2014)
  (arXiv:1407.7902), Table 2: the rows of 6.24 §7.3.
- M. Cully-Hugill and E. S. Lee, *Explicit interval estimates for prime numbers*, Math. Comp. 91
  (2022), with its corrigendum (2024), Table 2: the rows of 6.24 §7.3.
- E. Bach and J. Sorenson, *Explicit bounds for primes in residue classes*, Math. Comp. 65 (1996):
  the cyclotomic bound of 6.23 and its Check.
- J. Kaczorowski and J. Pintz, *Oscillatory properties of arithmetical functions* I and II, Acta
  Math. Hungar. (1986, 1987); J. Pintz, *On the remainder term of the prime number formula* I and
  II, Acta Arith. (1980): localized oscillation theorems, context for Layer 2.
