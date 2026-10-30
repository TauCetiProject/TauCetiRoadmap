# Roadmap: radical solvability for Galois groups of polynomials

**Summary.** This roadmap continues the completed Polynomial Galois Groups roadmap
(`Completed/PolynomialGaloisGroups/`). The base stops at statements about the group: it proves the
permutation-group and resolvent machinery, the transitive groups of degree at most five, the
quintic criterion "solvable Galois group iff the `F₂₀` resolvent sextic has a root" under a
separability hypothesis on the sextic, and the realization of `Sₙ` over `ℚ`. For radicals it has
only Mathlib's implication, for an irreducible polynomial, from "some root is a radical
expression" to "the Galois group is solvable". This roadmap proves the converse in characteristic
zero, first for finite Galois extensions and then for polynomials, removes the separability hypothesis from the base's quintic
criterion, and combines the two into Dummit's criterion in its classical form: an irreducible
quintic over a field of characteristic zero is solvable by radicals exactly when its resolvent
sextic has a root in the base field.

## Scope and ownership

This roadmap owns:

- the radical criterion for finite Galois extensions in characteristic zero (Layer 1);
- the radical criterion for polynomials, its some-root form for irreducible polynomials, and the
  prime-degree non-solvability corollary (Layer 2);
- the separation of the quintic `F₂₀` resolvent sextic for irreducible quintics with `5 ≠ 0`, and
  Dummit's criterion in group form without a separability hypothesis and in radical form
  (Layer 3).

It owns nothing else. In particular:

- Everything of the completed Polynomial Galois Groups roadmap is imported, never restated: the
  permutation representation (its Layer 0), blocks and wreath products (Layer 1), the
  primitivity dictionary (Layer 2), the discriminant test (Layer 3), resolvent specifications,
  Dummit's invariant and the conditional quintic criterion (Layer 4), Frobenius specialization
  (Layer 5), the transitive groups and labels of degree at most five with their certificates
  (Layer 6) and the realization of `Sₙ` (Layer 9). Their Tau Ceti declarations are listed in the
  supplier contracts below by name.
- Mathlib already proves the direction from radicals to solvable groups, as
  `isSolvable_gal_of_irreducible` and `isSolvable_gal_minpoly` in
  `Mathlib/FieldTheory/AbelRuffini.lean`; this roadmap uses it and does not restate it.
- The ramified cycle-type refinements of Galois groups belong to Polynomial Galois Groups,
  Part II, and are not touched here.
- Radicals in positive characteristic (where Artin–Schreier extensions replace Kummer
  extensions), Hilbert irreducibility, and the realization of `Aₙ` are outside this roadmap.

## Conventions

- **Fields.** `F` is a field. Layers 1 and 2 and the radical form of Layer 3 assume `CharZero F`;
  the separation theorem and the group form of Layer 3 assume only `(5 : F) ≠ 0`.
- **Galois groups.** For a polynomial `q : F[X]`, `q.Gal` is Mathlib's `Polynomial.Gal q`, the
  automorphism group of `q.SplittingField` over `F`; for `q` constant it is trivial. For a finite
  Galois extension `E/F` the Galois group is `E ≃ₐ[F] E`.
- **Radical closure.** The radical closure of `F` is `solvableByRad F (AlgebraicClosure F)`, the
  smallest intermediate field of `AlgebraicClosure F / F` that contains every `x` with
  `x ^ n` in it for some `n ≠ 0` (Mathlib, `Mathlib/FieldTheory/AbelRuffini.lean`). A polynomial
  is *solvable by radicals* when **every** one of its roots in `AlgebraicClosure F` lies in the
  radical closure; this is the notion of Milne's Theorem 5.34 (a radical tower containing a
  splitting field). The closure is always taken in an algebraic closure: the intermediate field
  `solvableByRad F E` inside a Galois extension `E` is in general too small (Layer 1, Checks).
- **Two senses of "solvable".** `Group.IsSolvable q.Gal` is solvability of the group; solvability
  by radicals is membership in the radical closure. They are never given the same name.
