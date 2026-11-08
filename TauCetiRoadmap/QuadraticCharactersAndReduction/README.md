# Roadmap: quadratic characters and finite reduction of quadratic orders

**Summary.** Build the elementary dictionary between real Dirichlet characters, fundamental discriminants, integral quadratic presentations and their reductions modulo an integer. From the pinned quadratic-algebra and fundamental-discriminant-character carriers it reaches four end theorems: the local classification of quadratic characters at prime-power levels and the primitive discriminant of a real character at any level, the identification of `ℤ[ω]/(m)` with the quadratic algebra over `ℤ/m` with its cardinality, the Frobenius identity `z^Q = star z` on a quadratic field extension of a finite field together with its integral form `z^p ≡ star z (mod p)` in `ℤ[√r]`, and the coordinate bound `‖σ(u + vω)‖ ≤ |u| + |v|√|r|` for every complex embedding of `ℚ(√r)`. Both signs of the discriminant and the dyadic characters are included, and the square-root parameter `r` is any nonsquare integer, squarefree or not. The roadmap is this README; `Suggested.lean` states the headline theorems against the pinned Mathlib and Tau Ceti.

## Scope and ownership

This roadmap owns the conductor classification of quadratic Dirichlet characters at prime-power levels and its assembly at an arbitrary positive level (§§1.1–1.3); the primitive discriminant of a real character at any level, with its uniqueness and the deleted-factor formula (§1.4); the reduction of an integral quadratic presentation `QuadraticAlgebra ℤ a b` modulo any `m`, its kernel, the quotient comparison, the cardinality `m²`, coordinate divisibility and finite coordinate sets (Layer 2); the comparison of the presented order `ℤ[√d]` with the index-two order `ℤ[(1 + √d)/2]` modulo odd `m` (§2.3); the split, inert and repeated-root trichotomy of `QuadraticAlgebra F r 0` over a finite field, the Frobenius identities and the integral Frobenius congruence (Layer 3); and the two complex embeddings of `QuadraticAlgebra ℚ r 0` with their coordinate bounds for every nonsquare `r`, positive or negative (Layer 4).

- **AnalyticNumberTheoryPartI §0.34a** owns the classification of primitive nonprincipal real Dirichlet characters as Kronecker characters of fundamental discriminants: for such a character of conductor `q` the discriminant is `D = χ(−1) q` and `χ` is the complexification of `fundamentalDiscriminantChar D` at level `q`, with the squarefree radicand `d ≠ 1`, `|d| ≤ q` and `χ(p) = (d/p)` at odd primes `p ∤ q`. §1.4 consumes it and adds only the conductor-one case, the uniqueness of `D` and the extension to imprimitive characters at any level.
- **ClassicalArithmeticCompletion** on main owns, in its Layer 1, the explicit generators `−1` and `5` of the unit group modulo `2^(e+3)` (§1.1), the `d`-th power criterion in a cyclic group (§1.3), the primitivity of `ZMod.χ₄`, `ZMod.χ₈` and `ZMod.χ₈'` (§1.4) and of the Legendre character modulo an odd prime (§1.5), the primitivity of a product of primitive characters of coprime levels (§1.6), the value table of `fundamentalDiscriminantChar` (§1.7) and the uniqueness of a primitive character from its values at almost all primes (§1.8). None of these is restated here; §§1.1–1.3 consume §§1.1, 1.3–1.6 as their primitivity and unit-group inputs.
- **Tau Ceti** natively owns the Kronecker character `TauCeti.kroneckerChar`, the fundamental-discriminant character `fundamentalDiscriminantChar` with its sign, odd-prime, dyadic and Jacobi values, its primitivity and its scalar realizations `fundamentalDiscriminantCharCast` with their conductor and commuting coefficient maps; the squarefree-radicand map `fundamentalDiscriminant d` with `D = d` for `d ≡ 1 (mod 4)` and `D = 4d` otherwise; the multiplicativity of the conductor over coprime factors; the inert criterion `isMaximal_span_natCast_iff` for `(p) ⊂ ℤ[ω]`; the split-case equivalences `algEquivProdOfSq` and `algEquivProdOfRoots`; the distinguished complex embedding `complexEmbedding` of `QuadraticAlgebra ℚ a 0` for `a ≤ 0`; and the maximal-order arithmetic Frobenius dictionary `arithFrobAt_eq_one_iff_legendreSym_eq_one`. These are cited under the supplier contracts, never rebuilt. Mathlib owns the two-sided squarefree description `Int.isFundamentalDiscr_iff_squarefree` of fundamental discriminants, the Field instance on `QuadraticAlgebra K a b` when `X² − bX − a` has no root, and the primitive character `DirichletCharacter.primitiveCharacter` of any Dirichlet character.
- **GlobalNumberFields** (completed, Layer 11) and **NumberFieldArithmetic** (completed) own orders in number fields, their discriminants, index and enlargement, norms and the prime decomposition in maximal orders. §2.3 compares the presented order with one explicit index-two enlargement through a concrete ring homomorphism and states nothing about maximal orders in general.
- **ThetaSeries §2H** defines its own Kronecker symbol and character for lattice discriminants; **ImaginaryQuadraticClassNumber H2.1** constructs the primitive character of a negative fundamental discriminant on the native carrier. Neither is a supplier or a consumer of a target here; the comparisons of this roadmap use the pinned Tau Ceti character directly.

Nothing here constructs a second character, discriminant predicate, quadratic-field carrier or Kronecker symbol, and nothing identifies a presented order `ℤ[√r]` with a maximal order.

## Conventions

Characters are Mathlib's `DirichletCharacter R N`; the level `N` is positive throughout, carried as `[NeZero N]`. A character is quadratic in the sense of `MulChar.IsQuadratic`: its values lie in `{0, 1, −1}`. This includes the principal character, whereas Montgomery–Vaughan's "quadratic" means exact order two; their "real" (all values real) is Mathlib's quadratic for complex characters (mv-mnt1-ch9, §9.3, p. 295). A real complex character means `∀ a, (χ a).im = 0`. The conductor is `DirichletCharacter.conductor`, primitivity is `DirichletCharacter.IsPrimitive`, and the primitive character inducing `χ` is `χ.primitiveCharacter`, of level `χ.conductor`.

Fundamental discriminants are `Int.IsFundamentalDiscr`, which includes `1`; `fundamentalDiscriminantChar 1` is the trivial character of level `1`. Write `D` for a fundamental discriminant, `d` for a squarefree radicand, `q` for a conductor, `N` for a level, `m` for a modulus, `p` for a prime and `Q` for the cardinality of a finite field.

Quadratic algebras are Mathlib's `QuadraticAlgebra R a b`, with generator `ω` satisfying `ω² = a + bω`, coordinates `re` and `im` in the basis `1, ω`, norm `QuadraticAlgebra.norm` with `norm (x + yω) = x² + bxy − ay²`, trace `QuadraticAlgebra.trace` with `trace (x + yω) = 2x + by`, and conjugation `star (x + yω) = (x + by) − yω`. The order written `ℤ[√r]` is `QuadraticAlgebra ℤ r 0` for an integer `r`, so `star ω = −ω` there; this is the presented order, not the maximal order of `ℚ(√r)`. For positive `r` conjugation exchanges the two real embeddings and is not complex conjugation. The parameter `r` is any integer, and the statements that need it nonsquare say so; `r = 5` and `r = 20` are both in scope.

Reduction modulo `m` is `QuadraticAlgebra.mapRingHom (Int.castRingHom (ZMod m)) a b`, the coefficientwise map `ℤ[ω] → (ℤ/m)[ω̄]` with `ω ↦ ω̄`, written `ρ_m` in prose. The ideal `(m)` of `QuadraticAlgebra ℤ a b` is `Ideal.span {(m : QuadraticAlgebra ℤ a b)}`. Finite fields are carried as `[Field F] [Finite F]` with `Q = Nat.card F`; a prime field is `ZMod p` with `[Fact p.Prime]`.

