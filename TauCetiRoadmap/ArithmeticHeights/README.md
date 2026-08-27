# Roadmap: arithmetic heights and Siegel's lemma

A height measures the arithmetic complexity of an algebraic object, the way degree measures its
geometric complexity. Mathlib has the foundation: `Height.AdmissibleAbsValues`, the multiplicative
and logarithmic heights of a field element and of a tuple, the projective height, the instance for
number fields, and the Northcott property over a fixed number field. This roadmap builds the theory
that stands on that foundation and is missing everywhere in Lean: heights of **polynomials,
matrices, and linear subspaces**, the last through Schmidt's Plücker-coordinate height; the
**absolute** theory over `ℚ̄`, where Northcott's theorem and Kronecker's theorem live; and the two
theorems that heights of subspaces exist to state, **Siegel's lemma** and its invariant refinement
**Bombieri–Vaaler**.

"Done" means a contributor working on Diophantine approximation, transcendence, or Diophantine
geometry finds each object — the height of a number, of a polynomial, of a matrix, of a subspace —
at its natural generality with the full basic API, and finds Siegel's lemma as a consequence of a
developed theory rather than an isolated estimate. The subspace height is the hinge: it is what
makes Siegel's lemma invariant under row operations, it is what the duality theorem `H(V) = H(V^⊥)`
is about, and it is the object the Bombieri–Vaaler bound is stated in terms of.

Suggested home: `TauCeti/NumberTheory/Height/`, mirroring Mathlib's `Mathlib/NumberTheory/Height/`
(with `…/Height/Arakelov.lean`, `…/Northcott.lean`, `…/Polynomial.lean`, `…/Matrix.lean`,
`…/Plucker.lean`, `…/Subspace.lean`, `…/SiegelsLemma.lean`, `…/Units.lean`), and
`TauCeti/NumberTheory/GeometryOfNumbers/SuccessiveMinima.lean` beside the geometry-of-numbers
material the `EffectiveBounds` roadmap already built.

