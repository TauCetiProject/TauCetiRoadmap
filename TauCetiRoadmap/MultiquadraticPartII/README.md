# Roadmap: multiquadratic fields and genus theory, part ii: real quadratic signs and form characters

**Summary.** This roadmap builds the sign-sensitive interfaces between narrow
ideal classes, genera and integral binary quadratic forms in a real quadratic
field. Its targets are the exact narrow-to-wide kernel, unique descent of real
class characters, the number of narrow classes in each genus, arithmetic
criteria for the distinguished principal class to lie in the principal genus,
the common extension of the supplied nonsquare and Biró form characters to all
integral binary quadratic forms, and its agreement
with the narrow ideal genus character at a positive fundamental discriminant.
These interfaces connect the existing normalizations of real quadratic
period and trace formulas to the pinned arithmetic carriers.

## Scope and ownership

The starting point is the completed [Multiquadratic roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/Multiquadratic/README.md).
Its narrow class group, prime-discriminant factorization, genus characters,
principal genus theorem and narrow two-rank formula are inputs here. In
particular, the singleton character value on the distinguished class and the
criterion that this class be a square are already Tau Ceti theorems. This
roadmap adds arithmetic consequences and the form-character extension,
building on those objects and the earlier composite sign theorem.

The precise ownership boundaries are as follows.

- **Multiquadratic, Part II** owns the two narrow-defect interfaces, the
  genus-fibre cardinality, the arithmetic interfaces of Layer 2, and Layer 3's
  common total extension `binaryFormGenusChar` of the supplied nonsquare and
  Biró form characters. It proves restriction agreement with both supplied
  characters and comparison with the pinned narrow ideal character.