## Exact supplier contracts

### From Mathlib

- `DirichletCharacter`, `DirichletCharacter.conductor`, `DirichletCharacter.IsPrimitive`, `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.primitiveCharacter_apply_of_isCoprime`, `DirichletCharacter.primitiveCharacter_isPrimitive`, `DirichletCharacter.conductor_dvd_level`, `DirichletCharacter.eq_one_iff_conductor_eq_one`, `DirichletCharacter.FactorsThrough.existsUnique` and `DirichletCharacter.changeLevel` in `Mathlib/NumberTheory/DirichletCharacter/Basic.lean`: the character carrier, conductors, the primitive character of any character and change of level. `MulChar.IsQuadratic` and `MulChar.IsQuadratic.comp` in `Mathlib/NumberTheory/MulChar/Basic.lean`: values in `{0, 1, −1}`, preserved by ring homomorphisms.
- `ZMod.isCyclic_units_of_prime_pow` and `ZMod.isCyclic_units_two_pow_iff` in `Mathlib/RingTheory/ZMod/UnitsCyclic.lean`: the unit group modulo an odd prime power is cyclic, and modulo `2^k` it is cyclic exactly for `k ≤ 2`. `ZMod.euler_criterion` and `legendreSym.eq_pow` in `Mathlib/NumberTheory/LegendreSymbol/Basic.lean`: a nonzero `a` modulo `p` is a square iff `a^(p/2) = 1`, and the Legendre symbol is `a^(p/2)`. `FiniteField.pow_card`, `FiniteField.isSquare_iff`, `FiniteField.exists_nonsquare`, `FiniteField.isSquare_of_char_two` and `FiniteField.odd_card_of_char_ne_two` in `Mathlib/FieldTheory/Finite/Basic.lean`: `a^Q = a`, the square criterion in odd characteristic, and that every element is a square in characteristic two.
- `Int.IsFundamentalDiscr`, `Int.isFundamentalDiscr_iff_squarefree` in `Mathlib/NumberTheory/FundamentalDiscriminant.lean`: the predicate, including `D = 1`, and its squarefree description in both directions. `jacobiSym` in `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean`.
- `QuadraticAlgebra`, `QuadraticAlgebra.equivProd`, `QuadraticAlgebra.ext_iff`, `QuadraticAlgebra.algebraMap_dvd_iff` in `Mathlib/Algebra/QuadraticAlgebra/Defs.lean`: the carrier, its coordinate bijection with `R × R`, extensionality and `algebraMap r ∣ z ↔ r ∣ z.re ∧ r ∣ z.im`. `QuadraticAlgebra.lift`, `QuadraticAlgebra.star_mk`, `QuadraticAlgebra.norm`, `QuadraticAlgebra.norm_def`, `QuadraticAlgebra.norm_star`, `QuadraticAlgebra.mul_star`, `QuadraticAlgebra.trace`, `QuadraticAlgebra.trace_def`, `QuadraticAlgebra.mapRingHom`, `QuadraticAlgebra.mapRingHom_omega`, `QuadraticAlgebra.mapRingHom_injective`, `QuadraticAlgebra.mapRingHom_surjective`, `QuadraticAlgebra.mapRingHom_comp`, `QuadraticAlgebra.mapRingHom_star` and the `Field` instance on `QuadraticAlgebra K a b` under `Fact (∀ r, r ^ 2 ≠ a + b * r)`, with its `b = 0` form under `Fact (¬ IsSquare a)`, in `Mathlib/Algebra/QuadraticAlgebra/Basic.lean`: the universal property, conjugation, norm, trace, coefficient change and the field criterion. `QuadraticAlgebra.discr` with `discr a b = b² + 4a` in `Mathlib/Algebra/QuadraticAlgebra/Discriminant.lean`, so `discr r 0 = 4r`. `QuadraticAlgebra.algHom_star`, `QuadraticAlgebra.norm_algHom` and `QuadraticAlgebra.trace_algHom` in `Mathlib/Algebra/QuadraticAlgebra/AlgHom.lean`: an injective algebra map between quadratic algebras commutes with `star`, norm and trace. `QuadraticAlgebra.Rat.exists_squarefree_algEquiv` and `QuadraticAlgebra.Rat.nonempty_algEquiv_iff` in `Mathlib/Algebra/QuadraticAlgebra/Rat.lean`, and `QuadraticAlgebra.isDomain_iff`, `QuadraticAlgebra.algebraMap_omega` in `Mathlib/Algebra/QuadraticAlgebra/Int.lean`: the rational models and the inclusion of `ℤ[ω]` in `ℚ[ω]`.
- `Ideal.Quotient.lift`, `Ideal.Quotient.mk`, `Ideal.quotEquivOfEq` in `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`, `RingHom.quotientKerEquivOfSurjective` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`, `Ideal.mem_span_singleton'`, `Ideal.span_singleton_le_iff_mem` in `Mathlib/RingTheory/Ideal/Span.lean`, `RingEquiv.ofBijective`: quotient rings and the first isomorphism theorem. `ZMod.natCast_self`, `ZMod.intCast_zmod_eq_zero_iff_dvd`, `ZMod.intCast_eq_intCast_iff_dvd_sub` in `Mathlib/Data/ZMod/Basic.lean`; `Nat.card_zmod`, `Nat.card_prod`, `Nat.card_congr` in `Mathlib/SetTheory/Cardinal/Finite.lean`.
- `DualNumber` and `DualNumber.lift` in `Mathlib/Algebra/DualNumber.lean`: the repeated-root algebra `R[ε]/(ε²)` of §3.1. `Complex.norm_intCast`, `Complex.norm_ratCast`, `Complex.norm_real` in `Mathlib/Analysis/Complex/Norm.lean`, `Real.sqrt_sq`, `Real.sqrt_mul_self` in `Mathlib/Analysis/Real/Sqrt.lean` and the triangle inequality `norm_add_le`: the embedding bound of §4.1.

### From Tau Ceti