- **The quintic resolvent.** `TauCeti.quinticF20Spec` is the resolvent specification of
  Dummit's invariant `Φ = ∑ₐ xₐ² (xₐ₊₁ xₐ₋₁ + xₐ₊₂ xₐ₋₂)` (indices in `ℤ/5`), whose stabilizer
  in `S₅` is the Frobenius group `F₂₀` of order 20 (Dummit, §2, p. 388). For a monic `f` of degree
  five, `TauCeti.quinticF20Spec.specialize F f` is the monic sextic whose roots, in a splitting
  field of `f`, are the six values `θ₁, …, θ₆` of the conjugates of `Φ` at the roots of `f`; it is
  Dummit's `f₂₀` (his formula (2), p. 389). For `X⁵ + aX + b` it is
  `X⁶ + 8aX⁵ + 40a²X⁴ + 160a³X³ + 400a⁴X² + (512a⁵ − 3125b⁴)X + (256a⁶ − 9375ab⁴)`.

## Exact supplier contracts

**From Mathlib** (at the pin):

- `Polynomial.Gal` and `Polynomial.Gal.galActionHom` in
  `Mathlib/FieldTheory/PolynomialGaloisGroup.lean`; `Polynomial.rootSet` in
  `Mathlib/Algebra/Polynomial/Roots.lean`.
- `solvableByRad`, `solvableByRad.rad_mem`, `isSolvable_gal_minpoly` and
  `isSolvable_gal_of_irreducible` (if `q` is irreducible and has a root in `solvableByRad F E`,
  then `q.Gal` is solvable) in `Mathlib/FieldTheory/AbelRuffini.lean`.
- `isCyclic_tfae` in `Mathlib/FieldTheory/KummerExtension.lean`: for a finite extension `L/K`
  of degree `n` with a primitive `n`th root of unity in `K`, `L/K` is cyclic Galois exactly when
  `L = K(α)` with `αⁿ ∈ K`.
- `IsSepClosed.hasEnoughRootsOfUnity` (`Mathlib/RingTheory/RootsOfUnity/AlgebraicallyClosed.lean`)
  and `HasEnoughRootsOfUnity.exists_primitiveRoot`, giving primitive `n`th roots of unity in
  `AlgebraicClosure F` when `(n : F) ≠ 0`.
- The Galois correspondence in `Mathlib/FieldTheory/Galois/Basic.lean`:
  `IsGalois.sup_right`, `IsGalois.tower_top_intermediateField`,
  `IntermediateField.restrictRestrictAlgEquivMapHom_injective`,
  `IsGalois.normalAutEquivQuotient`, `IntermediateField.subgroupEquivAlgEquiv`,
  `IsGalois.card_aut_eq_finrank`.
- `Polynomial.Gal.galActionHom_bijective_of_prime_degree` in
  `Mathlib/Analysis/Complex/Polynomial/Basic.lean` (an irreducible rational polynomial of prime
  degree with exactly two nonreal complex roots has full symmetric Galois action) and
  `Equiv.Perm.not_isSolvable` in `Mathlib/GroupTheory/Solvable.lean` (`Sym(α)` is not solvable
  when `α` has at least five elements).

**From Tau Ceti** (at the pin):

- `Group.IsSolvable.exists_normal_index_prime` in `TauCeti/GroupTheory/Solvable.lean`: a
  nontrivial finite solvable group has a normal subgroup of prime index.
- `TauCeti.quinticF20Invariant`, `TauCeti.quinticF20Spec` and
  `TauCeti.ResolventSpec.specialize` in `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Basic.lean`
  and `TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.lean`.
- `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` and
  `TauCeti.exists_isRoot_specialize_quinticF20Spec_of_isSolvable` in
  `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.lean`, over an arbitrary field:
  for `f` monic, separable, irreducible of degree five, a solvable `f.Gal` gives the specialized
  sextic a root, and conversely when that sextic is separable.