- **[IntegralLattices, Layer B](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md#layer-b-binary-lattices-and-quadratic-orders)**
  (B1–B3) owns integral binary forms and their content, proper equivalence,
  the oriented form–ideal bijection into GlobalNumberFields' `NarrowPic` for
  positive nonsquare discriminants, and its composition, inverse and
  genus-coset compatibilities. This roadmap does not use that bijection.
  Layer 3 compares characters on one form at a time, using the explicit
  coefficient ideal of that form and the library's
  `NumberField.NarrowClassGroup`. The ideal it uses is the one B2 attaches to
  the form, including the B2 sign clause for a negative leading coefficient.
- **[GlobalNumberFields, Layer 11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups)** owns number-field orders, invertible proper
  fractional ideals, `Pic`, `NarrowPic`, the forgetful homomorphism and its
  maximal-order specialization. No second narrow quotient is constructed here.
  Nothing here needs `NarrowPic` of the maximal order to be identified with the
  library's narrow class group.
- **GeometryOfNumbersAndQuadraticArithmetic §4.3** consumes the proper classes of
  positive definite binary forms of negative discriminant and their ideal
  correspondence from IntegralLattices Layer B (B2, B4, B5); neither roadmap
  plans a genus character on forms.
- **AutomorphicSpectralTheory §4.17a**, `quadratic_weyl_domains`, owns the
  real composite identity χ(J)=sign δ=sign δ′. AnalyticNumberTheoryPartI
  §2.25 consumes that value from that supplier.
- **MetaplecticAutomorphicForms §§7.20a, 7.32-trace** owns both supplied
  form characters. Section 7.20a, `quadraticTraceData`, owns the
  imprimitive nonsquare form character, its represented-value existence and
  independence, and its proper invariance. Its domain has Δ=δδ′ nonsquare,
  δ fundamental and δ′ a nonzero discriminant; forms are positive definite
  when Δ<0. Section 7.32-trace, `biroArithmeticTraceData`, owns Biró's
  character ω_δ on positive-discriminant forms, including square
  discriminants, with δ>0 fundamental and Δ/δ a positive discriminant;
  its level-N forms satisfy N∣a. Layer 3 owns the total extension and its
  agreement with each interface on its domain, including Biró's square
  discriminants. Negative definite forms and zero discriminants also belong to
  the extension domain.
- **ClassicalArithmeticCompletion §§5.21, 5.23–5.24** owns the all-radicand
  negative-Pell/norm-unit equivalence, the negative-Pell criterion for J=1
  and the two-primary comparison. Here the kernel and descent statements
  concern the full narrow group; the radicand-34 calculation is a Check,
  not another negative-Pell target.
- Form reduction, composition algorithms and general representation theory
  stay with their lattice and quadratic-arithmetic owners. Hecke periods,
  gamma factors, spectral formulas, Weyl sums, subconvexity and asymptotic
  errors stay with the analytic and modular roadmaps.

The one new definition is the total extension in Layer 3, a light definition
on `TauCeti.BinaryQuadraticForm ℤ`. The notation below names existing
objects and ordinary fibres. The distinction between narrow and wide
classes is retained throughout. Multiquadratic Layer 3 supplies the
all-place genus field as the maximal totally real subfield of the narrow
prime-discriminant compositum; if all factors are positive, the compositum
itself is totally real and is that genus field.

## Conventions

Work in any universe with `K : Type*`, `[Field K]` and `[NumberField K]`;
these give characteristic zero and finite degree over ℚ. Let `θ : 𝓞 K`
be an algebraic integer generating `K` over `ℚ`, with

`minpoly_ℤ(θ)=X²-d, ℚ[θ]=K.`

In the real quadratic applications, `d>0` is squarefree and

`D = fundamentalDiscriminant(d) = d if d ≡ 1 (mod 4), and 4d otherwise.`

The minimal-polynomial and generation hypotheses make this a genuine
quadratic presentation; `d=1` does not present the rational field this way.
Thus the real squarefree field applications have `D>1`. The independent
arithmetic statements in Layer 2 allow the fundamental discriminant `D=1`. Keep the squarefree
radicand `d`, the field discriminant `D`, and a character factor `δ`
distinct.

Write `C=Cl⁺(K)`, `W=ClassGroup(𝒪_K)`,
and `π:C→ W` for the forgetful homomorphism. The narrow relation uses
principal ideals with totally positive generators. In a real quadratic field
this agrees with using a generator of positive norm: its two signs agree, and
multiplication by the unit `(-1)` makes two negative signs positive. This
argument is specific to the quadratic signature, not a definition for an
arbitrary number field.

Use the notation

`J=mkPrincipal(θ)∈ C.`

Here `θ` is regarded as a unit of the field, using the nonzero proof from
its minimal polynomial. This is the source's different class: `√D` equals
`θ` or `2θ` up to sign, so `(√D)` and `(θ)` have the same
narrow class. A positive rational multiplier has trivial narrow principal
class, and changing the sign of an ideal's generator leaves the ideal itself
unchanged. No new different or principal-class carrier is implicit in `J`.

A prime discriminant is one of `(-4,8,-8)`, or

`p* = p if p ≡ 1 (mod 4), and −p if p ≡ 3 (mod 4),`

for an odd rational prime `p`. Let `s` be a finite set of distinct prime
discriminants, at most one even, with product `D`. Set `r=#s=ω(D)`,
the number of distinct rational primes ramified in `K`. In the genuine
quadratic case `r≥1`. For `t⊆ s`, put

`δ=∏_(P∈ t)P, δ'=∏_(P∈ s∖ t)P, δδ'=D.`

Both products are nonzero fundamental discriminants in the convention that
includes the empty product `1`. Their signs agree when `D>0`. The narrow
genus character is `χ_t:C→ℤˣ`, whose values are `1,-1`.
When comparing with an integer-valued form character, coerce this value to
`ℤ` explicitly. The arithmetic function `genusCharFun t n` is the
product of the prime-discriminant Kronecker characters at the integer `n`.

Write `q:C→ C/C²` for the existing elementary-two quotient map. Its target
`NumberField.NarrowClassGroup.ElementaryTwoQuotient K` is additive, so the
principal genus is its zero fibre. The quotient `C/C²`, its square-subgroup
fibres, and `C[2]={A:A²=1}` play different roles. Use `h⁺(D)=#C` for
the narrow class number and `h(D)=#W` for the wide class number. Beware
that Duke–Imamoḡlu–Tóth write `h(D)` for the *narrow* class number (§2,
p.950); their formula (4.2) is the narrow count of Layer 1.

Binary forms have the polynomial convention

`Q(x,y)=[a,b,c](x,y)=ax²+bxy+cy², disc (Q)=b²-4ac.`

Use `TauCeti.BinaryQuadraticForm ℤ`, with `Q.eval` and `Q.discrim`; the
content is `gcd(a,b,c)`, and primitive means content one. Proper
equivalence uses determinant-one integral substitutions, equivalently
`PSL₂(ℤ)` because `(-I)` acts trivially. A full
`GL₂(ℤ)` orbit loses orientation. These conventions do not
identify the classical discriminant with an unnormalized bilinear determinant.
A fundamental discriminant `δ` (possibly `1`) is a *fundamental divisor*
of a discriminant `Δ` when `Δ=δδ'` with
`δ'≡0,1 (mod 4)`; for `t⊆ s` as above, `δ` is a
fundamental divisor of `D` with `δ'=∏_(P∈ s∖ t)P`.

## Exact supplier contracts

### From Mathlib

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
`QuotientGroup.lift` in `Mathlib/GroupTheory/QuotientGroup/Defs.lean`
supplies quotient descent, and `QuotientGroup.quotientKerEquivOfSurjective`
in `Mathlib/GroupTheory/QuotientGroup/Basic.lean` supplies the first
isomorphism theorem for a surjective group homomorphism.
`MonoidHom.fiberEquivKerOfSurjective` in
`Mathlib/GroupTheory/Coset/Basic.lean` identifies every fibre of a
surjective homomorphism with its kernel.
`Subgroup.card_eq_card_quotient_mul_card_subgroup` in
`Mathlib/GroupTheory/Coset/Card.lean` gives the natural-cardinality identity
for a subgroup, used here on finite groups. The additive elementary-two
presentation is transported to a multiplicative quotient when applying
these group-theoretic interfaces.

`Nat.eq_sq_add_sq_iff`, in `Mathlib/NumberTheory/SumTwoSquares.lean`, is the full
two-square theorem: primes congruent to three modulo four must have even
valuation. Layer 2 specializes this to positive fundamental discriminants.
`FractionalIdeal`, its membership predicate, `Ideal.absNorm`, `Int.gcd` and
`IsCoprime` are the carriers of Layer 3. Binary forms enter only through
the Tau Ceti carrier specified below.

`Ideal.natAbs_det_basis_change` and `Ideal.absNorm_span_singleton`, in
`Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`, give respectively the absolute
norm from integral bases and the absolute norm of a principal integral ideal.
The first requires bases of the ambient ring and ideal of the same finite
rank over ℤ; the latter takes an element of that ring.

### From Tau Ceti

Use Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The declarations
below are the starting interfaces, not targets of the build.

- `NumberField.NarrowClassGroup`, its `mk` (the narrow class of an invertible
  fractional ideal), `mkPrincipal`, `mk0`, `mk_mk0`, `toClassGroup`,
  `toClassGroup_ker` and `toClassGroup_surjective` supply the existing carrier,
  representatives, kernel-as-principal-range and surjective forgetful map.
  `NumberField.coe_gen_ne_zero` supplies the field unit used in `J`, and
  `NumberField.NarrowClassGroup.mkPrincipal_neg` and
  `mkPrincipal_eq_one_of_isTotallyPositive` give the triviality of a principal
  class with a generator of positive norm in the real quadratic case.
- `NumberField.NarrowClassGroup.mkPrincipal_sq` proves principal classes have
  square one. `NumberField.mkPrincipal_eq_one_or_eq_mkPrincipal_gen` supplies
  the quadratic principal-class dichotomy, and
  `NumberField.mkPrincipal_eq_mkPrincipal_gen_of_norm_neg` identifies the
  negative-norm case. The imported
  `NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one`
  tests injectivity by an integral unit of norm `(-1)`. The narrow finite
  instance and `card_eq_card_classGroup_mul_card_ker` give the class-number
  relation.
- `NumberField.NarrowClassGroup.ElementaryTwoQuotient` and
  `TauCeti.elementaryTwoQuotientMk`, its surjectivity and
  `elementaryTwoQuotientMk_eq_zero_iff` give the genus map and its
  square criterion. `TauCeti.elementaryTwoQuotientEquivSquareQuotient` relates
  it to the direct quotient by squares.
  `NumberField.NarrowClassGroup.card_elementaryTwoQuotient_eq_two_pow_twoRank`,
  `TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` and
  `TauCeti.Multiquadratic.ncard_ramifiedPrimes_eq_card` provide its cardinality.
- In namespace `TauCeti.Multiquadratic`, use `IsPrimeDiscriminant`,
  `oddPrimeDiscriminant_def`, `natCast_dvd_primeDiscriminant_iff`,
  `IsFundamentalDiscriminant`, `fundamentalDiscriminant`,
  `isFundamentalDiscriminant_prod` and
  `prod_primeDiscriminant_mod_four_eq_one` for the signed factorization and
  its subproducts.
- In the same namespace, `genusCharFunNarrowClassGroupHom` is the character,
  and `genusCharFunNarrowClassGroupHom_eq_prod_singleton` its product law.
  `genusCharFunNarrowClassGroupHom_mkPrincipal_gen` is the **singleton** sign
  theorem. `isSquare_mkPrincipal_gen_iff` is the positivity-of-all-factors
  square criterion. The principal genus test is
  `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one`.
- `genusCharFun`, `genusCharFunCoprimeIdealSubmonoid`,
  `mem_genusCharFunCoprimeIdealSubmonoid_iff`,
  `genusCharFunCoprimeIdealHom_apply` and
  `genusCharFunNarrowClassGroupHom_mk0` identify the class character with the
  arithmetic character on a nonzero integral ideal of coprime absolute norm.
  Nonzeroness and coprimality are required before using that evaluation law.
  The membership condition is coprimality of the absolute norm with the
  product `δ` of the indexing subset, not with all of `D`.
- `genusCharFun` is the product over `t` of `primeDiscriminantCharFun`, a
  total function on all integers. `genusCharFun_mul_right`,
  `genusCharFun_eq_zero_iff`, `genusCharFun_eq_one_or_eq_neg_one`,
  `genusCharFun_neg_one_eq_sign_prod` and
  `primeDiscriminantCharFun_neg_one` (the value at `-1` is the sign of the
  prime discriminant) are the arithmetic laws Layer 3 uses, including at
  negative arguments.

- `TauCeti.BinaryQuadraticForm ℤ`, `TauCeti.BinaryQuadraticForm.eval`,
  `TauCeti.BinaryQuadraticForm.discrim`, `TauCeti.BinaryQuadraticForm.eval_smul`
  and `TauCeti.BinaryQuadraticForm.discrim_smul`, in
  `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean`, supply the integral
  carrier and the left `SL(2, ℤ)` action by substitution with the inverse matrix.
- `NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one` and
  `NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, in
  `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean`, supply the
  maximal-order generators `(1+θ)/2` and `θ`. Both require `hmin`, `hgen`
  and squarefree d; their respective congruence hypotheses are `d % 4 = 1`
  and `d % 4 ≠ 1`. Layer 3 transports these generators to either square
  root ω of D and then to β = (−b+ω)/2.

The narrow-class carrier, quotient and cardinality interfaces are in
`TauCeti/NumberTheory/NumberField/NarrowClassGroup/{Basic,ElementaryTwoQuotient,Finite}.lean`;
the quadratic principal-class and norm-unit results are in
`TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean`,
and the nonzero generator proof is in
`TauCeti/NumberTheory/NumberField/Quadratic/Basic.lean`. The generic
elementary-two quotient and square-quotient equivalence are in
`TauCeti/Algebra/Group/ElementaryTwoQuotient/Basic.lean`. The two-rank
and ramified-prime-count results are in
`TauCeti/NumberTheory/Multiquadratic/Quadratic/{TwoRank,Ramification}.lean`.
The character interfaces are in
`TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/{Basic,CoprimeIdeal,NarrowClassGroup,PrincipalGenus,OrdinaryTwoRank}.lean`
and `TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Character.lean`.
The signed discriminant interfaces are in
`TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean`,
`TauCeti/NumberTheory/Multiquadratic/Prime/Discriminants.lean` and
`TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/{Basic,OfSquarefree,Subfactorization}.lean`.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Section 4.17a, `quadratic_weyl_domains`, supplies the real quadratic genus
character for D=δδ′ with both factors fundamental, normalized on coprime
ideals by Kronecker symbols, and its composite value χ(J)=sign δ=sign δ′.
Use this normalization with the pinned `genusCharFunNarrowClassGroupHom`:
its product-of-singletons law and singleton J-value give exactly the same
identity for every t⊆s (Duke–Imamoḡlu–Tóth, §7, p.971, before (7.8)).

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Section 7.20a, `quadraticTraceData`, supplies the form character for
nonsquare Δ=δδ′, δ fundamental and δ′≠0 with δ′≡0,1 (mod 4), on all
indefinite forms and on positive definite forms when Δ<0, including
imprimitive forms. It is zero when the content meets δ; otherwise a
represented integer coprime to δ exists and its Kronecker value is
independent of the choice and of the proper representative. Layer 3 uses
this character and proves that the total extension restricts to it
(Duke–Imamoḡlu–Tóth, §9, p.978, before Proposition 5).

Section 7.32-trace, `biroArithmeticTraceData`, supplies Biró's character
ω_δ for δ>0 fundamental and Δ=δδ′>0 with δ′>0 and
δ′≡0,1 (mod 4), including square Δ. At level one it is defined on
all integral forms of discriminant Δ; at every positive level N it is
the same weight restricted to forms with N∣a. It is zero when the content
is not coprime to δ, and otherwise is (δ/m) at any represented integer m
coprime to δ. Use this arithmetic interface independently of its geodesics
and trace identity. Layer 3 proves agreement on raw level-one forms,
which also gives agreement at every level by restriction
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509, the classical character and
its imprimitive extension).

## How to read the build

Layer 0 identifies the narrow defect and makes character descent unique.
Layer 1 counts the elements in an arbitrary genus using the existing quotient.
Layer 2 uses the supplied value on the distinguished class to obtain signed
prime-discriminant and two-square criteria. Layer 3 extends the supplied
nonsquare and Biró form characters and shows that at a positive fundamental
discriminant it is the narrow ideal genus character of the oriented
coefficient ideal. Layers 0–2 use the pinned narrow-class theory; the sign
normalization in 2.1 is imported from AutomorphicSpectralTheory §4.17a.
Layer 3 also uses MetaplecticAutomorphicForms §§7.20a, 7.32-trace and the pinned form
carrier. `Suggested.lean` states the headline endpoints and the simple
definition they need. Its proved example tests the content obstruction.
Both restriction agreements are README targets: the supplied form-character
functions are absent from the pinned libraries, so those headlines cannot
be stated against those pinned APIs.

## Layer 0: the quadratic narrow defect

### 0.1 The exact kernel

Under the quadratic minimal-polynomial and generation hypotheses, prove
`ker_toClassGroup_eq_pair`: for every `A∈ C`,

`π(A)=1 ↔ A=1 or A=J.`

Thus `kerπ={1,J}` as a set, allowing the displayed entries to coincide.
Since `J²=1`, this is the subgroup `⟨ J⟩`, and the first
isomorphism theorem gives `C/⟨ J⟩≃ W`. Unlike a bound of
two on the kernel cardinality, this identifies its elements and their action.
This holds for either quadratic signature; neither positivity nor
squarefreeness is needed for this kernel identity.
(Duke–Imamoḡlu–Tóth, §2, pp.950–951, narrow and wide classes.)

A class in the kernel is in the range of `mkPrincipal`. Apply the quadratic
principal-class dichotomy to that representative. Conversely, both displayed
classes map to the wide identity. For each `A`, the entire fibre above
`π(A)` is `{A,JA}`. Its two entries coincide precisely when `J=1`;
otherwise multiplication by `J` exchanges them.

*Needs:* Tau Ceti `toClassGroup_ker`,
`mkPrincipal_eq_one_or_eq_mkPrincipal_gen`, `mkPrincipal_sq`,
`toClassGroup_surjective`; Mathlib's quotient-kernel equivalence.

For the real quadratic presentation, without a squarefree restriction, the
fibre and norm-unit consequences are
`π(B)=π(A) ↔ B=A or B=JA` for all A,B; a norm-minus-one integral unit
exists exactly when J=1; and when J≠1, multiplication by J exchanges two
distinct lifts, since JA≠A and J(JA)=A. These give the singleton and pair
Checks below (Duke–Imamoḡlu–Tóth, §2, pp.950–951).
*Needs:* 0.1 and the supplied norm-unit criterion.

**Checks.**

- When `J=1`, the kernel and each wide fibre are singletons. The formula
  must not assert two distinct elements merely because `J²=1`.
- An integral unit of norm `(-1)` makes the forgetful map injective by the
  supplier criterion; the displayed kernel must then collapse.
- In the absence of such a unit, injectivity fails and the displayed entries
  are distinct. Multiplication by `J` must exchange, rather than fix, the
  two narrow lifts of any wide class.

### 0.2 Unique descent of real characters

For a multiplicative homomorphism `χ:C→ℤˣ`, prove
`existsUnique_wideCharacter_iff`:

`(∃! ψ:W→ℤˣ, ψ∘π=χ) ↔ χ(J)=1.`

The quantified `ψ` is also a homomorphism, and the equality is equality
of homomorphisms. The input is not an arbitrary function on classes. As in
0.1, the signature only needs the quadratic presentation, so holds for either
signature. (Duke–Imamoḡlu–Tóth, §7, p.971, paragraph after (7.7).)

The exact kernel shows that `χ` kills `kerπ` precisely when it kills
`J`. Lift through the quotient by that kernel and use the first isomorphism
theorem. Surjectivity proves uniqueness by evaluation at lifts of wide
classes. A descent necessarily kills `J`, because `π(J)=1`.

Every real character kills squares, so all real characters kill a square
`J`, even when `J≠1`. Complex characters need not kill a nontrivial
square. The condition χ(J)=1 for every real character is therefore weaker
than equality of narrow and wide class groups.

*Needs:* 0.1; Mathlib `QuotientGroup.lift` and
`quotientKerEquivOfSurjective`; Tau Ceti `toClassGroup_surjective`.

With only the quadratic presentation, the descent consequences are
unique descent of the trivial character, nonexistence of descent for every
χ with χ(J)=−1, and unique descent of every real χ when J is square
(Duke–Imamoḡlu–Tóth, §7, p.971, after (7.7)).
*Needs:* 0.2 and the fact that ℤˣ has exponent two.

**Checks.**

- The trivial character has exactly one wide descent.
- A character with `χ(J)=-1` has no descent.
- If `J=1`, every real class character descends. If `J` is a nontrivial
  square, every genus character still descends, without an assertion about
  arbitrary complex characters.

### Examples

For `ℚ(√3)`, `D=12`, the prime-three obstruction in Layer 2
will give `J≠1`. Its two narrow lifts over any wide class are `A` and
`JA`. Each singleton genus character for `{-4,-3}` takes value `(-1)`
on `J`, so neither descends; their product and the empty-factor character
do descend. For `ℚ(√2)`, the integral unit `1+√2` has norm
`(-1)`, so the kernel collapses. The two outcomes check both sides of the
kernel dichotomy without computing a class number.

### Dependencies

Multiquadratic's quadratic principal-class and narrow-class interfaces, and
Mathlib's quotient-group theory. The second target uses the first; neither
requires a binary-form supplier.

## Layer 1: the number of classes in a narrow genus

### 1.1 Equal finite fibres

Under the real quadratic presentation and prime-discriminant factorization,
for arbitrary `g∈ C/C²` let `G_g={A∈ C:q(A)=g}`. This is an ordinary
fibre subtype of the existing map, not a new genus definition. Prove
`card_genusFiber_mul_twoPow`:

`2^(r-1) #G_g=#C, r=#s.`

The Lean signature uses natural-number cardinalities and natural subtraction
in `s.card - 1`; the genuine quadratic factorization has `r≥1`.
Equivalently, as a rational-number formula,

`#G_g=2^(1-r)h⁺(D).`

This is a narrow class number. The negative exponent in the second display
is not a natural-number exponent. The signature also works
for imaginary quadratic presentations: it requires squarefreeness and the
factorization, but not positivity of `d`. The real specialization is the
one used here. (Duke–Imamoḡlu–Tóth, §4, p.959, (4.1)–(4.2).)

Choose a lift `A_0` of `g`. Multiplication by `A_0` identifies the square
subgroup with `G_g`. The choice affects the equivalence, not its
cardinality. The subgroup cardinality theorem gives
`#C=#(C/C²) #C²`. The supplied quotient/two-rank formula and ramified
prime count give `#(C/C²)=2^(r-1)`; substitution proves the target.
Surjectivity makes each fibre nonempty, finiteness of `C` makes it finite,
and the formula proves equal cardinalities and `2^(r-1)∣ h⁺(D)`.

*Needs:* the elementary-two map, its surjectivity and square-quotient
equivalence; the narrow finite instance; the quotient-cardinality,
narrow-two-rank and ramified-prime-count theorems; Mathlib's surjective fibre
equivalence and subgroup cardinality formula. Layer 0 is not needed for the
count itself.

Under the hypotheses of 1.1,
r=1,2,3 give quotient cardinality 1,2,4 and respectively
`#G_g = #C`, `2·#G_g = #C`, `4·#G_g = #C` for every g.
For `Multiplicative (ZMod 8)` every elementary-two fibre has four elements,
the quotient has two, and two-torsion has two (Duke–Imamoḡlu–Tóth, §4,
p.959, (4.1)–(4.2), and direct finite-group calculation).
*Needs:* 1.1, its quotient cardinality suppliers and Mathlib's cyclic group.

**Checks.**

- For `s={5}` or `s={8}`, `r=1` and there is one genus containing
  all narrow classes. This alone says nothing about class number one.
- For `D=12=(-4)(-3)` or `D=28=(-4)(-7)`, there are two genera, each with
  `h⁺/2` classes.
- For `D=60=(-4)(-3)5`, there are four genera, each with `h⁺/4` classes.
- In a cyclic group of order eight, the square subgroup has four elements,
  the quotient has two elements, and each quotient fibre has four elements.
  The two-torsion subgroup has only two elements and cannot replace a fibre.

### Examples

The `D=60` factorization has three signed prime discriminants even though
its positive rational prime divisors are `2,3,5`. Thus the exponent is
`3-1=2`, independently of the signs of the factors. Each of the four fibres
has the same cardinality, and their disjoint union has `h⁺` elements.
The cyclic-eight fibre and two-torsion counts are four and two,
respectively, which detects confusing the two carriers.

### Dependencies

Multiquadratic's genus quotient, narrow two-rank and ramification count;
Mathlib's finite quotient and fibre cardinalities. Enumeration, form
reduction and effective class-number calculations are outside this layer.

## Layer 2: signs, principal genera and arithmetic criteria

### 2.1 Composite character values on the distinguished class

Use the composite sign identity in the AutomorphicSpectralTheory §4.17a
supplier contract, with the real quadratic hypotheses and t⊆s. Its pinned
normalization is χ_t(J)=sign δ=sign δ′, with χ_t read in ℤ
(Duke–Imamoḡlu–Tóth, §7, p.971, before (7.8)).

Positivity is essential to complementary signs. For D=−4=1·(−4), the
signs are 1 and −1; in the imaginary quadratic signature J=1. The
arithmetic normalization at −1 gives −1 for t={−4},{−8}, and 1 for
t={8},∅,{−4,−3},{8,17}, by `genusCharFun_neg_one_eq_sign_prod`.

*Needs:* AutomorphicSpectralTheory §4.17a; the pinned narrow genus character,
product-of-singletons law, singleton J-value and nonzero fundamental subproducts.

**Checks.**

- For `D=12=(-4)(-3)`, each singleton has value `(-1)` on `J`, while
  the empty and full factors have value `1`.
- At −1 the arithmetic characters for −4 and −8 both give −1, while
  those for 8 and the empty factor both give 1. This excludes the opposite
  sign convention.
- For `D=24=(-8)(-3)`, the dyadic factor is `(-8)`. Substituting `8`
  would change the product to `(-24)`.
- For `D=8`, the singleton value is `1`. For `D=136=8·17`, all
  subset values on `J` are `1`, even if `J` is nontrivial.
- The empty factor has product `1`, not zero. For `D<0`, complementary
  factor signs are opposite, as the `D=-4` example demonstrates.

### 2.2 Positive prime discriminants and prime divisors

For any positive integer discriminant `D` expressed as a finite set `s`
of prime discriminants with at most one even member and product `D`, prove
`primeDiscriminants_positive_iff`:

`(∀ P∈ s, P>0) ↔ (∀ p∈ℕ, p prime , p∣ D⇒ p≢3 (mod 4)).`

No field carrier is required, and `D=1,s=∅` is allowed.
Divisibility on the right uses the integer cast of the natural prime.
This is the elementary step that turns Tau Ceti's sign criterion
`isSquare_mkPrincipal_gen_iff` into the prime-divisor form in which
Duke–Imamoḡlu–Tóth state when `J` lies in the principal genus (§4, p.960,
paragraph after (4.4)).

For an odd prime-discriminant factor, negativity is exactly the condition
`p≡3 (mod 4)` on its underlying prime. A prime dividing the product
divides a factor; the underlying-prime theorem identifies which rational
prime that factor lies over. Thus absence of a prime of residue three forces
all odd factors positive. Positivity of the full product then forces the
possible even factor positive as well, hence equal to `8`. Conversely all
positive odd factors lie over primes of residue one, and an even factor lies
over two. At most one even factor prevents an invalid dyadic factorization.

*Needs:* `IsPrimeDiscriminant`, `oddPrimeDiscriminant_def`,
`natCast_dvd_primeDiscriminant_iff`, elementary prime divisibility and finite
products. This is independent of the field presentation.

The boundary calculations give the no-prime-of-residue-three
condition for D=1,5,8,40,136 and −4, the divisibilities 3∣12 and 3∣24,
and the invalid double-even product `(−4)(−8)=32`, whose prime divisors
also satisfy that condition (Duke–Imamoḡlu–Tóth, §4, p.960, and signed
factor arithmetic). Thus positivity and the at-most-one-even condition
are separate hypotheses.
*Needs:* 2.2 and integer prime divisibility.

**Checks.**

- `D=12` and `D=24` fail: three divides the product, and their signed
  factorizations have negative factors.
- `D=5,8,40,136` pass. The `D=8` case checks the positive even prime
  discriminant; `D=1` checks both vacuous quantifications.
- The invalid factorization (−4)(−8)=32 has two negative even factors,
  while its only prime divisor is 2. This rejects dropping the at-most-one-even
  hypothesis independently of positivity.
- Dropping `D>0` is false: `D=-4` has no prime divisor of residue three,
  but its prime-discriminant factor is negative.

### 2.3 The two-square criterion for fundamental discriminants

For `D>0` satisfying `IsFundamentalDiscriminant D`, prove
`fundamental_sumTwoSquares_iff`:

`(∃ x,y∈ℤ, D=x²+y²) ↔ (∀ p∈ℕ, p prime , p∣ D⇒ p≢3 (mod 4)).`

The coordinates need not be coprime or nonzero, and `D=1` is included.
Fundamentality means either squarefree `D≡1 (mod 4)`, or `D=4e` with
`e` squarefree and `e≡2,3 (mod 4)`.
(Duke–Imamoḡlu–Tóth, §4, p.960, paragraph after (4.4); Mathlib
`Nat.eq_sq_add_sq_iff`.)

Use Mathlib's full even-valuation criterion. Every odd prime dividing a
positive fundamental discriminant has valuation one: squarefreeness gives
this in the odd branch, and multiplication by four changes only the
two-adic valuation in the even branch. A prime of residue three therefore
cannot divide `D`. Convert integer representations to natural ones using
absolute values of the coordinates, and natural representations back by
casts. Positivity of `D` must be kept during that conversion.

*Needs:* `IsFundamentalDiscriminant`, its squarefree cases, and Mathlib's
two-square valuation theorem. Do not replace the valuation theorem by a
no-divisor criterion for arbitrary positive integers.

The boundary calculations give the displayed
representations of 1,5,8,136 below, exclude a representation of 12, and
records `9=0²+3²`, `3∣9` and the nonfundamentality of 9
(Duke–Imamoḡlu–Tóth, §4, p.960, with elementary integer calculation).
*Needs:* 2.3 and the supplied fundamental-discriminant predicate.

**Checks.**

- `5=1²+2²`, `8=2²+2²` and `136=6²+10²` pass. The last two
  also reject a spurious primitive-representation hypothesis.
- `D=12` has no representation as a sum of two integer squares.
- `9=0²+3²` has prime divisor three but is not fundamental. It rejects
  removing fundamentality from this theorem.
- `1=1²+0²` is allowed arithmetically, while it does not produce a
  quadratic field presentation in the conventions above.

### 2.4 The distinguished class in the principal genus

Under the real quadratic presentation and prime-discriminant factorization,
prove `J_square_iff_sumTwoSquares`:

`J∈ C² ↔ no prime p≡3 (mod 4) divides D ↔ ∃ x,y∈ℤ, D=x²+y².`

This translates the supplier's all-positive-prime-discriminants square
criterion into two arithmetic interfaces. Combine it with 2.2 and 2.3;
fundamentality of the full product supplies the latter's hypothesis.
Equivalently every `χ_t(J)=1`: the principal genus theorem tests the
singleton characters and the product law gives all subsets. By 0.2, each
of those characters then has a unique wide descent.
(Duke–Imamoḡlu–Tóth, §4, p.960, paragraph after (4.4); §7, p.971,
paragraphs after (7.7) and before (7.8).)

The conclusion is that `J` is square, not that `J=1`. In
`ℚ(√34)`, `D=136=8·17`, the distinguished class is a
square but is nontrivial: there is no integral unit of norm `(-1)`. The
negative-Pell distinction is a boundary example, not a new Pell theorem or
algorithm. Narrow genera and narrow characters remain the objects being
tested. When all prime-discriminant factors are positive, every embedding
of each square root is real, so their compositum is totally real and equals
the all-place genus field supplied by Multiquadratic Layer 3. For mixed-sign
factors the all-place genus field is its maximal totally real subfield.

*Needs:* 2.2, 2.3, 0.2; Tau Ceti `isSquare_mkPrincipal_gen_iff`, principal
genus test, character product law and fundamental-product theorem.

For any K,θ satisfying the quadratic minimal polynomial and generation
hypotheses with d=34, the Check below gives that J is a
square, J≠1, and there is no integral unit of norm −1. For the last
assertion, the least unit greater than one of norm +1 is ε=35+6√34:
`1+34y²` equals 35,137,307,545,851 for 1≤y≤5, none a square, while
`35²−34·6²=1`. For a putative norm-minus-one unit, choose its sign and
inverse to make its chosen real value u>1. Choose n with
`ε^n≤u<ε^(n+1)` and divide by ε^n to obtain another such unit v in
[1,ε). Writing v=x+y√34 gives `y=(v+v⁻¹)/(2√34)`, hence 1≤y≤6.
But `34y²−1` equals 33,135,305,543,849,1223 for those six y, none a
square. Here the maximal order is ℤ[√34] (Duke–Imamoḡlu–Tóth, §2,
p.951, norm-unit criterion; §4, p.960, principal genus criterion). As a
second check, an integral square root x+y√34 of ε would satisfy
`x²+34y²=35` and `2xy=6`; the integer possibilities xy=3 instead give
`x²+34y²=43` or 307.
*Needs:* 2.4, 0.1, the integral-basis supplier and the Archimedean property of ℝ.

**Checks.**

- `D=12` puts `J` outside the principal genus, since three divides `D`.
- `D=136` puts `J` inside the principal genus, witnessed arithmetically
  by `136=6²+10²`.
- The latter case must not imply `J=1` or produce a negative-norm integral
  unit. Those are stronger conditions.
- Character descent here refers to all narrow genus characters; it does
  not replace narrow ideal equivalence by wide equivalence in the form
  dictionary.

### 2.5 A prime-divisor obstruction to trivial narrow defect

Under the real quadratic conventions, if a natural prime `p` divides `D`
and `p mod 4=3`, prove `J_ne_one_of_prime_threeModFour`: `J≠1`, there is
no integral unit of norm `(-1)`, and

`h⁺(D)=2h(D).`

Moreover `π` is noninjective and its kernel consists of two distinct
elements. First 2.4 makes `J` nonsquare; since one is square, `J≠1`.
Apply 0.1, the norm-unit injectivity criterion, and the narrow/wide cardinality
formula to obtain the consequences. This uses the **field** discriminant,
not an arbitrary multiple of it.
(Duke–Imamoḡlu–Tóth, §2, p.951, paragraph before the minus continued
fractions.)

*Needs:* 2.4, 0.1; Tau Ceti's injectivity/norm-unit criterion and
`card_eq_card_classGroup_mul_card_ker`.

For d=3 or d=7, with hmin and hgen as in the conventions,
the boundary calculation gives that J is nonsquare, there is no
norm-minus-one integral unit and `#C=2·#W`. With d=2 and the same presentation
hypotheses, the boundary calculation gives the existence of an integral
unit with value 1+θ and norm −1, and J=1 (Duke–Imamoḡlu–Tóth, §2,
pp.950–951; §4, p.960).
*Needs:* 2.5, 0.1 and the supplied norm-unit criterion.

**Checks.**

- For `d=3,D=12`, take `p=3`; the kernel is a distinct pair and the
  narrow/wide class-number ratio is two. The squares modulo 3 are 0,1,
  excluding a norm-minus-one unit in ℤ[√3].
- For `d=7,D=28`, take `p=7`, with the same conclusions; −1≡6
  is absent from the square residues 0,1,2,4 modulo 7.
- For d=2, (1+θ)(θ−1)=1 and N(1+θ)=1−2=−1, so the defect
  collapses to J=1. This separates the collapsed case from the two obstructions.
- The converse fails: `D=136` has no prime divisor of residue three,
  although `J≠1`. The absence of this obstruction does not construct
  a norm `(-1)` integral unit.

### Examples

For `D=12`, the two singleton signs are `(-1)`, `J` is nonsquare and
nontrivial, the narrow class number is twice the wide one, and each of the
two genera has `h⁺/2` classes. For `D=8`, the single factor is positive,
`8=2²+2²` and `1+√2` has norm `(-1)`, so `J=1`. For `D=136`, all
real class characters kill `J` and `J` is square, while `J≠1`. Together these
examples distinguish a nonsquare defect, a collapsed defect, and a nontrivial
defect invisible to real characters.

### Dependencies

Layer 0 for unique descent and the obstruction consequences; the
Multiquadratic character and principal-genus interfaces; prime-discriminant
arithmetic; Mathlib's sum-of-two-squares theorem. The sign and arithmetic
targets do not need form reduction or analytic inputs.

## Layer 3: genus characters of binary forms

### 3.1 Extension of the supplied form character

For any finite set t of integers put `δ = ∏ P ∈ t, P`. When its members
are prime discriminants and at most one is even, δ is a fundamental
discriminant, possibly 1.
Extend the characters of MetaplecticAutomorphicForms §§7.20a, 7.32-trace to every
`Q : TauCeti.BinaryQuadraticForm ℤ` as `binaryFormGenusChar t Q`, written `χ_δ(Q)` for
`Q=[a,b,c]`. Its value is `genusCharFun t m` if Q represents an integer m coprime to δ,
and zero if no such integer exists. In the first case `m` is a chosen such represented integer. The
definition is total on integral binary forms and takes no discriminant hypothesis.
In Lean the represented integer is picked by choice, so the definition has a
real body. That the choice does not matter is the first API theorem, and it
needs `δ` to be a fundamental divisor of `disc Q`. The
represented integer may be negative. Under these factor hypotheses,
`genusCharFun` is the Kronecker character `(δ/·)` on all integers, so its
value at `-1` is `sign δ`. On the supplied nonsquare domain this is the generalized genus character of
Duke–Imamoḡlu–Tóth (§9, p.978, definition preceding Proposition 5) and the
classical genus character for a fundamental divisor, together with its
extension to imprimitive forms (Gross–Kohnen–Zagier, Ch. I §2, p.508, the
paragraph opening the section; Proposition 1 there is the level-`N`
generalization, which is not needed here). Gross–Kohnen–Zagier use nonzero
discriminants (Notations, p.503); the local argument below also proves the
evaluation law at discriminant zero. The extension also includes square
discriminants and negative definite forms. Prove nonsquare restriction agreement: if t consists of prime discriminants,
at most one even, Δ=δδ′ is nonsquare, δ′≠0, δ′≡0,1 (mod 4), and Q is
positive definite when Δ<0, then `binaryFormGenusChar t Q` equals the
character supplied by MetaplecticAutomorphicForms §7.20a.

Prove Biró restriction agreement on raw level-one forms: if t consists of
prime discriminants, at most one even, δ>0, Δ=δδ′>0 with
δ′>0 and δ′≡0,1 (mod 4), and Q.discrim=Δ, then
`binaryFormGenusChar t Q = ω_δ(Q)`, with ω_δ supplied by
MetaplecticAutomorphicForms §7.32-trace. Square Δ is included. For every
positive integer N, restriction to forms with N∣a gives agreement with
the level-N weight; no primitivity or coprimality with N is assumed
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509, classical character and
imprimitive extension). For each agreement, both values are zero when the
content is not coprime to δ; otherwise compare them at one common coprime
represented integer. The supplied existence, independence and invariance
are used on the overlaps. The evaluation and content laws below establish
the total extension, retaining both supplied characters on their domains.