- `TauCeti.kroneckerChar`, `TauCeti.kroneckerChar_apply`, `TauCeti.kroneckerChar_intCast` in `TauCeti/NumberTheory/LegendreSymbol/KroneckerSymbol.lean`: the Kronecker character of any `D ≡ 0, 1 (mod 4)`, `D ≠ 0`, at level `|D|`, with values in any commutative ring.
- `TauCeti.Multiquadratic.fundamentalDiscriminantChar` with `fundamentalDiscriminantChar_intCast`, `fundamentalDiscriminantChar_neg_one` (`χ_D(−1) = sign D`), `fundamentalDiscriminantChar_isQuadratic`, `isPrimitive_fundamentalDiscriminantChar`, `fundamentalDiscriminantChar_natCast_eq_legendreSym` (`χ_D(q) = legendreSym q D` at an odd prime `q`, zero when `q ∣ D`), `fundamentalDiscriminantChar_two` (`χ_D(2) = χ₈(D)`), `fundamentalDiscriminantChar_ne_one` in `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean`: the character of a fundamental discriminant is by definition `kroneckerChar ℤ D` at level `|D|`, so the two agree at every residue with no change of level. `fundamentalDiscriminantChar_natCast_eq_jacobiSym`, `fundamentalDiscriminantChar_mul`, `fundamentalDiscriminantChar_neg_four`, `fundamentalDiscriminantChar_eight`, `fundamentalDiscriminantChar_neg_eight`, `fundamentalDiscriminantChar_oddPrimeDiscriminant` in `…/FundamentalDiscriminant/Values.lean`: the Jacobi values at odd arguments, multiplicativity in coprime discriminants, and the identification with `χ₄`, `χ₈`, `χ₈'` and the Legendre characters.
- `TauCeti.Multiquadratic.fundamentalDiscriminantCharCast R D hD` with `fundamentalDiscriminantCharCast_apply`, `fundamentalDiscriminantCharCast_ringHomComp`, `fundamentalDiscriminantCharCast_isQuadratic`, `isPrimitive_fundamentalDiscriminantCharCast`, `conductor_fundamentalDiscriminantCharCast` and `fundamentalDiscriminantCharCast_eq_one_iff` in `…/FundamentalDiscriminant/Realization.lean`: the realization with coefficients in any commutative ring `R`, its compatibility with every scalar map `R → S`, its quadraticity, and in characteristic zero its primitivity, its conductor `|D|` and its triviality exactly for `D = 1`.
- `TauCeti.Multiquadratic.fundamentalDiscriminant` and `isFundamentalDiscr_fundamentalDiscriminant` in `…/FundamentalDiscriminant/OfSquarefree.lean`: the fundamental discriminant `d` or `4d` of a squarefree `d`.
- `DirichletCharacter.conductor_mul_of_coprime`, `conductor_prod_of_pairwise_coprime`, `isPrimitive_ringHomComp_iff`, `conductor_ringHomComp` in `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean`: the conductor of a product of characters with coprime conductors is the product, and conductors are stable under injective coefficient maps.
- `QuadraticAlgebra.isMaximal_span_natCast_iff` in `TauCeti/NumberTheory/QuadraticOrder/PrimeIdeal.lean`: for a prime `p`, `(p) ⊂ ℤ[ω]` is maximal iff `X² − bX − a` has no root modulo `p`; with `eq_or_eq_of_natCast_mem` for the primes above a split or ramified `p`. The proof of the inert criterion contains, as local facts for prime `p`, the membership criterion and the kernel identification that §2.1 states for every `m`.
- `TauCeti.QuadraticAlgebra.algEquivProdOfSq` and `algEquivProdOfRoots` in `TauCeti/Algebra/QuadraticAlgebra/Split.lean`: with `2` invertible and `a = u²` for a unit `u`, `QuadraticAlgebra R a 0 ≃ₐ[R] R × R` sends `ω` to `(u, −u)`; more generally two roots with unit difference split the algebra.
- `QuadraticAlgebra.complexEmbedding` with `complexEmbedding_apply`, `algHom_eq_or_eq_comp_starAlgEquiv` and `ringHom_eq_or_eq_conjugate` in `TauCeti/NumberTheory/NumberField/Quadratic/ComplexEmbedding.lean`: for `a ≤ 0`, the embedding `ω ↦ √(−a)·i` and the fact that every algebra map to `ℂ` is it or its conjugate. §4.1 extends the exhaustiveness to positive nonsquare `a`.
- `TauCeti.NumberField.arithFrobAt_eq_one_iff_legendreSym_eq_one` in `TauCeti/NumberTheory/NumberField/Quadratic/Frobenius.lean`: in the maximal order of `ℚ(θ)`, `θ² = d`, the arithmetic Frobenius at a prime above an odd `p ∤ d` is trivial iff `legendreSym p d = 1`. §3.3 compares its elementary congruence with this dictionary where both apply.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI, §0.34a

`quadratic_character_kronecker`: a primitive nonprincipal real Dirichlet character `χ` of conductor `q` is the complexification of `fundamentalDiscriminantChar D`, transported to level `q`, for the fundamental discriminant `D = χ(−1) q`; with `d` the squarefree radicand of `D`, `d ≠ 1`, `|d| ≤ q` and `χ(p) = (d/p)` for every odd prime `p ∤ q`. Its hypotheses are `χ.IsPrimitive`, `χ ≠ 1` and `χ.IsQuadratic` at level `q` with `[NeZero q]`. §1.4 consumes this statement as stated and takes no step of its proof.

### From TauCetiRoadmap.ClassicalArithmeticCompletion, §§1.1, 1.3–1.8

§1.1 supplies `unitsTwoPowEquiv`, the decomposition `(ℤ/2^(e+3))ˣ ≃ ℤ/2 × ℤ/2^(e+1)` with generators `−1` and `5`. §1.3 supplies the `d`-th power criterion in a finite cyclic group. §1.4 and §1.5 supply the primitivity of `χ₄`, `χ₈`, `χ₈'` and of the Legendre character modulo an odd prime, as Dirichlet characters with integer values; §1.6 the primitivity of a product of primitive characters of coprime levels; §1.7 the value table of `fundamentalDiscriminantChar`; §1.8 that primitive characters of nonzero levels agreeing at almost all primes are equal. These are consumed at their stated generality (integer values; complex values through `MulChar.ringHomComp`).

## How to read the build

Layer 1 works with Dirichlet characters only: the two local classifications, their assembly at an arbitrary level, and the primitive discriminant of a real character, which consumes AnalyticNumberTheoryPartI §0.34a for the primitive nonprincipal case. Layer 2 is independent of Layer 1 and works in `QuadraticAlgebra ℤ a b`: the reduction map, its kernel, the quotient comparison, the cardinality and finite coordinate sets, then the index-two comparison. Layer 3 works over a finite field and specializes Layer 2 at a prime: the trichotomy, the Frobenius identities and the integral congruence. Layer 4 works over `ℚ` and `ℂ`: the two embeddings and their coordinate bounds, which use Layer 2 only through the inclusion of `ℤ[ω]` in `ℚ[ω]`. Layers 2–4 use no number-field splitting theorem, no class field theory and no analytic input.

## Layer 1: quadratic characters, local conductors and the primitive discriminant

### 1.1 Quadratic characters at an odd prime-power level

Prove `odd_prime_power_conductor`: for an odd prime `p`, `k ≥ 1` and a quadratic Dirichlet character `χ` of level `p^k` with complex values, the conductor of `χ` is `1` or `p` (mv-mnt1-ch9, §9.3, pp. 295–296). The route: the unit group modulo `p^k` is cyclic (`ZMod.isCyclic_units_of_prime_pow`) of even order `φ(p^k)`, so a character with `χ² = 1` is determined by its value on a generator, which is `±1`; hence there are exactly two quadratic characters at level `p^k`, the principal one and one nonprincipal one. The Legendre character modulo `p`, lifted to level `p^k` by `changeLevel`, is quadratic and nonprincipal, so it is the nonprincipal one, and its conductor is `p` by ClassicalArithmeticCompletion §1.5 and `conductor_changeLevel`.

- The nonprincipal quadratic character at level `p^k` is `changeLevel (quadraticChar (ZMod p))` composed with the integer cast; at an integer `n` its value is `legendreSym p n`, including `0` when `p ∣ n`.
- Quadratic characters at level `p^k` form a group of order two under multiplication.
- A real complex character at level `p^k` is quadratic: a value of a finite-order character on a unit has absolute value one, and a real such value is `±1`.

**Checks.**

- At level `9` there are five nonprincipal characters; the one of order two has conductor `3`, and the two of order three are primitive. Counting conductors `{1, 3}` for every nonprincipal character at level `9` would be wrong.
- At level `3` the quadratic characters are the principal character and the Legendre character, with values `1, 1, 0` and `1, −1, 0` at `1, 2, 3`; the Legendre character has conductor `3`.
- At level `25` the nonprincipal quadratic character takes the value `−1` at `2` (since `2` is not a square modulo `5`) and `0` at `5` and `10`; its conductor is `5`, not `25`.

*Needs:* Mathlib `ZMod.isCyclic_units_of_prime_pow`, `DirichletCharacter.changeLevel`, `DirichletCharacter.conductor_changeLevel`, `quadraticChar`, `legendreSym`, `MulChar.IsQuadratic`; ClassicalArithmeticCompletion §1.5; ClassicalArithmeticCompletion §1.3 for the square criterion on the cyclic unit group.

### 1.2 Quadratic characters at a power-of-two level