- `TauCeti.resolventSextic_X_pow_five_sub_X` and
  `TauCeti.not_forall_exists_le_map_conj_of_isRoot_specialize_quinticF20Spec` in
  `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Collision.lean`: for the reducible
  separable `X⁵ − X` the sextic is `(X − 2)⁴ (X² + 16)` and the converse fails.

**From TauCetiRoadmap.PolynomialGaloisGroups (completed).** Layers 0–6 and 9 as listed under
Scope and ownership, through the Tau Ceti declarations above; no statement of the base is assumed
beyond what those declarations prove.

## How to read the build

Layer 1 proves the radical criterion for a finite Galois extension in characteristic zero, by
induction along a chain of normal subgroups of prime index after adjoining roots of unity. Layer 2
specializes it to splitting fields of polynomials. Layer 3 is independent of Layers 1 and 2 for its
separation theorem and group form, and uses Layer 2 for the radical form of Dummit's criterion.

## Layer 1: the radical criterion for finite Galois extensions

### 1.1 The criterion

Prove `finiteGalois_iff_image_mem_solvableByRad`: let `F` have characteristic zero, let `E/F` be
finite Galois, and let `ι : E →ₐ[F] AlgebraicClosure F`. Then `E ≃ₐ[F] E` is solvable exactly when
`ι x ∈ solvableByRad F (AlgebraicClosure F)` for every `x : E` (Milne, *Fields and Galois Theory*
v5.10, Theorem 5.34, p. 77, stated there for polynomials). The embedding is part of the data; the
statement holds for every choice, since two choices differ by an automorphism of the algebraic
closure over `F`, which preserves the radical closure.

*Route.* For the implication from right to left, take a primitive element `γ` of `E/F`. Its
minimal polynomial is irreducible, and `ι γ` is a root of it in the radical closure, so its Galois
group is solvable by `isSolvable_gal_of_irreducible`; since `E/F` is normal, `E` is a splitting
field of that polynomial and its Galois group is `E ≃ₐ[F] E`. For the implication from left to right, put
`N := |E ≃ₐ[F] E|`, choose a primitive `N`th root of unity `ζ` in `Ω := AlgebraicClosure F` (it
exists because `(N : F) ≠ 0` in characteristic zero), and let `F₁ := F(ζ)` and `L := ι(E) ⊔ F₁`
inside `Ω`. Restriction embeds `Gal(L/F₁)` in `Gal(ι(E)/F)` (Milne, Lemma 5.33, p. 76), so it is
solvable. Induct on `[L : K]` over intermediate fields `F₁ ⊆ K ⊆ L` contained in the radical
closure: a nontrivial `Gal(L/K)` has a normal subgroup `H` of prime index `p`, and `p` divides `N`;
the fixed field `M` of `H` is cyclic of degree `p` over `K`, which contains the primitive `p`th root
`ζ^(N/p)`, so `M = K(α)` with `αᵖ ∈ K` (Milne, Proposition 5.27, p. 74; Mathlib `isCyclic_tfae`),
hence `M` lies in the radical closure, and `Gal(L/M) ≅ H` is solvable. The base `K = F₁` lies in the
radical closure because `ζ^N = 1`.

*Needs:* Mathlib `solvableByRad`, `solvableByRad.rad_mem`, `isSolvable_gal_of_irreducible`,
`isCyclic_tfae`, `IsSepClosed.hasEnoughRootsOfUnity`, `HasEnoughRootsOfUnity.exists_primitiveRoot`,
`IsGalois.sup_right`, `IntermediateField.restrictRestrictAlgEquivMapHom_injective`,
`IsGalois.normalAutEquivQuotient`, `IntermediateField.subgroupEquivAlgEquiv`; Tau Ceti
`Group.IsSolvable.exists_normal_index_prime`.

### Examples

- `E = F`: the Galois group is trivial and every element of `F` lies in the radical closure;
  both sides hold.
- `E = ℚ(2^(1/5), ζ₅)` over `ℚ`, the splitting field of `X⁵ − 2`: the group is `F₂₀` of order 20,
  solvable, and `E` is generated by the radicals `2^(1/5)` and `ζ₅`; both sides hold.