*Needs:* MetaplecticAutomorphicForms §§7.20a, 7.32-trace; the pinned form carrier,
`genusCharFun`, its multiplicativity, zero and unit-value laws; the local
argument of Gross–Kohnen–Zagier, Ch. I §2, proof of Proposition 1, p.509.

Its API:

- `binaryFormGenusChar_eq_of_represents` (evaluation law). Suppose t consists
  of prime discriminants, at most one even, and `Q.discrim=b²−4ac=δδ'` with `δ'≡0,1 (mod 4)`, and suppose
  `Q(x,y)` is coprime to `δ`. Then
  `χ_δ(Q)= genusCharFun t (Q(x,y))`. The form may be
  imprimitive, definite, indefinite or of square discriminant, and the value
  may be negative. Compare the factor at one `P∈ t`, lying over the prime
  `p`. Since `Q(x,y)` is prime to `p` and `p` divides the discriminant, `p`
  cannot divide both `a` and `c`. When `p∤ a`, the identity
  `4a Q(x,y)=(2ax+by)²- disc (Q) y²` shows that
  `a Q(x,y)` is a nonzero square modulo `p` for odd `p`, so the factor
  equals the character of `P` at `a`. For `p=2`, write `b=2b'`; then
  `a Q(x,y)=(ax+b'y)²-( disc Q/4) y²`, and
  `disc Q/P=(δ/P) δ'≡0,1 (mod 4)` makes this
  odd value `≡1 (mod 4)` for `P=-4`, `≡±1 (mod 8)` for `P=8` and
  `≡1,3 (mod 8)` for `P=-8`. When `p∤ c` argue the same way with
  `c`. Either way the factor does not depend on `(x,y)`
  (Gross–Kohnen–Zagier, Ch. I §2, proof of Proposition 1, p.509).