Prove `two_power_conductor`: a quadratic Dirichlet character of level `2^k` with complex values, for any `k ≥ 0`, has conductor `1`, `4` or `8` (mv-mnt1-ch9, §9.3, p. 296). The route: at levels `1` and `2` the unit group is trivial, so the only character is principal. At level `4` the unit group has order two and the characters are the principal character and `χ₄`. For `k ≥ 3`, `(ℤ/2^k)ˣ ≃ ℤ/2 × ℤ/2^(k−2)` with generators `−1` and `5` (ClassicalArithmeticCompletion §1.1), so a character with `χ² = 1` is determined by its two values `±1` at `−1` and `5`: there are four quadratic characters at level `2^k`, namely the lifts of the principal character, `χ₄`, `χ₈` and `χ₈'`, of conductors `1`, `4`, `8`, `8` (ClassicalArithmeticCompletion §1.4 and `conductor_changeLevel`).

- The four quadratic characters at level `2^k`, `k ≥ 3`, have the value table at odd residues: the principal character is `1`; `χ₄(n) = (−1)^((n−1)/2)`; `χ₈(n) = (−1)^((n²−1)/8)`; `χ₈'(n) = χ₄(n) χ₈(n)`. They vanish at even `n`.
- `χ₄` is odd, `χ₈` is even and `χ₈'` is odd, matching `sign(−4)`, `sign 8` and `sign(−8)`.
- A real complex character at level `2^k` is quadratic.

**Checks.**

- At level `2` the principal character is the only character; there is no primitive character at level `2`, and the conductor-one case is the only one that `two_power_conductor` admits there.
- At level `16` the four quadratic characters take, at `3, 5, 7`, the values `1, 1, 1`; `−1, 1, −1`; `−1, −1, 1`; `1, −1, −1`. A character with values `−1, −1, −1` at `3, 5, 7` does not exist: `χ(3)χ(5) = χ(15) = χ(−1)` and `χ(7) = χ(−1)χ(9) = χ(−1)χ(5)² = χ(−1)`, so `χ(3)χ(5) = χ(7)`, which the values `(−1)(−1) ≠ −1` violate.
- The conductor `2` never occurs, and neither does `16`: the character of order `4` at level `16` sending `5 ↦ i` is primitive but not quadratic.

*Needs:* ClassicalArithmeticCompletion §§1.1, 1.4; Mathlib `ZMod.isCyclic_units_two_pow_iff`, `ZMod.χ₄`, `ZMod.χ₈`, `ZMod.χ₈'`, `DirichletCharacter.changeLevel`, `DirichletCharacter.conductor_changeLevel`, `MulChar.IsQuadratic`.

### 1.3 The conductor of a quadratic character at any level

For a quadratic Dirichlet character `χ` of level `N > 0` with complex values, prove that `χ` is the product, over the prime powers `p^k ∥ N`, of its restrictions to the local factors (the Chinese remainder decomposition `(ℤ/N)ˣ ≃ ∏ (ℤ/p^k)ˣ`), that each local factor is quadratic, and that the conductor of `χ` is the product of the local conductors (mv-mnt1-ch9, Lemma 9.3, p. 283, and §9.3, p. 295). Consequently the conductor of a quadratic character is `2^ε · ∏ p_i` with `ε ∈ {0, 2, 3}` and distinct odd primes `p_i`, and a primitive quadratic character has a conductor of this form, which is `|D|` for a fundamental discriminant `D` (both signs may occur, as `12` and `−3` show at the odd part `3`).

- The local factors are `χ ∘ changeLevel`-sections: for `p^k ∥ N`, the factor at `p` is the character of level `p^k` that agrees with `χ` on residues `≡ 1` modulo `N/p^k`; its product over `p` is `χ`.
- `χ.conductor = ∏ (local conductor)`: by `conductor_prod_of_pairwise_coprime` once each local conductor is shown to be the conductor of the lifted factor.
- For `χ` of level `N` with primitive character `χ*` of conductor `q`: `χ(n) = χ*(n)` when `gcd(n, N) = 1` and `χ(n) = 0` otherwise, at every integer `n`. Equality on units does not assert equality at primes dividing `N` but not `q`.

**Checks.**

- The principal character of level `6` has conductor `1`, value `0` at `2` and at `3`, and its primitive character, of level `1`, has value `1` at `2`: the deleted-factor formula distinguishes the two.
- At level `12`, `χ₄ · (Legendre mod 3)` has local conductors `4` and `3` and conductor `12`; it is the character of `D = 12`. The character `χ₄` lifted to level `12` has local conductors `4` and `1` and conductor `4`.
- At level `45 = 9 · 5` the product of the quadratic characters modulo `9` and modulo `5` has conductor `15`, not `45`: the factor at `3` has conductor `3` by §1.1.

*Needs:* §§1.1–1.2; Mathlib `ZMod.chineseRemainder`, `DirichletCharacter.changeLevel`, `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.primitiveCharacter_apply_of_isCoprime`, `DirichletCharacter.changeLevel_primitiveCharacter`; Tau Ceti `conductor_mul_of_coprime`, `conductor_prod_of_pairwise_coprime`; ClassicalArithmeticCompletion §1.6.

### 1.4 The primitive discriminant of a real character

Prove `exists_unique_fundamental_discriminant`: for a quadratic Dirichlet character `χ` of any level `N > 0` with complex values there is exactly one fundamental discriminant `D` with `|D| = χ.conductor` such that `χ(n) = fundamentalDiscriminantCharCast ℂ D hD (n)` for every integer `n` coprime to `N`. The principal character corresponds to `D = 1`. The route: `χ.primitiveCharacter` is primitive of level `χ.conductor` and quadratic (its values at integers coprime to the conductor are values of `χ`, and it vanishes elsewhere). If it is principal, the conductor is `1` and `D = 1` works, with `fundamentalDiscriminantCharCast_eq_one_iff` showing that no `D ≠ 1` does. Otherwise AnalyticNumberTheoryPartI §0.34a gives `D = χ(−1) · χ.conductor`, and the deleted-factor formula of §1.3 transports the equality from the conductor to the level `N`. Uniqueness: two fundamental discriminants with the same absolute value and the same sign are equal, and the sign is `χ(−1)` by `fundamentalDiscriminantChar_neg_one`, since `−1` is coprime to `N`.

- A real complex character is quadratic, and conversely: `(∀ a, (χ a).im = 0) ↔ χ.IsQuadratic` for every Dirichlet character with complex values at a positive level, by the finite order of the values on units.
- Naturality: if `N ∣ M` then `changeLevel χ` at level `M` has the same conductor and the same `D`, and the agreement at integers coprime to `M` follows from the agreement at integers coprime to `N`.
- Both realizations: the integer-valued `fundamentalDiscriminantChar D hD` and its complex realization agree at every integer through `Int.castRingHom ℂ` (`fundamentalDiscriminantCharCast_apply`), so a consumer may read the conclusion with integer values.
- Odd-prime dictionary for the two square-root parameters: for `D ≠ 1` with squarefree radicand `d` and every odd prime `p`, `χ_D(p) = legendreSym p D = legendreSym p d`, including the value `0` at the odd primes dividing `D`, and `χ(p) = χ_D(p)` for `p ∤ N`; `D` and `d` differ at most by the square factor `4`, so their Legendre symbols at odd primes agree. A consumer needing Layer 3's nonsquare hypothesis for `r = d` or `r = D` reads it off a value `χ(p) = −1`.

**Checks.**

- `D = 1, −4, 8, −8, 5, −3, 12` are fundamental; `D = −4` and `D = 8` come from `χ₄` and `χ₈` at their own levels, `D = 12` from the conductor-`12` character of §1.3, and the sign `χ(−1)` separates `D = 12` from `D = −12`, which is not fundamental (`−12 = 4 · (−3)` with `−3 ≡ 1 (mod 4)`).
- For `χ₄` lifted to level `12` the conductor is `4` and `D = −4`; the lifted character is `0` at `3` while `χ_(−4)(3) = −1`: the agreement holds only at integers coprime to `12`, as stated.
- For the principal character at level `6`, `D = 1` and the agreement at `n = 5` reads `1 = 1`; taking `D = −3` would give `|D| = 3 ≠ 1 = χ.conductor`.
- Uniqueness needs the sign: at conductor `8` the characters of `D = 8` and `D = −8` have the same `|D|` and are distinguished by `χ(−1)`; a statement asking only for `|D| = q` would have two solutions.