- The splitting field of `X⁵ − 4X + 2` over `ℚ`: the polynomial is irreducible (Eisenstein at 2)
  with exactly three real roots (sign changes on `(−2, −1)`, `(0, 1)`, `(1, 2)`, and at most three
  real roots since the derivative `5X⁴ − 4` has two real zeros), so the group is `S₅`, not
  solvable, and by `isSolvable_gal_of_irreducible` no root of `X⁵ − 4X + 2` is in the radical
  closure; both sides fail.
- Negative control for the ambient field: let `E` be the cubic subfield of `ℚ(ζ₇)`, real and
  cyclic of degree 3 over `ℚ`. If `x ∈ E ∖ ℚ` had `xⁿ ∈ ℚ` for some `n ≠ 0`, then `ℚ(x) = E`
  would be normal, so a
  conjugate `x' ≠ x` of `x` would lie in `E` with `x'/x` a real root of unity, hence `x' = −x`, and
  then the conjugates of `x` would come in pairs `±`, impossible in odd degree 3. So
  `solvableByRad ℚ E = ℚ` does not contain `E`, although `Gal(E/ℚ) ≅ C₃` is solvable. The
  criterion with `solvableByRad F E` in place of the radical closure in `AlgebraicClosure F` is
  false.

### Dependencies

Mathlib and Tau Ceti as listed under *Needs*. No other layer.

## Layer 2: the radical criterion for polynomials

### 2.1 All roots

Prove `isSolvable_gal_iff_forall_rootSet_mem_solvableByRad`: for `F` of characteristic zero and
every `q : F[X]`, `q.Gal` is solvable exactly when every element of
`q.rootSet (AlgebraicClosure F)` lies in `solvableByRad F (AlgebraicClosure F)` (Milne,
Theorem 5.34, p. 77). For `q` constant, including `q = 0`, both sides hold: the Galois group is
trivial and the root set is empty. For `q` nonconstant, `q.SplittingField / F` is finite, normal and,
in characteristic zero, separable even when `q` has repeated factors, hence Galois; it embeds in
`AlgebraicClosure F` with image generated by the roots, so Layer 1 applies.

*Needs:* Layer 1 `finiteGalois_iff_image_mem_solvableByRad`; Mathlib
`Polynomial.IsSplittingField.lift`, `Polynomial.Splits.adjoin_rootSet_eq_range`,
`Normal.of_isSplittingField`, `Algebra.IsSeparable.of_integral`.

### 2.2 Some root, for irreducible polynomials

Prove `isSolvable_gal_iff_exists_rootSet_mem_solvableByRad`: for `q` irreducible over `F` of
characteristic zero, `q.Gal` is solvable exactly when some root of `q` in `AlgebraicClosure F`
lies in the radical closure (Milne, Theorem 5.34, p. 77, with the irreducible some-root deduction).
One direction is `isSolvable_gal_of_irreducible`; the other is 2.1, since an irreducible polynomial
has a root. For a reducible `q` the some-root form is false (Examples).

*Needs:* 2.1; Mathlib `isSolvable_gal_of_irreducible`.

### 2.3 Prime degree with two nonreal roots

Prove `not_mem_solvableByRad_of_prime_degree_two_nonreal`: if `q : ℚ[X]` is irreducible of prime
degree `p ≥ 5` and has exactly two nonreal roots in `ℂ`, expressed as
`Fintype.card (q.rootSet ℂ) = Fintype.card (q.rootSet ℝ) + 2`, no root of `q` in
`AlgebraicClosure ℚ` lies in the radical closure (Milne, Proposition 4.16,
p. 52, for the group). The group acts on the `p` roots as `S_p` by
`Polynomial.Gal.galActionHom_bijective_of_prime_degree`, which is not solvable by
`Equiv.Perm.not_isSolvable`; conclude by `isSolvable_gal_of_irreducible`. For `p = 2, 3` the
symmetric group is solvable and there is no conclusion.

*Needs:* Mathlib `Polynomial.Gal.galActionHom_bijective_of_prime_degree`,
`Equiv.Perm.not_isSolvable`, `isSolvable_gal_of_irreducible`.