- `binaryFormGenusChar_eq_zero_iff` (zero law): `χ_δ(Q)=0` exactly
  when `gcd(a,b,c)` is not coprime to `δ`. If a prime divides both
  the content and `δ`, it divides every represented value. Conversely,
  when the content is prime to `δ`, for each prime `p∣δ` one of
  `Q(1,0)=a`, `Q(0,1)=c`, `Q(1,1)=a+b+c` is prime to `p`. The Chinese
  remainder theorem combines these choices into one pair `(x,y)` with
  `Q(x,y)` coprime to `δ`, and `genusCharFun` is `±1` there
  (Gross–Kohnen–Zagier, p.509, the representation fact quoted in the proof).
  Only the prime-discriminant hypotheses are needed; no restriction on
  even factors or on the form's discriminant is imposed.
- At the empty factor: for `t=∅` the value is `1` on
  every form, the zero form included (Gross–Kohnen–Zagier, Ch. I §2, p.508,
  empty Kronecker product).
  *Needs:* the defining represented-value predicate and the empty product.
- Scalar multiplication: for t a set of prime discriminants, at most
  one even, with `Q.discrim=δδ′` and `δ′≡0,1 (mod 4)`,
  `χ_δ(μ Q)= genusCharFun t μ·χ_δ(Q)`
  for every integer μ, including zero (Gross–Kohnen–Zagier, Ch. I §2,
  p.508, imprimitive extension).
  *Needs:* evaluation and zero laws, `genusCharFun_mul_right`.
