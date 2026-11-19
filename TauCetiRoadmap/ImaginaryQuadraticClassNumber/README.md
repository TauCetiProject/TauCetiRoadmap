# Roadmap: imaginary quadratic fields: class numbers, finiteness and class number one

**Summary.** An imaginary quadratic field is a number field `K` of degree two over `ℚ` with no
real embedding. Every such field is `ℚ(√d)` for exactly one negative squarefree integer `d`, and
its discriminant `D` is `d` when `d ≡ 1 mod 4` and `4d` otherwise. This roadmap builds the
arithmetic of these fields and of their orders `O_f = ℤ + f𝒪_K` on the number-field, ideal-class,
binary-form, Dirichlet-character and modular-function carriers that Mathlib and Tau Ceti already
have, and proves the two classical theorems about the class number `h(K)`. The two have different
proofs: finiteness comes from an ineffective analytic lower bound, the exact list of class-number-one
fields from an effective argument through complex multiplication and one integer equation.

The headline theorems are these.

- **Siegel's theorem.** For every `ε > 0` there is `c_ε > 0` such that `L(1, χ) ≥ c_ε q^(−ε)` for
  every primitive nonprincipal real Dirichlet character `χ` of conductor `q`. With the analytic
  class-number formula it gives `C_ε > 0` with `h(K) ≥ C_ε |disc K|^(1/2 − ε)` for every imaginary
  quadratic field `K`; so for each `B` the imaginary quadratic fields of class number at most `B`
  have bounded discriminant and are finitely many up to isomorphism. The constants are ineffective.
- **Class number one** (Heegner, Stark). An imaginary quadratic field has class number one exactly
  when its discriminant is one of `−3, −4, −7, −8, −11, −19, −43, −67, −163`; equivalently, when it
  is `ℚ(√−n)` with `n` one of `1, 2, 3, 7, 11, 19, 43, 67, 163`.
- **The thirteen orders.** An order of an imaginary quadratic field has trivial Picard group exactly
  when its discriminant is one of `−3, −4, −7, −8, −11, −12, −16, −19, −27, −28, −43, −67, −163`.

Tau Ceti's quadratic-field and binary-form libraries, with the orders and Picard groups of
[GlobalNumberFields](../../Completed/GlobalNumberFields/README.md), supply integral bases, prime
decomposition, the correspondence between forms and ideal classes and the class number of `O_f`;
the first layer below adds their comparisons with complex embeddings and lattices. Tau Ceti's
class-number formula `h = w√|D| L(1, χ_D)/(2π)` and Mathlib's Dirichlet `L`-functions are the input
of the second layer; [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) takes the
same formula from the second layer. [ClassFieldTheory](../ClassFieldTheory/README.md)
supplies the Hilbert and ring class fields with their Artin isomorphisms, which the third layer
compares with values of modular functions at CM points. [ModularForms](../ModularForms/README.md),
[ModularCurves](../ModularCurves/README.md) and [EllipticCurves](../EllipticCurves/README.md) supply
the level-one modular curve, `j` and algebraic elliptic curves; ModularForms and
[ModularCurvesPartII](../ModularCurvesPartII/README.md) supply the complex uniformization
`ℂ/Λ ≅ E_Λ(ℂ)` of elliptic curves.

Layer 1 fixes the models, the distinguished complex embedding, maximal orders and units, the
correspondence between forms and ideal classes, and the orders of conductor `f`. Layer 2 takes the
quadratic character `χ_D` and the class-number formula, proves the real-character estimates behind
Siegel's theorem, and derives the uniform lower bound and finiteness. Layer 3 builds the modular
functions of level `N` and the CM dictionary, Siegel functions and the cube root `γ₂` of `j`, the
level-two norms at CM points, the effective bounds that close two branches of the problem, the
integer points of `y² = 2u(u³ + 1)`, and finally the nine fields and the thirteen orders. Layer 3
rests on Layer 1 and not on Layer 2, and no class-number-one conclusion is used to build its own
analytic or CM prerequisites.

## Conventions

1. **Imaginary quadratic fields.** An imaginary quadratic field is a number field `K` (Mathlib
   `NumberField K`) with `Module.finrank ℚ K = 2` and Mathlib's `NumberField.IsTotallyComplex K`.
   Mathlib's `Algebra.IsQuadraticExtension ℚ K` is the intrinsic quadratic predicate; no competing
   quadratic-field property is introduced. The class number `h(K)` is Mathlib's
   `NumberField.classNumber K`, the order of `ClassGroup (𝓞 K)`, and the discriminant is
   `NumberField.discr K`. The field classification concerns the maximal order `𝒪_K` of `K`, up to
   `ℚ`-algebra isomorphism.
2. **Radicand and discriminant.** Fields are parametrized uniquely by negative squarefree integers
   `d`, with `K_d = ℚ(√d)` modelled by Mathlib's `QuadraticAlgebra ℚ d 0` (generator `ω`,
   `ω² = d`), and equivalently by negative fundamental discriminants `D`, for which Mathlib's
   `Int.IsFundamentalDiscr` is the only predicate. The radicand and the discriminant differ: `D = d`
   if `d ≡ 1 mod 4` and `D = 4d` otherwise. The positive radicands `−d` of the nine-field list are
   `1, 2, 3, 7, 11, 19, 43, 67, 163` and the corresponding discriminants are
   `−4, −8, −3, −7, −11, −19, −43, −67, −163`. Multiplying a radicand by a rational square does not
   create a new field; neither arbitrary presentations nor integers with repeated square factors
   form a finite classification set. For a negative fundamental discriminant `D`, `h(D)` and `w_D`
   are the class number and the number of units of the field of discriminant `D`. `ω_D` is the
   generator `√d` of `𝒪_K` when `d ≢ 1 mod 4` and `(1 + √d)/2` when `d ≡ 1 mod 4`.
3. **Embeddings.** Every embedding into `ℂ` used below carries the chosen square root of the
   radicand with positive imaginary part: on the model it is Tau Ceti's
   `QuadraticAlgebra.complexEmbedding`, `ω ↦ i√|d|`; on a field presented by an algebraic integer
   `θ` it is the distinguished embedding `ι_K` of §1.1.
4. **Orders.** For `f ≥ 1`, `O_f = ℤ + f𝒪_K` is Tau Ceti's `TauCeti.GlobalNumberFields.intAddMulOrder K f`,
   of discriminant `f²D`. Its Picard group `TauCeti.GlobalNumberFields.Pic` is the group of
   invertible proper fractional ideals modulo principal ones; the Picard number `#Pic(O_f)` is an
   invariant separate from `h(K)` and from the ideal-class monoid
   `TauCeti.GlobalNumberFields.IdealClassMonoid` of noninvertible ideals. The nine-field theorem
   does not classify all orders, UFD language applies to the maximal (Dedekind) order only, and
   every conductor comparison keeps `f ≥ 1` and its conductor-prime restrictions.
5. **The CM point.** `τ_D = i√|D|/2` if `D ≡ 0 mod 4` and `τ_D = (3 + i√|D|)/2` if `D ≡ 1 mod 4`.
   Its minimal polynomial is `X² + BX + C` with `B = 0`, respectively `B = −3`, and
   `ℤ + ℤτ_D` is the image of `𝒪_K` under `ι_K` for `θ = √d`.
6. **Modular conventions.** `q = exp(2πiτ)` on Mathlib's `UpperHalfPlane`. `SL₂(ℤ)` acts on binary
   forms by `γ • f = f ∘ γ⁻¹` and on the upper half-plane by Möbius transformations. In
   finite-level modular-function actions a row vector `r` acts on the right by matrices, and the
   diagonal cyclotomic action of `diag(1, d)` sends `ζ_N` to `ζ_N^d`. Artin reciprocity has
   ClassFieldTheory's arithmetic-Frobenius convention; the comparison with these right actions is
   proved, including any inverse the convention forces, and the conventions are never silently
   exchanged.
7. **Siegel functions and class fields.** For `r = (r₁, r₂)`, `g_r` is Tau Ceti's
   `TauCeti.ModularForm.siegelFunction r`, `B₂(T) = T² − T + 1/6` is the second Bernoulli
   polynomial, `g₀ = g_(0,1/2)`, `g₁ = g_(1/2,0)`, `g₂ = g_(1/2,1/2)` and `ζ₈ = exp(2πi/8)`. `j` is
   Tau Ceti's `TauCeti.ModularForm.j`, and Mathlib's eta function is the only normalization of `η`
   used. `H_K` is the Hilbert class field and `K_(N)` the ray class field of conductor `N` of `K`.
8. **Names.** The headline theorems are declared in `Suggested.lean`, in the namespace
   `TauCetiRoadmap.ImaginaryQuadraticClassNumber`. Every other target is stated in prose. A Lean
   name in code font is a declaration of Mathlib, of Tau Ceti or of `Suggested.lean`; code font also
   carries formulas.
9. **Former numbering.** Citations by the former labels resolve as follows: H1.1, H1.2, H1.3 and
   H1.4 are now §§1.1, 1.2, 1.3 and 1.4; H2.1, H2.2, H2.3 and H2.4 are now §§2.1, 2.2, 2.3 and 2.4;
   H3.1, H3.2, H3.3, H3.4, H3.5 and H3.6 are now §§3.1, 3.2, 3.3, 3.4, 3.5 and 3.6; and H1, H2 and
   H3 are now Layers 1, 2 and 3.

## Layer 1: arithmetic, forms and class-number APIs

### 1.1 Models, embeddings and isomorphism classification

The model of `ℚ(√d)` for every rational parameter `d` is Mathlib's `QuadraticAlgebra ℚ d 0`, with
its two-coordinate basis, multiplication, conjugation `QuadraticAlgebra.starAlgEquiv`, norm and
trace (`Algebra.norm_quadraticAlgebra_apply` compares the algebra norm with the quadratic norm),
its field structure for a nonsquare parameter (`QuadraticAlgebra.isField_iff_not_isSquare_discr`),
its compatible rational algebra structure and `Algebra.IsQuadraticExtension`; a negative integer
`d` is a nonsquare. For `d < 0` the model has the distinguished complex embedding
`QuadraticAlgebra.complexEmbedding` sending `ω` to `i√|d|`; every complex embedding of the field
model is it or its complex conjugate (`QuadraticAlgebra.ringHom_eq_or_eq_conjugate`), complex
conjugation restricts to `starAlgEquiv` (`QuadraticAlgebra.isConj_complexEmbedding`), the model is
totally complex exactly when `d < 0` (`QuadraticAlgebra.isTotallyComplex_iff`) and has one complex
place, so signature `(0, 1)` (`QuadraticAlgebra.nrComplexPlaces_eq_one`). Conversely, every
imaginary quadratic field is generated by an algebraic integer `θ` with minimal polynomial `X² − d`
for a negative squarefree `d` (`NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top_of_isTotallyComplex`;
other roadmaps cite this statement as exists_negative_squarefree_presentation), exactly one negative
squarefree `d` has `K ≃ₐ[ℚ] QuadraticAlgebra ℚ d 0` (`NumberField.existsUnique_neg_squarefree_algEquiv`),
and for `δ ∈ K` with `δ² = D`, `D` a nonsquare integer, evaluation `z ↦ z.re + z.im · δ` is a
`ℚ`-isomorphism `QuadraticAlgebra ℚ D 0 ≃ₐ[ℚ] K` (`TauCeti.QuadraticOrder.algEquivOfSqrt`, with
`TauCeti.QuadraticOrder.algEquivOfSqrt_apply`). The isomorphism classification is consumed as well:
for squarefree `d, e` the models are `ℚ`-isomorphic iff `d = e`
(`QuadraticAlgebra.Rat.nonempty_algEquiv_iff`), and the same holds for fields presented by square
roots of squarefree integers (`NumberField.nonempty_algEquiv_iff_of_squarefree`); every
`QuadraticAlgebra ℚ a b` of nonzero discriminant is isomorphic to a squarefree model
(`QuadraticAlgebra.Rat.exists_squarefree_algEquiv`); and for nonzero rational parameters `a, a'`,
`QuadraticAlgebra ℚ a 0 ≅ QuadraticAlgebra ℚ a' 0` iff `a = u²a'` for some `u ∈ ℚˣ`, the criterion
of equal classes in `ℚˣ/(ℚˣ)²` (`QuadraticAlgebra.nonempty_algEquiv_iff` with `b = b' = 0`).

The target of this section is the naturality of these identifications with the embeddings. A
*presented field* is a number field `K` with `θ ∈ 𝓞 K`, `minpoly ℤ θ = X² − d` for a negative
squarefree integer `d` and `Algebra.adjoin ℚ {θ} = ⊤`. Define its **distinguished embedding**
`ι_K : K →+* ℂ` (written `ι_(K,θ)` when the presentation matters) as the composite of the inverse of
the model equivalence `TauCeti.QuadraticOrder.algEquivOfSqrt` at `δ = θ`, which sends `ω` to `θ`,
with `QuadraticAlgebra.complexEmbedding`. Prove:

- `ι_K(θ) = i√|d|`, so `ι_K` sends `θ` into the upper half-plane.
- Every ring homomorphism `K → ℂ` is `ι_K` or its complex conjugate, and the two are distinct;
  complex conjugation restricts under `ι_K` to the nontrivial automorphism `θ ↦ −θ` of `K`.
- The identifications are natural for the model equivalences: for presented fields `(K, θ)`,
  `(L, η)` and `(M, μ)` with the same radicand, let `e_(K,L) : K ≃ₐ[ℚ] L` be the composite of the
  model equivalence of `K` with the inverse of that of `L`, so that `e_(K,L)(θ) = η`. Then
  `ι_L ∘ e_(K,L) = ι_K`, `e_(L,K) = e_(K,L)⁻¹` and `e_(L,M) ∘ e_(K,L) = e_(K,M)`.
- For every `ℚ`-isomorphism `σ : K ≃ₐ[ℚ] L` of fields presented by `θ` and `η` with the same
  radicand `d`, `σ(θ) = ±η`; `ι_L ∘ σ = ι_K` when `σ(θ) = η`, and `ι_L ∘ σ` is the complex conjugate
  of `ι_K` when `σ(θ) = −η`. This is the integral case `u = ±1` of the rescaling comparisons
  `QuadraticAlgebra.complexEmbedding_comp_smulOmegaEquiv_of_pos` and
  `QuadraticAlgebra.complexEmbedding_comp_smulOmegaEquiv_of_neg`, which for `d = u²e` carry the
  distinguished embedding to the distinguished embedding when `u > 0` and to its conjugate when
  `u < 0`.