### Examples

- `q = 0` and `q = 1`: the Galois group is trivial and the root set is empty; both sides of 2.1
  hold.
- `q = X² − 2` over `ℚ`: the group is `C₂`, and `±√2` are radical; both sides of 2.1 hold.
- `q = (X⁵ − 4X + 2)(X − 1)` over `ℚ`: the root `1` is in the radical closure, but `q.Gal` maps
  onto the `S₅` of the first factor and is not solvable. This separates 2.1 from the some-root form
  of 2.2, which needs irreducibility.
- `q = X⁵ − 4X + 2` satisfies the hypotheses of 2.3 with `p = 5` (three real roots, as computed in
  Layer 1); `q = X³ − 2` has exactly two nonreal roots but prime degree 3, its group `S₃` is
  solvable, and its roots `2^(1/3) ζ₃ᵏ` are radical.
- Irreducibility cannot be omitted in 2.3: `(X² + 1)(X − 1)(X − 2)(X − 3)` has prime degree five
  and exactly two nonreal roots, but its roots `i, −i, 1, 2, 3` are all radical and its group is `C₂`.

### Dependencies

Layer 1; Mathlib as listed under *Needs*.

## Layer 3: Dummit's quintic criterion

### 3.1 Separation of the resolvent sextic

Prove `separable_specialize_quinticF20Spec`: for `f : F[X]` monic and irreducible of degree five
with `(5 : F) ≠ 0`, the sextic `TauCeti.quinticF20Spec.specialize F f` is separable (Chapman's note
to Dummit, the whole one-page argument). Under these hypotheses `f` is separable, since an
irreducible inseparable polynomial has degree divisible by the characteristic. The Galois group is
transitive on the five roots, so it contains a 5-cycle; number the roots so that it is
`a ↦ a + 1` on `ℤ/5`, which fixes `θ₁ = Φ(x)` and permutes `θ₂, …, θ₆` cyclically. If two of the
six values coincide, applying powers of the 5-cycle makes `θ₂, …, θ₆` all equal. Each difference
of two of these five values factors as `(xₐ − x_b)(x_c − x_d)[(xₑ − xₐ)(xₑ − x_b) − (xₑ − x_c)(xₑ − x_d)]`
for a suitable labelling `{a, b, c, d, e} = ℤ/5`, and two of these differences with the same `e`
and the pairs `{a, b}`, `{c, d}` regrouped give, with `u = xₑ − xₐ`, `v = xₑ − x_b`,
`w = xₑ − x_c`, `z = xₑ − x_d` (all nonzero), `uz = vw` and `uw = vz`, hence `u² = v²`. The case
`u = v` contradicts distinctness of the roots (this covers characteristic two); the case
`u = −v`, `w = −z` gives `2xₑ = xₐ + x_b = x_c + x_d`, so `5xₑ` is the sum of the roots, which lies
in `F`, and `xₑ ∈ F` contradicts irreducibility.

The hypothesis `(5 : F) ≠ 0` cannot be dropped (Checks).