- Invertible substitution: `χ_δ(Q∘ g)=χ_δ(Q)` for
  every `g∈ GL₂(ℤ)`, because both forms represent the
  same integers. In particular `χ_δ` is a class function for proper
  equivalence, and `χ_δ([a,-b,c])=χ_δ([a,b,c])`. No factor or discriminant
  hypotheses are needed: the predicate selecting a represented integer is
  unchanged (Gross–Kohnen–Zagier, Ch. I §2, pp.508–509, representation definition).
  *Needs:* the defining predicate and invertibility of g.
- Proper equivalence: for every t,Q and `γ : SL(2, ℤ)`,
  `binaryFormGenusChar t (γ • Q) = binaryFormGenusChar t Q`
  (Gross–Kohnen–Zagier, Ch. I §2, p.508, proper invariance).
  *Needs:* the preceding substitution law and `TauCeti.BinaryQuadraticForm.eval_smul`.
- Negation: for t a set of prime discriminants, at most
  one even, with `Q.discrim=δδ′` and `δ′≡0,1 (mod 4)`,
  `χ_δ(-Q)= sign (δ) χ_δ(Q)`, because
  `-Q` represents `-m` and `genusCharFun` at `-1` is
  `sign δ` (`primeDiscriminantCharFun_neg_one`). The
  same holds for `[-a,b,-c]`, which is `-Q` composed with
  `diag(1,−1)` (Gross–Kohnen–Zagier, Ch. I §2, p.508, scaling by −1).
  *Needs:* scalar and substitution laws, `genusCharFun_neg_one_eq_sign_prod`
  in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean`.
  This is the scalar law at μ=−1, using `neg_one_mul`.

`Suggested.lean` states the extension's definition, represented-value and
content laws, and the ideal-character comparison of 3.2. Scalar,
substitution and sign laws are prose API consequences. The supplied action
is γ • Q = Q ∘ γ⁻¹, by `TauCeti.BinaryQuadraticForm.eval_smul`;
the GL₂(ℤ) law above uses direct substitution Q ∘ g.
The proved example tests the total definition's content obstruction directly.

**Checks.**

- `Q=[1,0,-3]` has discriminant `12=(-4)(-3)`. With `δ=-4` it represents
  `1` at `(1,0)`, so the value is `1`. It also represents `-3` at `(0,1)`,
  and the character of `-4` at `-3` is again `1`. A definition that
  evaluated at `|m|` would give `-1` at the value `-3` and fail
  well-definedness here.
- `-Q=[-1,0,3]` represents `3` at `(0,1)`, giving `-1= sign (-4) ·χ_(-4)(Q)`, as the sign law requires.
- The imprimitive form `[2,0,-6]` has discriminant `48=(-4)(-12)` with
  `-12≡0 (mod 4)`. Its content `2` shares the prime `2` with `-4`, so
  `χ_(-4)` is `0` on it. A definition giving every form a unit value fails
  this test.
- `x²+2y²` has discriminant `-8=(-4)·2`, and `2≢0,1 (mod 4)`.
  It represents `1` and `3`, where the character of `-4` takes the values
  `1` and `-1`. So the congruence condition on `δ'` cannot be dropped
  from the evaluation law.