*Needs:* Mathlib `QuadraticAlgebra`, `QuadraticAlgebra.starAlgEquiv`, `minpoly`, `Algebra.adjoin`;
Tau Ceti `TauCeti.QuadraticOrder.algEquivOfSqrt`, `TauCeti.QuadraticOrder.algEquivOfSqrt_apply`,
`QuadraticAlgebra.complexEmbedding`, `QuadraticAlgebra.ringHom_eq_or_eq_conjugate`,
`QuadraticAlgebra.isConj_complexEmbedding`, `QuadraticAlgebra.smulOmegaEquiv`,
`QuadraticAlgebra.complexEmbedding_comp_smulOmegaEquiv_of_pos`,
`QuadraticAlgebra.complexEmbedding_comp_smulOmegaEquiv_of_neg`.

**Checks.**
- `ℚ` is not an imaginary quadratic field (its degree is one), and `d = 0, 1` are not field models:
  in `QuadraticAlgebra ℚ 0 0` the generator `ω` is a nonzero nilpotent, and in
  `QuadraticAlgebra ℚ 1 0` the product `(ω − 1)(ω + 1)` vanishes.
- Rational-square changes of the parameter preserve the field and must not inflate a finite family:
  `QuadraticAlgebra ℚ (−4) 0 ≅ QuadraticAlgebra ℚ (−1) 0` by `ω ↦ 2ω`, as the `ℚˣ/(ℚˣ)²` criterion
  accepts `−4 = 2² · (−1)`, and `complexEmbedding_comp_smulOmegaEquiv_of_pos` with `u = 2` carries
  one distinguished embedding to the other. A classification indexed by all negative integers
  instead of the squarefree ones would list `ℚ(i)` at `d = −1, −4, −9, …`.
- The distinguished embedding depends on the presentation, not only on `K`: `ℚ(√−5)` is presented
  by `θ` and by `−θ`, both with minimal polynomial `X² + 5`, and `ι_(K,θ)(θ) = i√5` while
  `ι_(K,−θ)(θ) = −i√5`. The identity of `K` sends `θ` to `−(−θ)`, and the last bullet above gives
  `ι_(K,−θ) = conj ∘ ι_(K,θ)`, as computed. A definition of `ι_K` that ignores `θ` cannot send
  both `θ` and `−θ` to `i√5`, as the first bullet requires for the two presentations.

### 1.2 Maximal orders, ideals, units and finite arithmetic

For squarefree `d ≠ 1`, `𝒪_K = ℤ[√d]` with `D = 4d` when `d ≢ 1 mod 4`, and
`𝒪_K = ℤ[(1 + √d)/2]` with `D = d` when `d ≡ 1 mod 4`. These are Tau Ceti's coordinate ring
equivalences `QuadraticAlgebra.ringOfIntegersEquiv` (onto `QuadraticAlgebra ℤ d 0`) and
`QuadraticAlgebra.ringOfIntegersEquivHalf` (onto `QuadraticAlgebra ℤ ((d − 1)/4) 1`, whose `ω`
corresponds to `(1 + √d)/2`), with the coordinate integrality tests
`QuadraticAlgebra.isIntegral_iff_of_mod_four_ne_one` and `QuadraticAlgebra.isIntegral_iff_of_mod_four_eq_one`,
the norm, trace and distinguished-embedding formulas in coordinates
(`QuadraticAlgebra.norm_ringOfIntegersEquiv_symm`, `QuadraticAlgebra.trace_ringOfIntegersEquiv_symm`,
`QuadraticAlgebra.complexEmbedding_ringOfIntegersEquiv_symm` and their `ringOfIntegersEquivHalf`
companions) and the discriminants (`QuadraticAlgebra.discr_eq_four_mul_of_mod_four_ne_one`,
`QuadraticAlgebra.discr_eq_of_mod_four_eq_one`). The ideal `(p, ω − r)` of the coordinate ring
corresponds to `(p, √d − r)`, respectively `(p, (1 + √d)/2 − r)`, in `𝒪_K`
(`QuadraticAlgebra.map_ringOfIntegersEquiv_symm_span`, `QuadraticAlgebra.map_ringOfIntegersEquivHalf_symm_span`);
for every prime `p`, `2` included, the primes of `𝒪_K` above `p` are `(p)` when `p` is inert and the
explicit ideals `(p, √d − r)`, respectively `(p, (1 + √d)/2 − r)`, otherwise
(`QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_ne_one`,
`QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_eq_one`), and `p` ramifies exactly when
it divides `D` (`QuadraticAlgebra.span_natCast_integralSqrt_sub_sq_eq_iff`,
`QuadraticAlgebra.span_natCast_halfGen_sub_sq_eq_iff`). For `d ≡ 1 mod 4` the ring `ℤ[√d]` is the
order of conductor `2`, not `𝒪_K`; the comparison of orders with `𝒪_K` is §1.4. The units of an
imaginary quadratic field are roots of unity: six for `D = −3`, four for `D = −4` and two otherwise
(`TauCeti.NumberField.Units.card_units_of_isTotallyComplex_of_discr`), namely `±1` outside
`D = −3, −4` (`TauCeti.NumberField.Units.eq_one_or_neg_one_of_isTotallyComplex`).

Class groups are transported along isomorphisms by actual maps, not only by equal cardinalities:
`RingEquiv.classGroupEquiv` for a field isomorphism, with `RingEquiv.classGroupEquiv_mk0` (its value
on ideal classes), `RingEquiv.classGroupEquiv_symm` and `RingEquiv.classGroupEquiv_trans`; Mathlib's
`ClassGroup.mulEquiv` for a ring isomorphism, in particular the coordinate ring equivalences of this
section; and `RingEquiv.classNumber_eq` and `QuadraticAlgebra.natCard_classGroup_eq_classNumber_of_mod_four_ne_one`
with `QuadraticAlgebra.natCard_classGroup_eq_classNumber_of_mod_four_eq_one` for the cardinalities
(the coordinate rings have `h(K)` ideal classes). Other roadmaps cite the class-number transport
along a `ℚ`-algebra isomorphism as classNumber_congr; it is `RingEquiv.classNumber_eq` applied to the
underlying ring isomorphism. `h(K) = 1` iff `𝒪_K` is a principal ideal ring
(`NumberField.classNumber_eq_one_iff`) iff it is a UFD
(`NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid`), and the same equivalences hold for
the coordinate rings (`QuadraticAlgebra.classNumber_eq_one_iff_isPrincipalIdealRing_of_mod_four_ne_one`,
`QuadraticAlgebra.classNumber_eq_one_iff_uniqueFactorizationMonoid_of_mod_four_ne_one` and their
`_of_mod_four_eq_one` companions). The model `QuadraticAlgebra ℚ (−20) 0` of `ℚ(√−5)` has class
number two (`TauCeti.BinaryQuadraticForm.classNumber_neg_twenty_eq_two`), so its ring of integers
is not a UFD, and every number field generated over `ℚ` by an algebraic integer with minimal
polynomial `X² + 5` has class number two (`TauCeti.NumberField.classNumber_eq_two_of_minpoly_eq_X_sq_add_five`),
in agreement with the model of parameter `−20 = 2² · (−5)`. No finiteness statement over a family of
fields follows from the `Fintype` instance of one fixed class group.

The target of this section is the explicit exceptional generators in the model coordinates. Prove
that the unit group of `ℤ[√−1] = QuadraticAlgebra ℤ (−1) 0` is cyclic of order four, generated by
`ω = √−1`, and that the unit group of `ℤ[(1 + √−3)/2] = QuadraticAlgebra ℤ (−1) 1` is cyclic of
order six, generated by `ω`, which corresponds to `(1 + √−3)/2`, is a root of `X² − X + 1` and is a
primitive sixth root of unity.

*Needs:* §1.1; Mathlib `QuadraticAlgebra`, `ClassGroup.mulEquiv`, `NumberField.classNumber_eq_one_iff`,
`IsPrimitiveRoot`; Tau Ceti `QuadraticAlgebra.ringOfIntegersEquiv`, `QuadraticAlgebra.ringOfIntegersEquivHalf`,
`TauCeti.NumberField.Units.card_units_of_isTotallyComplex_of_discr`.

**Checks.**
- `ℚ(i)` has `D = −4` and four units and `ℚ(√−3)` has `D = −3` and six units. In
  `QuadraticAlgebra ℤ (−1) 1` the generator satisfies `ω² = ω − 1`, hence `ω³ = −1` and `ω` has
  order six. The ring `ℤ[√−3] = QuadraticAlgebra ℤ (−3) 0` has only the units `±1`, since
  `a² + 3b² = 1` forces `b = 0`; so it is not the ring of integers of `ℚ(√−3)`, and a definition
  `𝒪_K = ℤ[√d]` for every `d` gets `w_(−3)` wrong.
- `d = −3` gives `D = −3`, while `d = −2` gives `D = −8`. A list treating `d = −1` as the
  discriminant `−1` is rejected: `−1 ≢ 0, 1 mod 4`, and `ℚ(i)` has `D = −4`.
- `ℚ(√−5)` has `D = −20` and class number two, and `6 = 2 · 3 = (1 + √−5)(1 − √−5)` are two
  factorizations into irreducibles of norms `4, 9` and `6, 6`, since no element of `ℤ[√−5]` has
  norm `2` or `3`. Ramification follows `D`, not `d`: `2` ramifies, `(2) = (2, √−5 − 1)²`, although
  `2 ∤ d`; `3` splits as `(3, √−5 − 1)(3, √−5 + 1)`, as `−5 ≡ 1² mod 3`; and `11` is inert, as
  `−5 ≡ 6` is not a square modulo `11`.

### 1.3 Primitive forms and ideal classes

GlobalNumberFields Layer 11 supplies the carrier for every quadratic order, not only the maximal
order: `TauCeti.GlobalNumberFields.NumberFieldOrder`, its fraction-field instance, the proper
fractional-ideal predicate, the group of invertible proper fractional ideals and the quotient
`TauCeti.GlobalNumberFields.Pic`; noninvertible classes stay in
`TauCeti.GlobalNumberFields.IdealClassMonoid`. The form correspondence is stated on this carrier,
before the conductor formulas of §1.4.

For every negative order discriminant `Δ = −n`, primitive positive definite integral forms
`(a, b, c)` with `b² − 4ac = Δ`, modulo **proper** `SL₂(ℤ)`-equivalence, correspond to the
invertible proper ideal classes of the order of discriminant `Δ` through the ideal generated by `a`
and `(−b + √Δ)/2` (Cox, Theorem 7.7): this is `TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic`.
The reduced forms, with `|b| ≤ a ≤ c` and `b ≥ 0` when `|b| = a` or `a = c`, represent every class
exactly once (`TauCeti.BinaryQuadraticForm.picClass_primitiveReducedForms_bijective`,
`TauCeti.BinaryQuadraticForm.nat_card_pic`); the bound `3a² ≤ |Δ|` makes them a finite set, and
their number is the class number: `h(K) = #primitiveReducedForms n` when `disc K = −n`
(`TauCeti.BinaryQuadraticForm.classNumber_eq_card_primitiveReducedForms_of_discr_eq`) and
`#Pic(O_f) = #primitiveReducedForms n` when `f²D = −n`
(`TauCeti.BinaryQuadraticForm.card_pic_intAddMulOrder_eq_card_primitiveReducedForms`). The weighted
Hurwitz count of the primitive reduced forms is `2h/w`
(`TauCeti.BinaryQuadraticForm.sum_reducedFormWeight_primitiveReducedForms_eq_card_pic_div_card_units`);
the imprimitive forms enter the Hurwitz class number of ModularForms Layer 11 separately. At `f = 1`,
`TauCeti.GlobalNumberFields.maximalOrderPicEquiv` identifies the Picard group with
`ClassGroup (𝓞 K)`.

The group law is consumed as well: the principal form represents the trivial class and no
other proper class does (`TauCeti.BinaryQuadraticForm.posDefProperClassToPic_principalForm`,
`TauCeti.BinaryQuadraticForm.posDefProperClassToPic_eq_one_iff`); the Dirichlet composition
`(aa′, B, C)` of united forms `(a, B, a′C)` and `(a′, B, aC)` represents the product class, and every
product of two classes arises so (`TauCeti.BinaryQuadraticForm.posDefProperClassToPic_mk_mul_of_united`,
`TauCeti.BinaryQuadraticForm.exists_posDefProperClassToPic_mul_posDefProperClassToPic_eq`); and the
opposite form `(a, −b, c)`, whose ideal `ℤa + ℤ(b + √Δ)/2` is the conjugate of that of `(a, b, c)`,
represents the inverse class (`TauCeti.BinaryQuadraticForm.posDefProperClassToPic_mk_eq_inv_of_eq_reflected`).
The versions `TauCeti.BinaryQuadraticForm.picClass_principalForm`,
`TauCeti.BinaryQuadraticForm.picClass_mul_picClass_of_united` and
`TauCeti.BinaryQuadraticForm.picClass_reflected` hold for primitive forms of any nonsquare
discriminant. A proper change of variables multiplies the ideal of a form by an explicit principal
factor (`TauCeti.BinaryQuadraticForm.fractionalIdeal_smul`). The point
`τ = (−b + i√n)/(2a)` of the upper half-plane attached to a positive definite form `(a, b, c)` of
discriminant `−n` is `TauCeti.BinaryQuadraticForm.root`; it satisfies `root(γ • f) = γ • root f` for
`γ ∈ SL₂(ℤ)` (`TauCeti.BinaryQuadraticForm.root_smul`), and for fixed `n` a form is determined by
its point (`TauCeti.BinaryQuadraticForm.root_injective`).

The target of this section is the comparison with the embeddings of §1.1 and the CM points of
Layer 3. Under the chosen positive imaginary square root, prove that the image of the ideal of a form
`(a, b, c)` is the lattice `ℤa + ℤ(−b + √Δ)/2` of `ℂ`, which is `a(ℤ + ℤτ)` for `τ = root(a, b, c)`,
so homothetic to `ℤ + ℤτ`. Carry the orientation and the choice of complex embedding explicitly, and
prove the naturality of this lattice under changes of oriented basis, that is, under the proper
`SL₂(ℤ)`-action on forms, compatibly with `root_smul`.

*Needs:* §1.1; GlobalNumberFields Layer 11; Tau Ceti `TauCeti.GlobalNumberFields.NumberFieldOrder`,
`TauCeti.GlobalNumberFields.Pic`, `TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic`,
`TauCeti.BinaryQuadraticForm.fractionalIdeal_smul`, `TauCeti.BinaryQuadraticForm.root`,
`TauCeti.BinaryQuadraticForm.root_smul`, `QuadraticAlgebra.complexEmbedding`.

