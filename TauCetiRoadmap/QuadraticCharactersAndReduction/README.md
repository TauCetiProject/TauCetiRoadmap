# Quadratic characters, orders, and finite reduction

Develop the elementary dictionary between real Dirichlet characters, fundamental
discriminants, quadratic orders, and their reductions. The two main exports are the
classification of every primitive real character and the explicit Frobenius congruence
in an integral square-root presentation. Include both signs of the discriminant and the
dyadic character cases. These are classical arithmetic interfaces, useful for character
sums, quadratic prime splitting, and arithmetic interpolation.

`README.md` is the specification. `Suggested.lean` gives representative interfaces,
not an exhaustive checklist. Every construction below includes its evaluation, extensionality,
functoriality, and comparison lemmas; a theorem asserting existence alone is insufficient.

## Conventions and suppliers

Use Mathlib's `DirichletCharacter`, conductor, primitive reduction, and
[`MulChar.IsQuadratic`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/NumberTheory/MulChar/Basic.lean).
This predicate means values in `{0,1,-1}` and includes the principal character. When
the character group has characteristic-zero coefficients, exact order two additionally
requires nonprincipality. A real complex character means `∀ a, (χ a).im = 0`.
Use `Int.IsFundamentalDiscr`, which includes `1`. The character at discriminant `1`
has conductor `1`; it is not the character of a quadratic field.

Write `D` for a fundamental discriminant, `d` for a squarefree radicand, `q` for primitive
conductor, and `N` for a presented modulus. Require `N > 0` for finite character
classification. For reduction and embeddings write `r` for an arbitrary nonsquare
integer parameter; it need not be squarefree. For example, both square-root
presentations with parameters `5` and `20` are in scope.

Use `QuadraticAlgebra R a b`, with generator `ω² = a + bω`. Thus the order denoted
`ℤ[√r]` is `QuadraticAlgebra ℤ r 0`, not an assertion about the maximal order. Its
conjugation is native `star`, sending `ω` to `-ω` in this presentation. For positive
`r`, conjugation exchanges real embeddings and differs from complex conjugation.

| Supplier | Input to consume | Boundary |
| --- | --- | --- |
| Mathlib `Algebra/QuadraticAlgebra/{Defs,Basic,BaseChange,Integral,Int,Rat}.lean` | Coordinates, `basis`, `lift`, `mapRingHom`, trace, norm, conjugation, and field criteria | Supply only missing quotient and explicit reduction comparisons here |
| Tau Ceti `NumberTheory/Multiquadratic/FundamentalDiscriminant/{Character,Realization}.lean` | `fundamentalDiscriminantChar`, `fundamentalDiscriminantCharCast`, primitivity, conductor, scalar compatibility, prime values | Construction of canonical characters remains with this supplier; Q2 owns the converse |
| Tau Ceti `NumberTheory/DirichletCharacter/Conductor.lean` | Conductor and primitive-reduction comparisons | Q1 supplies the local classification adapters |
| Tau Ceti `NumberTheory/QuadraticOrder/PrimeIdeal.lean` | `isMaximal_span_natCast_iff`, explicit root ideals, residue cardinalities | Inertness in the presented order is already available without maximal-order identification |
| Tau Ceti `NumberTheory/QuadraticOrder/Embedding.lean` | `numberFieldOrderOfSqrt`, integral bases, discriminant-order embeddings | Its canonical integral generator need not equal `√D` |
| Tau Ceti `NumberTheory/QuadraticOrder/Split/Basic.lean` and `NumberTheory/NumberField/Quadratic/Frobenius.lean` | Split comparisons and arithmetic Frobenius | Q4 owns the direct finite-algebra and order-congruence adapters |
| [ImaginaryQuadraticClassNumber H1–H2](../ImaginaryQuadraticClassNumber/README.md) | Imaginary field/order arithmetic and its field-character dictionary | Do not infer positive-radicand statements from an imaginary hypothesis |
| [GlobalNumberFields Layer 11](../../Completed/GlobalNumberFields/README.md) and [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md) | General orders, discriminants, norms, and prime decomposition | Order enlargement and dyadic maximal-order comparisons remain there |
| [ThetaSeries §2H](../ThetaSeries/README.md), [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md), [MultiquadraticPartII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1420) | Kronecker and prime-discriminant constructions, reciprocity, quadratic-field splitting | Do not create another character or discriminant predicate |