- At discriminant `-15=5·(-3)` with `δ=5`, the form `[2,1,2]`
  represents `2` and `(5/2)=-1`, while the principal form `[1,1,4]`
  represents `1`. The character separates these two proper classes.
- With δ=1 the value is 1 for every form, including the zero form, as the
  empty Kronecker product gives. The represented value zero is coprime to one;
  it cannot be used as a nonzero principal ideal in the comparison proof.
- `T • [1,0,−3] = [1,−2,−2]` has the same value 1. Direct substitution by
  T would give [1,2,−2], so this fixes the action convention.

- At Δ=−20, δ=−4, the positive definite forms [1,0,5] and [2,2,3]
  represent 1 and 3, giving 1 and −1, respectively, for both the supplied
  character and its extension. At Δ=12, δ=−4, both give −1 on [3,0,−1].
  At Δ=48, δ=−3, [2,0,−6] instead has value (−3/2)=−1 for both
  characters; its content 2 is coprime to 3. A changed sign on the overlap
  or a rule setting every imprimitive value to zero fails these checks.
- At Δ=0 and δ=−4, [1,0,0] has value 1: every coprime represented
  value is an odd square and is 1 modulo 4. At Δ=16, [1,0,−4]
  represents 1 and −3, both with value 1. These forms lie outside the
  nonsquare supplier domain; the cofactors are 0 and −4, both 0 modulo 4.