**Checks.**
- Discriminant `−23` has the three reduced forms `(1, 1, 6)`, `(2, 1, 3)` and `(2, −1, 3)`, so the
  class number of `ℚ(√−23)` is three. The last two are improperly but not properly equivalent and
  represent inverse classes; counting classes up to `GL₂(ℤ)`-equivalence would give two.
- Discriminant `−20` has the reduced forms `(1, 0, 5)` and `(2, 2, 3)`, matching
  `classNumber_neg_twenty_eq_two`.
- The class number is not the Hurwitz count: discriminant `−12` has the one primitive reduced form
  `(1, 0, 3)` and the imprimitive reduced form `(2, 2, 2)`, so `#Pic` of the order of discriminant
  `−12` is one, while the Hurwitz class number `H(12) = 1 + 1/3 = 4/3` counts the imprimitive form
  with weight `1/3`. At discriminant `−4` the single form `(1, 0, 1)` has weight `1/2 = 2 · 1/4`,
  and at `−3` the form `(1, 1, 1)` has weight `1/3 = 2 · 1/6`, as `2h/w` predicts.
- For `(2, 1, 3)` of discriminant `−23`, `τ = (−1 + i√23)/4`, and the ideal `ℤ2 + ℤ(−1 + √−23)/2` has
  image `2(ℤ + ℤτ)`; the opposite form `(2, −1, 3)` gives `(1 + i√23)/4 = −τ̄`, the point of the
  conjugate lattice.

### 1.4 Orders and conductor comparisons