The source paths above are in [Mathlib](https://github.com/leanprover-community/mathlib4)
and [Tau Ceti](https://github.com/TauCetiProject/TauCeti). Adopt their APIs, including
changes from active upstream work; build missing comparisons in Tau Ceti.

## Q0. Carrier comparisons

Relate real-valued complex characters, quadratic multiplicative characters, and
integer-valued realizations by their actual coefficient maps. Supply extensionality on
integer arguments and on residue classes, nonprincipal/exact-order-two comparisons,
and the principal case. Prove that the comparisons commute with changing modulus and
primitive reduction, with hypotheses on the modulus maps stated explicitly.

For quadratic algebras, expose the native basis `1,ω`, its coordinate representation,
and the relation to the monogenic polynomial quotient. Use `mapRingHom`, not a new
coefficient-change construction. Record the existing evaluation, trace, norm, and
conjugation compatibility results as inputs to Q3–Q5.

**Derivation:** finite-order complex character values have absolute value one on units;
a real such value is `1` or `-1`. Conversely these values are real. Coordinate and
scalar-map statements follow from the native constructions.

## Q1. Local quadratic characters and conductors

For an odd prime `p` and `k ≥ 1`, classify all characters of order dividing two on
`(ZMod (p^k))ˣ`: the principal character and the character induced from the Legendre
character modulo `p`. Prove uniqueness, the conductor alternatives `1,p`, the value
formula on units and nonunits, and parity. Include the primitive character modulo `p`
and show the nonprincipal character at `p^k`, `k > 1`, is imprimitive.

For moduli `2^k`, classify the corresponding characters by the generators of the unit
group. The primitive nonprincipal cases have conductors `4` and `8`: the characters
of discriminants `-4`, `8`, and `-8`. Give all induced characters, their conductor,
parity, and value tables on odd residue classes. Include `k = 0,1,2,3` explicitly.

Assemble the local factors using CRT for a positive modulus `N`. Prove uniqueness of
local factorization, multiplicativity of the conductor across coprime factors, and
compatibility with primitive reduction and characteristic-zero coefficient maps.
For `χ` presented at level `N` with primitive character `χ*` of conductor `q`, export
the deleted-factor formula on all integers:

\[
\chi(n)=\begin{cases}\chi^*(n)&\gcd(n,N)=1,\\0&\gcd(n,N)>1.\end{cases}
\]

Equality with `χ*` on units does not assert equality at newly deleted primes.

**Source and proof route:** Montgomery–Vaughan [MV], §§9.1 and 9.3, especially Lemma
9.3 and pp. 295–296. Use the odd-prime-power cyclic unit group, the two-generator
description at powers of two, and existing conductor/CRT APIs.

**Checks:** no primitive character at modulus `2`; the nonprincipal character modulo
`9` has conductor `3`; the principal character modulo `6` has conductor `1` and value
zero at `2`, while its primitive reduction has value one there.

## Q2. Classification by fundamental discriminants

Prove a bijection between fundamental discriminants and primitive real Dirichlet
characters with varying positive modulus. Use the existing canonical character,
with `D = 1` corresponding to the primitive principal character at modulus `1`.
Give both inverse identities and uniqueness, not only a surjection.

For any primitive nonprincipal real complex character at level `q`, export a unique
fundamental `D ≠ 1` with `D.natAbs = q` and equality to
`fundamentalDiscriminantCharCast ℂ D hD` after transporting the level. Also give equality
of their integer evaluations, so consumers can use the result without dependent casts.
Supply the integer and real realizations and their commuting maps into `ℂ`.

Expose `χ(-1) = sign D`, the odd-prime Legendre values, the exact dyadic values, and
the squarefree-radicand description `D = d` when `d ≡ 1 (mod 4)`, `D = 4d` otherwise.
Retain `d ≠ 1` for the genuine quadratic-field case, both signs, and `|d| ≤ q`.
For an imprimitive real character, export its unique primitive discriminant and Q1's
deleted-factor formula; prove naturality under further changes of level.

**Source:** [MV], §9.3, Theorem 9.13, p. 297, for the nonprincipal classification,
with Q1's local factorization. Add the conductor-one case directly. The book's
“quadratic” convention is exact order two, whereas the native predicate includes
the principal character. All forward construction facts retain their supplier above.

**Checks:** `D = 1,-4,8,-8,5,-3`; parity distinguishes `D` from `-D` whenever both
are fundamental. Do not infer the converse from primitivity of the constructed examples.

## Q3. Reduction of integral quadratic presentations

For `A = QuadraticAlgebra ℤ a b` and any `m : ℕ`, specialize `mapRingHom` along
`Int.castRingHom (ZMod m)`. Prove that its kernel is the principal ideal `(m)` in `A`,
that it is surjective, and that it induces the ring equivalence

\[
A/(m)\simeq \operatorname{QuadraticAlgebra}(\mathbf Z/m\mathbf Z,\bar a,\bar b).
\]

Give the quotient map comparison, its coordinate formulas, norm/trace/conjugation
and polynomial-evaluation compatibility, and coefficientwise divisibility:
`z ∈ (m)` iff `m ∣ z.re` and `m ∣ z.im`. Prove the congruence form for two elements.
For `m > 0`, prove the quotient has cardinality `m²`. At `m = 0` the kernel is zero
and the quotient is the original infinite order; at `m = 1` it is the zero ring.
Include maps between reductions for `m ∣ n`, their compositions, and comparison with
scalar extension and the polynomial-quotient presentation.

For arbitrary nonsquare integer `r`, compare `QuadraticAlgebra ℤ r 0` with its image
in the rational quadratic field, consuming the existing injective coefficient maps
and field criteria. Keep this image distinct from the maximal order. Prove any use
of an order enlargement modulo `m` only under the needed index/coprimality hypotheses;
the enlargement theory itself retains its arithmetic owner.

**Derivation:** the native coordinate equivalence and surjectivity of integer reduction
give the kernel and image assertions; the ring quotient theorem gives the equivalence.
The two coordinates give the cardinality. No number-field splitting theorem is needed.

**Checks:** reduce `ℤ[√5]` directly modulo `2`; do not identify it with the maximal
order modulo `2`, since its index there is two. Include nonsquare parameter `20`.

## Q4. Finite quadratic algebras and Frobenius

For a finite field `F` of odd cardinality `Q`, classify `A = QuadraticAlgebra F r 0`:
nonzero square `r` gives `F × F`, nonsquare `r` gives a quadratic field extension,
and `r = 0` gives the repeated-root algebra `F[ε]/(ε²)`. Give explicit algebra
equivalences where appropriate, maps on the generator, and compatibility with trace,
norm, and conjugation. Distinguish the type equivalence `equivProd` from an algebra
equivalence to the split product.

In the split case `z^Q = z`; in the nonsquare case `z^Q = star z`, and `ω^Q = -ω`.
Give trace `z + z^Q` and norm `z*z^Q` in the nonsquare case, the corresponding fixed-field
statements, and scalar-extension naturality. The repeated-root case is not a field:
its Frobenius kills the nilpotent generator.

Specialize Q3 to an odd prime `p` with nonsquare reduction of `r`. Prove both the
finite-field identity and the integral congruence

\[
z^p-\bar z\in (p)\subset\mathbf Z[\sqrt r],
\qquad z=u+v\sqrt r.
\]

Expose the commuting reduction diagram and the coordinate divisibility consequences.
Consume `isMaximal_span_natCast_iff` for inertness of `(p)` in the actual order.
Compare with the existing maximal-order arithmetic-Frobenius dictionary wherever
both apply, without requiring global class field theory for this elementary statement.

**Derivation:** the binomial theorem in characteristic `p`, finite-field power
identities, Euler's criterion, and the native quadratic-algebra field criterion.
Splitting follows from the two distinct roots and polynomial CRT; the repeated-root
case is substitution at zero. See [C] and [M] for the arithmetic interpretation.

**Checks:** `r = -1` at `p = 3` (conjugation) and `p = 5` (split); `r = 3` at `p = 3`
(repeated root); exclude `p = 2` from the odd-characteristic assertions.

## Q5. Embeddings, coordinate bounds, and finite sets

For nonsquare rational `r` and a complex `s` with `s² = r`, compare the two native
algebra homomorphisms `σ±(u+vω) = u ± vs` with the quadratic-field embeddings.
Prove injectivity, exhaustiveness, exchange by `star`, and that their product is
the native algebra norm. The integral specialization accepts every nonsquare integer
parameter, including nonsquare fundamental discriminants that are not squarefree.

For either embedding prove

\[
\|\sigma_\pm(u+v\omega)\|\le |u|+|v|\sqrt{|r|}.
\]

Give the converse coordinate estimates from `u = (σ+z+σ-z)/2` and
`v = (σ+z-σ-z)/(2s)`, retaining `s ≠ 0`. State the real and imaginary signature
specializations, and the norm comparison with the field norm under the order embedding.

For arbitrary finite coordinate sets `U,V ⊂ ℤ`, transport `U × V` into the order and
prove its cardinality `#U * #V`. If reduction of each coordinate set modulo `m` is
injective, prove reduction of this set into Q3's quotient is injective. Supply interval
criteria: a half-open integer interval of length at most `m > 0` reduces injectively.
Retain exact strict/inclusive endpoints in the interval adapters.

**Derivation:** the native `lift`, square-root field criterion, triangle inequality,
`‖s‖² = |r|`, and the two-coordinate representation. Product-set cardinality and
coordinatewise injectivity give the finite-set statements.

**Checks:** positive and negative `r`, `r = 20`, singleton and empty coordinate sets,
and an interval of length `m+1` where reduction is not injective. No particular
balanced rectangle, inert-prime choice, or parameter optimization is specified here.

## Scope and completion

Each layer must export the comparisons on the native carriers, with the maps commuting,
not merely an abstract existence theorem for an isomorphic object. Q0–Q2 depend on
the existing character/conductor constructions; Q3–Q5 depend on native quadratic
algebras and finite fields. Neither branch depends on prime-sum improvements or
zero-free regions. This roadmap does not include a new proof excluding exceptional
zeros, a particular interpolation matrix, or a class-number bound.

## References and related work

- **[MV]** H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I:
  Classical Theory* (2006), [Chapter 9](https://personal.science.psu.edu/rcv4/personal/Publications/MNTI/13.0_pp_282_325_Primitive_characters_and_Gauss_sums.pdf),
  §§9.1 and 9.3, Lemma 9.3 and Theorem 9.13.
- **[C]** B. Conrad, [Quadratic characters associated to quadratic fields](https://math.stanford.edu/~conrad/676Page/handouts/quadchar.pdf),
  for the field-character and Frobenius interpretation.
- **[M]** J. S. Milne, [Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf),
  version 3.08 (2020), Chapters II–III on integral bases and prime decomposition.
- [Mathlib quadratic-algebra modules](https://github.com/leanprover-community/mathlib4/tree/master/Mathlib/Algebra/QuadraticAlgebra)
  and [Tau Ceti quadratic-order modules](https://github.com/TauCetiProject/TauCeti/tree/main/TauCeti/NumberTheory/QuadraticOrder)
  are the implementation suppliers. The derivations in Q3–Q5 specify elementary missing
  adapters rather than another theory of quadratic fields.