- At Δ=25=5·5 and t={5}, both the extension and Biró's level-one
  character give 1 on [1,1,−6], evaluated at 1; −1 on [2,1,−3],
  evaluated at 2 since (5/2)=−1; and 0 on [5,5,0], whose content is 5.
  These square-discriminant values test both unit signs and the content
  obstruction. The latter two forms also lie at levels 2 and 5,
  respectively, with the same values; in particular level 5 requires
  neither a primitive form nor coprimality of the level with δ.
- At Δ=δ=δ′=1 and t=∅, [0,1,0] represents 1 at (1,1), so both
  characters give 1 at every positive level, since every N divides a=0.
  This checks the empty factor and a zero leading coefficient in the
  square domain, without introducing a quadratic field or a closed cycle.
- At Δ=−20, δ=−4, the negative definite form [−1,0,−5] has value −1,
  whereas [1,0,5] has value 1. For δ=5, [2,1,2] and its
  negative both have value −1 since sign 5=1. In the content-zero branch
  [2,0,−6] and its negative both give 0. These check the scalar μ=−1 law.
- For the zero form, a nonempty prime-discriminant factor gives value 0,
  since gcd(0,δ)=|δ|>1, whereas the empty factor gives 1. Thus scaling
  any form by μ=0 gives 0=0·χ_δ(Q) for nonempty t and 1=1·1 for t=∅.
  The total definition includes both branches.
- The content law also allows t={−4,8}, product −32: [1,0,0] gives 1
  and [2,0,0] gives 0, matching gcd(1,−32)=1 and gcd(2,−32)=2.
  This tests that the content law needs no at-most-one-even hypothesis.

### 3.2 Agreement with the narrow ideal genus character

Under the real quadratic conventions, let `t⊆ s` and `δ=∏_(P∈ t)P`. Fix `ω∈ K` with `ω²=D`, and let `Q=[a,b,c]` have
`b²-4ac=D`. Let `𝔞` be an invertible fractional ideal of
`𝒪_K` whose elements are exactly the integral combinations of `a`
and `(-b+ω)/2`. Prove `formCharacter_eq_idealCharacter`:

The equality is `χ_δ(Q) = χ_t([𝔞]⁺)` for `a > 0`, and
`χ_δ(Q) = χ_t(J[𝔞]⁺)` for `a < 0`, with `χ_t` read in `ℤ`. Since `D` is fundamental and greater than
one, `Q` is primitive and `a≠0` (Duke–Imamoḡlu–Tóth, §2, p.951).
The class on the right is the narrow class, in the library group, of the
ideal that IntegralLattices B2 attaches to `Q`: `𝔞` when `a>0`,
and `√D · 𝔞` when `a<0`, where `[√D]⁺=J`.
(B2 takes that class in GlobalNumberFields' `NarrowPic`; no comparison of the
two groups is used here.) For `a>0` it is
also the class that Duke–Imamoḡlu–Tóth attach to `Q`. Their ideal is
`wℤ+ℤ` with `w=(-b+√D)/(2a)` and `w^σ<w`, and
`Q(x,y)=N(x-wy)/N(wℤ+ℤ)`. That ideal is
`a^(-1)𝔞`, in the same narrow class because `a>0` (§2, p.952).
The statement is theirs for `D>0` fundamental (§9, p.978, sentence before
Proposition 5). Either square root `ω` may be used. Replacing `ω`
by `-ω` replaces `𝔞` by its conjugate, whose class is the
inverse class, and `χ_t` takes the same value on a class and its inverse.

One proof route is as follows. First take t = ∅: the form character and
the empty-product ideal character are both one, including on a represented value zero. For t ≠ ∅,
the prime-discriminant hypotheses give |δ| > 1, so a represented integer
coprime to δ cannot be zero. Write `β=(-b+ω)/2`. It is a root of `X²+bX+ac`, so it is
integral. To obtain the maximal order, use the two quadratic integral-basis
suppliers below. If d ≡ 1 (mod 4), then D = d and ω = ±θ; the supplied
generator (1+θ)/2 differs from (D+ω)/2 by an integer after changing the sign
of θ if necessary. If d ≢ 1 (mod 4), then D = 4d and ω = ±2θ, so
(D+ω)/2 = 2d ± θ also generates the supplied maximal order. Finally,
(D+ω)/2 − β = (D+b)/2 is integral since b and D have the same parity.
Thus 𝒪_K = ℤ + βℤ, with the linear independence of 1,β coming from the
genuine quadratic presentation. Hence `𝔞=aℤ+βℤ` is an
integral ideal of index and absolute norm `|a|`. For integers `u,v`,
`N(ua+vβ)=a Q(u,-v)`. Take any `m=Q(x,y)` coprime to `δ`; one
exists by the zero law of 3.1, and `χ_δ(Q)= genusCharFun t m` by the evaluation law. Put `α=xa-yβ∈𝔞`, so
`N(α)=am≠0`. The ideal `𝔟=α𝔞^(-1)` is
integral of absolute norm `|m|`, coprime to `δ`. So `𝔟` lies
in the coprime-ideal submonoid, and
`χ_t([𝔟]⁺)= genusCharFun t |m|`
(`genusCharFunNarrowClassGroupHom_mk0`, `genusCharFunCoprimeIdealHom_apply`).
In the real quadratic field a principal ideal with a generator of positive norm
has trivial narrow class, and one with a generator of negative norm has class
`J`. So `[𝔟]⁺=[𝔞]^(-1)` when `am>0`, and
`J[𝔞]^(-1)` when `am<0`. Finally
`χ_t(J)= sign δ` (2.1),
`genusCharFun t m=( sign δ)^([m<0]) genusCharFun t |m|`, and `χ_t` is `±1`-valued, so
`χ_t(A^(-1))=χ_t(A)`. The exponents of `sign δ` that
occur are `[m<0]+[am<0]` on one side and `[a<0]` on the other, and these have
the same parity. This gives the displayed equality in all four sign cases.
Choosing `m>0` when `a>0` (possible by moving `(x,y)` by multiples of
`δ`) reduces the main case to `[𝔟]⁺=[𝔞]^(-1)` and
`N(𝔟)=m`. That is the norm-form computation of Duke–Imamoḡlu–Tóth
§2, p.952.

