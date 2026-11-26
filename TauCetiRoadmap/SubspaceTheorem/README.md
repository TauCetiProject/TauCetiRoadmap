# Roadmap: Roth's theorem and the Subspace Theorem over number fields

**Summary.** Schmidt's Subspace Theorem, in the `S`-adic form of Schlickewei and Evertse, says that
the good approximations to a system of linear forms lie in finitely many proper linear subspaces.
This roadmap proves it over a number field `K`, with Roth's theorem over `K` as the milestone halfway
up, and then the theorems it exists to prove. Throughout, `K` is a number field and `S` a finite set
of its places, given as a finite set of infinite places and a finite set of finite places. The
points lie in `K`; targets and
coefficients lie in a finite extension `F` of `K` and are measured at each place `v` of `S` by an
absolute value of `F` extending `v`, so that no completion appears in any statement. Heights are
relative to `K`, with the local factor at an infinite place raised to its multiplicity.

The headline theorems are these. **Roth's theorem over `K`**: for `κ > 2` and targets `α_v ∈ F`,
only finitely many `β ∈ K` have `∏_{v ∈ S} min(1, |β − α_v|_v) ≤ H(β)^(−κ)`. **The Subspace
Theorem**: for `n ≥ 1`, linearly independent linear forms `L_{v,0}, …, L_{v,n}` with coefficients
in `F` at each `v ∈ S`, and `ε > 0`, the nonzero `x ∈ K^(n+1)` with
`∏_{v ∈ S} (∏_i |L_{v,i}(x)|_v) / |x|_v^(n+1) ≤ H(x)^(−n−1−ε)`, where `|x|_v` is the largest
`|x_j|_v`, lie in finitely many proper subspaces of `K^(n+1)`; it is also proved in parametric,
affine and general-position forms. **The applications**: a real algebraic number `α` of degree `D`
has Mahler and Koksma exponents `w_n(α) = w_n*(α) =
min(n, D − 1)`; for nonzero `a_i ∈ K` the equation `a_1 x_1 + ⋯ + a_n x_n = 1` has only finitely
many solutions in `S`-units with no vanishing subsum; Thue equations and hyperelliptic equations
`b y² = f(x)`, with `f` having three roots of odd multiplicity, have finitely many `S`-integral
solutions; the base-`b` expansion of an algebraic irrational has more than `C n` blocks of length
`n` for every `C` and all large `n`; and `gcd(a^n − 1, b^n − 1) < e^(εn)` eventually for
multiplicatively independent integers `a, b ≥ 2`.

It stands on four roadmaps. [DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)
supplies the heights of polynomials and subspaces, the exponents, the Roth machinery and Siegel's
lemma, and states the instances over `ℚ` that the theorems here specialize to. HeightsAndUnits and
GlobalNumberFields, whose material is in Tau Ceti, supply the affine height, Northcott, the `S`-unit
lattice, the places with their normalized absolute values and the product formula.
[SuccessiveMinima](../SuccessiveMinima/README.md), through Tau Ceti, supplies Minkowski's second
theorem.

The route is Schmidt's method: Roth's lemma in several blocks of variables against the geometry of
numbers of a family of parallelepipeds, done with lattices and convex bodies in a real vector space
rather than adelically. Below, Layer 0 classifies the absolute values above a place and proves
Liouville's inequality; Layer 1 studies the approximation exponents; Layers 2 and 3 build Roth's
auxiliary polynomial over `K` and prove Roth's theorem; Layers 4 and 5 are the geometry of numbers
of Schmidt's parallelepipeds and the Roth machinery in several blocks of variables; Layer 6 is the
Subspace Theorem; Layers 7 and 8 apply it to numbers and to equations; and Layer 9 counts the
subspaces.

## How to read the build

The layers are built in order, with independent lanes. Layer 1 is about real numbers and needs
nothing from Layer 0: Liouville's bound for Mahler's exponent goes through the norm, and the
exponents are Tau Ceti's. Layers 2 and 3 form one lane, from 0.1 and 0.4 up to Roth's theorem;
Layer 4 is a second lane, from Layer 0 and the geometry of numbers of Tau Ceti and
SuccessiveMinima. Layer 5 joins them: it consumes the approximation product of 3.4 and the
approximation domains of Layer 4. Layer 6 assembles the
Subspace Theorem from 4.5 and 5.5, and Layers 7, 8 and 9 apply it. Inside Layer 5, 5.2 and 5.3 are
pure algebra over a field of characteristic zero; 7.2 and 7.3 have a combinatorics-of-words half;
8.3 has a linear-algebra half; 8.7 and 8.8 need only Layer 0; and 9.2 and 9.3 need only Layers 0
and 4 and the systems of 9.1. Layers 3 and 6 can be built in either order: 6.6 checks that they
agree, and 3.4 is the interface that 8.1, 8.3, 8.4 and 8.5 would consume if Layers 4–6 were absent.
Each *Needs:* line
lists what a statement and its route use, item by item, so that a target proved another way is not
blocked behind an unrelated one. Where a consumed target of another roadmap is not in Tau Ceti, the
milestone here is stated against that target's statement and built regardless.

## Conventions

1. **The field.** `K` is a number field of degree `d = [K : ℚ]` from Layer 0 on, except in Layer 1,
   which is about real numbers, and in the parts of Layers 2, 4 and 5 that are algebra over an
   arbitrary field or commutative ring, each of which says so. The theorems of Layers 3–9 are not
   stated over a general field with `Height.AdmissibleAbsValues`: a global field of positive
   characteristic has a product formula and Weil heights, while Roth's theorem fails there for one
   place and one target (Bombieri–Gubler 6.2.8).
2. **Points and subspaces.** Points are tuples `x : ι → K` with `[Fintype ι]`, following
   `Height.mulHeight`; the dimension `n + 1` of the literature is `Fintype.card ι`. The forms of the
   Subspace Theorem on all of `ι → K` with a smallness hypothesis on the solutions (6.2–6.5 and
   9.1) carry `[Nontrivial ι]`, that is `n ≥ 1`: for a one-element `ι` the only proper subspace is
   `0`, every nonzero `x` has height `1`, the hypothesis can hold, and the statement is false there
   rather than empty. 3.4 fixes `card ι = 2` and 6.7 asks `2 ≤ finrank K U` of its subspace instead;
   the parametric theorem 6.1 needs none, since for a one-element `ι` its domain is `0` at large
   levels. Subspaces are `Submodule K (ι → K)`, never `Module.Grassmannian` or
   `Projectivization.Subspace`, because the subspace height of Tau Ceti
   (`Submodule.relativeSubspaceHeight`) is defined on `Submodule`.
3. **A finite set of places** is a pair of typed finsets, `Sinf : Finset (InfinitePlace K)` and
   `Sfin : Finset (FinitePlace K)`, in the shape of Mathlib's `NumberField.mulHeight_eq` (a product
   over `InfinitePlace K` with exponent `mult` times a product over `FinitePlace K`); the prose
   writes them `S∞` and `S₀`. A finite set of places is never `S : Finset (AbsoluteValue K ℝ)`
   without a hypothesis that its members are places: `|·|^t` is an absolute value on `ℚ` for every
   `0 < t ≤ 1`, and the untyped statement is false (Check below).
4. **`S` for `S`-integers and `S`-units** is `S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))`,
   finite places only, the carrier of Mathlib's `Set.integer` and `Set.unit`, with every infinite
   place implicitly present: there `S∞` is all of `InfinitePlace K` and `S₀` is the image of `S`
   under `NumberField.FinitePlace.mk`. Bombieri–Gubler's `S` always contains the archimedean places;
   translate.
5. **Products over all places** use Tau Ceti's `TauCeti.GlobalNumberFields.Place K` with
   `TauCeti.GlobalNumberFields.normalizedAbsValue`, the carrier of the product formula and of the
   local extension formulas. A product over a finite set of places is a product over the two typed
   finsets.
6. **Normalization: Mathlib's, which is relative.** The local factor of `y` at `v : InfinitePlace K`
   is `v y ^ v.mult` and at `v : FinitePlace K` it is `v y`; the height is `Height.mulHeight`.
   Bombieri–Gubler's absolute values and heights are the `d`-th roots of these. Every inequality
   below is homogeneous in that normalization, so it reads the same in both; a statement that mixes
   a relative quantity with an explicit constant or with a height over another field says which it
   is in.
7. **Where the points and the coefficients live.** Points lie in `K`; coefficients and targets lie
   in a finite extension `F` of `K` with `[Algebra K F]`, measured at `v` by an absolute value
   `w v : AbsoluteValue F ℝ` with `(w v).LiesOver v`. This is the setting of Bombieri–Gubler's
   Theorems 6.4.1 and 7.2.2, and the one formulation containing both forms in print: `F = K` is the
   Evertse–Schlickewei number-field form, and `K = ℚ` with `F` generated by the coefficients is
   Schmidt's form with algebraic coefficients. Neither specializes to the other. No completion
   `K_v` appears in any statement: a `K`-algebraic element of `K_v` is an element of some `F`
   together with a `w` over `v`.
8. **The central quantity** is Tau Ceti's `NumberField.approxProd Sinf Sfin w L x`: the product over
   `v ∈ Sinf` of `(∏ i, w v (L v i x) / ⨆ j, v (x j)) ^ v.mult` times the product over `v ∈ Sfin` of
   `∏ i, w v (L v i x) / ⨆ j, v (x j)`, with `L v i : Module.Dual F (ι → F)` and `x` mapped into `F`.
   The forms and the absolute values are indexed by the underlying `AbsoluteValue K ℝ` of a place,
   `L : AbsoluteValue K ℝ → ι → Module.Dual F (ι → F)`, so that one family serves both finsets;
   their values off `S∞ ∪ S₀` play no role. The local sup norm `⨆ j, v (x j)` is written out and
   has no name.
9. **Strict or non-strict: `≤`.** The Subspace inequality is
   `approxProd … x ≤ mulHeight x ^ (−(card ι) − ε)`. The literature writes `<`; the two are
   equivalent (pass to `ε/2` and discard the finitely many projective points of height `1`), and `≤`
   is what a consumer's estimate produces.
10. **The conclusion** of a Subspace Theorem is
    `∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧ ∀ x ≠ 0, … → ∃ W ∈ T, x ∈ W`, subspaces
    of `Kⁿ⁺¹`, the field of the points. Finiteness of a set of solutions is `Set.Finite`.
11. **Multiplicative and logarithmic heights**: both, multiplicative primary, as in Mathlib. The
    Roth machinery is additive, so Layers 2 and 5 are stated with `Height.logHeight`; Layers 3, 6, 7
    and 8 with `Height.mulHeight`; Layer 9 with the affine height `Height.mulHeightAff` and its
    `[K : ℚ]`-th root, as Evertse states them.
12. **Derivatives and the index** are Tau Ceti's `MvPolynomial.hasseDeriv` and
    `MvPolynomial.weightedIndex r a P`, with weights `r : σ → ℕ`, `0 < r j`, valued in `ℝ≥0∞`, with
    `weightedIndex r a 0 = ⊤`.