*Needs:* AnalyticNumberTheoryPartI §0.34a; §1.3; Mathlib `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.primitiveCharacter_isPrimitive`, `DirichletCharacter.primitiveCharacter_apply_of_isCoprime`, `DirichletCharacter.eq_one_iff_conductor_eq_one`, `Int.isFundamentalDiscr_iff_squarefree`, `legendreSym`; Tau Ceti `fundamentalDiscriminantCharCast`, `fundamentalDiscriminantCharCast_apply`, `fundamentalDiscriminantCharCast_eq_one_iff`, `conductor_fundamentalDiscriminantCharCast`, `fundamentalDiscriminantChar_neg_one`, `fundamentalDiscriminantChar_natCast_eq_legendreSym`, `fundamentalDiscriminant`, `isFundamentalDiscr_fundamentalDiscriminant`.

### Examples

The conductor-`12` character `χ₄ · (Legendre mod 3)` is the running example: its local conductors are `4` and `3`, its discriminant is `D = 12`, its values at `5, 7, 11` are `−1, −1, 1`, and lifting it to level `24` changes neither its conductor nor its discriminant. The principal character at level `6` is the degenerate example with `D = 1`.

### Dependencies

Mathlib Dirichlet characters, conductors, primitive characters and the cyclic structure of `(ℤ/p^k)ˣ`; Tau Ceti conductor multiplicativity and the fundamental-discriminant character with its realizations; ClassicalArithmeticCompletion §§1.1, 1.3–1.6; AnalyticNumberTheoryPartI §0.34a. No input from Layers 2–4.

## Layer 2: reduction of integral quadratic presentations modulo m

### 2.1 The reduction map and the ideal (m)

For `A = QuadraticAlgebra ℤ a b` and any natural number `m`, the reduction `ρ_m = mapRingHom (Int.castRingHom (ZMod m)) a b : A →+* QuadraticAlgebra (ZMod m) ā b̄` is surjective (`mapRingHom_surjective`, as `ℤ → ℤ/m` is), sends `ω` to `ω̄`, and commutes with `star`. Define `reductionQuotientHom a b m : A ⧸ (m) →+* QuadraticAlgebra (ZMod m) ā b̄` as the map induced by `ρ_m` through `Ideal.Quotient.lift`; `ρ_m` kills `m` because `m = 0` in `ℤ/m`. Prove `reduction_kernel`: the kernel of `ρ_m` is the principal ideal `(m)` of `A`; and `bijective_reductionQuotientHom`: the induced map is a ring isomorphism `A/(m) ≃+* QuadraticAlgebra (ZMod m) ā b̄`. The route for the kernel: `z ∈ (m)` iff `m ∣ z.re` and `m ∣ z.im` (`Ideal.mem_span_singleton` and `algebraMap_dvd_iff`, after writing `(m : A)` as `algebraMap ℤ A m`), and `ρ_m z = 0` iff both coordinates vanish in `ℤ/m` (`QuadraticAlgebra.ext_iff` and `ZMod.intCast_zmod_eq_zero_iff_dvd`); this is the argument Tau Ceti uses for prime `m` inside `isMaximal_span_natCast_iff`. Bijectivity is injectivity of the lift, which is the kernel statement, with surjectivity of `ρ_m`.

- Membership: `z ∈ (m) ↔ (m : ℤ) ∣ z.re ∧ (m : ℤ) ∣ z.im`, and the congruence form `z − w ∈ (m) ↔ z.re ≡ w.re ∧ z.im ≡ w.im (mod m)`.
- Coordinates: `(ρ_m z).re = (z.re : ZMod m)` and `(ρ_m z).im = (z.im : ZMod m)`; `ρ_m (star z) = star (ρ_m z)`; `norm (ρ_m z) = (norm z : ZMod m)` and `trace (ρ_m z) = (trace z : ZMod m)`, by the coordinate formulas of norm and trace; `ρ_m (P(ω)) = P̄(ω̄)` for an integer polynomial `P`, by `lift`.
- Composition: for `m ∣ n` the reduction `ρ_m` factors as the canonical map `ZMod n → ZMod m` applied coefficientwise after `ρ_n` (`mapRingHom_comp`), and the induced maps `A/(n) → A/(m)` compose accordingly; `ρ_0` is the identity on coordinates and injective, and the inclusion `A → QuadraticAlgebra ℚ a b` is injective with the same coordinates (`algebraMap_omega`).
- The ring isomorphism `A/(m) ≃+* QuadraticAlgebra (ZMod m) ā b̄` is `RingEquiv.ofBijective` of the induced map; equivalently `(Ideal.quotEquivOfEq reduction_kernel).symm` followed by `RingHom.quotientKerEquivOfSurjective`.

**Checks.**

- `m = 0`: the kernel is the zero ideal and `A/(0)` is `A` itself; `ZMod 0 = ℤ` and `ρ_0` is the identity. A statement of the kernel with `m > 0` as a hypothesis would miss this case, which the theorem includes.
- `m = 1`: `ZMod 1` is the zero ring, every `z` lies in `(1) = A`, and the quotient is the zero ring with one element `= 1²`.
- `a = 5, b = 0, m = 2`: `ω̄² = 1` in `(ℤ/2)[ω̄]`, so `ρ_2(ω − 1)² = 0` while `ρ_2(ω − 1) ≠ 0`: the reduction of `ℤ[√5]` modulo `2` is the repeated-root algebra, not a field, although `2` is inert in the maximal order of `ℚ(√5)` (Milne, Example 3.44(iii), p. 63). The kernel statement is unaffected; §2.3 and §3.3 return to this example.
- Coefficientwise divisibility is not divisibility of the norm: for `a = −1`, `z = 1 + ω` has norm `2`, so `2 ∣ norm z`, while `z ∉ (2)` since `2 ∤ z.re`.

*Needs:* Mathlib `QuadraticAlgebra.mapRingHom`, `mapRingHom_surjective`, `mapRingHom_omega`, `mapRingHom_star`, `mapRingHom_comp`, `QuadraticAlgebra.ext_iff`, `algebraMap_dvd_iff`, `Ideal.mem_span_singleton'`, `Ideal.Quotient.lift`, `RingHom.quotientKerEquivOfSurjective`, `RingEquiv.ofBijective`, `ZMod.natCast_self`, `ZMod.intCast_zmod_eq_zero_iff_dvd`, `QuadraticAlgebra.norm_def`, `trace_def`, `lift`, `algebraMap_omega`; the pinned proof pattern of Tau Ceti `isMaximal_span_natCast_iff`.

### 2.2 Cardinality and finite coordinate sets

Prove `card_reduction_quotient`: for `m > 0`, `A/(m)` has exactly `m²` elements. The route: transport along the isomorphism of §2.1 (`Nat.card_congr`), then `equivProd` and `Nat.card_prod` with `Nat.card_zmod`. For finite sets `U, V ⊂ ℤ` of coordinates, the set `{z ∈ A | z.re ∈ U ∧ z.im ∈ V}` is the image of `U × V` under the coordinate bijection and has `#U · #V` elements; when reduction modulo `m` is injective on `U` and on `V`, `ρ_m` is injective on this set, since `ρ_m z = ρ_m w` forces `z.re ≡ w.re` and `z.im ≡ w.im (mod m)`. A half-open interval `[t, t + m)` of integers reduces injectively modulo `m > 0`, because two of its elements differ by less than `m`; so do `[t, t + m]` with its right endpoint removed and any interval of at most `m` consecutive integers, while an interval of `m + 1` consecutive integers does not.

- `Nat.card (A ⧸ (m)) = m²` for `m > 0`; the quotient is finite exactly when `m ≠ 0`.
- For `U, V` with injective reduction, `ρ_m` restricted to the coordinate rectangle is injective, and the image has `#U · #V` elements in a set of size `m²`; hence `#U · #V ≤ m²`.
- The interval criterion is stated with its exact endpoints: `Set.Ico t (t + m)` for `m > 0`, and `Set.Icc t (t + m − 1)` as the same set.