*Needs:* 3.1 (evaluation and zero laws), 2.1; Tau Ceti `NarrowClassGroup.mk`,
`mk_mk0`, `mkPrincipal_eq_mkPrincipal_gen_of_norm_neg`,
`mkPrincipal_eq_one_of_isTotallyPositive`, `mkPrincipal_neg`, the
coprime-ideal submonoid and evaluation law, `genusCharFunNarrowClassGroupHom_mk0`,
`primeDiscriminantCharFun_neg_one`; Mathlib's absolute ideal norm of a
principal ideal and the index of a sublattice given by a basis change:
`Ideal.absNorm_span_singleton`, `Ideal.natAbs_det_basis_change`; Tau Ceti
`NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one` and
`NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, with the respective
congruence hypothesis and the standing minimal-polynomial, generation and
squarefreeness hypotheses.

The empty-factor comparison is 1=1 on every form and every narrow class,
even when the represented integer is zero; no zero ideal is formed
(Duke–Imamoḡlu–Tóth, §9, p.978). The following checks evaluate the actual
coefficient ideals and their oriented classes using the integral-basis and
norm suppliers and the form laws of 3.1.

**Checks.**

- For t=∅ and any form of discriminant D, both characters equal 1.
  In particular [1,0,−3] at D=12 has Q(0,0)=0, coprime to the empty
  product 1. The equality is 1=1 without forming the zero ideal. The zero
  form itself is outside this comparison because its discriminant is 0.
- `D=12`, `ω²=12`, so `ω/2=±√3`. For `Q=[1,0,-3]`,
  `𝔞=ℤ+√3 ℤ=𝒪_K`, of trivial class.
  Every `χ_t` has value `1` on this class, and `χ_δ(Q)=1` at the
  represented value `1`.
- For `Q=[3,0,-1]`, `𝔞=3ℤ+√3 ℤ=√3 𝒪_K`, of class `J` since `N(√3)=-3`. Then
  `χ_{−4}(J)=-1`, and `Q` represents `3` with character `-1`.
- For `-Q=[-1,0,3]` the set `𝔞` is again `𝒪_K`. The
  unoriented class would give `1`, but the oriented class `J` gives `-1`,
  which agrees with `χ_(-4)(-Q)=-1` from 3.1. Moreover `x²-3y²` does not
  represent `-1` modulo `3`, so `Q` and `-Q` are not equivalent. This is the
  orientation witness of IntegralLattices B2. The proper rotation gives
  S • [−1,0,3]=[3,0,−1], with the same character −1.
- `D=5`, `Q=[1,1,-1]`: `𝔞=ℤ+(-1+√5)/2ℤ= 𝒪_K`, and `χ_t` is `1` for `t=∅` and `t={5}`; the
  empty factor is valid input.
- Duke–Imamoḡlu–Tóth's table (§2, p.952, (2.3)–(2.5)) says that if `Q`
  corresponds to `A`, then `[a,-b,c]` corresponds to `A^(-1)`, `[-a,b,-c]` to
  `JA` and `-Q` to `JA^(-1)`. Under `χ_t` these labels become the
  invariance and sign laws of 3.1. The comparison must reproduce all three.
  Swapping `JA` and `JA^(-1)` is invisible to real characters, but it is
  still a wrong statement about classes; this roadmap uses only the
  character values.

### Examples

For `D=12` and `δ=-4`, the forms `Q=x²-3y²` and `-Q` have character
values `1` and `-1`. They are computed at the represented values `1` and `3`,
or equally at `-3` and `-1`. Their unoriented coefficient ideals coincide, so
an unoriented comparison would force an incorrect equality. After the proper
rotation of `-Q` to `3x²-y²`, its ideal `(3,√3)=√3 𝒪_K`
gives exactly `J`. This checks the orientation, the sign of the represented
value, the dyadic Kronecker normalization and the sign factor
`χ_t(J)= sign δ` at once.

### Dependencies

The supplied sign normalization in 2.1, MetaplecticAutomorphicForms §§7.20a, 7.32-trace,
and the pinned Tau Ceti narrow class group, coprime-ideal
genus character and prime-discriminant characters; the binary form carrier,
evaluation, discriminant and action in `TauCeti.BinaryQuadraticForm`. The oriented form–ideal bijection of IntegralLattices B2 and the
order and Picard carriers of GlobalNumberFields Layer 11 are not needed. Layer
0 explains which of these narrow characters descend to wide classes.

## Downstream consumers

The kernel, descent, fibre counts and ideal-character comparison provide
interfaces for later work on quadratic genus-period formulas. The Hecke-period
interfaces of AnalyticNumberTheoryPartI Layer 2 and the Nielsen surfaces and
genus-weighted integrals of AutomorphicSpectralTheory §4.17a retain their own
normalizations: AnalyticNumberTheoryPartI §2.25 consumes the real genus
character and its value on J from AutomorphicSpectralTheory §4.17a.
MetaplecticAutomorphicForms §§7.20a, 7.32-trace supply respectively the
nonsquare and Biró form weights used in their traces, the latter including
positive square discriminants. The supplier contracts specify the direction
of these inputs.

Duke–Imamoḡlu–Tóth's genus averages (Theorem 2 and (4.4), pp.959–960)
use the narrow-genus size h⁺/2^(r−1) of Layer 1, and their twisted traces
(§9, p.978) use the supplied nonsquare form character, including imprimitive
forms and nonfundamental discriminants. Layer 3 extends those weights and
compares their positive fundamental specialization with the pinned narrow
ideal character.

## References

- W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic
  fields*, Annals of Mathematics **184** (2016), 949–990,
  [DOI: 10.4007/annals.2016.184.3.8](https://doi.org/10.4007/annals.2016.184.3.8),
  [public final PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf).
  The locators above use printed page numbers: §2, pp.950–952; §4,
  pp.959–960; §7, pp.970–972; §9, pp.977–978. The complementary-sign
  assertion from p.971 is used with the explicit real-discriminant qualifier.
- B. Gross, W. Kohnen and D. Zagier, *Heegner points and derivatives of
  L-series. II*, Mathematische Annalen **278** (1987), 497–562,
  [DOI: 10.1007/BF01458081](https://doi.org/10.1007/BF01458081),
  [author-hosted copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01458081/fulltext.pdf).
  Ch. I §2, pp.508–510: the genus character on forms, its well-definedness
  and its extension to imprimitive forms.
- Mathlib, `GroupTheory.Coset`, `GroupTheory.QuotientGroup`,
  `Mathlib/NumberTheory/SumTwoSquares.lean`, `RingTheory.FractionalIdeal` and
  `RingTheory.Ideal.Norm`, at the commit specified in the supplier contracts.
- Tau Ceti, narrow class groups and quadratic genus characters, at the
  commit specified in the supplier contracts; the completed Multiquadratic
  roadmap; IntegralLattices, Layer B; GlobalNumberFields, Layer 11.