13. **Approximation exponents** are Tau Ceti's `TauCeti.irrationalityExponent`,
    `TauCeti.mahlerExponent n ξ` (Mahler's `w_n`, through `TauCeti.linearFormExponent`) and
    `TauCeti.algebraicApproximationExponent n ξ` (Koksma's `w_n*`, with complex algebraic
    approximants of degree at most `n` and the naive height), all `ℝ≥0∞`-valued. A real approximant
    is a complex one, so every lower bound proved with real approximants holds for Koksma's
    exponent.
14. **Targets at infinity** are points of `OnePoint F`, with local factor `(max 1 (w β))⁻¹` at the
    target `∞`, which is `1` at `β = 0`; the formula `min 1 (w β)⁻¹` is `0` there under Lean's
    `0⁻¹ = 0` and is not used.
15. **Names.** Declarations are statement-named, as in Mathlib; Roth, Ridout, Schmidt, Schlickewei,
    Evertse, Thue, Mahler and Wirsing go in docstrings. Results that are not about Diophantine
    approximation are written in Mathlib's namespaces and style: the classification of the absolute
    values over a place (0.1), the bounded-on-`ℕ` criterion for nonarchimedean absolute values,
    pseudo-bases over a Dedekind domain (4.1), the homogeneous ideal-membership lemma (8.8), the
    determinant bounds at an absolute value (9.2), and the complexity function with the
    Morse–Hedlund theorem (7.3). For these, the names and shapes proposed for Mathlib or on the Lean
    Zulip for the same object are adopted, and the item is built here regardless. Mathlib's
    shape is followed throughout: `ℝ≥0∞`-valued invariants as `iSup`s, typed places,
    `AbsoluteValue.LiesOver`, `Set.integer` and `Set.unit`, and heights through `Height.mulHeight`
    and the `Northcott` class. `Suggested.lean` states the headline theorems in the namespace
    `TauCetiRoadmap.SubspaceTheorem`.
16. **Effectivity**: none. No statement bounds the height of a solution or of a subspace. Statements
    that bound a *number*, of approximations in 3.6 and of subspaces in Layer 9, say which solutions
    they count.

**Checks.**
- Over `ℚ`, with the untyped set of absolute values `|·|, |·|^(1/2), |·|^(1/3), |·|^(1/4)` (all
  powers of the real absolute value), the two coordinate forms at each and `ε = 1/12`: for an
  integer `q ≥ 1` the point `(1, q)` has height `q`, its local factor at `|·|^(1/j)` is
  `(1 · q)^(1/j) / q^(2/j) = q^(−1/j)`, and the product of the four is
  `q^(−(1 + 1/2 + 1/3 + 1/4)) = q^(−25/12) = H^(−2 − 1/12)`. Every `(1, q)` meets the Subspace
  inequality with equality, and no finite set of lines contains them all, since each line through
  the origin contains at most one of them. With typed places the set has one infinite place, and
  the statement is the true one.
- With `K = F = ℚ`, `S∞` the real place and `w` the `3`-adic absolute value (which does not lie over
  the real place), scaling `x` by `3` multiplies each factor `w(L_i x) / max_j |x_j|` by
  `(1/3) / 3`, so `approxProd` changes by `(1/9)^(card ι)`; with `w` the real absolute value it is
  unchanged. Projectivity of `approxProd` needs `w v` to lie over `v`.

## Layer 0: absolute values above a place and the `S`-adic dictionary

Algebraic number theory only. The layer exists so that no other layer has to mention a completion:
an algebraic target or coefficient at a place `v` of `K` is an element of a finite extension `F`
together with an absolute value of `F` over `v`.

### 0.1 Absolute values above a place

For a finite extension `F/K` of number fields and a place `v` of `K`, classify the
`w : AbsoluteValue F ℝ` with `w.LiesOver v` (Bombieri–Gubler §1.3).

*Over a finite place* the classification is Tau Ceti's: `w` lies over `FinitePlace.mk 𝔭` exactly
when `w = (FinitePlace.mk 𝔓 ·) ^ ((e f)⁻¹)` for a prime `𝔓` of `𝓞 F` over `𝔭`, unique, with `e` and
`f` its ramification index and inertia degree (`NumberField.existsUnique_finitePlace_rpow_inv_eq_of_liesOver`,
`NumberField.liesOver_finitePlace_mk_iff`). It is a **root** of a finite place of `F`, because
`FinitePlace.mk 𝔓` restricted to `K` is `(FinitePlace.mk 𝔭) ^ (e f)` (Mathlib's
`NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap`). So `w` is in general **not**
the absolute value of a `FinitePlace F`, and a statement that asks for one excludes every ramified or
non-split prime. The classification is what is proved; the hypothesis consumers state is
`w.LiesOver v`. Tau Ceti also has, over a finite place: the prime `{y ∈ 𝓞 F | w y < 1}` and its
uniqueness, finiteness and nonemptiness of the fibre, extension of `w` to every further finite
extension `F'/F` (`NumberField.FinitePlace.exists_liesOver_of_liesOver`), and the size bound
`max (w x) 1 ≤ mulHeight₁ x` for `x ∈ F`
(`NumberField.FinitePlace.max_apply_one_le_mulHeight₁_of_liesOver`, with product forms over distinct
finite places of `K`). The absolute-value infrastructure is Tau Ceti's too: an absolute value
bounded by `1` on `ℕ` is nonarchimedean (`AbsoluteValue.isNonarchimedean_of_forall_natCast_le_one`),
a nonarchimedean absolute value is at most `1` on integral elements
(`IsNonarchimedean.apply_le_one_of_isIntegral`), and `AbsoluteValue.nonarchRpow` is the `t`-th power
of a nonarchimedean absolute value for every `t > 0`, which makes the fibre over a finite place
nonempty (the exponent `(e f)⁻¹` is known only after the prime is produced).

*Over an infinite place.* Prove `isInfinitePlace_of_liesOver` (Bombieri–Gubler §1.3): for
`v : InfinitePlace K` and `w : AbsoluteValue F ℝ` with `w.LiesOver v`, `w` is the underlying absolute
value of some `w' : InfinitePlace F` (necessarily lying over `v`). The converse holds by Mathlib's
definition of `InfinitePlace.LiesOver`. *Route*: the argument runs in the completion `F_w`, whose
copy of `ℝ` is imported from `K_v` through Mathlib's
`NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal` and `ringEquivComplexOfIsComplex`;
Gelfand–Mazur (`NormedAlgebra.Real.nonempty_algEquiv_or`) asks neither for completeness nor for
finite dimension. Two pieces of infrastructure are part of this target: an absolute value of `ℂ`
that restricts to `|·|` on `ℝ` is `|·|` itself, which closes the gap between Gelfand–Mazur's algebra
isomorphism and an isometry; and an infinite place and a finite place of `K` never have the same
underlying absolute value (from `v 2 = 2` against `v 2 ≤ 1`), which 3.4 needs to spread a choice
made on `S` to every `AbsoluteValue K ℝ`. *Needs:* Mathlib `NormedAlgebra.Real.nonempty_algEquiv_or`,
`NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal`,
`NumberField.InfinitePlace.Completion.ringEquivComplexOfIsComplex`, `AbsoluteValue.LiesOver`.

Deduce, for every place `v`, infinite or finite:
- the set of `w` over `v` is finite and nonempty;
- `w` is nonarchimedean exactly when `v` is finite (Tau Ceti has `AbsoluteValue.isNonarchimedean_of_liesOver`
  and `NumberField.InfinitePlace.not_isNonarchimedean`);
- every `w` over `v` extends to every further finite extension `F'/F`;
- `max (w x) 1 ≤ mulHeight₁ x` for `x ∈ F` and `w` over an infinite place of `K`, with the product
  forms over distinct places.

**Checks.**
- `t = 2` on `ℚ`: `|·|^2` is not an absolute value (`|1 + 1|^2 = 4 > 2 = |1|^2 + |1|^2`), so the
  power construction is for nonarchimedean absolute values only; for an archimedean one only
  `t ≤ 1` works (Mathlib's `Real.rpow_add_le_add_rpow`).
- Over `F = ℚ(i)`, `K = ℚ`, the `2`-adic place: `2 = −i (1 + i)²` ramifies with `e = 2`, `f = 1`, and
  the unique `w` over `|·|_2` is `|·|_𝔓^(1/2)` for `𝔓 = (1 + i)`; it has `w(1 + i) = 2^(−1/2)`, a value
  no finite place of `F` takes at `1 + i` (`|1 + i|_𝔓 = 1/2`). A statement over `FinitePlace F` would
  miss it.

### 0.2 Conjugate absolute values

(Bombieri–Gubler, Corollaries 1.3.2 and 1.3.5.) The action `σ • w = w ∘ σ⁻¹` of `F ≃ₐ[K] F` on all of
`AbsoluteValue F ℝ`, for any algebra of semirings, is Tau Ceti's `AbsoluteValue.instMulActionAlgEquiv`,
with `σ • w` lying over `v` when `w` does; it has to be on all of `AbsoluteValue F ℝ`, because the
elements of the fibre over a finite place are not finite places. Define the action in the
generality of a group `G` acting on `F` by ring automorphisms (`MulSemiringAction G F`), as a single
instance with `(g • w) x = w (g⁻¹ • x)` of which the action of `F ≃ₐ[K] F` is the case of Mathlib's
`AlgEquiv.applyMulSemiringAction`, and prove `(g • w).under R = w.under R` for a subring `R` with
`SMulCommClass G R F`. For `F/K` Galois and `v` finite,
transitivity on the absolute values over `v` is Tau Ceti's
`NumberField.exists_smul_eq_of_liesOver_finitePlace` and
`NumberField.setOf_liesOver_finitePlace_eq_orbit`.

Prove `exists_algEquiv_comp_eq`: for `F/K` Galois and `v` a place of `K`, infinite or finite, any two
absolute values `w, w'` of `F` over `v` satisfy `w' = w ∘ σ` for some `σ : F ≃ₐ[K] F`. This is the
`AbsoluteValue.LiesOver` form of Mathlib's `NumberField.InfinitePlace.exists_smul_eq_of_comap_eq` and of
`Ideal.exists_comap_galRestrict_eq`; the new case is the infinite one, through 0.1. *Route* for the
finite case (Tau Ceti's): classify `w ∘ σ` by 0.1 and name its prime through 0.1's uniqueness clause,
`{y ∈ 𝓞 F | w (σ y) < 1}` being the contraction of `{y | w y < 1}` along `σ`; no equivariance of
`absNorm` or of the adic valuation under `σ` is needed. *Needs:* 0.1; Mathlib
`NumberField.InfinitePlace.exists_smul_eq_of_comap_eq`; Tau Ceti
`NumberField.exists_smul_eq_of_liesOver_finitePlace`.

The **local extension formula** is Tau Ceti's: the product over the places of `F` above `v` of the
normalized absolute values of `y ∈ K` is `v y ^ [F : K]`
(`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_inr_algebraMap` at infinite places,
`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_inl_algebraMap` at finite ones). Its restatement
for the absolute values of 0.1, where a finite place of `F` is the `(e f)`-th power of an absolute
value over `v` and `e f` cancels against `NumberField.FinitePlace.sum_localDegree` exactly as `mult`
cancels against `NumberField.InfinitePlace.sum_mult_eq_mult_mul_finrank`, is Tau Ceti's at finite
places (`NumberField.FinitePlace.prod_algebraMap_pow_localDegree`). Prove it at infinite places in
the same form: for `v : InfinitePlace K` and `y ∈ K`, the product over the absolute values `w` of `F`
over `v` of `w y ^ (mult of the infinite place of F that w is)` equals `(v y ^ v.mult) ^ [F : K]`; by
0.1 the `w` are the infinite places of `F` over `v`, and the exponents sum to `v.mult · [F : K]`.
*Needs:* 0.1; Tau Ceti
`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_inr_algebraMap`,
`NumberField.InfinitePlace.sum_mult_eq_mult_mul_finrank`.

The vocabulary for finite places that Mathlib has only for infinite ones is Tau Ceti's:
`NumberField.FinitePlace.LiesOver`, `NumberField.FinitePlace.localDegree` (`= e f`),
`NumberField.FinitePlace.placesOver` with its finiteness and nonemptiness. Two warnings carry over to
every statement here. `NumberField.FinitePlace.LiesOver` says that the primes lie over each other,
while `AbsoluteValue.LiesOver` says that `w` restricts to `v` on the nose; they agree exactly when the
local degree is `1` (Tau Ceti's `NumberField.FinitePlace.liesOver_val_iff_localDegree_eq_one`). And
Mathlib's `NumberField.InfinitePlace.inertiaDeg` is the local degree `[F_w : K_v]`, `1` or `2`, not a
residue degree.

**Checks.**
- Over `F = ℚ(i)`, `K = ℚ`, the finite place of `F` at `𝔓 = (1 + i)` lies over `|·|_2` as a
  `FinitePlace.LiesOver` but not as an `AbsoluteValue.LiesOver`: it takes the value `1/4` at `2`,
  not `1/2`, matching its local degree `2`.
- `F = ℚ(√2)`, `K = ℚ`: the two real places of `F` are exchanged by `√2 ↦ −√2`, as `exists_algEquiv_comp_eq`
  requires; for the non-Galois `ℚ(2^(1/3))/ℚ`, the real place and the complex place over `∞` are
  not conjugate under the trivial automorphism group, so the Galois hypothesis is needed.

### 0.3 The `S`-adic dictionary

(Bombieri–Gubler, Theorem 7.2.6 and Proposition 5.3.6.) For `S : Finset (HeightOneSpectrum (𝓞 K))`
the dictionary between the height and the `S`-integers is Tau Ceti's, and Layers 5, 6 and 8 use it
by these names:
- the `S`-product formula `(∏ v : InfinitePlace K, v u ^ v.mult) * ∏ v ∈ S, FinitePlace.mk v u = 1`
  for an `S`-unit `u` (`NumberField.prod_abs_eq_one_of_mem_unit`);
- for `x : ι → K`, `x ≠ 0`, with coordinates in `S.integer K`, `mulHeight x` is at most the product
  over the infinite places and `S` of the local sup norms (`NumberField.mulHeight_le_prod`), with
  equality when the local sup norms outside `S` are `1`
  (`NumberField.mulHeight_eq_prod_of_forall_iSup_eq_one`), which is exactly primitivity
  `Set.IsPrimitive S x`, the coordinates generating the unit ideal of `S.integer K`
  (`Set.isPrimitive_iff_finitePlace`, `NumberField.mulHeight_eq_prod_of_isPrimitive`); `[Finite ι]`
  throughout, `Fintype` only where a statement sums over `ι`;
- every finite `S` lies in a finite `S'` with `S'.integer K` a principal ideal domain
  (`IsDedekindDomain.exists_finset_superset_isPrincipalIdealRing_integer`), over which every nonzero
  point has a primitive scalar multiple (`Set.exists_isPrimitive_smul`); hence every finite `S` lies
  in a finite `S'` such that the height of every nonzero point is, after one scaling, the product of
  its local sup norms over the infinite places and `S'`
  (`NumberField.exists_finset_superset_forall_exists_mulHeight_eq`), the assembly Theorem 7.2.6
  opens with, which 5.1 and 6.4 consume;
- for `x ≠ 0`, the function `v ↦ ⨆ i, v (x i)` on finite places has finite multiplicative support
  (`NumberField.FinitePlace.hasFiniteMulSupport_iSup`). `x ≠ 0` is needed here and in the height
  bound: the zero tuple has height `1` and local sup norm `0` at every place.

The membership dictionaries and the height of a single `S`-integer, and the `S`-unit theorem, are
the material of HeightsAndUnits Layer 4, in Tau Ceti, and are not restated. Exponent bookkeeping is
carried out in `ℤ` through Mathlib's `IsDedekindDomain.HeightOneSpectrum.valuationOfNeZero`, whose
normalization is the negative of the usual order.

**Checks.**
- Primitivity is needed for the height identity: over `ℚ` with `S = ∅`, the integer point `(2, 2)`
  has height `1` (it is the projective point `(1, 1)`) while the product of its local sup norms over
  the infinite place is `2`.

### 0.4 The fundamental inequality and Liouville's inequality

(Bombieri–Gubler (1.8), Theorem 1.5.21, Theorem 2.8.21.) The fundamental inequality is Tau Ceti's:
the truncated local factors `min 1 (v α)` of a nonzero `α ∈ K` over all places multiply to
`(mulHeight₁ α)⁻¹` exactly (`NumberField.prod_min_one_apply_eq_inv_mulHeight₁`, the product formula
read through `min 1 t * max t 1 = t`); cutting the product down to `S∞` and `S₀` can only increase
it, so the product of the local factors of `α` over `S∞` and `S₀` is at least `(mulHeight₁ α)⁻¹`
(`NumberField.inv_mulHeight₁_le_prod_apply`, `NumberField.inv_mulHeight₁_le_prod_min_one_apply`) and
at most `mulHeight₁ α` (`NumberField.prod_apply_le_mulHeight₁`); at a single place,
`(mulHeight₁ α)⁻¹ ≤ min 1 (v α)` and `max (v α) 1 ≤ mulHeight₁ α`
(`NumberField.InfinitePlace.inv_mulHeight₁_le_min_one_apply`,
`NumberField.FinitePlace.inv_mulHeight₁_le_min_one_apply`,
`NumberField.InfinitePlace.max_apply_one_le_mulHeight₁`,
`NumberField.FinitePlace.max_apply_one_le_mulHeight₁`).

**Liouville's inequality.** Prove `inv_le_prod_min_one_sub` (Bombieri–Gubler (1.8), Theorem 1.5.21,
Theorem 2.8.21): for
`α ∈ F`, `β ∈ K` with `β ≠ α` in `F`, finite sets of places `S∞`, `S₀` of `K` and `w v` over `v` for
`v` in them,

```text
(2 ^ [F : ℚ] * mulHeight₁ α * mulHeight₁ β ^ [F : K])⁻¹
  ≤ (∏ v ∈ S∞, min 1 (w v (β − α)) ^ v.mult) * ∏ v ∈ S₀, min 1 (w v (β − α)),
```

the heights being Mathlib's relative ones, of `α` over `F` and of `β` over `K`. This is
Bombieri–Gubler's `(2 H(α) H(β))^(−[F : K])` raised to the power `d`, weaker than theirs at a place
where `F_w ≠ K_v`. *Route*: the constant is Mathlib's `Height.mulHeight₁_sub_le`; the exponent
`[F : K]` is Tau Ceti's `NumberField.mulHeight₁_algebraMap`; above an infinite place the multiplicity
comparison is Mathlib's `NumberField.InfinitePlace.mult_comap_le` through 0.1, above a finite place it
is `min 1 (s^t) ≥ min 1 s` for the exponent `t ≤ 1` of 0.1, and the chosen places above distinct `v`
are distinct by Mathlib's `NumberField.FinitePlace.maximalIdeal_inj`. The finite-place half is Tau
Ceti's `NumberField.inv_mulHeight₁_le_prod_min_one_apply_of_liesOver`. Nothing here uses 0.2. This is
the local step of every proof in Layers 3, 5 and 7, and the gap principle of 3.6 is this inequality
against the triangle inequality. *Needs:* 0.1; Mathlib `Height.mulHeight₁_sub_le`,
`NumberField.InfinitePlace.mult_comap_le`, `NumberField.FinitePlace.maximalIdeal_inj`; Tau Ceti
`NumberField.mulHeight₁_algebraMap`, `NumberField.inv_mulHeight₁_le_prod_min_one_apply_of_liesOver`.

Also its real-number corollary with the degree of the minimal polynomial: for real algebraic `ξ`, with
`F = ℚ⟮ξ⟯`, `D = [F : ℚ]` the degree of its minimal polynomial and `ψ` the real embedding of `F`
sending the generator to `ξ`, every rational `p/q ≠ ξ` with `q ≥ 1` has
`1 ≤ 2^D · mulHeight₁ ξ · (⌈|ψ ξ|⌉₊ + 1)^D · q^D · |ξ − p/q|`, the height of `ξ` relative to `F`.
Mathlib's `Liouville.exists_pos_real_of_irrational_root` follows, with this explicit constant in place
of its compactness constant.

**Checks.**
- The factor `2^[F : ℚ]` cannot be dropped: over `K = F = ℚ` with `S∞` empty and `S₀` the `2`-adic
  place, `α = 1` and `β = −1`, the right side is `min 1 |−2|_2 = 1/2` and the left side
  `(2 · 1 · 1)⁻¹ = 1/2`, equality; without the `2` the left side would be `1`.
- With `ξ = √2`, `D = 2`, `mulHeight₁ √2 = 2` over `ℚ(√2)` and `⌈√2⌉₊ + 1 = 3`, the real corollary
  gives `|√2 − p/q| ≥ 1 / (4 · 2 · 9 · q²) = 1/(72 q²)`; at `p/q = 3/2`, `|√2 − 3/2| ≈ 0.086 ≥ 1/288`.

### Examples

- Over `ℚ(i)/ℚ` at the `2`-adic place: there is one absolute value `w` over `|·|_2`, namely
  `|·|_𝔓^(1/2)` with `𝔓 = (1 + i)` of local degree `e f = 2` (0.1); on `ℚ`, `|y|_𝔓 = |y|_2^2`, so `w`
  restricts to `|·|_2`, and the local extension formula reads `|y|_𝔓 = |y|_2^[ℚ(i) : ℚ]` (0.2).

### Dependencies

Mathlib: absolute values and `AbsoluteValue.LiesOver`, the places of a number field with their
completions at infinite places, Gelfand–Mazur, heights. Tau Ceti: the classification over finite
places, `nonarchRpow`, the action of automorphisms, the local extension formulas, the `S`-adic height
dictionary and the fundamental inequality; GlobalNumberFields' normalized absolute values.

## Layer 1: approximation exponents

Real numbers only; the exponents are Tau Ceti's (Conventions). Nothing here uses Layers 2–6, and
Layer 7 returns to the exponents with the Subspace Theorem in hand. Throughout, `w_n = mahlerExponent n ξ`
and `w_n* = algebraicApproximationExponent n ξ`, valued in `ℝ≥0∞`.

### 1.1 Möbius invariance and Northcott for integer polynomials

(Bugeaud, *Approximation by Algebraic Numbers*, Ch. 3.) Tau Ceti has: `LiouvilleWith.inv`
(`LiouvilleWith p ξ` implies `LiouvilleWith p ξ⁻¹`, with no hypothesis on `p` or `ξ`); invariance of
`TauCeti.irrationalityExponent` under `ξ ↦ (a ξ + b) / (c ξ + d)` for a rational matrix of nonzero
determinant (`TauCeti.irrationalityExponent_mul_add_div_mul_add`); the characterization by
`|ξ − p/q| < H(p/q)^(−μ)` with `H(p/q) = max |p| q` in place of `q` (`Real.le_irrationalityExponent_iff`,
`TauCeti.liouvilleWith_iff_frequently_max`); **Northcott for integer polynomials**, finitely many
`P : ℤ[X]` with `natDegree P ≤ n` and `supNorm P ≤ B` (`Polynomial.finite_setOf_natDegree_le_supNorm_le`);
and the height gap that every statement of this layer runs on: for fixed `n`, `ξ` and `B`, below a
threshold a nonzero value `|P ξ|` forces `supNorm P` above `B`
(`Polynomial.exists_pos_lt_supNorm_of_norm_aeval_lt`), with its root form
(`Polynomial.exists_pos_lt_supNorm_of_norm_sub_root_lt`).

Prove:
- **Möbius invariance of Mahler's exponent**: for every `n` and a rational matrix `(a b; c d)` of
  nonzero determinant with `c ξ + d ≠ 0`, `mahlerExponent n ((a ξ + b) / (c ξ + d)) = mahlerExponent n ξ`.
  *Route*: the affine part is `Polynomial.comp` with a linear substitution, and the inversion is
  `Polynomial.reflect n`, which permutes the coefficients and preserves `supNorm` exactly; the general
  map is a composition of four such maps (partial fractions).
- **Möbius invariance of Koksma's exponent**, the same for `algebraicApproximationExponent n`.
  *Route*: roots move by `Polynomial.scaleRoots` and the substitution, and the minimal polynomial of
  the transformed approximant is extracted as an irreducible factor of the transform, with Gelfond's
  inequality (Tau Ceti's `Polynomial.mulHeight_mulHeight_le_two_pow_mul_mulHeight`, in its integer
  form) controlling its height.
- **Rigidity of the naive height**: two primitive irreducible integer polynomials with a common root
  in a `ℚ`-algebra that is a domain have the same `supNorm`, so the naive height of an algebraic
  number is a function of it (Tau Ceti's `TauCeti.naiveHeight`). *Needs:* Tau Ceti
  `TauCeti.primitiveMinpoly_eq_of_irreducible` (the case of a field).

*Needs:* Tau Ceti `TauCeti.mahlerExponent`, `TauCeti.algebraicApproximationExponent`,
`Polynomial.mulHeight_mulHeight_le_two_pow_mul_mulHeight`; Mathlib `Polynomial.reflect`,
`Polynomial.scaleRoots`, `Polynomial.supNorm`.

**Checks.**
- `mahlerExponent 1` is not the irrationality exponent: at a rational `ξ`, `w_1 = 0` while
  `irrationalityExponent ξ = 1`; the relation is `w_1 + 1 = irrationalityExponent` (Tau Ceti's
  `TauCeti.mahlerExponent_one_add_one`).
- The determinant hypothesis is load-bearing: `(ξ + 1) / (ξ + 1) = 1` for every `ξ ≠ −1`, and
  `w_1(√2) = 1` while `w_1(1) = 0`.
- The degree bound in Northcott cannot be dropped: every `X^k` has `supNorm 1`.
- The constant `2^deg` in Gelfond's inequality cannot be dropped:
  `(2X + 1)(X − 2) = 2X² − 3X − 2` has `supNorm 3`, while both factors have `supNorm 2`, and
  `2 · 2 > 3`.

### 1.2 Liouville's bound and Wirsing's inequalities

(Bugeaud, Ch. 3; Wirsing 1961.) For `ξ` real algebraic of degree `D`, **Liouville's inequality for the
value of an integer polynomial**, `|P ξ| ≥ c H(P)^(−(D − 1))` for `P` of degree at most `n` with
`P ξ ≠ 0`, `c` depending on `n` and `ξ`, is Tau Ceti's
`IsAlgebraic.exists_pos_le_norm_aeval_mul_supNorm_pow` (for complex algebraic `ξ`), and hence
`mahlerExponent n ξ ≤ D − 1` is Tau Ceti's `IsAlgebraic.mahlerExponent_le`. The exponent `D − 1`, not
`D`, comes from the norm: `∏_w w(γ)^(mult w) = |N(γ)| ≥ 1` for the algebraic **integer**
`γ = (P.scaleRoots t)(t ξ)`, and only the other `D − 1` places are estimated by `H(P)`, the
distinguished real place having `mult = 1`; this uses Mathlib's
`NumberField.InfinitePlace.prod_eq_abs_norm`, not 0.4.

**Wirsing's three lower bounds** on Koksma's exponent, for `ξ` not algebraic of degree at most `n`,
in `ℝ≥0∞` with the conventions that make each true at `w_n = ⊤`. Prove:
- `mahlerExponent_add_one_le_add`: for `1 ≤ n`, `w_n − n + 1 ≤ w_n*`, stated as
  `w_n + 1 ≤ w_n* + n`;
- `mahlerExponent_add_one_le_two_mul`: for `1 ≤ n`, `(w_n + 1) / 2 ≤ w_n*`, stated as
  `w_n + 1 ≤ 2 w_n*`;
- `div_le_algebraicApproximationExponent`: `w_n / (w_n − n + 1) ≤ w_n*`, which at `w_n = n` reads
  `n ≤ w_n*` and holds without `1 ≤ n`.

*Route.* The third is proved by construction: a polynomial at most `H^(−w')` at `ξ` and at most `H`
at `n − 1` further test points, `2` apart from `ξ` and `1` apart from each other, from a pigeonhole
on `n` linear forms (a box principle for integer polynomials in place of Minkowski's linear forms
theorem, at the cost of a constant); for `w'` above the Mahler exponent its height is forced above
`H^(1 + ε)`, so it is large relative to its height at every test point and has a root within `1/4`
of each, one per point, all simple, the one near `ξ` real because its disc is conjugation-stable;
the limit `w' ↓ w` is taken once at the end by continuity. The bounds on `H(P)` and `|lc P|` from the
roots are Mathlib's `Polynomial.mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm` and
`Polynomial.supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`. The first two bounds start from an
arbitrary Mahler approximant, whose nearest root need not be real: following Bell–Bugeaud, a
strictly nearest root is real, and when the minimum is attained `r ≥ 2` times the estimate
`|P ξ| ≤ c H(P) |ξ − α|^r` forces the complex-approximant exponent below `(w − 1)/2`. The first
inequality therefore needs the nearest-root estimate `|ξ − α| ≤ c |P ξ| H(P)^(n − 2)`, which is
`|P'(α)| ≥ 2^(−(d−1)(d−2)/2) M(P)^(−(d−2))` from `|disc P| ≥ 1` and the product formula
`disc P = lc(P)^(2d − 2) ∏_{i<j} (α_i − α_j)²` (Tau Ceti's
`Polynomial.discr_eq_leadingCoeff_pow_mul_prod_roots_sub_sq`). The second is Wirsing's
generalized-resultant construction, a basis selected among the monomial multiples of a family of
polynomials, as in Poëls's and Dixit's treatments. In the range `n ≤ w ≤ 2n − 3` the first needs the
second. *Needs:* Tau Ceti `IsAlgebraic.mahlerExponent_le`, `TauCeti.natCast_le_mahlerExponent`,
`TauCeti.algebraicApproximationExponent_le_mahlerExponent`,
`Polynomial.discr_eq_leadingCoeff_pow_mul_prod_roots_sub_sq`; Mathlib
`Polynomial.mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`,
`Polynomial.supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`.

**Checks.**
- Both of the first two bounds are false at `n = 0`, where both exponents are `0`: `0 + 1 ≤ 0 + 0`
  and `0 + 1 ≤ 2 · 0` fail, so `1 ≤ n` is needed; the third reads `0 / 1 ≤ 0` there.
- At `w_n = ⊤` the third bound reads `⊤ / ⊤ = 0 ≤ w_n*` in `ℝ≥0∞`, true; the second reads
  `⊤ ≤ 2 w_n*`, which forces `w_n* = ⊤`, as it must.

### 1.3 Mahler's and Koksma's classifications

(Bugeaud, Ch. 3; Mahler 1932; Koksma 1939.) Define Mahler's invariant
`mahlerInvariant ξ = limsup_n mahlerExponent n ξ / n` in `ℝ≥0∞` and the classes `IsANumber`
(`w = 0`), `IsSNumber` (`0 < w < ⊤`), `IsTNumber` (`w = ⊤` with every `w_n` finite) and `IsUNumber`
(some `w_n = ⊤`); and Koksma's invariant `koksmaInvariant ξ = limsup_n w_n* / n` with the classes
`IsAStarNumber`, `IsSStarNumber`, `IsTStarNumber`, `IsUStarNumber` defined in the same way from
`algebraicApproximationExponent`. These are definitions of `Suggested.lean`. API: every real number
lies in exactly one Mahler class and in exactly one Koksma class. Prove:
- `isANumber_iff`: the `A`-numbers are exactly the real algebraic numbers;
- `mahlerClasses_iff_koksmaClasses`: the two classifications coincide class by class, from 1.2's second
  inequality and `w_n* ≤ w_n`, which give `w / 2 ≤ w* ≤ w`, and `A = A*` because a transcendental
  number has `w_n ≥ n`, hence `w_n* ≥ (n + 1) / 2` and `w* ≥ 1/2`;
- Liouville numbers (Mathlib's `Liouville`) are `U`-numbers with `w_1 = ⊤`, through Tau Ceti's
  `TauCeti.linearFormExponent_eq_top_iff`;
- `mahlerClasses_iff_of_not_algebraicIndependent` (**Mahler's theorem**): two algebraically dependent
  transcendental numbers lie in the same class, through the exponents' invariance under polynomial
  relations.

That `T`-numbers exist (Schmidt) and that almost every number is an `S`-number (Sprindžuk) are not
targets here: the first needs Layer 6 and a construction of its own, the second is metric (Scope and
ownership). *Needs:* 1.1, 1.2; Tau Ceti `IsAlgebraic.mahlerExponent_le`,
`TauCeti.natCast_le_mahlerExponent`, `TauCeti.linearFormExponent_eq_top_iff`,
`TauCeti.mahlerExponent_mono`; Mathlib `Filter.limsup`, `AlgebraicIndependent`.

**Checks.**
- A rational number has every `w_n = 0` (a nonzero integer polynomial vanishing at it is excluded
  by the definition, and every other value is at least the inverse of a denominator power), so it is
  an `A`-number; `√2` has `w_n ≤ 1` for all `n`, so `w = 0`, while `w_1(√2) = 1`: a definition of
  `A` as "every `w_n = 0`" would leave `√2` out, against `isANumber_iff`.
- Mathlib's Liouville constant `∑ 10^(−k!)` is a `U`-number with `w_1 = ⊤`.

### Examples

- For `ξ = √2` (`D = 2`): `w_n(√2) ≤ 1` for every `n` by Liouville's bound, and `w_1(√2) = 1` by the
  box principle; it is an `A`-number.

### Dependencies

Tau Ceti: the three exponents with their comparisons, Möbius invariance of the irrationality
exponent, Northcott for integer polynomials and the height gaps, Liouville's bound for Mahler's
exponent, the discriminant root formula, Gelfond's inequality. Mathlib: `LiouvilleWith`, `Liouville`,
Mahler measure bounds, `Polynomial.reflect`, `Polynomial.scaleRoots`, `Filter.limsup`. Layer 0 is not
used.

## Layer 2: the auxiliary polynomial over a number field

The non-vanishing technology Layers 3 and 5 share. The Hasse derivative, the weighted index and
Roth's lemma are Tau Ceti's; this layer adds the two estimates Layer 3 needs beyond them, the
first of which Layer 5 also uses.

### 2.1 Counting and volume

(Bombieri–Gubler 6.3.3 and the proof of Lemma 6.3.4, Lemma 6.3.5, (7.23)–(7.25).) With
`TauCeti.simplexVolume m t`, the volume `V_m(t)` of `{x ∈ [0,1]^m | ∑ x j ≤ t}`, Tau Ceti has:
- *lattice points*: the number of `i` with `0 ≤ i j ≤ d j` and `∑ j, i j / d j ≤ t` is at least
  `V_m(t) ∏ d j` (`TauCeti.simplexVolume_mul_prod_le_ncard`, no hypothesis) and, for `t > 0` and every
  `d j > 0`, at most `V_m(t) (1 + max 1 t⁻¹ ∑ j, 1 / d j)^m ∏ d j`
  (`TauCeti.ncard_le_simplexVolume_mul_pow_mul_prod`);
- *the tail*: `V_m((1/2 − ε) m) ≤ exp (−6 m ε²)` for `0 ≤ ε` (`TauCeti.simplexVolume_le_exp_neg`),
  from `sinh u ≤ u exp (u² / 6)` (`Real.sinh_le_mul_exp_sq_div_six`, from `6^k k! ≤ (2k + 1)!`, sharp at
  `k = 1`, which is where the `6` comes from);
- the normalization: `0 < V_m(t)` for `t > 0`, `V_m(t) = 1` for `t ≥ m`, `V_m(t) = 0` for `t < 0`,
  and `V_1(t) = min 1 t` for `t ≥ 0` (`TauCeti.simplexVolume_pos`, `TauCeti.simplexVolume_eq_one_of_le`,
  `TauCeti.simplexVolume_eq_zero_of_neg`, `TauCeti.simplexVolume_one`).

Prove:
- *the exponential-moment estimate*: for a nonnegative integrable weight `g` on the line, `λ > 0`
  with `x ↦ exp (−λ x) g x` integrable, and `s : ℝ`,
  `∫_{∑ x j ≤ s} ∏ j, g (x j) ≤ exp (λ s) (∫ exp (−λ x) g x)^m`, decoupled by Mathlib's
  `MeasureTheory.integral_fintype_prod_volume_eq_pow`; applied at the indicator of `[0, 1]` it gives
  the tail above, and at the Beta density the next item;
- *the multihomogeneous tail*: for `1 ≤ n` and `0 ≤ η`, the proportion of exponent tuples `J` of
  multidegree `(d_1, …, d_m)` in `m` blocks of `n + 1` variables with
  `∑ h, J h i / d h ≤ m / (n + 1) − m η` for a fixed `i` is, in the limit, less than
  `exp (−(n + 1)(n + 2) η² m / 4)`, stated against the normalized density `n (1 − x)^(n − 1)` of one
  simplex coordinate together with the lattice-point comparison that makes it a count.

The book's restrictions `ε ≤ 1/2`, `0 < λ ≤ n + 4` and `η ≤ 2 / (n + 1)` are artefacts of its
truncated alternating series and are not hypotheses: `exp (−u) ≤ 1 − u + u² / 2` for every `u ≥ 0`
gives the three terms the book keeps. The lattice-point bounds are one covering by half-open boxes
`∏ j, [i j / d j, (i j + 1) / d j)`, the upper one through Mathlib's `MeasureTheory.Measure.addHaar_smul`
on `(1 + ρ) 𝒱_m(t)`. State all of it in a file that imports no number theory.
DiophantineApproximationAndTranscendence §1.5's count of the `d` with `∑ d i / r i ≤ (n/2)(1 − ε)` is
the shape Roth over `ℚ` uses; what 2.2 and 5.2 need is the volume form with the book's constants.
*Needs:* Mathlib `MeasureTheory.integral_fintype_prod_volume_eq_pow`, `MeasureTheory.Measure.addHaar_smul`;
Tau Ceti `TauCeti.simplexVolume`.

**Checks.**
- At `t = 0` the origin is an admissible lattice point while `V_m(0) = 0` for `m ≥ 1`, so the upper
  lattice bound fails there: `t > 0` is load-bearing.
- With `m = 1`, `d = 0`, `t = 1`, the only index `0` is admissible (under `x / 0 = 0`), a count of `1`,
  while the upper bound is `V_1(1) · (1 + 0)^1 · 0 = 0`: `d j > 0` is load-bearing too.
- `V_1(t) = min 1 t` pins the normalization: a volume of the simplex `{∑ x j ≤ t}` alone, without
  the cube, would give `t` for `t > 1`.

### 2.2 The auxiliary polynomial

Prove `exists_ne_zero_le_weightedIndex_logHeight_le` (Bombieri–Gubler, Lemma 6.3.4): let `F/K` be a
finite extension of number fields of degree `r`, let `α k : Fin m → F` for `k : Fin N` be points, and
let `t k > 0` with `r ∑ k, V_m(t k) < 1`. For every `δ > 0` there is `D₀` such that for all
`d : Fin m → ℕ` with `D₀ ≤ d j` there is a nonzero `P : MvPolynomial (Fin m) K` with
`degreeOf j P ≤ d j`, `MvPolynomial.weightedIndex d (α k) P ≥ t k` for every `k` (`P` mapped to `F`),
and

```text
P.logHeight ≤ r / (1 − r ∑ k, V_m(t k)) · ∑ k, ∑ j, V_m(t k) (logHeight₁ (α k j) / r + [K : ℚ] log 2 + δ) d j
```

in relative logarithmic heights, `P` over `K` (Tau Ceti's `MvPolynomial.logHeight`) and `α k j` over
`F`. This is the book's bound in absolute heights multiplied by `[K : ℚ]`: the relative height of `P`
is `[K : ℚ]` times the absolute one, that of `α k j` is `[F : ℚ] = r [K : ℚ]` times it, and the `log 2`
becomes `[K : ℚ] log 2`. The factor on `log 2` is load-bearing and no `δ` absorbs its absence: at
`F = K = ℚ(2^(1/256))`, `m = N = 1`, `α = 1`, `t = 1/2`, `δ = log 2`, the bound with `log 2` in place of
`[K : ℚ] log 2` asks for `P.logHeight ≤ 2 D log 2` at multiplicity `D / 2` at `1`, while Jensen's
formula at each of the `256` embeddings gives `P.logHeight ≥ (32 log 2 / (e π)) D − 256 log (D + 1)`.
This is the `ε`–`D₀` reading of the book's `o(1)`, and every application lets `d j → ∞` with `m`
fixed. DiophantineApproximationAndTranscendence §1.5's auxiliary polynomial for one algebraic `α`
over `ℤ` (Tau Ceti's `TauCeti.exists_roth_auxiliary_polynomial`) is the shape `K = ℚ`, `N = 1`, and is
not restated.

*Route*: DiophantineApproximationAndTranscendence §2.8's relative Siegel lemma, applied on the **box**
of bounded partial degrees `∀ j, Fin (d j + 1)` through Tau Ceti's dictionary `MvPolynomial.ofBox`
between coefficient vectors and polynomials, whose cardinality `∏ j, (d j + 1)` is then free. The
conditions are the vanishing of `hasseDeriv μ P` at `α k` for `∑ j, μ j / d j < t k`, an order leaving
the box carrying no condition (`MvPolynomial.hasseDerivRow_eq_zero`), counted by 2.1. A condition row
is Tau Ceti's `MvPolynomial.hasseDerivRow`, the multiplication table
`(∏ j, (I j).choose (μ j)) ∏ j, α j ^ (I j − μ j)`, whose height is a product of one-variable heights
(Mathlib's `Height.mulHeight_fun_prod_eq`) with the tuple of powers `α^k`, `k ≤ d`, of height
`mulHeight₁ α ^ d` exactly (Tau Ceti's `Height.mulHeight_pow_range`); the single estimate
`(I j).choose (μ j) ≤ 2^(d j)` is the `[K : ℚ] log 2` (Tau Ceti's `MvPolynomial.mulHeight_hasseDerivRow_le`):
the condition rows have entries in `F`, whose relative heights enter divided by `r` as that of
`α k j` does, and an integer `n` has relative height `n^[F : ℚ]` over `F`. The `δ` pays for three
quantities of three orders, all `o(∑ j, d j)`: the lattice-point correction `(1 + ρ)^m − 1 = O(m² / D₀)`,
the `√M` by which the Arakelov normalization of Siegel's lemma exceeds the sup-norm one, and the
discriminant of `K`. The one-input transport from local factors to the height is Tau Ceti's
`Height.mulHeight_le_pow_totalWeight`: a tuple whose local factors are at most a constant at the
archimedean absolute values and at most `1` at the others has height at most the constant to the
`totalWeight`. *Needs:* 2.1; DiophantineApproximationAndTranscendence §2.8 (relative Siegel lemma);
Tau Ceti `MvPolynomial.ofBox`, `MvPolynomial.hasseDerivRow`, `MvPolynomial.hasseDerivRow_eq_zero`,
`MvPolynomial.mulHeight_hasseDerivRow_le`, `Height.mulHeight_pow_range`,
`Height.mulHeight_le_pow_totalWeight`, `MvPolynomial.weightedIndex`, `MvPolynomial.logHeight`.

**Checks.**
- With no variables (`m = 0`) `V₀(t) = 1` for `t > 0`, so `r ∑ k, V_0(t k) < 1` forces `N = 0`; and
  indeed a nonzero constant has weighted index `0` at every point, so no condition `t k > 0` could be
  met.
- `r S < 1` does not imply `r (1 + ε) S < 1` for a fixed `ε > 0` (take `r S = 1 − ε/2`), so in the
  route `ε` is chosen before `D₀`.

### Examples

- `K = F = ℚ`, `N = 1`, one point `α ∈ ℚ^m`: the lemma gives integer-coefficient polynomials (after
  clearing denominators) of prescribed partial degrees vanishing to weighted order `t` at `α`, with
  `log` of the coefficients at most `(1 − V_m(t))⁻¹ V_m(t) ∑ j (h(α j) + log 2 + δ) d j`.

### Dependencies

Tau Ceti: the simplex volume with its lattice-point and tail bounds, `ofBox` and the condition rows
with their heights, `weightedIndex`, `MvPolynomial.logHeight`, `mulHeight_le_pow_totalWeight`.
DiophantineApproximationAndTranscendence §2.8 (relative Siegel lemma). Mathlib: measure theory on
`Fin m → ℝ`, `Height.mulHeight_fun_prod_eq`. Layer 0 only through the heights.

## Layer 3: Roth's theorem

Roth's theorem over `K` with targets in `F`, the forms in which it is applied, its projective
reading with the central quantity of the Subspace Theorem, and the counting and moving-target
theory built on its proof.

### 3.1 Approximation classes

(Bombieri–Gubler 6.4.2–6.4.4.) For a finite index set `A` and maps `φ a : X → [0, 1]` with
`∑ a, φ a x ≤ 1`, the partition of `X` by the cell of side `1 / N` containing `(φ a x)_a` is Tau
Ceti's: the label `TauCeti.cellIndex N y a = ⌊N y a⌋₊`; the count of labels
`{c : A → ℕ | ∑ a, c a ≤ N}.ncard = (N + |A|).choose |A|`, an equality, since adding one coordinate
for `N − ∑ a, c a` turns the labels into the tuples on `Option A` that sum to `N`
(`TauCeti.ncard_setOf_sum_le`, through Mathlib's `Finset.card_finsuppAntidiag_nat_eq_choose`); the
bound on the nonempty cells (`TauCeti.ncard_image_cellIndex_le`); and an infinite cell inside every
infinite `X`, for every `N` (`Set.Infinite.exists_cellIndex_eq`). The book's (6.9), which the
consumers quote, is Tau Ceti's too: for `f : A → (0, 1]` with `Λ = ∏ b, f b` and `c` the label of the
profile `log f a / log Λ` (`TauCeti.logProfile`), the cell traps every coordinate,
`f a ≤ Λ^(c a / N)` (`TauCeti.le_rpow_cellIndex_div`, the upper half, attained) and, for `0 < N` and
`Λ < 1`, `Λ^((c a + 1) / N) < f a` (`TauCeti.rpow_cellIndex_add_one_div_lt`); and (6.10), a profile on
the hyperplane has label sum above `N − |A|` (`TauCeti.one_sub_card_div_lt_sum_cellIndex_div`). The
`(L, M)`-**independent** sequences, `TauCeti.IsHeightIndependent L M β` meaning
`logHeight₁ (β 0) ≥ L` and `logHeight₁ (β (j + 1)) ≥ M logHeight₁ (β j)`, exist inside every infinite
subset of a field with Northcott's property (`Set.Infinite.exists_isHeightIndependent`), with
distinct terms for `1 < M`, `0 < L` (`TauCeti.IsHeightIndependent.injective`), and the two reductions
together are `Set.Infinite.exists_cellIndex_eq_and_isHeightIndependent`.

Define, over a number field, the index set of a finite set of places as the disjoint union
`↥Sinf ⊕ ↥Sfin` of the two typed finsets, with the maps reading off from an element its underlying
absolute value and its weight (`mult v` at an infinite place, `1` at a finite one), so that the
profiles of 3.2 and 3.6 are indexed by it. The milestone is stated abstractly because 3.2 and 3.6
use it for different families `φ`, and 5.1 does not use it at all (its classes are cells of a cube).
*Needs:* Tau Ceti `TauCeti.cellIndex`, `TauCeti.IsHeightIndependent`,
`Set.Infinite.exists_cellIndex_eq_and_isHeightIndependent`; Mathlib `NumberField.InfinitePlace.mult`.

**Checks.**
- Without `∑ φ ≤ 1` the labels are the `(N + 1)^|A|` cells of the cube: at `N = 1`, `|A| = 2` there
  are four, against the three labels `(0, 0)`, `(1, 0)`, `(0, 1)` of the simplex.
- The lower half of (6.9) needs `0 < N`: at `N = 0`, `(c a + 1) / N = 0` in Lean and the inequality
  would read `1 < f a`, false for `f a ≤ 1`.

### 3.2 Roth's theorem

Prove `finite_setOf_prod_min_one_le` (Bombieri–Gubler, Theorem 6.4.1; Roth 1955; Ridout 1958; Lang):
let `F/K` be a finite extension, `S∞` and `S₀` finite sets of places of `K`, `w v` an absolute value of
`F` over `v` and `α v ∈ F` for each `v` in them, and `κ > 2`. Then the set of `β ∈ K` with

```text
(∏ v ∈ S∞, min 1 (w v (β − α v)) ^ v.mult) * ∏ v ∈ S₀, min 1 (w v (β − α v))  ≤  mulHeight₁ β ^ (−κ)
```

is finite: the book's statement raised to the power `d`.

Prove it as the constant case of a theorem about chains, the core of Roth's proof. With `ε` an
explicit function of `κ`, the class size `N` of `κ` and `|S|`, and the chain length `m` and the ratio
`M` of `κ`, `|S|` and `[F : K]` (the parameters of the route below), there is `δ > 0`, depending on `K`,
`S`, `[F : ℚ]` and `κ` and on no target, such that no `(L, M)`-independent chain of `m + 1`
solutions in one approximation class, each member `β j` a solution for its own targets `α j`, has
`1 + ∑ v, absLogHeight₁ (α j v) ≤ δ absLogHeight₁ (β j)` throughout (*no moving chain*); its
constant-target case (*no chain*) fed by 3.1's reduction is Roth's theorem.

*Route*, Steps 0–V of 6.4.2–6.4.10: discard the finitely many `β` of height at most `1` (Northcott)
and the at most `|S|` values equal to a target; classify the rest by the profile
`log Λ_v(β) / log Λ(β)` (3.1) with `N` chosen so that `|S| / N` is small; take `m` with
`[F : K] |S| exp (−6 m ε²) < 1/2` and an `(L, M)`-independent `(m + 1)`-tuple in one class; build `P`
by 2.2 at the target points `(α 0 v, …, α m v)` with `d j = ⌈D / h(β j)⌉` (Steps I, II); find by
Roth's lemma (Tau Ceti's `TauCeti.weightedIndex_le_of_logHeight_le`) a derivative `Q` of `P` of small
weighted order with `Q(β) ≠ 0`; bound `Q(β)` above at each place of `S` by the Taylor expansion at the
target point (Tau Ceti's `MvPolynomial.eval_add_eq_finsum_hasseDeriv`, the size of a target bounded by
its height through 0.1), below by the product formula, and compare (Steps III–V). **Step IV is the
product formula over all the places against local upper bounds at every place**, and not the
fundamental inequality of 0.4 over `S`: the local bound on `|Q(β)|_v` carries the local factor of the
coefficients of `Q`, whose product over `S` alone is not bounded by `h(Q)`, and charging `h(Q)` twice
proves the theorem only for `κ > 4`. `κ > 2` is used exactly once, as `1 / κ < 1/2`, leaving room for
the two losses `4 ε` and `|S| / N`; the contradiction is `κ (1 − |S| / N)(1/2 − 4 ε) > 1`. Nothing
tends to infinity: every error term is `O(D / L)` except `([K : ℚ] + 2 ∑ w_v) log (D + 2)` from the
`∏ j, (d j + 1)` monomials of the box, and an elementary lemma produces one explicit `D` with
`D ≥ a` and `b log (D + 2) < c D`. The book's Theorem 6.2.3, with targets in the completions, is this
theorem and not a different one, by 0.1. The local bounds on the value of a polynomial at one
absolute value are Tau Ceti's: trivially (`AbsoluteValue.apply_eval_le`, with a constant depending on
the height and not on the polynomial, which varies with `D`), through the Taylor expansion
(`AbsoluteValue.apply_eval_le_of_le_weightedIndex`), and translated into the base field along
`AbsoluteValue.LiesOver` (`AbsoluteValue.LiesOver.apply_eval_le_of_le_weightedIndex`, with the
nonarchimedean forms). *Needs:* 0.1, 0.4, 2.1, 2.2, 3.1; Tau Ceti
`TauCeti.weightedIndex_le_of_logHeight_le`, `MvPolynomial.eval_add_eq_finsum_hasseDeriv`,
`AbsoluteValue.apply_eval_le`, `AbsoluteValue.LiesOver.apply_eval_le_of_le_weightedIndex`,
`Set.Infinite.exists_cellIndex_eq_and_isHeightIndependent`.

**Checks.**
- Roth's theorem is false at `κ = 2`: for `ξ = √2 − 1 ∈ (0, 1)`, Dirichlet's theorem gives infinitely
  many `p/q` with `|ξ − p/q| < q^(−2)`, and each has `|p| ≤ q`, so its height is `q` and
  `min 1 |ξ − p/q| < H(p/q)^(−2)`.
- It is false at `κ = 0`: `min 1 (…) ≤ 1 = H^0` for every `β`.
- With `S∞` the real place of `K = ℚ` and target `α = 2^(1/3)`, the theorem specializes to Roth's
  theorem for `2^(1/3)` over `ℚ` (Tau Ceti's `IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`,
  which has no `min 1`; the two differ only on the rationals of height `1`).

### 3.3 The forms applications quote

Each is 3.2 for a choice of data, and each is stated.

*Targets at infinity* (Bombieri–Gubler 6.2.5). Define `onePointApprox w β t` for `t : OnePoint F`,
equal to `min 1 (w (β − t))` at a finite target and `(max 1 (w β))⁻¹` at `∞`, a definition of
`Suggested.lean`. Prove 3.2 with targets in `OnePoint F`, and
`finite_setOf_prod_onePointApprox_le_const`, the form with a constant `C` in front of the height,
which every form after it consumes: for `κ > 2` and every real `C`, finitely many `β ∈ K` have the
product of the `onePointApprox` factors at most `C · mulHeight₁ β ^ (−κ)`. *Route*: the Möbius change
of variable `β ↦ (β − c)⁻¹` with a base point `c ∈ K` avoiding every finite target (inverting alone
exchanges `0` and `∞`), whose distortion at each place is bounded and absorbed by lowering `κ` to
some `κ₁ ∈ (2, κ)` and collecting the finitely many solutions of small height by Northcott.

*The finite places of `ℚ`* are the `p`-adic norms with exponent exactly `1`: Tau Ceti's
`NumberField.FinitePlace.val_eq_padic` and `NumberField.FinitePlace.apply_eq_padicNorm`, with the
converse `Nat.Primes.finitePlace_mk_val_eq_padic`, and `Rat.AbsoluteValue.IsStandard` with
`AbsoluteValue.IsEquiv.eq_of_isStandard` as the companions. Mathlib's Ostrowski gives only a power,
and a power `≠ 1` would turn Ridout's `2 + ε` into `(2 + ε) / t`.

*Over `ℚ` at the real place*: finitely many rationals `β` have `min 1 |α − β| ≤ mulHeight₁ β ^ (−κ)`,
for real algebraic `α` and `κ > 2`. **Roth's theorem as a value**, `irrationalityExponent α = 2` for
every real algebraic irrational `α`, the value Layer 1 leaves between `2` and `D`, is Tau Ceti's
`IsAlgebraic.irrationalityExponent_eq_two`; 3.2 specializes to it.

*Ridout.* Prove `finite_setOf_ridout` (Ridout 1958): for real algebraic `α`, finite sets of primes
`S₁`, `S₂` and `ε > 0`, finitely many `p/q` in lowest terms have
`|α − p/q| · ∏_{ℓ ∈ S₁} |p|_ℓ · ∏_{ℓ ∈ S₂} |q|_ℓ ≤ max(|p|, |q|)^(−2 − ε)`. *Route*: target `0` at `S₁`
and `∞` at `S₂`; the solutions split into `2^|S₁ ∩ S₂|` classes by which of `p`, `q` a prime of
`S₁ ∩ S₂` divides; the workhorse is the form with one target at the infinite place of `ℚ` and one
target in `OnePoint` at each prime of a finite set.

*`p`-adic* (Bombieri–Gubler 6.2.6). For `α` in a number field `F`, `w` over `Rat.AbsoluteValue.padic p`
and `ε > 0`, finitely many `n ∈ ℤ` have `w (α − n) ≤ |n|^(−1 − ε)`; the exponent `1 + ε` comes from the
target `∞` at the infinite place, where an integer has local factor exactly `H(n)⁻¹`.
DiophantineApproximationAndTranscendence §1.6's Roth theorem and §2.3's `p`-adic Roth theorem are the
instances: the milestone specializes to the first and discharges the second.

*Needs:* 3.2, 0.1; Tau Ceti `NumberField.FinitePlace.apply_eq_padicNorm`,
`IsAlgebraic.irrationalityExponent_eq_two`; Mathlib `OnePoint`, `padicNorm`,
`Rat.AbsoluteValue.padic`.

**Checks.**
- The `p`-adic form is false at `ε = 0`: with `α = 0`, every `n = p^k` has
  `|0 − p^k|_p = p^(−k) = |n|^(−1)`.
- At the target `∞` and `β = 0`, `onePointApprox w 0 ∞ = (max 1 0)⁻¹ = 1`, while the formula
  `min 1 (w β)⁻¹` would give `min 1 0⁻¹ = 0` under `0⁻¹ = 0`, making `β = 0` a solution for every `κ`.
- `2^(1/3)` has irrationality exponent `2` (Tau Ceti's theorem), against the bound `3` from Liouville.

### 3.4 Roth's theorem on the projective line

(Bombieri–Gubler, Example 7.2.7.) The central quantity `NumberField.approxProd` of the Conventions
is Tau Ceti's, with its API: invariance under `x ↦ c • x` from the `LiesOver` hypotheses
(`NumberField.approxProd_smul`); monotonicity under enlarging the places when the added places carry
the coordinate forms, whose local factor is at most `1` (`NumberField.approxProd_le_approxProd_of_subset`,
`NumberField.prod_proj_div_iSup_le_one`); and multiplicativity in `S` (`NumberField.approxProd_union`).

Prove `exists_finset_submodule_of_approxProd_le_card_two`: for `Fintype.card ι = 2`, linearly
independent forms `L v 0`, `L v 1` at each `v` in `Sinf` and `Sfin`, `w v` over `v` and `ε > 0`,
finitely many proper subspaces of `K²` contain every `x ≠ 0` with
`approxProd … x ≤ mulHeight x ^ (−2 − ε)` (the Subspace Theorem of 6.3 for two coordinates), proved
from 3.3. *Route*: at each place a solution is close to the zero of at most one of the two forms, a
point of `OnePoint F` (the root of a form `a X₀ + b X₁` being `−a/b`, or `∞` when `b = 0`), so the
solutions split into `2^|S|` sets by a choice function extended off `S` twice with
`Function.extend`, which composes only because an infinite and a finite place never share their
absolute value (0.1); on each set `approxProd` is comparable to the left side of 3.3 at
`β = x 1 / x 0` by Cramer's rule read at one absolute value,
`|det| · max(1, |β|) ≤ (∑ |coefficients|) · max_i |L_i|`, with a constant growing with the target.
Conversely 3.2 is this statement for `L v 0 = X 0`, `L v 1 = X 1 − α v X 0`: prove that the subspace
statement implies 3.2 (taking it as a hypothesis), and the roundtrip, 3.2 proved through this
milestone. State the milestone for an arbitrary index type with two elements, never `Fin 2`, so that
6.6 is an equation between theorems. This is the interface 8.1, 8.3, 8.4 and 8.5 would consume if
Layers 4–6 were absent. *Needs:* 0.1, 3.2, 3.3; Tau Ceti `NumberField.approxProd`,
`NumberField.approxProd_smul`; Mathlib `Function.extend`, `OnePoint`.

**Checks.**
- The conclusion is "finitely many points of `ℙ¹(K)`", never "finitely many `β ∈ K`": for the
  coordinate forms, `x = (0, 1)` makes the factor of `X₀` vanish, so `approxProd = 0` and it is a
  solution for every `ε`, on no line `K · (1, β)`.
- For `L v 0 = X 0`, `L v 1 = X 1 − α X 0` at the real place of `ℚ` and `x = (q, p)`,
  `approxProd = |q| · |p − α q| / max(|p|, |q|)² = |α − p/q| · (q / max(|p|, |q|))²`: Roth's
  quantity up to a factor at most `1`, equal to `1` when `|p| ≤ |q|`.

### 3.5 Mahler's theorem on `(p/q)^k`

Prove `eventually_exp_neg_lt_abs_sub_round` (Mahler 1957; Bombieri–Gubler 6.2.7): for coprime
integers `p > q ≥ 2` and `ε > 0`, the distance from `(p/q)^k` to the nearest integer exceeds
`exp (−ε k)` for all but finitely many `k`; equivalently, only finitely many `k` admit any integer
within `exp (−ε k)` of `(p/q)^k`. *Route*: Ridout's theorem with `S₁` the primes of `q`, `S₂` the
primes of `p` and the target `1` at the infinite place, applied to `β = N q^k / p^k` with `N` the
nearest integer, in this orientation so that the denominator of `β` divides `p^k` and the product over
the primes of `p` is `1 / (denominator of β)` exactly. The arithmetic input: the primes of a natural
number as a finset of primes, and the product of `|n|_ℓ` over the primes of `n` is `1 / n` exactly,
while over a set missing a prime factor it is larger. The exceptional set is nonempty (`k = 0`), so
the conclusion is `∀ᶠ`. This is the acceptance test of 3.3's finite places: without them the left
side of Ridout's inequality lacks the factor `q^(−k) · ∏_{ℓ ∣ q} |N|_ℓ · gcd(N, p^k) / p^k` that the
primes of `q` and `p` contribute, at most `q^(−k) · gcd(N, p^k) / p^k` and equal to it when `N` is
prime to `q`, and no `ε` works. *Needs:* 3.3 (Ridout); Mathlib
`Nat.primeFactors`, `padicNorm`, `round`.

**Checks.**
- `q ≥ 2` is load-bearing: at `(p, q) = (3, 1)` every `(3/1)^k` is an integer. Coprimality is
  load-bearing: at `(4, 2)`, `(4/2)^k = 2^k` is an integer.
- At `k = 0`, `(p/q)^0 = 1` is an integer, so the set of exceptional `k` is never empty.
- For `(p, q) = (3, 2)` and `ε = 1/100`: finitely many `k` have `‖(3/2)^k‖ ≤ exp (−k/100)`.

### 3.6 Counting approximations

(Bombieri–Gubler, Theorem 6.5.4, Lemma 6.5.6, 6.5.7; Davenport and Roth 1955.) The number of
solutions of 3.2, never their height. Prove:
- *the strong gap principle*: if `β ≠ β'` are solutions of 3.2 in one approximation class of size
  `1 / N` with `h(β) ≤ h(β')`, then `h(β') ≥ ((1 − |S| / N) κ − 1) h(β) − log 4`, in absolute
  logarithmic heights, from 0.4 against the triangle inequality; a solution equal to a target sits in
  the corner `N e_v` of the simplex, where (6.9) and (6.10) still hold, so no place of `S` has to be
  discarded;
- *the count in a window*: with `c = (1 − |S| / N) κ − 1 > 1`, at most
  `⌈log A / log ((c + 1) / 2)⌉ · (N + |S|).choose |S|` solutions have `h(β) ∈ (X, A X]`, for
  `X ≥ log 16 / (c − 1)` (the book writes `>` and applies it at equality);
- *the count of large solutions*: the solutions with `h(β) > L` number at most
  `m ⌈log M / log ((c + 1) / 2)⌉ (N + |S|).choose |S|`, Roth's parameters of 3.2, from the no-chain
  theorem and a greedy grouping (a finite set with small blocks and no chain of `m + 1` points has at
  most `m` times the block size points); and every solution above the gap height `log 16 / (c − 1)`
  is counted by an explicit number in `κ`, `|S|`, `[F : K]`, `[F : ℚ]` and a bound `Ht` for
  `∑ v, h(α v)`, which is `O(log (1 + Ht))`, Davenport and Roth's `c₁ + c₂ log log H(α)`;
- *the interval form*: above a threshold `L' ≥ L`, the solutions have absolute height
  `mulHeight₁ β ^ (1 / [K : ℚ])` in at most `m (N + |S|).choose |S|` intervals `[Q, Q^M)` with
  `Q > exp L'`, by the greedy grouping with its starting points kept and no gap principle; with
  targets in `OnePoint F` and a constant it holds in logarithmic heights with windows
  `[t − e, M t + e)` at Roth's parameters for `(κ + 2) / 2`;
- the interval form is what 9.4 consumes for two variables (stated there, since it needs the
  systems of 9.1).

Two combinatorial lemmas know no heights: points with a multiplicative gap in a window are at most
`⌈log A / log g⌉` times the number of classes, and the chain lemmas above (a finite set with no chain
of `m + 1` points growing at ratio `M` is covered by at most `m` intervals `[Q, Q^M)` per class).
*Needs:* 0.4, 3.1, 3.2.

**Checks.**
- The gap principle with `N = |S|` would give `c = −1 < 1`: the class size must make `|S| / N` small
  for `c > 1`, which is where `κ > 2` enters (`(1 − |S| / N) κ − 1 > 1` needs `κ > 2 / (1 − |S| / N)`).

### 3.7 Moving targets

Prove `finite_setOf_prod_min_one_le_of_isLittleO` (Vojta; Bombieri–Gubler, Theorem 6.5.2): for a
sequence of pairs `(α j, β j)` with `α j : S → F`, `β j ∈ K` and `1 + ∑ v, h(α j v) = o(h(β j))` along
`atTop` (Mathlib's `Asymptotics.IsLittleO`; in absolute or in relative heights, the two readings being
equivalent), only finitely many `j` have `β j` a solution of 3.2's
inequality with targets `α j`; and no infinite sequence consists of solutions. *Route*: five lines on
the no-moving-chain theorem of 3.2: the `o` supplies the `δ`, and Mahler's reduction, run on the
indices with each pair classified at its own targets, supplies the chain. The targets enter Roth's
proof twice, in the height of the auxiliary polynomial and in the Taylor expansion at a place of `S`,
where `log⁺ |α_v|_w` is bounded by the height of the target through 0.1's
`max (w x) 1 ≤ mulHeight₁ x`. The conclusion counts indices, since a sequence may repeat a pair.
*Needs:* 0.1, 3.2.

**Checks.**
- The `1 +` is load-bearing: the constant pair `(0, 0)` over `ℚ` has all heights `0`, so
  `∑ h(α j) = 0 = o(h(β j) = 0)` holds, and every index is a solution (`min 1 0 = 0 ≤ 1`).
- `o` cannot be weakened to `O`: the constant pair `(2, 2)` over `ℚ` has `1 + log 2 = O(log 2)`, and
  every index is a solution.
- Constant targets give 3.2 back, since an infinite set of distinct `β` has `h(β) → ∞` (Northcott).

### Examples

- Mahler's `(3/2)^k` (3.5): finitely many `k` with `‖(3/2)^k‖ ≤ exp (−k / 100)`.
- The three proofs of Roth's theorem (3.2, 3.4's roundtrip, 6.6) have the same statement, which 6.6
  checks by `rfl`.

### Dependencies

Layer 0 (0.1, 0.4), Layer 2 (2.1, 2.2), Layer 1 not used. Tau Ceti: the approximation classes and
`(L, M)`-independent sequences, Roth's lemma over `K`, the local value bounds along `LiesOver`, the
approximation product, the `p`-adic dictionary over `ℚ`, Roth's theorem over `ℚ` as a value.

## Layer 4: parallelepipeds over a number field

Schmidt's proof is geometry of numbers applied to a family of parallelepipeds. Bombieri–Gubler work
in the adèles (7.5.6 and Appendix C.2); this layer works with a `ZLattice` in a real vector space
together with a convex body, for forms whose coefficients lie in `K`. Neither choice costs anything:
6.3 removes the restriction on the coefficients by the book's Remark 7.2.3, and the adelic form of
Minkowski's second theorem is recovered in 4.2 from the real one. No adèle and no Haar measure on a
local field appears. Throughout Layers 4 and 5 and in 6.1 the places are **all** the infinite places
together with a finite `S₀ : Finset (FinitePlace K)`, because a domain with no condition at an
infinite place is unbounded there; 6.2 adds the missing infinite places first.

### 4.1 Approximation domains

(Bombieri–Gubler 7.5.6, Lemma 7.5.7, Corollary 7.5.8.) Fix forms `L v i : Module.Dual K (ι → K)`,
linearly independent for each infinite `v` and each `v ∈ S₀`, exponents `c v i : ℝ` and a level `Q`.
The **approximation domain** is Tau Ceti's `TauCeti.NumberField.approxDomain S₀ L c Q`: the `x` with
`v (L v i x) ≤ Q ^ c v i` at every infinite place and every `v ∈ S₀`, for all `i`, and `v (x j) ≤ 1` at
every finite place outside `S₀`, for all `j`. Its structure is Tau Ceti's too: the finite-place
conditions cut out an `𝓞 K`-submodule `TauCeti.NumberField.approxModule` of `ι → K`, defined with
`|Q|` so that it is a submodule for every real `Q`, finitely generated and spanning
(`TauCeti.NumberField.fg_approxModule`, `TauCeti.NumberField.span_approxModule_eq_top` for `Q ≠ 0`); the
infinite-place conditions cut out a compact convex symmetric body `TauCeti.NumberField.approxBody` in
`ι → mixedSpace K` (`TauCeti.NumberField.convex_approxBody`, `TauCeti.NumberField.isCompact_approxBody`,
`TauCeti.NumberField.approxBody_mem_nhds_zero` for `0 < Q`); the domain is their intersection for
`0 ≤ Q` (`TauCeti.NumberField.approxDomain_eq`); and the body is balanced over every completion:
multiplying a point by an element of `mixedSpace K` of norm at most `1` at every place keeps it inside
(`TauCeti.NumberField.mul_mem_approxBody`). Every statement below that reads `Q ^ c v i` as a positive
real (the value floors, the covolume, the volume, the comparison with `Q`, and the interior of the
body) assumes `0 < Q`. The statements about domains carry no `DecidableEq ι`: the coefficients of a
form are its values at `Pi.basisFun K ι j`; Tau Ceti's module-covolume results below take
`[DecidableEq ι]` for their determinants.

Define the **weight** `approxWeight S₀ c = ∑ v : InfinitePlace K, v.mult * ∑ i, c v i + ∑ v ∈ S₀, ∑ i, c v i`,
the exponent of `Q` in the product of the local bounds (Bombieri–Gubler's `d ∑ c`, after their `Q`
becomes `Q^d`), a definition of `Suggested.lean`, and the **absolute weight**, the same sum taken over
`|c v i|`. API: the weight is additive in `c` and the absolute weight subadditive; the absolute weight
is at least the absolute value of the weight; and for `γ` depending only on the place, the weight of
`c + γ` is the weight of `c` plus `card ι · (∑ v : InfinitePlace K, v.mult * γ v + ∑ v ∈ S₀, γ v)`.

*The value floor* is Tau Ceti's `NumberField.FinitePlace.floorValue v t`, the largest value of `v` on
`Kˣ` that is at most `t > 0` (the values are the integer powers of the norm of the prime), with
`v x ≤ t ↔ v x ≤ floorValue v t` (`NumberField.FinitePlace.apply_le_iff_le_floorValue`) and
`t < N 𝔭 · floorValue v t` (`NumberField.FinitePlace.lt_absNorm_mul_floorValue`).

Prove:
- *Covolume*: for `0 < Q`, with `a v i = floorValue v (Q ^ c v i)`, the covolume of the image of
  `approxModule` in `ι → mixedSpace K` is `∏ v ∈ S₀, v (det (L v)) * ∏ i, (a v i)⁻¹` times the
  covolume of `(𝓞 K)^ι`. *Route*: Tau Ceti's `Submodule.covolume_mixedImage` reads the covolume of a
  finitely generated spanning `𝓞 K`-module place by place from the largest value `B v` of `v` on the
  determinants of `card ι` of its vectors; for the approximation module `B v` at a place of `S₀` is
  `v (det L v)⁻¹ ∏ i, a v i`, by the ultrametric bound on a determinant, attained by `(L v)⁻¹` of a
  diagonal vector with entries of value `a v i`, moved into the module by an algebraic integer that is
  a unit at `v`; off `S₀` it is `1`. No localization, Smith normal form or quotient index is needed,
  so the class group never enters.
- *Volume*: for `0 < Q`, the volume of `approxBody` is `2^(r₁ · card ι) · π^(r₂ · card ι)` times
  `∏ v : InfinitePlace K, (v (det (L v))⁻¹ * ∏ i, Q ^ c v i) ^ v.mult`. *Route*: the body is the
  preimage of a product of closed balls under one `mixedSpace K`-linear map, whose real determinant is
  the algebra norm of `det L`, `∏ v, v (det L v) ^ v.mult` (Mathlib's `LinearMap.det_restrictScalars`);
  one change of variables, not one per place.
- *Comparison with `Q`*: for `0 < Q`, `vol B / covol Λ` lies between `Q ^ approxWeight` times two
  constants depending only on `K`, `S₀`, `card ι` and the determinants: at most a constant
  `A(S₀, L)` times `Q ^ approxWeight`, and at least `A(S₀, L) / ∏ v ∈ S₀, N 𝔭_v ^ card ι` times it.

*Needs:* Tau Ceti `TauCeti.NumberField.approxDomain`, `TauCeti.NumberField.approxModule`,
`TauCeti.NumberField.approxBody`, `NumberField.FinitePlace.floorValue`, `Submodule.covolume_mixedImage`,
`Submodule.exists_pseudoBasis`, `Submodule.mixedImage`, `Submodule.isZLattice_mixedImage`; Mathlib
`LinearMap.det_restrictScalars`, `ZLattice.covolume`, `NumberField.mixedEmbedding`.

The infrastructure beneath 4.1 is Tau Ceti's: **pseudo-bases** (`Submodule.exists_pseudoBasis`: a
finitely generated `R`-submodule spanning a `K`-vector space, `R` Dedekind with fraction field `K`, is
`⊕ i, J i • y i` for a `K`-basis `y` and nonzero ideals `J i`); **the covolume of an `𝓞 K`-module**
(`Submodule.covolume_mixedImage`, with the pseudo-basis form `Submodule.covolume_mixedImage_of_pseudoBasis`:
`|N (det y)| · ∏ i, N (J i)` times `covol (𝓞 K)^(card ι)`); and **the mixed image**
`Submodule.mixedImage Λ` in `ι → mixedSpace K`, with its `DiscreteTopology` instance for a finitely
generated `Λ` and `IsZLattice ℝ` by `Submodule.isZLattice_mixedImage` when `Λ` spans, the bridge from
`𝓞 K`-modules to the real geometry of numbers. Statements of 4.2 take `Λ` with those two facts as
hypotheses (the second is a theorem with a spanning hypothesis, not an instance).

**Checks.**
- The book states the finite-place factor as an equality in `Q ^ c v i`; it is an equality in the
  floors `a v i` and only an inequality, up to `∏ v ∈ S₀, N 𝔭_v ^ card ι`, in `Q ^ c v i`, which need
  not be a value of `v`. At the `2`-adic place of `ℚ`, one variable, `L = id`, `c = 1`, `Q = 3/2`: the
  module is `{x | |x|_2 ≤ 3/2, |x|_p ≤ 1 otherwise} = ℤ`, of covolume `1`, the floor
  `floorValue (3/2) = 1` gives `1`, and the book's formula gives `2/3`.
- Over `ℚ` with one variable, `L = id` at the real place and exponent `c`, the body is `[−Q^c, Q^c]`
  of volume `2 Q^c = 2^(r₁) · (1 · Q^c)^1`; over an imaginary quadratic field one variable and
  `L = a X` give the disc `|z| ≤ Q^c / |a|` of area `π Q^(2c) / |a|² = π · (|a|⁻¹ Q^c)^2`, the
  multiplicity `2` in the exponent.

### 4.2 Successive minima over `K`

(Bombieri–Gubler, Definition C.2.9; Theorem C.2.11 in shape, with the constants of Tau Ceti's two
halves of Minkowski's second theorem.) For an `𝓞 K`-module `Λ` and a body `B` as in 4.1, define the
`K`-minimum `μ l`, indexed from `0` like Tau Ceti's `ZLattice.successiveMin`, as the infimum of the
`t > 0` for which `Λ ∩ t • B` contains `l + 1` vectors linearly independent over `K`, and `0` for
`l ≥ card ι`. Prove:
- *Attainment by one family*: there are `card ι` vectors of `Λ`, linearly independent over `K`, the
  `l`-th in `μ l • B`. Each minimum is attained because a dilate of a compact body holds finitely many
  lattice points; the single family is then assembled one vector at a time, since `l + 1` independent
  vectors realizing the `l`-th minimum include one outside the span of the `l` already chosen.
  Cassels's greedy construction with its minimality clause is not needed.
- *Comparison with the real minima*: with `λ` Tau Ceti's `ZLattice.successiveMin` of the mixed image
  of `Λ` and `B` (a lattice of rank `d · card ι`), `λ l ≤ μ l` and `μ l ≤ λ (d l)`, the second by Tau
  Ceti's extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul` applied to the
  `d (l + 1)` real witnesses; and `λ (d (l + 1) − 1) ≤ c_K · μ l`, where `c_K ≥ 1` is the largest house
  of a member of a fixed integral basis of `K`: for `l + 1` vectors `x i` independent over `K` in
  `Λ ∩ t • B`, the `d (l + 1)` products `ω j • x i` lie in `Λ` (an `𝓞 K`-module), are independent over
  `ℝ`, and lie in `c_K t • B` because `B` is balanced over every completion. The lower bound is the
  only statement here that uses balancedness; over `ℚ`, `c_ℚ = 1`.
- *Minkowski's second theorem over `K`*, two-sided and multiplicative, for any Haar measure:

  ```text
  c_K ^ (−d·card ι) · 2 ^ (d·card ι) / (d·card ι)! · covol Λ  ≤  (∏ l, μ l) ^ d · vol B  ≤  2 ^
  (d·card ι) · covol Λ
  ```

  from Tau Ceti's `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measure` and
  `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` and the comparison above. This
  is Bombieri–Vaaler and McFeat's adelic theorem in the generality the Subspace Theorem needs.
- *For an approximation domain*, combined with 4.1: `(∏ l, μ l)^d` is `Q ^ (−approxWeight)` up to two
  constants depending on `K`, `S₀`, `card ι` and the determinants. The lower bound, the one 4.3 uses,
  takes the half of 4.1's comparison that is lossless.

*Needs:* 4.1; Tau Ceti `ZLattice.successiveMin`, `ZLattice.exists_linearIndependent_gauge_eq_successiveMin`,
`ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measure`,
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`,
`TauCeti.exists_linearIndependent_comp_finrank_mul`, `TauCeti.house`; Mathlib `NumberField.integralBasis`.

**Checks.**
- Over `ℚ` (`d = 1`, `c_ℚ = 1`) the two-sided bound is Minkowski's second theorem for the lattice `Λ`
  itself: `2^n / n! · covol Λ ≤ (∏ λ_l) vol B ≤ 2^n covol Λ`, and `μ = λ`.
- For `Λ = ℤ` and `B = [−1, 1]` the one minimum is `1`, both sides read `2 ≤ 2 ≤ 2`.

### 4.3 The rank of an approximation domain

(Bombieri–Gubler, Definition 7.5.11, Lemma 7.5.12.) Define `approxSpan S₀ L c Q`, written `V(Q)`, the
`K`-span of the domain, a definition of `Suggested.lean`. Prove:
- `finrank K V(Q)` is the number of `l` with `μ l ≤ 1`, and `V(Q)` is spanned by the first
  `finrank K V(Q)` members of any family realizing the minima. Both are proved first for the points of
  any lattice in any closed bounded convex body balanced over the completions.
- *Eventual properness*: prove `eventually_approxSpan_ne_top`: if `approxWeight S₀ c < 0`, then
  `V(Q) ≠ ⊤` for all large `Q`, the form 6.1 consumes; equivalently `finrank K V(Q) < card ι` for all
  large `Q`. *Route*: 4.2's lower bound with every minimum replaced by the last gives
  `μ (card ι − 1)^(d · card ι) ≥ C · Q^(−weight)`, which exceeds `1` eventually.
- *Bounded levels*: for `0 < Q₁ ≤ Q ≤ Q₂` every domain lies in the domain of the exponents `|c|` at
  level `max Q₂ Q₁⁻¹`, which holds finitely many points, so a bounded range of levels produces
  finitely many points and finitely many subspaces `V(Q)`.

Bombieri–Gubler's Lemma 7.5.12 states `1 ≤ rank ≤ n` along the heights of a hypothetical infinite
set of solutions; that is a statement about solutions, and its content about domains is the eventual
statement above. *Needs:* 4.1, 4.2.

**Checks.**
- The count is of minima `≤ 1`, not `< 1`: over `ℚ` with `S₀ = ∅`, `L = id` and `c = 0`, the domain
  is `ℤ ∩ [−1, 1] = {−1, 0, 1}`, its span is `ℚ` and its one minimum is exactly `1`.
- The statement is eventual and not uniform: over `ℚ` with `S₀ = ∅` and the coordinate forms, the
  domain at `Q = 1` contains the standard basis (every `Q^(c v i) = 1`), so it has full rank whatever
  the exponents.
- A domain can have rank `0`: over `ℚ` with one variable and `c = −1`, at every level `Q > 1` the
  domain is `{x ∈ ℤ | |x| ≤ Q⁻¹} = {0}`.
- `0 < Q₁` is needed for bounded levels: as `Q → 0` the bounds `Q^(c v i)` with negative exponent
  blow up.

### 4.4 Evertse's lemma

(Evertse 1996; Bombieri–Gubler, Lemma 7.5.29.) It replaces Mahler's theorem on compound bodies and
Davenport's lemma in Schmidt's original argument (7.5.27–7.5.28), neither of which is built. Both
halves are Tau Ceti's:
- *Simultaneous approximation by `S₀`-integers*: there is `A`, depending only on `K`, such that for
  every `S₀` and every family `γ v ∈ K` some `ξ ∈ K`, integral at every finite place outside `S₀`, has
  `v (ξ + γ v) ≤ 1` at each `v ∈ S₀` and `v (ξ + γ v) ≤ A` at each infinite place
  (`NumberField.exists_forall_apply_add_le`, from `NumberField.exists_forall_finitePlace_apply_add_le_one`
  at all the places of `S₀` at once and `NumberField.exists_integer_forall_infinitePlace_add_le`, with
  `A` the sum of the norms of the embedded integral basis; no Chinese remainder theorem is used).
- *The lemma* (`NumberField.exists_evertse`): let `x` be a basis indexed by `Fin m`, and at each
  infinite place and each `v ∈ S₀` let forms `L v k` be linearly independent, weights `ν v k > 0` and
  `μ v` nondecreasing satisfy `v (L v k (x j)) ≤ ν v k · μ v j`. Then there are
  `y j = x j + ∑ i < j, ξ j i • x i` with each `ξ j i` integral outside `S₀`, and bijections `π v` of
  the index set, such that `v (L v (π v i) (y j)) ≤ C · ν v (π v i) · min (μ v i) (μ v j)` at the
  infinite places and the same without `C` at the places of `S₀`, with `C` depending only on `K` and
  `m`. The unweighted statement is `NumberField.exists_evertse_unweighted` (`ν = 1`), and the
  induction, run once for any field with a set of absolute values admitting simultaneous
  approximation by a subring, is `AbsoluteValue.exists_evertse_of_approx` (a sum of `m` terms costing
  `m` at an archimedean place and `1` at a nonarchimedean one).

Three features are load-bearing, and the consumers 4.5 and 6.1 rely on them. The constant is chosen
before `S₀`, the forms and the vectors: 6.1 applies the lemma to forms rescaled by `Q`, which change
with `Q`. The forms carry weights because over `K` they cannot be rescaled: at a finite place
`Q^(−c v i)` is in general not a value of `v`, and rescaling would lose the factor `N 𝔭` that 4.1
found; 4.5 takes `ν v i = Q ^ c v i`. And `μ v` must be nondecreasing, since the first vector is never
corrected; with that, no positivity of `μ v` is needed. The constant at the infinite places is not `1`
even over `ℚ`.

**Checks.**
- `μ v` nondecreasing is needed, since the first vector is never corrected (`y 0 = x 0`): over `ℚ`
  at the real place with `S₀ = ∅`, `m = 2`, the coordinate forms, `ν = 1`, `x 0 = (N, N)`,
  `x 1 = (0, 1)` and the decreasing `μ = (N, 1)`, the hypothesis holds, while the conclusion at
  `j = 0`, `i = 1` asks `|L (π 1) (x 0)| = N ≤ C · min(μ 1, μ 0) = C`, false for `N > C` whatever `π`
  is, `C` having been chosen before the vectors.

### 4.5 Exterior powers of a system of forms

(Bombieri–Gubler 7.5.2, (7.16)–(7.17), Lemma 7.5.33, 7.5.30–7.5.31.) Exterior powers are read in
Plücker coordinates `Set.powersetCard ι p → K`, Tau Ceti's `TauCeti.plucker`, so that 4.2, 4.3 and 5.5
apply to domains in `⋀^p` verbatim. The linear algebra is Tau Ceti's:
- *wedge forms* `TauCeti.wedgeForms L p`, indexed by the `p`-subsets of the index set of the forms,
  with **Laplace's identity** `wedgeForms L p I (plucker y) = det (L (I a) (y b))`
  (`TauCeti.wedgeForm_plucker`, `TauCeti.wedgeForms_plucker`, from Cauchy–Binet,
  `TauCeti.det_mul_transpose_eq_sum_plucker_mul`), linearly independent when the `L i` are
  (`TauCeti.linearIndependent_wedgeForms`), as are the Plücker vectors of the `p`-subsets of a basis
  (`TauCeti.linearIndependent_plucker_comp`); the determinant of the wedge system (Sylvester–Franke)
  is not needed, since the constants of 4.1–4.3 see the forms only through their determinants and
  independence comes from a biorthogonal family;
- **Lemma 7.5.33**: for a basis `x` and `k + p = card ι`, the span `TauCeti.wedgeSpan k p x` of the
  Plücker vectors of the `p`-subsets meeting `{0, …, k − 1}` depends only on the span of
  `x 0, …, x (k − 1)` and determines it (`TauCeti.wedgeSpan_eq_wedgeSpan_iff`,
  `TauCeti.mem_span_iff_forall_plucker_mem_wedgeSpan`); it is the kernel of the wedge of the last `p`
  coordinate forms of `x`, a hyperplane missing the top block (`TauCeti.wedgeSpan_eq_ker`,
  `TauCeti.plucker_topBlock_notMem_wedgeSpan`, `TauCeti.finrank_wedgeSpan_add_one`).

For `1 ≤ p < card ι`, prove the number-field half:
- **(7.44)–(7.45) in 7.5.30**: for vectors `x` realizing the `K`-minima `μ` of the domain of `L`, `c` at
  a level `Q > 1`, Evertse's lemma with `ν v i = Q ^ c v i` gives `y` and `π v` whose Plücker vectors
  `y J`, `J` meeting the first `k` indices, lie in the approximation domain of the wedge forms with the
  book's exponents `S(Q)`, with a constant depending only on `K` and `card ι`. The constant is absorbed
  into the exponent, `c + log_Q (C · μ)`, so `S(Q)` is an approximation domain whose exponents move with
  `Q` and 4.2–4.3 apply with constants uniform in `Q`; the book's normalization (7.42) disappears.
- *The weight of `S(Q)`*, exact: `Q ^ (weight of S(Q))` equals `Q ^ (e · approxWeight)` times
  `(C^M · (∏ l, μ l)^e · μ (k − 1) / μ k)^d`, with `e = (card ι − 1).choose (p − 1)` and `M` the number
  of `p`-subsets, since each index lies in `e` subsets and exactly one subset is the top block; hence
  it is at most a constant times `(μ (k − 1) / μ k)^d`. This is what 6.1 consumes.
- *The book's packaged form*, Lemma 7.5.31: all minima of `S(Q)` but the last are at most `1` and the
  last is at least a constant times `μ k / μ (k − 1)`; with its consequence (7.41): for rank `R` with
  `1 ≤ R < card ι` some `k ∈ [R, card ι)` has `(μ (k − 1) / μ k)^(card ι − R) ≤ (μ (card ι − 1))⁻¹`,
  and the resulting lower bound on the last minimum of `S(Q)`. Any large jump serves; `R ≥ 1` is
  needed.

*Needs:* 4.1–4.4; Tau Ceti `TauCeti.plucker`, `TauCeti.wedgeForms`, `TauCeti.wedgeSpan`,
`NumberField.exists_evertse`.

**Checks.**
- (7.41) is a telescoping: `∏_{k=R}^{card ι − 1} μ (k − 1) / μ k = μ (R − 1) / μ (card ι − 1)`, and
  `μ (R − 1) ≤ 1` because `R` minima are at most `1` (4.3); one of the `card ι − R` factors is therefore
  at most `(μ (card ι − 1))^(−1/(card ι − R))`. At `R = 0` there is no `μ (R − 1)`.
- For `card ι = 3`, `p = 2`, `k = 1`: the `2`-subsets of `{0, 1, 2}` meeting `{0}` are `{0, 1}` and
  `{0, 2}`, two of the three, so the wedge span is a hyperplane of the `3`-dimensional `⋀²`, missing
  the top block `{1, 2}`.

### Examples

- Over `ℚ` with `S₀ = ∅`, the coordinate forms and exponents `(1, −2)`: the domain at level `Q` is
  `{(x, y) ∈ ℤ² | |x| ≤ Q, |y| ≤ Q^(−2)}`, which for `Q > 1` is the segment `{(x, 0) | |x| ≤ Q}`,
  of rank `1`; the weight is `−1 < 0` and `V(Q)` is the line `y = 0` for every `Q > 1`, while at
  `Q = 1` the domain contains `(0, 1)` and spans `ℚ²`.

### Dependencies

Layer 0 (the places and their values). Tau Ceti: approximation domains, modules and bodies, value
floors, pseudo-bases, the module covolume and the mixed image, the real successive minima with both
halves of Minkowski's second theorem, the extraction lemma, Evertse's lemma with simultaneous
approximation by `S₀`-integers, Plücker coordinates, wedge forms and Lemma 7.5.33. Mathlib: `ZLattice`,
`ZLattice.covolume`, `NumberField.mixedEmbedding`, `LinearMap.det_restrictScalars`.

## Layer 5: the Subspace machinery

Bombieri–Gubler's Theorem 7.5.13, the Subspace Theorem under the extra hypothesis that the
penultimate minimum is small, proved by the Roth machinery in multihomogeneous form. Coefficients in
`K` throughout, as in Layer 4. Statements that read a subspace through its Plücker coordinates carry
`[LinearOrder ι]`, as Tau Ceti's `TauCeti.plucker` does, and the height of a subspace is Tau Ceti's
`Submodule.relativeSubspaceHeight`, in its logarithmic form.

### 5.1 Reductions

(Bombieri–Gubler, Theorem 7.2.6, Lemma 7.5.4, Corollary 7.5.5, 7.5.6.)
- *Projective to affine* is 0.3's, in Tau Ceti: after enlarging `S₀` every nonzero point has a
  primitive multiple, and the height of a primitive point is the product of its local sup norms over
  the infinite places and `S₀` (`NumberField.exists_finset_superset_forall_exists_mulHeight_eq`,
  `NumberField.mulHeight_eq_prod_of_forall_iSup_eq_one`).
- *Unit normalization*: prove `exists_forall_logHeightAff_smul_le` (Lemma 7.5.4): there is `C`,
  depending only on `K` and `S`, quantified before the index type, such that every nonzero `x` whose
  local sup norms outside `S` are `1` has an `S`-unit multiple `u • x` with
  `log (Height.mulHeightAff (u • x)) ≤ logHeight x + C`. *Route*: Tau Ceti's `S`-logarithmic lattice
  (`TauCeti.NumberField.SUnit.unitLattice`, HeightsAndUnits Layer 4) is a full lattice in the
  logarithmic space with one infinite coordinate dropped, equivalently in the sum-zero hyperplane, so
  the sum-zero vector with entries
  `(mult v / D) · logHeight x − mult v · log ⨆ j, v (x j)` (with `D` the total multiplicity of the
  places) is within a bounded distance of a lattice point, and summing positive parts gives the bound
  with every place handled at once and no coordinate singled out.
- *Size of the forms at a normalized point* (Corollary 7.5.5): every nonzero value `L v i (u • x)` has
  `logHeight₁ ≤ logHeight x + C'` (from Tau Ceti's `Height.mulHeight₁_sum_mul_le` against the affine
  height; no independence of the forms is used), hence by 0.4 at one place
  `mult v · |log (v (L v i (u • x)))| ≤ logHeight x + C'` (Tau Ceti's one-place bound
  `TauCeti.GlobalNumberFields.abs_log_normalizedAbsValue_le_logHeight₁` in the normalized absolute
  value, and its finite-place companion), and the book's (7.19), `≤ C'' · logHeight x`, for
  `logHeight x` at least a positive threshold.
- *Classes* (7.5.6): above a level `Q₀`, every solution of 6.2's inequality at which no `L v i`
  vanishes has a normalized multiple in `approxDomain S₀ L c (mulHeight x)` for one of finitely many
  exponent systems `c`, each of weight at most `−ε/2`. The exponents
  `log v (L v i (u • x)) / log H(x)` have both signs, so the classes are the cells of side `1 / N` of
  the cube `[−2, 2]`, not 3.1's simplex cells, and their number is finite because they are functions
  on finitely many places with values in a finite grid. Solutions on a kernel of some `L v i` are left
  to 6.2, which puts them in that kernel.
- *The package*, which 6.2 consumes: the three steps together with the enlargement of `S₀` and the
  addition of the missing infinite places, both carrying the coordinate forms, whose local factor is
  at most `1` and which are independent (Tau Ceti's `NumberField.approxProd_le_approxProd_of_subset`).

*Needs:* 0.3, 0.4, 4.1; Tau Ceti `TauCeti.NumberField.SUnit.unitLattice`, `Height.mulHeightAff`,
`Height.mulHeight₁_sum_mul_le`, `NumberField.approxProd_le_approxProd_of_subset`,
`TauCeti.NumberField.approxDomain`.

**Checks.**
- The unit is load-bearing: over `ℚ` with `S` the `2`-adic place, the one-point tuples `(2^k)` have
  local sup norm `1` outside `S`, projective height `1` and affine height `H(1, 2^k) = 2^k`.
- The threshold in (7.19) is needed: over `ℚ` with no finite places, `x = (1)` and `L = 2X` have
  `logHeight x = 0` and `|log |L (u • x)|| = log 2` for both units `u = ±1`. The one-place bound is
  sharp: `|log |2|_2| = log 2 = log H(2)`.

### 5.2 The multihomogeneous auxiliary polynomial

(Bombieri–Gubler 7.5.14, Lemma 7.5.15.) For `m` blocks of variables indexed by `κ × ι` and a
multidegree `d : κ → ℕ`, the vocabulary is Tau Ceti's: `MvPolynomial.IsMultiHomogeneous d P`, its
monomials `MvPolynomial.multiMons d` (the products over the blocks of the monomials of one degree),
numbering `∏ h, (card ι + d h − 1).choose (d h)` (`MvPolynomial.card_multiMons`); a Hasse derivative of
order `I` is multihomogeneous of multidegree `d h − ∑ i, I (h, i)`
(`MvPolynomial.IsMultiHomogeneous.hasseDeriv`); the substitution `MvPolynomial.blockSubst A`,
`X (h, j) ↦ ∑ i, A j i • X (h, i)` in every block; and the transport of vanishing:
`MvPolynomial.coeff_blockSubst_hasseDeriv_eq_zero`, over any commutative ring with `A.det` a unit: if
the coefficients of `blockSubst A⁻¹ P` vanish at every monomial `N` with `∑ h, N (h, i) / d h` below a
threshold, then the coefficients of `blockSubst A⁻¹ (hasseDeriv I P)` vanish at every `J` with
`∑ h, J (h, i) / d h` below the threshold minus the weighted order of `I`.

Prove:
- the vanishing along one row depends on that row alone, so the conditions are imposed once per
  distinct form (Evertse–Schlickewei), at most `card ι · |S|` of them;
- *the lemma* (Lemma 7.5.15): for `0 < η` and `4 log (2 · #F) < card ι · (card ι + 1) · η² · m`, with
  `F` the set of distinct forms, there are `C₂`, `C₃` and `D₀` such that for every `d` with
  `D₀ ≤ d h` for all `h` there is a nonzero multihomogeneous `P` of multidegree `d` with
  `logHeight P ≤ C₂ ∑ h, d h` and with the coefficients of `blockSubst (L v)⁻¹ (hasseDeriv I P)` at
  `J` zero, for every `v`, whenever the weighted order of `I` is at most `m η` and some `i` has
  `∑ h, J (h, i) / d h` outside `(m / card ι − 2 m η, m / card ι + 2 (card ι − 1) m η)`; their heights
  are at most `C₃ ∑ h, d h`. *Route*: DiophantineApproximationAndTranscendence §2.8's Siegel lemma over
  `K`, with the conditions imposed at order `0` only and the omitted monomials counted by an exact
  exponential moment;
- *the count*: under the uniform distribution on the monomials of degree `N` in `card ι` variables
  the mean of one exponent is `N / card ι` and the mean of its binomial square is
  `N (N − 1) / (card ι (card ι + 1))` (Tau Ceti's `Finset.card_mul_sum_finsuppAntidiag_apply` and
  `Finset.card_mul_card_add_one_mul_sum_finsuppAntidiag_choose_two`, from an upper-index Vandermonde
  convolution), and `exp (−t) ≤ 1 − t + t² / 2` turns these into a Chernoff bound with one explicit
  error `λ² / (2 N card ι)`. This replaces the book's volume computation and its restriction
  `λ ≤ n + 4`; `d` must be large only to make the error small.

Four points of the statement are load-bearing. The upper half of the interval follows from the lower
half by multihomogeneity: the exponent sums total `m` minus the weighted order, so one large exponent
forces a small one among the other `card ι − 1`, which needs `Nontrivial ι`. The hypothesis on `m` is
strict, since the Chernoff error is positive for every `d`. The book's `η ≤ 2 / (n + 1)` is not
needed. `C₂` and `C₃` may depend on `m`, `S` and `η`, because 5.5 fixes `m` first. *Needs:* 2.1;
DiophantineApproximationAndTranscendence §2.8; Tau Ceti `MvPolynomial.IsMultiHomogeneous`,
`MvPolynomial.blockSubst`, `MvPolynomial.coeff_blockSubst_hasseDeriv_eq_zero`, `MvPolynomial.logHeight`.

**Checks.**
- `card_multiMons` for one block of `card ι = 2` variables and degree `d`: `d + 1` monomials, and
  `(2 + d − 1).choose d = d + 1`. With no variables and `d > 0` there is no monomial, and Tau Ceti's
  `(0 + d − 1).choose d = 0`, while the form `(d + card ι − 1).choose (card ι − 1)` in natural
  subtraction would give `(d − 1).choose 0 = 1`.
- The two moments for `card ι = 2`, `N = 2`: the monomials `(2,0), (1,1), (0,2)` have mean first
  exponent `1 = N / card ι` and mean `(e.choose 2)` equal to `(1 + 0 + 0) / 3 = 1/3 = 2 · 1 / (2 · 3)`.

### 5.3 The index along linear forms and the generalized Roth lemma

(Bombieri–Gubler, Definition 7.5.17, 7.5.18, Lemma 7.5.19.) For nonzero forms `M h` on the `h`-th
block, the ideal generated by the products `∏ h, (M h (X h))^(j h)` with `∑ h, j h / d h ≥ t` and the
index `sup {t | P ∈ ideal}` in `ℝ≥0∞` are Tau Ceti's `MvPolynomial.formIdeal t d M` and
`MvPolynomial.formIndex d M P`, with the mutually inverse substitutions `MvPolynomial.substForm`,
`MvPolynomial.substFormInv` solving `M h = X (h, i₀ h)` for a coordinate where `M h` is nonzero, and
the valuation properties `MvPolynomial.formIndex_eq_top_iff`, `MvPolynomial.min_formIndex_le_add`,
`MvPolynomial.formIndex_mul`, `MvPolynomial.formIndex_smul`; the index is computed in the new
coordinates by `MvPolynomial.formIndex_eq_iInf`.

Prove:
- *Reduction to a weighted index*: `formIndex d M P` is Tau Ceti's `MvPolynomial.weightedIndex` of
  `substFormInv M i₀ P` at `0`, with weight on the coordinates `i₀ h` only; and for two coordinates
  per block and `M h = X (h, 1) − α h • X (h, 0)` it is the weighted index of the dehomogenization at
  `α`, through Tau Ceti's `TauCeti.dehomogenize` applied block by block. Multihomogeneity is what makes
  the dehomogenization injective on monomials.
- *Specialization*: setting all but two coordinates of each block to `0`, one variable at a time, by
  Mathlib's `MvPolynomial.divMonomial` and `MvPolynomial.modMonomial`, keeps `P` nonzero, does not
  raise its height (the result has a subfamily of its coefficients) and does not lower the index. Each
  step truncates the forms with the variables. The heights of the truncated forms lose at most a
  factor `card ι − 1`: `logHeight (M h) ≤ (card ι − 1) · logHeight₁` of some ratio of two
  coefficients, by Mathlib's `Height.mulHeight_fun_prod_eq` applied to the table of products and
  `Height.mulHeight_comp_le`.
- *The generalized Roth lemma*: if `P` is nonzero and multihomogeneous of multidegree at most `d`,
  `0 < σ ≤ 1/2`, `d (h + 1) ≤ σ · d h`, and
  `(card ι − 1) σ⁻¹ (logHeight P + 4 m d 0 [K : ℚ]) ≤ d h · logHeight (M h)` for all `h`, then
  `formIndex d M P ≤ 2 m σ^((1/2)^(m − 1))`: specialize, dehomogenize, and apply Roth's lemma, Tau
  Ceti's `TauCeti.weightedIndex_le_of_logHeight_le`.
- *From a small index to a nonvanishing derivative on a product of hyperplanes*: if
  `formIndex d M P ≤ t` then some Hasse derivative of `P` of weighted order at most `t`, in the original
  coordinates, does not vanish identically on `∏ h, ker (M h)`. The change of coordinates is a
  block-wise linear substitution (through Tau Ceti's `MvPolynomial.linearSubst`), and a surviving
  coefficient moves between the two systems with the same degree in every block; the derivative order
  is the transverse part of the surviving monomial, whose binomial factor is `1`. Only `K` infinite is
  used.

*Needs:* 5.2; Tau Ceti `MvPolynomial.formIndex`,
`MvPolynomial.weightedIndex`, `TauCeti.weightedIndex_le_of_logHeight_le`, `TauCeti.dehomogenize`,
`MvPolynomial.linearSubst`; Mathlib `MvPolynomial.divMonomial`, `MvPolynomial.modMonomial`,
`Height.mulHeight_fun_prod_eq`, `Height.mulHeight_comp_le`.

**Checks.**
- Multihomogeneity is needed for the dehomogenization: in one block with `M = x₁`, the polynomial
  `x₁ + x₀² − x₀` (not homogeneous) has index `0` along `M`, as it is not in the ideal `(x₁)`, while its
  dehomogenization at `x₀ = 1` is `x₁`, of index `1` at `0` (with `d = 1`).
- A single slice at the componentwise minimum fails: `X 1 + X 2` has no monomial where both
  exponents are minimal (the componentwise minimum of `(1, 0)` and `(0, 1)` is `(0, 0)`).

### 5.4 The height of `V(Q)` and the exceptional subspace

(Bombieri–Gubler, Lemma 7.5.21; Evertse–Schlickewei 2002, Lemmas 12.3–12.4.) For the domains of 4.1
with `c` of weight at most `−ε/2`, prove: there are a subspace `W₀` (or none), depending only on the
forms, `S₀` and `c`, and constants `C₄`, `C₅`, `C₆` independent of `Q`, such that at every level with
`log Q ≥ C₄ / ε` at which `V(Q)` has dimension `card ι − 1`, either `V(Q) = W₀` or

```text
ε log Q / (4 t) − C₅  ≤  log (relativeSubspaceHeight V(Q))  ≤  (card ι − 1) · (∑ v, mult v · cMax v)
· log Q + C₆ ,
```

with `t = card (InfinitePlace K) + #S₀` the number of places, counted without multiplicity, and
`cMax v` the largest exponent at `v`. Beneath it:
- *Liouville for the value of a linear form*: for tuples `a`, `z : σ → K` with `∑ s, a s * z s ≠ 0`, at
  an infinite place
  `((⨆ s, v (a s)) (⨆ s, v (z s)))^(mult v) ≤ (card σ)^[K : ℚ] · H(a) H(z) · v (∑ s, a s * z s)^(mult v)`,
  and at a finite place the same without the exponent `mult v`, **with the same factor
  `(card σ)^[K : ℚ]`**, by dividing by the value, which leaves the height unchanged by the product
  formula. The factor is the triangle inequality at the infinite places, which enters the height even
  when the place singled out is finite. With it, the comparisons between a `finprod` over the finite
  places and a subproduct, Tau Ceti's `Finset.prod_le_finprod_of_one_le₀` and
  `Finset.finprod_le_prod_of_le_one₀` specialized to finite places. The book bounds the height of a
  single wedge value `L̂_{vi}(w)` by `h(V(Q)) + C₇`; that is false, since the left side changes when `w`
  is rescaled; what the proof needs is the inequality above between a local factor of the Plücker point
  and its projective height.
- *The normal vector*: a hyperplane is the kernel of one vector, and the Plücker coordinate of a basis
  at the subset omitting `i` vanishes exactly when the `i`-th coordinate of that vector does (Tau
  Ceti's `TauCeti.exists_plucker_eq_mul_plucker_compl_or_eq_neg` with `q = 1`); the Plücker coordinates
  of the transformed family are the wedge forms at the Plücker point (`TauCeti.wedgeForms_plucker`), with
  the local bounds of Tau Ceti's `AbsoluteValue.plucker_le_prod_iSup` at a nonarchimedean place and
  `TauCeti.sum_norm_plucker_sq_le` at an archimedean one. Two normal vectors of one hyperplane are
  proportional.
- *The two bounds*: the upper bound through the inverse of the system of forms at one place (Tau
  Ceti's `LinearIndependent.exists_sum_smul_eq_proj`) and Tau Ceti's `NumberField.mulHeight_le_prod`,
  the height of an `S`-integral tuple at most the product of its local factors over `S`; the lower
  bound over all places of `S`, against the upper bound on the same product from the domain. Constants
  are made uniform over a finite family, hence independent of `Q`.
- *The exceptional subspace*: the **pattern** of `V(Q)` at a place is the set of `i` whose wedge
  omitting `i` does not vanish at the Plücker point; with `k v` its index of largest exponent, the
  dichotomy is whether the weight along `k` is below `−ε/4`. In original coordinates the vanishing says
  the normal vector lies in the span of the coefficient vectors of the forms in the pattern, a
  condition independent of `Q`, so no Hodge star or cofactor appears. The threshold set
  `{i | c v i ≤ c v (k v)}` contains the pattern and depends on `k` alone (Evertse 1996, Lemma 27), so
  whether some `k` of weight below `−ε/4` admits a nonzero vector in its threshold span is independent
  of `Q`, and if so one such vector, scaled to be integral at every finite place, vanishes on every
  exceptional `V(Q)` by the product formula. Hence at most one exceptional subspace, which removes a
  factor `2^(card ι · t)` from 5.5's count. Without the exceptional alternative the lower bound is
  false.

*Needs:* 0.3, 0.4, 4.1–4.3, 4.5; Tau Ceti `Submodule.relativeSubspaceHeight`, `TauCeti.plucker`,
`TauCeti.wedgeForms_plucker`, `AbsoluteValue.plucker_le_prod_iSup`, `TauCeti.sum_norm_plucker_sq_le`,
`NumberField.mulHeight_le_prod`, `LinearIndependent.exists_sum_smul_eq_proj`,
`Finset.prod_le_finprod_of_one_le₀`, `Finset.finprod_le_prod_of_le_one₀`.

**Checks.**
- The factor `(card σ)^[K : ℚ]` cannot be `1` at a finite place: over `ℚ` at the `2`-adic place,
  `a = z = (1, 1)` gives `(1 · 1) ≤ 1 · 1 · 1 · |2|_2 = 1/2` with factor `1`, false; with the factor
  `2^1` it reads `1 ≤ 1`, equality.
- The book's bound on a single wedge value is false: over `ℚ`, `w = (N, 0)` spans a line of height `1`
  (the line `y = 0`), while its first coordinate `N` has height `|N|`.

### 5.5 The penultimate-minimum theorem

(Bombieri–Gubler, Theorem 7.5.13, Steps IV–VI.) Prove `finite_setOf_approxSpan`: for forms with
coefficients in `K`, linearly independent at every infinite place and every place of `S₀`, and
exponents `c` of negative weight, the set `{V(Q) | 1 ≤ Q, finrank K V(Q) = card ι − 1}` is finite.
*Route*: above a level every such `V(Q)` is 5.4's `W₀`; below, 5.4's upper bound, which holds at every
level, and Tau Ceti's Northcott property for subspaces
(`Submodule.instNorthcottRelativeSubspaceHeight`, HeightsAndUnits Layer 1) leave finitely many.
Alongside:
- *The interval form*: above a level, the levels at which `V(Q)` is a hyperplane other than `W₀` have
  `log Q` in at most `m` intervals `[q, 4 σ⁻¹ q)`, with explicit `m` and `σ` depending on `card ι`, `s`,
  `ε` and `A`, where `A` bounds the absolute weight and `s` is any natural number with
  `#F ≤ card ι · s`, `#F` being the number of distinct forms `L v i` over the infinite places and `S₀`
  (the **form count**, at most `card ι · t`). The covering is the greedy one of 3.6. 6.1 needs one `A`
  for all its grid systems, so `m` and `σ` depend on `c` only through `A`; and **`m` and `σ` do not
  depend on the number of places `t`**, which enters only the threshold and the denominator of 5.4's
  lower bound. This is what makes 6.1's and 9.5's counts independent of the places: the same
  coordinate forms can be repeated at arbitrarily many finite places, so no bound on `t` in terms of
  the forms exists. The forms enter the chain length through 5.2, whose conditions are imposed once
  per distinct form.
- *The contradiction* (under `#F ≤ card ι · s`): no `m + 1` levels above a threshold, growing at rate
  `2 σ⁻¹`, all carry hyperplanes of height at least `ε log Q / (4 t) − C₅`. Given such a chain take
  `d h ≈ D / log Q h`, `P` from 5.2, `M h` the normal form of `V(Q h)`, whose height 5.4 bounds below.
  5.3 bounds `formIndex d M P` by `(m + 1) η / 2` and produces a derivative of that weighted order not
  vanishing on `∏ h, V(Q h)`; DiophantineApproximationAndTranscendence §2.6's block grid lemma, on a
  basis of each `V(Q h)` drawn from the domain, produces a derivative of weighted order at most
  `(m + 1) η` nonzero at a point `∑ l, z h l • y h l` with integers `|z h l| ≤ ⌈2 (card ι − 1) / η⌉ + 1`.
  The key inequality bounds that value above at every place (the inverse matrices of the forms and the
  grid integers charged to one reference family, with exponent `2 ∑ h, d h`) and below by the product
  formula over all places, with every infinite place present, and letting `D → ∞` against fixed `m`
  closes it.
- *Two invariants*: besides the weight, the estimate needs the absolute weight, because the local
  bound is `Q^(mean · ∑ i, c v i)` only up to `Q^(Δ · ∑ i, |c v i|)`, with `mean = (m + 1) / card ι` and
  `Δ = 2 (card ι − 1)(m + 1) η`; `η` is chosen against it, `η ≤ ε / (8 card ι² (absolute weight + 1))`.
  5.2's asymmetric interval enters only through the symmetric bound `|ρ j − mean| ≤ Δ`, which needs
  `Nontrivial ι`.

*Needs:* 4.3, 5.2, 5.3, 5.4; DiophantineApproximationAndTranscendence §2.6 (block grid lemma); Tau
Ceti `Submodule.instNorthcottRelativeSubspaceHeight`,
`MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm`.

**Checks.**
- The form count does not see the places: over `ℚ` with the coordinate forms at the real place and at
  every prime of a finite set `S₀`, `#F = card ι` whatever `#S₀` is, while `t = 1 + #S₀`.

### Examples

- Over `ℚ` with `S₀ = ∅`, the coordinate forms and exponents `(1, −2)` (4.3's example), every `V(Q)`
  with `Q > 1` is the line `y = 0`, a hyperplane of `ℚ²`; 5.5's finite set is `{y = 0}`.

### Dependencies

Layer 0 (0.3, 0.4), Layer 2 (2.1), Layer 4 (4.1–4.5). DiophantineApproximationAndTranscendence §2.6
(block grid lemma) and §2.8 (Siegel's lemma over `K`). Tau Ceti: the `S`-unit lattice, the affine height
and the height of a linear form, multihomogeneous polynomials and block substitution, the index along
linear forms, Roth's lemma, the subspace height with its Northcott instance, Plücker coordinates and
their local bounds. Mathlib: `MvPolynomial.divMonomial`, `MvPolynomial.modMonomial`, heights.

## Layer 6: the Subspace Theorem

The parametric theorem 6.1 is assembled from Layers 4 and 5; 6.2–6.7 derive from it the forms in
which the theorem is applied. Coefficients are in `K` in 6.1 and 6.2 and in a finite extension `F`
from 6.3 on.

### 6.1 The parametric Subspace Theorem

Prove `exists_finset_submodule_forall_approxDomain_subset` (Bombieri–Gubler 7.5.30–7.5.32, Steps
VIII and IX; Evertse–Schlickewei 2002 for the formulation): let `S₀` be a finite set of finite
places, `L v i : Module.Dual K (ι → K)` forms linearly independent at every infinite place and at
every place of `S₀`, and `c` exponents with `approxWeight S₀ c < 0`. Then there are a finite set `T`
of proper subspaces of `ι → K` and a level `Q₀` such that for every `Q ≥ Q₀` the approximation
domain `TauCeti.NumberField.approxDomain S₀ L c Q` lies in a member of `T`. This is the primary form,
because it is the one the quantitative theory counts: Layer 9 and every quantitative Subspace
Theorem in print bound the size of `T`. Bombieri–Gubler state it only along the heights of a
hypothetical sequence of solutions; their argument proves it for every level. No nontriviality of
`ι` is assumed: for a one-element `ι` the product formula gives `1 ≤ C Q^(approxWeight)` at every
nonzero point of the domain, false for large `Q`, so the domain is `0`.

*The interval form* (Bombieri–Gubler 7.5.30–7.5.32 with the counts made explicit): for
`approxWeight ≤ −ε`, absolute weight at most `A` and form count at most `s` (5.5), there are at most
an explicit number of proper subspaces, and a level `Q₀ > 0`, such that for every `Q₀' ≥ Q₀` a level
`Q` with `log Q ≥ Q₀'` either has its domain in one of those subspaces or has `log Q` in one of at
most an explicit number of intervals `[t, ρ t)` with `t ≥ Q₀'`. The two counts and the ratio `ρ` are
closed forms in `card ι`, `[K : ℚ]`, `s`, `ε` and `A`; they do not depend on the number of places,
and the number of subspaces does not depend on `s` either. The parametric theorem is read off the
interval form.

*Route*, at a level where the domain has rank `R < card ι` (4.3):
- `R = 0`: the domain spans `⊥`.
- *Confining the minima*: every `K`-minimum lies between `Q^(−B)` and `Q^B` with
  `B = card ι · (A + 1) / [K : ℚ]`. Minkowski's theorem bounds only the product; the lower bound on
  each minimum is the product formula (a nonzero point of `Λ ∩ t • B` has height at least `1` and
  at most a constant times `t^d` times a power of `Q`), and the upper bound is Minkowski's with the
  others replaced by the lower bound.
- *Minima at one infinite place* (after Evertse–Schlickewei 2002, §9): each minimal vector is
  scaled by a nonzero integer, from Minkowski's first theorem for one scalar, so that its minimum
  moves to one infinite place `w₀` with `mult w₀ ∣ [K : ℚ]`. Evertse's lemma then has minima at
  `w₀` alone, and only one bijection matters. The cost is a constant `(2^[K : ℚ] · √|D_K|)^(card ι)`,
  seen only by the thresholds.
- *The wedge domain*: (7.41) of 4.5 chooses `k ∈ [R, card ι)` with a large jump of the minima; with
  `k + p = card ι`, 4.4 and 4.5 move the Plücker vectors of the `p`-subsets meeting the first `k`
  minimal vectors into a domain of the wedge forms whose exponents move with `Q`. The case
  `R = card ι − 1` is `k = card ι − 1`, `p = 1`, the original domain re-indexed by one-element
  subsets, so 5.5 is used only through this construction and one mechanism covers every rank. A
  wedge form is the wedge of a `p`-tuple of forms, so the form count of the wedge system is at most
  the `p`-th power of that of the original system, and 5.5 runs in `⋀^p` with form parameter `s^p`.
- *The grid* (Evertse 1996, Lemma 18): round the `card ι` minima, not the wedge exponents, to a grid
  of mesh `γ`. The constant rounds to `1` above a threshold, and the top block's jump is absorbed by
  rounding `μ(k − 1)` in place of `μ(k)`. This gives at most `(card ι)! · (2m + 1)^(card ι)` grid
  systems, `m = ⌈B / γ⌉`, independent of the number of infinite places, all with one bound on the
  absolute weight; rounding each wedge entry separately would be doubly exponential in `card ι`. A
  system of exponents is a function on `AbsoluteValue K ℝ`, so the grid carries an integer per
  infinite place and per `p`-subset and nothing is rounded at the finite places, where the wedge
  exponent is exact. The rounding is a function of the level and its range is finite, so no
  pigeonhole or subsequence is taken and 3.1's cells are not used.
- *Finiteness in `⋀^p`*: the rounded system has negative weight; its domain has rank exactly
  `M − 1`, `M` the number of `p`-subsets, since the wedges span a hyperplane and 4.3 caps the rank;
  the interval form of 5.5 in `⋀^p` makes these hyperplanes finitely many, for each `k`.
- *Back to `ι → K`*: the span of the vectors all of whose wedges lie in a subspace `U` of `⋀^p`
  inverts the wedge span of 4.5 (Lemma 7.5.33 as a function on subspaces), and recovers the span of
  the first `k` minimal vectors, which contains `V(Q)` and is proper because `k < card ι`. `T` holds
  subspaces containing the `V(Q)`, not the `V(Q)` themselves.

*Needs:* 4.1 (`TauCeti.NumberField.approxDomain`, the weight), 4.2, 4.3, 4.5, 5.5; Tau Ceti
`NumberField.exists_evertse`.

### 6.2 The Subspace Theorem, coefficients in `K`

Prove (Schmidt 1972; Schlickewei 1977; Bombieri–Gubler, Theorem 7.2.2 with `F = K`): for
`[Nontrivial ι]`, forms `L v i : Module.Dual K (ι → K)` linearly independent for each `v` in `Sinf`
and in `Sfin`, and `ε > 0`, there is a finite set of proper subspaces of `ι → K` containing every
`x ≠ 0` with `approxProd Sinf Sfin L x ≤ mulHeight x ^ (−card ι − ε)`, the absolute values being the
places themselves; and its inclusion form, that the set of such `x` lies in the union of a finite
set of proper subspaces. As a statement it is 6.3's
`exists_finset_submodule_of_approxProd_le_extension` at `F = K` and `w v = v`, the name under which
a consumer cites it; a citation of 6.2 as NumberField.exists_finset_submodule_of_approxProd_le means
this specialization. 6.3 is proved from 6.2. *Route*, with no new definition: 5.1's package, then 6.1
for each of its finitely many exponent systems (their levels combined by one `max`, with no
uniformity), the kernels of the forms for the solutions where a form vanishes, and Tau Ceti's
`Projectivization.instNorthcottMulHeight` for the solutions of small height. Those are finitely many
*projective* points, each contributing the line it spans; the tuples of bounded height are never
finite in number. A line is proper because `ι` is nontrivial. The normalizing scalars of 5.1 never
have to be undone, since a subspace is closed under scaling. *Needs:* 5.1, 6.1; Tau Ceti
`NumberField.approxProd`, `Projectivization.instNorthcottMulHeight`.

**Checks.**
- For a one-element `ι` the statement is false: over `ℚ` with `S∞` the real place, `S₀` empty and
  the form `X`, every nonzero `x` has `approxProd = |x| / |x| = 1` and height `1`, so it satisfies
  `1 ≤ 1^(−1−ε)`; the only proper subspace of `ℚ¹` is `0`, which contains no solution. Over `K` with
  roots of unity the solutions span everything in the same way.

### 6.3 Algebraic coefficients

Prove `exists_finset_submodule_of_approxProd_le_extension` (Schmidt 1972; Schlickewei 1977;
Evertse; Bombieri–Gubler, Theorem 7.2.2 and Remark 7.2.3): let `F/K` be a finite extension,
`w v : AbsoluteValue F ℝ` lying over `v` for every `v` in `Sinf` and `Sfin`,
`L v i : Module.Dual F (ι → F)` linearly independent over `F` at every such `v`, `[Nontrivial ι]` and
`ε > 0`; then finitely many proper subspaces of `ι → K` contain every `x : ι → K`, `x ≠ 0`, with
`approxProd Sinf Sfin w L x ≤ mulHeight x ^ (−card ι − ε)`. Also its inclusion form. **This is the
form consumers apply.** `F = K` with `w v = v` is 6.2; `K = ℚ` is Schmidt's theorem with algebraic
coefficients at `∞` and at finite places, the targets of DiophantineApproximationAndTranscendence
§2.1. Over `K` of degree `> 1` the two differ on rational points: the height relative to `K` of a
rational point is its `[K : ℚ]`-th power, so 6.2 over `K` loses a factor `[K : ℚ]` in the exponent,
and only 6.3 over `ℚ` is sharp.

*Route.*
- Pass to the Galois closure `F'` of `F/K` (0.1), and at each place of `F'` over `v` put the
  conjugate system `σ (L v)`, `σ` carrying the chosen absolute value to that place (0.2). Base change
  and conjugation are one operation, the composition of a form with a ring homomorphism
  (`σ ∘ algebraMap`), with no semilinear map or tensor product; independence survives because the
  family is square and `RingHom.map_det` carries invertibility.
- The approximation product of the conjugated system over `F'` is an **identity** in that of the
  original: a point of `ι → K` has the same local factor at every place above `v`, and the local
  degrees sum to `[F' : K]`, the factor by which the relative height grows (Tau Ceti's local
  extension formulas). At finite places the `e f`-th root of 0.1 (Tau Ceti's
  `AbsoluteValue.nonarchRpow`) cancels against `NumberField.FinitePlace.sum_localDegree` as `mult`
  does at infinite places. Putting coordinate forms at the other places, 5.1's device, would weaken
  the inequality in the wrong direction.
- The system on `F'` is a function of an absolute value, defined by choosing for each absolute value
  a triple (place of `K`, place of `F'`, automorphism) in the right relation; the place of `K` so
  chosen is proved to be the intended one by restricting to `K`.
- Apply 6.2 over `F'` and pull back: `W ∩ (ι → K)` is `(W.restrictScalars K).comap φ` for the
  inclusion `φ`, proper because otherwise `W` contains the standard basis.

*Needs:* 0.1, 0.2, 6.2; Tau Ceti `NumberField.approxProd`, `AbsoluteValue.nonarchRpow`,
`NumberField.FinitePlace.sum_localDegree`, `NumberField.InfinitePlace.sum_mult_eq_mult_mul_finrank`;
Mathlib `RingHom.map_det`.

### 6.4 The affine form

Prove `exists_finset_submodule_of_integer_of_affineProd_le` (Bombieri–Gubler, Corollary 7.2.5 and
Theorem 7.2.6): for `S : Finset (HeightOneSpectrum (𝓞 K))`, `w v` lying over `v` and forms
`L v i : Module.Dual F (ι → F)` linearly independent at every infinite place and every place of `S`,
`[Nontrivial ι]` and `ε > 0`, the `x ≠ 0` with coordinates in `S.integer K` and

```text
affineProd S w L x
  = (∏ v : InfinitePlace K, (∏ i, w v (L v i x)) ^ v.mult) * ∏ v ∈ S, ∏ i, w v (L v i x)  ≤ 
  mulHeight x ^ (−ε)
```

lie in finitely many proper subspaces; also the inclusion form. **This is the form Layer 8 uses.**
The passage is one identity: dropping the local denominators multiplies `approxProd` by the part of
the height carried by the infinite places and `S`, once per form, so `affineProd` equals
`approxProd` times the `card ι`-th power of the product of the local sup norms over the infinite
places and `S`. Forwards, an `S`-integral solution of 6.4 is a solution of 6.3: it needs only 0.3's
inequality between the height and its `S`-part, since at an `S`-integral point the affine inequality
is the stronger one. Backwards, a solution of 6.3 is scaled to an `S`-primitive point, for which 0.3
makes the two equal, after enlarging `S` (0.3), completing the infinite places with coordinate
forms (5.1) and extending `w` to the added places (0.1); the converse therefore returns a new family
of absolute values and a multiple of the point. The affine form indexes finite places by
height-one primes and the projective form by `FinitePlace`; the translation is `FinitePlace.mk`,
which is injective (Mathlib's `NumberField.FinitePlace.equivHeightOneSpectrum`). *Needs:* 0.1, 0.3,
5.1, 6.3; Tau Ceti `NumberField.mulHeight_le_prod`,
`NumberField.mulHeight_eq_prod_of_forall_iSup_eq_one`,
`NumberField.exists_finset_superset_forall_exists_mulHeight_eq`.

`affineProd` is a definition of `Suggested.lean`: the product displayed above, with `x` mapped into
`F` and the finite places of `S` read through `FinitePlace.mk`. API:
- for `x ≠ 0`, `affineProd S w L x` equals `approxProd` of the same system over all infinite places
  and the image of `S`, times the `card ι`-th power of
  `(∏ v, (⨆ j, v (x j)) ^ v.mult) · ∏ v ∈ S, ⨆ j, v (x j)`;
- for `x ≠ 0` with coordinates in `S.integer K`, `affineProd S w L x ≤ mulHeight x ^ (−ε)` implies
  that `approxProd` of that system is at most `mulHeight x ^ (−card ι − ε)`;
- conversely, a solution `x` of 6.3 over all infinite places and `S` has, after enlarging `S` to a
  finite `S'` (0.3), extending `w` to the added places (0.1) and completing the system by coordinate
  forms there (5.1), a nonzero multiple `c • x` with coordinates in `S'.integer K` that solves 6.4
  for the new system, with the same `ε`;
- `NumberField.FinitePlace.mk` is injective on `HeightOneSpectrum (𝓞 K)`.

### 6.5 General position

Define general position (Vojta 1987; Bombieri–Gubler, Definition 7.2.8): `IsGeneralPosition L B`,
for a family `L : κ → Module.Dual F (ι → F)` and a finset `B` of indices, holds if every subfamily of
at most `card ι` members of `B` is linearly independent. API:
- for families of at least `card ι` members it is equivalent to Tau Ceti's
  `TauCeti.InGeneralPosition` of the coefficient vectors `(L k (Pi.single j 1))_j`; the at-most form
  is used so that small families need no separate hypothesis;
- with exactly `card ι` forms, general position is linear independence.

Prove `exists_finset_submodule_of_generalProd_le` (Vojta 1987; Bombieri–Gubler, Theorem 7.2.9): for
`L : AbsoluteValue K ℝ → κ → Module.Dual F (ι → F)` with `[Finite κ]`,
`B : AbsoluteValue K ℝ → Finset κ` with each `L v` in general position on `B v` for `v` in `Sinf`
and `Sfin`, `w v` over `v`, `[Nontrivial ι]` and `ε > 0`, the solutions of

```text
generalProd Sinf Sfin w B L x  ≤  mulHeight x ^ (−card ι − ε),
```

the product of 6.3 taken over all of `B v` instead of a basis, lie in finitely many proper
subspaces; also the inclusion form. `generalProd` is a definition of `Suggested.lean`. One carrier
type `κ` with a finset per place, not a family of index types, makes the chosen systems one finite
type. *Route*: at a place with at least `card ι` forms keep the `card ι` smallest values; their forms
are a basis, which bounds the local sup norm by the largest of them, so each discarded value is at
least the sup norm over a constant. At a place with fewer forms, complete to a basis by coordinate
forms, at no cost (Mathlib's `Module.Basis.extendLe`); the two cases cannot be merged, since the
extended family need not be in general position. Then 6.3 at `ε / 2` and Northcott as in 6.2.
Conversely, with exactly `card ι` forms general position is independence, and `generalProd` over
`Finset.univ` is `approxProd` by definition. *Needs:* 6.2, 6.3; Tau Ceti `TauCeti.InGeneralPosition`,
`Projectivization.instNorthcottMulHeight`; Mathlib `Module.Basis.extendLe`.

**Checks.**
- Over `ℚ` in two variables the three forms `X₀`, `X₁`, `X₀ + X₁` are in general position on all
  three, since any two of them are independent. The family `X₀`, `X₁`, `X₀` is not, its first and
  third members being equal; a definition asking only that the family span the dual space would
  accept it.

### 6.6 Consistency with Layer 3

For `Fintype.card ι = 2`, 6.3 is 3.4, as an equation between theorems: prove
`exists_finset_submodule_of_approxProd_le_card_two_of_extension`, 3.4's statement, from 6.3, and
check that it is literally 3.4's
`exists_finset_submodule_of_approxProd_le_card_two`; the equality of the two is a proof by `rfl`,
a genuine check since proof irrelevance is definitional, and it holds because 3.4 was stated with
`approxProd` for an arbitrary two-element index type. Also 3.4's statement proved from 6.5; the
reading as finitely many points of `ℙ¹(K)`, from the fact that a proper subspace of a plane holds at
most one projective point; and Roth's theorem of 3.2 discharged from 6.3 through 3.4's converse.
*Needs:* 3.2, 3.4, 6.3, 6.5.

**Checks.**
- The count cannot be moved to tuples: a solution `x` of 3.4 has infinitely many nonzero multiples
  `c x`, `c ∈ Kˣ`, all solutions by projectivity, so "finitely many solutions `x`" is false while
  "finitely many lines" is true.

### 6.7 The Subspace Theorem on a subspace

Prove `exists_finset_submodule_lt_of_generalProd_le` (derived from Bombieri–Gubler, Theorem 7.2.2, as
6.3 is): for a subspace
`U ⊆ ι → K` with `2 ≤ finrank K U`, forms `L v k : Module.Dual F (ι → F)` indexed by a finite type
`κ` whose restrictions to the `K`-points of `U` are `F`-linearly independent at every `v` in `Sinf`
and `Sfin`, `w v` over `v` and `ε > 0`, the `x ∈ U`, `x ≠ 0`, with
`generalProd Sinf Sfin w univ L x ≤ mulHeight x ^ (−finrank K U − ε)` lie in finitely many proper
subspaces of `U`. *Route*: 6.3 in the coordinates of a basis `M` of `U`; each local factor changes by
at most `max 1 (∑ k, v (M j k))` per form, and the height by a constant through a left inverse of
`M`, absorbed by halving `ε` and Northcott. Independence on the `K`-points of `U` is independence on
its `F`-span, so no base change of `U` is formed. `U = ⊤` is 6.3. This is the form the method of
Faltings and Wüstholz consumes. *Needs:* 6.3, 6.5; Tau Ceti `Projectivization.instNorthcottMulHeight`.

### Examples

- 6.3 is sharper than 6.2 on rational points. Over `K = ℚ(√2)` the rational point `(1, 2)` has
  height `2` over `ℚ` and `4 = 2^[K : ℚ]` over `K`. To treat forms with coefficients in `K` at the
  real place of `ℚ` by 6.2 over `K`, one puts them at one real place of `K` and coordinate forms at
  the other, whose local factor is at most `1`; a rational solution of the inequality over `ℚ` with
  exponent `−card ι − ε` then satisfies the inequality over `K` only with exponent
  `−(card ι + ε) / 2` relative to `K`, so 6.2 over `K` needs exponent `−2 (card ι) − 2ε` over `ℚ`,
  while 6.3 over `ℚ` with coefficients in `K` needs only `−card ι − ε`.
- Over `ℚ` with the real place, the two forms `X₀`, `X₁ − √2 X₀` with coefficients in `ℚ(√2)` and
  any `ε > 0`: 6.3 says that the `(q, p)` with `|q| |p − √2 q| / max(|p|, |q|)² ≤ max(|p|, |q|)^(−2−ε)`
  lie on finitely many lines, which is Roth's theorem for `√2` read projectively.

### Dependencies

Layer 4 (4.1–4.5), Layer 5 (5.1, 5.5), Layer 3 (3.2, 3.4 for 6.6), Layer 0 (0.1–0.3). Tau Ceti: the
approximation product and domains, Evertse's lemma, the local extension formulas, `nonarchRpow`,
the Northcott instance on projective space. Mathlib: `Module.Basis.extendLe`, `RingHom.map_det`.

## Layer 7: approximation of algebraic numbers, and transcendence

What the Subspace Theorem says about numbers. Each milestone is 6.3 over `K = ℚ` with algebraic
coefficients, at the infinite place and, in 7.2, at the primes of a base, followed by an argument
on the finitely many subspaces. The theorems for one linear form at integer points and for
approximation by algebraic numbers of bounded degree are DiophantineApproximationAndTranscendence
§2.1's (Evertse's lecture notes, Theorems 7.7 and 7.8); this layer consumes them and owns what lies
beyond.

### 7.1 The exponents of an algebraic number, and simultaneous approximation

*The exponents.* Prove `mahlerExponent_eq_of_isAlgebraic` (Schmidt 1970; Schmidt, *Diophantine
Approximation*, Ch. VI; Bombieri–Gubler, Remark 7.3.4): for real algebraic `α` of degree `D` and
every `n`, `mahlerExponent n α = algebraicApproximationExponent n α = min n (D − 1)`. *Route*:
`mahlerExponent n α ≤ D − 1` is 1.2; the lower bounds are the box principle
`TauCeti.natCast_le_mahlerExponent`, at `n` when `n < D` and at `D − 1` followed by monotonicity in
`n` when `n ≥ D`; the missing upper bound `mahlerExponent n α ≤ n` is
DiophantineApproximationAndTranscendence §2.1's theorem on one linear form at
`1, α, …, α^n`, the polynomials vanishing at `α` being excluded by the definition of the exponent;
and Wirsing's third inequality of 1.2 with `TauCeti.algebraicApproximationExponent_le_mahlerExponent`
carries the value to Koksma's exponent. At `n = 0` all three sides vanish, so no `1 ≤ n` is assumed.
*Needs:* 1.2; DiophantineApproximationAndTranscendence §2.1 (one linear form); Tau Ceti
`TauCeti.mahlerExponent`, `TauCeti.algebraicApproximationExponent`,
`TauCeti.natCast_le_mahlerExponent`, `TauCeti.algebraicApproximationExponent_le_mahlerExponent`.

*The Subspace step with a product.* Prove 6.3 over `ℚ` at `∞` alone in the form Schmidt's theorems
read it: for linearly independent forms `L_i` in `card ι` variables with real algebraic
coefficients and `ε > 0`, the nonzero integer points `x` with `∏_i |L_i(x)| ≤ M^(−ε)`, `M` the sup
norm of `x`, lie in finitely many proper subspaces of `ℚ^ι`. Here `approxProd` is
`(∏ i, |L_i x|) / M^(card ι)`, and the height of an integer point is at most its sup norm. Schmidt's
theorems are read against the product `∏_i |q_i|`, which can be much smaller than `M^n`, so the
one-linear-form theorem, which charges the coordinate forms `M^n`, does not suffice. *Needs:* 6.3;
Mathlib `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`.

*The two theorems of Schmidt.* For real algebraic `α_i`, `i ∈ ι`, with `1, α_1, …, α_n` linearly
independent over `ℚ` (Mathlib's `LinearIndependent ℚ (fun o : Option ι ↦ o.elim 1 α)`) and `ε > 0`:
prove `finite_setOf_mul_prod_dist_lt` (Schmidt 1970), finitely many integers `q ≥ 1` have
`q^(1+ε) · ∏_i |q α_i − p_i| < 1` for some integers `p_i`; and `finite_setOf_prod_abs_mul_dist_lt`,
finitely many `q : ι → ℤ` with no zero coordinate have `(∏_i |q_i|)^(1+ε) · |∑_i α_i q_i − p| < 1`
for some integer `p`. *Route*: the first needs no induction: one exceptional subspace
`c₀ q + ∑ c_i p_i = 0` gives `q (c₀ + ∑ c_i α_i) = ∑ c_i θ_i` with `|θ_i| ≤ 1/2`, and the left factor
is nonzero by the independence. The second goes through the corresponding theorem for the linear
form in the `q_i` and `p`: it eliminates one variable on each exceptional subspace and recurses, a
relation involving the numerator turning the distance into a linear form `∑ q_i (α_i + c_i / c₀)`
that the first stage finishes; a threshold `∏ |q_i| ≥ ∑ |α_i| + 2` absorbs the numerator, and below
it the finitely many integer vectors with no zero coordinate and bounded product are counted.
Writing the distance to the nearest integer as an existential over the numerator agrees with the
`round` reading, since the nearest integer is nearest. *Needs:* the Subspace step above; Mathlib
`round`, `LinearIndependent`.

**Checks.**
- At `n = 1` and `α` irrational of degree `D ≥ 2`, the exponent theorem gives
  `mahlerExponent 1 α = 1`, which through `TauCeti.algebraicApproximationExponent_one_add` is
  `irrationalityExponent α = 2`: a proof of Roth's theorem for `α` through Layer 6 and not Layer 3.
  For `α = 2^(1/3)` (`D = 3`) the theorem gives `w_1 = 1`, `w_2 = 2`, and `w_n = 2` for all
  `n ≥ 2`; a formula `min n D` would give `w_3 = 3`, contradicting Liouville's bound
  `w_n ≤ D − 1` of 1.2.
- If a zero coordinate were allowed in the second theorem, every `q` with `q_1 = 0` would satisfy
  the inequality (its left side is `0`), an infinite set as soon as `card ι ≥ 2`.
- The independence hypothesis forces every `α_i` to be irrational: a rational `α_i = a/b` gives the
  relation `a · 1 − b · α_i = 0`.

### 7.2 The combinatorial transcendence criterion

(Adamczewski–Bugeaud–Luca 2004; Adamczewski–Bugeaud 2007; Ferenczi–Mauduit 1997.)
*Vocabulary.* For a finite word `V` and
real `w ≥ 1`, `wordRpow V w` is `V` repeated `⌊w⌋` times followed by its prefix of length
`⌈(w − ⌊w⌋) |V|⌉`, a word of length `⌈w |V|⌉`. A sequence `a : ℕ → α` satisfies
`IsStammeringWith w a` if there are finite words `U k`, `V k` and a real `C` such that
`U k ++ wordRpow (V k) w` is a prefix of `a`, `|U k| ≤ C |V k|` and `|V k|` is strictly increasing;
`IsStammering a` holds if `IsStammeringWith w a` for some `w > 1`. The bounded ratio is stated as
`|U k| ≤ C |V k|`, since `x / 0 = 0` would make a quotient say nothing at `|V k| = 0`. API:
- `IsStammeringWith w a` is equivalent to a working form on periodic segments: there are `C` and
  positions `r k` and periods `s k`, with `s k` strictly increasing and `r k ≤ C s k`, such that
  `a (i + s k) = a i` for all `r k ≤ i < r k + ⌈(w − 1) s k⌉` (take `r k = |U k|`, `s k = |V k|`, and
  conversely `U k`, `V k` the words of `a` on `[0, r k)` and `[r k, r k + s k)`);
- `IsStammeringWith w a` implies `IsStammeringWith w' a` for `1 ≤ w' ≤ w`.

*The criterion.* Prove `transcendental_ofDigits_of_isStammering` (Adamczewski–Bugeaud–Luca 2004;
Adamczewski–Bugeaud 2007): for `b ≥ 2` and `a : ℕ → Fin b` stammering and not eventually periodic,
Mathlib's `Real.ofDigits a` is transcendental. Also the weak form from Ridout's theorem alone, for
`IsStammeringWith w a` with `w > 2`. Both are proved in the working form on periodic segments.

*Irrationality.* For `b ≥ 2`, `Real.ofDigits a` is irrational exactly when `a` is not eventually
periodic. *Route*: through the tails `T k` of `a` itself, `b · T k = a k + T (k + 1)` with
`0 ≤ T k ≤ 1`; for a rational value the tails take finitely many values (a tail equal to `0` or `1`
forces the digits `0` or `b − 1` from there on, and otherwise `T k` is the fractional part of
`b^k` times the value); no uniqueness of expansions is used.

*The Subspace step.* Prove 6.3 over `ℚ` with forms at `∞` and the coordinate forms at a finite set
`P` of primes: for linearly independent forms `L_i` with real algebraic coefficients and `ε > 0`,
the nonzero integer points `x` with `∏_i |L_i(x)| · ∏_{p ∈ P} ∏_j |x_j|_p ≤ M^(−ε)`, `M` the sup
norm, lie in finitely many proper subspaces. The height of an integer point is at most `M` times
`∏_{p ∈ P} max_j |x_j|_p` (both are `M / gcd` up to the primes outside `P`); 7.1's step is the case
`P = ∅`.

*Route* for the criterion. A repetition of period `s` after position `r` puts
`(b^(r+s) − b^r) ξ` within `b^(−(w−1)s)` of an integer `p`, exactly, from Mathlib's
`Real.abs_ofDigits_sub_ofDigits_le` (the value agrees with the eventually periodic number on its
first `r + ⌈w s⌉` digits). The forms `X`, `Y`, `ξ X − ξ Y − Z` at `∞` and the coordinate forms at the
primes of `b` put the points `(b^(r+s), b^r, p)` into finitely many proper subspaces. One of them
holds infinitely many; its equation either omits `Z`, and holds for at most one `s`, or forces `ξ`
rational. At `∞` alone the product of the three forms is small only for `w > 2 + 2r / s`; the primes
of `b` contribute `b^(−(2r + s))` and lower the threshold to `w > 1`. Ridout's theorem, with the
primes of `b` as its denominator side, sees only the factor `b^r` and gives `w > 2`; the approximant
in lowest terms keeps a denominator part prime to `b` below `b^s`. *Needs:* 3.3 (Ridout, for the
weak form), 6.3; Mathlib `Real.ofDigits`, `Real.abs_ofDigits_sub_ofDigits_le`, `padicNorm`.

**Checks.**
- `∑_{j ≥ 0} 10^(−(2^j + 1))` is `Real.ofDigits a` in base `10` for the digits `a k = 1` when `k` is
  a power of `2` and `0` otherwise. It is stammering with `w = 3`: take `U` the first `2^j + 1`
  digits and `V` a block of `⌊(2^j − 1) / 3⌋` zeros, so that `U V V V` is a prefix and
  `|U| ≤ 4 |V|` for `j ≥ 4` (at `j = 3`, `|U| = 9 > 8 = 4 |V|`); and `a` is not eventually periodic,
  its gaps growing. The criterion, the `w > 2` form and the working form each prove it
  transcendental.
- The constant sequence `0` is stammering with value `0`, which is algebraic; it is excluded only by
  the periodicity hypothesis.
- Every sequence satisfies the condition at `w = 1`, with `U k` empty and `V k` the prefix of length
  `k + 1`, since `wordRpow V 1 = V`; so `w > 1` is the content of the definition.

### 7.3 The complexity of an algebraic irrational

For `a : ℕ → α`, the factor of length `n` at `i` is the word `a i ⋯ a (i + n − 1)`, and the
**complexity** `complexity a n` is the number of distinct factors of length `n` (Morse–Hedlund
1938). Over a finite alphabet:
- `complexity a` is monotone and `complexity a 0 = 1`;
- **Morse–Hedlund** (Morse–Hedlund 1938): `a` eventually periodic, `complexity a` bounded, and
  `complexity a n ≤ n` for some `n ≥ 1` are equivalent; equivalently, if `a` is not eventually
  periodic then `n < complexity a n` for every `n`. *Route*: some `m < n` has
  `complexity a (m + 1) = complexity a m`, so dropping the last letter is injective on the factors
  of length `m + 1` (Mathlib's `Set.injOn_of_ncard_image_eq`), every factor has one right
  extension, and two equal factors make `a` periodic from the first on;
- *the combinatorial lemma* (Adamczewski–Bugeaud 2007): `complexity a n ≤ C n` for infinitely many
  `n` implies `a` stammering, by pigeonhole on the first `C n + 1` positions and a re-cut period
  `P = (⌊n / 2 s⌋ + 1) s`, which gives one exponent for every `n` with no case split;
- *the theorem*: prove `tendsto_complexity_div_atTop` (Adamczewski–Bugeaud 2007, Theorem 1): for
  `b ≥ 2` and `a : ℕ → Fin b`, if `Real.ofDigits a` is algebraic and irrational then
  `complexity a n / n → ∞`, proved as the transcendence criterion "`complexity a n ≤ C n` for
  infinitely many `n` and `a` not eventually periodic imply `Real.ofDigits a` transcendental", from
  the combinatorial lemma and 7.2's working form.

`complexity` is a definition of `Suggested.lean`, `Set.ncard` of the set of factors. *Needs:* 7.2;
Mathlib `Set.ncard`, `Set.injOn_of_ncard_image_eq`, `Real.ofDigits`.

**Checks.**
- The alphabet must be finite: over `ℕ` the identity has infinitely many factors of length `1`,
  which `Set.ncard` counts as `0`, so `complexity id 1 = 0` while `complexity id 0 = 1`, and
  monotonicity fails.
- The binary digits of `∑_{k ≥ 0} 2^(−2^k)` (a `1` exactly at the positions `2^k − 1`) have
  complexity at most `2n` for every `n ≥ 1`: besides `0^n` and the `n` factors with one `1`, a factor
  of length `n` with two `1`s starts at some `i ≤ n − 2`, since the `1` after a position `2^k − 1 ≥ i`
  is at `2^(k+1) − 1 ≥ 2i + 1`. The values for `n = 1, …, 5` are `2, 4, 6, 7, 9`. So the number is
  transcendental by the theorem.
- The constant sequence `0` has algebraic (rational) value and `complexity = 1`, so
  `complexity a n / n → 0`: irrationality is needed.

### Examples

- A consequence of 7.3: an algebraic irrational has more than `1000 n` distinct blocks of
  `n` consecutive decimal digits for all large `n`.

### Dependencies

Layer 6 (6.3), Layer 3 (3.3, Ridout), Layer 1 (1.2). DiophantineApproximationAndTranscendence §2.1
(one linear form at integer points). Tau Ceti: the exponents and their comparisons. Mathlib:
`Real.ofDigits` and its digit bounds, `Set.ncard`, `padicNorm`.

## Layer 8: unit equations and Diophantine equations

Throughout, `S : Finset (HeightOneSpectrum (𝓞 K))` and `S.unit K`, `S.integer K` are Mathlib's
`Set.unit` and `Set.integer`. Every finiteness statement is qualitative; the counts are
DiophantineApproximationAndTranscendence §§2.3–2.4's and Layer 9's.

### 8.1 The unit equation in two variables

Prove `finite_setOf_unit_add_unit_eq_one` (Siegel; Mahler; Lang):
for `a, b ∈ Kˣ`, only finitely many pairs `(x, y)` of `S`-units satisfy `a x + b y = 1`. *Route*:
enlarge `S` until `a`, `b` are `S`-units and absorb them, reducing to `x + y = 1`; apply 6.5 with
the three forms `X₀`, `X₁`, `X₀ + X₁` at every infinite place and every place of `S`, which are in
general position, and `ε = 1`. At a solution the central quantity is **exactly**
`mulHeight (x, y) ^ (−3)`: the numerators multiply to `1` by the `S`-product formula (0.3), and the
denominators to `H³` because the equation itself is the Bézout relation that makes `(x, y)`
`S`-primitive. No coordinate is compared and no case is split. A proper subspace of `K²` meets the
line `X₀ + X₁ = 1` at most once. DiophantineApproximationAndTranscendence §2.3's two-term unit
equation over `ℚ` is the case `K = ℚ`. *Needs:* 0.3, 6.5; Mathlib `Set.unit`.

**Checks.**
- `(2, −1)`, `(3, −2)`, `(4, −3)` and `(9, −8)` solve `x + y = 1` in `{2, 3}`-units of `ℚ`.
- In all of `ℚˣ`, `(n + 2, −(n + 1))` solves `x + y = 1` for every `n ≥ 0`: the restriction to
  `S`-units for a finite `S` is the content.

### 8.2 The unit equation in `n` variables

Prove `finite_setOf_sum_unit_eq_one` (Evertse; van der Poorten–Schlickewei; Bombieri–Gubler,
Theorem 7.4.2): for `a : ι → K`, only finitely many `x : ι → Kˣ` with every
`x i ∈ S.unit K` satisfy Tau Ceti's `TauCeti.IsNondegenerateSolution a x`, the equation
`∑ i, a i * x i = 1` with no vanishing nonempty subsum (a zero coefficient makes the set empty).
Alongside:
- *Corollary 7.4.3* (Bombieri–Gubler): without nondegeneracy, there is a finite `Φ ⊆ K` such that
  every solution in `S`-units of `∑ i, a i * x i = 1` has a coordinate with `a i * x i ∈ Φ`. Prove
  also its homogeneous form `exists_finite_forall_exists_div_mem`: for the solutions of
  `∑ i, a i * x i = 0` in `S`-units satisfying Tau Ceti's
  `TauCeti.IsNondegenerateHomogeneousSolution`, each ratio `x i / x j` takes only finitely many
  values; 8.6 consumes it.
- *Finitely generated groups*: the same for `x i ∈ Γ`, `Γ ≤ Kˣ` finitely generated, since such a
  `Γ` lies in `S.unit K` for some finite `S`. At `K = ℚ` this discharges
  DiophantineApproximationAndTranscendence §2.3's nondegenerate unit equation over `ℚ`. Its §2.4
  theorem over an arbitrary field of characteristic zero follows from it by that roadmap's own
  specialization argument and is not an instance of anything here.
- *Subsums*: a sum equal to `c` has a subsum equal to `c` with no vanishing nonempty subsum, and the
  nonempty variant for a vanishing sum; a proper subspace of `ι → K` lies in a hyperplane
  `∑ i, b i * y i = 0` with `b ≠ 0`.

*Route*, by strong induction on `Fintype.card ι` over all index types in one universe, with the
coefficients carried as nonzero elements of `K` so that restriction to a subtype needs no
repackaging: absorb the coefficients; apply 6.5 with the `card ι + 1` forms `X i` and `∑ i, X i`,
which are in general position and at which the central quantity is exactly `H(x)^(−card ι − 1)`; on
each subspace a relation with `c j ≠ 0` shortens the equation. The shortened equation may be
degenerate, so the step is in two parts: a minimal subsum equal to `1` has fewer variables and is
nondegenerate, which puts some coordinate of every solution in a fixed finite set (Corollary
7.4.3); fixing `x k = u` leaves `∑ i ≠ k, x i = 1 − u` with `u ≠ 1` because the subsum over `i ≠ k`
does not vanish. *Needs:* 6.5, 8.1; Tau Ceti `TauCeti.IsNondegenerateSolution`,
`TauCeti.IsNondegenerateHomogeneousSolution`, `Set.unit_fg`.

**Checks.**
- `1/2 + 1/3 + 1/6 = 1` is a nondegenerate solution in `{2, 3}`-units of `ℚ` (every subsum is
  positive).
- `(2^k, −2^k, 1)` solves `x + y + z = 1` in `{2}`-units for every `k`: degenerate solutions are
  infinitely many, so nondegeneracy cannot be dropped.
- A minimal (for inclusion) nonempty subsum equal to `1` is nondegenerate: a vanishing nonempty
  proper subsum would leave a smaller subsum equal to `1`.

### 8.3 Triangularly connected decomposable forms

For `l : κ → Module.Dual K V`, `TriangleAdj l j j'` holds when some `l k = a • l j + b • l j'` with
`a, b ≠ 0`, and `IsTriangularlyConnected l` when every two indices are joined in the
reflexive-transitive closure (Mathlib's `Relation.ReflTransGen`) of `TriangleAdj l` (Győry–Papp;
Evertse–Győry, *Unit Equations in Diophantine Number Theory*, Ch. 9); both are definitions of
`Suggested.lean`. For a triangularly connected family with `⨅ j, LinearMap.ker (l j) = ⊥`, prove:
- the points of `V` at which every `l j` takes an `S`-unit value are `S`-unit multiples of finitely
  many points (on any `K`-vector space `V`);
- `finite_setOf_mul_prod_eq`: for `G = c * ∏ j, l j ^ e j` with every `e j ≠ 0` and `m ≠ 0`, only
  finitely many `S`-integral `x : ι → K` satisfy `G x = m`;
- the `S`-integral `x` with `G x ∈ S.unit K` are `S`-unit multiples of finitely many solutions.

*Route*: along a triangle, `a (l j x / l k x) + b (l j' x / l k x) = 1` is 8.1, so the ratio
`l j' x / l j x` takes finitely many values, and along a path the ratios multiply; the common kernel
`0` makes `LinearMap.pi l` injective, so the ratios determine the point up to a scalar. For `G`,
enlarge `S` until `c` is a unit and the coefficients integral; integral factors whose product with
positive powers is a unit are units; and `G (u • y) = u^E * G y`, `E = ∑ j, e j`. For the unit
version, two solutions on one line differ by a scalar whose `E`-th power is an `S`-unit, hence an
`S`-unit, so each line carries one class and no valuation is bounded. Pairwise non-proportionality
is not a hypothesis. Forms whose factors are defined only over an extension are 8.4's. Only 8.1 is
used. *Needs:* 8.1; Mathlib `Relation.ReflTransGen`, `LinearMap.pi`.

**Checks.**
- `x y (x + y) = 2`: the forms `X`, `Y`, `X + Y` are triangularly connected (`X + Y = 1 • X + 1 • Y`)
  with common kernel `0`, so there are finitely many integer solutions; `(1, 1)` is one.
- `X`, `Y` alone are not triangularly connected, and `x y = 1` has the `{2}`-integral solutions
  `(2^k, 2^(−k))` for every `k`.

### 8.4 Thue and Thue–Mahler

Let `g ∈ K[X]` have degree at most `d` and at least three distinct roots in an algebraic closure of
`K`, counting the point at infinity as one root when `natDegree g < d`; equivalently
`G = Polynomial.homogenize g d`, with `G(x, 1) = g(x)`, has at least three pairwise
non-proportional linear factors over the algebraic closure (Thue 1909; Mahler 1933;
Bombieri–Gubler 5.3.1–5.3.2). Prove:
- `finite_setOf_eval_homogenize_eq`: for `m ≠ 0`, `G(x, y) = m` has only finitely many solutions
  with `x, y ∈ S.integer K`; DiophantineApproximationAndTranscendence §1.6's Thue theorem over `ℤ`
  is the case `K = ℚ`, `S = ∅`;
- the `S`-integral `(x, y)` with `G(x, y) ∈ S.unit K` are `S`-unit multiples of finitely many
  solutions; at `K = ℚ`, with `S` the primes `p_1, …, p_s`, this gives
  DiophantineApproximationAndTranscendence §2.3's Thue–Mahler theorem over `ℤ` (finitely many
  coprime `x, y` with `|G(x, y)| = ∏_k p_k^(z_k)`), for `G` square-free or not.

*Route*: over the splitting field `L`, `G` is a constant times powers of pairwise non-proportional
binary linear forms; three such forms are triangularly connected, since two span the dual of `L²`
and Cramer's rule writes the third with nonzero coefficients; so 8.3 applies over `L` with the
primes above `S`. *Passage to primes above `S`*: the primes of `𝓞 L` above `S` form a finite set
(Tau Ceti's `IsDedekindDomain.HeightOneSpectrum.primesAbove`), and an element of `K` is an
`S`-integer or an `S`-unit exactly when its image is one above `S`, the exponent `e f` used only
through its positivity. The unit version descends without degrees or norms: two `K`-solutions on
one line of `L²` differ by a scalar in `K` that is a unit above `S`. Over `ℤ`, a line carries at
most two coprime integer points `±c`, and the exponents are bounded by `|G(x, y)|`. Only 8.3, hence
only 8.1, is used. *Needs:* 8.3; Tau Ceti `IsDedekindDomain.HeightOneSpectrum.primesAbove`,
`IsDedekindDomain.HeightOneSpectrum.primesAbove_finite`; Mathlib `Polynomial.homogenize`.

**Checks.**
- `x³ − 2y³ = 1`: `X³ − 2` has three distinct roots, so in every number field and for every `S` the
  `S`-integral solutions are finitely many; `(1, 0)` is one.
- `x³ − 2y³ = ±2^a 3^b` has finitely many coprime solutions, among them `(2, 1)` with `a = b = 1`
  (`8 − 2 = 6`).
- Without coprimality `(2^k, 0)` gives `x³ − 2y³ = 2^(3k)` for every `k`; and `x² − 2y² = ±1`, with
  only two linear factors, is Pell's equation with infinitely many solutions.

### 8.5 The hyperelliptic equation

Prove `finite_setOf_mul_sq_eq_eval` (Siegel 1926; Bombieri–Gubler, Theorem 5.3.5): for `f ∈ K[X]`
with at least three distinct roots of **odd multiplicity** in an algebraic closure of `K` and
`b ≠ 0`, only finitely many `(x, y)` with `x, y ∈ S.integer K` satisfy `b y² = f(x)`; neither the
coefficients of `f` nor `b` need be `S`-integral or `S`-units. Corollaries: the book's statement for
`f` squarefree of degree at least `3`, and the case where `f` splits over `K`. *Route*:
- enlarge `S` until the leading coefficient, `b`, the nonzero roots and their nonzero differences
  are units and `S.integer K` is principal (0.3, through Tau Ceti's
  `IsDedekindDomain.subsingleton_integer_classGroup_iff`);
- at a solution, `x − α_i` is coprime in `S.integer K` to the other factors, their differences being
  units, so it is one of finitely many constants times a square (Mathlib's
  `exists_associated_pow_of_mul_eq_pow'`); the square classes are finite by Tau Ceti's `Set.unit_fg`
  and Mathlib's `Subgroup.finiteIndex_range_powMonoidHom_of_fg`. No ideal is factored and no
  valuation counted. Odd multiplicity suffices, since `z^(2k+1) = v d²` gives `z = v (d / z^k)²`;
- over the splitting field of `∏_e (X² − e)`, `x − α_i = δ_i²` with `δ_i` integral above `S`, and
  Siegel's identity `(δ_1 − δ_2)/(δ_1 − δ_3) + (δ_2 − δ_3)/(δ_1 − δ_3) = 1` is one unit equation
  (8.1) whose solution `t` determines `x` rationally; each `x` carries at most two `y`.

Only 8.1 and 8.4's passage to an extension are used. *Needs:* 0.3, 8.1, 8.4; Tau Ceti
`IsDedekindDomain.subsingleton_integer_classGroup_iff`, `Set.unit_fg`; Mathlib
`exists_associated_pow_of_mul_eq_pow'`, `Subgroup.finiteIndex_range_powMonoidHom_of_fg`.

**Checks.**
- `y² = x³ − 2` (three simple roots) and `y² = x³ (x² − 2)` (roots `0` of multiplicity `3` and `±√2`,
  so not squarefree) have finitely many `S`-integral solutions in every number field and for every
  `S`; `(3, 5)` solves the first (`27 − 2 = 25`).
- `y² = x² (x − 1)` has one root of odd multiplicity and the solutions `(t² + 1, t (t² + 1))` for
  every `t`; `y² = 2x² + 1`, with two roots, is Pell's equation.

### 8.6 The Corvaja–Zannier gcd bound

Prove `exists_forall_of_rpow_le_gcd_sub_one` (Corvaja–Zannier 2003, 2005; Bugeaud–Corvaja–Zannier
2003; Bombieri–Gubler, Theorem 7.4.10 and Corollary 7.4.11): for a finite set `P` of primes and
`ε > 0` there are `R` and a finite set
`E` of integer exponent pairs not containing `(0, 0)` such that every pair of nonzero integers
`u, v` with prime factors in `P` and `Int.gcd (u − 1) (v − 1) ≥ (max |u| |v|)^ε` has
`max |u| |v| ≤ R` or `u^a v^b = 1` for some `(a, b) ∈ E`; in particular only finitely many such
pairs are multiplicatively independent. Corollaries:
- the greatest prime factor of `(ab + 1)(ac + 1)` tends to infinity with `a`, for `a > b > c ≥ 1`:
  for every finite set of primes, only finitely many such triples have `(ab + 1)(ac + 1)` with all
  prime factors in it;
- `finite_setOf_exp_le_gcd_pow_sub_one` (Bugeaud–Corvaja–Zannier 2003): for multiplicatively
  independent `a, b ≥ 2` (`a^m = b^n` only for `m = n = 0`) and `ε > 0`, only finitely many `n`
  have `gcd(a^n − 1, b^n − 1) ≥ exp(ε n)`.

*Route*, with `d` the gcd and `N = ⌈4/ε⌉ + 2`: the integral points `z (i, j) = (u^(i+1) v^j − 1) / d`,
`i, j < N`; the coordinate forms at `∞` and, at every `p ∈ P`, the forms `z (i, j) − z top` and
`z top` with `top` the monomial `u^N v^(N−1)`, smallest at every prime at once; 6.4 with exponent
`1`, the `N²` powers of `d ≥ H^ε` winning against a height at most `2 H^(2N − 1)`; and the relation
on each subspace, a homogeneous unit equation, put through 8.2's homogeneous corollary. A ratio `1`
of two monomials is a curve `u^a v^b = 1`; a ratio `r / s ≠ 1` forces `d ∣ r − s`, bounding `d`. The
theorem is stated with the ordinary `Int.gcd`, not its part prime to `P`. *Needs:* 6.4, 8.2;
Mathlib `Int.gcd`, `padicNorm`.

**Checks.**
- `(2^k, 2^k)` satisfies the hypothesis at `ε = 1/2` for every `k ≥ 2` (`2^k − 1 ≥ 2^(k/2)`), and
  `u v^(−1) = 1`: the exceptional curves are needed.
- `b = c = 1`, `a = 2^k − 1` gives `(ab + 1)(ac + 1) = 2^(2k)`, with greatest prime factor `2`:
  `b > c` is needed in the first corollary.

### 8.7 The vocabulary of counting unit equations

The pieces of the quantitative theory of unit equations that are not specific to one paper, so that
the counts of unit equations consume them from one place (Evertse 1984, §2; Schlickewei 1990, §3):
- *Place products*: the product of a function `g` over the places of a set `T` among the infinite
  places and `S`, in the product-formula normalization (exponent `mult v` at an infinite place),
  with its API: multiplicativity in `g`, monotonicity in `T` for `g ≥ 1`, the split
  `T = (T ∩ T') ∪ (T \ T')`, and products over a finset of functions; the product formula for an
  algebraic integer (`≥ 1` over all the places of `S` and the infinite places) and for an
  `S`-integer; the `S`-product formula (`= 1` for an `S`-unit, and multiplicativity against an
  `S`-unit); the height of an `S`-integral tuple (at most its place product over all the infinite
  places and `S`, equal to it times the `finprod` of the local sup norms at the other finite places,
  unchanged by an `S`-unit multiple, and a place product of sup norms at most the height when the
  tuple has local sup norm `1` off `S`); and a bound of the height of an algebraic integer tuple by
  a power of the largest house of its coordinates.
- *Sum forms* (Schlickewei's class (3.12)): for `r : AbsoluteValue K ℝ → Option ι`, the coordinate
  forms with the one `r v` names replaced by their sum, at every place `v`. They are linearly
  independent at every place, with coefficients `0` and `1`; their products at a point, and their
  affine products, are given by explicit formulas; on the hyperplane `∑ y = 0` they are exact
  (the products equal the products over `Option ι` of the coordinates of `(y, −∑ y)`); their
  determinant is `±1` at every place; the sup of the coordinates is at most `card ι` times the sup
  of the sum forms; and `H(y, −∑ y) ≤ (card ι)^[K : ℚ] · H(y)` for nonempty `ι` (for empty `ι` the
  left side is `1` and the right side `0`).
- *A balanced representative*: for a chosen prime `P₀ ∈ S` (so
  `S` nonempty; a caller with `S = ∅` first adjoins one prime, which only enlarges the set of
  solutions), every projective point has an `S`-integral representative meeting Evertse's
  normalization (2.4) for the largest exponents, with fixed constants of product `1`, at the cost of a
  constant from one Minkowski scalar rather than the `S`-unit covering radius of 5.1. The scalar's
  factor is pushed to `P₀`, where the representative is made at most its inverse; this cancels the
  archimedean constants (the factor to the power `mult v / [K : ℚ]`) in the product. The
  coefficients are normalized by Minkowski's bound on ideal classes, and a prime above `2` has norm
  at most `2^[K : ℚ]`.
- *Subclasses*: if `0 < u p i ≤ 1` for `p` in a nonempty finite set `P` and `i` in a nonempty `ι`,
  with product `b`, and `N ≥ 1`, there are natural numbers `k p i` with `u p i ≤ b^(k p i / N)` and
  `∑ k p i / N ≥ 1 − #P · card ι / N`.

*Needs:* Layer 0 (0.3); Tau Ceti `TauCeti.house`, `Set.mem_integer_iff_finitePlace`,
`Set.mem_unit_iff_finitePlace`; Mathlib `Height.mulHeight`.

**Checks.**
- *Subclasses*, `b < 1`: with `θ = log u / log b ∈ [0, 1]` summing to `1`, `k = ⌊N θ⌋` gives
  `u ≤ b^(k/N)` (as `k/N ≤ θ` and `b < 1`) and `∑ k / N ≥ ∑ (θ − 1/N) = 1 − #P · card ι / N`; rounding
  up instead would violate `u ≤ b^(k/N)`. At `b = 1` every `u = 1` and `k = N` works. For empty `P`
  or `ι` there is no `k`, the sum is `0` and the bound `1`: nonemptiness is needed.
- `H(y, −∑ y) ≤ (card ι)^[K : ℚ] H(y)`: over `ℚ` with `y = (1, 1)` the left side is
  `H(1, 1, −2) = 2` and the right side `2 · 1 = 2`, so the constant `card ι` cannot be lowered.

### 8.8 The local Nullstellensatz inequality

(Corvaja–Zannier 2004, Lemma 3.3.)
- If a homogeneous polynomial lies in an ideal generated by homogeneous polynomials, it is a
  combination of the generators with homogeneous coefficients of the right degrees.
- Let `f_1, …, f_r, G` be polynomials in `X_1, …, X_N` over `K` with `totalDegree f_i ≤ δ`, and suppose
  every `X_s` has a power in the ideal `(X₀, G^h, f_1^h, …, f_r^h)`, where `G^h` is the
  homogenization of `G` and `f_i^h` that of `f_i` in degree `δ`. Then at any absolute value `v` of
  `K` there are `c > 0` and `R` such that every zero `P` of `G` with `‖P‖_v ≥ R` has
  `c · ‖P‖_v^δ ≤ |f_i(P)|_v` for some `i`.

*Route*: evaluate `X_s^M = A₀ X₀ + ∑ B G^h + ∑ A f^h` at `(1, P)` with homogeneous coefficients
from the first item, and bound the coefficients at `v` through the bound of a value of a product of
polynomials at an absolute value. It replaces the limit points at infinity in the Corvaja–Zannier
argument for `f_1 ⋯ f_r = g`. *Needs:* Mathlib `MvPolynomial.IsHomogeneous`,
`MvPolynomial.totalDegree`, `Ideal.span`.

### Examples

- Applications of Layer 8: `x + y = 1` in `{2, 3}`-units (8.1), `x³ − 2y³ = 1` over every `S` (8.4),
  `y² = x³ − 2` (8.5), and `gcd(2^n − 1, 3^n − 1) < exp(n / 100)` for all large `n` (8.6); also, for
  all large `a`, the greatest prime factor of `(ab + 1)(ac + 1)` exceeds `7` for all
  `a > b > c ≥ 1` (8.6).

### Dependencies

Layer 6 (6.4, 6.5), Layer 0 (0.3). Tau Ceti: nondegenerate solutions, the finite generation of the
`S`-units, the class group of the `S`-integers, the primes above `S`. Mathlib: `Set.integer`,
`Set.unit`, `Polynomial.homogenize`, `Relation.ReflTransGen`, `exists_associated_pow_of_mul_eq_pow'`.

## Layer 9: counting subspaces

The elementary half of the quantitative Subspace Theorem (Evertse, "On the Quantitative Subspace
Theorem", 2010, §§2–4; "Evertse" in this layer is this paper), in the language of systems of
inequalities. It uses Layer 0, the product formula, determinant bounds and Layer 4's geometry of
numbers, and of Layers 2–6 only 6.4 (in Theorem A) and 6.1 (in 9.5): it bounds how many subspaces the
solutions in a range of heights need. Write `N = Fintype.card ι`. Heights are **affine**, Tau Ceti's
`Height.mulHeightAff`, and its `[K : ℚ]`-th root, as Evertse states them; his absolute values are the
`[K : ℚ]`-th roots of Mathlib's, so the exponents are his and only the constants change. The sharp
count of the large solutions for general `N`, Evertse's Theorem 2.1 and its successors, is
DiophantineApproximationAndTranscendence §2.8's; 9.5 proves the weaker count that Layers 4–6 give,
with `[E : ℚ]`, `[E : K]` and `R` in place of the absolute theory's constants.

### 9.1 Systems of inequalities

(Evertse, §2, systems (2.3) and normalization (2.4).) For `S`, `w` and forms as in 6.4 (linearly
independent at every infinite place and every place of `S`), constants `C p` and exponents `c p i`
indexed by the places `p` (the infinite places and those of `S`):
- the **solution set** of the system: the `S`-integral `x` with
  `w p (L p i x) ^ mult p ≤ C p * H(x) ^ c p i` at every place `p` and every `i`, with its **local
  values** `w p (L p i x) ^ mult p`, its **weight** `∑ p, ∑ i, c p i`, its **determinant**
  `∏ p, |det L p|_p` and the **exponent bound** `s(p)`, `mult p / [K : ℚ]` at an infinite place and `0`
  at a finite one;
- **normalized systems**, Evertse's normalization (2.4): coefficients of absolute height at most `H`
  and of degree at most `D` over `K`, at most `R` distinct forms, `0 < ∏ p, C p ≤ (∏ p, |det L p|_p)^(1/N)`,
  weight at most `−δ` with `0 < δ ≤ 1`, and `max_i c p i = s(p)` at every place; a normalized system has
  `N ≥ 2`, since for `N = 1` the last condition forces weight `∑ p, s(p) = 1`;
- **large solutions**: `H(x)^(1/[K : ℚ]) ≥ max (2H) (N^(2N/δ))`.

Prove:
- *the product inequality and systems*, both ways: a solution of a system satisfies
  `affineProd ≤ (∏ p, C p)^N · H(x)^weight`, and under (2.4)
  `affineProd ≤ ∏ p, |det L p|_p · H(x)^(−δ)`; conversely, for any positive constants, finitely many
  exponent systems of weight at most `−δ/2` catch, above a level, every `S`-integral solution of
  `affineProd ≤ H(x)^(−δ)`. Against the affine height every local value is at most `A · H(x)`, so no
  unit normalization, fundamental inequality or independence of the forms is needed, unlike 5.1;
  exponents are clamped below at `−(2 · #(places × forms) + δ + 1)`, which also handles the kernels.
  The last condition of (2.4) is not produced: at a finite place it requires moving the point by an
  `S`-unit;
- *normalized systems from a grid*: with `t` the number of places of the system, an `S`-integral `x`
  with `H = H_aff(x) > 1`, every form at most `C p · H^(s(p))`, no form zero, and
  `∏ p, ∏ i, |L_i x|_p · H^(N + 2δ) ≤ (∏ p, max_i |L_i x|_p)^N` solves the system of a grid point `k`
  with entries at most `(N + 1) M`, a zero at every place and `∑ k / M ≥ N + δ`, once `M δ ≥ t N`, with
  exponents `s(p) − k p i / M`. Their weight is exactly `N − ∑ k / M`, hence at most `−δ`, and they meet
  (2.4) with the constants unchanged, with no existential level and at most `((N + 1) M + 1)^(t N)`
  systems. The exponent `N + 2δ` on the left is load-bearing: the weight is `N − ∑ k / M`, so the grid
  sum has to exceed `N`. The lower bound on the largest forms is the caller's, through the place
  products of 8.7;
- **Theorem A**: prove `exists_finset_submodule_of_systemWeight_neg`: for `[Nontrivial ι]`, one system
  of negative weight has its nonzero solutions in finitely many proper subspaces, from 6.4 for large
  height and Northcott below (the affine height dominates the projective height, so a negative power
  of the affine height is at most the same power of the projective one).

*Needs:* 6.4, 8.7; Tau Ceti `Height.mulHeightAff`, `Projectivization.instNorthcottMulHeight`.

**Checks.**
- The coordinate forms of `ℚ²` at the real place with `C = 1` and exponents `(1, −2)` satisfy (2.4)
  with `H = D = δ = 1`, `R = 2` (weight `−1`, `∏ C = 1 = |det|^(1/2)`, `max c = 1 = s(∞)`); its nonzero
  integer solutions are the `(k, 0)`, all on one line, and the points `(x, ±1)` with `|x| ≤ 1`, of affine
  height `1`.
- For `N = 1`, `|x| ≤ H(x)^(−1)` has the solution `x = 1` (affine height `H(1, 1) = 1`), which lies in no
  proper subspace of `ℚ¹`: Theorem A needs `N ≥ 2`.
- Over `ℚ` with `S = {2}`, the coordinate system with exponents `(1, 0)` at `∞` and `(−1, 0)` at `2` and
  `C = 1` has weight `0` and the solutions `(2^k, 1)` (affine height `2^k`, `|2^k|_2 = 2^(−k)`), no two on
  a proper subspace: negative weight is needed.

### 9.2 The gap principle

(Evertse, Proposition 4.1.) Under (2.4) and for `Q ≥ N^(2N/δ)`, prove that the solutions with
`Q ≤ H(x) < Q^(1 + δ/(2N))`, `H` the absolute affine height, lie in a **single** proper subspace,
because any `N` of them have determinant `0`. *Route*: the determinant is an `S`-integer, so its local
sizes over the places of the system multiply to at least `1`; in the window each local value is at
most `C p · Q^([K : ℚ] (c p i + s(p) δ / (2N)))`, applied at the relative level `Q^[K : ℚ]`, since `Q`
bounds the absolute affine height and the local values are relative (the one use of `c p i ≤ s(p)`);
and the determinant of the forms at the points is bounded row by row by the Leibniz expansion, which
is part of this target: for an `AbsoluteValue` `v` and a square matrix `A`,
`v (det A) ≤ N! ∏_i max_j v (A i j)`, and `v (det A) ≤ ∏_i max_j v (A i j)` when `v` is
nonarchimedean (Mathlib's `Matrix.det_le` has one uniform bound in place of the row bounds). The
places are absolute values with no inner product, so
Leibniz's `N!` replaces Hadamard's `N^(N/2)`, and `Q ≥ N^(2N/δ)` still beats it. The forms need not be
independent, since `∏ C p > 0` makes every determinant of the forms nonzero. A chain of windows is
covered by the union of their subspaces. In particular, a normalized system over `ℚ` in two variables
has no window containing two independent solutions. *Needs:* 9.1; Mathlib `Matrix.det_apply`,
`Matrix.det_le`.

**Checks.**
- The row bound at an archimedean place: for `A = (1 1; 1 −1)` over `ℚ`, `|det A| = 2 = 2! · 1 · 1`,
  so `N!` is attained at `N = 2`; for `N = 3` the Leibniz constant `3! = 6` exceeds Hadamard's
  `3^(3/2) ≈ 5.2`, which needs an inner product. At the `2`-adic place the same matrix has
  `|det A|_2 = 1/2 ≤ 1 · 1`, without the `N!`.

### 9.3 Small solutions

(Evertse, Theorem 2.2, Proposition 4.2, Lemmas 4.3–4.5.) Prove that the solutions of a normalized
system that are not large lie in at most `δ⁻¹ ((10³ N)^(N d) + 4N log log (4H))` proper subspaces,
`d = [K : ℚ]`; it is proved once from any count per window: 9.2 above `N^(2N/δ)`, and below it the
second gap principle, at most `(90 N)^(N d)` subspaces for the solutions with
`Q ≤ H(x) < 2 Q^(1 + δ/(2N))`, `Q ≥ 1`, with `δ⁻¹ (1 + 4N (N − 1))` windows below the threshold from
`log (1 + log₂ N) ≤ N − 1`, which Evertse's constants absorb. Beneath it:
- *Lemma 4.3*: a partition of `Fin N → ℂ` into at most `(20N)^N · M²` classes on each of which
  `|det (y 1, …, y N)| ≤ M⁻¹ ∏ i, ‖y i‖`, with the pivot coordinate not gridded (the classes indexed by
  `Σ i, ({j // j ≠ i} → Fin A × Fin A)`) and grid `⌈3 A⌉`; with Hadamard's inequality in the sup norm,
  `|det| ≤ N^(N/2) ∏ ‖y i‖_∞`, from the Hermitian Gram–Hadamard inequality of SuccessiveMinima §0.1
  (target 0.1.2), Tau Ceti's `Matrix.det_gram_le_prod_norm_sq`. False for `N = 1`. The infinite
  places are read through complex embeddings
  (0.1), Evertse's vector being `(φ (L i x) / t i)_i` with `t i` the `mult v`-th root of the bound, and
  `M = (9/2)^(N/2)` beats the doubled window;
- *over `ℚ`*: at most `200^N` subspaces per window and `δ⁻¹ (10^(3N) + 4N log log (4H))` in all, from
  *Lemma 4.5* with another constant (the paper has `100^N D^(1/(N−1))`): `S`-integral points any `N` of
  which have determinant at most `D v` at every place lie in at most
  `3^N (4N² + 2)² · max 1 (∏ v, D v)^(1/(N−1))` proper subspaces; its case `S = ∅` is Evertse's
  Lemma 4.4 (`100^N` in the paper). Route for 4.5, proved directly: the dual of the lattice `⋂ v, M v`
  is an approximation module of Layer 4 at level `1` with exponents `0`, so 4.2 with 4.1's volume and
  covolume gives `∏ k, μ k ≤ ∏ v, D v` with no loss; the minimal vectors take integer values of size at
  most `2N μ k` on the points by Cramer's rule, and a pigeonhole on a prefix of them finishes. `max 1` is
  needed, since a set in a proper subspace needs one subspace however small `D` is.

*Needs:* 0.1, 4.1, 4.2, 9.1, 9.2; Tau Ceti `Matrix.det_gram_le_prod_norm_sq`.

**Checks.**
- Lemma 4.3 is false for `N = 1`: the inequality reads `|y 1| ≤ M⁻¹ |y 1|`, false for `y 1 ≠ 0` and
  `M > 1`.
- `max 1` is needed in Lemma 4.5: with every `D v = 0`, a set consisting of one nonzero point meets
  the hypothesis (any `N` of its points repeat it and have determinant `0`) and needs one subspace,
  while without `max 1` the bound would be `0`.

### 9.4 From intervals to subspaces

(Evertse, proof of Theorem 2.1.) If the solutions of a normalized system outside a subspace `U₀` have
`H(x) ∈ ⋃ i < m, [Q i, Q i ^ ω)` with `ω ≥ 1` and `Q i ≥ N^(2N/δ)`, prove that they lie in at most
`m (1 + log ω / log (1 + δ/(2N)))` proper subspaces, and the general form for the solutions in any
set. Each interval is `⌈log ω / log (1 + δ/(2N))⌉` windows of 9.2. The interval hypothesis is explicit,
since every quantitative Roth or Subspace theorem is proved as an interval result: for general `N`
the interval results at Schmidt's parameters are 5.5's interval form for one system of forms and
6.1's interval form, and the absolute count is DiophantineApproximationAndTranscendence §2.8's. For
`N = 2` Roth's interval form of 3.6 supplies it; prove the link: for a normalized system of 9.1 in two
variables, the solutions above an explicit height threshold, `O_{δ, s, r}(log H + 1)` in the coefficient
bound `H`, lie in at most `s + 1 + m (N' + s).choose s · (1 + log (3 r s M) / log (1 + δ/4))` proper
subspaces, `s` the number of places of the system, `r = [F : K]`, and `m`, `N'`, `M` Roth's parameters
of 3.2 at `2 + δ/2`. The system is Roth's inequality at its small forms with `β = x₁ / x₀`; the affine
height of a solution is at most `C H(β)^(r s)` by Liouville's inequality (0.4) at one place; the windows
become windows `[Q, Q^(3 r s M))` of the affine height and the first statement covers them; the `s`
lines where a small form vanishes and the line `x₀ = 0` are counted apart. The count is Roth's, not
Evertse's. *Needs:* 0.4, 3.6, 9.1, 9.2.

**Checks.**
- `ω ≥ 1` is load-bearing: for `ω < 1` the intervals `[Q, Q^ω)` are empty, so there are no solutions
  outside `U₀`, while the bound `m (1 + log ω / log (1 + δ/(2N)))` is negative for `ω` small enough.

### 9.5 The count for normalized systems

(Schlickewei 1992; Evertse 2010, the proof of Theorem 2.1 from Theorem 3.1 and Proposition 4.1, with
6.1 in place of Theorem 3.1.) For a normalized system of 9.1 with forms over a Galois extension `E/K`,
`N` forms per place, `t` places and coefficients of absolute height at most `H`, prove that the
solutions with `log H(x)` above an explicit threshold lie in at most an explicit number of proper
subspaces depending only on `N`, `δ`, `[E : ℚ]`, `[E : K]` and the number `R` of distinct forms, not on
`t` or `|S|`; that all solutions lie in at most that number plus 9.3's count plus
`1 + log ω / log (1 + δ/(2N))`; and that the threshold is at most a linear function of `log H`. The
heights enter only the threshold; the sharp absolute count is DiophantineApproximationAndTranscendence
§2.8's, and 9.5 is the statement Layers 4–6 prove without the absolute theory. Deliverables:
- *From systems to domains over `E`*: an `S`-integral `x` with local values `≤ Q^(c' p i)` at every
  place, for a level `Q ≥ 0` and exponents `c'`, read in `ι → E`, lies in the approximation domain over
  `E` of 6.3's conjugated forms, at the places of `E` above `S`, with the exponents `c' v i / mult v`
  above an infinite place and `e f · c' v i` above a prime of `S`, at level `Q`. The level is a free
  parameter, not the height of `x`, because the scalar step below applies the bridge to `β x` at the
  level `H(x)`. For a solution `x` whose constants satisfy `C p ≤ H(x)^(γ p)` for a family `γ` it gives
  the exponents of `c + γ` at level `H(x)`. Both weights of the conjugated exponents are `[E : K]` times
  those of `c'`, the shift by `γ` adds `N ∑ p, γ p` to the weight, and the forms are independent at
  every place the domain reads. The constants cannot be dropped. A system over an intermediate field is
  the same system over its Galois closure. No unit normalization and no Northcott are used, unlike 5.1
  and 6.2.
- *Raised exponents*: since `max_i c p i = s(p)`, the positive exponents sum to at most `N`, and
  scaling the negative ones leaves weight `−δ` and absolute weight at most `2N + δ`, for any number of
  places.
- *One scalar for the constants* (Minkowski's first theorem on `K`): a nonzero `S`-integer `β` with
  `|β|_p^(mult p) ≤ κ / C p` at every place, where `κ^t = c(K, S) · Z^(2t/N)` with `Z = N! H^(N [E : ℚ])`
  and `c(K, S)` the constant of 8.7's Minkowski scalar, depends only on `N`, `H`, `[E : ℚ]`, `K` and `S`.
  The degree is that of the coefficient field `E`: a coefficient of absolute height at most `H` is at
  most `H^[E : ℚ]` at every place of the system, so `∏ p, |det L p|_p ≤ Z^(2t)`, (2.4) gives
  `∏ C p ≤ Z^(2t/N)`, and `c(K, S) ≤ ∏ p, κ / C p` is the hypothesis of Minkowski's theorem. Then the
  local values of `β x` are at most `κ · H(x)^(c p i)`, and once
  `log H(x) ≥ (2N log c(K, S) + 4t log Z) / δ`, `κ ≤ H(x)^(δ/(2Nt))`. So the bridge applies to `β x` at
  the level `H(x)` of `x`, which in general differs from `H(β x)`, with the raised exponents shifted by
  `δ/(2Nt)` at every place. The shift costs `δ/2` of weight: the exponents over `E` have weight
  `−[E : K] δ/2` and absolute weight at most `[E : K] (2N + 2)`, which are the `ε` and `A` given to 6.1.
  `x` lies in every subspace `β x` lies in, so the constants cost the height threshold, which is linear
  in `log H`, and nothing in the count. The degree `[E : ℚ]` cannot be replaced by `[K : ℚ]`: over `ℚ`
  with `S = ∅`, let `α` be the real root of `T³ − 100T² − 1`, an algebraic integer with `100 < α < 101`
  whose conjugates have modulus below `1`, so that `H(α) = α^(1/3) < 5`; the forms `(αX, αY)` with
  `C ∞ = α` and `c = (1, −2)` make a normalized system with `H = 5`, `D = 3`, `R = 2` and `δ = 1`, every
  `(k, 0)` is a solution, and `[K : ℚ]` in place of `[E : ℚ]` would give `κ = 100 < α`, so no nonzero
  integer `β` would exist.
- *The thresholds are linear in the heights*: every threshold of Layers 4, 5.4, 5.5 and 6.1 is bounded
  by the heights of the entries of the matrices of the forms, through the logarithmic height of the
  forms plus `log |D_K| + ∑ v ∈ Sfin, log N v + 1` (Tau Ceti's `Matrix.logHeight₁_det_le` for the
  determinants), in the form `X ≤ exp (c Λ)`, whose coefficients add under products and multiply under
  powers.
- *Assembly*: for any interval result for the conjugated forms above `X₀`, with 6.1 as one and, for
  `N = 2`, 5.5 as another, used once with the weight and absolute-weight budget of the previous item;
  the conjugated forms are at most `R [E : K]` in number, the form parameter `s` of 5.5 and 6.1 over
  `E`, which is why the count sees `R` and not `t`; 9.4 turns each interval into windows; below `X₀` one
  interval covers the large solutions.

*Needs:* 6.1, 6.3, 8.7, 9.1–9.4; Tau Ceti `Matrix.logHeight₁_det_le`, `Height.mulHeightAff`.

**Checks.**
- The constants cannot be dropped in the bridge: over `ℚ` with the forms `(2X, 2Y)`, `C ∞ = 2` and
  `c = (1, −2)`, a normalized system (`∏ C = 2 = |det|^(1/2) = 4^(1/2)`), every `(k, 0)` is a solution
  (`|2k| ≤ 2 |k|`), and none lies in the domain of the exponents `c` at level `k` (`|2k| ≤ k` fails for
  `k ≥ 1`).

### Examples

- Over `ℚ` in two variables with the coordinate system of 9.1's first Check, 9.2 at `δ = 1`, `N = 2`:
  for `Q ≥ 2^4 = 16`, the solutions with `Q ≤ H < Q^(5/4)` lie on one line, here `y = 0`.

### Dependencies

Layer 0, Layer 3 (3.6 for 9.4), Layer 4 (4.1, 4.2), Layer 6 (6.1, 6.3, 6.4), Layer 8 (8.7).
DiophantineApproximationAndTranscendence §2.8 for the absolute count it does not restate. Tau Ceti:
the affine height, determinant heights, the Gram–Hadamard inequality, Northcott on projective space.
Mathlib: the Leibniz formula for determinants.

## Provenance

This section is secondary; it maps the milestones to an existing formalization and prescribes
nothing. The milestones have implementations in
[`rwst/Subspace-Theorems` at `09835cb`](https://github.com/rwst/Subspace-Theorems/tree/09835cb23557ae5ae0cf55a9c4ab9055f5d60338/DiophantineApproximation),
directory `DiophantineApproximation/`, with helpers in `STForMathlib/`, Apache 2.0, by the author of
this roadmap, except for Wirsing's first two inequalities (1.2), the classifications with Mahler's
theorem (1.3), and the acceptance tests of 9.2–9.4. That code uses its own height layer
(`ArithmeticHeights/`) and its own copies of Hasse derivatives, the weighted index, generalized
Wronskians, Roth's lemma and the grid lemma, which DiophantineApproximationAndTranscendence and Tau
Ceti own; a port restates each statement in the vocabulary of the Conventions and consumes those
pieces by name instead of copying them.

| § | Source files (`DiophantineApproximation/`) |
| --- | --- |
| 0.1 | `PlacesOver.lean`, `PlacesOverInfinite.lean`, `PlacesOverFinite.lean`, `Nonarchimedean.lean` |
| 0.2 | `ConjugatePlaces.lean`, `LocalExtension.lean` |
| 0.3 | `SIntegerLocalization.lean`, `SAdicHeight.lean`, `HeightTransport.lean` |
| 0.4 | `FundamentalInequality.lean`, `LiouvilleInequality.lean` |
| 1.1 | `IrrationalityExponent.lean`, `KoksmaMobius.lean`, `PolynomialSupNorm.lean`, `IrreducibleExponent.lean` |
| 1.2 | `LiouvilleExponent.lean`, `MahlerExponent.lean`, `AlgebraicExponent.lean`, `KoksmaComparison.lean`, `PolynomialEval.lean`, `RootLocation.lean`, `WirsingSystem.lean`, `WirsingThird.lean` |
| 2.1 | `CountingVolume.lean` |
| 2.2 | `AuxiliaryPolynomial.lean`, `BoxMonomial.lean`, `MonomialHeight.lean`, `IndexConditions.lean`, `MvPolynomialEvalBound.lean` |
| 3.1 | `ApproximationClass.lean`, `IndependentHeights.lean` |
| 3.2 | `RothClass.lean`, `RothAuxiliary.lean`, `RothLocalBound.lean`, `RothKeyInequality.lean`, `GlobalBound.lean`, `RothTheorem.lean` |
| 3.3 | `RationalPlaces.lean`, `RothInfinity.lean`, `RothRational.lean`, `Ridout.lean` |
| 3.4 | `ProjectiveTarget.lean`, `ApproxProd.lean`, `RothProjective.lean` |
| 3.5 | `PrimeProducts.lean`, `MahlerPowers.lean` |
| 3.6 | `GapPrinciple.lean`, `CountingApproximations.lean`, `RothIntervals.lean`, `RothSubspaceCount.lean` |
| 3.7 | `MovingTargets.lean` |
| 4.1 | `FinitePlaceValues.lean`, `ModuleCovolume.lean`, `ApproximationDomain.lean`, `ApproximationVolume.lean` |
| 4.2 | `FieldMinima.lean`, `FieldMinkowski.lean`, `ReducedIntegralBasis.lean` |
| 4.3 | `ApproximationRank.lean` |
| 4.4 | `SIntegerApproximation.lean`, `EvertseLemma.lean` |
| 4.5 | `WedgeForm.lean`, `WedgeDomain.lean` |
| 5.1 | `UnitNormalization.lean`, `SubspaceReduction.lean` |
| 5.2 | `MultiHomogeneous.lean`, `MonomialDeviation.lean`, `SubspaceAuxiliary.lean` |
| 5.3 | `FormIndex.lean`, `FormSpecialization.lean`, `GeneralizedRothLemma.lean`, `FormIndexSubspace.lean` |
| 5.4 | `LinearFormValue.lean`, `SubspaceNormal.lean`, `SubspaceHeightBounds.lean`, `ExceptionalSubspace.lean` |
| 5.5 | `LogComparison.lean`, `SubspaceValueBound.lean`, `SubspaceKeyInequality.lean`, `PenultimateMinimum.lean` (the grid lemma of `PolynomialGrid.lean`, `SmallPoint.lean` is DiophantineApproximationAndTranscendence §2.6's) |
| 6.1 | `WedgeRecovery.lean`, `MinimaBounds.lean`, `ExponentGrid.lean`, `WedgeExponentBound.lean`, `WedgeDomainAt.lean`, `MinimaGrid.lean`, `ParametricSubspace.lean` |
| 6.2 | `SubspaceTheorem.lean` |
| 6.3 | `FormBaseChange.lean`, `PlaceConjugation.lean`, `ExtensionApproxProd.lean`, `SubspaceAlgebraic.lean` |
| 6.4 | `AffineProd.lean`, `SubspaceAffine.lean` |
| 6.5 | `GeneralPosition.lean`, `SubspaceGeneralPosition.lean` |
| 6.6 | `SubspaceConsistency.lean` |
| 6.7 | `SubspaceSubmodule.lean` |
| 7.1 | `SchmidtExponents.lean`, `SimultaneousSubspaces.lean`, `SimultaneousApproximation.lean`, `SimultaneousBox.lean` (consuming `OneLinearForm.lean`, `LinearFormSubspaces.lean`, `BoundedDegreeApproximation.lean`, which prove the two targets of DiophantineApproximationAndTranscendence §2.1) |
| 7.2 | `StammeringWords.lean`, `DigitExpansions.lean`, `RepetitionSubspaces.lean`, `TranscendenceCriterion.lean` |
| 7.3 | `FactorComplexity.lean`, `ComplexityTranscendence.lean` |
| 8.1 | `UnitEquation.lean` |
| 8.2 | `UnitEquationSeveral.lean` |
| 8.3 | `DecomposableForm.lean` |
| 8.4 | `SIntegerExtension.lean`, `ThueMahler.lean`, `BinaryForm.lean` (`ThueEquation.lean` proves the Thue target of DiophantineApproximationAndTranscendence §1.6 through Roth) |
| 8.5 | `SIntegerSquares.lean`, `Hyperelliptic.lean` |
| 8.6 | `GcdBound.lean` |
| 8.7 | `PlaceProd.lean`, `SumForms.lean`, `BalancedPoint.lean`, `SystemGrid.lean` |
| 8.8 | `LocalNullstellensatz.lean`; `STForMathlib/RingTheory/MvPolynomial/DehomogenizeIdeal.lean`, `EvalBound.lean`, `Product.lean` |
| 9.1 | `SubspaceSystem.lean`, `SystemGrid.lean` |
| 9.2 | `SubspaceGap.lean` |
| 9.3 | `DetPartition.lean`, `DetCount.lean`, `SubspaceSmall.lean` |
| 9.4 | `SubspaceIntervals.lean` |
| 9.5 | `SystemDomain.lean`, `ThresholdHeights.lean`, `ThresholdBound.lean`, `SystemSubspaceCount.lean` |

The files of the source directory that implement what DiophantineApproximationAndTranscendence and
Tau Ceti own (`MvHasseDeriv*.lean`, `WeightedOrder.lean`, `PolynomialIndex.lean`, `IndexRename.lean`,
`Wronskian.lean`, `GeneralizedWronskian.lean`, `DisjointVariables.lean`,
`PolynomialDeterminantHeight.lean`, `RothDecomposition.lean`, `RothDeterminant.lean`,
`RothEstimates.lean`, `RothBaseCase.lean`, `RothLemma.lean`, `TaylorAtPrimeHasse.lean`,
`BoxPrinciple.lean`, `NormForm.lean`, `PolynomialGrid.lean`, `SmallPoint.lean`) are evidence for those
targets, not milestones here.

## Scope and ownership

**This roadmap owns** the Subspace Theorem over a number field with a finite set of places and its
route, layer by layer above: absolute values of a finite extension lying over a place, their Galois
action and the `S`-adic dictionary, with Liouville's inequality over a number field (Layer 0); the
theory of the approximation exponents beyond their definitions and first inequalities (Layer 1); the
volume estimates and the auxiliary polynomial of prescribed index at several points (Layer 2); Roth's
theorem over a number field with its forms, its projective reading, Mahler's theorem on `(p/q)^k`,
the counting of approximations and moving targets (Layer 3); the geometry of numbers of a
parallelepiped over a number field, successive minima over `K`, Evertse's lemma and the exterior
powers of a system of forms (Layer 4); the Subspace machinery (Layer 5); the Subspace Theorem in its
parametric, coefficient-in-`K`, algebraic, affine, general-position and subspace forms (Layer 6); the
applications to numbers (Layer 7) and to equations over `S`-integers and `S`-units (Layer 8); and the
elementary half of the quantitative theory (Layer 9). Several of its milestones are already in Tau
Ceti at the pins; they are consumed above by the names below and are not planned again.

| § | Content | Tau Ceti at the pin |
| --- | --- | --- |
| 0.1 | classification over a finite place, the prime of `w`, finiteness and nonemptiness of the fibre, extension to further fields, the size bound | `NumberField.existsUnique_finitePlace_rpow_inv_eq_of_liesOver`, `NumberField.liesOver_finitePlace_mk_iff`, `NumberField.exists_finitePlace_rpow_inv_eq_of_liesOver`, `NumberField.exists_liesOver_forall_mem_iff_apply_lt_one`, `NumberField.finite_setOf_liesOver_finitePlace_mk`, `NumberField.nonempty_setOf_liesOver_finitePlace_mk`, `NumberField.FinitePlace.exists_liesOver_of_liesOver`, `NumberField.FinitePlace.max_apply_one_le_mulHeight₁_of_liesOver` |
| 0.1 | nonarchimedean infrastructure | `AbsoluteValue.isNonarchimedean_of_forall_natCast_le_one`, `IsNonarchimedean.apply_le_one_of_isIntegral`, `AbsoluteValue.nonarchRpow` |
| 0.2 | the action, transitivity and the local extension formula at finite places, the vocabulary of finite places over finite places | `AbsoluteValue.instMulActionAlgEquiv`, `NumberField.exists_smul_eq_of_liesOver_finitePlace`, `NumberField.setOf_liesOver_finitePlace_eq_orbit`, `NumberField.FinitePlace.prod_algebraMap_pow_localDegree`, `NumberField.FinitePlace.LiesOver`, `NumberField.FinitePlace.localDegree`, `NumberField.FinitePlace.placesOver`, `NumberField.FinitePlace.sum_localDegree`, `NumberField.FinitePlace.liesOver_val_iff_localDegree_eq_one` |
| 0.3 | the whole `S`-adic dictionary | `NumberField.prod_abs_eq_one_of_mem_unit`, `NumberField.mulHeight_le_prod`, `NumberField.mulHeight_eq_prod_of_forall_iSup_eq_one`, `Set.isPrimitive_iff_finitePlace`, `IsDedekindDomain.exists_finset_superset_isPrincipalIdealRing_integer`, `Set.exists_isPrimitive_smul`, `NumberField.exists_finset_superset_forall_exists_mulHeight_eq`, `NumberField.FinitePlace.hasFiniteMulSupport_iSup` |
| 0.4 | the fundamental inequality | `NumberField.prod_min_one_apply_eq_inv_mulHeight₁`, `NumberField.inv_mulHeight₁_le_prod_apply`, `NumberField.prod_apply_le_mulHeight₁` and the one-place forms |
| 1.1 | `LiouvilleWith.inv`, Möbius invariance of the irrationality exponent, the height characterization, Northcott for integer polynomials, the height gaps | `LiouvilleWith.inv`, `TauCeti.irrationalityExponent_mul_add_div_mul_add`, `Real.le_irrationalityExponent_iff`, `TauCeti.liouvilleWith_iff_frequently_max`, `Polynomial.finite_setOf_natDegree_le_supNorm_le`, `Polynomial.exists_pos_lt_supNorm_of_norm_aeval_lt`, `Polynomial.exists_pos_lt_supNorm_of_norm_sub_root_lt` |
| 1.2 | Liouville's bound for the value of an integer polynomial and for Mahler's exponent; the root formula for the discriminant | `IsAlgebraic.exists_pos_le_norm_aeval_mul_supNorm_pow`, `IsAlgebraic.mahlerExponent_le`, `Polynomial.discr_eq_leadingCoeff_pow_mul_prod_roots_sub_sq` |
| 2.1 | the simplex volume, the lattice-point bounds, the tail, the normalization, the `sinh` bound | `TauCeti.simplexVolume`, `TauCeti.simplexVolume_mul_prod_le_ncard`, `TauCeti.ncard_le_simplexVolume_mul_pow_mul_prod`, `TauCeti.simplexVolume_le_exp_neg`, `TauCeti.simplexVolume_one`, `Real.sinh_le_mul_exp_sq_div_six` |
| 2.2 | the box dictionary, the condition rows and their heights, the transport to the height | `MvPolynomial.ofBox`, `MvPolynomial.hasseDerivRow`, `MvPolynomial.hasseDerivRow_eq_zero`, `MvPolynomial.mulHeight_hasseDerivRow_le`, `Height.mulHeight_pow_range`, `Height.mulHeight_le_pow_totalWeight` |
| 3.1 | approximation classes, (6.9), (6.10), `(L, M)`-independent sequences | `TauCeti.cellIndex`, `TauCeti.ncard_setOf_sum_le`, `TauCeti.ncard_image_cellIndex_le`, `Set.Infinite.exists_cellIndex_eq`, `TauCeti.le_rpow_cellIndex_div`, `TauCeti.rpow_cellIndex_add_one_div_lt`, `TauCeti.one_sub_card_div_lt_sum_cellIndex_div`, `TauCeti.IsHeightIndependent`, `Set.Infinite.exists_isHeightIndependent`, `Set.Infinite.exists_cellIndex_eq_and_isHeightIndependent` |
| 3.2 | the local bounds on a polynomial value | `AbsoluteValue.apply_eval_le`, `AbsoluteValue.apply_eval_le_of_le_weightedIndex`, `AbsoluteValue.LiesOver.apply_eval_le_of_le_weightedIndex` |
| 3.3 | the finite places of `ℚ`; Roth's theorem as a value | `NumberField.FinitePlace.val_eq_padic`, `NumberField.FinitePlace.apply_eq_padicNorm`, `Nat.Primes.finitePlace_mk_val_eq_padic`, `IsAlgebraic.irrationalityExponent_eq_two` |
| 3.4 | the approximation product and its API | `NumberField.approxProd`, `NumberField.approxProd_smul`, `NumberField.approxProd_le_approxProd_of_subset`, `NumberField.prod_proj_div_iSup_le_one`, `NumberField.approxProd_union` |
| 4.1 | domains, modules and bodies with their structure, the value floor, pseudo-bases, the module covolume, the mixed image | `TauCeti.NumberField.approxDomain`, `TauCeti.NumberField.approxModule`, `TauCeti.NumberField.approxBody`, `TauCeti.NumberField.approxDomain_eq`, `TauCeti.NumberField.mul_mem_approxBody`, `NumberField.FinitePlace.floorValue`, `Submodule.exists_pseudoBasis`, `Submodule.covolume_mixedImage`, `Submodule.mixedImage` |
| 4.4 | simultaneous approximation by `S₀`-integers and Evertse's lemma | `NumberField.exists_forall_apply_add_le`, `NumberField.exists_integer_forall_infinitePlace_add_le`, `NumberField.exists_evertse`, `NumberField.exists_evertse_unweighted`, `AbsoluteValue.exists_evertse_of_approx` |
| 4.5 | wedge forms, Laplace's identity, independence, Lemma 7.5.33 | `TauCeti.wedgeForms`, `TauCeti.wedgeForm_plucker`, `TauCeti.linearIndependent_wedgeForms`, `TauCeti.linearIndependent_plucker_comp`, `TauCeti.wedgeSpan`, `TauCeti.wedgeSpan_eq_wedgeSpan_iff`, `TauCeti.mem_span_iff_forall_plucker_mem_wedgeSpan`, `TauCeti.wedgeSpan_eq_ker`, `TauCeti.plucker_topBlock_notMem_wedgeSpan`, `TauCeti.finrank_wedgeSpan_add_one` |
| 5.2 | multihomogeneous polynomials, block substitution and the transport of vanishing, the binomial moments | `MvPolynomial.IsMultiHomogeneous`, `MvPolynomial.multiMons`, `MvPolynomial.card_multiMons`, `MvPolynomial.IsMultiHomogeneous.hasseDeriv`, `MvPolynomial.blockSubst`, `MvPolynomial.coeff_blockSubst_hasseDeriv_eq_zero`, `Finset.card_mul_sum_finsuppAntidiag_apply`, `Finset.card_mul_card_add_one_mul_sum_finsuppAntidiag_choose_two` |
| 5.3 | the index along linear forms and its valuation properties | `MvPolynomial.formIdeal`, `MvPolynomial.formIndex`, `MvPolynomial.substForm`, `MvPolynomial.substFormInv`, `MvPolynomial.formIndex_eq_top_iff`, `MvPolynomial.min_formIndex_le_add`, `MvPolynomial.formIndex_mul`, `MvPolynomial.formIndex_smul`, `MvPolynomial.formIndex_eq_iInf` |
| 7.1 | the height of an integer point is at most its sup norm | `Rat.mulHeight_le_max_abs` |

**Owned elsewhere and consumed here.**
- *DiophantineApproximationAndTranscendence* (cited by section): the approximation exponents (§0.5),
  the Roth machinery (§§1.2–1.5: Hasse derivatives, the weighted index, generalized Wronskians, the
  height of a product in disjoint variables, the height of a determinant of derivatives, Roth's
  lemma), the block calculus (§1.7), general position and the theorems on one linear form at integer
  points and on approximation by algebraic numbers of bounded degree (§2.1), nondegenerate solutions
  (§2.3), Plücker points and the heights of subspaces with their duality (§2.5), the integer grid lemmas
  (§2.6), and the Siegel lemmas with the extraction lemma (§2.8). Where these are in Tau Ceti they are
  consumed under Tau Ceti's names (supplier contracts).
- *HeightsAndUnits*, whose material is in Tau Ceti: the affine height and the value bounds (Layer 0),
  the Northcott instances on projective space and for the subspace heights and Kronecker's theorem
  (Layer 1), the height of an `S`-integer, the `S`-unit theorem with a fundamental system and the
  `S`-logarithmic lattice (Layer 4).
- *GlobalNumberFields* Layer 0, in Tau Ceti: the place carrier `Place K`, the normalized absolute
  values, the product formula and its functoriality under a finite extension with the local degrees in
  the exponents.
- *SuccessiveMinima*, whose consumed targets are in Tau Ceti: the witnesses of the successive minima
  (§1.5), the lower half of Minkowski's second theorem (§2.1, target 2.1.4) and the Hermitian
  Gram–Hadamard inequality (§0.1, target 0.1.2).
- *Mathlib*: `NumberTheory/Height/`, `NumberTheory/DiophantineApproximation/` and
  `NumberTheory/Transcendental/Liouville/` are the floor, and nothing there is restated.

**Instances owned by other roadmaps.** The statements below are DiophantineApproximationAndTranscendence's
targets, over `ℚ` or in the absolute theory, and this roadmap does not restate them. Each is the
instance of a milestone here that the right-hand column names; the milestone's acceptance test is that
its statement specializes to the instance, and a contributor who lands the milestone discharges the
instance with it.

| DiophantineApproximationAndTranscendence target | Milestone here |
| --- | --- |
| §1.6 Roth's theorem for a real algebraic `α` and rational `ξ`, and `¬ LiouvilleWith p α` for `p > 2`; in Tau Ceti as `IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg` and `IsAlgebraic.not_liouvilleWith` | 3.3, `K = ℚ`, `S∞ = {∞}`, `S₀ = ∅`; the specialization is the acceptance test, and there is nothing to discharge |
| §1.6 Thue's equation over `ℤ` (in Tau Ceti as `MvPolynomial.IsHomogeneous.finite_setOf_eval_eq_of_three_le_card_roots`, for three finite roots) | 8.4 at `K = ℚ`, `S = ∅` |
| §2.1 `subspace_theorem`, `subspace_theorem_general_position` | 6.3 and 6.5 at `K = ℚ`, `S∞ = {∞}`, `S₀ = ∅`, integer points |
| §2.1 `padic_subspace_theorem`, `padic_subspace_theorem_general_position` | 6.3 and 6.5 at `K = ℚ` with `S₀` the chosen primes |
| §2.1 the two-forms theorem and Roth's theorem from the Subspace Theorem | 3.4 and 6.6 at `K = ℚ` |
| §2.3 the `p`-adic Roth theorem over `ℚ` with targets in the completions | 3.3, `K = ℚ`, through 0.1 |
| §2.3 `finite_thueMahler` over `ℤ` | 8.4 at `K = ℚ` |
| §2.3 the two-term and the nondegenerate unit equations over `ℚ` | 8.1 and 8.2 at `K = ℚ`, through `Γ ≤ S.unit ℚ` for a finite `S` |

**Not in this roadmap.**
- *Metric Diophantine approximation*: Khinchin, Jarník–Besicovitch, Sprindžuk. Layer 1 proves what
  holds for every number; almost-every statements are not here, nor is the existence of `T`-numbers.
- *Continued fractions* beyond Mathlib's, and the exponents themselves: `TauCeti.irrationalityExponent`
  is Tau Ceti's, and `TauCeti.linearFormExponent`, `TauCeti.mahlerExponent`,
  `TauCeti.algebraicApproximationExponent` and `TauCeti.simultaneousExponent` are
  DiophantineApproximationAndTranscendence §0.5's. Layer 1 adds theorems about them.
- *Heights of polynomials, matrices and subspaces*, the Plücker point, Cauchy–Binet, duality and the
  Siegel lemma in every form: DiophantineApproximationAndTranscendence §§1.3, 2.5, 2.8.
- *Thue's equation over `ℤ`* (§1.6), *norm-form equations* (§2.2, Schmidt's theorem and its criterion),
  *unit equations over finitely generated and finite-rank groups* with their counts (§§2.3–2.4), and
  *Vojta's exceptional subspace* (§2.1, Evertse's Theorem 7.14): DiophantineApproximationAndTranscendence.
- *The absolute and quantitative Subspace Theorem*: twisted heights, the absolute minima, the sharp
  Roth lemma through Faltings's product theorem, and the counts of Evertse–Schlickewei and
  Evertse–Ferretti (DiophantineApproximationAndTranscendence §§2.5–2.8), with their applications to the
  complexity of algebraic numbers (Bugeaud–Evertse 2008). Layer 9 is the elementary half, in the
  language of systems of inequalities, and 6.1 is the parametric statement those counts strengthen.
- *Effective methods*: Baker's theory, effective unit and Thue equations, the hypergeometric method
  (DiophantineApproximationAndTranscendence Layers 3–4). Every finiteness theorem here is ineffective
  in the height, and no statement bounds a height.
- *Function fields*: the Subspace Theorem fails in positive characteristic (Bombieri–Gubler 6.2.8).
  Everything from Layer 2 on is a number-field statement.
- *Siegel's theorem on integral points on curves* by the Corvaja–Zannier method: 6.4 is stated so that
  [AlgebraicCurves](../AlgebraicCurves/README.md) or [EllipticCurves](../EllipticCurves/README.md) can
  consume it; the curve-side argument is not here.
- *Tori and the Mordell–Lang circle*: Laurent's theorem, unit equations over arbitrary fields of
  characteristic zero by specialization, linear recurrences and Skolem–Mahler–Lech
  (DiophantineApproximationAndTranscendence §2.4).
- *Automatic sequences*: 7.2 and 7.3 take an arbitrary sequence of digits; that the digits of an
  automatic sequence satisfy their hypotheses needs Cobham's theorem, which no roadmap builds.
- Beyond this roadmap, each a roadmap of its own or part of one, and not to be attempted from this
  one: the absolute and quantitative Subspace Theorem with polynomial dependence on `δ⁻¹` (Evertse
  1995's sharp Roth lemma through Faltings's product theorem, the absolute Minkowski theorem of
  Roy–Thunder and Zhang; DiophantineApproximationAndTranscendence §§2.5–2.8) and its applications to the
  complexity of algebraic numbers (Bugeaud–Evertse 2008); Vojta's exceptional subspace
  (DiophantineApproximationAndTranscendence §2.1); the Faltings–Wüstholz theorem for forms of higher
  degree; the Subspace Theorem with moving targets (Ru–Vojta); the uniform bounds for unit equations of
  Evertse–Schlickewei–Schmidt and Beukers–Schlickewei; Laurent's theorem and the Mordell–Lang circle for
  tori; Siegel's theorem by the Corvaja–Zannier method; the existence of `T`-numbers; and every
  effective statement.

## Exact supplier contracts

### From Mathlib

- *Heights* (`Mathlib/NumberTheory/Height/`): `Height.AdmissibleAbsValues`, `Height.mulHeight`,
  `Height.mulHeight₁`, `Height.logHeight`, `NumberField.mulHeight_eq`, `NumberField.mulHeight₁_eq`,
  `NumberField.totalWeight_eq_finrank`, `Height.mulHeight_fun_prod_eq`, `Height.mulHeight_comp_le`,
  `Height.mulHeight₁_sub_le` (the `2`-factor bound for a difference), `Height.mulHeight₁_inv`,
  `Rat.mulHeight₁_eq_max`, `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`, `Projectivization.mulHeight`, the
  `Northcott` class and `NumberField.finite_setOfPred_mulHeight₁_le`.
- *Diophantine approximation*: Dirichlet and Legendre in `Mathlib/NumberTheory/DiophantineApproximation/`,
  `LiouvilleWith` with its affine API, `liouvilleWith_one`, `Liouville`,
  `Liouville.exists_pos_real_of_irrational_root`.
- *Places*: `NumberField.InfinitePlace` with `NumberField.InfinitePlace.mult`, `comap`,
  `NumberField.InfinitePlace.LiesOver`, `NumberField.InfinitePlace.exists_smul_eq_of_comap_eq`,
  `NumberField.InfinitePlace.mult_comap_le`, `NumberField.InfinitePlace.inertiaDeg`,
  `NumberField.InfinitePlace.sum_inertiaDeg_eq_finrank`, `NumberField.InfinitePlace.mult_mul_finrank`,
  `NumberField.InfinitePlace.prod_eq_abs_norm`; `NumberField.FinitePlace` with
  `NumberField.FinitePlace.mk`, `NumberField.FinitePlace.maximalIdeal`,
  `NumberField.FinitePlace.maximalIdeal_inj`, `NumberField.FinitePlace.equivHeightOneSpectrum` and
  `NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap`; `NumberField.prod_abs_eq_one`;
  over `ℚ`, `Rat.AbsoluteValue.real`, `Rat.AbsoluteValue.padic` and
  `Rat.AbsoluteValue.equiv_real_or_padic`.
- *Absolute values*: `AbsoluteValue.under`, `AbsoluteValue.LiesOver`, `AbsoluteValue.IsEquiv`,
  `AbsoluteValue.isEquiv_of_lt_one_imp`, `AbsoluteValue.isEquiv_iff_exists_rpow_eq`, Gelfand–Mazur
  `NormedAlgebra.Real.nonempty_algEquiv_or`, `NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal`
  and `NumberField.InfinitePlace.Completion.ringEquivComplexOfIsComplex`, `Real.rpow_add_le_add_rpow`.
- *`S`-integers and `S`-units*: `Set.integer`, `Set.unit`, `Set.unitEquivUnitsInteger`;
  `ClassGroup.mk0_surjective`, `Ideal.finite_factors`,
  `IsDedekindDomain.HeightOneSpectrum.exists_primeCompl_mul_eq_of_integer`,
  `IsDedekindDomain.HeightOneSpectrum.valuationOfNeZero`, `Ideal.exists_comap_galRestrict_eq`.
- *Polynomials*: `Polynomial.hasseDeriv`, `Polynomial.taylor`, `Polynomial.homogenize` (with
  `G(x, 1) = g(x)`), `Polynomial.supNorm`, `Polynomial.rootMultiplicity`, `Polynomial.gaussNorm`,
  `Polynomial.reflect`, `Polynomial.scaleRoots`, `Polynomial.discr`,
  `Polynomial.mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`,
  `Polynomial.supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`,
  `MvPolynomial.IsWeightedHomogeneous`, `MvPolynomial.finSuccEquiv`, `MvPolynomial.divMonomial`,
  `MvPolynomial.modMonomial`.
- *Linear and exterior algebra*: `⋀[R]^n M`, `exteriorPower.ιMulti`, `Module.Basis.exteriorPower`,
  `Module.Basis.extendLe`, `RingHom.map_det`, `LinearMap.det_restrictScalars`, `Matrix.det_le`,
  `Set.powersetCard`, `Submodule.comap_dualAnnihilator_eq_orthogonalBilin`.
- *Geometry of numbers*: `ZLattice`, `ZLattice.covolume`, `ZLattice.covolume_comap`,
  `NumberField.mixedEmbedding` with `NumberField.mixedEmbedding.latticeBasis_repr_apply`,
  `NumberField.integralBasis`, `ZSpan.fract`, `Int.Matrix.exists_ne_zero_int_vec_norm_le`,
  `ConvexBody`.
- *Analysis and combinatorics*: `MeasureTheory.integral_fintype_prod_volume_eq_pow`,
  `MeasureTheory.Measure.addHaar_smul`, `Asymptotics.IsLittleO`, `OnePoint`, `Real.ofDigits` with
  `Real.abs_ofDigits_sub_ofDigits_le`, `Set.ncard`, `Set.injOn_of_ncard_image_eq`,
  `Relation.ReflTransGen`, `Finset.card_finsuppAntidiag_nat_eq_choose`,
  `exists_associated_pow_of_mul_eq_pow'`, `Subgroup.finiteIndex_range_powMonoidHom_of_fg`,
  `padicNorm`, `round_le`, `AlgebraicIndependent`, `Transcendental`.

### From Tau Ceti

All the declarations below are proved at the pin; paths are under `TauCeti/`.
- *Places over places* (`NumberTheory/NumberField/PlacesOver/`, `Analysis/AbsoluteValue/`): the
  declarations of the 0.1 and 0.2 rows of the table in Scope and ownership, with
  `AbsoluteValue.isNonarchimedean_of_liesOver` and `NumberField.InfinitePlace.not_isNonarchimedean`;
  `w` is assumed to lie over the place in the sense of `AbsoluteValue.LiesOver`.
- *The `S`-adic dictionary and the fundamental inequality* (`NumberTheory/Height/Primitive.lean`,
  `NumberTheory/Height/SInteger.lean`, `NumberTheory/Height/FundamentalInequality.lean`,
  `RingTheory/DedekindDomain/SInteger/`): the declarations of the 0.3 and 0.4 rows, with
  `Set.IsPrimitive`, `NumberField.mulHeight_eq_prod_of_isPrimitive`,
  `NumberField.inv_mulHeight₁_le_prod_min_one_apply`, the one-place bounds
  `NumberField.InfinitePlace.inv_mulHeight₁_le_min_one_apply`,
  `NumberField.FinitePlace.inv_mulHeight₁_le_min_one_apply`,
  `NumberField.InfinitePlace.max_apply_one_le_mulHeight₁`,
  `NumberField.FinitePlace.max_apply_one_le_mulHeight₁`, and over a finite extension
  `NumberField.inv_mulHeight₁_le_prod_min_one_apply_of_liesOver`, `NumberField.mulHeight₁_algebraMap`;
  `x ≠ 0` and `[Finite ι]` where stated.
- *Places and heights of HeightsAndUnits and GlobalNumberFields*: `TauCeti.GlobalNumberFields.Place`,
  `TauCeti.GlobalNumberFields.normalizedAbsValue`,
  `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`,
  `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_inl_algebraMap`,
  `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_inr_algebraMap`,
  `TauCeti.GlobalNumberFields.abs_log_normalizedAbsValue_le_logHeight₁`,
  `TauCeti.GlobalNumberFields.sum_log_adicAbv_add_sum_mult_mul_log_eq_zero`,
  `NumberField.InfinitePlace.sum_mult_eq_mult_mul_finrank`, `NumberField.InfinitePlace.prod_comap_pow_mult`;
  `Height.mulHeightAff`, `Height.mulHeight₁_sum_mul_le`, `Matrix.mulHeight₁_det_le`,
  `Matrix.logHeight₁_det_le`; `Projectivization.instNorthcottMulHeight`,
  `Submodule.instNorthcottRelativeSubspaceHeight`; `Set.mem_integer_iff_finitePlace`,
  `Set.mem_unit_iff_finitePlace`, `Set.unit_fg`, `IsDedekindDomain.subsingleton_integer_classGroup_iff`,
  `IsDedekindDomain.HeightOneSpectrum.primesAbove`, `IsDedekindDomain.HeightOneSpectrum.primesAbove_finite`;
  the `S`-unit lattice `TauCeti.NumberField.SUnit.unitLattice` (a full lattice);
  `NumberField.FinitePlace.exists_ne_zero_forall_mul_apply_le`; `TauCeti.house`.
- *Exponents* (`NumberTheory/DiophantineApproximation/`): `TauCeti.irrationalityExponent`,
  `TauCeti.linearFormExponent`, `TauCeti.mahlerExponent`, `TauCeti.algebraicApproximationExponent` (all
  `ℝ≥0∞`-valued, Koksma's with complex approximants and the naive height), with
  `TauCeti.natCast_le_mahlerExponent`, `TauCeti.algebraicApproximationExponent_le_mahlerExponent`,
  `TauCeti.algebraicApproximationExponent_one_add`, `TauCeti.mahlerExponent_one_add_one`,
  `TauCeti.mahlerExponent_mono`, `TauCeti.linearFormExponent_eq_top_iff`, and the 1.1 and 1.2 rows;
  `Polynomial.mulHeight_mulHeight_le_two_pow_mul_mulHeight` (Gelfond),
  `TauCeti.primitiveMinpoly_eq_of_irreducible`,
  `TauCeti.naiveHeight`; Roth over `ℚ`: `IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`,
  `IsAlgebraic.not_liouvilleWith`, `IsAlgebraic.irrationalityExponent_eq_two`.
- *The Roth machinery* (`RingTheory/MvPolynomial/`, `Algebra/MvPolynomial/HasseDeriv/`,
  `NumberTheory/Height/MvPolynomial.lean`): `MvPolynomial.hasseDeriv`, `MvPolynomial.weightedIndex`
  (weights `r : σ → ℕ`, value in `ℝ≥0∞`, `⊤` at `0`), `MvPolynomial.eval_add_eq_finsum_hasseDeriv`,
  `MvPolynomial.logHeight`, `TauCeti.weightedIndex_le_of_logHeight_le` (Roth's lemma over a number
  field, relative heights), `MvPolynomial.linearSubst`, `TauCeti.dehomogenize`,
  `MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm`,
  `TauCeti.exists_roth_auxiliary_polynomial`,
  the 2.2 row, and the local value bounds of the 3.2 row.
- *Volumes* (`MeasureTheory/Measure/Lebesgue/SimplexVolume/`, `Analysis/SpecialFunctions/Hyperbolic.lean`):
  the 2.1 row, with `TauCeti.simplexVolume_pos`, `TauCeti.simplexVolume_eq_one_of_le`,
  `TauCeti.simplexVolume_eq_zero_of_neg`; the lattice upper bound assumes `0 < t` and every `0 < d j`.
- *Approximation classes and the approximation product*: the 3.1, 3.3 and 3.4 rows, with
  `TauCeti.logProfile`, `TauCeti.IsHeightIndependent.injective`; `approxProd` assumes nothing of `w`, and
  its invariance assumes `w v` over `v` at every place it reads.
- *Geometry of numbers* (`NumberTheory/DiophantineApproximation/Subspace/ApproximationDomain.lean`,
  `NumberTheory/NumberField/FinitePlace/ValueFloor.lean`, `RingTheory/DedekindDomain/PseudoBasis.lean`,
  `NumberTheory/NumberField/CanonicalEmbedding/`, `Algebra/Module/ZLattice/SuccessiveMinima.lean`,
  `NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`): the 4.1 row, with
  `TauCeti.NumberField.fg_approxModule`, `TauCeti.NumberField.span_approxModule_eq_top`,
  `TauCeti.NumberField.isCompact_approxBody`, `NumberField.FinitePlace.apply_le_iff_le_floorValue`,
  `NumberField.FinitePlace.lt_absNorm_mul_floorValue`, `Submodule.covolume_mixedImage_of_pseudoBasis`,
  `Submodule.isZLattice_mixedImage` (with a spanning hypothesis); `ZLattice.successiveMin` (indexed from
  `0`, for a `ConvexBody`), `ZLattice.exists_linearIndependent_gauge_eq_successiveMin` (SuccessiveMinima
  §1.5), `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` and
  `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measure` (SuccessiveMinima
  §2.1, the body symmetric with `0` in its interior); `TauCeti.exists_linearIndependent_comp_finrank_mul`.
- *Evertse's lemma and exterior powers*: the 4.4 and 4.5 rows, with `TauCeti.plucker`,
  `TauCeti.det_mul_transpose_eq_sum_plucker_mul`, `TauCeti.wedgeForms_plucker`,
  `TauCeti.exists_plucker_eq_mul_plucker_compl_or_eq_neg`, `AbsoluteValue.plucker_le_prod_iSup`,
  `TauCeti.sum_norm_plucker_sq_le`, `Submodule.relativeSubspaceHeight`, `Submodule.relativePluckerPoint`,
  `LinearIndependent.exists_sum_smul_eq_proj`, `Finset.prod_le_finprod_of_one_le₀`,
  `Finset.finprod_le_prod_of_le_one₀`; the constant of Evertse's lemma depends only on `K` and the
  dimension.
- *Multihomogeneous algebra*: the 5.2 and 5.3 rows; `MvPolynomial.coeff_blockSubst_hasseDeriv_eq_zero`
  assumes only that the determinant is a unit.
- *General position and unit equations*: `TauCeti.InGeneralPosition`, `TauCeti.IsNondegenerateSolution`,
  `TauCeti.IsNondegenerateHomogeneousSolution`;
  `MvPolynomial.IsHomogeneous.finite_setOf_eval_eq_of_three_le_card_roots`.
- *Gram–Hadamard* (SuccessiveMinima §0.1, target 0.1.2): `Matrix.det_gram_le_prod_norm_sq`.
- *The other roadmaps' targets this roadmap consumes, as Tau Ceti states them*:
  `MvPolynomial.hasseDeriv_comp`, `MvPolynomial.hasseDeriv_mul`, `MvPolynomial.coeff_taylor`,
  `MvPolynomial.abv_coeff_hasseDeriv_le` (and its nonarchimedean form without the factor `2^|m + d|`);
  `MvPolynomial.weightedIndex_mul`, `MvPolynomial.weightedIndex_eq_top_iff`,
  `MvPolynomial.weightedIndex_le_weightedIndex_hasseDeriv_add`, `MvPolynomial.weightedIndex_rename`,
  `MvPolynomial.weightedIndex_toMvPolynomial`, `MvPolynomial.weightedIndex_le_sum_degreeOf`;
  `MvPolynomial.genWronskian` with `MvPolynomial.linearIndependent_iff_exists_genWronskian_ne_zero`, and
  `Polynomial.hasseWronskian`; `MvPolynomial.taylor`, `MvPolynomial.orderAt`,
  `MvPolynomial.exists_aeval_pderiv_linearSubst_ne_zero`, the Kronecker substitution
  `Finsupp.exists_injOn_weight`; `MvPolynomial.logHeight_mul_of_disjoint_vars`,
  `MvPolynomial.logHeight_det_hasseDeriv_le`, `MvPolynomial.exists_sum_mul_linearIndependent`,
  `MvPolynomial.det_hasseDeriv_sum_mul_toMvPolynomial`,
  `MvPolynomial.hasseDeriv_aeval_blockLinearForm_hasseDeriv`,
  `MvPolynomial.degreeOf_aeval_blockLinearForm_le`; `TauCeti.absoluteProjectiveTupleHeight` with
  `TauCeti.absoluteProjectiveTupleHeight_eq`, `NumberField.mulHeight_algebraMap`,
  `NumberField.absMulHeight₁_eq_rpow`, `TauCeti.mahlerMeasure_eq_absMulHeight₁_pow`,
  `TauCeti.finite_setOf_absMulHeight₁_le`, `NumberField.absMulHeight₁_eq_one_iff` (Kronecker),
  `Polynomial.mulHeight`, `MvPolynomial.mulHeight`, `Polynomial.mulHeight_mul_le`,
  `Polynomial.rootMultiplicity_mul_logHeight₁_le`, `MvPolynomial.weightedIndex_toMvPolynomial_le`;
  `NumberField.mulHeight₁_eq_of_mem_integer`, `NumberField.mulHeight₁_eq_iff_mem_integer`,
  `NumberField.FinitePlace.mk_apply_le_one_iff`; `IsDedekindDomain.integerHeightOneSpectrumEquiv`,
  `IsDedekindDomain.integerClassGroupEquiv`, `IsDedekindDomain.finite_integer_classGroup`,
  `Set.mem_integer_empty_iff`, `Set.mem_unit_empty_iff`, `Set.unitValuation`,
  `TauCeti.finrank_sUnits_numberField`; `TauCeti.NumberField.SUnit.logEmbedding`,
  `TauCeti.NumberField.SUnit.fundSystem`, `TauCeti.NumberField.SUnit.exist_unique_eq_mul_prod`,
  `TauCeti.fullUnitLattice`; `NumberField.InfinitePlace.mem_placesOver`;
  `NumberField.exists_ne_zero_int_vec_abs_le_of_house_le`; `TauCeti.BadlyApproximable`,
  `TauCeti.irrationalityExponent_add_ratCast`, `Rat.AbsoluteValue.IsStandard`,
  `AbsoluteValue.IsEquiv.eq_of_isStandard`; `TauCeti.primitiveMinpoly`, `TauCeti.card_le_linearFormExponent`;
  `TauCeti.inGeneralPosition_iff_det_ne_zero`, `TauCeti.inGeneralPosition_coords_add_sum`,
  `TauCeti.InGeneralPosition.map`; `Submodule.relativeSubspaceHeight_euclideanDual`,
  `Submodule.relativeSubspaceArakelovHeight`, `Submodule.subspaceHeight`,
  `Submodule.subspaceHeight_euclideanDual`, `Submodule.finite_subspaceHeight_le`,
  `Submodule.subspaceHeight_le_prod`, `TauCeti.height2`, `TauCeti.arakelovMulHeight`.
- `Rat.mulHeight_le_max_abs` (the height of a nonzero integer point is at most its sup norm).

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

Consumed as stated there, by section:
- §2.1: the theorem on one linear form at integer points, `finite_small_linear_form` (Evertse's lecture
  notes, Theorem 7.7: for algebraic `α_i` and `C, δ > 0`, finitely many integer `x` with
  `0 < |∑ α_i x_i| ≤ C ‖x‖^(1−n−δ)`), consumed by 7.1; and `finite_approximation_bounded_degree`
  (Theorem 7.8), consumed by 7.1 as stated.
- §2.5: the duality `relativeSubspaceHeight_dualAnnihilator`, the relative height of the transported
  annihilator of a subspace equals that of the subspace, from Mathlib's
  `Submodule.comap_dualAnnihilator_eq_orthogonalBilin` and Tau Ceti's
  `Submodule.relativeSubspaceHeight_euclideanDual`.
- §2.6: the integer grid lemma `exists_rectangular_int_grid_jet` and its block form
  `exists_nonzero_block_grid_jet_of_restriction`, consumed by 5.5.
- §2.8: the fixed-field Siegel lemma `exists_ne_zero_height2_le`, the kernel bases `siegelKernelBasis`
  and `siegelRelativeKernelBasis`, and the coefficient conditions `siegelCoefficientConditions`, consumed
  by 2.2 and 5.2.
- The instances in Scope and ownership, which this roadmap's milestones specialize to or discharge.

## References

- E. Bombieri and W. Gubler, *Heights in Diophantine Geometry*, Cambridge New Mathematical Monographs
  4, 2006. Cited for: §1.3 extensions of absolute values; §1.5 the fundamental and Liouville
  inequalities; Chapter 5 the unit equation, Thue–Mahler and the hyperelliptic equation; Chapter 6
  Roth's theorem and its proof (6.3–6.5); Chapter 7 the Subspace Theorem (7.2), its applications
  (7.3–7.4) and its proof (7.5); Appendix C.2.
- W. M. Schmidt, "Norm form equations", *Ann. of Math.* **96** (1972), 526–551; "Simultaneous
  approximation to algebraic numbers by rationals", *Acta Math.* **125** (1970), 189–201; *Diophantine
  Approximation*, LNM 785, Springer, 1980; *Diophantine Approximations and Diophantine Equations*,
  LNM 1467, Springer, 1991.
- H. P. Schlickewei, "The `p`-adic Thue–Siegel–Roth–Schmidt theorem", *Arch. Math.* **29** (1977),
  267–270; "`S`-unit equations over number fields", *Invent. Math.* **102** (1990), 95–107; "The
  quantitative Subspace Theorem for number fields", *Compositio Math.* **82** (1992), 245–273.
- J.-H. Evertse, "An improvement of the quantitative Subspace theorem", *Compositio Math.* **101**
  (1996), 225–311; "On the norm form inequality `|F(x)| ≤ h`", *Publ. Math. Debrecen* **56** (2000),
  337–374; "The Subspace Theorem of W. M. Schmidt", LNM 1566 (1993), 31–50; "On the Quantitative
  Subspace Theorem", *J. Math. Sci.* **171** (2010) (arXiv:1008.2268); "On sums of `S`-units and linear
  recurrences", *Compositio Math.* **53** (1984), 225–244; *Diophantine Approximation*, lecture notes
  for the Leiden/Mastermath course, 2019 edition, Chapter 7
  ([author's page](https://pub.math.leidenuniv.nl/~evertsejh/dio.shtml)).
- J.-H. Evertse and H. P. Schlickewei, "A quantitative version of the Absolute Subspace Theorem",
  *J. reine angew. Math.* **548** (2002), 21–127; J.-H. Evertse and R. G. Ferretti, "A further
  improvement of the Quantitative Subspace Theorem", *Ann. of Math.* **177** (2013), 513–590.
- K. F. Roth, "Rational approximations to algebraic numbers", *Mathematika* **2** (1955), 1–20;
  H. Davenport and K. F. Roth, *ibid.*, 160–167; D. Ridout, "The `p`-adic generalization of the
  Thue–Siegel–Roth theorem", *Mathematika* **5** (1958), 40–48; K. Mahler, "On the fractional parts of
  the powers of a rational number II", *Mathematika* **4** (1957), 122–124.
- Y. Bugeaud, *Approximation by Algebraic Numbers*, Cambridge Tracts in Mathematics 160, 2004;
  E. Wirsing, "Approximation mit algebraischen Zahlen beschränkten Grades", *J. reine angew. Math.*
  **206** (1961), 67–77.
- B. Adamczewski and Y. Bugeaud, "On the complexity of algebraic numbers I. Expansions in integer
  bases", *Ann. of Math.* **165** (2007), 547–565; B. Adamczewski, Y. Bugeaud and F. Luca, "Sur la
  complexité des nombres algébriques", *C. R. Acad. Sci. Paris* **339** (2004), 11–14; S. Ferenczi and
  C. Mauduit, "Transcendence of numbers with a low complexity expansion", *J. Number Theory* **67**
  (1997), 146–161; M. Morse and G. A. Hedlund, "Symbolic dynamics", *Amer. J. Math.* **60** (1938),
  815–866.
- J.-H. Evertse and K. Győry, *Unit Equations in Diophantine Number Theory*, Cambridge Studies in
  Advanced Mathematics 146, 2015.
- P. Corvaja and U. Zannier, "On the greatest prime factor of `(ab+1)(ac+1)`", *Proc. Amer. Math. Soc.*
  **131** (2003), 1705–1709; "A lower bound for the height of a rational function at `S`-unit points",
  *Monatsh. Math.* **144** (2005), 203–224; "On the general Thue's equation", *Amer. J. Math.* **126**
  (2004), 1033–1055; *Applications of Diophantine Approximation to Integral Points and Transcendence*,
  Cambridge Tracts in Mathematics 212, 2018. Y. Bugeaud, P. Corvaja and U. Zannier, "An upper bound for
  the G.C.D. of `a^n − 1` and `b^n − 1`", *Math. Z.* **243** (2003), 79–84.
- P. Vojta, *Diophantine Approximations and Value Distribution Theory*, LNM 1239, Springer, 1987.