**Checks.**

- `a = 5, b = 0, m = 2`: the quotient has `4` elements, the classes of `0, 1, ω, 1 + ω`.
- `a = 20, b = 0, m = 3`: the quotient has `9` elements; `20 ≡ 2 (mod 3)` is not a square, so it is the field with nine elements. This is the nonsquare, non-squarefree parameter in scope.
- The singleton `U = V = {0}` reduces injectively for every `m`, and the empty coordinate set gives the empty rectangle with `0 · #V = 0` elements.
- `U = [0, m]` has `m + 1` elements and its endpoints `0` and `m` reduce to the same class: injectivity fails, so the interval criterion needs length at most `m`.

*Needs:* §2.1; Mathlib `Nat.card_congr`, `Nat.card_prod`, `Nat.card_zmod`, `QuadraticAlgebra.equivProd`, `Set.InjOn`, `ZMod.intCast_eq_intCast_iff_dvd_sub`, `Set.ncard` of a product.

### 2.3 The presented order and its index-two enlargement modulo odd m

For an integer `d ≡ 1 (mod 4)` let `B = QuadraticAlgebra ℤ ((d − 1)/4) 1`, the presentation of `ℤ[(1 + √d)/2]` with generator `ω'` satisfying `ω'² = ω' + (d − 1)/4`. Define `ι : QuadraticAlgebra ℤ d 0 →ₐ[ℤ] B` by `lift` at `2ω' − 1`, which squares to `d`. Prove that `ι` is injective, that its image is the subgroup `{x + yω' | y even}` of index two, and that for every odd `m` the induced map `ℤ[√d]/(m) → B/(m)` is a ring isomorphism, while for `m = 2` it is neither injective nor surjective (Milne, Example 2.41, p. 39, for the integral basis `1, (1 + √d)/2` of `ℚ(√d)` when `d` is squarefree and `≡ 1 (mod 4)`). The route: `ι(x + yω) = (x − y) + 2yω'`, so the image is as stated; modulo odd `m`, `2` is a unit in `ℤ/m` and the coordinate map `(x, y) ↦ (x − y, 2y)` is bijective on `(ℤ/m)²`; modulo `2` its image is `{y even}` and `ι(ω − 1) = 2ω' − 2 ∈ (2)B` while `ω − 1 ∉ (2)`. The hypothesis `d ≡ 1 (mod 4)` is needed for `B` to be defined over `ℤ`; squarefreeness of `d` is not needed for the comparison of the two presented orders and is used only to identify `B` with the maximal order, which is the supplier's statement, not this roadmap's.

- `ι` commutes with `star`, norm and trace (`algHom_star`, `norm_algHom`, `trace_algHom`, as `ι` is injective), and with reduction modulo every `m` on both sides.
- For odd `m`, the two quotients `ℤ[√d]/(m)` and `B/(m)` have `m²` elements each and `ι` induces an isomorphism between them.
- For `m = 2`, the quotient `B/(2)` is the field with four elements when `d ≡ 5 (mod 8)` and `ℤ/2 × ℤ/2` when `d ≡ 1 (mod 8)`, while `ℤ[√d]/(2)` is the repeated-root algebra in both cases.

**Checks.**

- `d = 5`: `B = QuadraticAlgebra ℤ 1 1`, `ι(ω) = 2ω' − 1` and `(2ω' − 1)² = 4ω'² − 4ω' + 1 = 4(ω' + 1) − 4ω' + 1 = 5`. Modulo `3` both quotients have nine elements and are fields (`5 ≡ 2` is not a square modulo `3`). Modulo `2`, `B/(2)` is the field with four elements and `ℤ[√5]/(2)` is not reduced: the map is not injective.
- `d = −3`: `B = QuadraticAlgebra ℤ (−1) 1`, the Eisenstein integers; `ι(ω) = 2ω' − 1` and `(2ω' − 1)² = 4(ω' − 1) − 4ω' + 1 = −3`.
- `d = 5, m = 2` is the negative control for "inert in the maximal order implies the presented order is a field modulo `p`": `B/(2)` is a field and `ℤ[√5]/(2)` is not.

*Needs:* §§2.1–2.2; Mathlib `QuadraticAlgebra.lift`, `algHom_star`, `norm_algHom`, `trace_algHom`; Milne, Example 2.41.

### Examples

`ℤ[√5]` modulo `2`, `3` and `5` gives the three reduction types: the repeated-root algebra (and the index-two comparison fails), the field with nine elements (where the index-two comparison is an isomorphism), and the algebra with `ω̄² = 0` again at the ramified prime `5`. The parameter `20` modulo `3` shows that squarefreeness plays no role in Layer 2.

### Dependencies

Mathlib quadratic algebras with `mapRingHom`, ideals and quotient rings, `ZMod` and `Nat.card`; Tau Ceti's inert criterion as the model of the kernel argument. No input from Layer 1.

## Layer 3: finite quadratic algebras and Frobenius

### 3.1 The trichotomy over a finite field