For every `f ≥ 1`, this section consumes the order `O_f = ℤ + f𝒪_K`
(`TauCeti.GlobalNumberFields.intAddMulOrder`), its conductor `f𝒪_K`
(`TauCeti.GlobalNumberFields.NumberFieldOrder.conductor_intAddMulOrder`), its discriminant `f²D`
(`TauCeti.GlobalNumberFields.NumberFieldOrder.discr_intAddMulOrder_of_finrank_eq_two`), the fact
that every order of a quadratic field is `O_f` for exactly one `f`, its index, and is determined by
its conductor or by its discriminant
(`TauCeti.GlobalNumberFields.NumberFieldOrder.eq_intAddMulOrder_index`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.eq_intAddMulOrder_iff_discr_eq`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.conductor_injective`), the exact sequence
`(𝒪_K/𝔣)ˣ → Pic(O_f) → Cl(𝒪_K) → 1` with its residue-unit kernel
(`TauCeti.GlobalNumberFields.NumberFieldOrder.picToClassGroup_surjective`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.mulExact_residueUnitsToPic_picToClassGroup`), the
class-number formula for orders of any number field
(`TauCeti.GlobalNumberFields.NumberFieldOrder.card_pic_mul_index_mul_card_units`), and for quadratic
fields the formula (Cox, Theorem 7.24)

```text
h(O_f) = h(K) · f / [𝒪_Kˣ : O_fˣ] · ∏_(p | f) (1 − χ_D(p)/p)
```

with `χ_D(p) = 0` at ramified primes (`TauCeti.GlobalNumberFields.NumberFieldOrder.card_pic_intAddMulOrder_eq`
and its denominator-free local-factor form
`TauCeti.GlobalNumberFields.NumberFieldOrder.card_pic_intAddMulOrder_mul_index_eq`), the unit index
`1`, and `2` or `3` for `f > 1` at `D = −4, −3`
(`TauCeti.GlobalNumberFields.NumberFieldOrder.index_range_unitsMap_intAddMulOrder`), and the
maximal-order specialization (`TauCeti.GlobalNumberFields.NumberFieldOrder.card_pic_intAddMulOrder_one`).
The invertible Picard carrier is distinguished from noninvertible proper classes throughout. For a
square root `δ ∈ K` of `f²D`, the order `O_f` is the canonical order `ℤ[(f²D + δ)/2]` of
discriminant `f²D` (`TauCeti.QuadraticOrder.numberFieldOrderOfSqrt_eq_intAddMulOrder`).

The target of this section is the lattice form of these orders under the embeddings of §1.1. Prove that
`O_f = ℤ + ℤ·fω_D`, with `ω_D` the generator of §1.2 (for `δ = f√D`, `(f²D + δ)/2` and `fω_D` differ
by a rational integer); that `ι_K(O_f) = ℤ + ℤ·fτ_D` for the CM point `τ_D` of Convention 5; and that
`O_f` is the endomorphism ring of this lattice, the ring of `α ∈ K` with
`ι_K(α)(ℤ + ℤ·fτ_D) ⊆ ℤ + ℤ·fτ_D`. These are basic order APIs; the final field classification is
stated only for `f = 1`.

*Needs:* §§1.1–1.3; GlobalNumberFields Layer 11; Tau Ceti `TauCeti.GlobalNumberFields.intAddMulOrder`,
`TauCeti.QuadraticOrder.numberFieldOrderOfSqrt_eq_intAddMulOrder`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.eq_intAddMulOrder_index`.

**Checks.**
- `O_2` in `ℚ(i)` has discriminant `−16` and Picard number one, by the formula
  `1 · 2/2 · (1 − 0) = 1` (unit index two, `χ_(−4)(2) = 0`), while its conductor is nontrivial. This
  does not add a tenth field or make `O_2` a UFD.
- `O_2` in `ℚ(√−3)` has discriminant `−12` and Picard number `1 · 2/3 · (1 + 1/2) = 1`; `O_3` there
  has discriminant `−27` and Picard number `1 · 3/3 · (1 − 0) = 1`.
- `O_2` in `ℚ(√−11)` has discriminant `−44` and Picard number three: `2` is inert in `ℚ(√−11)`, the
  unit index is one and `2 · (1 + 1/2) = 3`. A formula without the local factor would give two.
- In `ℚ(√−7)`, `ω_D = (1 + √−7)/2` and `O_2 = ℤ + ℤ(1 + √−7) = ℤ[√−7]`, of discriminant `−28`; its
  image `ℤ + ℤ·2τ_(−7) = ℤ + ℤ(3 + i√7)` is `ℤ + ℤi√7`, the image of `ℤ[√−7]`. Its Picard number is
  `1 · 2 · (1 − 1/2) = 1`, as `2` splits.

### Examples

- `ℚ(√−7)`: `d = −7 ≡ 1 mod 4`, so `D = −7` and `𝒪_K = ℤ[(1 + √−7)/2]`, with two units. The only
  reduced form of discriminant `−7` is `(1, 1, 2)` (here `3a² ≤ 7` forces `a = 1`), so `h = 1`. The
  prime `2` splits as `((1 + √−7)/2)((1 − √−7)/2)`, of norms `2` and `2`, and `ι_K(𝒪_K) = ℤ + ℤτ_(−7)`
  with `τ_(−7) = (3 + i√7)/2`.
- `ℚ(√−23)`: the class group is cyclic of order three; `(2, 1, 3)` and `(2, −1, 3)` represent the two
  nontrivial classes, inverse to each other, and their composition is the principal class.
- The orders of class number one in `ℚ(√−3)` are `O_1`, `O_2` and `O_3`, of discriminants `−3`,
  `−12` and `−27`; `O_4` has discriminant `−48` and Picard number `1 · 4/3 · (1 + 1/2) = 2`.

### Dependencies

Mathlib: `QuadraticAlgebra` and its rational classification, number fields, class groups and class
numbers, `ClassGroup.mulEquiv`. Tau Ceti: the quadratic models, complex embeddings, rings of
integers, prime decomposition, units, class-group transport, binary quadratic forms and the
form–ideal correspondence, and the orders `ℤ + f𝒪_K` with their conductors and Picard groups.
GlobalNumberFields Layer 11 (orders and Picard groups) and NumberFieldArithmetic (integral
generators, integral bases, discriminants, norms, prime splitting and the class-number interfaces).

## Layer 2: analytic class-number formula and uniform finiteness

### 2.1 The quadratic character

For every fundamental discriminant `D ≠ 1`, `χ_D` is the primitive quadratic Dirichlet character of
conductor `|D|` (Davenport, Chapter 6), Tau Ceti's `TauCeti.Multiquadratic.fundamentalDiscriminantChar`, a
`DirichletCharacter ℤ q` with `q = D.natAbs`; Mathlib's `Int.IsFundamentalDiscr.ne_zero` gives
`D ≠ 0` and the `NeZero q` instance. Tau Ceti gives primitivity
(`TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantChar`), `χ_D² = 1`
(`TauCeti.Multiquadratic.fundamentalDiscriminantChar_isQuadratic`), `χ_D ≠ 1` for `D ≠ 1`
(`TauCeti.Multiquadratic.fundamentalDiscriminantChar_ne_one`), `χ_D(−1) = sign D`
(`TauCeti.Multiquadratic.fundamentalDiscriminantChar_neg_one`), the value at `2`
(`TauCeti.Multiquadratic.fundamentalDiscriminantChar_two`), the Legendre symbol at odd primes
(`TauCeti.Multiquadratic.fundamentalDiscriminantChar_natCast_eq_legendreSym`), multiplicativity in
coprime fundamental discriminants, hence the prime-discriminant factorization
(`TauCeti.Multiquadratic.fundamentalDiscriminantChar_mul`), the splitting dictionary
`χ_D(p) = 0, 1, −1` according as `p` ramifies, splits or is inert in a quadratic field of
discriminant `D`, `2` included (`TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_zero_iff`,
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_one_iff`,
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_neg_one_iff`), nontriviality of the
complex realization `χ_D.ringHomComp (Int.castRingHom ℂ)`
(`TauCeti.Multiquadratic.ringHomComp_fundamentalDiscriminantChar_discr_ne_one`), and, from Mathlib,
the value of that realization at every argument as the cast of the integer value
(`MulChar.ringHomComp_apply`). No second fundamental-discriminant predicate is introduced.

The targets of this section are the comparison of the splitting dictionary with the explicit prime
factorizations in the models of §1.2: for squarefree `d ≠ 1` and every prime `p`,
`χ_D(p) = 0, 1, −1` exactly when `p𝒪_K` is the square of an explicit prime `(p, √d − r)`,
respectively `(p, (1 + √d)/2 − r)`, is the product of two distinct such primes, or is itself prime; and
the invariance of `χ_D` under field isomorphism: for `K ≃ₐ[ℚ] L` the characters of `disc K` and
`disc L` agree at every integer, through the invariance of the discriminant
(`NumberField.discr_eq_discr_of_algEquiv`).

*Needs:* §1.2; Mathlib `Int.IsFundamentalDiscr`, `DirichletCharacter`, `MulChar.ringHomComp_apply`,
`NumberField.discr_eq_discr_of_algEquiv`; Tau Ceti `TauCeti.Multiquadratic.fundamentalDiscriminantChar`,
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_zero_iff`,
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_one_iff`,
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_neg_one_iff`,
`QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_ne_one`,
`QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_eq_one`.

**Checks.**
- `χ_(−8)` has level and conductor `8`, not the radicand `2`: `χ_(−8)(3) = 1`, `χ_(−8)(5) = −1` and
  `χ_(−8)(7) = −1`, and `3 = (1 + √−2)(1 − √−2)` splits in `ℚ(√−2)`. No character of level `4` takes
  different values at `3` and `7`.
- `χ_(−4)(3) = −1`, and `3` is inert in `ℤ[i]`; `χ_(−7)(2) = 1`, and `2` splits in `ℚ(√−7)`;
  `χ_(−20)(2) = 0`, and `2` ramifies in `ℚ(√−5)`.

### 2.2 Analytic specialization and the exact constants

The analytic floor is Mathlib's: `DirichletCharacter.LFunction`, its equality with the `L`-series
on `Re s > 1` (`DirichletCharacter.LFunction_eq_LSeries`), the Euler product
(`DirichletCharacter.LSeries_eulerProduct`), the continuation, the functional equation of the
completed function of a primitive character (`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`)
and nonvanishing at `1` (`DirichletCharacter.LFunction_apply_one_ne_zero`, for
`χ : DirichletCharacter ℂ N` with `[NeZero N]` and `χ ≠ 1`). It is specialized with the
`q = D.natAbs` instance of §2.1 and the nontrivial complex `χ_D`. The `L`-series itself has a junk
value outside its range of convergence and is not used at `1`.

The identity `ζ_K(s) = ζ(s) L(s, χ_D)` on `Re s > 1` for a quadratic field `K`
(`TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`), the residue `L(1, χ_D)` of `ζ_K`
at `1` (`TauCeti.NumberField.dedekindZeta_residue_eq_LFunction_one`) and, at imaginary quadratic
signature with regulator one and the exact unit order `w_D`, the formula

```text
h(D) = w_D √|D| L(1, χ_D) / (2π)
```

(`TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one`; Davenport, Chapter 6) are Tau Ceti's,
for the ordinary maximal-order class number of Layer 1, not a narrow or weighted one,
as are its specializations `h = 3√3 L(1, χ_(−3))/π`, `h = 4 L(1, χ_(−4))/π` and
`h = √|D| L(1, χ_D)/π` for `D ≠ −3, −4`, as equalities in `ℂ`
(`TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_eq_neg_three`,
`TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_eq_neg_four`,
`TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne`). For every nonprincipal quadratic
`χ`, `L(s, χ)` is a positive real number at every real `s ≥ 1`, in particular at `s = 1`
(`DirichletCharacter.LFunction_apply_one_pos`, `DirichletCharacter.LFunction_pos_of_one_le`), and a
quadratic character stays quadratic after composition with a ring homomorphism of the values
(`MulChar.IsQuadratic.comp`).

The target of this section is the real form of the formula. Specialize the positivity to the complex
realization of `χ_D`, which is quadratic by `fundamentalDiscriminantChar_isQuadratic` and
`MulChar.IsQuadratic.comp` and nonprincipal by
`ringHomComp_fundamentalDiscriminantChar_discr_ne_one`, and prove that `L(1, χ_D)` is the positive
real number `2πh(D)/(w_D √|D|)` and that `h(D) ≥ √|D| L(1, χ_D)/π` for every negative fundamental
`D`, the latter because `w_D ≥ 2`. No family-uniform lower bound follows from the positivity of each
individual `L`-value.

*Needs:* §2.1; Mathlib `DirichletCharacter.LFunction`, `MulChar.IsQuadratic.comp`; Tau Ceti
`TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one`,
`DirichletCharacter.LFunction_apply_one_pos`,
`TauCeti.NumberField.Units.card_units_of_isTotallyComplex_of_discr`.

**Checks.**
- `L(1, χ_(−3)) = π/(3√3)`, `L(1, χ_(−4)) = π/4` and `L(1, χ_(−7)) = π/√7`, from `h = 1` and
  `w = 6, 4, 2`.
- The unit order matters: at `D = −4`, the formula gives `h = w · 2 · (π/4)/(2π) = w/4`, which is
  `1` for the correct `w = 4` and `1/2` if `w = 2` were used.

### 2.3 Real-character estimates with their conductor dependence

Build the real-character zero and contour estimates needed for Siegel's theorem on the continued
`L`-functions of Mathlib (Davenport, Chapter 21). Tau Ceti supplies conjugation symmetry,
`L(s̄, χ⁻¹)` the complex conjugate of `L(s, χ)` away from the pole
(`DirichletCharacter.LFunction_inv_conj`; a quadratic character is its own inverse), and the linear
bound `‖L(s, χ)‖ ≤ N‖s‖/Re s` on `Re s > 0` for nonprincipal `χ` of level `N`
(`DirichletCharacter.norm_LFunction_le_level_mul_norm_div_re`). For quadratic `χ`, `ψ` of levels `M`,
`N`, the product `ζ(s)L(s, χ)L(s, ψ)L(s, χψ)`, with `χψ = χ.mul ψ` the product character at level
`lcm(M, N)`, is on `Re s > 1` the Dirichlet series of the nonnegative coefficients
`DirichletCharacter.zetaMulPairCoeffs`, with the factors at primes dividing either level retained and
no primitivity, distinctness or conductor restriction (`DirichletCharacter.zetaMulPairCoeffs_nonneg`,
`DirichletCharacter.LSeriesHasSum_zetaMulPairCoeffs`); for nonprincipal `χ`, `ψ` its pole at `1` is
simple when `χψ` is nonprincipal and double when `χψ` is principal
(`DirichletCharacter.meromorphicOrderAt_pair_eq_neg_one`, `DirichletCharacter.meromorphicOrderAt_pair_eq_neg_two`),
and its residue after multiplication by a function analytic at `1` is computed in both cases
(`DirichletCharacter.residue_pair_mul_of_mul_ne_one`, `DirichletCharacter.residue_pair_mul_of_mul_eq_one`).
The product character is imprimitive at level `lcm(M, N)` in general. Its comparison with the
primitive character `χ′` inducing it is Mathlib's: `χ′` is `DirichletCharacter.primitive_mul` of `χ`
and `ψ` (`DirichletCharacter.primitive_mul_isPrimitive`), its conductor divides `lcm(M, N)`
(`DirichletCharacter.conductor_dvd_level`), and `DirichletCharacter.changeLevel_primitiveCharacter`
with `DirichletCharacter.LFunction_changeLevel` give

```text
L(s, χ.mul ψ) = L(s, χ′) · ∏_(p | lcm(M, N)) (1 − χ′(p) p^(−s))
```

for `s ≠ 1` or `χ′ ≠ 1`, the factors at primes dividing the conductor of `χ′` being `1`.

**The `log` bound.** Prove `‖L(1, χ)‖ ≤ 1 + log n` for every nonprincipal Dirichlet character `χ`
of level `n`, primitive or not. At `s = 1`, `DirichletCharacter.LFunction_eq_mul_integral` writes
`L(1, χ)` as the integral over `t > 1` of `S(t)/t²`, where `S(t)` is the sum of `χ(k)` over
`1 ≤ k ≤ t`; `‖S(t)‖ ≤ t` termwise and `‖S(t)‖ ≤ n` by `DirichletCharacter.norm_sum_Icc_le_level`, so
`‖L(1, χ)‖` is at most the integral of `1/t` over `1 < t ≤ n` plus the integral of `n/t²` over
`t > n`, that is `log n + 1`. The two-character comparison below uses this bound at the fixed
character and at the imprimitive product `χ.mul ψ` of level `lcm(M, N)`, not only at primitive
characters. With the class-number formula of §2.2 it gives `h(D) ≤ (w_D/2) √|D| (1 + log|D|)/π`
for every negative fundamental `D`, hence `h(D) ≤ √|D| (1 + log|D|)/π` for `D ≠ −3, −4`, in
particular for every negative fundamental `D ≡ 1 mod 8`.

**The analytic tools.** Build local holomorphic logarithms off zeros; the vertical-line and
completed-function growth bounds that the chosen shift of a smoothed Mellin contour needs beyond the
half-plane bound above; and the Mellin transform with its smoothing kernel, the shifted integral
formula, its error estimate and every interchange of sums and integrals under its convergence
bounds, the residue term being given by the residue formulas above. Mathlib's individual
nonvanishing at `1` does not supply these estimates.

**The zero-free alternative and the two-character comparison.** Prove that for each `ε > 0` either
the relevant primitive real characters have a common sufficiently small zero-free interval to the
left of `1`, which gives a uniform `q^(−ε)` lower bound at `1`, or, fixing a character with a real
zero in an explicitly chosen smaller interval, such a bound holds for every other primitive quadratic
character, with a positive constant depending on the fixed character and on `ε`. Derive both
assertions from the positivity and the contour estimates above, choosing the intervals and the
exponents and proving their inequalities. In the simple-pole case the residue at `1` is
`L(1, χ)L(1, ψ)L(1, χψ)`; the `log` bound, applied to the two factors other than the one being
bounded, turns a lower bound for the residue into a lower bound for that factor. When the two
characters are equal their product is principal, and the double-pole residue
`DirichletCharacter.residue_pair_mul_of_mul_eq_one` replaces the simple-pole one. This is a complete
proof target, not an assumption that exceptional zeros do not exist.

*Needs:* §2.2; Mathlib `DirichletCharacter.LFunction`, `DirichletCharacter.primitive_mul`,
`DirichletCharacter.LFunction_changeLevel`, `mellin`; Tau Ceti
`DirichletCharacter.LFunction_eq_mul_integral`, `DirichletCharacter.norm_sum_Icc_le_level`,
`DirichletCharacter.norm_LFunction_le_level_mul_norm_div_re`, `DirichletCharacter.LFunction_inv_conj`,
`DirichletCharacter.zetaMulPairCoeffs`, `DirichletCharacter.zetaMulPairCoeffs_nonneg`,
`DirichletCharacter.LSeriesHasSum_zetaMulPairCoeffs`, `DirichletCharacter.meromorphicOrderAt_pair_eq_neg_one`,
`DirichletCharacter.meromorphicOrderAt_pair_eq_neg_two`, `DirichletCharacter.residue_pair_mul_of_mul_ne_one`,
`DirichletCharacter.residue_pair_mul_of_mul_eq_one`.

**Checks.**
- The product character is taken at level `lcm(M, N)`: `χ_(−4) · χ_(−4)` at level `4` is principal,
  so its primitive character is trivial of conductor `1` and `L(s, χ.mul ψ) = ζ(s)(1 − 2^(−s))`, with
  a double pole at `1` in the four-factor product; `χ_(−4) · χ_8` at level `8` is `χ_(−8)`, primitive
  of conductor `8 = lcm(4, 8)`, with no extra Euler factor.
- The `log` bound holds at imprimitive levels: `L(1, χ_(−4)) = π/4 ≈ 0.785 ≤ 1 + log 4 ≈ 2.386`, and
  `χ_(−4)` induced to level `12` has `L(1) = (π/4)(1 − χ_(−4)(3)/3) = π/3 ≈ 1.047 ≤ 1 + log 12 ≈ 3.485`.
  A bound stated only for primitive characters would not cover the product `χ.mul ψ`. The principal
  character is excluded: `L(s, 1)` has a pole at `1`.
- The class-number form gives `h(−7) = 1 ≤ √7(1 + log 7)/π ≈ 2.48` and
  `h(−23) = 3 ≤ √23(1 + log 23)/π ≈ 6.31`.

### 2.4 Siegel lower bound and finite families

Assemble the unconditional but ineffective `quadratic_LFunction_siegel` (Davenport, Chapter 21): for
every `ε > 0` there is `c_ε > 0` such that every nonprincipal primitive real Dirichlet character
`χ : DirichletCharacter ℂ q` satisfies `c_ε q^(−ε) ≤ Re L(1, χ)`, read for the real part of the
continued value. The choice of a possible auxiliary exceptional character is the source of
ineffectivity. Include its own positive `L`-value in the constant and absorb the finitely many small
conductors: the constant is uniform over the entire family, and a positive constant chosen
separately for each field does not suffice. The conductor is `|D|`, not the radicand: `χ_(−8)` enters
with `q = 8`, and `D = 1` is excluded because `L(s, χ_1) = ζ(s)` has a pole at `1`.

Combine it with §2.2 to obtain `imaginary_classNumber_lower_bound`: for every `ε > 0` there is
`C_ε > 0` with `h(D) ≥ C_ε |D|^(1/2 − ε)` for every negative fundamental `D`, stated for every
imaginary quadratic number field with `|disc K|` in place of `|D|`; it uses `w_D ≥ 2`, and the values
`w = 6, 4` at `D = −3, −4` only strengthen the inequality. With `ε = 1/4`, derive
`imaginary_discr_bounded_of_classNumber_le`: for each class-number bound `B` there is a discriminant
bound `C_B` with `|disc K| ≤ C_B` whenever `h(K) ≤ B`. Prove the finiteness of the negative
fundamental discriminants with `h(D) ≤ B`; through §1.1, the finiteness of the imaginary quadratic
fields with `h(K) ≤ B` up to isomorphism; and the squarefree-radicand form, the finiteness of the
negative squarefree `d` with `h(ℚ(√d)) ≤ B`. The results include `B = 0` and `B = 1`. Prove that
`h(D) → ∞` as `|D| → ∞` and that each class number is attained by finitely many `D`. No algorithm or
numerical exhaustion is inferred from the ineffective constant.

*Needs:* §§2.1–2.3; §1.1 (for the isomorphism and radicand forms); Mathlib `NumberField.classNumber`,
`NumberField.discr`, `DirichletCharacter.IsPrimitive`, `MulChar.IsQuadratic`; Tau Ceti
`TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one`,
`NumberField.existsUnique_neg_squarefree_algEquiv`.

**Checks.**
- By §2.2, `L(1, χ_(−3)) = π/(3√3)`, so every constant of `quadratic_LFunction_siegel` satisfies
  `c_ε ≤ (π/(3√3)) · 3^ε`; and `h(−163) = 1` forces every constant of
  `imaginary_classNumber_lower_bound` to be at most `163^(ε − 1/2)`.
- No imaginary quadratic field has class number `0`, so the discriminant bound at `B = 0` is
  vacuous; at `B = 1` every bound of `imaginary_discr_bounded_of_classNumber_le` is at least `163`.
- `χ_(−8)` has conductor `8`, not the radicand `2`, so `D = −8` enters the family with `q = 8`.

### Examples

- `D = −23`: `χ_(−23)(2) = 1` since `−23 ≡ 1 mod 8`, `h = 3`, and `h = √23 L(1, χ_(−23))/π` gives
  `L(1, χ_(−23)) = 3π/√23 ≈ 1.965`, below the `log` bound `1 + log 23 ≈ 4.135`.
- `D = −163`: `h = 1` and `w = 2` give `L(1, χ_(−163)) = π/√163 ≈ 0.246`, the smallest value among the
  nine fields.

### Dependencies

Layer 1 (§§1.1–1.2). Mathlib: Dirichlet characters and their continued `L`-functions, Euler products,
functional equation, nonvanishing at `1`, primitive characters and change of level, the Riemann and
Dedekind zeta functions, the Mellin transform. Tau Ceti: the fundamental-discriminant character and
its splitting dictionary, the factorization of the Dedekind zeta function of a quadratic field and
the class-number formula, positivity of quadratic `L`-values, the four-factor product with its
nonnegative coefficients, poles and residues, conjugation symmetry, the partial-sum and half-plane
bounds. ArithmeticDirichletSeries (generic ideal-series regrouping and Euler products).

## Layer 3: effective CM proof and the exact nine fields

The route uses level-two Siegel functions, finite-level CM reciprocity, an exact integer quartic and
certified analytic estimates (Shin, §§2, 4, 5; Stark 1969). It does not assume GRH, ABC, a
no-exceptional-zero hypothesis, the class-number-one theorem or the answer to an integral-point
problem.

### 3.1 Modular functions and the imaginary-quadratic CM dictionary

Tau Ceti supplies the subfield `Subgroup.CompactifiedQuotient.coeffSubfield` of meromorphic functions
on a compactified quotient whose Laurent `q`-expansion at a cusp has its coefficients in a given
subfield of `ℂ`, the `q`-expansion principle `Subgroup.CompactifiedQuotient.laurentQExpansion_injective`,
the order at the cusp `Subgroup.CompactifiedQuotient.orderTop_laurentQExpansion`, and the level-one
identity `F₁ = ℚ(j)` (`TauCeti.ModularGroup.coeffSubfield_cuspDatumInfty_bot`); the level-one modular
curve with its cusp charts, `TauCeti.ModularForm.j`, the biholomorphism
`TauCeti.ModularGroup.jBiholomorph` of the compactified level-one curve with the Riemann sphere, and
the finite holomorphic maps between compactified quotients of nested finite-index groups, with
their degree (`TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`).

**The fields `F_N`.** Define the field `F_N` of meromorphic modular functions of level `N` with
Fourier coefficients in `ℚ(ζ_N)` as the instance of `coeffSubfield` at the image of `Γ(N)` in
`PSL₂(ℝ)`, its cusp `∞` in the identity scaling, of width `N`, and `ℚ(ζ_N)`, and construct its
pullback and level maps. No conditional scheme–analytic connectedness hypothesis of ModularCurves is
treated as an unconditional supplier. Construct the action of `GL₂(ℤ/N)/{±1}` on `F_N`: `SL₂(ℤ/N)`
acts by fractional linear maps and `diag(1, d)` acts on Fourier coefficients by `ζ_N ↦ ζ_N^d` (Shin,
§2, pp. 2–3). Prove:

- the action is well defined and is a right action, with its multiplication order fixed by
  Convention 6;
- the fixed-field statements, among them that the fixed field of the whole group is `F₁ = ℚ(j)` and
  that, for `M | N`, the level map identifies `F_M` with the fixed field of the kernel of reduction
  modulo `M`;
- the case `N = 2`, where `±1` coincide in `GL₂(ℤ/2)`.

Only these function-field and CM comparisons are owned here; Hecke and newform theory are not
rebuilt.

**Complex uniformization.** It rests on Mathlib's period lattices `PeriodPair` and their
Weierstrass function `PeriodPair.weierstrassP`, with its locally uniform sum
(`PeriodPair.hasSumLocallyUniformly_weierstrassP`), differentiability away from the lattice
(`PeriodPair.differentiableOn_weierstrassP`), periodicity (`PeriodPair.periodic_weierstrassP`),
double pole at every lattice point (`PeriodPair.order_weierstrassP`) and differential equation
`℘′² = 4℘³ − g₂℘ − g₃` off the lattice (`PeriodPair.derivWeierstrassP_sq`), where
`g₂ = 60 Σ_(λ ≠ 0) λ^(−4)` and `g₃ = 140 Σ_(λ ≠ 0) λ^(−6)` (`PeriodPair.g₂`, `PeriodPair.g₃`).
Tau Ceti supplies, for a period lattice `Λ` with invariants `g₂`, `g₃`,
the Weierstrass curve `y² = x³ − (g₂/4)x − g₃/4` (`PeriodPair.weierstrassCurve`), which depends only on
`Λ` and changes by the variable change with `u = c` when `Λ` is rescaled by `c`
(`PeriodPair.weierstrassCurve_eq_of_lattice_eq`, `PeriodPair.weierstrassCurve_smul`), its discriminant
`g₂³ − 27g₃² ≠ 0` and `j`-invariant `1728g₂³/(g₂³ − 27g₃²)` (`PeriodPair.weierstrassCurve_Δ`,
`PeriodPair.weierstrassCurve_Δ_ne_zero`, `PeriodPair.weierstrassCurve_j`), the equality of that
`j`-invariant with the modular `j` for the lattice `ℤτ + ℤ` (`UpperHalfPlane.weierstrassCurve_j_periodPair`),
and the point map `z ↦ (℘(z), ℘′(z)/2)` off `Λ`, sending `Λ` to the point at infinity
(`PeriodPair.weierstrassPoint`), which is `Λ`-periodic, odd and the point at infinity exactly on `Λ`
(`PeriodPair.weierstrassPoint_add_coe`, `PeriodPair.weierstrassPoint_neg`,
`PeriodPair.weierstrassPoint_eq_zero_iff`), has holomorphic lifts to projective coordinates near every
point (`PeriodPair.exists_analyticAt_toAffine_eq_weierstrassPoint`), is injective near every lattice
point (`PeriodPair.exists_mem_nhds_injOn_weierstrassPoint`) and is surjective
(`PeriodPair.weierstrassPoint_surjective`). Mathlib's `℘` has the junk value `0` on the lattice; it
does not itself send that point to infinity. The uniformization itself is ModularForms §10D, consumed
here: for a lattice `Λ` with Weierstrass curve `E_Λ`, the point map induces a bijective group
isomorphism `ℂ/Λ → E_Λ(ℂ)`; every elliptic curve over `ℂ` is isomorphic to `E_Λ` for a lattice
`Λ = ℤ + ℤz`; `℘_(αΛ)(αu) = α⁻²℘_Λ(u)`; and every isomorphism `E_Λ → E_(Λ′)` is induced by `u ↦ αu`
for a unique `α` with `αΛ = Λ′`. ModularCurvesPartII §1.1, also consumed here, makes the same map a
pointed biholomorphism `ℂ/Λ ≅ E_Λ^an` onto the analytification of the curve, compatible with the
group laws. No part of the uniformization is a target of this roadmap.

**The CM dictionary.** Prove that lattices with endomorphism ring `O_f`, up to homothety, correspond
to `Pic(O_f)`; that `j(τ)` determines the homothety class of `ℤ + ℤτ`; and that the lattice
`ℤ + ℤτ_D` has endomorphism ring `𝒪_K` (§1.4 at `f = 1`). Export the ideal-class action of `Pic(𝒪_K)`
on the CM `j`-values and Artin reciprocity for the Hilbert class field `H_K = K(j(τ_D))`, obtained
through ClassFieldTheory Layer 13's Hilbert class field `TauCeti.ClassFieldTheory.hilbertClassField`
and its Artin isomorphism `TauCeti.ClassFieldTheory.hilbertClassArtinEquiv`, with the convention
comparison of Convention 6.

**Finite-level reciprocity** (Shin, §2: the group `W_(N,τ_K)`, p. 4, and Proposition 2.5, p. 5).
With `τ_D` of Convention 5, of minimal polynomial `X² + BX + C`, prove that `s τ_D + t` with
`s, t ∈ ℤ` acts on the values of level-`N` functions at `τ_D` through the multiplication matrix

```text
[[t − Bs, −Cs], [s, t]]
```

(the matrix of multiplication by `sτ_D + t` on the basis `(τ_D, 1)`), and identify the kernel of this
action with the image of the **actual units** of `𝒪_K`. In particular derive the
exceptional kernels for `D = −3, −4` instead of quotienting by `{±1}` there. Export the conductor and
ray-degree formula `[K_(N) : H_K]` and the comparison of a norm from `K_(N)` to `H_K` with the product
of the conjugates, for the levels `2, 3, 6, 8` used below.

*Needs:* Layer 1 (§§1.1, 1.3–1.4); ClassFieldTheory Layers 10–13; ModularForms §10D;
ModularCurvesPartII §1.1; Mathlib `PeriodPair`,
`WeierstrassCurve`, `UpperHalfPlane`, `CongruenceSubgroup.Gamma`; Tau Ceti
`Subgroup.CompactifiedQuotient.coeffSubfield`, `Subgroup.CompactifiedQuotient.laurentQExpansion_injective`,
`TauCeti.ModularGroup.coeffSubfield_cuspDatumInfty_bot`, `TauCeti.ModularGroup.jBiholomorph`,
`PeriodPair.weierstrassCurve`, `PeriodPair.weierstrassPoint`, `PeriodPair.weierstrassPoint_surjective`,
`UpperHalfPlane.weierstrassCurve_j_periodPair`, `TauCeti.ClassFieldTheory.hilbertClassField`,
`TauCeti.ClassFieldTheory.hilbertClassArtinEquiv`, `TauCeti.ClassFieldTheory.rayClassField`,
`TauCeti.ClassFieldTheory.finrank_rayClassField`, `TauCeti.ClassFieldTheory.ringClassField`,
`TauCeti.ClassFieldTheory.ringClassArtinEquiv`.

**Checks.**
- At `N = 2` the matrices `±1` coincide, so the group acting on `F_2` is `GL₂(ℤ/2)`, of order six, not
  a quotient of order three.
- `τ_(−4) = i` and `τ_(−3) = (3 + i√3)/2 = (−1 + i√3)/2 + 2`, so `j(τ_(−4)) = 1728` and `j(τ_(−3)) = 0`.
  The minimal polynomial of `τ_(−3)` is `X² − 3X + 3`, and `ℤ + ℤτ_(−3)` is the image of
  `ℤ[(1 + √−3)/2]`. The point `i√3/2`, the recipe for `D ≡ 0 mod 4` applied to `D = −3`, satisfies
  `4X² + 3 = 0`, and its lattice has endomorphism ring the order of discriminant `−48`, not `𝒪_K`.
- For `D = −4` (`B = 0`, `C = 1`) the multiplication matrices of the units `±1, ±i` are `±1` and
  `±[[0, −1], [1, 0]]`. The kernel of the reciprocity action contains the matrix of multiplication by
  `i`; quotienting only by `±1` gets the degree of `K_(N)` over `H_K` wrong by a factor two for every
  `N ≥ 2`.
- For `2` inert and `D ≠ −3`, `[K_(2) : H_K] = #(𝒪_K/2)ˣ / #(image of 𝒪_Kˣ) = 3/1 = 3`, the units
  `±1` being `1` modulo `2`; for `D = −3` the six units map onto `𝔽₄ˣ` and the degree is one.

### 3.2 Siegel functions with exact phases

For `r = (r₁, r₂) ∈ ℚ² ∖ ℤ²`, the nonvanishing holomorphic function

```text
g_r(τ) = −exp(πi B₂(r₁) τ) exp(πi r₂(r₁ − 1)) (1 − exp(2πi(r₁τ + r₂)))
         · ∏_(n ≥ 1) (1 − qⁿ exp(2πi(r₁τ + r₂))) (1 − qⁿ exp(−2πi(r₁τ + r₂)))
```

is Tau Ceti's `TauCeti.ModularForm.siegelFunction r`, with locally uniform convergence of the product
(`TauCeti.ModularForm.hasProdLocallyUniformlyOn_siegelFunction`), holomorphy
(`TauCeti.ModularForm.differentiableOn_siegelFunction`), nonvanishing
(`TauCeti.ModularForm.siegelFunction_ne_zero`), translation in `r`
(`TauCeti.ModularForm.siegelFunction_add_intCast`) and the transformation under `τ ↦ τ + 1`
(`TauCeti.ModularForm.siegelFunction_apply_add_one`). The level-two identities are Tau Ceti's:
`g₀g₁g₂ = 2ζ₈` (`TauCeti.ModularForm.siegelFunction_zero_half_mul_half_zero_mul_half_half`); Weber's
cubic `(X + 16)³ − jX`, whose roots are the `g_i¹²`
(`TauCeti.ModularForm.prod_X_sub_C_siegelFunction_pow_twelve`), with its `SL₂(ℤ)`-invariance
(`TauCeti.ModularForm.prod_X_sub_C_siegelFunction_pow_twelve_smul`); the eta quotients
`g₀ = 2i(η(2τ)/η(τ))²`, `g₁ = −(η(τ/2)/η(τ))²` and `g₂ = −exp(−πi/3)(η((τ + 1)/2)/η(τ))²`
(`TauCeti.ModularForm.siegelFunction_zero_half_eq_eta`, `TauCeti.ModularForm.siegelFunction_half_zero_eq_eta`,
`TauCeti.ModularForm.siegelFunction_half_half_eq_eta`); and the `S`-transformations
(`TauCeti.ModularForm.siegelFunction_zero_half_apply_neg_one_div`,
`TauCeti.ModularForm.siegelFunction_half_zero_apply_neg_one_div`,
`TauCeti.ModularForm.siegelFunction_half_half_apply_neg_one_div`).

The targets, for general `r`, are:

- the `q`-order of `g_r` at the cusps, `B₂(⟨r₁⟩)/2` at `∞`, with `⟨r₁⟩` the fractional part (Shin,
  Proposition 2.3(i), p. 3);
- the `SL₂(ℤ)` transformation law `g_r ∘ γ = ε(r, γ) g_(rγ)` with its explicit root-of-unity factor
  `ε(r, γ)` (Shin, Proposition 2.3(ii), p. 4, for `c > 0`), and the diagonal cyclotomic action on
  Fourier coefficients;
- the inverse, product and level APIs and the finite-support exponent families `∏ g_r^(m(r))`;
- the congruence criterion making such a product a modular function of level `N` (Shin,
  Proposition 2.1, p. 3), and the power `12N/gcd(6, N)`: for `r ∈ (1/N)ℤ² ∖ ℤ²`, `g_r^(12N/gcd(6, N))`
  is a modular function of level `N` (Shin, Remark 2.2, p. 3);
- integrality of the `g_r` over `ℤ[j]` (Shin, Proposition 2.3(vi), p. 4), and at CM points, through
  §3.1, algebraic integrality of their values.

**The cube root `γ₂`.** Construct the holomorphic cube root `γ₂` of `j` with leading Fourier term
`q^(−1/3)`, and prove `γ₂ = (g_i¹² + 16)/g_i⁴` for each `i` (Shin, Lemma 4.1(ii), p. 12): Weber's
cubic gives that the right-hand side cubes to `j`, and the identification with the normalized cube
root is a modular-function comparison by `q`-expansion uniqueness with the precise leading
coefficient, not an arbitrary choice of cube root. Mathlib's eta normalization is the only one used;
ratios eliminate any common constant.

*Needs:* §3.1; Mathlib `ModularForm.eta`, `UpperHalfPlane`; Tau Ceti `TauCeti.ModularForm.siegelFunction`,
`TauCeti.ModularForm.prod_X_sub_C_siegelFunction_pow_twelve`,
`TauCeti.ModularForm.siegelFunction_zero_half_mul_half_zero_mul_half_half`, `TauCeti.ModularForm.j`.

**Checks.**
- The `q`-orders of `g₀`, `g₁`, `g₂` at `∞` are `B₂(0)/2 = 1/12`, `B₂(1/2)/2 = −1/24` and `−1/24`. They sum
  to `0`, as they must for the constant product `2ζ₈`.
- The power `12N/gcd(6, N)` is `12` at `N = 2, 3, 6` and `48` at `N = 8`, consistent with the `g_i¹²`
  being level-two functions.
- At `τ = i`, `j = 1728 = 12³`, `γ₂(i) = 12` (the real cube root, as the `q`-expansion has real
  coefficients and `q` is real), and Weber's cubic is `X³ + 48X² − 960X + 4096 = (X − 8)²(X + 64)`.
  So `{g₀(i)¹², g₁(i)¹², g₂(i)¹²} = {8, 8, −64}`, with product `−4096 = (2ζ₈)¹²`; `g₀(i)⁴ = 2` and
  `(8 + 16)/2 = 12`, and the root `−64` has `g⁴ = −4` and `(−64 + 16)/(−4) = 12`. A cube root of `j`
  normalized by another cube root of unity, `12ζ₃`, fails this identity.

### 3.3 Level-two norms and the genuine small-power CM comparison

For `D ≠ −3, −4` and `2` not inert, let `α = g₀(τ_D)` and `x = Norm_(K_(2)/H_K)(α¹²)`. Derive its
expression as a product over the correct unit-quotient matrix group, and prove that `x` is nonzero,
real, integral, lies in `H_K` and divides `2¹²`. Prove (Shin, Theorem 4.6, pp. 13–14, (19)–(20))

```text
j(τ_D) = (256 − x)³ / x²   if D ≡ 0 mod 4,
j(τ_D) = (x + 16)³ / x     if D ≡ 1 mod 8.
```

For `2` inert and `3` unramified, prove **the small-power field inclusion**, not merely a high-power
statement (Stark 1969; Shin, Theorem 4.8, p. 15). Write `ξ = ζ₈α` in this branch. Prove that `ξ`
lies in `K_(2)`, is real and integral, and generates `K_(2)` over `H_K`, and that `γ₂(τ_D)` lies in
`H_K` and is real and integral. First `α⁴ ∈ K_(2)`, using its membership at level six and the fact that the possible cubic
degree divides the degree `2` or `4` of `K_(6)/K_(2)`. Then `ζ₈⁻¹α³` is fixed by the full group of the
level-eight field over the level-two field, by explicit generating matrices and all root-of-unity
phases, so its quotient with `α⁴` gives `ξ`. Exclude `ζ₃` from `K_(2)` by ramification at `3` before
identifying the other conjugates of `α⁴`. Derive their exact cubic and the generator claims: the three
conjugates of `ξ⁴` over `H_K` are the roots of `X³ − γ₂(τ_D)X − 16`, so that when `h(K) = 1` the
fourth-power cubic of the minimal polynomial of `ξ` over `ℚ` is `X³ − γ₂(τ_D)X − 16`. Proving only
`α¹² ∈ K_(2)` leaves this step undischarged.

When the class number is one, `H_K = K` by `TauCeti.ClassFieldTheory.finrank_hilbertClassField`, and a
real algebraic integer of `K` is a rational integer: under any complex embedding, an algebraic integer
of an imaginary quadratic field has real image exactly when it is a rational integer
(`NumberField.RingOfIntegers.mem_range_algebraMap_iff_star_eq_of_isTotallyComplex`), and for
`K ⊆ ℂ` the minimal polynomial over `K` of a real algebraic integer is its minimal polynomial over `ℤ`
(`NumberField.minpoly_eq_map_minpoly_int_of_star_eq_of_isTotallyComplex`). The exceptional fields and
the branch with `2` inert and `3` ramified keep separate computations.

*Needs:* §§3.1–3.2; Tau Ceti `TauCeti.ClassFieldTheory.finrank_hilbertClassField`,
`NumberField.RingOfIntegers.mem_range_algebraMap_iff_star_eq_of_isTotallyComplex`,
`NumberField.minpoly_eq_map_minpoly_int_of_star_eq_of_isTotallyComplex`,
`TauCeti.NumberField.card_units_quotient_span_natCast_of_prime`,
`TauCeti.ModularForm.prod_X_sub_C_siegelFunction_pow_twelve`.

**Checks.**
- `D = −7` (`D ≡ 1 mod 8`, `h = 1`, `K_(2) = H_K = K`): `j(τ_(−7)) = −3375`, and `(x + 16)³/x = −3375`
  becomes `(x + 1)(x² + 47x + 4096) = 0`, whose only real root is `x = −1`; indeed
  `g₀(τ_(−7))¹² = −4096 e^(−π√7) ∏(1 + qⁿ)²⁴ ≈ −1` with `q = −e^(−π√7)`.
- `D = −8` (`D ≡ 0 mod 8`, `h = 1`): `j(τ_(−8)) = 8000`, and `(256 − x)³/x² = 8000` becomes
  `(x + 64)(x² + 7168x − 262144) = 0`, whose only rational root is `x = −64`. It is `g₀¹² g₂¹²` at
  `τ = i√2`, approximately `0.5685 · (−112.57)`.
- In both cases `|x|^(1/12) ≥ 1`, consistent with §3.4, whose bound needs `D ≤ −31`.
- A high power lying in a field does not put the value there: `ζ₈⁴ = −1 ∈ ℚ` while `ζ₈` has degree four
  over `ℚ`. This is why `α¹² ∈ K_(2)` is not enough.

### 3.4 Effective analytic bounds and the two easy splitting branches

Assume `h(K) = 1` throughout the two splitting-branch exclusions in this section. With
`A = |q| ∈ (0, 1)`, the bounds (Shin, Lemma 5.1)

```text
|g_(a,b)(τ)| ≤ A^(B₂(a)/2) exp(2A^a/(1 − A))                  for a ≤ 1/2,
|g_(0,b)(τ)| ≤ A^(1/12) |1 − exp(2πib)| exp(2A/(1 − A))
```

are `TauCeti.ModularForm.norm_siegelFunction_le_of_le_half` and
`TauCeti.ModularForm.norm_siegelFunction_le_of_apply_zero_eq_zero`. Their numerical consequences are
`2A^(1/24) exp((2A + 2A^(1/2))/(1 − A)) < 1` for `0 < A ≤ e^(−π√31)` and
`√3 A^(1/36) exp((2A + 4A^(1/3))/(1 − A)) < 1` for `0 < A ≤ e^(−π√51)`
(`TauCeti.ModularForm.level_two_bound_lt_one`, `TauCeti.ModularForm.level_three_bound_lt_one`),
`|g₀(τ)| < 1` and `|g₀(τ) g_(1/2,b)(τ)| < 1` for every `b` when `Im τ ≥ √31/2`
(`TauCeti.ModularForm.norm_siegelFunction_zero_half_lt_one`,
`TauCeti.ModularForm.norm_siegelFunction_zero_half_mul_lt_one`), and
`|g_(0,1/3)(τ) g_(a,b)(τ) g_(a′,b′)(τ)| < 1` for `Im τ ≥ √51/2` and `a, a′ ∈ {1/3, 2/3}`
(`TauCeti.ModularForm.norm_siegelFunction_zero_third_mul_mul_lt_one`).

**The branch `2` not inert.** For `D ≤ −31` and `2` not inert, the nonzero **integer** norm `x` of §3.3
satisfies, branch by branch (Shin, Theorem 4.6, (19), and Theorem 5.2(i)),

```text
|x|^(1/12) = |g₀(τ_D)|                if D ≡ 1 mod 8,
|x|^(1/12) = |g₀(τ_D) g_(1/2,1/2)(τ_D)|  if D ≡ 0 mod 8,
|x|^(1/12) = |g₀(τ_D) g_(1/2,0)(τ_D)|    if D ≡ 4 mod 8,
```

where `Im τ_D = √|D|/2 ≥ √31/2`. Prove these product comparisons through the norm-as-product statement
of §3.1. The first value is bounded by `norm_siegelFunction_zero_half_lt_one` and the other two by
`norm_siegelFunction_zero_half_mul_lt_one`; the bound on `|g₀|` alone does not cover `D ≡ 0 mod 4`. So
`|x| < 1` contradicts `x ∈ ℤ ∖ {0}`, and only `D > −31` remains in this branch.

**The branch `2` inert, `3` ramified.** For `2` inert and `3` ramified with `D ≠ −3`, prove
`D ≡ 21 mod 24` and compute the three conjugates of `g_(0,1/3)¹²` through the actual level-three
matrices. Their product, the norm, is a nonzero integer bounded by the level-three estimate at
`Im τ_D ≥ √51/2`, which rules out `D ≤ −51`.

Every remaining fundamental discriminant in either branch has `D > −51`, where
`TauCeti.NumberField.classNumber_eq_one_iff_of_neg_fifty_one_lt_discr` decides class number one by the
reduced-form count. A floating-point approximation is not a proof of a strict inequality.

*Needs:* §§3.1, 3.3; Tau Ceti `TauCeti.ModularForm.norm_siegelFunction_zero_half_lt_one`,
`TauCeti.ModularForm.norm_siegelFunction_zero_half_mul_lt_one`,
`TauCeti.ModularForm.norm_siegelFunction_zero_third_mul_mul_lt_one`,
`TauCeti.NumberField.classNumber_eq_one_iff_of_neg_fifty_one_lt_discr`.

**Checks.**
- In the branch `D ≡ 0 mod 4`, `|x|^(1/12)` is a product `|g₀(τ_D) g_(1/2,b)(τ_D)|`. At `A = e^(−π√31)`
  the bound on `|g₀|` is about `0.466`, but the factor `g_(1/2,b)` has leading term of absolute value
  `A^(−1/24) > 1` and its bound `A^(−1/24) exp(2A^(1/2)/(1 − A))` is about `2.07`; so the estimate for
  `|g₀|` alone leaves `D ≡ 0 mod 4` open, while the product bound `2A^(1/24) exp((2A + 2A^(1/2))/(1 − A))`,
  about `0.965`, closes it.
- The level-three bound at `A = e^(−π√51)` is about `0.931 < 1`.
- The fundamental discriminants with `2` inert and `3` ramified are `D ≡ 21 mod 24`: `−3, −51, −123,
  −195, …`. After excluding `−3`, all have `D ≤ −51`, so this branch contributes no field, in
  agreement with `h(−51) = 2`.
- The survivors of the branch `2` not inert with `−31 < D` are `−4, −7, −8, −15, −20, −23, −24`; of
  these, `−4` is exceptional, `−7` and `−8` have class number one, and the others have class numbers
  `2, 2, 3, 2`.

### 3.5 An explicit integer equation, effective bounds and exact exhaustion

The complete integer-solution set of the fixed Heegner quartic

```text
y² = 2u(u³ + 1)
```

is `(u, y) = (−1, 0), (0, 0), (1, ±2), (2, ±6)`, in both directions:
`TauCeti.sq_eq_two_mul_mul_pow_three_add_one_iff`, proved by an algebraic descent (the coprime factors
`u` and `u³ + 1` are squares up to powers of `2`, leaving the equations `x³ = 2y² + 1` in `ℤ[√−2]`,
`m⁶ + 1 = 2s²` and `s² = 8m⁶ + 1`), with no effective height bound, interval reduction or Siegel
finiteness theorem for integral points.

For the remaining class-number-one branch of §3.3, write the minimal polynomial of `ξ` over `ℚ` as
`X³ + aX² + bX + c` with `a, b, c ∈ ℤ`; its fourth-power cubic is `X³ − γ₂(τ_D)X − 16` by §3.3. The
Newton-identity computation `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff` says that this happens
exactly when `c = ±2` and `a = −cu`, `b = 4u² − 2y` for an integer point `(u, y)` of the quartic, with
`γ₂(τ_D)` the explicit polynomial `TauCeti.heegnerGamma` of `u, y`;
`TauCeti.mem_of_tschirnhausPolynomial_X_pow_four_eq` lists the twelve coefficient triples and
`TauCeti.mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq` gives

```text
γ₂(τ_D) ∈ {0, −32, −96, −960, −5280, −640320}.
```

The target of this section is the application: supply the irreducibility and degree comparisons
needed to replace the cubic of §3.3 by the minimal polynomial of `ξ` over `ℚ`, with the exact
embeddings, so that `tschirnhausPolynomial_X_pow_four_eq_iff` applies to `γ = γ₂(τ_D)` in `ℂ`.

*Needs:* §3.3; Mathlib `minpoly`, `Polynomial`; Tau Ceti `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff`,
`TauCeti.mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq`, `TauCeti.heegnerGamma`.

**Checks.**
- The solution set includes `u = −1, 0` and both signs of `y`. The fourth-power cubic of `X³ − 2` is
  `X³ − 16`, with `γ = 0`, from `(u, y) = (0, 0)`; `X³ + 2X² + 4X + 2` has fourth-power cubic
  `X³ + 96X − 16`, with `γ = −96`, from `(u, y) = (−1, 0)`.
- `TauCeti.heegnerGamma` at the six points `(0, 0), (1, 2), (−1, 0), (2, 6), (1, −2), (2, −6)` takes
  the values `0, −32, −96, −960, −5280, −640320`, the cube roots of `j(τ_D)` at
  `D = −3, −11, −19, −43, −67, −163`.

### 3.6 Recovering D and the field theorem

Prove the uniqueness of the imaginary quadratic order from its CM `j`-value by the lattice and
endomorphism dictionary of §3.1. Compute and certify the singular values `γ₂(τ_D)` for
`D = −3, −11, −19, −43, −67, −163`, by exact modular identities or rigorous `q`-expansion enclosures
with explicit tails combined with the integrality of §3.3. In the six-value branch, `j = γ₂³` recovers
`D ∈ {−3, −11, −19, −43, −67, −163}`; its hypotheses exclude `−3`. Combine this with §3.4 and the
exceptional fields to obtain exactly the nine fundamental discriminants (Shin, Theorem 5.2, Table 1).
The converse, class number one for every listed discriminant, is
`TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants`, by the reduced-form count of
§1.3; the nine positive radicands and the nine values `−D` are `TauCeti.heegnerNumbers` and
`TauCeti.heegnerDiscriminants`. Class number one is never inferred from an approximately integral
singular value.

Export:

- the intrinsic theorem `classNumber_eq_one_iff_discr_mem`: an imaginary quadratic field has class
  number one iff `−disc K` is one of the nine values of `TauCeti.heegnerDiscriminants`;
- the negative-squarefree-radicand theorem `classNumber_eq_one_iff_negative_squarefree_mem`: for an
  imaginary quadratic field generated by an algebraic integer with minimal polynomial `X² − d`, `d`
  squarefree, the class number is one iff `−d` is one of the nine values of `TauCeti.heegnerNumbers`;
- the fundamental-discriminant theorem: for a negative fundamental discriminant `D`, `h(D) = 1` iff
  `−D ∈ heegnerDiscriminants`;
- the equivalent forms with `𝒪_K` a principal ideal ring, a UFD, and the maximal order having trivial
  Picard group, through §1.2 and `TauCeti.GlobalNumberFields.maximalOrderPicEquiv`;
- the isomorphism formulation, with the explicit `ℚ`-algebra equivalences of each such field with
  `QuadraticAlgebra ℚ d 0` for its radicand `d ∈ {−1, −2, −3, −7, −11, −19, −43, −67, −163}`.

As a separate consequence of this field theorem and the order theory of §1.4, prove
`pic_eq_one_iff_discr_mem`: an order `O` of an imaginary quadratic field has Picard number one iff its
discriminant is one of the thirteen order discriminants

```text
−3, −4, −7, −8, −11, −12, −16, −19, −27, −28, −43, −67, −163.
```

Route: by `TauCeti.GlobalNumberFields.NumberFieldOrder.eq_intAddMulOrder_index` and
`TauCeti.GlobalNumberFields.NumberFieldOrder.discr_intAddMulOrder_of_finrank_eq_two`, `O = O_f` with
`f` its index and `disc O = f²D`; by `TauCeti.GlobalNumberFields.NumberFieldOrder.card_pic_intAddMulOrder_eq_one_iff`,
`Pic(O_f)` is trivial iff `h(K) = 1` and either `f = 1`, or `f = 2` with `D ≡ 1 mod 8`, or `D = −3`
with `f ∈ {2, 3}`, or `D = −4` with `f = 2`. Among the nine fields only `D = −7` has `D ≡ 1 mod 8`,
giving `−28`; `D = −3` gives `−12` and `−27`; `D = −4` gives `−16`. Conversely each of the thirteen
values has a unique decomposition `f²D` with `D` fundamental, which the criterion accepts. This
statement keeps the proper invertible Picard convention and does not call a nonmaximal order Dedekind
or a UFD. Recover the nine fields by the maximal-order specialization, and show that distinct
conductors of one field give no additional field isomorphism classes.

*Needs:* §§1.2–1.4, 3.1–3.5; Tau Ceti `TauCeti.heegnerNumbers`, `TauCeti.heegnerDiscriminants`,
`TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants`,
`TauCeti.NumberField.classNumber_eq_one_iff_of_neg_fifty_one_lt_discr`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.card_pic_intAddMulOrder_eq_one_iff`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.eq_intAddMulOrder_index`,
`TauCeti.GlobalNumberFields.NumberFieldOrder.discr_intAddMulOrder_of_finrank_eq_two`,
`TauCeti.GlobalNumberFields.maximalOrderPicEquiv`.

**Checks.**
- The thirteen discriminants decompose as `−12 = 2² · (−3)`, `−16 = 2² · (−4)`, `−27 = 3² · (−3)` and
  `−28 = 2² · (−7)`, the other nine being fundamental. `−44 = 2² · (−11)` is excluded: its Picard number
  is three (§1.4).
- In the six-value branch, `−11, −19, −43, −67, −163` are `≡ 5 mod 8` (so `2` is inert) and prime to `3`,
  as the branch requires, while `−7` (`≡ 1 mod 8`) and `−8` (`2` ramified) belong to the branch of
  §3.4, and `−3, −4` are the exceptional fields.
- `j(τ_(−163)) = −640320³`, from `γ₂(τ_(−163)) = −640320`.
- The radicand form needs squarefreeness: `θ = 2i` presents `ℚ(i)` with `d = −4`, and `4` is not one of
  the nine values although `ℚ(i)` has class number one.

### Examples

- `D = −163`: `τ_(−163) = (3 + i√163)/2`, `2` is inert (`−163 ≡ 5 mod 8`) and `3` is unramified, so the
  field lies in the six-value branch; the minimal polynomial of `ξ` corresponds to the integer point
  `(u, y) = (2, −6)`, and `γ₂(τ_(−163)) = −640320`.
- `D = −51`: `2` inert and `3` ramified (`−51 ≡ 21 mod 24`), so §3.4 excludes it, consistently with its
  two reduced forms `(1, 1, 13)` and `(3, 3, 5)`.
- `D = −15`: `D ≡ 1 mod 8`, so §3.4's first branch applies but `−15 > −31`; it is decided by the
  reduced-form count, with the two forms `(1, 1, 4)` and `(2, 1, 2)`.

### Dependencies

Layer 1 (all sections); Layer 2 is not used. ClassFieldTheory Layers 10–13 (global reciprocity,
existence, the Hilbert, ray and ring class fields with their Artin isomorphisms and ray degrees).
ModularForms §10D and ModularCurvesPartII §1.1 (the complex uniformization of elliptic curves).
Mathlib: modular forms and the
eta function, the upper half-plane and congruence subgroups, period lattices and the Weierstrass
`℘`-function, Weierstrass curves, minimal polynomials. Tau Ceti: the
compactified modular curves with their `q`-expansion fields and `F₁ = ℚ(j)`, `j` and its biholomorphism
with the sphere, the Weierstrass curve and point map of a lattice, the Siegel functions with their
level-two identities and bounds, the Heegner quartic and the fourth-power cubic, the nine-field
converse and the enumeration above `−51`, the Picard-one criterion for `O_f`, the real integers of an
imaginary quadratic field and the class fields.

## Downstream consumers

- AbelianSchemesAndArithmeticModuliPartII: §3.6 (the nine maximal-order class-number-one fields).
- AdelicImagesAndModularCurves: §3.6 (the thirteen orders of Picard number one).
- AnalyticNumberTheoryPartI: §2.2 only (`ζ_K = ζ · L(s, χ_D)` and the class-number formula).
- AnticyclotomicLocalUnits: §1.3, §§2.1–2.2 and the class-number upper bound of §2.3
  (`h(D) ≤ √|D|(1 + log|D|)/π` for negative fundamental `D ≡ 1 mod 8`, which gives its
  `h(D) ≤ √|D|(2 + log|D|)/π`).
- ArithmeticStatisticsPartVII: §3.1 (the CM dictionary and finite-level reciprocity).
- BianchiModularForms: §1.4, §3.1 and §3.6.
- CMRankZeroConverse: §3.1.
- ComplexMultiplicationAndExplicitReciprocity: §3.1.
- EffectiveClassNumbers: §§1.1–1.3, §§2.1–2.2, the statements of §2.4 and §3.1; it states lower
  bounds for `h(K)` of Goldfeld's type with effective constants.
- EllipticCurveModularityPartII: §3.6.
- EllipticCurvePeriodsAndModularParametrizations: §1.4 and §3.1.
- ErdosProgressionPowers: §3.1.
- EulerSystemsAndKolyvaginSystems: §1.4.
- ExplicitNumberFields: §2.2.
- GrossZagierAndArithmeticHeights: §§1.2–1.4 and §3.1.
- HeegnerPointEulerSystems: §1.4.
- HilbertModularSurfaces: §§1.3–1.4 and §2.2.
- NoncommutativeAndEquivariantIwasawa: §§3.1–3.2.
- OrthogonalTamagawaAndLatticeMass: §1.4 and §2.2.

## Scope and ownership

**This roadmap owns** the imaginary-quadratic specializations and comparison maps above: the
distinguished embedding of a presented field and its naturality (§1.1); the exceptional unit
generators (§1.2); the complex-lattice form of the form–ideal correspondence (§1.3) and of the orders
`O_f` (§1.4); the comparisons of `χ_D` with the explicit factorizations and under isomorphism (§2.1);
the real form of the class-number formula (§2.2); the real-character estimates, the `log` bound and
the zero-free alternative (§2.3); Siegel's theorem in its classical ineffective form and its
class-number consequences (§2.4); the level-`N` function fields and their `GL₂(ℤ/N)/{±1}` action,
the CM dictionary and finite-level CM reciprocity (§3.1); the Siegel-function theory beyond the level-two identities, and
`γ₂` (§3.2); the level-two norms and the small-power comparison (§3.3); the branch exclusions
(§3.4); the application of the quartic (§3.5); and the class-number-one theorem, its equivalent forms
and the thirteen orders (§3.6).

**Already in the library and consumed by name.** The quadratic models and their isomorphism
classification, the distinguished complex embedding of the model, the rings of integers, prime
decomposition, units and class-group transport of §§1.1–1.2; the form–ideal correspondence, reduced
forms, Dirichlet composition and the point `root` of §1.3; the orders `O_f`, their conductors,
discriminants, Picard groups and class-number formula, and the identification of `O_f` with the
canonical order of discriminant `f²D`, of §1.4; the character `χ_D` and its values, including the
complex realization at every argument, of §2.1; the factorization `ζ_K = ζ · L(s, χ_D)`, the residue,
the class-number formula and positivity of quadratic `L`-values of §2.2; the four-factor product, its
poles and residues, conjugation symmetry and the partial-sum and half-plane bounds of §2.3; the
`q`-expansion fields and `F₁ = ℚ(j)`, the Weierstrass curve and point map of a lattice and the class
fields with their Artin isomorphisms of §3.1; the Siegel functions and their level-two identities of
§3.2; the statement that real algebraic integers of an imaginary quadratic field are rational integers,
with its minimal-polynomial form, used in §3.3; the Siegel-function bounds of §3.4; the integer points
of the quartic and the fourth-power cubic of §3.5; and the nine-field converse, the enumeration above
`−51` and the Picard-one criterion for `O_f` of §3.6. The supplier contracts below list them.

**Owned elsewhere.**
- Orders, conductors, invertible proper ideals and Picard groups of general number fields:
  [GlobalNumberFields](../../Completed/GlobalNumberFields/README.md) Layer 11.
- Integral generators, quadratic integral bases, discriminants, norms, finite-prime splitting and the
  class-number and Minkowski interfaces:
  [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md); their actual statements,
  including minimal-polynomial and generation hypotheses, are reused, and the comparison from each
  concrete model to those presentations is built here.
- Global reciprocity, existence, the Hilbert, ray and ring class fields:
  [ClassFieldTheory](../ClassFieldTheory/README.md) Layers 10–13; its arithmetic existence and
  ray-degree statements are consumed, not just a generic class-formation structure.
- The combinatorial weighted Hurwitz class number, which is not `NumberField.classNumber` and separates
  exceptional automorphisms and imprimitive forms: [ModularForms](../ModularForms/README.md) Layer 11.
- Complex uniformization of elliptic curves: ModularForms §10D, namely the bijective group
  isomorphism `ℂ/Λ → E_Λ(ℂ)` given by the point map, a lattice for every elliptic curve over `ℂ`, the
  homogeneity of `℘` and the isomorphisms `E_Λ → E_(Λ′)` as homotheties; and
  [ModularCurvesPartII](../ModularCurvesPartII/README.md) §1.1, the same isomorphism as a pointed
  biholomorphism onto the analytification of `E_Λ`.
- Analytic modular curves, arithmetic moduli and algebraic torsion and isogeny APIs, within their
  stated scopes: ModularForms, [ModularCurves](../ModularCurves/README.md) and
  [EllipticCurves](../EllipticCurves/README.md). EllipticCurves excludes complex uniformization in its
  opening scope, and ModularCurves keeps its scheme–analytic connectedness comparison an explicit
  hypothesis (ModularCurves §5.3); these roadmaps do not by their names supply CM reciprocity,
  integrality of singular values or the classification here, and the needed comparisons are built
  in §3.1.
- Generic ideal-series regrouping and Euler products:
  [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md); §§2.1–2.4 own the
  quadratic specializations and the additional real-character estimates.
- No effective form of the bounds of §2.4 is stated here, and no statement here rests on one.
  [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) consumes only the class-number
  formula of §2.2 from this roadmap; the effective class-number bounds of Goldfeld's type, with
  computable discriminant cutoffs, belong to EffectiveClassNumbers, which consumes §2.2 and the
  statements of §2.4.

## Exact supplier contracts

### From Mathlib

- `QuadraticAlgebra` with `QuadraticAlgebra.starAlgEquiv`, `QuadraticAlgebra.isField_iff_not_isSquare_discr`
  (the model is a field exactly for a nonsquare discriminant), `Algebra.norm_quadraticAlgebra_apply`,
  `QuadraticAlgebra.Rat.nonempty_algEquiv_iff` (for squarefree `d, e`, the models are `ℚ`-isomorphic iff
  `d = e`), `QuadraticAlgebra.Rat.exists_squarefree_algEquiv` (every `QuadraticAlgebra ℚ a b` of
  nonzero discriminant is isomorphic to a squarefree model) and `QuadraticAlgebra.nonempty_algEquiv_iff`
  (when `2` is regular, isomorphism iff `discr a b = u² discr a′ b′` for a unit `u` with
  `2 ∣ b − ub′`).
- `NumberField`, `NumberField.IsTotallyComplex`, `Algebra.IsQuadraticExtension`, `NumberField.classNumber`,
  `NumberField.discr`, `NumberField.discr_eq_discr_of_algEquiv`, `ClassGroup`, `ClassGroup.mulEquiv`
  (the class-group isomorphism of a ring isomorphism), `NumberField.classNumber_eq_one_iff`
  (`h(K) = 1` iff `𝓞 K` is a principal ideal ring), `minpoly`, `Algebra.adjoin`, `IsPrimitiveRoot`.
- `Int.IsFundamentalDiscr` with `Int.IsFundamentalDiscr.ne_zero`.
- `DirichletCharacter`, `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_eq_LSeries`,
  `DirichletCharacter.LSeries_eulerProduct`, `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`,
  `DirichletCharacter.LFunction_apply_one_ne_zero` (for `χ : DirichletCharacter ℂ N`, `[NeZero N]` and
  `χ ≠ 1`, `L(1, χ) ≠ 0`), `DirichletCharacter.IsPrimitive`, `DirichletCharacter.primitive_mul` with
  `DirichletCharacter.primitive_mul_isPrimitive`, `DirichletCharacter.conductor_dvd_level`,
  `DirichletCharacter.changeLevel_primitiveCharacter` and `DirichletCharacter.LFunction_changeLevel`
  (the Euler-factor comparison of §2.3), `MulChar.IsQuadratic`, `MulChar.IsQuadratic.comp`,
  `MulChar.ringHomComp_apply`, `mellin`.
- `UpperHalfPlane`, `CongruenceSubgroup.Gamma`, `ModularForm.eta`, `WeierstrassCurve`, and
  `PeriodPair` with `PeriodPair.weierstrassP` (junk value `0` on the lattice),
  `PeriodPair.derivWeierstrassP`, `PeriodPair.hasSumLocallyUniformly_weierstrassP`,
  `PeriodPair.differentiableOn_weierstrassP`, `PeriodPair.periodic_weierstrassP`,
  `PeriodPair.order_weierstrassP` (order `−2` at every lattice point), `PeriodPair.derivWeierstrassP_sq`
  (`℘′(z)² = 4℘(z)³ − g₂℘(z) − g₃` for `z ∉ Λ`), `PeriodPair.g₂` and `PeriodPair.g₃`.

### From Tau Ceti

- **Quadratic models and embeddings.** `QuadraticAlgebra.complexEmbedding` (for `a ≤ 0`, `ω ↦ √(−a)·i`),
  `QuadraticAlgebra.ringHom_eq_or_eq_conjugate`, `QuadraticAlgebra.isConj_complexEmbedding`,
  `QuadraticAlgebra.isTotallyComplex_iff`, `QuadraticAlgebra.nrComplexPlaces_eq_one`,
  `QuadraticAlgebra.smulOmegaEquiv` (for `d = u²e`, `ω ↦ uω`),
  `QuadraticAlgebra.complexEmbedding_comp_smulOmegaEquiv_of_pos`,
  `QuadraticAlgebra.complexEmbedding_comp_smulOmegaEquiv_of_neg`,
  `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top_of_isTotallyComplex`,
  `NumberField.existsUnique_neg_squarefree_algEquiv`, `NumberField.nonempty_algEquiv_iff_of_squarefree`,
  `TauCeti.QuadraticOrder.algEquivOfSqrt` with `TauCeti.QuadraticOrder.algEquivOfSqrt_apply` (for a
  nonsquare integer `D`, `δ² = D` in `K` and `[K : ℚ] = 2`, `z ↦ z.re + z.im · δ`).
- **Rings of integers, primes and units**, for squarefree nonsquare `d`, in the namespace
  `QuadraticAlgebra`: `QuadraticAlgebra.ringOfIntegersEquiv` and `QuadraticAlgebra.ringOfIntegersEquivHalf`,
  `QuadraticAlgebra.isIntegral_iff_of_mod_four_ne_one`, `QuadraticAlgebra.isIntegral_iff_of_mod_four_eq_one`,
  `QuadraticAlgebra.norm_ringOfIntegersEquiv_symm`, `QuadraticAlgebra.trace_ringOfIntegersEquiv_symm`,
  `QuadraticAlgebra.complexEmbedding_ringOfIntegersEquiv_symm`,
  `QuadraticAlgebra.norm_ringOfIntegersEquivHalf_symm`, `QuadraticAlgebra.trace_ringOfIntegersEquivHalf_symm`,
  `QuadraticAlgebra.complexEmbedding_ringOfIntegersEquivHalf_symm`,
  `QuadraticAlgebra.discr_eq_four_mul_of_mod_four_ne_one`, `QuadraticAlgebra.discr_eq_of_mod_four_eq_one`,
  `QuadraticAlgebra.map_ringOfIntegersEquiv_symm_span`, `QuadraticAlgebra.map_ringOfIntegersEquivHalf_symm_span`,
  `QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_ne_one`,
  `QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_eq_one`,
  `QuadraticAlgebra.span_natCast_integralSqrt_sub_sq_eq_iff`, `QuadraticAlgebra.span_natCast_halfGen_sub_sq_eq_iff`;
  `TauCeti.NumberField.Units.card_units_of_isTotallyComplex_of_discr` (`#𝒪_Kˣ = 4, 6, 2` according as
  `D = −4, −3` or otherwise) and `TauCeti.NumberField.Units.eq_one_or_neg_one_of_isTotallyComplex`;
  `TauCeti.NumberField.card_units_quotient_span_natCast_of_prime` (`#(𝒪_K/p)ˣ = (p − 1)(p − χ_D(p))`).
- **Class groups and class numbers.** `RingEquiv.classGroupEquiv`, `RingEquiv.classGroupEquiv_mk0`,
  `RingEquiv.classGroupEquiv_symm`, `RingEquiv.classGroupEquiv_trans`, `RingEquiv.classNumber_eq`,
  `NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid`,
  `QuadraticAlgebra.natCard_classGroup_eq_classNumber_of_mod_four_ne_one`,
  `QuadraticAlgebra.natCard_classGroup_eq_classNumber_of_mod_four_eq_one`,
  `QuadraticAlgebra.classNumber_eq_one_iff_isPrincipalIdealRing_of_mod_four_ne_one`,
  `QuadraticAlgebra.classNumber_eq_one_iff_isPrincipalIdealRing_of_mod_four_eq_one`,
  `QuadraticAlgebra.classNumber_eq_one_iff_uniqueFactorizationMonoid_of_mod_four_ne_one`,
  `QuadraticAlgebra.classNumber_eq_one_iff_uniqueFactorizationMonoid_of_mod_four_eq_one`,
  `TauCeti.BinaryQuadraticForm.classNumber_neg_twenty_eq_two`,
  `TauCeti.NumberField.classNumber_eq_two_of_minpoly_eq_X_sq_add_five`.
- **Forms and ideal classes.** `TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic`,
  `TauCeti.BinaryQuadraticForm.picClass_primitiveReducedForms_bijective`, `TauCeti.BinaryQuadraticForm.nat_card_pic`,
  `TauCeti.BinaryQuadraticForm.sum_reducedFormWeight_primitiveReducedForms_eq_card_pic_div_card_units`,
  `TauCeti.BinaryQuadraticForm.classNumber_eq_card_primitiveReducedForms_of_discr_eq`,
  `TauCeti.BinaryQuadraticForm.card_pic_intAddMulOrder_eq_card_primitiveReducedForms`,
  `TauCeti.BinaryQuadraticForm.posDefProperClassToPic_principalForm`,
  `TauCeti.BinaryQuadraticForm.posDefProperClassToPic_eq_one_iff`,
  `TauCeti.BinaryQuadraticForm.posDefProperClassToPic_mk_mul_of_united`,
  `TauCeti.BinaryQuadraticForm.exists_posDefProperClassToPic_mul_posDefProperClassToPic_eq`,
  `TauCeti.BinaryQuadraticForm.posDefProperClassToPic_mk_eq_inv_of_eq_reflected`,
  `TauCeti.BinaryQuadraticForm.picClass_principalForm`, `TauCeti.BinaryQuadraticForm.picClass_mul_picClass_of_united`,
  `TauCeti.BinaryQuadraticForm.picClass_reflected`, `TauCeti.BinaryQuadraticForm.fractionalIdeal_smul`,
  `TauCeti.BinaryQuadraticForm.root` with `TauCeti.BinaryQuadraticForm.root_smul` and
  `TauCeti.BinaryQuadraticForm.root_injective`.
- **Orders** (GlobalNumberFields Layer 11). `TauCeti.GlobalNumberFields.NumberFieldOrder`,
  `TauCeti.GlobalNumberFields.Pic`, `TauCeti.GlobalNumberFields.IdealClassMonoid`,
  `TauCeti.GlobalNumberFields.maximalOrderPicEquiv`, `TauCeti.GlobalNumberFields.intAddMulOrder` and, in
  the namespace `TauCeti.GlobalNumberFields.NumberFieldOrder`, `conductor_intAddMulOrder`,
  `discr_intAddMulOrder_of_finrank_eq_two`, `eq_intAddMulOrder_index`, `eq_intAddMulOrder_iff_discr_eq`,
  `conductor_injective`, `picToClassGroup_surjective`, `mulExact_residueUnitsToPic_picToClassGroup`,
  `card_pic_mul_index_mul_card_units`, `card_pic_intAddMulOrder_eq`, `card_pic_intAddMulOrder_mul_index_eq`,
  `index_range_unitsMap_intAddMulOrder`, `card_pic_intAddMulOrder_one` and
  `card_pic_intAddMulOrder_eq_one_iff` (for `K` imaginary quadratic and `f ≥ 1`, `Pic(O_f)` is trivial
  iff `h(K) = 1` and `f = 1`, or `f = 2` with `D ≡ 1 mod 8`, or `D = −3` with `f ∈ {2, 3}`, or `D = −4`
  with `f = 2`); `TauCeti.QuadraticOrder.numberFieldOrderOfSqrt_eq_intAddMulOrder`.
- **The character and the class-number formula.** `TauCeti.Multiquadratic.fundamentalDiscriminantChar`
  (`DirichletCharacter ℤ D.natAbs`) with `TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantChar`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_isQuadratic`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_ne_one`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_neg_one`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_two`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_natCast_eq_legendreSym`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_mul`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_zero_iff`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_one_iff`,
  `TauCeti.Multiquadratic.fundamentalDiscriminantChar_discr_eq_neg_one_iff`,
  `TauCeti.Multiquadratic.ringHomComp_fundamentalDiscriminantChar_discr_ne_one`;
  `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`,
  `TauCeti.NumberField.dedekindZeta_residue_eq_LFunction_one`,
  `TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one`,
  `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_eq_neg_three`,
  `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_eq_neg_four`,
  `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne` (equalities in `ℂ`);
  `DirichletCharacter.LFunction_apply_one_pos` and `DirichletCharacter.LFunction_pos_of_one_le` (for
  nonprincipal quadratic `χ`, `0 < L(s, χ)` in `ℂ` for real `s ≥ 1`).
- **Real-character estimates.** In the namespace `DirichletCharacter`: `LFunction_inv_conj`,
  `norm_LFunction_le_level_mul_norm_div_re`, `LFunction_eq_mul_integral` (for nonprincipal `χ` and
  `Re s > 0`, `L(s, χ) = s ∫_(t > 1) S(t) t^(−s−1) dt`), `norm_sum_Icc_le_level` (`‖S(t)‖ ≤ N`),
  `zetaMulPairCoeffs`, `zetaMulPairCoeffs_nonneg`, `LSeriesHasSum_zetaMulPairCoeffs`,
  `meromorphicOrderAt_pair_eq_neg_one`, `meromorphicOrderAt_pair_eq_neg_two`,
  `residue_pair_mul_of_mul_ne_one` and `residue_pair_mul_of_mul_eq_one`.
- **Modular functions and elliptic curves.** `Subgroup.CompactifiedQuotient.coeffSubfield`,
  `Subgroup.CompactifiedQuotient.laurentQExpansion_injective`,
  `Subgroup.CompactifiedQuotient.orderTop_laurentQExpansion`,
  `TauCeti.ModularGroup.coeffSubfield_cuspDatumInfty_bot`, `TauCeti.ModularGroup.jBiholomorph`,
  `TauCeti.ModularForm.j`, `TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`; in the
  namespace `PeriodPair`: `weierstrassCurve`, `weierstrassCurve_eq_of_lattice_eq`, `weierstrassCurve_smul`,
  `weierstrassCurve_Δ`, `weierstrassCurve_Δ_ne_zero`, `weierstrassCurve_j`, `weierstrassPoint`,
  `weierstrassPoint_add_coe`, `weierstrassPoint_neg`, `weierstrassPoint_eq_zero_iff`,
  `exists_analyticAt_toAffine_eq_weierstrassPoint`, `exists_mem_nhds_injOn_weierstrassPoint`,
  `weierstrassPoint_surjective`; and `UpperHalfPlane.weierstrassCurve_j_periodPair`.
- **Class fields** (ClassFieldTheory Layer 13). In the namespace `TauCeti.ClassFieldTheory`:
  `hilbertClassField`, `hilbertClassArtinEquiv` (`ClassGroup (𝓞 K) ≃* Gal(H_K/K)`),
  `finrank_hilbertClassField` (`[H_K : K] = h(K)`), `rayClassField`, `finrank_rayClassField`
  (`[K_𝔪 : K]` is the order of the ray class group), `ringClassField` and `ringClassArtinEquiv`
  (`Pic O ≃* Gal(ringClassField O/K)`), stated for `K : Type`.
- **Real integers.** `NumberField.RingOfIntegers.mem_range_algebraMap_iff_star_eq_of_isTotallyComplex`
  and `NumberField.minpoly_eq_map_minpoly_int_of_star_eq_of_isTotallyComplex`, for `K` with
  `Algebra.IsQuadraticExtension ℚ K` and `NumberField.IsTotallyComplex K`.
- **Siegel functions.** `TauCeti.ModularForm.siegelFunction` (for `r : Fin 2 → ℝ` and `τ : ℂ`, junk
  outside the upper half-plane) and, in the namespace `TauCeti.ModularForm`:
  `hasProdLocallyUniformlyOn_siegelFunction`, `differentiableOn_siegelFunction`, `siegelFunction_ne_zero`,
  `siegelFunction_add_intCast`, `siegelFunction_apply_add_one`,
  `siegelFunction_zero_half_mul_half_zero_mul_half_half`, `prod_X_sub_C_siegelFunction_pow_twelve`,
  `prod_X_sub_C_siegelFunction_pow_twelve_smul`, `siegelFunction_zero_half_eq_eta`,
  `siegelFunction_half_zero_eq_eta`, `siegelFunction_half_half_eq_eta`,
  `siegelFunction_zero_half_apply_neg_one_div`, `siegelFunction_half_zero_apply_neg_one_div`,
  `siegelFunction_half_half_apply_neg_one_div`, `norm_siegelFunction_le_of_le_half` (for `r₁ ≤ 1/2`),
  `norm_siegelFunction_le_of_apply_zero_eq_zero`, `level_two_bound_lt_one`, `level_three_bound_lt_one`,
  `norm_siegelFunction_zero_half_lt_one`, `norm_siegelFunction_zero_half_mul_lt_one` (for `r₁ = 1/2`) and
  `norm_siegelFunction_zero_third_mul_mul_lt_one`.
- **The class-number-one computations.** `TauCeti.sq_eq_two_mul_mul_pow_three_add_one_iff`,
  `TauCeti.heegnerGamma`, `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff` (over any commutative ring of
  characteristic zero), `TauCeti.mem_of_tschirnhausPolynomial_X_pow_four_eq`,
  `TauCeti.mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq`, `TauCeti.heegnerNumbers` and
  `TauCeti.heegnerDiscriminants` (`Finset ℕ`), `TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants`
  and `TauCeti.NumberField.classNumber_eq_one_iff_of_neg_fifty_one_lt_discr` (for a quadratic field of
  discriminant `−n > −51`, `h = 1` iff `n ∈ heegnerDiscriminants`).

### From TauCetiRoadmap.ClassFieldTheory

Layers 10–13: global reciprocity and existence with the arithmetic-Frobenius convention, the Hilbert,
ray and ring class fields with their Artin isomorphisms, and the ray-degree statements, as stated there
and through the Tau Ceti declarations above. Assumed as stated there.

### From TauCetiRoadmap.ModularForms

§10D, for a lattice `Λ ⊂ ℂ` and its Weierstrass curve `E_Λ : y² = x³ − (g₂/4)x − g₃/4`, the curve of
Tau Ceti's `PeriodPair.weierstrassCurve`: the map `u ↦ (℘_Λ(u), ℘′_Λ(u)/2)` off `Λ`, sending `Λ` to the
point at infinity, induces a bijective group isomorphism `ℂ/Λ → E_Λ(ℂ)`; every elliptic curve over `ℂ`
is isomorphic to `E_Λ` for some `Λ = ℤ + ℤz` with `z ∈ ℍ`; `℘_(αΛ)(αu) = α⁻²℘_Λ(u)`; and every
isomorphism `E_Λ → E_(Λ′)` is induced by `u ↦ αu` for a unique `α` with `αΛ = Λ′`. Assumed as stated
there.

### From TauCetiRoadmap.ModularCurvesPartII

§1.1, for a period pair with lattice `Λ` and the same Weierstrass curve `E_Λ`: the map
`z ↦ [℘_Λ(z) : ℘′_Λ(z)/2 : 1]` off `Λ`, sending `Λ` to the point at infinity, descends to a pointed
biholomorphism `ℂ/Λ ≅ E_Λ^an` onto the analytification of `E_Λ` that carries addition to the group
law. Assumed as stated there.

## References

- D. H. Shin, [Generation of class fields by Siegel-Ramachandra invariants](https://arxiv.org/abs/1009.2253v6),
  §§2, 4, 5: the fields `F_N` and their Galois action (§2, pp. 2–3), the Siegel-function properties
  (Proposition 2.1, Remark 2.2 and Proposition 2.3, pp. 3–4), finite-level CM reciprocity (the group
  `W_(N,τ_K)`, p. 4, and Proposition 2.5, p. 5), the level-two identities and `γ₂` (Lemma 4.1, p. 12),
  the level-two norm `x` for `2` not inert (Theorem 4.6, pp. 13–14, with its equations (19)–(20)),
  the small-power comparison (Theorem 4.8, p. 15), product estimates (Lemma 5.1) and the
  class-number-one branches (Theorem 5.2, Table 1). The cubic coefficient
  computation is `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff`; every cited CM comparison is a
  target above, including proofs the article leaves to other sources.
- H. M. Stark, [On the “gap” in a theorem of Heegner](https://doi.org/10.1016/0022-314X(69)90023-7),
  J. Number Theory 1 (1969), 16–27: the small-power class-field issue; and *A complete determination
  of the complex quadratic fields of class number one*, Michigan Math. J. 14 (1967), 1–27.
- H. Davenport, *Multiplicative Number Theory*, Chapter 6 (Dirichlet's class number formula) for
  §§2.1–2.2 and Chapter 21 (Siegel's theorem) for §§2.3–2.4.
- D. A. Cox, *Primes of the Form x² + ny²*, §7 (Theorem 7.7, the form/ideal correspondence;
  Theorem 7.24, the class number of an order) and §12 (Weber's functions and class number one).