**Mathlib is developing the same foundation.** `Mathlib/NumberTheory/Height/` (M. Stoll) is the
active substrate this roadmap consumes, and two of its open pull requests cover ground named below:
[mathlib4#41606](https://github.com/leanprover-community/mathlib4/pull/41606) is Layer 0's
extension-invariance material and
[mathlib4#40791](https://github.com/leanprover-community/mathlib4/pull/40791) is Layer 6's S-unit
theorem. Neither is a reason to wait or to leave a gap: build both here, named and shaped the way
those PRs do, so that adopting Mathlib's is a deletion plus an import. See *[Relationship to
Mathlib's height work](#relationship-to-mathlibs-height-work)*.

## Scope and boundaries

### Owned here

- The **Arakelov (ℓ²-at-infinity) height** beside Mathlib's sup-norm height, and the comparison
  between them, without which the constants in the literature cannot be stated.
- The **absolute height of a tuple** over `ℚ̄` and **invariance under field extension**.
- **Northcott's theorem** in its bounded-degree form, **Kronecker's theorem**, and the identity
  relating the absolute height to the Mahler measure of the minimal polynomial.
- Heights of **polynomials** (Gauss's lemma and Gelfond's inequality), of **linear forms**, and of
  **matrices**.
- The **Plücker point** of a subspace and **Schmidt's height of a subspace**, with the four theorems
  that make it an object rather than a definition: the **Cauchy–Binet identity** computing it as a
  determinant, the **duality theorem** `H(V) = H(V^⊥)`, **submodularity** over the subspace lattice,
  and monotonicity in subspaces of a fixed basis.
- **Successive minima**, **Minkowski's second theorem**, and the two lemmas that turn their
  real-lattice output into number-field statements: the **extraction lemma** and **Vaaler's
  cube-slicing theorem**.
- **Siegel's lemma** in height form, over `ℤ` and over a number field, and the **Bombieri–Vaaler**
  refinement — the summit.
- The dictionary between heights and the **unit group**: units of height one, and the **S-unit
  theorem**.

### Consumed

- All of `Mathlib/NumberTheory/Height/` and `Mathlib/Order/Northcott.lean`. Every object below is
  defined in terms of Mathlib's `Height.mulHeight`, and none of it is restated.
- Mathlib's places, product formula, Dirichlet unit theorem and regulator, Mahler measure, exterior
  powers, and geometry of numbers; itemised under *[What Mathlib already
  has](#what-mathlib-already-has-consume)*.
- `TauCeti/NumberTheory/GeometryOfNumbers/` and `TauCeti/NumberTheory/EffectiveBounds/`, the library
  the completed [`EffectiveBounds`](../../Completed/EffectiveBounds/README.md) roadmap built — in
  particular its lattice-point engine, which Layer 4 extends to successive minima, and its explicit
  discriminant bounds, which make the Bombieri–Vaaler constant computable in examples.

### Not owned here

- **Canonical and naïve heights on elliptic curves** — the naïve `x`-height, the approximate
  parallelogram law, the Néron–Tate height, its bilinear pairing and the elliptic regulator, and
  Mordell–Weil. These are Layer 6 of the [`EllipticCurves`](../EllipticCurves/README.md) roadmap,
  which consumes the general height API directly from Mathlib. Nothing here duplicates them, and
  Layer 1's Northcott material is stated so that roadmap can consume it.
- **Effective discriminant, class-number, and regulator bounds**, the explicit ideal count, and
  effective Hermite–Minkowski: the completed
  [`EffectiveBounds`](../../Completed/EffectiveBounds/README.md) roadmap.
- **Function-field heights** and the Riemann–Roch theory behind them:
  [`AlgebraicCurves`](../AlgebraicCurves/README.md). Mathlib's `Height.AdmissibleAbsValues` is
  general enough to carry them, and Layers 0–3 are written against that class wherever the proof
  does not need a number field, so the function-field instance costs nothing here; but supplying
  that instance and its divisor theory belongs there.
- **Dirichlet's unit theorem itself**, which Mathlib proves in full. Layer 6 consumes it.
- **Diophantine approximation proper** — Roth's theorem, the Schmidt subspace theorem, unit
  equations. See *[Long horizon](#long-horizon-a-roadmap-for-a-roadmap-not-work-to-attempt-here)*.

## Standing hypotheses

Work over a field `K` with `[Height.AdmissibleAbsValues K]` wherever the mathematics allows it, and
over a number field (`[NumberField K]`, degree `d = [K : ℚ]`, `r₁` real and `r₂` complex places,
discriminant `NumberField.discr K`) only where the proof genuinely needs one. Layers 0–3 are stated
at `AdmissibleAbsValues` generality except where an archimedean place, the degree, or the
discriminant appears; Layers 4 and 5 are number-field statements throughout, because Minkowski's
theorem is.

Tuples are indexed by an arbitrary `[Finite ι]` (`[Fintype ι]` where a cardinality appears in a
bound), following Mathlib's `Height.mulHeight (x : ι → K)`, never by `Fin n` alone. Subspaces are
`Submodule K (ι → K)` with a `Module.finrank` hypothesis, never `Module.Grassmannian`: Mathlib's
`Module.Grassmannian` is the *quotient* convention and records recovering the subspace convention as
its own TODO, so a roadmap that indexed subspace heights by it would be building on an object that
does not yet mean what we need. Reconcile with it if and when that TODO is discharged.

## Pinned conventions

Decide these once; an implementor who guesses differently produces a library that cannot be composed
with Mathlib's.

| Question | Convention |
| --- | --- |
| multiplicative or logarithmic | **Both**, for every owned object, with the multiplicative one primary and `logX := Real.log (mulX)` — exactly Mathlib's arrangement and for the reason its module docstring gives: the duplication is in statements only, since each logarithmic proof reduces to the multiplicative one. Never define a logarithmic height independently. |
| relative or absolute | **Both, distinguished by name.** Over a fixed `K`, `Height.mulHeight` is the *relative* height, which is the `[K : ℚ]`-th power of the absolute one; the absolute height carries the `abs` prefix, following Mathlib's `NumberField.absMulHeight₁`. Never divide by the degree inside a definition stated over a fixed `K`. |
| the local factor at a place | `⨆ i, v (x i)`, an `iSup` over the index type, as in Mathlib's `NumberField.mulHeight_eq`; archimedean places carry the weight `InfinitePlace.mult`. Not `Finset.sup'`, not a fold over a list. |
| a name for the local sup norm | **None.** `⨆ i, v (x i)` is written out. Mathlib has no such predicate and we do not add one; a one-line expression does not get a wrapper that would then need its own theory. |
| relative or absolute, in the literature | Bombieri–Gubler's `h` and `h_Ar` are **absolute** (their local exponent is `[F_w : ℚ_p] / [F : ℚ]`, 2.8.1–2.8.2). Mathlib's `Height.mulHeight` is **relative**. Every citation below says which, and every theorem transcribed from the book is stated with the `abs`-prefixed height unless it is explicitly renormalized. |
| the archimedean norm | Mathlib's height uses the **sup norm at every place**. The literature's Siegel-lemma constants are stated for the **Arakelov height**, which uses the ℓ² norm at archimedean places. Both exist here, `Height.mulHeight` (Mathlib's, primary) and `NumberField.arakelovMulHeight` (Layer 0), related by a named comparison lemma. Every bound says which one it is in. |
| junk values | `mulHeight 0 = 1` and `logHeight 0 = 0`, as in Mathlib; `absMulHeight₁` is `1` on a transcendental. No `⊥`, no `Option`, no `WithTop`. Every theorem whose content fails at the junk value carries the hypothesis that rules it out (`x ≠ 0`, `IsAlgebraic ℚ x`), rather than a different definition. |
| declaration names | **Statement-named, as Mathlib names things**: `polyMulHeight_mul_le`, `exists_basis_prod_absMulHeight_le`. The person's name — Siegel, Bombieri–Vaaler, Northcott, Kronecker, Gauss, Gelfond, Schmidt, Minkowski — goes in the docstring, never in the identifier. The exception Mathlib itself makes is a name that *is* the standard name of an object rather than of a theorem, such as `Northcott` the typeclass or `mahlerMeasure`. |
| the height of a subspace | `Submodule.mulHeight V := Projectivization.mulHeight V.pluckerPoint`, the height of the Plücker point, following Schmidt. Plücker coordinates are indexed by `Set.powersetCard ι k`, the type of `k`-element `Finset`s, matching `Module.Basis.exteriorPower`, **not** by strictly monotone `Fin k → ι` and not by a lexicographic list. |
| the height of a matrix | `Matrix.mulHeight A` is the height of the tuple of **entries**. The height of the row space — `H(A)` in Bombieri–Vaaler, the height of the tuple of maximal **minors** — is `Submodule.mulHeight (rowSpace A)` and never called the height of `A`. The two are different numbers and the classical literature uses one symbol for both; we do not. |
| duality | `V^⊥` is the **annihilator in the dual**, `Submodule.dualAnnihilator`, transported back to `ι → K` along the standard basis — the carrier of Bombieri–Gubler Proposition 2.8.10 and the one Mathlib's `ExteriorPower/Pairing.lean` substrate is written for. The orthogonal-complement form for `∑ i, x i * y i` is a derived corollary. |
| `S` for S-units | `S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))`, **finite places only**, with the infinite places always implicitly present — matching `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` and mathlib4#40791, whose rank formula `(r₁ + r₂ - 1) + |S|` fixes this reading. ⚠ Bombieri–Gubler 1.5.10 takes the opposite convention, `S ⊆ M_K` **including** all archimedean places, and so states the rank as `\|S\| - 1` (Theorem 1.5.13). The two agree, since `\|S_BG\| = r₁ + r₂ + \|S\|`; a contributor reading the book must translate, and every statement here says which convention it is in. |

## What Mathlib already has (consume)

This roadmap sits directly on `Mathlib/NumberTheory/Height/`; read that tree before writing
anything. **Reuse these by name; do not rebuild them.**

- **The height framework.** `Height.AdmissibleAbsValues` (a `Multiset` of archimedean and a `Set` of
  nonarchimedean absolute values, finite support, and the product formula), `Height.totalWeight`,
  `Height.mulHeight₁`/`logHeight₁` for a field element, `Height.mulHeight`/`logHeight` for a tuple,
  `Finsupp.mulHeight`, and the full basic API around them: scaling invariance
  (`mulHeight_smul_eq_mulHeight`), `one_le_mulHeight`, behaviour under `Equiv` and under reindexing,
  powers, inverses, products and sums (`mulHeight₁_mul_le`, `mulHeight₁_sum_le`), and `positivity`
  extensions.
- **The projective height.** `Projectivization.mulHeight`/`logHeight`, defined by `lift` from a
  representative tuple, with its own `positivity` extensions.
- **The number-field instance.** `NumberField.instAdmissibleAbsValues`, built from
  `multisetInfinitePlace` (infinite places with multiplicity `InfinitePlace.mult`) and
  `{v | IsFinitePlace v}`; `NumberField.mulHeight_eq`, which is exactly the classical local formula
  `∏_{v | ∞} (⨆ i, v (xᵢ))^{mult v} · ∏ᶠ_{v ∤ ∞} ⨆ i, v (xᵢ)`; `totalWeight_eq_finrank`; and
  `absNorm_mul_finprod_finitePlace_eq_one`, which identifies the finite part of the height of an
  integral tuple with the absolute norm of the ideal it generates.
- **The absolute height of an element.** `NumberField.absMulHeight₁`/`absLogHeight₁`, defined for
  any `[CharZero K]` through `ℚ⟮x⟯`, with the junk value `1` off the algebraic numbers.
- **Northcott.** The `Northcott` typeclass (`Mathlib/Order/Northcott.lean`, T. Browning) with
  `Northcott.exists_min_image` and `Northcott.comp_of_bddAbove`;
  `NumberField.finite_setOfPred_mulHeight₁_le` and the instances `Northcott (mulHeight₁ (K := K))`,
  `Northcott (logHeight₁ (K := K))`.
- **Heights over `ℚ`.** `Rat.mulHeight₁_eq_max` (`mulHeight₁ q = max |q.num| q.den`),
  `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`, `Rat.mulHeight₁_natCast`.
- **Linear and polynomial maps.** `Height.mulHeight_linearMap_apply_le`, and the two-sided bounds
  `Height.mulHeight_eval_le`/`mulHeight_eval_ge` for a family of homogeneous polynomials of equal
  degree, with `Height.mulHeightBound` as the coefficient bound.
- **Mahler measure.** `Polynomial.mahlerMeasure`/`logMahlerMeasure` over `ℂ`
  (`Mathlib/Analysis/Polynomial/MahlerMeasure.lean`) with multiplicativity `mahlerMeasure_mul` and
  the Jensen formula `logMahlerMeasure_eq_log_leadingCoeff_add_sum_log_roots`; and over `ℤ`
  (`Mathlib/NumberTheory/MahlerMeasure.lean`, F. Barroero) Northcott for the Mahler measure
  (`finite_mahlerMeasure_le`) and the Kronecker statement for polynomials
  (`pow_eq_one_of_mahlerMeasure_eq_one`, `isPrimitiveRoot_of_mahlerMeasure_eq_one`).
- **Siegel's lemma over `ℤ`.** `Int.Matrix.exists_ne_zero_int_vec_norm_le` (F. Barroero, L. Capuano,
  A. Turchet): for a nonzero `m × n` integer matrix `A` with `m < n`, a nonzero integer solution of
  `A x = 0` with `‖x‖ ≤ (n · max 1 ‖A‖)^{m/(n−m)}` in the sup norm.
- **The unit theorem, in full.** `NumberField.Units.logEmbedding`, `unitLattice`,
  `unitLattice_span_eq_top`, `unitLattice_rank`, `rank`, `finrank_eq`, `basisModTorsion`,
  `fundSystem`, `exist_unique_eq_mul_prod`, `closure_fundSystem_sup_torsion_eq_top`,
  `logEmbedding_ker` (the kernel is the torsion subgroup), and `NumberField.Units.regulator` as the
  covolume of the unit lattice. **Layer 6 consumes all of this and re-proves none of it.**
- **Places and the product formula.** `NumberField.InfinitePlace` with `mult`,
  `NumberField.FinitePlace`, `IsInfinitePlace`/`IsFinitePlace`, and `NumberField.prod_abs_eq_one`.
- **Exterior powers.** `⋀[R]^n M`, `exteriorPower.ιMulti`, `exteriorPower.map`, the pairing with the
  dual (`ExteriorPower/Pairing.lean`), and — the one Layer 3 is built on —
  `Module.Basis.exteriorPower : Basis (Set.powersetCard I n) R (⋀[R]^n M)` with its `basis_apply`,
  `basis_repr` and `coe_basis` API.
- **Geometry of numbers.** `ZLattice`, `ZLattice.covolume`,
  `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (Minkowski's
  convex-body theorem), `NumberField.mixedEmbedding` with the convex bodies and
  `NumberField.mixedEmbedding.volume_fundamentalDomain_latticeBasis` around it, and
  `NumberField.discr`.

## What is missing (build here)

Nothing above gives: the Arakelov normalization or its comparison with the sup-norm height; the
absolute height of a *tuple*; invariance under field extension; Northcott's theorem for varying
degree; Kronecker's theorem for the height (as opposed to for the Mahler measure); the height of a
polynomial, of a matrix, or of a subspace; Plücker coordinates as an arithmetic object; successive
minima, Minkowski's second theorem, the extraction lemma, or the cube-slicing bound; Siegel's
lemma over a number field or in the invariant Bombieri–Vaaler form; or S-units. `Suggested.lean`
pins the signatures most likely to drift.

## The build, in layers

### Layer 0: normalizations and the extension dictionary

The layer that makes every later constant meaningful.

**0.1 The Arakelov height.** For a number field `K` define
`NumberField.arakelovMulHeight (x : ι → K)` as
`(∏ v : InfinitePlace K, (∑ i, v (x i) ^ 2) ^ (v.mult / 2 : ℝ)) * ∏ᶠ v : FinitePlace K, ⨆ i, v (x i)`,
with `arakelovLogHeight` its logarithm and `arakelovMulHeight₁` the one-variable case. Prove the
same basic API Mathlib proves for `mulHeight`: scaling invariance under `Kˣ`, hence a well-defined
descent to `Projectivization`; `1 ≤ arakelovMulHeight`; invariance under reindexing.

**0.2 The comparison.** `mulHeight x ≤ arakelovMulHeight x` and
`arakelovMulHeight x ≤ (Fintype.card ι : ℝ) ^ (totalWeight K / 2 : ℝ) * mulHeight x`, from
`‖·‖_∞ ≤ ‖·‖_2 ≤ √n ‖·‖_∞` place by place, with `Height.totalWeight_eq_finrank` supplying the
exponent. This is the lemma that transports every constant in the Siegel-lemma literature into
Mathlib's normalization, and Layer 5 states its bounds in terms of it. Prove also that the two agree
when `ι` is a subsingleton, so `arakelovMulHeight₁ = mulHeight₁`.

**0.3 Extension invariance.** For `K ⊆ L` a finite extension of number fields:
`mulHeight₁_pow_finrank`, `mulHeight₁ x ^ finrank K L = mulHeight₁ (algebraMap K L x)`; the tuple
form `mulHeight_pow_finrank`; and the logarithmic forms `finrank_nsmul_logHeight₁` and
`finrank_nsmul_logHeight`. The route is that each place of `K` is the restriction of the places of
`L` above it, with `∑_{w | v} [L_w : K_v] = [L : K]`;
`NumberField.InfinitePlace.liesOver_iff_comap_eq` is the bridging lemma. These are the statements of
mathlib4#41606 and carry its names.

**0.4 The absolute height of a tuple.** `NumberField.absMulHeight (x : ι → K)` for `[CharZero K]`,
defined as `mulHeight` computed over `IntermediateField.adjoin ℚ (Set.range x)` and normalized by
the inverse of its degree — the tuple analogue of Mathlib's `absMulHeight₁` and its exact
generalization (`absMulHeight` of `![x, 1]` is `absMulHeight₁ x`). Prove `absMulHeight₁_eq`, that
over *any* number field `K` containing the coordinates
`absMulHeight x = mulHeight x ^ (finrank ℚ K : ℝ)⁻¹` — which, with 0.3, is exactly the classical
statement that the absolute height is independent of the field of definition. Descend it to
`Projectivization` and prove the scaling invariance that makes it projectively defined.

### Layer 1: Northcott, Kronecker, and the Mahler-measure bridge

**1.1 Northcott on projective space.** The `Northcott` instances for `Projectivization.mulHeight`
and `Projectivization.logHeight` over a number field, which
`Mathlib/NumberTheory/Height/Northcott.lean` records as its own TODO, together with the instance for
`Height.mulHeight` on `ι → K`. Route: a projective point has a representative with coordinates in
`𝓞 K` generating an ideal of norm bounded by the height, and
`NumberField.absNorm_mul_finprod_finitePlace_eq_one` converts that into the finite part.

**1.2 Height and Mahler measure** (Bombieri–Gubler, Proposition 1.6.6 and Lemma 1.6.7). For `x`
algebraic over `ℚ` with minimal polynomial `f = minpoly ℤ x` of degree `D`,
`absMulHeight₁ x ^ D = f.mahlerMeasure`, i.e. `H(x) = M(f)^{1/D}`. Route: Jensen's formula
(`Polynomial.logMahlerMeasure_eq_log_leadingCoeff_add_sum_log_roots`) computes `M(f)` as the leading
coefficient times `∏ max(1, |root|)`, and the archimedean part of the height over the splitting
field is the same product, while the finite part is the leading coefficient by Gauss's lemma. This
identity is the workhorse of the rest of the layer.

**1.3 Northcott's theorem** (Bombieri–Gubler, Theorem 1.6.8; Hindry–Silverman, Theorem B.2.3, which
states it projectively and with varying degree, in exactly the form wanted here). For `B : ℝ` and
`D : ℕ`, the set `{x : ℚ̄ | absMulHeight₁ x ≤ B ∧ finrank ℚ ℚ⟮x⟯ ≤ D}` is finite — the statement
with *varying* degree, which is what "Northcott's theorem" names in the literature and which
Mathlib's fixed-field `finite_setOfPred_mulHeight₁_le` does not give. Route: 1.2 bounds the Mahler
measure of the minimal polynomial, hence (through Mathlib's `Polynomial.finite_mahlerMeasure_le`)
leaves finitely many minimal polynomials, each with finitely many roots. State the projective
version for `Projectivization ℚ̄ (ι → ℚ̄)` alongside it.

**1.4 Kronecker's theorem** (Bombieri–Gubler, Theorem 1.5.9; Hindry–Silverman, Corollary B.2.3.1).
For `x` algebraic over `ℚ`, `absMulHeight₁ x = 1 ↔ x = 0 ∨ ∃ n, 0 < n ∧ x ^ n = 1`, and the strict
form `absLogHeight₁ x = 0 ↔ …`. Route: through 1.2 and Mathlib's
`Polynomial.isPrimitiveRoot_of_mahlerMeasure_eq_one`; the direct route through 1.3 applied to the
orbit `{x ^ n}` — which has bounded height by `mulHeight₁_pow` and bounded degree — is an
alternative proof and a good acceptance test that the two agree. State the **projective** form
alongside it, as Hindry–Silverman B.2.3.1 does: for `P ∈ ℙⁿ(ℚ̄)`, `mulHeight P = 1` if and only if
every defined ratio `x j / x i` is zero or a root of unity. Record also the corollary that a nonzero
algebraic **integer** all of whose conjugates lie in the closed unit disc is a root of unity.

**1.5 Lower bounds away from one.** `1 < absMulHeight₁ x` for `x` algebraic, nonzero, not a root of
unity, and the effective consequence that for each `D` there is `c > 0` with `absLogHeight₁ x ≥ c`
for every such `x` of degree at most `D` — an immediate corollary of 1.3 and 1.4, and the shape in
which Diophantine arguments consume this layer.

### Layer 2: heights of polynomials, linear forms, and matrices

**2.1 The height of a polynomial.** `Polynomial.mulHeight p := Finsupp.mulHeight p.toFinsupp.coeff`
and `MvPolynomial.mulHeight p := Finsupp.mulHeight p.coeff` — both are literally `Finsupp` s over
`K`, so Mathlib's `Finsupp.mulHeight` is the definition and nothing new is constructed. Prove the
basic API: invariance under scaling by `Kˣ`, `mulHeight C a = mulHeight₁ a`, the value on monomials,
behaviour under `Polynomial.map` along a field embedding, and the relation to the tuple height of
the coefficient vector on `Fin (natDegree p + 1)`.

**2.2 Gauss's lemma for heights** (Bombieri–Gubler, Lemma 1.6.3; Hindry–Silverman §B.7). At every
nonarchimedean place `v`, the local factor is multiplicative:
`⨆ (v ∘ coeff (p * q)) = (⨆ v ∘ coeff p) * (⨆ v ∘ coeff q)`. This is the content of Gauss's lemma
and the only place the ultrametric inequality is used sharply; Mathlib's
`IsNonarchimedean.apply_sum_le` is the input.

**2.3 Gelfond's inequality** (Bombieri–Gubler, Lemma 1.6.11; Hindry–Silverman, Proposition B.7.3,
where it is spelled *Gelfand's* inequality — the attribution is to A. O. Gelfond and both spellings
are in print, so the docstring carries both; the elementary converse is their Proposition B.7.2).
The archimedean loss is at most a power of two:
`mulHeight (p * q) ≤ 2 ^ (natDegree p + natDegree q) * mulHeight p * mulHeight q` and the reverse
`mulHeight p * mulHeight q ≤ 2 ^ (natDegree p + natDegree q) * mulHeight (p * q)`. Prove the
multivariate form for `MvPolynomial` with the total degree in the exponent. Record the sharp
multiplicative statement `M(pq) = M(p) M(q)` as a consequence of Mathlib's `mahlerMeasure_mul`, and
the comparison between `mulHeight p` and `mahlerMeasure p` in both directions, which is what makes
the exponent `2^deg` unavoidable and the Mahler measure the sharper tool.

**2.4 Linear forms and the Segre relation.** Record the exact additivity `h(x ⊗ y) = h(x) + h(y)`
under the Segre embedding (Bombieri–Gubler 1.5.14) and the sum bound
`h(P₁ + ⋯ + P_r) ≤ ∑ h(P_i) + log r` (Proposition 1.5.15), which sharpen and complete Mathlib's
`mulHeight₁_sum_le`. A linear form is a degree-one polynomial and its height is 2.1 applied to it;
no separate definition. What this milestone owns is the estimates: the height of the value
`∑ i, a i * x i` against the heights of `a` and `x`, sharpening `Height.mulHeight₁_sum_le` by the
Cauchy–Schwarz bound available in the Arakelov normalization of Layer 0.

**2.5 The height of a matrix** (Bombieri–Gubler's `H(A)`, 2.9.8).
`Matrix.mulHeight A := Height.mulHeight fun p : ι' × ι ↦ A p.1 p.2`, with `logHeight` alongside.
Prove: invariance under `Matrix.transpose` and under row and column permutations; scaling by `Kˣ`;
the submatrix bound `mulHeight (A.submatrix f g) ≤ mulHeight A`; the product bound
`mulHeight (A * B) ≤ (Fintype.card ι : ℝ) * mulHeight A * mulHeight B` at archimedean places with
the corresponding sharp nonarchimedean form; and the bound on the height of `A.det` in terms of
`mulHeight A` and the size, from the Leibniz expansion. Consume
`Height.mulHeight_linearMap_apply_le` for the action on tuples rather than reproving it.

### Layer 3: Plücker coordinates and the height of a subspace

The layer this roadmap exists for. Throughout, `V : Submodule K (ι → K)` with `[Finite ι]` and
`Module.finrank K V = k`.

**3.1 The Plücker point** (Hindry–Silverman, Exercise A.1.11(a)–(b); Bombieri–Gubler 2.8.4). For a
basis `b : Fin k → V`, the wedge `⋀ i, (b i : ι → K) ∈ ⋀[K]^k (ι → K)` is nonzero, and its
coordinate vector in
`(Pi.basisFun K ι).exteriorPower k : Basis (Set.powersetCard ι k) K (⋀[K]^k (ι → K))` is a nonzero
element of `Set.powersetCard ι k → K`. A change of basis multiplies the wedge by the determinant of
the change-of-basis matrix, a unit, so the induced point
`Submodule.pluckerPoint V : Projectivization K (Set.powersetCard ι k → K)` is independent of the
basis. Build it exactly as Mathlib builds `Projectivization.mulHeight`: a private well-definedness
lemma feeding `Projectivization.lift`, with the body unexposed. Prove injectivity — distinct
subspaces of the same rank have distinct Plücker points — which is what entitles this to be called
an embedding.

**3.2 The height of a subspace.**
`Submodule.mulHeight V := Projectivization.mulHeight V.pluckerPoint`, with `logHeight`,
`arakelovMulHeight` and (over `ℚ̄`) `absMulHeight` alongside, each defined from the corresponding
height of the Plücker point. Basic API: `1 ≤ mulHeight V`; `mulHeight ⊥ = 1` and `mulHeight ⊤ = 1`,
the two rank-zero and rank- `n` degenerate cases where the exterior power is a line; and the
compatibility that makes the definition the right one,
`Submodule.mulHeight (span K {x}) = Height.mulHeight x` for `x ≠ 0`, so the height of a line **is**
the projective height of the point it defines.

**3.3 The matrix dictionary** (Bombieri–Gubler, Remark 2.8.7). For `A : Matrix (Fin m) ι K` of full
row rank, the Plücker point of the row space is the tuple of maximal minors,
`minorDet A s = (A.submatrix id (Set.powersetCard.orderIsoOfFin s)).det` — the order isomorphism
being the index identification, pinned here once so that no later statement re-chooses it. Hence
`subspaceMulHeight (rowSpace A)` is the height of the vector of maximal minors, which is
`H_Ar^row(A)` in the classical literature (Definition 2.8.11) and, per the conventions above, is
*not* `matrixMulHeight A`. Bombieri–Gubler use both and distinguish them exactly this way: their
`H(A)` (2.9.8) is the height of the entries, their `H_Ar(A)` the height of the row space. Prove the
invariance this buys: `mulHeight (rowSpace (U * A)) = mulHeight (rowSpace A)` for `U` invertible
(Bombieri–Vaaler (2.5), where it is the statement that the height is *intrinsic on the Grassmannian*
rather than a property of the matrix), which is the invariance under row operations that the naïve
Siegel bound lacks.

**3.4 The Cauchy–Binet identity** (Schmidt 1967, §2 Lemma 1; Bombieri–Gubler, Proposition 2.8.8;
Bombieri–Vaaler (2.4)(iv)). At an archimedean place the ℓ² local factor of the minor vector is a
determinant: `∑ s, (det A_s)² = det (A Aᵀ)`, the Gram matrix of the rows. This is a named milestone
rather than a step inside a proof, because it is precisely where the `√|det (A Aᵀ)|` of the
Bombieri–Vaaler bound is produced. Prove alongside it the **generalized Hadamard inequality**
(Schmidt 1967, §2 Lemma 2; Bombieri–Vaaler (2.6); Bombieri–Gubler's Fischer inequality, Remark
2.8.9): for a partition of the rows into two blocks, `H_u(A) ≤ H_u(A₁) · H_u(A₂)`. That is what
turns a row-space bound into a bound in terms of individual rows (5.4).

**3.5 Duality** (Schmidt 1967, §1, equations (2) and (4) — the original; Bombieri–Gubler,
Proposition 2.8.10; the underlying linear algebra is Hindry–Silverman, Exercise A.1.11(c), which
identifies `W` as the orthogonal complement of `ker δ'(w)`). Schmidt's mechanism is the sharpest
statement of the route: the involution `τ` on Grassmann coordinates that **reverses the index order
and attaches a sign** satisfies `S^{⊥*} = τ(S*)`, so duality holds for any distance function
invariant under that signed reversal — which both the sup norm and the ℓ² norm are, so the theorem
holds in both normalizations of Layer 0 and needs no separate proof for each.
`Submodule.mulHeight V = Submodule.mulHeight V.dualAnnihilator`, the annihilator transported back to
`ι → K` along the standard basis. Equivalently (Corollary 2.8.12): the height of a subspace equals
the height of any matrix cutting it out, `mulHeight (ker A) = mulHeight (rowSpace A)`. Route: the
complementation isomorphism `⋀^k V ≅ ⋀^n V ⊗ ⋀^{n−k} V*` carries canonical basis vectors to
canonical basis vectors up to sign, so the two coordinate tuples agree up to a signed reindexing,
and `Height.mulHeight_comp_equiv` with `Height.mulHeight_neg` finishes it. State the
orthogonal-complement corollary for the standard bilinear form alongside.

**3.6 Submodularity** (Bombieri–Gubler, Theorem 2.8.13; Schmidt, and independently
Struppeck–Vaaler). `h_Ar(V + W) + h_Ar(V ∩ W) ≤ h_Ar(V) + h_Ar(W)`: the height is submodular on the
subspace lattice. Bombieri–Gubler state it without proof and do not use it; it is nonetheless the
structural theorem about subspace heights and it is what makes the monotonicity 3.7 a corollary
rather than a separate argument.

**3.7 Monotonicity.** If `x₁, …, x_k` is a basis of `V` and `I ⊆ Fin k`, then
`mulHeight (span K {x i | i ∈ I}) ≤ mulHeight V`, monotonically in `I`; in particular
`max i, Height.mulHeight (x i) ≤ mulHeight V` for the basis Layer 5 produces.

**3.8 Northcott for subspaces.** Over a number field,
`{V : Submodule K (ι → K) | finrank K V = k ∧ mulHeight V ≤ B}` is finite, and the `Northcott`
instance behind it, immediate from 3.1's injectivity and Layer 1.1.

### Layer 4: successive minima, Minkowski's second theorem, extraction, and cube slicing

Minkowski's convex-body theorem is Mathlib's and the lattice-point engine is the `EffectiveBounds`
roadmap's; the second theorem is neither's, and Bombieri–Vaaler needs it, together with two lemmas
that convert its real-lattice output into number-field statements: the extraction lemma (4.4) and
the cube-slicing theorem (4.5).

**4.1 Successive minima** (Cassels, Ch. VIII §1). For a `ZLattice L` in a finite-dimensional real
normed space and a symmetric convex body `B` with nonempty interior, define
`successiveMinimum L B i` as the infimum of `t > 0` such that `t • B` contains `i + 1` linearly
independent points of `L`. Prove it is attained — Cassels' Lemma 1 of that section, the existence of
independent lattice vectors realizing the minima, which every later proof consumes — and positive,
monotone in `i`, and homogeneous of degree `−1` in `B`; and that `successiveMinimum L B 0` is the
quantity bounded by Minkowski's first theorem, so Mathlib's
`exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` is the `i = 0` case.

⚠ Cassels indexes the minima by a **distance function** `F`, taking `𝒮 = {x | F x ≤ 1}` and dilating
that, rather than by a convex body and `t • B`. The two are the same thing and Mathlib's `gauge` is
the translation, since the gauge of a symmetric convex body with `0` in its interior is exactly such
an `F`.**The convex-body form above is the pinned one**, because it is what Mathlib's first theorem
and `EffectiveBounds` ' engine are already stated in; prove the `gauge` correspondence once, as its
own lemma, so the book's statements transfer without re-deriving anything.

**4.2 Minkowski's second theorem** (Cassels, Ch. VIII, Theorem II for a general distance function;
Theorem I of the same chapter is the sphere case `d(Λ) ≤ λ₁⋯λₙ ≤ d(E₀) d(Λ)`, worth proving first as
the model — Cassels says as much — since its Hadamard-inequality argument is the skeleton of the
general one). With `n = finrank ℝ E`, `(2ⁿ / n!) · covolume L ≤ (∏ i, λ i) · vol B` and
`(∏ i, λ i) · vol B ≤ 2ⁿ · covolume L`. The first follows from the first theorem applied to a scaled
body; the second is the substantial half, by the compression argument along a basis realizing the
minima. Both are milestones; the second is the one Layer 5 consumes.

**4.3 The number-field lattice.** The specialization Layer 5 uses: for a subspace `V ⊆ Kⁿ` of
dimension `k`, the image of `V ∩ (𝓞 K)ⁿ` under `NumberField.mixedEmbedding` is a `ZLattice` of
rank `d k` in the `d k`-dimensional real carrier `V ⊗ ℝ`, and — with the measure normalized as
Mathlib's `volume_fundamentalDomain_latticeBasis` normalizes it, `ℂ ≅ ℝ²`, so that `𝓞 K` itself
has covolume `2^{−r₂} √|discr K|` — its covolume is

```text
covol (V ∩ (𝓞 K)ⁿ)  =  2^{−r₂ k} · |discr K|^{k/2} · H_Ar(V)^d,
```

with `H_Ar` the absolute Arakelov subspace height of Layers 0 and 3, so the last factor is the
*relative* Arakelov height. The closed form is classical (Fukshansky 2006, attributed there to
Thunder). Prove it over `ℚ` first, where it says a saturated lattice has covolume the euclidean
norm of its primitive Plücker vector — Cauchy–Binet (3.4) plus completing a basis of the
saturation to one of `ℤⁿ`; over `K`, through a pseudo-basis `⊕ 𝔞_l · w_l`, the ideal norms
`∏ N(𝔞_l)` matching the finite part of the Plücker height exactly because the lattice is
saturated. This is the computation that converts a lattice statement into a height statement, and
it is where the `|D_{K/ℚ}|^{(N−M)/(2d)}` of Theorem 5.3 is produced; it is a named milestone so
that constant has a single point of truth, and the worked examples below pin each of its three
factors.

**4.4 The extraction lemma.** The bridge from 4.2's real independence to Layer 5's `K`-bases, and
pure linear algebra. If `u 1, …, u i ∈ Kⁿ` have `ℝ`-linearly independent images under the mixed
embedding, their `K`-span has dimension at least `i / d`: the embedding is `ℚ`-linear, and a
`K`-space of dimension `m` is a `ℚ`-space of dimension `d · m`. State it for an arbitrary tower —
`F ⊆ K` finite of degree `d`, a `K`-vector space, an `F`-linear map into a vector space over a
third field `E ⊇ F`, images independent over `E` — so the statement carries no number theory.
Prove with it the greedy selection it exists for: from `d · k` such vectors, `k` of them that are
`K`-linearly independent, the `j`-th chosen **among the first `d (j − 1) + 1`** — a member of the
family, never a linear combination, because a chosen lattice vector keeps the norm bound it
arrived with and a combination does not. Applied to independent vectors realizing the minima
`λ 1 ≤ ⋯ ≤ λ (d k)` of 4.2, monotonicity gives `λ_{d(j−1)+1} ^ d ≤ ∏_{r=1}^{d} λ_{d(j−1)+r}`, so
the product of the selected vectors' relative heights is bounded by `∏ i, λ i`, the full product
4.2 bounds, with no loss. This is the step Bombieri–Vaaler perform adelically: every known proof
of the second theorem needs, for a lattice and a sublattice, bases in which one is triangular
over the other, which over `(𝓞_K)^N` requires `𝓞_K` to be a principal ideal domain (their §I.3).
The lemma replaces the triangularization, and is what entitles the route below to the basis
statements 5.2 Theorem 2 and 5.3 at their exact constants with no adelic input.

**4.5 Cube slicing** (Vaaler 1979; Bombieri–Gubler, Appendix C.3). For a linear subspace
`V ⊆ ℝⁿ` of dimension `k`, the central slice of the cube satisfies
`vol_k (V ∩ [−1, 1]ⁿ) ≥ 2^k`, with equality on coordinate subspaces, so the bound is sharp. This
is the archimedean volume bound behind the sharp constants of Layer 5 — Bombieri–Vaaler's own
proof quotes it, so it is a cost of the theorem, not of this route — and the hardest single
analytic ingredient in the roadmap; Vaaler's proof runs through a peakedness comparison for
symmetric product measures (Kanter). Record as part of the milestone the reduction that makes the
real statement the only one needed: at a complex place the unit polydisc of `ℂⁿ` contains the
cube of half-side `1/√2` in `ℝ^{2n}`, and slicing that inscribed cube by the real
`2k`-dimensional carrier of a `ℂ`-subspace gives `(2/√2)^{2k} = 2^k` — exactly what the constant
of 5.3 requires, so no polydisc-slicing statement exists on this roadmap.

**Route.** Bombieri–Gubler prove Siegel's lemma through the *adelic* Minkowski second theorem
(Theorem 2.9.13, from Appendix C.2.11), over `∏_v K_v` with normalized Haar measures. **This
roadmap pins the real route instead**: restriction of scalars along `mixedEmbedding` reduces to a
`ZLattice` in `ℝ^{dN}`, where 4.2 applies, 4.3 supplies the discriminant, 4.4 returns to `K`, and
4.5 supplies the archimedean volume. The constants close exactly: with `k = N − M`, the `2^{dk}`
of 4.2, the `2^{−r₂ k}` of 4.3 and the `2^{(r₁+r₂) k}` of 4.5's slice bounds cancel, which is the
acceptance check that the normalizations agree. Each ingredient is classical and cited at its
milestone, but the assemblies in the literature are adelic (Bombieri–Vaaler; Bombieri–Gubler
§2.9) except over `ℚ` (Aliev–Henk §6); the assembly over `ℝ^{dN}`, with 4.4 in place of the
adelic triangularization, is this roadmap's, so the milestones above — not any single reference —
are the specification. The route keeps Layer 4 free of adelic Haar measure and stands on the
`ZLattice` and mixed-embedding substrate Mathlib and `EffectiveBounds` already provide. A
contributor who prefers the adelic route must first build adelic Haar measure on
`NumberField.AdeleRing`, a substantially larger undertaking that nothing in this roadmap is
stated against.

### Layer 5: Siegel's lemma and Bombieri–Vaaler (the summit)

Every statement in this layer is in the **absolute** normalization, matching the literature; the
relative forms follow from Layer 0.4.

**5.1 Classical Siegel, in height form** (Bombieri–Gubler, Lemma 2.9.1; Hindry–Silverman, Lemma
D.4.1 — the statement Mathlib's file is proved against, so its bound is already ours). Restate
Mathlib's `Int.Matrix.exists_ne_zero_int_vec_norm_le` in this roadmap's vocabulary: for a nonzero
`M × N` integer matrix with `M < N`, a nonzero `x ∈ ℤᴺ` with `A x = 0` and
`max |x i| ≤ (N B)^{M/(N−M)}`, `B` a bound on the entries — proved *from* Mathlib's statement rather
than from scratch, with the sup-norm-to-height translation isolated as its own lemma. Record that
the exponent `M/(N−M)` is sharp. Bombieri–Gubler's Corollary 2.9.2 is the immediate number-field
version and belongs here.

**5.2 Bombieri–Vaaler over `ℤ`** (Bombieri–Vaaler 1983, Theorems 1 and 2). Two statements, and the
second is the one Layer 5.3 generalizes. *Theorem 1, one vector:* for an `M × N` integer matrix of
rank `M < N`, a nonzero `x ∈ ℤᴺ` with `A x = 0` and
`max n, |x n| ≤ (D⁻¹ √|det (A Aᵀ)|)^{1/(N−M)}`, where `D` is the gcd of the `M × M` minors of `A`.
*Theorem 2, a basis:* under the same hypotheses there are `N − M` linearly independent integral
solutions `x₁, …, x_{N−M}` with `∏_l max n, |x_l n| ≤ D⁻¹ √|det (A Aᵀ)|`. Note `A Aᵀ`, the `M × M`
Gram matrix of the rows — not `Aᵀ A`, which is `N × N` and singular whenever `M < N`. The invariance
over 5.1 — the bound is unchanged by `A ↦ U A` for `U ∈ GL_M(ℤ)`, since `D⁻¹ √|det (A Aᵀ)|` is an
absolute height on the Grassmannian (Bombieri–Vaaler (2.5)) — is a stated corollary, and is why the
theorem is worth its cost. `√|det (A Aᵀ)|` is the Cauchy–Binet identity of 3.4 and the slice
volume is 4.5, so this is 3.4 plus Layer 4 and nothing else — over `ℤ` the extraction 4.4 is
vacuous, `d = 1` and the minima vectors are already the basis, while 4.5 already carries
Theorem 1's constant. This assembly is written out, adele-free, in Aliev–Henk §6 (Theorems
6.2–6.3, with the `ℚ`-case of 4.3's covolume identity stated there as folklore), which is the
reference to hold the milestone against.

**5.3 Bombieri–Vaaler over a number field — the summit** (Bombieri–Gubler, Theorem 2.9.4;
Bombieri–Vaaler 1983). Let `K` have degree `d` and discriminant `D_{K/ℚ}`, and let `A` be an `M × N`
matrix of rank `M` over `K`. The solution space of `A x = 0` has a basis `x₁, …, x_{N−M}`, contained
in `𝓞_K^N`, with

```text
∏_{l=1}^{N-M} H(x l)  ≤  |D_{K/ℚ}| ^ ((N - M) / (2 d))  ·  H_Ar(A),
```

where `H` is the absolute multiplicative height and `H_Ar(A)` the **Arakelov height of the row
space** of `A` — the subspace height of Layer 3 in the Arakelov normalization of Layer 0, not the
height of the entries. The integrality of the basis carries no extra information (Remark 2.9.5),
since scaling does not change a height; state it anyway, because it is what applications quote.
Route: 3.5 identifies `H_Ar(A)` with the height of the solution space `V`, 4.3 places `V ∩ 𝓞_K^N`
as a `ZLattice` of rank `d (N − M)` in the real carrier of `V`, 4.2 with the slice bounds of 4.5
(the inscribed cube at complex places) bounds the product of all `d (N − M)` successive minima by
`|D_{K/ℚ}|^{(N−M)/2}` times the relative Arakelov height, and 4.4 selects from vectors realizing
the minima a `K`-basis, the `l`-th among the first `d (l − 1) + 1`, whose relative height is at
most `λ_{d(l−1)+1} ^ d` — integral coordinates make every finite local factor at most one, and
membership in the dilated body bounds the archimedean ones — so the product over the basis is
bounded by the product of the minima. Layer 0.4's absolute normalization is applied once, at the
end. The discriminant power in the bound is not removable (Roy–Thunder 1995), and the best
possible constant, a generalized Hermite constant (Vaaler 2003), is recorded in the references
and is not the target.

**5.4 The corollaries applications actually quote.** *Non-maximal rank* (Corollary 2.9.7): for `A`
of rank `R`, a basis `x₁, …, x_{N−R}` of the kernel with
`∏ H(x l) ≤ |D_{K/ℚ}|^{(N−R)/(2d)} · H_Ar^row(A)`, by restricting to `R` independent rows. *Entry
heights* (2.9.8 and Corollary 2.9.9): bounding `H_Ar^row(A) ≤ ∏_m H_Ar(A_m)` by 3.4's Fischer
inequality and `H_Ar(A_m) ≤ √N · H(A)` gives `∏ H(x l) ≤ |D_{K/ℚ}|^{(N−R)/(2d)} (√N H(A))^R`, and in
particular a single nonzero solution with `H(x) ≤ |D_{K/ℚ}|^{1/(2d)} (√N H(A))^{R/(N−R)}`. Over `ℚ`
this replaces the `N` of the classical Siegel lemma by `√N`, which is the concrete improvement to
record as the acceptance test for the whole layer.

**5.5 The relative version** (Bombieri–Gubler, Theorem 2.9.19; the `K = ℚ` case is Hindry–Silverman,
Lemma D.4.2, "Siegel's lemma, second form", which is the shape auxiliary-function constructions
quote and the one to state first). Entries in a finite extension `F/K` of degree `r`, solutions
required in `K`: if `r M < N` there are `N − r M` `K`-linearly independent `x_l ∈ 𝓞_K^N` with
`A x_l = 0` and `∏ H(x l) ≤ |D_{K/ℚ}|^{(N−rM)/(2d)} ∏_{i=1}^{M} H_Ar(A_i)^r`, `A_i` the `i`-th row.
This is the form transcendence arguments use, where the auxiliary construction and the field of
definition differ, and it is the interface downstream work imports.

**5.6 The auxiliary-polynomial form.** The packaging transcendence and Diophantine-approximation
arguments actually import, and the reason 5.5 is stated in the relative form: given `r` variables, a
degree bound `D`, and `N` linear conditions on the coefficients of a polynomial over `K` — typically
that it vanish to prescribed multiplicity at prescribed algebraic points — with the coefficients of
those conditions of height at most `H`, produce a nonzero such polynomial satisfying all of them,
with `absMulHeight` bounded explicitly in `r`, `D`, `N`, `H` and the invariants of `K`. This is 5.4
and 5.5 applied to the coefficient space of `MvPolynomial (Fin r) K` cut out by the conditions, with
Layer 2.1 supplying the height of the resulting polynomial and Layer 2.5 the height of the condition
matrix. State it so that the count of conditions and the dimension of the coefficient space appear
separately, as Hindry–Silverman D.4 does when constructing their auxiliary polynomial: downstream
users vary those two independently and a bound that has already combined them is unusable.

### Layer 6: heights and the unit group

Mathlib proves Dirichlet's unit theorem; this layer builds the height-side dictionary around it and
the S-adic generalization it does not have.

**6.1 The logarithmic embedding as a height** (Bombieri–Gubler 1.5.12). Relate
`NumberField.Units.logEmbedding` to `Height.logHeight₁`: for a unit `u`, `logHeight₁ (u : K)` is the
sum of the positive parts of the components of the logarithmic embedding, and
`logHeight₁ u + logHeight₁ u⁻¹ = ‖logEmbedding u‖₁` in the appropriate normalization. Deduce that
`logEmbedding` has finite fibres of bounded height, so that Mathlib's
`unitLattice_inter_ball_finite` and Layer 1.1 are two views of one fact.

**6.2 Units of height one.** `absMulHeight₁ (u : K) = 1 ↔ u ∈ NumberField.Units.torsion K` for a
unit `u`, from Kronecker (1.4) and `logEmbedding_ker`. This is the height-theoretic identification
of the torsion subgroup, and the statement in which Kronecker's theorem is usually applied.

**6.3 Heights of the fundamental system.** The regulator bounds the heights of a fundamental system:
explicit two-sided estimates relating `NumberField.Units.regulator K` to
`∏ i, absMulHeight₁ (fundSystem K i)`, so that a unit basis of small height and a small regulator
are the same statement. The finiteness input is 1.1 and the lattice input is Mathlib's
`basisUnitLattice`.

**6.4 S-integers and S-units** (Bombieri–Gubler 1.5.10). For
`S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))` finite, define the ring of `S`-integers and its
unit group, and characterize `S`-units by their heights: `u` is an `S`-unit iff `v u = 1` for every
finite place outside `S`, iff the height of `u` is supported on `S ∪ {infinite places}`. Follow the
carrier and naming of mathlib4#40791 and of `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`.

**6.5 The S-unit theorem** (Bombieri–Gubler, Theorem 1.5.13, where it is stated as rank `|S| − 1` in
the book's convention that `S` contains the archimedean places). The group of `S`-units is finitely
generated of rank `r₁ + r₂ − 1 + |S|`, with torsion subgroup the roots of unity of `K`. Route, as in
#40791: the short exact sequence `1 → 𝓞ˣ → 𝓞_Sˣ → ⊕_{v ∈ S} ℤ` whose cokernel embeds in the class
group, with Mathlib's Dirichlet theorem giving the left-hand rank. Prove the `S`-analogue of 6.1,
that the `S`-logarithmic embedding has image a full lattice, and define the `S`-regulator as its
covolume, so that `S = ∅` recovers `NumberField.Units.regulator` definitionally.

## Relationship to Mathlib's height work

`Mathlib/NumberTheory/Height/` is the substrate, not a competitor: Layers 0–3 define every object in
terms of `Height.mulHeight` and its API, so there is nothing at the foundational level for this
roadmap to duplicate. Two open Mathlib pull requests do cover named milestones above.

1. **Extension invariance (Layer 0.3) is mathlib4#41606.** Build it here now with that PR's names
   and signatures — `mulHeight₁_pow_finrank`, `mulHeight_pow_finrank`, `finrank_nsmul_logHeight₁`,
   `finrank_nsmul_logHeight`, `absMulHeight₁_eq` — and cite it in the Tau Ceti file that carries
   them. Whenever the working Mathlib dependency contains them, delete ours and import Mathlib's;
   because the names and shapes match, that is a deletion plus an import rather than a rewrite, and
   Layer 0.4 and everything downstream are unaffected.
2. **The S-unit theorem (Layer 6.5) is mathlib4#40791.** The same applies: follow its short-exact-
   sequence route, its carrier `Set (HeightOneSpectrum (𝓞 K))`, and its rank formula, and delete
   ours when Mathlib's lands. The `S`-regulator and the height characterization in 6.4 are not in
   that PR and stay here.
3. **Everything else is ours.** The Arakelov normalization, the absolute tuple height, Northcott
   with varying degree, Kronecker for the height, polynomial and matrix heights, the Plücker point
   and the subspace height with its duality, successive minima and Minkowski's second theorem with
   the extraction and cube-slicing lemmas beside them, and both forms of Siegel's lemma over a
   number field are absent from Mathlib and from the open PRs.
   Where Mathlib records a TODO covering one of them — `Height/Northcott.lean` asks for the
   projectivization instances of Layer 1.1, `Height/Basic.lean` asks for `AdmissibleAbsValues`
   instances on finite extensions, which Layer 0.3 supplies the arithmetic for — build it here and
   say in the file that Mathlib records the same gap.

Follow Mathlib's shape in all of it: the multiplicative-primary-plus-logarithmic pairing, the
`lift`-from-a-representative construction for anything projectively defined, the `Northcott`
typeclass rather than bare finiteness statements, and `positivity` extensions for every new height.

## Worked examples (acceptance criteria, keeping the definitions honest)

Each of these is a cheap check that a definition means what it should; they belong in the Tau Ceti
files as `example` s.

- `Height.mulHeight₁ (3 / 4 : ℚ) = 4`, from Mathlib's `Rat.mulHeight₁_eq_max`. A definition of the
  rational height that does not give `4` here has the numerator and denominator confused.
- `NumberField.absMulHeight₁ (√2) ^ 2 = 2`, while the relative height of `√2` over `ℚ(√2)` is `2`.
  Together these exercise Layer 0.3 and 0.4: the same number, two fields, one absolute height.
- `arakelovMulHeight ![1, 1] = √2` over `ℚ`, whereas `Height.mulHeight ![1, 1] = 1`. The two
  normalizations genuinely differ, so the `√N` in 5.4 and the `H_Ar` on the right of 5.3 are not
  cosmetic, and a proof that silently interchanges the two heights is wrong.
- `absMulHeight₁ ζ = 1` for `ζ` a primitive fifth root of unity, and `absMulHeight₁ x = 1` for `x`
  transcendental — the second by the junk value, not by Kronecker. A statement of 1.4 without an
  algebraicity hypothesis is refuted by the second example; this is the rejection test for that
  layer.
- `Submodule.mulHeight (span ℚ {![1, 2, 3]}) = 3`, agreeing with the projective height of
  `[1 : 2 : 3]`, and `Submodule.mulHeight (⊤ : Submodule ℚ (Fin 3 → ℚ)) = 1`.
- Duality on a worked case: for `A = ![![1, 1, 1]]` over `ℚ`, the row space and `V = ker A` satisfy
  `H_Ar(rowSpace A) = √3` (Cauchy–Binet: `det (A Aᵀ) = 3`), so 3.5 forces `H_Ar(V) = √3` too. The
  basis `![1, -1, 0], ![0, 1, -1]` of `V` has `∏ H = 1`, inside the Theorem 5.3 bound
  `|D_ℚ|^{2/2} · √3 = √3` since `D_ℚ = 1`. A version of 3.5 that produced anything but `√3` on both
  sides here has the minors indexed wrongly, and one that produced `1` has confused the Arakelov
  height with the sup-norm height.
- The covolume identity (4.3) over `K = ℚ(i)`, `V = span {![1, -1]}` in `K²`: the lattice
  `ℤ[i] · (1, −1)` inside `ℂ · (1, −1)` has covolume `2`, and
  `2^{−r₂} · √|discr K| · H_Ar(V)^d = (1/2) · 2 · (√2)² = 2`. A version of 4.3 without the
  `2^{−r₂ k}` fails this by a factor of `2`, and one with the sup-norm height in place of the
  Arakelov height fails it by `(√2)^d = 2`; both errors are invisible over `ℚ`, which is why this
  check is over `ℚ(i)`.
- `Polynomial.mulHeight ((X - 1) * (X + 1) : ℚ[X]) = 1` while
  `mulHeight (X - 1) * mulHeight (X + 1) = 1`: Gelfond's factor `2^deg` is an upper bound that is
  far from attained, which is the point of recording the sharp Mahler-measure statement in 2.3.

## Ordering

Layer 0 first: nothing downstream can state a constant without 0.2, and 0.3 is the milestone whose
Mathlib counterpart is already in flight. Layer 1 next, and it is the natural first substantial
contribution — 1.1 discharges a Mathlib TODO, and 1.2 through 1.5 need nothing but Layer 0 and
Mathlib's Mahler measure. Layers 2 and 3 are independent of each other and both depend only on
Layers 0–1; Layer 3 is the more valuable and the more delicate, and 3.1 should be settled before
anything else in it is attempted, because every later statement is about the object it constructs.
Layer 4 touches Layers 1–3 only through 4.3, whose statement uses the subspace height of 3.2 and
whose `ℚ`-case is Cauchy–Binet (3.4); 4.1 and 4.2 are real-analytic geometry of numbers, 4.4 is
self-contained linear algebra, and 4.5 is self-contained real analysis — the hardest single item
in the roadmap, claimable on its own — so most of the layer can be built in parallel from the
start by someone who prefers those subjects. Layer 5 needs 3 and 4 together; 5.1 needs neither
and can land early as the acceptance test for the vocabulary, and 5.2 needs only 3.4, 4.2, 4.5
and the `ℚ`-case of 4.3. Layer 6 needs only Layers 0 and 1 and is likewise independent of 2–5.

Register an intention before a substantial push; the layers above are deliberately claimable
separately.

## Long horizon (a roadmap for a roadmap, not work to attempt here)

The theory built here is the entry point to Diophantine approximation on subspaces: the Schmidt
subspace theorem, Roth's theorem, unit equations and their finiteness, and the Faltings–Wüstholz
machinery. Each needs the subspace height of Layer 3 and the auxiliary-polynomial construction of
Layer 5.6 as *inputs*, and each is a roadmap in its own right, several times the size of this one.
**Do not attempt them under this roadmap**; they are recorded here to say what this material is for
and where the next roadmap should start, not as work in scope.

## References

- E. Bombieri and W. Gubler, *Heights in Diophantine Geometry*, Cambridge New Mathematical
  Monographs 4, 2006. **The reference for the whole roadmap**, and the source of every numbered
  citation above. §1.2 absolute values and the product formula; §1.5 the height, Kronecker's theorem
  (Thm 1.5.9), `S`-units and Dirichlet's `S`-unit theorem (1.5.10–1.5.13), the Segre relation
  (1.5.14) and the sum bound (Prop 1.5.15); §1.6 Mahler measure, Gauss's lemma (Lemma 1.6.3),
  Northcott's theorem (Thm 1.6.8) and Gelfond's lemma (Lemma 1.6.11); §2.8 the Arakelov height
  (2.8.1–2.8.3), heights on Grassmannians (2.8.5–2.8.7), Cauchy–Binet (Prop 2.8.8), Fischer's
  inequality (Rem 2.8.9), duality (Prop 2.8.10, Cor 2.8.12) and submodularity (Thm 2.8.13); §2.9
  Siegel's lemma (Lemma 2.9.1, Cor 2.9.2), Bombieri–Vaaler (Thm 2.9.4) with its corollaries
  (2.9.7–2.9.9), the adelic Minkowski second theorem (Thm 2.9.13) and the relative version (Thm
  2.9.19); Appendix C for the geometry of numbers behind Layer 4 — C.2 is Minkowski's second
  theorem and C.3 is the cube slicing of 4.5.
- E. Bombieri and J. Vaaler, "On Siegel's lemma", *Inventiones Mathematicae* **73** (1983), 11–32.
  The original of Layers 5.2 and 5.3: Theorem 1 is the one-vector bound over `ℤ` and Theorem 2 the
  basis bound, both with `D⁻¹√|det (A Aᵀ)|`; Theorem 3 is the adelic Minkowski second theorem the
  paper exists to prove. §II.1 fixes the absolute normalization `|p|_v = p^{−d_v/d}` this roadmap
  follows, defines the local heights `H_v(X)` of a matrix by the sup norm at finite places and
  `|det X Xᵀ|^{1/2}` at archimedean ones, and records that `H(X)` is intrinsic on the Grassmannian
  ((2.5)) and submultiplicative over row blocks ((2.6)). §I.3 is the discussion of why the proof
  goes through the adèles, cited in Layer 4.
- J. D. Vaaler, "A geometric inequality with applications to linear forms", *Pacific Journal of
  Mathematics* **83** (1979), 543–553. The cube-slicing theorem of 4.5, quoted by Bombieri–Vaaler
  for the archimedean local volumes; the peakedness comparison its proof runs through is
  M. Kanter, "Unimodality and dominance for symmetric random vectors", *Trans. Amer. Math. Soc.*
  **229** (1977), 65–85.
- J. D. Vaaler, "The best constant in Siegel's lemma", *Monatshefte für Mathematik* **140**
  (2003), 71–89. The optimal form of 5.3's constant, a generalized Hermite constant in the sense
  of Thunder; recorded so that nobody mistakes it for the target — this roadmap asks for the
  discriminant bound of Theorem 2.9.4.
- I. Aliev and M. Henk, "Minkowski's successive minima in convex and discrete geometry",
  *Communications in Mathematics* **31** (2023), no. 2, 35–59. §6 (Theorems 6.2–6.3) is the
  adele-free assembly of 5.2 over `ℚ` — the covolume identity, cube slicing, and Minkowski's
  second theorem — and the reference that milestone is held against.
- L. Fukshansky, "Siegel's lemma with additional conditions", *Journal of Number Theory* **120**
  (2006), 13–25. Records the closed form of 4.3's covolume identity, attributing it to Thunder;
  its main argument is adelic and is not this roadmap's route.
- D. Roy and J. L. Thunder, "A note on Siegel's lemma over number fields", *Monatshefte für
  Mathematik* **120** (1995), 307–318. Some power of the discriminant must appear in 5.3's bound,
  so the constant's shape is intrinsic and not an artifact of any route.
- W. M. Schmidt, "On heights of algebraic subspaces and diophantine problems", *Annals of
  Mathematics* **85** (1967), 430–472. The origin of Layer 3: §1 defines the height of a subspace by
  its Grassmann coordinates and proves the map from `d`-dimensional subspaces to lines in `K^N` is
  injective (3.1); equations (2) and (4) are the duality theorem (3.5); §2 Lemma 1 is Cauchy–Binet
  and Lemma 2 the generalized Hadamard inequality (3.4). Schmidt's default height is the Euclidean
  one, as Bombieri–Vaaler's and Bombieri–Gubler's are.
- W. M. Schmidt, *Diophantine Approximation*, LNM 785, Ch. I, Lemma 8A. Submodularity (3.6); it is
  **not** in the 1967 paper.
- T. Struppeck and J. D. Vaaler, "Inequalities for heights of algebraic subspaces and the
  Thue–Siegel principle", in *Analytic Number Theory* (Allerton Park, 1989), Birkhäuser, 1990. The
  independent proof of the submodularity of 3.6.
- M. Hindry and J. H. Silverman, *Diophantine Geometry: An Introduction*, GTM 201, 2000. The
  reference Mathlib's `NumberTheory/SiegelsLemma.lean` cites, so Layer 5's vocabulary follows it:
  Lemma D.4.1 is Mathlib's statement and Lemma D.4.2 its number-field second form. Also Theorem
  B.2.3 (Northcott, projective and with varying degree) and Corollary B.2.3.1 (Kronecker, projective
  form) for Layer 1; §B.7 "Heights and Polynomials", Propositions B.7.2 and B.7.3, for Layer 2; and
  Exercise A.1.11 for the Plücker embedding, its well-definedness and injectivity, and the duality
  of Layer 3.5. Proposition B.4.2 and Remarks B.4.3, on canonical heights and preperiodic points,
  are the `EllipticCurves` roadmap's material, not this one's.
- J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Springer, 1959. Ch. VIII §1 for
  the definition of the successive minima and the lemma that they are attained, Theorem I for the
  sphere case and Theorem II for a general distance function — the two halves of Layer 4.2, in the
  real formulation this roadmap pins.
- M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Grundlehren 326, 2000. Ch.
  3 for heights and Ch. 4 for the auxiliary-polynomial use of Siegel's lemma that Layer 5.6
  packages.
- D. Roy and J. L. Thunder, "An absolute Siegel's lemma", *J. reine angew. Math.* **476** (1996),
  1–26. The normalization that removes the discriminant from the Theorem 5.3 bound at the cost of an
  `ε`; recorded because Bombieri–Gubler (2.9.20) points at it as the sharpening of Thm 2.9.4, and
  because it is what a contributor will find if they look for "the absolute version".
- S. Lang, *Fundamentals of Diophantine Geometry*, Springer, 1983. Ch. 3 for the classical treatment
  of heights over number fields.
- J. Neukirch, *Algebraic Number Theory*, Grundlehren 322, 1999. Ch. I §5–6 and Ch. III for places,
  the product formula, and Minkowski theory.