For a finite field `F` with `Q = Nat.card F` elements and `r ∈ F`, classify `A = QuadraticAlgebra F r 0` by `r`: if `r = u²` with `u ≠ 0` and `Q` is odd, then `algEquivProdOfSq u` is an algebra isomorphism `A ≃ₐ[F] F × F` with `ω ↦ (u, −u)`; if `r` is not a square, then `A` is a field (Mathlib's instance under `Fact (¬ IsSquare r)`), a quadratic extension of `F` with `Q²` elements; if `r = 0`, then `A ≃ₐ[F] DualNumber F` with `ω ↦ ε`, the repeated-root algebra, which is not reduced. Define the last equivalence by `lift` at `ε`, with inverse `DualNumber.lift`, and prove the three cases exhaustive for odd `Q`. In characteristic two every element of `F` is a square (`FiniteField.isSquare_of_char_two`), so for even `Q` only the first and third shapes can occur, and the first fails: `r = u² ≠ 0` gives `(ω − u)² = 0`, so `A` is again the repeated-root algebra up to the change of generator `ω ↦ ω − u`.

- The type equivalence `equivProd : A ≃ F × F` is the coordinate map and not a ring map: it sends `ω` to `(0, 1)`, whose square `(0, 1)` is not the coordinate vector `(r, 0)` of `ω²`; the algebra isomorphism of the split case sends `x + yω` to `(x + yu, x − yu)`, with inverse `(s, t) ↦ (s + t)/2 + ((s − t)/(2u)) ω`.
- In the split case `norm (x + yω) = (x + yu)(x − yu)` is the product of the two coordinates and `trace` is their sum; `star` exchanges the two factors.
- In the inert case `A` is a field with `Q²` elements and `F` is the subfield of elements with `im = 0`; `norm z = z · star z` and `trace z = z + star z` (`mul_star`).
- In the repeated-root case the nilradical is `F ε`, `norm (x + yε) = x²` and `trace (x + yε) = 2x`.

**Checks.**

- `F = ℤ/5`, `r = −1 = 2²`: split; `ω ↦ (2, −2) = (2, 3)`, and `1 + ω ↦ (3, 4)` has norm `12 ≡ 2 = 1 + 1`, matching `norm (1 + ω) = 1 − (−1) = 2`.
- `F = ℤ/3`, `r = −1`: not a square, `A` is the field with nine elements; `F = ℤ/3`, `r = 3 = 0`: the repeated-root algebra, in which `ω ≠ 0` and `ω² = 0`.
- `F = ℤ/2`, `r = 1`: `1` is a square and `Q` is even; `(ω + 1)² = ω² + 1 = 0`, so `A` is not `F × F`, which has no nonzero nilpotent. This is the negative control for the oddness hypothesis in the split case.

*Needs:* Tau Ceti `algEquivProdOfSq`; Mathlib `QuadraticAlgebra.lift`, the `Field` instance under `Fact (¬ IsSquare a)`, `DualNumber`, `DualNumber.lift`, `FiniteField.isSquare_iff`, `FiniteField.isSquare_of_char_two`, `FiniteField.odd_card_of_char_ne_two`, `QuadraticAlgebra.mul_star`, `norm_def`, `trace_def`.

### 3.2 Frobenius on a finite quadratic algebra

Prove `pow_card_eq_star`: for a finite field `F` with `Q` elements and a nonsquare `r ∈ F`, every `z ∈ QuadraticAlgebra F r 0` satisfies `z^Q = star z`; and `pow_card_eq_self_of_square`: for odd `Q` and a nonzero square `r`, every `z` satisfies `z^Q = z`. In the first case in particular `ω^Q = −ω`. The route: in the inert case `A` is a field with `Q²` elements, the `Q`-th power map is a field automorphism fixing `F` (`FiniteField.pow_card` on `F`, the binomial theorem in characteristic `p`), and `ω^Q = ω · r^((Q−1)/2) = −ω` by Euler's criterion (`ZMod.euler_criterion` for prime fields, `FiniteField.isSquare_iff` in general, as `r` is not a square and `Q` is odd, which holds because a finite field of characteristic two has every element a square); so the `Q`-th power map agrees with `star` on `F` and on `ω`, hence everywhere. In the split case transport `FiniteField.pow_card` componentwise through `algEquivProdOfSq`. In the repeated-root case `z^Q = (z.re)^Q = z.re`: Frobenius kills `ε`, since `Q ≡ 0` in `F`.

- `trace z = z + z^Q` and `norm z = z · z^Q` in the inert case; the fixed points of `z ↦ z^Q` are exactly `F`.
- For `r` not a square, `z ↦ z^Q` is the unique nontrivial `F`-algebra automorphism of `A`, and `(z^Q)^Q = z`.
- Scalar extension: for a finite extension `F ⊂ F'`, the identity `z^Q = star z` for `z ∈ A` is the restriction of `z^(Q') = star z` on `QuadraticAlgebra F' r 0` only when `r` stays a nonsquare in `F'`; over `F'` of even degree over `F`, `r` becomes a square and the identity changes to `z^(Q') = z`.

**Checks.**

- `F = ℤ/3`, `r = −1`, `z = 1 + ω`: `z³ = 1 + 3ω + 3ω² + ω³ = 1 + 3ω − 3 − ω = −2 + 2ω = 1 − ω = star z` in `ℤ/3`. A statement `z^Q = z` would give `1 + ω ≠ 1 − ω`.
- `F = ℤ/5`, `r = −1`, `z = 1 + ω`: `z⁵ = z` since `A ≃ F × F`; here `star z = 1 − ω ≠ z`, so the inert identity would be false: the two headlines are separated by the square class of `r`.
- `F = ℤ/3`, `r = 0`, `z = 1 + ω`: `z³ = 1 + 3ω + 3ω² + ω³ = 1`, neither `z` nor `star z = 1 − ω`. The repeated-root case has its own identity `z^Q = z.re`.
- `ω^Q = −ω` is the value table at the generator: for `F = ℤ/7`, `r = 3` (a nonsquare, as `3³ = 27 ≡ −1`), `ω⁷ = ω · 3³ = −ω`.

*Needs:* §3.1; Mathlib `FiniteField.pow_card`, `ZMod.euler_criterion`, `FiniteField.isSquare_iff`, `FiniteField.isSquare_of_char_two`, `FiniteField.odd_card_of_char_ne_two`, `frobenius`, the `Field` instance on `QuadraticAlgebra F r 0`, `QuadraticAlgebra.star_mk`, `QuadraticAlgebra.mul_star`; Tau Ceti `algEquivProdOfSq`.

### 3.3 The integral Frobenius congruence

Prove `frobenius_congruence`: for an integer `r`, an odd prime `p` such that `r` is not a square modulo `p`, and every `z = u + v√r ∈ ℤ[√r]`, `z^p − star z ∈ (p)`, that is, `z^p ≡ u − v√r (mod p)` coefficientwise. The route: reduce modulo `p` with `ρ_p` of §2.1, which is a ring homomorphism commuting with `star` and with `p`-th powers; apply `pow_card_eq_star` over `F = ZMod p`, whose cardinality is `p`, to `ρ_p z`; conclude by `reduction_kernel`. In coordinates the congruence says `p ∣ u^p − u` and `p ∣ v^p r^((p−1)/2) + v`, the second by Euler's criterion with `r^((p−1)/2) ≡ −1`. Compare with the maximal order: for `r = d` squarefree and an odd prime `p ∤ d`, the hypothesis "no square root of `r` modulo `p`" is the inertness of `(p)` in `ℤ[√r]` (`isMaximal_span_natCast_iff`) and, through Conrad's Theorem 2.4 and Corollary 3.1 (conrad-quadchar, PDF pp. 3–4) and Milne's Example 3.44(ii) (p. 63), the condition `legendreSym p d = −1` under which `p` is inert in the maximal order and the arithmetic Frobenius at `p` is the nontrivial automorphism (`arithFrobAt_eq_one_iff_legendreSym_eq_one`). The congruence is the elementary form of this dictionary in the presented order and needs no Galois theory. The prime `2` is excluded: `pow_card_eq_star` needs a nonsquare, and modulo `2` every residue is a square.

- The commuting square: `ρ_p (z^p) = (ρ_p z)^p = star (ρ_p z) = ρ_p (star z)`.
- Coordinate consequences: `p ∣ u^p − u` (Fermat) and `p ∣ v (v^(p−1) r^((p−1)/2) + 1)`, which for `p ∤ v` is Euler's criterion for `r`.
- Comparison with inertness: under the hypothesis of the theorem, `(p)` is a maximal ideal of `ℤ[√r]` and `ℤ[√r]/(p)` is the field with `p²` elements, by §2.1 and §3.1.

**Checks.**

- `r = −1, p = 3`: `(u + v√−1)³ = (u³ − 3uv²) + (3u²v − v³)√−1`, and subtracting `u − v√−1` gives `(u³ − u − 3uv²) + (3u²v − v³ + v)√−1`; `3 ∣ u³ − u` and `3 ∣ v − v³`, so both coordinates are divisible by `3`.
- `r = −1, p = 5`: `−1 = 2²` is a square modulo `5`, the hypothesis fails, and indeed `(1 + √−1)⁵ ≡ 1 + √−1 ≢ 1 − √−1 (mod 5)`: the congruence is false, as `pow_card_eq_self_of_square` predicts.
- `r = 5, p = 2`: `5 ≡ 1` is a square modulo `2`, so the theorem does not apply; `(u + v√5)² − (u − v√5) = (u² + 5v² − u) + (2uv + v)√5`, whose second coordinate is `≡ v (mod 2)`: the congruence fails for odd `v`, although `2` is inert in the maximal order of `ℚ(√5)` (Milne, Example 3.44(iii), p. 63). The field's dyadic inertness does not give the congruence in `ℤ[√5]`, whose reduction modulo `2` is the repeated-root algebra of §2.1.
- `r = 3, p = 3`: `3 ≡ 0` is a square, the theorem does not apply, and `(u + v√3)³ − (u − v√3) = (u³ + 9uv² − u) + (3u²v + 3v³ + v)√3` has second coordinate `≡ v (mod 3)`: the ramified prime is excluded by the hypothesis, not by the oddness of `p`.

*Needs:* §§2.1, 3.2; Mathlib `ZMod.euler_criterion`, `legendreSym.eq_pow`, `ZMod.pow_card`, `Nat.card_zmod`; Tau Ceti `isMaximal_span_natCast_iff`, `arithFrobAt_eq_one_iff_legendreSym_eq_one`; Conrad, Theorem 2.4 and Corollary 3.1; Milne, Example 3.44.

### Examples

`ℤ[√−1]` at `3` and at `5` separates the inert congruence from the split identity; `ℤ[√5]` at `2` separates inertness in the maximal order from the congruence in the presented order; `ℤ/7` with `r = 3` fixes the sign `ω^Q = −ω`.

### Dependencies

Layers 2 (reduction) and the finite-field library of Mathlib; Tau Ceti's split equivalence, inert criterion and maximal-order Frobenius dictionary for the comparisons. No input from Layers 1 and 4.

## Layer 4: embeddings and coordinate bounds

### 4.1 The two complex embeddings and the coordinate bound

For a rational `r` and a complex `s` with `s² = r` (for `r ≥ 0` take `s = √r`, for `r < 0` take `s = √(−r)·i`), define the two `ℚ`-algebra homomorphisms `σ₊, σ₋ : QuadraticAlgebra ℚ r 0 →ₐ[ℚ] ℂ` by `lift` at `s` and at `−s`, so that `σ±(u + vω) = u ± vs`. Prove `norm_embedding_le`: for every `ℚ`-algebra homomorphism `σ : QuadraticAlgebra ℚ r 0 →ₐ[ℚ] ℂ` and every `z = u + vω`, `‖σ z‖ ≤ |u| + |v|√|r|`. The route: `σ ω` squares to `r`, so `‖σ ω‖² = |r|` and `‖σ ω‖ = √|r|`; then `‖σ z‖ = ‖u + v σ ω‖ ≤ |u| + |v| ‖σ ω‖` by the triangle inequality and `Complex.norm_ratCast`. For nonsquare `r` prove that `σ₊` and `σ₋` are injective, that every `ℚ`-algebra homomorphism to `ℂ` is one of them (it is determined by the image of `ω`, which is a square root of `r`), that `σ₋ = σ₊ ∘ star`, and that `σ₊(z) · σ₋(z) = norm z` and `σ₊(z) + σ₋(z) = trace z` read in `ℂ`. For `r ≤ 0`, `σ₊` is Tau Ceti's `complexEmbedding`, whose exhaustiveness statement `algHom_eq_or_eq_comp_starAlgEquiv` is the `r ≤ 0` case; the positive nonsquare case is the target here. The integral specialization reads `u, v ∈ ℤ` through the inclusion of `ℤ[√r]` in `QuadraticAlgebra ℚ r 0` and accepts every nonsquare integer `r`, including the nonsquare non-squarefree fundamental discriminants such as `r = 12` and `r = 20`.

- Coordinate recovery: `u = (σ₊ z + σ₋ z)/2` and `v = (σ₊ z − σ₋ z)/(2s)`, so `|u| ≤ (‖σ₊ z‖ + ‖σ₋ z‖)/2` and `|v| ≤ (‖σ₊ z‖ + ‖σ₋ z‖)/(2√|r|)` for `r ≠ 0`; the hypothesis `s ≠ 0`, that is `r ≠ 0`, is retained.
- Signature: for `r > 0` both `σ±` take real values and are the two real embeddings, exchanged by `star`; for `r < 0` they are complex conjugate, `σ₋ = conj ∘ σ₊`, and `star` corresponds to complex conjugation only in this case.
- For `r` a nonzero square `t²` in `ℚ`, `σ±` are still defined (`ω ↦ ±t`) but not injective: `ω − t ↦ 0` under `σ₊`.
- The norm comparison with the field: for nonsquare `r`, `norm z = σ₊(z) σ₋(z)` is the field norm of `ℚ(√r)/ℚ` of the image of `z`, and `‖σ₊ z‖² = norm z` exactly when `r < 0`.

**Checks.**

- `r = −1`, `z = u + vω`: `σ₊ z = u + vi`, `‖σ₊ z‖ = √(u² + v²) ≤ |u| + |v|`, with equality iff `uv = 0`.
- `r = 20`, `z = 1 + ω`: `s = 2√5`, `σ₊ z = 1 + 2√5 ≈ 5.47` and `|1| + |1|√20 = 1 + 2√5`: equality, as `u, v ≥ 0` and `s > 0`. For `z = 1 − ω`, `σ₊ z = 1 − 2√5 ≈ −3.47` and the bound `1 + 2√5` is strict.
- `r = 4`, `z = ω − 2`: `σ₊ z = 0 ≤ |−2| + |1|·2 = 4`; the bound holds but `σ₊` is not injective, so the bound is a statement about every algebra map while injectivity needs `r` nonsquare.
- `r = 0`: `σ₊ = σ₋` sends `ω` to `0`; the bound reads `‖u‖ ≤ |u| + 0`, and coordinate recovery of `v` is unavailable, as `s = 0`.

*Needs:* Mathlib `QuadraticAlgebra.lift`, `Complex.norm_ratCast`, `Complex.norm_real`, `Real.sqrt_sq`, `Real.sqrt_mul_self`, `norm_add_le`, `norm_mul`, `QuadraticAlgebra.norm_def`, `trace_def`, `algebraMap_omega`; Tau Ceti `complexEmbedding`, `complexEmbedding_apply`, `algHom_eq_or_eq_comp_starAlgEquiv`.

### Examples

`r = −1` is the Gaussian case with the Euclidean bound; `r = 20` shows the integral specialization at a nonsquare, non-squarefree parameter; `r = 4` separates the bound, valid for every algebra map, from injectivity and coordinate recovery, which need `r` nonsquare and nonzero.

### Dependencies

Mathlib quadratic algebras over `ℚ`, the complex norm and real square roots; Tau Ceti's distinguished complex embedding for `r ≤ 0`; Layer 2 only through the inclusion of `ℤ[√r]` in `ℚ[√r]`. No input from Layers 1 and 3.

## Downstream consumers

The targets are exposed on the native carriers with the maps commuting, not as existence statements for isomorphic objects, so that a consumer can read values off coordinates. Layer 1 supplies, at any level, the discriminant `D` of a real character with its sign and odd-prime values, which a consumer uses to pass from a character value `χ(p) = −1` to the nonsquare hypothesis of Layer 3 for `r = d` or `r = D`. Layer 2 supplies the reduction of `ℤ[√r]` modulo any `m` and the injectivity of reduction on coordinate rectangles, with the exact interval endpoints. Layer 3 supplies the Frobenius congruence used to separate conjugates modulo an inert prime, and Layer 4 the archimedean bound on the two embeddings; together they give the elementary inputs of determinant and interpolation arguments on points of `ℤ[√d]`, with no particular rectangle, inert prime or parameter choice fixed here. No roadmap on main consumes a target of this roadmap; AnalyticNumberTheoryPartI is a supplier of Layer 1 and takes nothing from it.

## References

Page numbers refer to the printed edition named; a PDF page is stated where it differs.

- **[mv-mnt1-ch9]** H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I: Classical Theory*, Cambridge Studies in Advanced Mathematics 97 (2006), [Chapter 9, Primitive characters and Gauss sums](https://personal.science.psu.edu/rcv4/personal/Publications/MNTI/13.0_pp_282_325_Primitive_characters_and_Gauss_sums.pdf), author's copy, pp. 282–325 (PDF page `n` is printed page `281 + n`): Theorem 9.2 and Lemma 9.3 (p. 283), §9.3 (pp. 295–297) and Theorem 9.13 (p. 297).
- **[conrad-quadchar]** B. Conrad, [Quadratic characters associated to quadratic fields](https://math.stanford.edu/~conrad/676Page/handouts/quadchar.pdf), course handout: Theorem 2.4 (PDF p. 3) and Corollary 3.1 (PDF p. 4), the Frobenius and Legendre-value interpretation of the field character.
- **[milne-ant]** J. S. Milne, [Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf), version 3.08 (2020), author's course notes (PDF page is printed page `+ 2`): Example 2.41 (p. 39), the integral basis of `ℚ(√m)`; Theorem 3.41 (pp. 62–63), the Dedekind–Kummer factorization; Example 3.44 (p. 63), the splitting of primes in `ℚ(√m)`, including the prime `2` for `m ≡ 1 (mod 4)`.