*Needs:* Tau Ceti `TauCeti.quinticF20Spec`, `TauCeti.ResolventSpec.specialize`; Mathlib
`Polynomial.Gal.galAction_isPretransitive`, `exists_prime_orderOf_dvd_card` (Cauchy's theorem).

### 3.2 Dummit's criterion

Prove `isSolvable_gal_iff_exists_isRoot_quinticF20Spec`: for `f : F[X]` monic and irreducible of
degree five with `(5 : F) ≠ 0`, `f.Gal` is solvable exactly when
`TauCeti.quinticF20Spec.specialize F f` has a root in `F` (Dummit, Theorem 1, p. 389, stated over
`ℚ` and remarked valid for characteristic different from 2 and 5 on p. 387; the separability that
his proof uses is 3.1). It is the Tau Ceti theorem
`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` with its separability
hypothesis discharged by 3.1.

Prove `forall_rootSet_mem_solvableByRad_iff_exists_isRoot_quinticF20Spec`: for `F` of
characteristic zero and `f : F[X]` monic and irreducible of degree five, every root of `f` in
`AlgebraicClosure F` lies in the radical closure exactly when the sextic has a root in `F`. This is
Dummit's Theorem 1 in his own words, and follows from the group form and Layer 2.

*Needs:* 3.1; Tau Ceti `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`;
Layer 2 `isSolvable_gal_iff_forall_rootSet_mem_solvableByRad` for the radical form.

### Examples

- `f = X⁵ − 2` over `ℚ`: the sextic is `X⁶ − 50000X = X(X⁵ − 50000)`, separable with the root `0`;
  the group is `F₂₀` and the roots `2^(1/5) ζ₅ᵏ` are radical.
- `f = X⁵ − 5X − 12` over `ℚ`: the sextic is
  `X⁶ − 40X⁵ + 1000X⁴ − 20000X³ + 250000X² − 66400000X + 976000000`, with the root `40`; the group is
  the dihedral group `D₅` and the roots are radical.
- `f = X⁵ − X − 1` over `ℚ`: the sextic is `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 3637X + 9631`; its
  constant term `9631` is prime and neither `±1` nor `±9631` is a root, so it has no rational root;
  the group is `S₅` and no root is radical.
- Irreducibility cannot be omitted in 3.1: `X⁵ − X` over `ℚ` is separable but reducible, and its sextic
  `(X − 2)⁴ (X² + 16)` is inseparable (Tau Ceti `TauCeti.resolventSextic_X_pow_five_sub_X`).
- `(5 : F) ≠ 0` is necessary in 3.1: over `𝔽₅`, `f = X⁵ − X − 1` is irreducible (Artin–Schreier)
  with roots `α, α + 1, …, α + 4`. Numbering the root `α + k` by `k`, the generator `x ↦ x + 1` of
  the group `C₅` is the 5-cycle above, and the difference of the two values computed with the
  labelling `(a, b, c, d, e) = (0, 4, 2, 1, 3)` is `(−4)(1)[(3)(−1) − (1)(2)] = 20 = 0` in `𝔽₅`, so
  the five non-fixed values coincide and the sextic is inseparable.
- Characteristic two is allowed: over `𝔽₂`, `f = X⁵ + X² + 1` is irreducible with group `C₅`; both
  sides of the group form hold.

### Dependencies

Layer 2 (radical form only); Tau Ceti and Mathlib as listed under *Needs*.

## Downstream consumers

The radical criterion of Layers 1 and 2 is the form in which classical statements "solvable by
radicals" enter Galois-theoretic arguments, and Layer 3 makes the base roadmap's quintic test
unconditional for irreducible quintics. Any roadmap that states a result about expressibility by
radicals in characteristic zero consumes Layer 2.

## References

- J. S. Milne, *Fields and Galois Theory*, version 5.10 (2022),
  [author's course notes](https://www.jmilne.org/math/CourseNotes/FT.pdf): Proposition 4.16
  (p. 52), Proposition 5.27 (p. 74), Lemma 5.33 (p. 76), Theorem 5.34 (p. 77). Source id
  `milne-fields`.
- D. S. Dummit, *Solving solvable quintics*, Math. Comp. 57 (1991), 387–401,
  [author's copy](https://site.uvm.edu/ddummit/files/2021/04/Solving_Solvable_Quintics__Math_Comp_57_no195_1991__pp_387_401.pdf):
  the invariant and its stabilizer `F₂₀` (§2, p. 388), the sextic (formula (2) and the trinomial
  case, p. 389), Theorem 1 (p. 389), the characteristic remark (p. 387). Source id
  `dummit-quintics`.
- R. Chapman, *Note on Solving Solvable Quintics by D. Dummit* (22 January 1992), one page,
  [on Dummit's page](https://site.uvm.edu/ddummit/files/2021/04/Solving_Solvable_Quintics_note_by_Robin_Chapman.pdf):
  the separation of the sextic's roots for irreducible quintics. Source id `chapman-quintics`.
